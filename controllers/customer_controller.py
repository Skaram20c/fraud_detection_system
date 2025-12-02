from core.database import Database
from models.customer import Customer


class CustomerController:
    def __init__(self):
        self.customer = Customer()
        self.db = Database().connect()
        self.cursor = self.db.cursor(dictionary=True)

    def verify_security_details(self, customer_id, first_name, last_name, phone, city):
        return_status = self.customer.verify_customer_details(
            customer_id, first_name, last_name, phone, city
        )

        if return_status:
            return True, return_status
        return False, None

    def find_by_id(self, customer_id):
        return self.customer.find_by_id(customer_id)
