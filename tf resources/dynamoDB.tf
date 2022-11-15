resource "aws_dynamodb_table" "CRCDBtable" {
    name = "CRCDBtable"
    hash_key = "Website"
    billing_mode = "PAY_PER_REQUEST"
    
    attribute {
      name = "Website"
      type = "S"
    }

}

resource "aws_dynamodb_table_item" "VisitorCount" {
    table_name = aws_dynamodb_table.CRCDBtable.name
    hash_key = aws_dynamodb_table.CRCDBtable.hash_key
    item = <<ITEM
        {
        "Website": {"S": "jcosioresume.com"},
        "VisitorCount": {"N": "1"}
        }
        ITEM
}