create database TP_BaseDeDatos;

create table Reino (
nombre varchar (40) not null,
cant_habitantes integer not null,
continente varchar (30) not null,
posicion varchar (15) not null,
primary key (nombre)
);

create table Profesion (
nombre varchar (40) not null,
tipo varchar (30) not null,
primary key (nombre)
);

create table Casa (
nombre varchar (50) not null,
lema varchar (200) not null,
animal varchar (30) not null,
color varchar (30) not null,
religion varchar (40) not null,
fecha_fund date not null,
nombre_reino varchar (40) not null,
primary key (nombre),
foreign key (nombre_reino) references Reino (nombre)
);

create table Especie (
nombre_cienti varchar (40) not null,
hostil bit not null,
existe bit not null,
primary key (nombre_cienti)
);

create table Estado(
tipo varchar (10) not null,
primary key (tipo)
);

create table Personaje (
nombre varchar (50) not null,
año_nac date not null,
bastardo bit not null,
estado varchar (10) not null,
nombre_cienti varchar (40),
nombre_casa varchar (50) not null,
padre_es varchar (50),
padre_año date,
madre_año date,
madre_es varchar (50),
primary key (nombre, año_nac),
foreign key (nombre_cienti) references Especie(nombre_cienti),
foreign key (nombre_casa) references Casa(nombre),
foreign key (padre_es,padre_año) references Personaje(nombre,año_nac)
);

alter table Personaje add constraint foreign key(madre_es,madre_año) references Personaje(nombre,año_nac);
alter table Personaje add constraint foreign key(estado) references Estado (tipo);

create table Ciudad (
nombre varchar (50) not null,
extension_km integer not null,
nombre_reino varchar (40),
primary key (nombre),
foreign key (nombre_reino) references Reino (nombre)
);

create table Castillo (
nombre varchar (50) not null, 
fortificación varchar (30) not null,
cant_sirvientes integer not null,
nombre_reino varchar (40) not null,
primary key (nombre, nombre_reino),
foreign key (nombre_reino) references Reino (nombre)
);

create table Maestro (
nombre varchar (40) not null,
nombre_pro varchar (40) not null,
primary key (nombre, nombre_pro),
foreign key(nombre_pro) references Profesion (nombre)
);

create table Guerra (
año_inicio date not null,
lugar varchar (50) not null,
muertes integer not null,
primary key (año_inicio, lugar)
);

create table Habilidad (
tipo varchar (30) not null,
nombre_cienti varchar (40) not null,
primary key (tipo, nombre_cienti),
foreign key (nombre_cienti) references Especie (nombre_cienti)
);

create table Ejerce (
fecha_ini date not null,
nombre varchar (50) not null,
año_nac date not null,
nombre_pro varchar (40) not null,
primary key (nombre, año_nac, nombre_pro),
foreign key(nombre_pro) references Profesion (nombre),
foreign key(nombre, año_nac) references Personaje (nombre, año_nac)
);

create table Participa(
nombre varchar (50) not null,
año_inicio date not null,
lugar varchar (50) not null,
gana bit not null,
primary key (nombre, lugar, año_inicio),
foreign key (nombre) references Casa (nombre),
foreign key (año_inicio, lugar) references Guerra (año_inicio, lugar)
);

insert into Reino values 
('Kingdom of The North', 40000, 'Westeros', 'Norte'),
('Kingdom of the Mountain and The Vale', 35000, 'Westeros', 'Este'),
('Kingdom of the Isles and the Rivers', 40000,'Westeros','Oeste'),
('Kingdom of The Rock', 60000, 'Westeros', 'Oeste'),
('Kingdom of the Reach', 120000, 'Westeros', 'Sur'),
('Kingdom of the Stormlands', 25000, 'Westeros', 'Sur'),
('Princedom of Dorne', 30000, 'Westeros', 'Sur');

