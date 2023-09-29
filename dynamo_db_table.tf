###########################################
############### RESOURCES #################
###########################################

resource "aws_dynamodb_table" "main-tekken-character-database" {
  name           = "Character"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "Archetype"
  range_key      = "PlayerID"

  attribute {
    name = "Archetype"
    type = "S"
  }

  attribute {
    name = "PlayerID"
    type = "S"
  }

  tags = {
    Name        = "CharacterDB"
    Environment = var.deployment_stage
  }
}