from flask import Blueprint, render_template, session
from controllers.dashboard_controller import DashboardController

dashboard_route = Blueprint('dashboard_route', __name__)
dashboard_controller = DashboardController()

@dashboard_route.route('/dashboard')
def dashboard():
    customer_id = session.get('customer_id')

    if not customer_id:
        return "Customer not verified."

    customer_info = dashboard_controller.get_customer_info(customer_id)
    main_account = dashboard_controller.get_main_account(customer_id)
    total_balance = dashboard_controller.get_total_balance(customer_id)
    latest_transactions = dashboard_controller.get_latest_transactions(customer_id)
    expense_summary = dashboard_controller.get_expense_summary(customer_id)
    transaction_counts = dashboard_controller.get_transaction_counts(customer_id)
    flagged_count = dashboard_controller.get_flagged_transactions_count(customer_id)
    fraud_alert_total = dashboard_controller.get_total_fraud_alerts(customer_id)
    successful_flagged = dashboard_controller.get_successful_flagged_transactions(customer_id)



    return render_template("dashboard.html",
                           customer=customer_info,
                           main_account=main_account,
                           total_balance=total_balance,
                           transactions=latest_transactions,
                           expenses=expense_summary,
                           tx_counts=transaction_counts,
                           flagged_count=flagged_count,
                           fraud_alert_total=fraud_alert_total,
                           successful_flagged=successful_flagged,
                           investigator_name=session.get('investigator_name'),
                           investigator_initials=session.get('investigator_initials'),
                           investigator_id=session.get('investigator_id'),)