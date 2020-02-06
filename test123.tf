provider "aws" {
	region = "us-east1"
	access_key = "AKIARGEEKK37P4D2JSN3"
	secret_key = "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"
}


resource aws_instance "myinstance" {
			ami =  "ami-02ccb28830b645a41"
			instance_type = "t2.small"
}
