variable "credentials" {
  description = "Credentials"
  default     = "/workspaces/dbt-taxi-project/google_credentials.json"
  #ex: if you have a directory where this file is called keys with your service account json file
  #saved there as my-creds.json you could use default = "./keys/my-creds.json"
}


variable "project" {
  description = "Project ID"
  default     = "genial-charter-455214-g3" 
}

variable "region" {
  description = "Region"
  #Update the below to your desired region
  default = "us-west-1"
}

variable "location" {
  description = "Project Location"
  #Update the below to your desired location
  default = "US"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  #Update the below to what you want your dataset to be called
  default = "dbt_dataset"
}
