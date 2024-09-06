from flask import Flask, g
import mysql.connector
from .routes.public_routes import public_routes
from .routes.admin_routes import admin_routes
from .routes.projects_routes import projects_routes
from .config import Config

def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)

    # Register blueprints
    app.register_blueprint(public_routes)
    app.register_blueprint(admin_routes)
    app.register_blueprint(projects_routes)

    @app.before_request
    def before_request():
        if 'db' not in g:
            g.db = mysql.connector.connect(
                host=app.config['MYSQL_HOST'],
                user=app.config['MYSQL_USER'],
                password=app.config['MYSQL_PASSWORD'],
                database=app.config['MYSQL_DATABASE']
            )

    @app.teardown_appcontext
    def teardown_appcontext(exception):
        db = g.pop('db', None)
        if db is not None:
            db.close()

    return app
