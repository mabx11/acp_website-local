---================---
--- SCRIPT ARMANDO ---
---================---

-- Inserts Usuario --
INSERT INTO public.usuario(
	apellidos, contrasenia, email, estado, nombres, usuario, fechacreacion)
	VALUES ('Saldivar', 1234, 'iris@gmail.com', 1, 'Iris', 'iriS', '2021-04-16');
	
INSERT INTO public.usuario(
	apellidos, contrasenia, email, estado, nombres, usuario, fechacreacion)
	VALUES ('Cordero Montoya', 1234, 'armamo@gmail.com', 1, 'Armando Ernesto', 'Aecm', '2021-04-18');
	
INSERT INTO public.usuario(
	apellidos, contrasenia, email, estado, nombres, usuario, fechacreacion)
	VALUES ('Berríos', 1234, 'mabx@gmail.com', 1, 'Marcos', 'mabx11', '2021-04-18');
	
SELECT * FROM usuario;

-- Inserts Rol --
INSERT INTO public.rol(
	rol, roldescripcion, fechacreacion, estado)
	VALUES ('Administrador', 'Encargado de gestionar todo el Portal Web', '2020-04-01', 1);

INSERT INTO public.rol(
	rol, roldescripcion, fechacreacion, estado)
	VALUES ('Sub-administrador', 'Encargado de gestionar todo el Portal Web excepto la Seguridad', '2020-04-18', 1);

INSERT INTO public.rol(
	rol, roldescripcion, fechacreacion, estado)
	VALUES ('Pasante', 'Tiene ciertos permisos de gestion del Portal', '2020-04-18', 1);

	
SELECT * FROM rol;

