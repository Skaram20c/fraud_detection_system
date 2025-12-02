from flask import Blueprint, render_template, session, redirect, url_for
from controllers.case_controller import CaseController

case_route = Blueprint('case_route', __name__)
case_controller = CaseController()

@case_route.route('/cases')
def cases():

    investigator_id = session.get('investigator_id')

    if not investigator_id:
        return redirect(url_for('auth_route.login'))

    cases = case_controller.get_cases_for_investigator(investigator_id)

    return render_template(
        "case_list.html",
        cases=cases,
        investigator_name=session.get('investigator_name'),
        investigator_initials=session.get('investigator_initials'),
        investigator_id=investigator_id
    )
