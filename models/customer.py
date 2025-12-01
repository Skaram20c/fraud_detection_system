from core.database import Database

class Customer:
    def __init__(self):
        self.db = Database().connect()
        self.cursor = self.db.cursor(dictionary=True)

    def find_by_customer_id(self, customer_id):
        query = "SELECT * FROM Customer WHERE customer_id = %s"
        self.cursor.execute(query, (customer_id,))
        return self.cursor.fetchone()

    def find_by_account(self, account_number):
        query = """
            SELECT c.*
            FROM Customer c
            JOIN Account a ON c.customer_id = a.customer_id
            WHERE a.account_id = %s
        """
        self.cursor.execute(query, (account_number,))
        return self.cursor.fetchone()

    def verify_customer_details(self, customer_id, first_name, last_name, phone, city):
        query = """
            SELECT *
            FROM Customer
            WHERE customer_id = %s
            AND LOWER(first_name) = LOWER(%s)
            AND LOWER(last_name) = LOWER(%s)
            AND phone = %s
            AND LOWER(city) = LOWER(%s)
        """
        self.cursor.execute(query, (customer_id, first_name, last_name, phone, city))
        return self.cursor.fetchone()


