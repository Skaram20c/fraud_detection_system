import mysql.connector
import config

class Database:
    def __init__(self):
        self.host = config.MYSQL_HOST
        self.user = config.MYSQL_USER
        self.password = config.MYSQL_PASSWORD
        self.database = config.MYSQL_DATABASE

    def connect(self):
        return mysql.connector.connect(
            host=self.host,
            user=self.user,
            password=self.password,
            database=self.database
        )
