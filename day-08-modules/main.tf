#Through the module we can called or perform any files using path..!!!

#But don't use hardcoded value and ignore tf.vars value in the module process..!!

#It can be re-use..!!

module "test" {
    source = "../day-02-basic_ec2"
    ami = "ami-0614680123427b75e"
    instance_type ="t2.micro"
    key_name = "projectK"
  
}