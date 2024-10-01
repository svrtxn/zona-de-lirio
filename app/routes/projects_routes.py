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

from app.utils.projects_f import registrar_categorias_proyecto, stringAleatorio, recibe_file, registrar_proyecto, list_projects, get_db, format_date


projects_routes = Blueprint('projects', __name__, template_folder='templates/admin/projects')


@projects_routes.route('/admin/biblioteca/agregar-proyecto', methods=['GET', 'POST'])
def add_project():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT category_id, name FROM categories")
    categories = cursor.fetchall()
    print(f"categorias {categories} ") 
    cursor.close()
    conn.close()

    return render_template('admin/pages/projects/add_project.html', categories=categories)

@projects_routes.route('/admin/biblioteca', methods=['GET', 'POST'])
def formAddProjects():
    if request.method == 'POST':
        # Obtener datos del formulario
        name = request.form['name']
        secondary_name = request.form['secondary_name']
        description = request.form['description']
        author = request.form['author']
        created_at = datetime.now()
        updated_at = datetime.now()
        status = request.form['status']
        type = request.form['type']
        rating = request.form['rating']
        
        # Obtener las categorías seleccionadas
        categories = request.form.getlist('categories')

        # Manejo del archivo de portada
        file = request.files.get('covered')
        if file and file.filename:
            nuevoNombre = recibe_file(file)
        else:
            return render_template('admin/pages/projects/biblioteca.html', msjAlert='Debe seleccionar una portada.', typeAlert=0)

        # Registrar el proyecto
        result, project_id = registrar_proyecto(name, secondary_name, description, author, '', created_at, updated_at, nuevoNombre, status, 1, type, rating, 0)
        if result == 1:
            # Registrar las categorías en una función separada
            if categories:
                registrar_categorias_proyecto(project_id, categories)

            return redirect(url_for('projects.formAddProjects'))
        else:
            return render_template('admin/pages/projects/biblioteca.html', msjAlert='Error al subir la portada.', typeAlert=0)

    projects = list_projects()
    return render_template('admin/pages/projects/biblioteca.html', miData=projects)


