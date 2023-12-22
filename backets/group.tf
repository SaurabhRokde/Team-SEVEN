resource "aws_iam_group" "chandrapur-one" {
  name = "chandrapur"
}

resource "aws_iam_group" "nagpur-two" {
  name = "nagpur"
}

resource "aws_iam_group" "gadchiroli-three" {
  name = "gadchiroli"
}

resource "aws_iam_user" "anta-one" {
  name = "anta"
}

resource "aws_iam_user" "santa-two" {
  name = "santa"
}

resource "aws_iam_user" "banta-three" {
  name = "banta"
}

resource "aws_iam_user_group_membership" "anta_membership" {
  user    = aws_iam_user.anta-one.name
  groups  = [aws_iam_group.chandrapur-one.name]
}

resource "aws_iam_user_group_membership" "santa_membership" {
  user    = aws_iam_user.santa-two.name
  groups  = [aws_iam_group.nagpur-two.name]
}

resource "aws_iam_user_group_membership" "banta_membership" {
  user    = aws_iam_user.banta-three.name
  groups  = [aws_iam_group.gadchiroli-three.name]
}

