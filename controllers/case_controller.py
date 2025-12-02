from core.database import Database

class CaseController:
    def __init__(self):
        self.db = Database().connect()
        self.cursor = self.db.cursor(dictionary=True)

    def get_cases_for_investigator(self, investigator_id):
        query = """
        SELECT 
            fa.alert_id,
            fa.risk_level,
            fa.alert_notes,
            fa.alert_date,
            t.transaction_id,
            t.amount,
            t.transaction_date,
            t.flagged,
            t.flag_reason,
            c.customer_id,
            CONCAT(c.first_name, ' ', c.last_name) AS customer_name
        FROM FraudAlert fa
        JOIN Transactions t ON fa.transaction_id = t.transaction_id
        JOIN Account a ON t.account_id = a.account_id
        JOIN Customer c ON a.customer_id = c.customer_id
        WHERE fa.investigator_id = %s
        ORDER BY t.transaction_date DESC;
        """

        self.cursor.execute(query, (investigator_id,))
        return self.cursor.fetchall()
