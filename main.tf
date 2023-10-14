terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "terraform-dbhadoria"

  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}
  cloud {
   organization = "terraform-dbhadoria"
   workspaces {
     name = "terra-house-1"
   }
  }
}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

module "home_contra_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.contra.public_path
  content_version = var.contra.content_version
}

resource "terratowns_home" "home" {
  name = "Contra (video game)"
  description = <<DESCRIPTION
Contra, known as Probotector and occasionally Gryzor in Europe and Oceania, 
is a 1987 run and gun action game developed and published by Konami originally released as a coin-operated arcade game on February 20, 1987.
DESCRIPTION
  domain_name = module.home_contra_hosting.domain_name
  # domain_name = "3fdq3gz.cloudfront.net"
  town = "gamers-grotto"
  content_version = var.contra.content_version
}

module "home_jobsportal_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.jobsportal.public_path
  content_version = var.jobsportal.content_version
}

resource "terratowns_home" "home_jobsportal" {
  name = "Jobs Portal - For Every Person"
  description = <<DESCRIPTION
An employment website is a website that deals specifically with employment or careers. 
Many employment websites are designed to allow employers to post job requirements for a position to be filled and are commonly known as job boards. 
Other employment sites offer employer reviews, career and job-search advice, and describe different job descriptions or employers. 
Through a job website, a prospective employee can locate and fill out a job application or submit resumes over the Internet for the advertised position.
DESCRIPTION
  domain_name = module.home_jobsportal_hosting.domain_name
  town = "missingo"
  content_version = var.jobsportal.content_version
}
