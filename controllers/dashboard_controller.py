from core.database import Database

class DashboardController:
    def __init__(self):
        self.db = Database().connect()
        self.cursor = self.db.cursor(dictionary=True)

    # Get customer info
    def get_customer_info(self, customer_id):
        query = """
            SELECT customer_id, first_name, last_name, phone, city, created_on
            FROM Customer
            WHERE customer_id = %s
        """
        self.cursor.execute(query, (customer_id,))
        return self.cursor.fetchone()

    # Get main account (first account)
    def get_main_account(self, customer_id):
        query = """
            SELECT *
            FROM Account
            WHERE customer_id = %s
            ORDER BY account_id ASC
            LIMIT 1
        """
        self.cursor.execute(query, (customer_id,))
        return self.cursor.fetchone()

    # Get total balance across all accounts
    def get_total_balance(self, customer_id):
        query = """
            SELECT SUM(balance) AS total_balance
            FROM Account
            WHERE customer_id = %s
        """
        self.cursor.execute(query, (customer_id,))
        result = self.cursor.fetchone()
        return result["total_balance"] if result["total_balance"] else 0


    def get_latest_transactions(self, customer_id):
        query = """
            SELECT 
                t.transaction_date,
                t.location,
                t.transaction_type,
                t.status AS transaction_status,
                t.flagged,
                fa.risk_level,
                fa.alert_notes,
                t.amount

            FROM transactions t
            JOIN account a 
                ON t.account_id = a.account_id

            LEFT JOIN fraudalert fa 
                ON fa.transaction_id = t.transaction_id

            WHERE a.customer_id = %s
            ORDER BY t.transaction_date DESC, t.transaction_id DESC
            LIMIT 10;
        """

        self.cursor.execute(query, (customer_id,))
        return self.cursor.fetchall()


    def get_expense_summary(self, customer_id):
        # Fetch total successful and failed transactions
        query = """
            SELECT
                -- Successful Transactions
                (SELECT COUNT(*) 
                FROM transactions t
                JOIN account a ON t.account_id = a.account_id
                WHERE a.customer_id = %s AND t.status = 'Success') AS success_count,

                -- Failed Transactions
                (SELECT COUNT(*) 
                FROM transactions t
                JOIN account a ON t.account_id = a.account_id
                WHERE a.customer_id = %s AND t.status = 'Failed') AS failed_count
        """
        self.cursor.execute(query, (customer_id, customer_id))
        return self.cursor.fetchone()

    def get_transaction_counts(self, customer_id):
        query = """
            SELECT
                COUNT(*) AS all_time,

                SUM(
                    CASE 
                        WHEN DATE(t.transaction_date) >= CURDATE() - INTERVAL 7 DAY
                        THEN 1 ELSE 0
                    END
                ) AS last_7_days,

                SUM(
                    CASE
                        WHEN YEAR(DATE(t.transaction_date)) = YEAR(CURDATE())
                        AND MONTH(DATE(t.transaction_date)) = MONTH(CURDATE())
                        THEN 1 ELSE 0
                    END
                ) AS this_month,

                SUM(
                    CASE
                        WHEN YEAR(DATE(t.transaction_date)) = YEAR(CURDATE())
                        THEN 1 ELSE 0
                    END
                ) AS this_year

            FROM transactions t
            JOIN account a ON t.account_id = a.account_id
            WHERE a.customer_id = %s;
        """
        self.cursor.execute(query, (customer_id,))
        row = self.cursor.fetchone()

        return {
            "all_time": int(row["all_time"] or 0),
            "week":     int(row["last_7_days"] or 0),
            "month":    int(row["this_month"] or 0),
            "year":     int(row["this_year"] or 0)
        }


    def get_flagged_transactions_count(self, customer_id):
        query = """
            SELECT COUNT(*) AS flagged_count
            FROM transactions t
            JOIN account a ON t.account_id = a.account_id
            LEFT JOIN fraudalert fa ON fa.transaction_id = t.transaction_id
            WHERE a.customer_id = %s
            AND fa.alert_id IS NOT NULL;
        """
        self.cursor.execute(query, (customer_id,))
        row = self.cursor.fetchone()
        return row["flagged_count"] or 0

    def get_total_fraud_alerts(self, customer_id):
        query = """
            SELECT COUNT(*) AS alert_count
            FROM fraudalert fa
            JOIN transactions t ON fa.transaction_id = t.transaction_id
            JOIN account a ON t.account_id = a.account_id
            WHERE a.customer_id = %s;
        """
        self.cursor.execute(query, (customer_id,))
        row = self.cursor.fetchone()
        return row["alert_count"] or 0

    def get_successful_flagged_transactions(self, customer_id):
        query = """
            SELECT COUNT(*) AS count_success_flagged
            FROM transactions t
            JOIN account a ON t.account_id = a.account_id
            JOIN fraudalert fa ON fa.transaction_id = t.transaction_id
            WHERE a.customer_id = %s
            AND t.status = 'Success';
        """
        self.cursor.execute(query, (customer_id,))
        row = self.cursor.fetchone()
        return row["count_success_flagged"] or 0







