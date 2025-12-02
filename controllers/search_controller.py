from core.database import Database

class SearchController:    
    def __init__(self):
        self.db = Database().connect()
        self.cursor = self.db.cursor(dictionary=True)

    def search(self, query):
        q = f"%{query}%"

        sql = """
        SELECT 
            'customer' AS type,
            customer_id AS id,
            CONCAT(first_name, ' ', last_name) AS title,
            email AS subtitle
        FROM Customer
        WHERE first_name LIKE %s OR last_name LIKE %s OR email LIKE %s OR phone LIKE %s

        UNION

        SELECT
            'account' AS type,
            account_id AS id,
            CONCAT('Account #', account_id) AS title,
            account_type AS subtitle
        FROM Account
        WHERE account_id LIKE %s OR account_type LIKE %s

        UNION

        SELECT
            'transaction' AS type,
            transaction_id AS id,
            CONCAT('Transaction #', transaction_id) AS title,
            amount AS subtitle
        FROM Transactions
        WHERE transaction_id LIKE %s OR amount LIKE %s

        UNION

        SELECT
            'alert' AS type,
            alert_id AS id,
            CONCAT('Alert #', alert_id) AS title,
            risk_level AS subtitle
        FROM FraudAlert
        WHERE alert_id LIKE %s OR risk_level LIKE %s;
        """

        self.cursor.execute(sql, (q, q, q, q, q, q, q, q, q, q))
        return self.cursor.fetchall()
