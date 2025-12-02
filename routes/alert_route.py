from flask import Blueprint, session, jsonify
from controllers.alert_controller import AlertController

alert_route = Blueprint('alert_route', __name__)
alert_controller = AlertController()

@alert_route.route('/api/alerts')
def api_alerts():

    investigator_id = session.get('investigator_id')

    if not investigator_id:
        return jsonify([])

    alerts = alert_controller.get_latest_alerts(investigator_id)
    return jsonify(alerts)
