import os
from random import sample
import uuid
from flask import Blueprint, current_app, g, render_template, request, redirect, url_for, session
from werkzeug.security import check_password_hash, generate_password_hash
from werkzeug.utils import secure_filename
from datetime import datetime
import re
from functools import wraps
import mysql.connector


def stringAleatorio():
    import string
    from random import choices
    string_aleatorio = string.ascii_letters + string.digits + "_"
    longitud = 20
    resultado_aleatorio = ''.join(choices(string_aleatorio, k=longitud))
    return resultado_aleatorio

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

    # Obtener el ID del último registro insertado
    project_id = cursor.lastrowid

    cursor.close()  # Cerrando conexión SQL
    conn.close()  # Cerrando conexión de la BD
    
    resultado_insert = cursor.rowcount  # Retorna 1 o 0
    return resultado_insert, project_id  # Retorna ambos valores


def registrar_categorias_proyecto(project_id, categories):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)

    for category in categories:
        sql = "INSERT INTO project_categories (project_id, category_id) VALUES (%s, %s)"
        valores = (project_id, category)
        cursor.execute(sql, valores)
    conn.commit()
    cursor.close()  # Cerrando el cursor
    conn.close() 
