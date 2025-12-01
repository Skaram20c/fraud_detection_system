from core.database import Database

class Investigator:
    def __init__(self):
        self.db = Database().connect()
        self.cursor = self.db.cursor(dictionary=True)

    def find_by_credentials(self, email, password):
        query = "SELECT * FROM Investigator WHERE email=%s AND password=%s"
        self.cursor.execute(query, (email, password))
        return self.cursor.fetchone()

    def create(self, name, email, password):
        query = """
            INSERT INTO Investigator (name, email, password)
            VALUES (%s, %s, %s, %s)
        """
        self.cursor.execute(query, (name, email, password))
        self.db.commit()
        return True

    def find_by_email(self, email):
        query = "SELECT * FROM Investigator WHERE email=%s"
        self.cursor.execute(query, (email,))
        return self.cursor.fetchone()