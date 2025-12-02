from flask import Blueprint, render_template, request, redirect, url_for, session
from controllers.auth_service import AuthService

auth_routes = Blueprint("auth_routes", __name__)
auth = AuthService()


# SIGNUP
@auth_routes.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':

        full_name = request.form['name']
        email     = request.form['email']
        password  = request.form['password']
        confirm   = request.form['confirm_password']

        success, message = auth.signup(full_name, email, password, confirm)

        if not success:
            return message  # You can render template with error message

        return redirect(url_for('auth_routes.login'))

    return render_template("signup.html")


# LOGIN
@auth_routes.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':

        email    = request.form['email']
        password = request.form['password']

        success, user = auth.login(email, password)
        if not success:
            return user  # user contains error message string
        
        session['investigator_id'] = user['investigator_id']
        session['investigator_name'] = f"{user['name']}"
        session['investigator_initials'] = (
            user['name'][0]
        ).upper()

        return redirect(url_for('customer_select_route.select_customer'))

    return render_template("login.html")
