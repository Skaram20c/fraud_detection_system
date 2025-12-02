from core.database import Database

class AlertController:

    
    def __init__(self):
        self.db = Database().connect()
        self.cursor = self.db.cursor(dictionary=True)

    def get_latest_alerts(self, investigator_id, limit=5):
        query = """
        SELECT 
            fa.alert_id,
            fa.risk_level,
            fa.alert_notes,
            fa.alert_date,
            t.amount,
            t.transaction_id,
            CONCAT(c.first_name, ' ', c.last_name) AS customer_name
        FROM FraudAlert fa
        JOIN Transactions t ON fa.transaction_id = t.transaction_id
        JOIN Account a ON t.account_id = a.account_id
        JOIN Customer c ON a.customer_id = c.customer_id
        WHERE fa.investigator_id = %s
        ORDER BY fa.alert_date DESC
        LIMIT %s;
        """

        self.cursor.execute(query, (investigator_id, limit))
        return self.cursor.fetchall()
