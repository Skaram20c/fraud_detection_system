from werkzeug.security import generate_password_hash, check_password_hash
from models.investigator import Investigator

class AuthService:

    def signup(self, name, email, password, confirm_password):

        if password != confirm_password:
            return False, "Passwords do not match."

        investigator = Investigator()

        # Check if email already exists
        if investigator.find_by_email(email):
            return False, "Email already registered."

        # Hash the password
        # password_hash = generate_password_hash(password)

        # Insert new investigator
        investigator.create(name, email, password_hash)

        return True, "Signup successful!"

    def login(self, email, password):
        investigator = Investigator()
        user = investigator.find_by_email(email)

        if not user:
            return False, "Email not found."

         # simple string compare
        if user["password"] != password:
            return False, "Incorrect password."

        #if not check_password_hash(user["password"], password):
        #    return False, "Incorrect password."

        return True, user