insert into Casa values
('House Stark', 'Winter is coming', 'Lobo huargo', 'Gris', 'Antiguos Dioses', '0200.01.01', 'Kingdom of The North'),
('House Lannister', 'Hear me roar', 'Leon', 'Carmesí', 'Fe de los Siete', '0300.01.01', 'Kingdom of The Rock'),
('House Baratheon', 'Ours is the Fury', 'Ciervo', 'Amarillo', 'Señor de la Luz', '1100.01.01', 'Kingdom of the Stormlands'),
('House Targaryen', 'Fire and Blood', 'Dragon', 'Rojo', 'Dioses de Valyria', '0100.01.01', 'Kingdom of The Rock'),
('House Arryn', 'As High as Honor', 'Pajaro', 'Celeste', 'Fe de los Siete', '0350.01.01', 'Kingdom of the Mountain and The Vale'),
('House Tyrell', 'Growing Strong', 'Flor', 'Verde', 'Fe de los Siete', '0100.01.01', 'Kingdom of the Reach'),
('House Greyjoy', 'We Do Not Sow', 'Kraken', 'Negro', 'Dios Ahogado', '0400.01.01', 'Kingdom of the Isles and the Rivers'),
('House Martell', 'Unbowed, Unbent, Unbroken', 'Sol', 'Naranja', 'Fe de los Siete', '0200.01.01', 'Princedom of Dorne'),
('House Bolton', 'Our Blades Are Sharp', 'Hombre Desollado', 'Rosa', 'Fe de los Siete', '0800.01.01', 'Kingdom of The North');

insert into Especie values
('White Walker', 1, 1),
('Espectro', 1, 1),
('Hijo del Bosque', 0, 1),
('Humano', 0, 1),
('Gigante', 0, 0);

insert into Ciudad values
('Braavos', 200, null),
('Kingslanding', 100, 'Kingdom of The Rock'),
('Mereen', 200, null),
('Pentos', 100, null),
('Qarth', 300, null),
('Puerto Blanco', 50, 'Kingdom of The North'),
('Gold Garden', 300, 'Kingdom of the Reach');

insert into Habilidad values
('Reanimación', 'White Walker'),
('Insensibilidad', 'Espectro'),
('Naturaleza','Hijo del Bosque'),
('Inteligencia', 'Humano'),
('Fuerza', 'Gigante');

insert into Profesion values
('Forja', 'Herrería'),
('Erudición', 'Consejero'),
('Venta', 'Vendedor'),
('Cientifico', 'Ciencia'),
('Jefe de Guerra', 'Realeza'),
('Señor', 'Realeza');

insert into Estado values 
('Vivo'),
('Muerto'),
('Inactivo');

