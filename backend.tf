terraform {
  backend "remote" {
    # The name of your Terraform Cloud organization.
    organization = "oredata-test"
    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "compute-engine-test"
    }
  }
}