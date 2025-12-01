from models.customer import Customer

class CustomerController:
    def __init__(self):
        self.customer = Customer()

    def verify_security_details(self, customer_id, first_name, last_name, phone, city):
        return_status = self.customer.verify_customer_details(
            customer_id, first_name, last_name, phone, city
        )

        if return_status:
            return True, return_status
        return False, None
