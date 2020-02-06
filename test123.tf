provider "aws" {
	region = "us-east-1"
	access_key = "AKIARGEEKK37P4D2JSN3"
	secret_key = "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"
}


resource "aws_instance" "sec" {
			ami =  "ami-09d069a04349dc3cb"
			instance_type = "t2.small"
}
