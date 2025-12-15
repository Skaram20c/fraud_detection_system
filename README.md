# Fraud Detection System

A full-stack fraud detection web application designed to identify and manage potentially fraudulent transactions with a database backend, UI dashboards, and RESTful APIs.

This repository contains the source code for a **Fraud Detection System** including backend logic, database schema, frontend templates, and supporting assets — aimed at helping organizations or developers explore transaction monitoring and fraud management workflows.

---

## 📌 Features

✔ MVC-style project structure (models, controllers, routes)  
✔ Interactive web interface for viewing/sorting flagged transactions  
✔ Integrated database support (schema & ER diagrams included)  
✔ Dashboard and visualization assets  
✔ REST API endpoints for interacting with the system programmatically  
✔ Designed for ease of extension to ML-based fraud scoring  

## 🛠️ Tech Stack

| Layer               | Technology |
|--------------------|------------|
| Backend            | Python (Flask) |
| Frontend           | HTML / CSS / JavaScript |
| Data Persistence   | SQL / ORM (configured in `models/`) |
| Templating         | Jinja2 |
| Visual Assets      | Dashboard mockups |

---

## 🚀 Getting Started

### 🧾 Prerequisites

Before running this project, make sure you have:

- Python 3.8+ installed  
- A local SQL database (e.g., MySQL, PostgreSQL)  
- `pip` package manager available

### 📦 Install Dependencies

```bash
git clone https://github.com/Skaram20c/fraud_detection_system.git
cd fraud_detection_system
pip install -r requirements.txt
```
---

## 🗄️ Database Setup

This project uses a relational database to store customers, accounts, transactions, investigators, and fraud alerts.

### 1️⃣ Create the Database

Create a new database in MySQL:

```sql
CREATE DATABASE FraudDetectionDB;
USE FraudDetectionDB;
```

## 2️⃣ Import Schema

### Step 1 — Locate the SQL schema file
In your project folder, find your database SQL script (example paths):
- `FraudDetectionDB/schema.sql`
- `FraudDetectionDB/FraudDetectionDB.sql`
- or any `.sql` file you created for table setup

> If you don’t have a single schema file yet, create one and paste all your `CREATE TABLE ...` statements into it.

---

### Step 2 — Import the schema into MySQL (Option A: MySQL Workbench)
1. Open **MySQL Workbench**
2. Go to **Server → Data Import**
3. Select **Import from Self-Contained File**
4. Choose your schema file (example: `FraudDetectionDB.sql`)
5. Select the target schema: `FraudDetectionDB`
6. Click **Start Import**

---

### Step 3 — Import the schema into MySQL (Option B: Command Line)
Open terminal in the folder where your `.sql` file exists and run:

```bash
mysql -u root -p FraudDetectionDB < FraudDetectionDB.sql
```

## 3️⃣ Update Database Configuration

### Step 1 — Open configuration file
In the project root, open: config.py

---

### Step 2 — Set database credentials
Update the database connection details to match your local MySQL setup:

```python
DB_CONFIG = {
    "host": "localhost",
    "user": "root",
    "password": "your_mysql_password",
    "database": "FraudDetectionDB"
}
```

## 🧠 Application Workflow

### Step 1 — Investigator Authentication
- Investigator logs into the system
- Session is created after successful authentication

---

### Step 2 — Customer Verification
- Investigator enters customer details
- System validates input against the database
- Access granted only if details match records

---

### Step 3 — Account & Transaction Retrieval
- Customer accounts are loaded
- Transactions are displayed in descending order by date
- Flagged transactions are visually highlighted

---

### Step 4 — Fraud Flagging
- Investigator flags suspicious transactions
- Reason and risk level are recorded
- Entry is created in the `FraudAlert` table

---

### Step 5 — Case Tracking
- Actions taken by investigators are logged
- History stored in `FraudAlertHistory`
- Enables auditing and compliance tracking

## 🔌 API Endpoints

### Customer Endpoints

| Method | Endpoint | Description |
|------|---------|-------------|
| GET | `/customers/<customer_id>` | Fetch customer details |
| GET | `/customers/search` | Verify customer information |

---

### Account Endpoints

| Method | Endpoint | Description |
|------|---------|-------------|
| GET | `/accounts/<customer_id>` | Retrieve customer accounts |

---

### Transaction Endpoints

| Method | Endpoint | Description |
|------|---------|-------------|
| GET | `/transactions/<account_id>` | Get transaction history |
| POST | `/transactions/flag` | Flag transaction as suspicious |

---

### Fraud Alert Endpoints

| Method | Endpoint | Description |
|------|---------|-------------|
| GET | `/fraud-alerts` | View all fraud alerts |
| GET | `/fraud-alerts/<alert_id>` | View alert details |

---

## 🔐 Security Considerations

- Parameterized SQL queries to prevent SQL injection
- Password hashing for investigator credentials
- Session-based authentication
- Input validation on all customer and transaction data
- Restricted access to investigation actions

## 🚧 Future Enhancements

- Machine learning–based fraud detection
- Risk scoring for transactions
- Real-time transaction monitoring
- Email and SMS alert notifications

## 📧 Project Information & Contact

This project was developed as a **group academic project** as part of a university coursework requirement.

### 👥 Project Team
- **Team Members:**
  * Karam Singh
  * Deepan Bhatta
  * Pooja Bera

### 🎓 Academic Context
- **Course:** Data Management Systems 
- **Institution:** Laurentian University  
- **Project Type:** Group Academic Project  
- **Term:** *Fall 2025*  

### 📌 Purpose
The purpose of this project is to demonstrate:
- Database design and normalization
- SQL queries, indexes, views, triggers, and procedures
- Full-stack integration using Flask and MySQL
- Secure data handling and audit tracking in a fraud detection scenario

### 📬 Contact
For academic review or clarification purposes, please contact the project repository owner:

**GitHub Repository Owner:**  
https://github.com/Skaram20c



