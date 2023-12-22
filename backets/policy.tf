##########  chandrapur group can list and write villadada bucket delete permission can be disabled ###########                                      


resource "aws_iam_group_policy" "my_developer_policy" {
    name  = "chandrapur-policy"
    group = aws_iam_group.chandrapur-one.name
  
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action = [
            "s3:ListAllMyBucket*",
             "s3:ReadAllMyBucket*",
          ]
          Effect   = "Allow"
          Resource =   "arn:aws:s3:::arun3"
        },
    ]
    })
  }
  
  
  ############  garchiroli group will have s3 full access with ec2 list on spirts bucket ################


  resource "aws_iam_group_policy" "my_developer_policy2" {
    name  = "garchiroli-policy"
    group = aws_iam_group.gadchiroli-three.name
  
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action = [
            "s3:S3FullAccess*",
            "ec2:List"
          ]
          Effect   = "Allow"
          Resource =   "arn:aws:s3:::arunsurya"
        },
    ]
    })
  }


  #############  nagpur group can create ec2 and s3 but can not delete it on taleschacha  ###############
 

  resource "aws_iam_group_policy" "my_coder_policy" {
    name  = "nagpur-policy"
    group = aws_iam_group.nagpur-two.name
  
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action = [
            "s3:CreateBucket",
            "ec2:CreateInstanceEventWindow"
          ]
          Effect   = "Allow"
          Resource =   "arn:aws:s3:::prodlala"
        },
    ] 
    })
  }