insert into Personaje values
('Daenerys Targaryen', '1550.01.01', 0, 'Vivo', 'Humano', 'House Targaryen', null, null, null, null),
('Eddard Stark', '1500.01.01', 0, 'Muerto', 'Humano', 'House Stark', null, null, null, null),
('Jon Snow', '1550.01.01', 1, 'Vivo', 'Humano', 'House Stark', 'Eddard Stark', '1500.01.01', null, null),
('Renly Baratheon', '1550.01.01', 0, 'Muerto', 'Humano', 'House Baratheon', null, null, null, null),
('Stannis Baratheon', '1530.01.01', 0, 'Inactivo', 'Humano', 'House Baratheon', null, null, null, null),
('Catelyn Stark', '1500.01.01', 0, 'Muerto', 'Hijo del Bosque', 'House Stark', null,null,null,null),
('Sansa Stark', '1560.01.01', 0, 'Vivo', 'Hijo del Bosque', 'House Stark', 'Eddard Stark', '1500.01.01', '1500.01.01', 'Catelyn Stark'),
('Arya Stark', '1560.01.01', 0, 'Vivo', 'Humano', 'House Stark', 'Eddard Stark', '1500.01.01', '1500.01.01', 'Catelyn Stark'),
('Lysa Arryn', '1500.01.01', 0, 'Inactivo', 'Humano', 'House Arryn', null,null,null,null),
('Ramsay Bolton', '1540.01.01', 0, 'Vivo', 'White Walker', 'House Bolton', null,null,null,null),
('Theon Greyjoy', '1550.01.01', 0, 'Vivo', 'Humano', 'House Greyjoy', null,null,null,null),
('Oberyn Martell', '1500.01.01', 0, 'Inactivo', 'Hijo del Bosque', 'House Martell', null, null, null, null),
('Olenna Tyrell', '1460.01.01', 0, 'Muerto', 'Humano', 'House Tyrell', null,null,null,null),
('Tywin Lannister', '1490.01.01', 0, 'Vivo', 'White Walker', 'House Lannister', null, null, null, null),
('Mamá Lannister', '1490.01.01', 0, 'Muerto', 'Espectro', 'House Lannister', null, null, null, null),
('Jamie Lannister', '1510.01.01', 0, 'Vivo', 'Humano', 'House Lannister','Tywin Lannister', '1490.01.01', '1490.01.01','Mamá Lannister'),
('Cersei Lannister', '1510.01.01', 0, 'Vivo', 'White Walker', 'House Lannister', 'Tywin Lannister', '1490.01.01', '1490.01.01','Mamá Lannister'),
('Joffrey Lannister', '1560.01.01', 0, 'Muerto', 'Espectro', 'House Lannister', 'Jamie Lannister', '1510.01.01', '1510.01.01', 'Cersei Lannister');

insert into Castillo values
('Winterfell', 'Invernalia', 400, 'Kingdom of The North'),
('Nido de Aguilas', 'Nido', 450, 'Kingdom of the Mountain and The Vale'),
('Harrenhal', 'Aguas y Rios', 300,'Kingdom of the Isles and the Rivers'),
('Casterly Rock', 'Reino de Roca', 700, 'Kingdom of The Rock' ),
('High Garden', 'Altojardín', 600, 'Kingdom of the Reach'),
('Bastion de las Tormentas', 'Ventromenta', 500, 'Kingdom of the Stormlands'),
('Lanza Del Sol', 'Solaris', 300, 'Princedom of Dorne');

insert into Maestro values
('Maestre Eldmon', 'Erudición'),
('Maestre Dart', 'Forja'),
('Maestre Enriq', 'Venta'),
('Maestre Lucid', 'Cientìfico'),
('Maestre Borsh', 'Jefe de Guerra'),
('Maestre Real', 'Señor');

insert into Guerra values
('0200.01.01', 'Roca Casterly', 10000),
('0700.01.01', 'Evenfrost', 3000),
('1200.01.01', 'La Muralla', 2000),
('0900.01.01', 'Durion', 500);

insert into Ejerce values 
('1530.01.01', 'Eddard Stark', '1500.01.01', 'Señor'),
('1520.01.01', 'Catelyn Stark', '1500.01.01', 'Erudición'),
('1560.01.01', 'Jon Snow', '1550.01.01', 'Forja'),
('1570.01.01', 'Arya Stark', '1560.01.01', 'Jefe de Guerra'),
('1570.01.01', 'Sansa Stark', '1560.01.01', 'Cientifico'),
('1560.01.01', 'Jon Snow', '1550.01.01', 'Venta'),
('1525.01.01', 'Jamie Lannister', '1510.01.01', 'Señor'),
('1525.01.01', 'Jamie Lannister', '1510.01.01', 'Venta'),
('1525.01.01', 'Jamie Lannister', '1510.01.01', 'Cientifico'),
('1525.01.01', 'Jamie Lannister', '1510.01.01', 'Erudición'),
('1525.01.01', 'Jamie Lannister', '1510.01.01', 'Jefe de Guerra'),
('1525.01.01', 'Jamie Lannister', '1510.01.01', 'Forja'),
('1525.01.01', 'Cersei Lannister', '1510.01.01', 'Señor');

