from flask import Blueprint, g, render_template, redirect, url_for, session
from functools import wraps

admin_routes = Blueprint('admin', __name__, template_folder='templates/admin')

def role_required(role_id):
    def decorator(f):
        @wraps(f)
        def decorated_function(*args, **kwargs):
            if 'conectado' in session and session.get('role_id') == role_id:
                return f(*args, **kwargs)
            else:
                return redirect(url_for('public.login'))
        return decorated_function
    return decorator

def dataUsuario():
    conn = g.db
    cursor = conn.cursor(dictionary=True)
    idUsuario = session['user_id']
    querySQL = "SELECT * FROM users WHERE user_id = %s"
    cursor.execute(querySQL, (idUsuario,))
    datosUsuario = cursor.fetchone()
    cursor.close()
    return datosUsuario

@admin_routes.route('/admin', endpoint='admin')
@role_required(1)
def admin():
    return render_template('admin/home.html')

@admin_routes.route('/admin/perfil')
@role_required(1)
def admin_perfil():
    user_data = dataUsuario() 
    if user_data.get('role_id') == 1:
        role = 'Administrador'
    elif user_data.get('role_id') == 2:
        role = 'Moderador'
    elif user_data.get('role_id') == 3:
        role = 'Usuario'
    return render_template('admin/pages/perfil.html', user_logged_in=True, dataUser=user_data, role=role)

@admin_routes.route('/admin/afiliados')
@role_required(1)
def admin_afiliados():
    return render_template('admin/pages/afiliados.html')

@admin_routes.route('/admin/usuarios')
@role_required(1)
def admin_usuarios():
    return render_template('admin/pages/usuarios.html')

@admin_routes.route('/admin/list-users', methods=['GET', 'POST'])
@role_required(1)
def list_users():
    conn = g.db
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM users")
    results = cursor.fetchall()
    cursor.close()
    
    return render_template('admin/pages/usuarios.html', miData=results)