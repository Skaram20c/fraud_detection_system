from flask import Blueprint, session, redirect, url_for, render_template
from controllers.transaction_controller import TransactionController

transaction_route = Blueprint('transaction_route', __name__)
transaction_controller = TransactionController()

@transaction_route.route('/transaction_history')
def transaction_history():

    customer_id = session.get('customer_id')

    if not customer_id:
        return redirect(url_for('customer_select_route.select_customer'))

    transactions = transaction_controller.get_transactions_for_customer(customer_id)

    return render_template(
        "transaction_history.html",
        transactions=transactions,
        investigator_name=session.get('investigator_name'),
        investigator_initials=session.get('investigator_initials'),
        investigator_id=session.get('investigator_id')
    )
