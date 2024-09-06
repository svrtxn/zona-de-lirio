import os
from random import sample
from flask import Blueprint, current_app, g, render_template, request, redirect, url_for, session
from werkzeug.security import check_password_hash, generate_password_hash
from werkzeug.utils import secure_filename
from datetime import datetime
import re
from functools import wraps
import mysql.connector

from app.utils import stringAleatorio  


projects_routes = Blueprint('projects', __name__, template_folder='templates/admin/projects')

def get_db():
    if 'db' not in g:
        g.db = mysql.connector.connect(
            host=current_app.config['MYSQL_HOST'],
            user=current_app.config['MYSQL_USER'],
            password=current_app.config['MYSQL_PASSWORD'],
            database=current_app.config['MYSQL_DATABASE']
        )
    return g.db
def list_projects():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT project_id, covered, name, description, DATE_FORMAT(created_at, '%d/%m/%Y') AS creacion, DATE_FORMAT(updated_at, '%d/%m/%Y') AS actualizacion, status FROM `projects`")
    results = cursor.fetchall()
    cursor.close()
    return results


def recibe_file(file):
    basepath = current_app.root_path
    filename = secure_filename(file.filename)
    extension = os.path.splitext(filename)[1]
    nuevoNombre = stringAleatorio() + extension

    upload_dir = os.path.join(basepath, 'static', 'assets', 'portadas')

    if not os.path.exists(upload_dir):
        os.makedirs(upload_dir)

    upload_path = os.path.join(upload_dir, nuevoNombre)
    file.save(upload_path)

    return nuevoNombre


def format_date(date_obj):
    return date_obj.strftime('%d/%m/%Y') if date_obj else 'Unknown'

def registrar_proyecto(name='', secondary_name='', description='', author='', published_by='', created_at='', updated_at='', nuevoNombreFile='', status='', group_id='1', type='', rating='', evaluation=0):       
    conn = get_db()
    cursor = conn.cursor(dictionary=True)

    sql = ("INSERT INTO projects(name, secondary_name, description, author, published_by, created_at, updated_at, covered, status, group_id, type, rating, evaluation) "
           "VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)")
    valores = (name, secondary_name, description, author, published_by, created_at, updated_at, nuevoNombreFile, status, group_id, type, rating, evaluation)
    
    cursor.execute(sql, valores)
    conn.commit()
    cursor.close()  # Cerrando conexión SQL
    conn.close()  # Cerrando conexión de la BD
    
    resultado_insert = cursor.rowcount  # Retorna 1 o 0
    ultimo_id = cursor.lastrowid  # Retorna el id del último registro
    return resultado_insert

  

@projects_routes.route('/agregar-proyecto', methods=['GET', 'POST'])
def add_project():
    return render_template('admin/projects/add_project.html')

@projects_routes.route('/admin/biblioteca', methods=['GET', 'POST'])
def formAddProjects():
    if request.method == 'POST':
        name = request.form['name']
        secondary_name = request.form['secondary_name']
        description = request.form['description']
        author = request.form['author']
        created_at = datetime.now()
        updated_at = datetime.now()
        status = request.form['status']
        type = request.form['type']
        rating = request.form['rating']
        
        file = request.files.get('covered')  # Obtén el archivo de manera segura

        if file and file.filename:  # Verifica si el archivo existe y tiene nombre
            nuevoNombre = recibe_file(file)
            result = registrar_proyecto(name, secondary_name, description, author, '', created_at, updated_at, nuevoNombre, status, 1, type, rating, 0)
            if result == 1:
                return redirect(url_for('projects.formAddProjects'))
            else:
                return render_template('admin/pages/projects/biblioteca.html', msjAlert='Error al subir la portada.', typeAlert=0)
        else:
            return render_template('admin/pages/projects/biblioteca.html', msjAlert='Debe seleccionar una portada.', typeAlert=0)

    projects = list_projects()
    return render_template('admin/pages/projects/biblioteca.html', miData=projects)



def stringAleatorio():
    import string
    from random import choices
    string_aleatorio = string.ascii_letters + string.digits + "_"
    longitud = 20
    resultado_aleatorio = ''.join(choices(string_aleatorio, k=longitud))
    return resultado_aleatorio

@projects_routes.route('/details/<int:id>', methods=['GET'])
def details(id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    # Obtener los detalles del proyecto
    cursor.execute("SELECT * FROM projects WHERE project_id = %s", (id,))
    project = cursor.fetchone()
    
    if project:
        # Obtener el nombre del grupo basado en el group_id del proyecto
        cursor.execute("SELECT name FROM groups WHERE group_id = %s", (project['group_id'],))
        group = cursor.fetchone()
        project['published_by'] = group['name'] if group else 'Unknown'
        
        # Formatear las fechas
        project['created_at'] = format_date(project['created_at'])
        project['updated_at'] = format_date(project['updated_at'])
        
        cursor.close()
        conn.close()
        
        return render_template('admin/pages/projects/details.html', project=project)
    else:
        cursor.close()
        conn.close()
        return render_template('admin/pages/projects/not_found.html'), 404
    
@projects_routes.route('/details/<int:id>/chapters', methods=['GET', 'POST'])
def edit_project(id):
    
    return render_template('admin/pages/projects/add_chapters.html')