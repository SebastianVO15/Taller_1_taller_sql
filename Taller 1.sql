-- Taller 1 

-- Creacion de las tablas 

CREATE table departamento (
  id int,
  nombre varchar(20) not null,
  primary key (id)
);

create table municipio (
  id int, 
  id_departamento int not null,
  nombre varchar(20) not null,
  primary key (id),
  foreign key (id_departamento) references departamento(id)
);

create table homicidios (
  id int,
  id_municipio int not null,
  fecha date not null,
  genero varchar not null,
  edad float not null,
  grupo_edad varchar not null,
  numero_homicidios int not null,

  primary key (id),
  foreign key (id_municipio) references municipio (id),
  check (genero in ('MASCULINO', 'FEMENINO')),
  check (grupo_edad in ('ADULTOS','ADOLESCENTES','MENORES')),
  check (edad >= 0)
);

-- Poblacion de las tablas

insert into departamento values
  (13,'Bolívar'),
  (86,'Putumayo'),
  (25,'Cundinamarca'),
  (50,'Meta'),
  (54,'Norte de Santander'),
  (17,'Caldas'),
  (76,'Valle del Cauca'),
  (66,'Risaralda');

insert into municipio values 
  (13458,13,'Montecristo'),
  (86571,86,'Puerto Guzmán'),
  (25438,25,'Medina'),
  (50006,50,'Acacías'),
  (54001,54,'Cúcuta'),
  (17380,17,'La Dorada'),
  (86865,86,'Valle del Guamuez'),
  (76834,76,'Tuluá'),
  (66594,66,'Quinchía');

insert into homicidios values
  (0, 13458, '2013-11-20', 'MASCULINO', 54.0, 'ADULTOS', 1),
  (1, 86571, '2003-04-01', 'MASCULINO', 39.0, 'ADULTOS', 1),
  (2, 25438, '2007-05-06', 'MASCULINO', 39.0, 'ADULTOS', 1),
  (3, 50006, '2004-04-03', 'MASCULINO', 24.0, 'ADULTOS', 1),
  (4, 54001, '2016-08-07', 'MASCULINO', 28.0, 'ADULTOS', 1),
  (5, 17380, '2006-08-23', 'MASCULINO', 29.0, 'ADULTOS', 1),
  (6, 86865, '2016-07-24', 'MASCULINO', 17.0, 'ADOLESCENTES', 2),
  (7, 54001, '2011-04-15', 'MASCULINO', 66.0, 'ADULTOS', 1),
  (8, 76834, '2012-06-02', 'MASCULINO', 34.0, 'ADULTOS', 1),
  (9, 66594, '2009-08-12', 'MASCULINO', 36.0, 'ADULTOS', 1);


-- Lectura 

Select nombre from departamento;

Select nombre from municipio;

select id_municipio, numero_homicidios from homicidios;

select * from municipio
where id_departamento = 86;

select sum(numero_homicidios) from homicidios
where grupo_edad = 'ADOLESCENTES';

select id,nombre from municipio
  where id= 13458 or id= 25438;

select * from homicidios
  where id_municipio = 17380;

select * from homicidios
  where fecha between '2009-01-01' and '2016-12-31';

-- Actualizacion 



-- Eliminacion 

alter table homicidios
drop column grupo_edad;
select tc.table_name as tabla_hija, tc.constraint_name
from information_schema.table_constraints tc
join information_schema.constraint_column_usage ccu
  on tc.constraint_name = ccu.constraint_name
where tc.constraint_type = 'FOREIGN KEY'
  and ccu.table_name = 'departamento';

alter table departamento
delete from departamento;

select * from homicidios
where id_municipio= 13458 or id_municipio= 25438;
