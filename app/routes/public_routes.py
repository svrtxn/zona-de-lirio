from flask import Blueprint, g, render_template, request, redirect, url_for, session
from werkzeug.security import check_password_hash, generate_password_hash
from datetime import datetime
import re
from functools import wraps

from app.utils.projects_f import stringAleatorio, recibe_file, registrar_proyecto, list_projects, get_db, format_date
from app.utils.public_f import dataLoginSession, dataUsuario

public_routes = Blueprint('public', __name__, template_folder='templates/public')



@public_routes.errorhandler(404)
def not_found(error):
    return render_template('public/module_login/index.html')

@public_routes.route('/')
def inicio():
    user_logged_in = 'user_id' in session
    user_role = session.get('role_id')  
    return render_template('public/main/home.html', user_logged_in=user_logged_in, user_role=user_role, dataLoginSession=dataLoginSession())

@public_routes.route('/login')
def login():
    return render_template('public/module_login/index.html')

@public_routes.route('/loginUser', methods=['POST'])
def loginUser():
    conn = g.db
    if 'conectado' in session:
        return redirect(url_for('public.inicio'))
    else:
        if request.method == 'POST' and 'username' in request.form and 'password' in request.form:
            username = str(request.form['username']).lower()
            password = str(request.form['password'])

            cursor = conn.cursor(dictionary=True)
            cursor.execute("SELECT * FROM users WHERE username = %s", (username,))
            account = cursor.fetchone()

            if account and check_password_hash(account['password'], password):
                session['conectado']     = True
                session['user_id']       = account['user_id']
                session['role_id']       = account['role_id']
                session['username']      = account['username']
                session['email']         = account['email'] 
                session['password']      = account['password']
                session['created_at']    = account['created_at']

                if account['role_id'] == 1 or account['role_id'] == 2:
                    return render_template('admin/home.html')
                else:
                    return redirect(url_for('public.inicio'))
            else:
                return redirect(url_for('public.login', msjAlert='Datos incorrectos, intentelo nuevamente.', typeAlert=0))
        return redirect(url_for('public.login', msjAlert='Debe iniciar sesión.', typeAlert=0))


@public_routes.route('/registrarse')
def registrarse():
    return render_template('public/module_login/register.html')

@public_routes.route('/register', methods=['GET', 'POST'])
def registerUser():
    msg = ''
    conn = g.db
    if request.method == 'POST':
        role_id = 3
        username            = request.form['username']
        email               = request.form['email']
        password            = request.form['password']
        repeat_password     = request.form['repeat_password']
        created_at          = datetime.now()

        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM users WHERE email = %s", (email,))
        account = cursor.fetchone()
        cursor.close()

        if account:
            msg = 'El correo electrónico ya se encuentra registrado.'
            typeAlert = 0
        elif not re.match(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$', email):
            msg = 'Correo electrónico inválido.'
            typeAlert = 0
        elif password != repeat_password:
            msg = 'Las contraseñas no coinciden.'
            typeAlert = 0
        elif not email or not password or not repeat_password:
            msg = 'Todos los campos son obligatorios.'
            typeAlert = 0
        else:
            password_hash = generate_password_hash(password)
            cursor = conn.cursor(dictionary=True)
            cursor.execute("INSERT INTO users (role_id, username, email, password, created_at) VALUES (%s, %s, %s, %s, %s)", (role_id, username, email, password_hash, created_at))
            conn.commit()
            cursor.close()
            msg = 'Registro exitoso, ahora puede iniciar sesión.'
            typeAlert = 1
            return redirect(url_for('public.login')) 

        return render_template('public/module_login/register.html', msjAlert=msg, typeAlert=typeAlert)
    return render_template('public/module_login/register.html', msjAlert=msg, typeAlert=0)

@public_routes.route('/perfil')
def perfil():
    user_data = dataUsuario() 
    if user_data.get('role_id') == 1:
        role = 'Administrador'
    elif user_data.get('role_id') == 2:
        role = 'Moderador'
    elif user_data.get('role_id') == 3:
        role = 'Usuario'
    return render_template('public/main/pages/perfil.html', user_logged_in=True, dataUser=user_data, role=role)

@public_routes.route('/logout')
def logout():
    session.pop('user_id', None)
    session.clear()
    msgClose = 'Sesión cerrada correctamente.'
    return redirect(url_for('public.login', msjAlert=msgClose, typeAlert=1))

@public_routes.route('/biblioteca')
def biblioteca():
    user_logged_in = 'user_id' in session
    user_role = session.get('role_id')
    projects = list_projects()  # Obtén la lista de proyectos desde la base de datos
    
    return render_template(
        'public/main/pages/biblioteca.html',
        user_logged_in=user_logged_in,
        user_role=user_role,
        projects=projects,  # Pasa la lista de proyectos a la plantilla
        dataLoginSession=dataLoginSession()
    )