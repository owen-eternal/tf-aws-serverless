import json
import decimal

class DecimalEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, decimal.Decimal):
            return str(o)
        if isinstance(o, set):
            return list(o)
        return super(DecimalEncoder, self).default(o)

class Character:
    def __init__(self, table_name, resource):
        self.table_name = table_name
        self.table = resource.Table(self.table_name)

    def retrieve_item(self, composite_key):
        try:
            response = self.table.get_item(Key=composite_key)
        except Exception as err:
            return err.response
        else:
            return response

    def retrieve_items(self, Key_condition_expression):
        try:
            response = self.table.query(KeyConditionExpression=Key_condition_expression)
        except Exception as err:
            return err.response
        else:
            return response
