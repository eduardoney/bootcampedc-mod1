provider "aws" {
  region = "us-east-1"
}

#Centalizar o arquivo de controle de estado do terraform.
#não aceita parametro nesse ponto
terraform  {
    backend "s3" {
      bucket = "terraform-state-eduney-707008544288"
      key = "/state/mod1/terraform.tfstate"
    }
    
}