insert into Participa values
('House Lannister', '0200.01.01', 'Roca Casterly', 0),
('House Targaryen', '0200.01.01', 'Roca Casterly', 1),
('House Stark', '0700.01.01', 'Evenfrost', 1),
('House Greyjoy', '0700.01.01', 'Evenfrost', 0),
('House Arryn', '0700.01.01', 'Evenfrost', 0),
('House Lannister', '1200.01.01', 'La Muralla', 0),
('House Stark', '1200.01.01', 'La Muralla', 1),
('House Baratheon', '1200.01.01', 'La Muralla', 0),
('House Lannister', '0900.01.01', 'Durion', 1),
('House Targaryen', '0900.01.01', 'Durion', 0);

/*1)¿Cuáles son las ciudades que no forman parte de ningún reino?*/
select *
from ciudad
where nombre_reino is null;

/*2)¿Qué casas son las más pacíficas? Se entiende que una casa es pacífica cuando nunca
participó de una guerra.*/
select *
from casa as c
where c.nombre not in 
(select distinct nombre
from participa);

/*3)Reporte de casas ordenado según cantidad de integrantes.*/
select c.nombre, count(p.nombre_casa) as cantidad_de_integrantes
from casa as c inner join personaje as p on c.nombre=p.nombre_casa
group by c.nombre
order by cantidad_de_integrantes desc;

/*4)Lista de los personajes más ricos, donde la riqueza se mide de acuerdo a la extensión
de los reinos que posee.*/
select p.nombre, ciu.extension_km
from personaje as p left join casa as c on p.nombre_casa=c.nombre
left join ciudad as ciu on c.nombre_reino=ciu.nombre_reino
order by ciu.extension_km desc;

#5)¿Qué personajes han tenido todas las profesiones disponibles?
select p.nombre
from personaje as p
where not exists 
(select *
from profesion as pro
where not exists 
(select * 
from ejerce as e
where p.nombre=e.nombre and p.año_nac=e.año_nac and pro.nombre=e.nombre_pro));

#6)¿Qué casas contemplan todas las profesiones?
select c.nombre
from casa as c
where not exists(select *
				 from profesion as p
                 where not exists(select *
								  from personaje as per
                                  inner join ejerce as e
                                  on e.nombre = per.nombre
                                  where per.nombre_casa = c.nombre
                                  and e.nombre_pro = p.nombre));
                                  
#7)Ranking de especies del último milenio por casa.
select e.nombre_cienti as Especie, count(p.nombre) as Cantidad_de_Personajes
from milenio, especie as e
inner join personaje as p
on p.nombre_cienti = e.nombre_cienti
where year(p.año_nac) > milenio
group by e.nombre_cienti
order by Cantidad_de_Personajes desc;

create view milenio
as select (max(year(p.año_nac))+20)-1000 as milenio
from personaje as p;

#8)¿Cuál es el costo de las guerras en vidas, durante el último milenio y su porcentaje respecto del total de vidas?
select sum(g.muertes) as Costo_Total_de_Vidas, g.lugar, ((suma*100)/sum(g.muertes)) as porcentaje
from milenio, guerra as g, 
(select sum(cantidad) as suma
from (select count(p.nombre) as cantidad, p.nombre_casa as casa
from personaje as p
group by p.nombre_casa
order by cantidad desc) as cantidad_vivos
where casa in 
(select distinct nombre
from participa)) as suma_pj_vivos
where year(g.año_inicio) > milenio
group by g.lugar;

/*select sum(cantidad) as suma, g.lugar
from (select count(p.nombre) as cantidad, p.nombre_casa as casa
from personaje as p
group by p.nombre_casa
order by cantidad desc) as cantidad_vivos, guerra as g
where casa in 
(select distinct nombre
from participa)
group by g.lugar*/