-- Inserts Opciones --
INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('index.jsp', 'Home de la seccion administrativa', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('tblUsuarios.jsp', 'Interfaz que lista Usuarios', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('NuevoUsuario.jsp', 'Interfaz donde se agrega un nuevo Usuario', 1);
	
INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('EditarUsuario.jsp', 'Interfaz donde se actualiza Usuarios', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('tblRol.jsp', 'Interfaz que lista Roles', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('NuevoRol.jsp', 'Interfaz donde se agrega un nuevo rol', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('EditarRol.jsp', 'Interfaz donde se editan roles', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('tblOpciones.jsp', 'Interfaz que lista las Opcioens del portal', 1);
	
INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('tblRolUser.jsp', 'Interfaz que lista los usuarios con roles', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('NuevoRolUser.jsp', 'Interfaz donde se asignan roles a usuarios', 1);
	
INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('editRolUsuario.jsp', 'Interfaz donde se editan las asignaciones de roles a usuarios', 1);	

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('tblRolOpc.jsp', 'Interfaz que lista los roles con opciones', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('NuevoRolOpc.jsp', 'Interfaz donde se asignan opciones a roles', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('editRolOpc.jsp', 'Interfaz que actualiza las asignaciones de opciones a roles', 1);
	
INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('edicionSeccion.jsp', 'Interfaz que actualiza seccion del home', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('editRolOpc.jsp', 'Interfaz que actualiza las asignaciones de opciones a roles', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('servicios.jsp', 'Interfaz que gestiona los servicios del arboreto', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('NuevoServicio.jsp', 'Interfaz donde se guarda un nuevo servicio', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('EditarServicio.jsp', 'Interfaz que actualiza los servicios', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('tblRegion.jsp', 'Interfaz que lista las regiones', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('NuevaRegion.jsp', 'Interfaz donde se agregan nuevas regiones', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('EditarRegion.jsp', 'Interfaz que actualiza las regiones', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('publicaciones.jsp', 'Interfaz que gestiona publicaciones', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('tblPublicaciones.jsp', 'Interfaz que lista las publicaciones', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('NuevaPublicacion.jsp', 'Interfaz que guarda publicaciones', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('EditarPublicacion.jsp', 'Interfaz que actualiza publicaciones', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('documento.jsp', 'Interfaz que sube un documento a publicaciones', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('tblPais.jsp', 'Interfaz que lista paises', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('NuevoPais.jsp', 'Interfaz que guarda paises', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('EditarPais.jsp', 'Interfaz que actualiza paises', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('tblGenero.jsp', 'Interfaz que lista genero', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('NuevoGenero.jsp', 'Interfaz que agrega genero', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('EditarGenero.jsp', 'Interfaz que actualiza genero', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('tblFloracion.jsp', 'Interfaz que lista las espocas de floracion', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('tblFamilia.jsp', 'Interfaz que lista familias de arboles', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('NuevaFamilia.jsp', 'Interfaz que agrega familias de arboles', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('EditarFamilia.jsp', 'Interfaz que actualiza familias de arboles', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('tblEventos.jsp', 'Interfaz que lista los eventos', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('NuevoEvento.jsp', 'Interfaz que agrega eventos', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('EditarEventos.jsp', 'Interfaz que actualiza eventos', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('fotoEvento.jsp', 'Interfaz que guarda foto de evento', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('tblDistribucio.jsp', 'Interfaz que lista distribuciones', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('NuevaDistribucion.jsp', 'Interfaz que agrega distribuciones', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('EditarDistribucion.jsp', 'Interfaz que actualiza distribuciones', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('tblDistribucion.jsp', 'Interfaz que lista los arboles con distribucion asignada', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('NuevoArbolDistribucion.jsp', 'Interfaz que asigna una distribucion a arbol', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('EditarArbolDistribucion.jsp', 'Interfaz que actualiza las asiganaciones de distribuciones a arboles', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('tblArbol.jsp', 'Interfaz que lista arboles', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('NuevoArbol.jsp', 'Interfaz que agrega arboles', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('EditarArboles.jsp', 'Interfaz que actualiza arboles', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('fotoArbol.jsp', 'Interfaz donde se guarda una foto al arbol', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('EditarMision.jsp', 'Edita la seccion de Mision', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('EditarVision.jsp', 'Edita la seccion de Vision', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('EditarHistoria.jsp', 'Edita la seccion de Historia', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('EditarFooter.jsp', 'Edita la seccion de Footer', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('mapa.jsp', 'Interfaz que gestiona a mapa', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('tblServicios.jsp', 'Interfaz que servicios', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('arboles.jsp', 'Interfaz que servicios', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('eventos.jsp', 'Interfaz que servicios', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('tblArbolDistribucion.jsp', 'Interfaz que servicios', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('EditSelfUser.jsp', 'Intefaz de edición propia de usuario', 1);
	
INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('post.jsp', 'Pantalla que presenta la información de una publicación', 1);
	
INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('fotoPubli.jsp', 'Pantalla donde se gestiona la foto de una publicacion', 1);
	
INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('fotoBanner.jsp', 'Pantalla donde se gestiona la foto del Banner de la Home Page', 1);
	
INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('fotoMapa.jsp', 'Pantalla donde se gestiona la foto del Mapa de Arboles', 1);
	
insert into opciones(descripcion, estado, opcion) values ('Interfaz para editar el servicio seleccionado', 1, 'EditarServicio.jsp' );
insert into opciones(descripcion, estado, opcion) values ('Interfaz para visualizar lista de productos en venta', 1, 'tblProductos.jsp' );
insert into opciones(descripcion, estado, opcion) values ('Interfaz para agregar una nueva visita guiada', 1, 'NuevoServicio.jsp' );
	
INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('editPwd.jsp', 'Pantalla donde se gestiona el cambio de contraseña de usuario', 1);
	
INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('fotoServicio.jsp', 'Pantalla donde se gestiona la foto de un servicio', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('productos.jsp', 'Pantalla donde se visulizan los productos', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('vistaServicio.jsp', 'Pantalla donde se visuliza la información de un servicio', 1);
	
INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('tblTipoProd.jsp', 'Pantalla donde se gestionan los tipos de productos', 1);
	
INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('NuevoTipoProd.jsp', 'Pantalla donde se agrega un nuevo tipo de productos', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('EditarTipoProd.jsp', 'Pantalla donde se edita un tipo de productos', 1);	
	
INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('NuevoProducto.jsp', 'Pantalla donde se agrega un nuevo producto', 1);	

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('EditarProducto.jsp', 'Pantalla donde se edita un producto', 1);	
	
INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('vistaProducto.jsp', 'Pantalla donde se visuliza la información de un producto', 1);	

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('fotoProducto.jsp', 'Pantalla donde se gestiona la foto de un producto', 1);	
	
SELECT * FROM opciones;

---===============---
--- SCRIPT MARCOS ---
---===============---

-- Inserts RolUsuario --
INSERT INTO public.rol_usuario(
	usuarioid, rolid, fechacreacion)
	VALUES (1, 1, '2021-04-16 00:00:00');
	
INSERT INTO public.rol_usuario(
	usuarioid, rolid, fechacreacion)
	VALUES (2, 3, '2021-04-18 00:00:00');
	
INSERT INTO public.rol_usuario(
	usuarioid, rolid, fechacreacion)
	VALUES (3, 2, '2021-04-18 00:00:00');

SELECT * FROM rol_usuario;

-- Inserts RolOpciones --
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 1, '2021-04-16 00:00:00');
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 2, '2021-04-18 00:00:00');
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 3, '2021-04-18 00:00:00');

INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 4, '2021-04-18 00:00:00');

INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 5, '2021-04-18 00:00:00');
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 6, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 7, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 8, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 9, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 10, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 11, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 12, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 13, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 14, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 15, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 16, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 17, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 18, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 19, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 20, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 21, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 22, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 23, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 24, '2021-04-18 00:00:00');	
	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 25, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 26, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 27, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 28, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 29, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 30, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 31, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 32, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 33, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 34, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 35, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 36, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 37, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 38, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 39, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 40, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 41, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 42, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 43, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 44, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 45, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 46, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 47, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 48, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 49, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 50, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 51, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 52, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 53, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 54, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 55, '2021-04-18 00:00:00');

INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 56, '2021-04-18 00:00:00');
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 57, '2021-04-18 00:00:00');

INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 58, '2021-04-18 00:00:00');

INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 59, '2021-04-18 00:00:00');
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 60, '2021-04-18 00:00:00');
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 61, '2021-04-18 00:00:00');
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 62, '2021-04-18 00:00:00');
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 63, '2021-04-18 00:00:00');
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 64, '2021-04-18 00:00:00');

INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 65, '2021-04-18 00:00:00');
	
insert into rol_opciones(fechacreacion, opcionesid, rolid) values (current_timestamp, 66, 1);
insert into rol_opciones(fechacreacion, opcionesid, rolid) values (current_timestamp, 67, 1);
insert into rol_opciones(fechacreacion, opcionesid, rolid) values (current_timestamp, 68, 1);

INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 69, '2021-04-18 00:00:00');
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (2, 69, '2021-04-18 00:00:00');
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 70, '2021-04-18 00:00:00');

INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 71, '2021-04-18 00:00:00');

INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 72, '2021-04-18 00:00:00');

INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 73, '2021-04-18 00:00:00');
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 74, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 75, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 76, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 77, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 78, '2021-04-18 00:00:00');	
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 79, '2021-04-18 00:00:00');		

SELECT * FROM rol_opciones;

-- VW_RolUsuario --
CREATE OR REPLACE VIEW vw_rolusuario AS
SELECT rol_usuario.rol_usuarioid AS "ID", usuario.usuarioid, usuario.usuario AS "Usuario", 
usuario.nombres AS "Nombres", usuario.apellidos AS "Apellidos", usuario.contrasenia, 
rol.rolid, rol.rol AS "Rol", usuario.key_encriptacion, usuario.cod_verificacion, usuario.estado
FROM rol_usuario, usuario, rol
WHERE rol_usuario.usuarioid = usuario.usuarioid AND rol_usuario.rolid = rol.rolid 
AND usuario.estado<>3 AND rol.estado<>3;

SELECT * FROM vw_rolusuario;

-- VW_RolOpciones --
CREATE OR REPLACE VIEW VW_RolOpciones AS 
SELECT rol_opciones.rol_opcionesid AS "ID", rol.rolid, rol.rol AS "Rol", 
opciones.opcionesid, opciones.opcion AS "Opcion"
FROM rol_opciones, opciones, rol
WHERE rol_opciones.opcionesid = opciones.opcionesid AND rol_opciones.rolid = rol.rolid
AND opciones.estado<>3 AND rol.estado<>3;

SELECT * FROM VW_RolOpciones;
---===================---
--- SCRIPT JACQUELINE ---
---===================---

-- Inserts Inicio --
INSERT INTO public.home (mision, vision, historia, descrip_pag, usuarioid, fechamodificacion) 
VALUES ('Esta es nuestra mision', 'Esta es nuestra vision', 'Esta es nuestra historia', 
'Descripcion de la pagina' , 1, '2021-04-19');

-- Update Inicio --
UPDATE home SET mision='Aumentar y divulgar el conocimiento sobre las plantas de Nicaragua para contribuir al desarrollo sostenible del país mediante la investigación botánica - básica e interdisciplinaria - y el resguardo de la mayor colección de especímenes botánicos de Nicaragua.', 
vision='Consolidarse como el Herbario nacional de referencia por excelencia a nivel nacional e internacional logrando que el conocimiento de las especies de flora esté al servicio de la sociedad nicaragüense y en especial de los grupos más vulnerables, mediante la investigación y la innovación.', 
historia='El Herbario Nacional es un patrimonio científico de Nicaragua. Desde sus inicios en 1977, la idea de constituir un Herbario Nacional recibió apoyo tanto nacional como internacional. Gracias al liderazgo de la Universidad Centroamericana, apoyo de las autoridades nacionales y del Missouri Botanical Garden se llevó a cabo el proyecto de Flora de Nicaragua, cuyos resultados se publicaron en 2001 y 2009.' WHERE homeid=1;

insert into info_footer (direccion, telefono, extencion, correo, descripcion, usuarioid)
values ('Universidad Centroamericana', 22222222, '001', 'arboreto@gmail.com', 'Informacion de footer', 1);


alter table info_footer
  add direccion varchar NULL;

---=============---
--- SCRIPT YARÓ ---
---=============---

-- VW_PaisRegion --
CREATE OR REPLACE VIEW VW_PaisRegion AS 
SELECT pais.paisid AS "ID", pais.nombre AS "Pais", 
pais.estado AS "Estado".
region.nombre AS "Region"
FROM pais, region
WHERE pais.regionid = region.regionid;

SELECT * FROM VW_PaisRegion;

-- VW_Distribucion --
CREATE OR REPLACE VIEW VW_Distribucion AS 
SELECT distribucion.distribucionid AS "ID",distribucion.nombre AS "Distribucion", 
distribucion.descripcion AS "Descripcion",
distribucion.estado AS "Estado",
pais.nombre AS "Pais"
FROM distribucion, pais
WHERE distribucion.paisid = pais.paisid;

SELECT * FROM VW_Distribucion;

-- VW_Arbol OLD --
CREATE OR REPLACE VIEW VW_Arbol AS 
SELECT arbol.arbolid AS "ID",
arbol.nombrecientifico AS "NombreCientifico",
arbol.nombrecomun AS "NombreComun", 
arbol.descripcion AS "Descripcion",
arbol.estado AS "Estado",
familia.nombre AS "Familia",
arbol.imagen AS "Foto",
genero.nombre AS "Genero",
floracion.nombre AS "EpocaFloracion"
FROM arbol, familia, genero, floracion
WHERE arbol.familiaid = familia.familiaid 
AND arbol.generoid = genero.generoid
AND arbol.floracionid = floracion.floracionid;

-- VW_ARBOL CAMBIO --
CREATE OR REPLACE VIEW VW_Arbol AS
SELECT arbol.arbolid AS "ID", -- el id de la tabla arbol --
arbol.nombrecientifico AS "NombreCientifico",
arbol.nombrecomun AS "NombreComun", 
arbol.descripcion AS "Descripcion",
arbol.estado AS "Estado",
familia.nombre AS "Familia",
arbol.imagen AS "Foto",
genero.nombre AS "Genero",
floracion.nombre AS "EpocaFloracion"
 distribucion.descripcion AS "NombreDistribucion"
FROM arbol,familia,genero,floracion,distribucion, arbol_distribucion
WHERE arbol.familiaid = familia.familiaid 
AND arbol.generoid = genero.generoid
AND arbol.floracionid = floracion.floracionid
AND arbol.arbolid = arbol_distribucion.arbolid
AND arbol_distribucion.distribucionid = distribucion.distribucionid;


 -- VW_ARBOL NEW --
CREATE OR REPLACE VIEW VW_Arbol AS
SELECT arbol.arbolid AS "ID", -- el id de la tabla arbol --
arbol.nombrecientifico AS "NombreCientifico",
arbol.nombrecomun AS "NombreComun", 
arbol.descripcion AS "Descripcion",
arbol.estado AS "Estado",
familia.nombre AS "Familia",
arbol.imagen AS "Foto",
genero.nombre AS "Genero",
floracion.nombre AS "EpocaFloracion",
distribucion.descripcion AS "NombreDistribucion"
FROM arbol,familia,genero,floracion,distribucion, arbol_distribucion
WHERE arbol.familiaid = familia.familiaid 
AND arbol.generoid = genero.generoid
AND arbol.floracionid = floracion.floracionid
AND arbol_distribucion.arbolid = arbol.arbolid
AND arbol_distribucion.distribucionid = distribucion.distribucionid;


SELECT * FROM VW_Arbol;




-- Inserts Region --
    INSERT INTO public.region(
	nombre, estado, fechacreacion)
	VALUES ('Sur América', 1, '2021-04-17');
	
	INSERT INTO public.region(
	nombre, estado, fechacreacion)
	VALUES ('Centroamerica', 1, '2021-04-17');
	
	INSERT INTO public.region(
	nombre, estado, fechacreacion)
	VALUES ('Norte América', 1, '2021-04-17');
	
	-- Inserts Pais --
    INSERT INTO public.pais(
	nombre, estado, regionid, fechacreacion)
	VALUES ('Venezuela', 1, 1, '2021-04-17');
	
	  INSERT INTO public.pais(
	nombre, estado, regionid, fechacreacion)
	VALUES ('Perú', 1, 1, '2021-04-17');
	
	  INSERT INTO public.pais(
	nombre, estado, regionid, fechacreacion)
	VALUES ('Brasil', 1, 1, '2021-04-17');

-- Inserts Distribucion --
    INSERT INTO public.distribucion(
	nombre, estado, descripcion, paisid, fechacreacion)
	VALUES ('O Venezuela', 1, 'Desde el oeste de Venezuela hasta al norte de Perú' ,1, '2021-04-17');
	
	-- Inserts Familia --
    INSERT INTO public.familia(
	nombre, estado, descripcion, fechacreacion)
	VALUES ('Juglandaceae', 1, 'Las Juglandaceae son una familia de plantas conocida como la familia de las nueces. Los miembros de esta familia son nativos de América , Eurasia y el sudeste asiático .' , '2021-04-17');
	
		
-- Inserts Genero --
    INSERT INTO public.genero(
	nombre, estado, descripcion, fechacreacion)
	VALUES ('Juglans', 1, 'Los nogales son cualquier especie de árbol del género de plantas Juglans , el género tipo de la familia Juglandaceae , cuyas semillas se conocen como nueces.' , '2021-04-17');
	
		
	-- Inserts Floracion --
    INSERT INTO public.floracion(
	nombre, temporada, estado, descripcion)
	VALUES ('Primavera', 'Marzo 20 - Junio 21 ', 1, 'En esta época del año, comienzan a salir las flores y crecen las hojas en los árboles.');
	
	INSERT INTO public.floracion(
	nombre, temporada, estado, descripcion)
	VALUES ('Verano', 'Junio 21 - Septiembre 22', 1, 'El verano es la temporada con mayor calor, los días son más largos porque el Sol proporciona luz directa a la Tierra. ');
	
	INSERT INTO public.floracion(
	nombre, temporada, estado, descripcion)
	VALUES ('Otoño', 'Septiembre 22 - Dieciembre 21', 1, 'El otoño es la estación del año donde desciende la temperatura, las hojas de los árboles pierden su color verde y comienzan a caer.');
	
	INSERT INTO public.floracion(
	nombre, temporada, estado, descripcion)
	VALUES ('Invierno', 'Diciembre 21 - Marzo 20', 1, 'Es una estación donde hace más frío, incluso cae nieve en algunas regiones. Los días son más cortos pues el Sol proporciona luz indirecta a la Tierra.');
	
	INSERT INTO public.floracion(
	nombre, temporada, estado, descripcion)
	VALUES ('Verano HS', 'Diciembre 21 - Junio 21', 1, 'Epoca de Verano en el Hemisferio Sur.');
	
	INSERT INTO public.floracion(
	nombre, temporada, estado, descripcion)
	VALUES ('Invierno HS', 'Junio 21 - Diciembre 21', 1, 'Epoca de Invierno en el Hemisferio Sur.');
	
	-- Inserts Arbol --
    INSERT INTO public.arbol(
	nombrecientifico, nombrecomun, estado, descripcion, familiaid, generoid, floracionid, fechacreacion)
	VALUES ('Juglans neotropica', 'Cedro negro', 1, 'Miden 40 cm de largo por 25 cm de ancho, con 12 pares folíolos de borde aserrado y asimétricos. Requiere de suelos profundos, fértiles y bien drenados.Su madera es moderadamente pesada, se emplea para elaborar enchapes, carpintería, ebanistería fina , pisos y en construcción.', 1, 1, 5, '2021-04-17');
	
	INSERT INTO public.mapa(
	estado, nombre)
	VALUES (1, 'Version 1.0 Mapa')

---==============---
--- SCRIPT LAURA ---
---==============---

	
-- Inserts Region --
    INSERT INTO public.region(
	nombre, estado, fechacreacion)
	VALUES ('Asia Occidental ', 1, '2021-04-19');
	
-- Inserts Pais --
	INSERT INTO public.pais(
	nombre, estado, regionid, fechacreacion)
	VALUES ('Arabia Saudita', 1, 4, '2021-04-19');
	
-- Inserts Distribucion --
    INSERT INTO public.distribucion(
	nombre, estado, descripcion, paisid, fechacreacion)
	VALUES ('Oriente Medio', 1, 'Es la región aproximadamente equivalente al suroeste de Asia.' ,4, '2021-04-19');

-- Inserts Familia --
    INSERT INTO public.familia(
	nombre, estado, descripcion, fechacreacion)
	VALUES ('Rosaceae', 1, 'Las Rosaceaes son un gran número de plantas leñosas y herbáceas, muy estimada principalmente por sus árboles y arbustos frutales, así como por numerosas especies de valor ornamental. ', '2021-04-19');
	
-- Inserts Genero --
	INSERT INTO public.genero(
	nombre, estado, descripcion, fechacreacion)
	VALUES ('Prunus', 1, 'Prunus es un género de árboles y arbustos de la familia Rosaceae, que incluye varias especies cultivadas por sus frutos.' , '2021-04-19');

-- Inserts Arbol --
	INSERT INTO public.arbol(
	nombrecientifico, nombrecomun, estado, descripcion, familiaid, generoid, floracionid, usuarioid, fechacreacion)
	VALUES ('Prunus dulcis', 'Almendro', 1, 'Puede alcanzar hasta 10 m. de altura, 
			pero generalmente se le mantiene más bajo mediante poda. La corteza de 
			sus ramitas jóvenes es verde, se vuelve violácea donde recibe la luz 
			solar directa; a partir del segundo año se vuelve gris, y se va oscureciendo 
			progresivamente.', 2, 2, 4, 1, '2021-04-19');
			
	INSERT INTO public.arbol(
	nombrecientifico, nombrecomun, estado, descripcion, familiaid, generoid, floracionid, usuarioid, fechacreacion)
	VALUES ('Juglans regia', 'Nogal', 1, 'Es un árbol caducifolio que llega a los 25m 
			de altura con un tronco que puede superar los 2 m de diámetro. De este tronco, 
			que es corto y robusto y de color blanquecino o gris claro, salen gruesas y 
			vigorosas ramas para formar una copa grande y redondeada.', 1, 1, 1, 1, '2021-04-19');
	
			
--- Inserts arbol_distribucion ---
	insert into arbol_distribucion (arbolid, distribucionid) values (7, 1);
	insert into arbol_distribucion (arbolid, distribucionid) values (8, 1);
	
--- VW_Distribucion DistribucionArbol ---
CREATE OR REPLACE VIEW VW_DistribucionArbol AS
	SELECT 
	arbol_distribucion.arbol_distribucionid AS "ID",
	arbol.nombrecomun AS "NombreArbol",
	distribucion.nombre AS "NombreDistribucion"
	FROM arbol, distribucion, arbol_distribucion
	WHERE arbol_distribucion.arbolid = arbol.arbolid AND arbol_distribucion.distribucionid = distribucion.distribucionid;
	
	SELECT * FROM VW_DistribucionArbol;

---==============---
--- SCRIPT LUISA ---
---==============---

--- Inserts Servicios ---
INSERT INTO public.servicios(
	nombre, foto, descripcion, fechacreacion, estado, disponibilidad)
	VALUES ('Venta de semillas', 'imagen.png', 
			'Ofrecemos una gran variedad de semillas...', '2021-04-18 00:00:00',1, "Disponible");

INSERT INTO public.servicios(
	nombre, foto, descripcion, fechacreacion, estado, disponibilidad)
	VALUES ('Visitas Guiadas', 'imagen.png', 
			'Ofrecemos un servicio de recorrido dentro...', '2021-04-18 00:00:00',1, "Disponible");
	
INSERT INTO public.servicios(
	nombre, foto, descripcion, fechacreacion, estado, disponibilidad)
	VALUES ('Charlas', 'imagen.png', 
			'Como parte de nuestros servicios, damos...', '2021-04-18 00:00:00',1, "Disponible");
	
SELECT * FROM servicios;

--- Inserts Tipo Producto ---

INSERT INTO public.tipoproducto(
	tipoproducto, descripcion, fechacreacion, estado)
	VALUES ('Semilla de flor', 'Semillas que germinan flores', 
			'2021-04-18 00:00:00', 1);

INSERT INTO public.tipoproducto(
	tipoproducto, descripcion, fechacreacion, estado)
	VALUES ('Semilla de arbol', 'Semillas que germinan arboles', 
			'2021-04-18 00:00:00', 1);

SELECT * FROM tipoproducto;

--- Inserts Catalogo de Productos ---

INSERT INTO public.catalogodeproductos(
	nombre, tipoproductoid, foto, descripcion,fechacreacion, estado, disponibilidad)
	VALUES ('Semilla de Marango', 2, 'imagen.png', 'Semilla del Arbol de Marango, que...',
			'2021-04-18 00:00:00', 1, 'Disponible');

INSERT INTO public.catalogodeproductos(
	nombre, tipoproductoid, foto, descripcion,fechacreacion, estado, disponibilidad)
	VALUES ('Semilla de Girasol', 1, 'imagen.png', 'Semilla de flor de Girasol, que...',
			'2021-04-18 00:00:00', 1, 'No disponible');

SELECT * FROM catalogodeproductos;

CREATE OR REPLACE VIEW VW_Productos AS
SELECT catalogodeproductos.catalogodeproductosid AS "ID", catalogodeproductos.nombre AS "Nombre",
tipoproducto.tipoproducto AS "TipoProducto", catalogodeproductos.foto AS "Foto", catalogodeproductos.descripcion AS "Descripcion",
catalogodeproductos.disponibilidad AS "Disponibilidad", catalogodeproductos.estado AS "Estado"
FROM catalogodeproductos, tipoproducto
WHERE catalogodeproductos.tipoproductoid = tipoproducto.tipoproductoid;

SELECT * FROM VW_Productos;

--INSERTS PUBLICACIONES--

INSERT INTO public.publicaciones(
	descripcion, estado, fechacreacion, titulo, tipopubli)
	VALUES ('Investigación de especímenes descubiertos en zonas secas de la zona central de Nicaragua', 
			1, '2021-05-26 00:00:00', 'Investigación de especímenes', 'Visible');
			
INSERT INTO public.publicaciones(
	descripcion, estado, fechacreacion, titulo, tipopubli)
	VALUES ('Recopilación de ejecución de brigadas enfocadas en salvaguardar la flora del Atlántico Norte', 
			1, '2021-05-26 00:00:00', 'Recopilación flora y fauna del Atlántico', 'Visible');

SELECT * FROM public.publicaciones;



