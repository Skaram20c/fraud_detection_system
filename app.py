import config
from flask import Flask, render_template
from routes.auth_routes import auth_routes
from routes.dashboard_route import dashboard_route
from routes.customer_select_route import customer_select_route


app = Flask(__name__)
app.config.from_object(config)

# Register blueprints
app.register_blueprint(auth_routes)
app.register_blueprint(customer_select_route)
app.register_blueprint(dashboard_route)

@app.route('/')
def mainpage():
    return render_template('mainpage.html')

if __name__ == "__main__":
    app.run(debug=True)
