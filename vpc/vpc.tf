resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Team        = "DevOps"
    Environment = "Dev"
  }
}
data "aws_availability_zones" "all" {}

#Public_1 Subnet

resource "aws_subnet" "public1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    Team        = "DevOps"
    Environment = "Dev"
  }
}

# Public 2 Subnet
resource "aws_subnet" "public2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-west-1b"

  tags = {
    Team        = "DevOps"
    Environment = "Dev"
  }
}

#Public_3 Subnet

resource "aws_subnet" "public3" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "eu-west-1c"

  tags = {
    Team        = "DevOps"
    Environment = "Dev"
  }
}

#------PUBLIC IP ROUTING TO IGW-----------

	 #Internet Gateway  (copy/paste under public_subnets.tf) 

	resource "aws_internet_gateway" "gw" {
     vpc_id = aws_vpc.main.id
	tags = {
    Team        = "DevOps"
    Environment = "Dev"
  }
    }
    
	 #Route table (copy/paste under public_subnets.tf)
	 
	resource "aws_route_table" "public" {
	  vpc_id = aws_vpc.main.id
	  route {
	    cidr_block = "0.0.0.0/0"
	    gateway_id = aws_internet_gateway.gw.id
	  }
	 tags = {
    Team        = "DevOps"
    Environment = "Dev"
  }
    }

	 # Route table association 
	# Route table needs to be associated with subnets in order Public subnets link to IGW
	
	resource "aws_route_table_association" "public1" {
	subnet_id      = aws_subnet.public1.id
	route_table_id = aws_route_table.public.id
    
    tags = { 
Team        = "DevOps"
    Environment = "Dev"
  
    }
    }

    

	resource "aws_route_table_association" "public2" {
	subnet_id      = aws_subnet.public2.id
	route_table_id = aws_route_table.public.id
    tags = 
    Team        = "DevOps"
    Environment = "Dev"
  }
	}
	
	resource "aws_route_table_association" "public3" {
	subnet_id      = aws_subnet.public3.id
	route_table_id = aws_route_table.public.id
    tags = 
    Team        = "DevOps"
    Environment = "Dev"
  }
}

#--------------------------------------------------------------

	
    #private_1 Subnet
    
    resource "aws_subnet" "private1" {
      vpc_id     = aws_vpc.main.id
    cidr_block        = "10.0.101.0/24"

      availability_zone = "eu-west-1a"  # assign availability zone (us-east-1a)
tags = {
    Team        = "DevOps"
    Environment = "Dev"
  }    
    }
    
    
    # private 2 Subnet
    resource "aws_subnet" "private2" {
      vpc_id     = aws_vpc.main.id
    cidr_block        = "10.0.102.0/24"
      availability_zone = "eu-west-1b"  # assign availability zone (us-east-1b)
tags = {
    Team        = "DevOps"
    Environment = "Dev"
  }    
    }
    
    #private_3 Subnet
    
    resource "aws_subnet" "private3" {
      vpc_id     = aws_vpc.main.id
    cidr_block        = "10.0.103.0/24"
      availability_zone = "eu-west-1c"  # assign availability zone (us-east-1c)
    
tags = {
    Team        = "DevOps"
    Environment = "Dev"
  }    
    }



		#STEPS FOR PRIVATE IP		

	# Under Private IP create EIP and NAT Gateway   (copy/paste under private_subnets.tf)
	
	# We supposed to have Elastic IP (EIP) and then attach EIP to NAT gateway and only then attach NAT to public subnets - so then our 3 private Ips will be able to download packages from internet.
	
	resource "aws_eip" "main" {
	// instance = aws_instance.web.id   #no need to attach to the instance , in this example we attach it to vpc
	vpc      = true
	}
	
	# NAT Gateway   
	
	resource "aws_nat_gateway" "example" {
	  allocation_id = aws_eip.main.id
	  subnet_id     = aws_subnet.public1.id    # NAT gets public1 IP 
	  tags = {
    Team        = "DevOps"
    Environment = "Dev"
  } 
    }
	
	
	# route table 
	
	resource "aws_route_table" "private" {
     vpc_id = aws_vpc.main.id

     route {
     cidr_block = "0.0.0.0/0"
     gateway_id = aws_nat_gateway.example.id  #If someone wants to go to the internet we send           them to NAT gateway
      

     tags = {
    Team        = "DevOps"
    Environment = "Dev"
  } 
    }
    }

	# route table association for private IPs
	
    resource "aws_route_table_association" "private1" {
    subnet_id      = aws_subnet.private1.id
    route_table_id = aws_route_table.private.id
      tags = {
    Team        = "DevOps"
    Environment = "Dev"
  } 
    }
    
    resource "aws_route_table_association" "private2" {
    subnet_id      = aws_subnet.private2.id
    route_table_id = aws_route_table.private.id
      tags = {
    Team        = "DevOps"
    Environment = "Dev"
  } 
    
    }
    
    resource "aws_route_table_association" "private3" {
    subnet_id      = aws_subnet.private3.id
    route_table_id = aws_route_table.private.id
      tags = {
    Team        = "DevOps"
    Environment = "Dev"
  } 
    }
    
    