@projects_routes.route('/details/<int:id>', methods=['GET'])
def details(id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    # Obtener la información del proyecto
    cursor.execute("SELECT * FROM projects WHERE project_id = %s", (id,))
    project = cursor.fetchone()
    
    if project:
        # Obtener el nombre del grupo publicado
        cursor.execute("SELECT name FROM groups WHERE group_id = %s", (project['group_id'],))
        group = cursor.fetchone()
        project['published_by'] = group['name'] if group else 'Unknown'
        

        # Formatear las fechas
        project['created_at'] = format_date(project['created_at'])
        project['updated_at'] = format_date(project['updated_at'])
        
        # Obtener la lista de capítulos del proyecto
        cursor.execute("SELECT * FROM chapters WHERE project_id = %s", (id,))
        chapters = cursor.fetchall()
        
        # Formatear fechas de capítulos
        for chapter in chapters:
            chapter['date'] = format_date(chapter['date'])
        
        # Determinar si el usuario es admin
        is_admin = session.get('role_id') == 1
        is_user = session.get('role_id') == 3
        
        # Definir last_chapter y first_chapter
        first_chapter = chapters[0] if chapters else None
        last_chapter = chapters[-1] if chapters else None

        cursor.close()
        conn.close()
        
        return render_template('admin/pages/projects/details.html', 
                               project=project, 
                               lista_cap=chapters, 
                               first_chapter=first_chapter,
                               last_chapter=last_chapter,
                               is_admin=is_admin,
                               is_user=is_user)
    else:
        cursor.close()
        conn.close()
        return render_template('admin/pages/projects/not_found.html'), 404
    
# @projects_routes.route('/edit-project/<int:id>')
#                        ', methods=['GET', 'POST'])
# def edit_project(id):
#     if request.method == 'GET':
#         conn = get_db()
#         cursor = conn.cursor(dictionary=True)
        
#         # Obtener la información del proyecto
#         cursor.execute("SELECT * FROM projects WHERE project_id = %s", (id,))
#         project = cursor.fetchone()
        
#         if project:
#             cursor.close()
#             conn.close()
#             return render_template('admin/pages/projects/edit_project.html', project=project)
#         else:
#             cursor.close()
#             conn.close()
#             return render_template('admin/pages/projects/not_found.html'), 404
    
#     return render_template('admin/pages/projects/add_chapters.html')

@projects_routes.route('/details/<int:id>/add-chapter', methods=['GET', 'POST'])
def add_chapter(id):
    if request.method == 'POST':
        project_id = id
        title = request.form.get('title')
        number = request.form.get('number')

        if not title or not number:
            return render_template('admin/pages/projects/add_chapter.html', project_id=id, error="Faltan campos requeridos.")

        if 'archivos[]' in request.files:
            files = request.files.getlist('archivos[]')
           
            if not files or all(file.filename == '' for file in files):
                return render_template('admin/pages/projects/add_chapter.html', project_id=id, error="No se han enviado archivos.")

            resultado = procesar_formulario(title, project_id, number, files)
            
            if resultado > 0:
                return redirect(url_for('projects.details', id=id))
            else:
                return render_template('admin/pages/projects/add_chapter.html', project_id=id, error="Error al guardar el capítulo o las imágenes.")
        else:
            print("No se encontraron archivos en la solicitud.")
            return render_template('admin/pages/projects/add_chapter.html', project_id=id, error="No se encontraron archivos en la solicitud.")

    return render_template('admin/pages/projects/add_chapter.html', project_id=id)


def procesar_formulario(title, project_id, number, files):
    # Registrando el capítulo
    result_process = guardar_chapter(project_id, number, title)
    if result_process:
        # Registrando las fotos del capítulo
        misFiles = procesarFotos(files, project_id, number)
      
        if misFiles:
            # Registrando todas las fotos en BD
            resultData = guardar_fotosBD(project_id, misFiles, result_process, number)
            return resultData 
    return 0


def guardar_chapter(project_id, number, title):
    try:
        conn = get_db()
        cursor = conn.cursor(dictionary=True)

        SQL_Insert = "INSERT INTO chapters(project_id, number, title) VALUES (%s, %s, %s)"
        valores = (project_id, number, title)
        cursor.execute(SQL_Insert, valores)
        conn.commit()

        ultimo_capitulo_registrado = cursor.lastrowid
        print(f"ID del capítulo guardado: {ultimo_capitulo_registrado}")
        return ultimo_capitulo_registrado
    except Exception as e:
        print(f"Error al guardar el capítulo: {e}")
        return None



def procesarFotos(files, project_id, chapter_number):
    try:
        nombres_archivos = []
        basepath = os.path.abspath(os.path.dirname(__file__))
        upload_dir = os.path.join(basepath, f'../static/assets/capitulos/proyecto_{project_id}/capitulo_{chapter_number}')

        if not os.path.exists(upload_dir):
            os.makedirs(upload_dir, mode=0o755)

        for file in files:
            if file.filename:
                filename = secure_filename(file.filename)
                extension = os.path.splitext(filename)[1]
                nuevoNameFile = (uuid.uuid4().hex + uuid.uuid4().hex)[:100]
                nombreFile = nuevoNameFile + extension
                upload_path = os.path.join(upload_dir, nombreFile)
                file.save(upload_path)
                nombres_archivos.append(nombreFile)

        print(f"Nombres de archivos procesados: {nombres_archivos}")
        return nombres_archivos
    except Exception as e:
        print(f"Error al procesar archivos: {e}")
        return []


def guardar_fotosBD(project_id, misFiles, chapter_id, chapter_number):
    try:
        conn = get_db()
        cursor = conn.cursor(dictionary=True)

        # Actualiza la SQL para incluir chapter_number en la URL
        sql = "INSERT INTO images(chapter_id, image_path) VALUES (%s, %s)"
        for filename in misFiles:
            urlFile = f"assets/capitulos/proyecto_{project_id}/capitulo_{chapter_number}/{filename}"
            valores = (chapter_id, urlFile)
            cursor.execute(sql, valores)

        conn.commit()
        print(f"Número de filas insertadas en images: {cursor.rowcount}")
        return cursor.rowcount
    except Exception as e:
        print(f"Error al guardar las fotos en la base de datos: {e}")
        return 0

@projects_routes.route('/<int:project_id>/capitulo/<int:chapter_number>', methods=['GET'])
def chapter_details(project_id, chapter_number):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    # Obtener la información del capítulo utilizando el chapter_number
    cursor.execute("SELECT * FROM chapters WHERE project_id = %s AND number = %s", (project_id, chapter_number))
    chapter = cursor.fetchone()
    
    if chapter:
        chapter_id = chapter.get('chapter_id')  # Obtener chapter_id de los detalles del capítulo
        
        # Obtener las imágenes asociadas con el capítulo
        cursor.execute("SELECT * FROM images WHERE chapter_id = %s", (chapter_id,))
        images = cursor.fetchall()
        
        cursor.execute("SELECT name FROM projects WHERE project_id = %s", (project_id,))
        project = cursor.fetchone()

        cursor.close()
        conn.close()
        
        return render_template('admin/pages/projects/chapters.html', chapter=chapter, images=images, project=project)
    else:
        cursor.close()
        conn.close()
        return render_template('admin/pages/projects/not_found.html'), 404