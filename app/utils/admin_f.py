from flask import Blueprint, g, render_template, redirect, url_for, session
from functools import wraps

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