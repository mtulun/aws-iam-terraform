resource "aws_iam_access_key" "access_key" {
    user =   var.access_key_user

    provisioner "local-exec" { # Create a "myKey.txt" to your computer!!
    command = "echo Access Key Id:'${aws_iam_access_key.access_key.id}' - Secret Access Key:'${aws_iam_access_key.access_key.secret}' > ./myKey.txt"
  }
}