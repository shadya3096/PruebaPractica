CREATE DATABASE DB_RegistroCrud
GO

USE DB_RegistroCrud
GO

CREATE TABLE test_usuario (usu_ced VARCHAR(50) NOT NULL,
						   usu_tipoUsuario CHAR (3) NOT NULL CHECK (usu_tipoUsuario IN('ADM', 'CON')),
						   usu_nombreCompleto VARCHAR(100)	NOT NULL,
						   usu_correo VARCHAR(100) NOT NULL,
						   usu_tipoIdent CHAR(3) NOT NULL CHECK (usu_tipoIdent IN ('NAC', 'EXT')),
						   usu_usuario VARCHAR(50) NOT NULL,
						   usu_clave VARCHAR(50) NOT NULL,
						   usu_activo CHAR(1) NOT NULL CHECK (usu_activo IN ('A', 'I'))
)
ALTER TABLE test_usuario ADD CONSTRAINT pk_usuCed PRIMARY KEY (usu_ced)
GO

CREATE INDEX idx_usu_cla ON test_usuario(usu_usuario,usu_clave)
GO

CREATE TABLE test_habilidades (hab_id CHAR(3) NOT NULL,
							   hab_nombre VARCHAR(50) NOT NULL,
)
ALTER TABLE test_habilidades ADD CONSTRAINT pk_habId PRIMARY KEY (hab_id)
GO

CREATE TABLE test_habilidades_usuario (habilidades_usuario_usuCed VARCHAR(50) NOT NULL,
								       habilidades_usuario_habId CHAR(3) NOT NULL,
									   habilidades_usuario_activo  CHAR(1) NOT NULL CHECK (habilidades_usuario_activo IN ('A', 'I'))
)
ALTER TABLE test_habilidades_usuario ADD CONSTRAINT pk_usu_hab PRIMARY KEY (habilidades_usuario_usuCed, habilidades_usuario_habId)
ALTER TABLE test_habilidades_usuario ADD CONSTRAINT fk_usuId FOREIGN KEY (habilidades_usuario_usuCed) REFERENCES test_usuario(usu_ced)
ALTER TABLE test_habilidades_usuario ADD CONSTRAINT fk_habId FOREIGN KEY (habilidades_usuario_habId) REFERENCES test_habilidades(hab_id)
GO




DROP DATABASE DB_RegistroCrud