use mountainhikedef;
insert into admin (email, contraseña) values('flor@gmail.com', aes_encrypt('1234', 'xyz999'));
insert into admin (email, contraseña) values
('Ana@gmail.com', aes_encrypt('1234', 'xyz999')),
('Juanpi@gmail.com', aes_encrypt('1234', 'xyz999')),
('Kevin@gmail.com', aes_encrypt('1234', 'xyz999'));
select * from admin;

insert into blog (fecha, titulo, cuerpo, admin_id_admin) values
('5 de Octubre', 'El cerro champaqui con nieve y como nunca lo viste', 'Ocurrió en la última nevada cuando un grupo escalaba la montaña con guias de turismo...',1);

alter table blog modify column titulo varchar(250);
alter table blog modify column cuerpo varchar(250);

select * from blog;

insert into blog (fecha, titulo, cuerpo, admin_id_admin) values
('25 de Septiembre', 'El paisaje milenario que podés descubrir en Córdoba', 'Los Terrones: una zona de formaciones rocosas y arenisca formada en la prehistoria, que se puede conocer a pocos kilómetros de Capilla del Monte.',1),
('18 de agosto', 'Los primeros copos de nieve del invierno cayeron en Los Gigantes', 'Se precipitaron en la zona de las sierras grandes. La temperatura en el lugar es de 3 grados.',1);

select * from recorridos;
alter table recorridos change nivel descripcion VARCHAR(250);
alter table recorridos modify column descripcion varchar(1500);

insert into recorridos(descripcion) values ('En la zona de Capilla del Monte todo es, o parece, de otro planeta, y si bien los extraños paisajes del Parque Autóctono Cultural y Recreativo Los Terrones parecen una obra de extraterrestres, las curiosas formaciones rocosas son el producto de la erosión del agua y el viento durante millones de años.');

update recorridos set descripcion='En la zona de Capilla del Monte todo es, o parece, de otro planeta, y si bien los extraños paisajes del Parque Autóctono Cultural y Recreativo Los Terrones parecen una obra de extraterrestres, las curiosas formaciones rocosas son el producto de la erosión del agua y el viento durante millones de años.' where id_recorrido=1;
insert into guia (nombre, id_recorrido) values 
('Claudia Rodriguez',3),
('Fernando Perez',2),
('Romina Vazquez',2),
('Patricia Toledo',1);
select r.nombre_recorridos, g.nombre from recorridos r left join guia g on r.id_guia=g.id_guia;
select r.nombre, r.valor, g.nombre_guia from recorridos r left join guia g on r.id_guia=g.id_guia;
select * from guia;
alter table guia RENAME COLUMN nombre to nombre_guia;
alter table recorridos RENAME COLUMN nombre to nombre_recorridos;
select r.nombre_recorridos, r.valor, g.nombre_guia from recorridos r left join guia g on r.id_guia=g.id_guia;

