variable "name" {
  default = "s3-event-queue"
}
# bucket resource test variables
variable "bucket_name" {
  default = "s3-bucket"
}
variable "acl" {
  default = "private"
}
variable "tag_name" {
  default = "terraform-IaC"
}
variable "env_name" {
  default = "test"
}
