CREATE DATABASE IF NOT EXISTS 'zona_de_lirio';
USE zona_de_lirio;

-- USERS
CREATE TABLE IF NOT EXISTS roles (
    role_id INT NOT NULL AUTO_INCREMENT,
    role_name VARCHAR(255) UNIQUE NOT NULL,
    PRIMARY KEY (role_id)
);


INSERT INTO roles (role_id, role_name) VALUES
(1, 'Admin'),
(2, 'Moderator'),
(3, 'User');

CREATE TABLE IF NOT EXISTS users (
    user_id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role_id INT NOT NULL,
    created_at DATETIME DEFAULT NULL,
    PRIMARY KEY (user_id),
    KEY role_id (role_id),
    CONSTRAINT fk_role_id FOREIGN KEY (role_id) REFERENCES roles (role_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO `users` (`username`, `email`, `password`, `role_id`, `created_at`) VALUES
('admin', 'admin@mail.cl', 'admin', 1, NOW()),
('moderador', 'moderador@mail.cl', 'moderador', 2, NOW()),
('user', 'user@mail.cl', 'user', 3, NOW());

CREATE TABLE IF NOT EXISTS projects (
  project_id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  description VARCHAR(255) NOT NULL,
  created_at DATETIME DEFAULT NULL,
  updated_at DATETIME DEFAULT NULL,
  portada VARCHAR(45) NOT NULL,
  PRIMARY KEY (project_id)
);

CREATE TABLE IF NOT EXISTS chapters (
  chapter_id INT(11) NOT NULL AUTO_INCREMENT,
  project_id INT(11) NOT NULL,
  number INT(11) NOT NULL,
  title VARCHAR(45) NOT NULL,
  PRIMARY KEY (chapter_id),
  FOREIGN KEY (project_id) REFERENCES projects(project_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS images (
  image_id INT(11) NOT NULL AUTO_INCREMENT,
  chapter_id INT(11) NOT NULL,
  image_path VARCHAR(255) NOT NULL,
  PRIMARY KEY (image_id),
  FOREIGN KEY (chapter_id) REFERENCES chapters(chapter_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS  (