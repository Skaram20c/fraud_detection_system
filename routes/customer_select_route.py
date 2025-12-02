from flask import Blueprint, render_template, request, redirect, url_for, session, flash
from controllers.customer_controller import CustomerController

customer_select_route = Blueprint('customer_select_route', __name__)
customer_controller = CustomerController()

@customer_select_route.route('/select-customer', methods=['GET', 'POST'])
def select_customer():
    if request.method == 'POST':

        customer_id  = request.form.get('customer_id')
        first_name   = request.form.get('first_name')
        last_name    = request.form.get('last_name')
        phone        = request.form.get('phone')
        city         = request.form.get('city')

        success, customer = customer_controller.verify_security_details(
            customer_id, first_name, last_name, phone, city
        )

        if not success:
            return render_template("select_customer.html", error="Security verification failed. Customer information does not match our records.")

        # Save verified customer in session
        session['customer_id'] = customer['customer_id']
        session['customer_name'] = f"{customer['first_name']} {customer['last_name']}"
        session['customer_city'] = customer['city']

        return redirect(url_for('dashboard_route.dashboard'))

    return render_template("select_customer.html")
