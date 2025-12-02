from flask import Blueprint, render_template, request, jsonify
from controllers.query_builder_controller import QueryBuilderController

query_builder_route = Blueprint("query_builder_route", __name__)
qb = QueryBuilderController()

@query_builder_route.route("/query-builder")
def query_builder():
    return render_template("query_builder.html", tables=qb.allowed_tables.keys())

@query_builder_route.route("/api/query-columns")
def query_columns():
    table = request.args.get("table")
    cols = qb.get_columns_for_table(table)
    return jsonify(cols)

@query_builder_route.route("/api/run-query", methods=["POST"])
def run_query():
    data = request.json
    table = data['table']
    filters = data['filters']
    results = qb.run_dynamic_query(table, filters)
    return jsonify(results)
