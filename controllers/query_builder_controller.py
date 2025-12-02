from core.database import Database

class QueryBuilderController:
    def __init__(self):
        self.db = Database().connect()
        self.cursor = self.db.cursor(dictionary=True)

    allowed_tables = {
        "Customer": ["customer_id", "first_name", "last_name", "email", "phone", "city"],
        "Account": ["account_id", "customer_id", "account_type", "opening_date", "balance", "status"],
        "Transactions": ["transaction_id", "account_id", "amount", "transaction_type", "transaction_date",  "status", "flagged", "flag_reason"],
        "FraudAlert": ["alert_id", "transaction_id", "alert_date", "risk_level", "alert_notes", "investigator_id"],
        "Investigator": ["investigator_id", "name", "email", "phone", "experience_level", "created_on", "password"],
        "FraudAlertHistory": ["log_id", "alert_id", "investigator_id", "action", "log_time"]
    }

    relationships = {
        "Customer": {
            "Account": "Customer.customer_id = Account.customer_id"
        },
        "Account": {
            "Customer": "Account.customer_id = Customer.customer_id",
            "Transactions": "Account.account_id = Transactions.account_id"
        },
        "Transactions": {
            "Account": "Transactions.account_id = Account.account_id",
            "FraudAlert": "Transactions.transaction_id = FraudAlert.transaction_id"
        },
        "FraudAlert": {
            "Transactions": "FraudAlert.transaction_id = Transactions.transaction_id",
            "Investigator": "FraudAlert.investigator_id = Investigator.investigator_id",
            "FraudAlertHistory": "FraudAlert.alert_id = FraudAlertHistory.alert_id"
        },
        "FraudAlertHistory": {
            "FraudAlert": "FraudAlertHistory.alert_id = FraudAlert.alert_id",
            "Investigator": "FraudAlertHistory.investigator_id = Investigator.investigator_id"
        }
    }

    def run_dynamic_query(self, table, filters):
        if table not in self.allowed_tables:
            return []

        query = f"SELECT * FROM {table} WHERE 1=1"
        params = []

        for f in filters:
            col = f['column']
            op = f['operator']
            val = f['value']

            if col not in self.allowed_tables[table]:
                continue

            if op == "contains":
                query += f" AND {col} LIKE %s"
                params.append(f"%{val}%")
            elif op == "startswith":
                query += f" AND {col} LIKE %s"
                params.append(f"{val}%")
            elif op == "endswith":
                query += f" AND {col} LIKE %s"
                params.append(f"%{val}")
            else:
                query += f" AND {col} {op} %s"
                params.append(val)

        self.cursor.execute(query, params)

        return self.cursor.fetchall()

    def get_columns_for_table(self, table):
        return self.allowed_tables.get(table, [])

    def run_join_query(self, base_table, joined_tables, filters):
        query = f"SELECT * FROM {base_table}"
        params = []

        # Add JOIN clauses
        for join_table in joined_tables:
            condition = self.relationships[base_table][join_table]
            query += f" JOIN {join_table} ON {condition}"

        # Add filters
        for f in filters:
            col = f["column"]
            op = f["operator"]
            val = f["value"]
            table = f["table"]

            col_ref = f"{table}.{col}"

            if op == "contains":
                query += f" AND {col_ref} LIKE %s"
                params.append(f"%{val}%")
            else:
                query += f" AND {col_ref} {op} %s"
                params.append(val)

        self.cursor.execute(query, params)
        return self.cursor.fetchall()
