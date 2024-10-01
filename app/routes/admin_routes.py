from flask import Blueprint, g, render_template, redirect, url_for, session
from functools import wraps

from app.utils.admin_f import role_required, dataUsuario

admin_routes = Blueprint('admin', __name__, template_folder='templates/admin')


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