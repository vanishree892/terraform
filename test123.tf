provider "aws" {
	region = "us-east-1"
	access_key = "AKIARGEEKK37P4D2JSN3"
	secret_key = "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"
}


resource "aws_instance" "myinstance" {
			ami =  "ami-062f7200baf2fa504"
			instance_type = "t2.micro"
}
