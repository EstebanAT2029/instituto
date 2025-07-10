CREATE DATABASE IF NOT EXISTS unitek_sistema;
USE unitek_sistema;

-- Tabla: usuarios
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL,
    rol ENUM('admin', 'docente', 'alumno', 'administrativo') NOT NULL,
    email VARCHAR(100) NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL
);

-- Tabla: estudiantes
CREATE TABLE estudiantes (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    dni VARCHAR(15),
    nombres VARCHAR(100),
    apellidos VARCHAR(100),
    fecha_nacimiento DATE,
    direccion VARCHAR(200),
    telefono VARCHAR(20),
    email VARCHAR(100),
    genero ENUM('M', 'F'),
    estado ENUM('activo', 'inactivo')
);

-- Tabla: docentes
CREATE TABLE docentes (
    id_docente INT AUTO_INCREMENT PRIMARY KEY,
    dni VARCHAR(15),
    nombres VARCHAR(100),
    apellidos VARCHAR(100),
    especialidad VARCHAR(100),
    telefono VARCHAR(20),
    email VARCHAR(100),
    estado ENUM('activo', 'inactivo')
);

-- Tabla: personal_administrativo
CREATE TABLE personal_administrativo (
    id_personal INT AUTO_INCREMENT PRIMARY KEY,
    dni VARCHAR(15),
    nombres VARCHAR(100),
    apellidos VARCHAR(100),
    cargo VARCHAR(100),
    telefono VARCHAR(20),
    email VARCHAR(100),
    estado ENUM('activo', 'inactivo')
);

-- Tabla: carreras
CREATE TABLE carreras (
    id_carrera INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    duracion INT
);

-- Tabla: cursos
CREATE TABLE cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    id_carrera INT,
    creditos INT,
    FOREIGN KEY (id_carrera) REFERENCES carreras(id_carrera)
);

-- Tabla: matriculas
CREATE TABLE matriculas (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT,
    id_carrera INT,
    fecha_matricula DATE,
    periodo VARCHAR(20),
    estado ENUM('activo', 'inactivo'),
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante),
    FOREIGN KEY (id_carrera) REFERENCES carreras(id_carrera)
);

-- Tabla: notas
CREATE TABLE notas (
    id_nota INT AUTO_INCREMENT PRIMARY KEY,
    id_matricula INT,
    id_curso INT,
    nota_final DECIMAL(5,2),
    observaciones TEXT,
    FOREIGN KEY (id_matricula) REFERENCES matriculas(id_matricula),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

-- Tabla: pagos
CREATE TABLE pagos (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT,
    concepto VARCHAR(100),
    monto DECIMAL(10,2),
    fecha_pago DATE,
    metodo_pago VARCHAR(50),
    estado_pago ENUM('pagado', 'pendiente'),
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante)
);

-- Tabla: eventos
CREATE TABLE eventos (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150),
    descripcion TEXT,
    fecha_evento DATE,
    ubicacion VARCHAR(150)
);

-- Tabla: noticias
CREATE TABLE noticias (
    id_noticia INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150),
    contenido TEXT,
    imagen VARCHAR(200),
    fecha_publicacion DATE,
    autor VARCHAR(100)
);

-- Tabla: contactos_web
CREATE TABLE contactos_web (
    id_contacto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100),
    asunto VARCHAR(100),
    mensaje TEXT,
    fecha_envio DATETIME
);
