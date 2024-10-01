from flask import Blueprint, g, render_template, request, redirect, url_for, session
from werkzeug.security import check_password_hash, generate_password_hash
from datetime import datetime
import re
from functools import wraps

def dataLoginSession():
    return {
        'user_id': session.get('user_id'),
        'role_id': session.get('role_id'),
        'username': session.get('username'),
        'email': session.get('email'),
        'password': session.get('password'),
        'created_at': session.get('created_at')
    }

def dataUsuario():
    conn = g.db
    cursor = conn.cursor(dictionary=True)
    idUsuario = session['user_id']
    querySQL = "SELECT * FROM users WHERE user_id = %s"
    cursor.execute(querySQL, (idUsuario,))
    datosUsuario = cursor.fetchone()
    cursor.close()
    return datosUsuario