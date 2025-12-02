from flask import Blueprint, request, render_template, jsonify
from controllers.search_controller import SearchController

search_route = Blueprint('search_route', __name__)
search_controller = SearchController()

@search_route.route('/api/search')
def api_search():
    q = request.args.get('q', '').strip()

    if q == '':
        return jsonify([])

    results = search_controller.search(q)
    return jsonify(results)

@search_route.route('/search')
def search_page():
    q = request.args.get('q', '').strip()
    results = search_controller.search(q)
    return render_template("search_results.html", q=q, results=results)
