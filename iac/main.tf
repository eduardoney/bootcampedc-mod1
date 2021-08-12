resource "aws_s3_bucket" "datalake" {
  #bucket = "my-tf-test-bucket"
  bucket = "${var.base_bucket_name}-${var.numero_conta}"
  acl    = "private"

  tags = {
    projeto = "bootcamp-edc"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_object" "codigo_spark" {
  bucket = aws_s3_bucket.datalake.id #Busca o recurso pelo id do primeiro objeto criado.
  key    = "emr-code/pyspark/exemplo_spark.py"
  acl    = "private"
  source = "./exemplo_spark.py"
  etag   = filemd5("../exemplo_spark.py") #Faz a validação para n~ão subir se não tiver alteração.
}
