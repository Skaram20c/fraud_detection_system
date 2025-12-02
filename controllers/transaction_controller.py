from core.database import Database

class TransactionController:

    def __init__(self):
        self.db = Database().connect()
        self.cursor = self.db.cursor(dictionary=True)

    def get_transactions_for_customer(self, customer_id):
        query = """
            SELECT 
                t.transaction_id,
                t.status,
                t.amount,
                t.transaction_date,
                t.flagged,
                t.flag_reason,
                fa.alert_id,
                fa.alert_notes
            FROM Transactions t
            LEFT JOIN FraudAlert fa 
                ON t.transaction_id = fa.transaction_id
            WHERE t.account_id IN (
                SELECT account_id FROM Account WHERE customer_id = %s
            )
            ORDER BY t.transaction_date DESC
        """

        self.cursor.execute(query, (customer_id,))
        results = self.cursor.fetchall()
        return results
