USE DB_RegistroCrud
GO


EXEC test_login 'sha96', 'KOKa1234'
GO

CREATE PROC test_login (@usuario VARCHAR(50),
						@clave VARCHAR(50))
AS
BEGIN

IF EXISTS (SELECT usu_usuario, usu_clave FROM test_usuario where usu_usuario=@usuario and usu_clave=@clave)
	SELECT * FROM test_usuario where usu_usuario=@usuario and usu_clave=@clave
ELSE
	RETURN PRINT 'No existe'
END
GO

EXEC test_insertar 'ADM', 'Shadya Mora Mata', 'shadya1996@hotmail', 'NAC', '604350920', 'sha96', 'hola1234'
GO

CREATE PROC test_insertar (@tipoUsuario CHAR (3),
						   @nombreCompleto VARCHAR(100),
						   @correo VARCHAR(100),
						   @tipoIdent CHAR(3),
						   @ced VARCHAR(50),
						   @usuario VARCHAR(50),
						   @clave VARCHAR(50))
AS 
BEGIN

IF NOT EXISTS (SELECT usu_ced FROM test_usuario where usu_ced=@ced)
		INSERT INTO test_usuario (usu_ced,
								  usu_tipoUsuario,
								  usu_nombreCompleto,
								  usu_correo,
								  usu_tipoIdent,
								  usu_usuario,
								  usu_clave,
								  usu_activo)
					VALUES (@ced,
							@tipoUsuario,
							@nombreCompleto,
							@correo,
							@tipoIdent,
							@usuario,
							@clave,
							   'A')

END
GO

exec test_insertarHabilidad 'BO2' , '604350920'
go

CREATE PROC test_insertarHabilidad (@hab CHAR(3), @ced VARCHAR(50))
AS
BEGIN
	  IF EXISTS ( SELECT hab_id FROM test_habilidades)
		IF EXISTS (SELECT usu_ced FROM test_usuario where usu_ced=@ced)
      INSERT INTO test_habilidades_usuario (habilidades_usuario_usuCed, habilidades_usuario_habId, habilidades_usuario_activo) VALUES (@ced, @hab, 'A')
END
GO

EXEC test_actualizar 'ADM', 'Shadya Mora Mata', 'shadya1996@hotmail', 'NAC', '604350920', 'sha96', 'KOKa1234'
GO

CREATE PROC test_actualizar (@tipo CHAR (3),
							 @nombreCompleto VARCHAR(100),
						     @correo VARCHAR(100),
							 @tipoIdent CHAR(3),
						     @ced VARCHAR(50),
						     @usuario VARCHAR(50),
						     @clave VARCHAR(50))
AS 
BEGIN

IF EXISTS (SELECT usu_ced FROM test_usuario where usu_ced=@ced)
	UPDATE test_usuario SET usu_tipoUsuario=@tipo,
							usu_nombreCompleto=@nombreCompleto,
							usu_correo=@correo,
						    usu_usuario=@usuario,
						    usu_clave=@clave
					    WHERE usu_ced=@ced and usu_activo='A'
END
GO

EXEC test_mostrar
GO

CREATE PROC test_mostrar 
AS
BEGIN
	SELECT usu_ced, usu_tipoUsuario, usu_nombreCompleto ,usu_correo, usu_tipoIdent,usu_usuario
	FROM test_usuario WHERE usu_activo='A'
END
GO

EXEC test_mostrarHabilidades 
GO

CREATE PROC test_mostrarHabilidades 
AS
BEGIN
	SELECT hab_nombre
	FROM dbo.test_habilidades
END
GO

exec test_eliminar '604350920'
GO 

CREATE PROC test_eliminar (@ced VARCHAR(50))
AS
BEGIN
	IF EXISTS (SELECT usu_ced FROM test_usuario WHERE usu_ced=@ced)
			UPDATE test_usuario SET usu_activo='I' WHERE usu_ced=@ced SELECT 'Exito'
END
GO
