create database CentroMedico;
use CentroMedico;

create table Especialidad(
id_especialidad INT PRIMARY KEY,
nombre varchar(70) unique not null,
piso int not null
);

create table Medico(
id_medico INT PRIMARY KEY,
nombre varchar(90) not null,
honorario Decimal(10,2) not null,
id_especialidad int,
foreign key (id_especialidad) references Especialidad(id_especialidad)
);

create table Paciente(
id_paciente int primary key,
nombre varchar(90) not null,
ciudad varchar(80) not null,
correo varchar(120)
);

create table Consulta(
id_consulta int primary key,
id_medico int not null,
id_paciente int not null,
fecha_consulta DATE not null,
costo decimal(10,2) not null,
observacion varchar(200),
foreign key (id_medico) references Medico(id_medico),
foreign key (id_paciente) references Paciente(id_paciente)
);

-- evitar honorarios negativos en Medico

alter table Medico
add constraint check_honorario check(honorario >= 0);


-- evitar costos negativos en Consulta

alter table Consulta 
add constraint check_costo check(costo >= 0);

-- evitar valores de piso menores que 1 en especialidad

alter table Especialidad
add constraint check_valorpiso check(piso >=1);

-- unique en paciente

Alter table paciente
add constraint cons_correo unique (correo);
