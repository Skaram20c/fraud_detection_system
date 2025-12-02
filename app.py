import config
from flask import Flask, render_template
from routes.case_route import case_route
from routes.auth_routes import auth_routes
from routes.alert_route import alert_route
from routes.search_route import search_route
from routes.dashboard_route import dashboard_route
from routes.transaction_route import transaction_route
from routes.customer_select_route import customer_select_route


app = Flask(__name__)
app.config.from_object(config)

# Register blueprints
app.register_blueprint(auth_routes)
app.register_blueprint(customer_select_route)
app.register_blueprint(dashboard_route)
app.register_blueprint(transaction_route)
app.register_blueprint(case_route)
app.register_blueprint(alert_route)
app.register_blueprint(search_route)



@app.route('/')
def mainpage():
    return render_template('mainpage.html')

if __name__ == "__main__":
    app.run(debug=True)
