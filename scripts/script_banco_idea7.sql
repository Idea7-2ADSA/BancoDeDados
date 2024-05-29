create database ideabd;

use ideabd;

create table empresa(
idEmpresa int primary key auto_increment,
nome varchar(45),
cnpj varchar(45)
)auto_increment = 0;

create table franquia(
idFranquia int primary key auto_increment,
nomeFranquia varchar(45),
cep varchar(45),
logradouro varchar(45),
numero varchar(45),
complemento varchar(45),
fkEmpresa int,
constraint foreign key (fkEmpresa) references empresa(idEmpresa)
)auto_increment = 0;

create table gerente(
idGerente int primary key auto_increment,
nome varchar(45),
cpf varchar(45),
telefone char(15),
email varchar(45),
senha varchar(45),
fkFranquia int,
fkEmpresa int,
constraint foreign key (fkFranquia) references franquia(idFranquia),
constraint foreign key (fkEmpresa) references empresa(idEmpresa)
)auto_increment = 0;

create table tecnico(
idTecnico int primary key auto_increment,
nome varchar(45),
email varchar(45),
senha varchar(45)
)auto_increment = 0;

create table chamado(
idChamado int primary key auto_increment,
dataHoraAbertura datetime,
dataHoraFechamento datetime,
statusChamado varchar(45),
fkTecnico int,
fkFranquia int,
fkEmpresa int,
constraint foreign key (fkTecnico) references tecnico(idTecnico),
constraint foreign key (fkFranquia) references franquia(idFranquia),
constraint foreign key (fkEmpresa) references empresa(idEmpresa)
);

create table totem(
codigoTotem int primary key,
hostName varchar(45),
fkFranquia int,
fkEmpresa int,
constraint foreign key (fkFranquia) references franquia(idFranquia),
constraint foreign key (fkEmpresa) references empresa(idEmpresa)
);

create table ajuste(
idAjuste int primary key auto_increment,
diaReinicializacao varchar(45),
horaReinicializacao time,
fkGerente int,
fkFranquia int,
constraint foreign key (fkGerente) references gerente(idGerente),
constraint foreign key (fkFranquia) references franquia(idFranquia)
);

create table relatorioReinicializacao(
idRelatorio int primary key auto_increment,
statusReinicializacao varchar(45),
dataHoraInicio datetime,
dataHoraFim datetime,
fkTotem int,
constraint foreign key (fkTotem) references totem(codigoTotem)
)auto_increment = 0;

create table relatorio(
idRelatorio int primary key auto_increment,
relatorioTotem varchar(1000),
dataHora datetime,
fkFranquia int,
fkEmpresa int,
constraint foreign key (fkFranquia) references franquia(idFranquia),
constraint foreign key (fkEmpresa) references empresa(idEmpresa)
)auto_increment = 0;

create table hardware(
idHardWare int primary key auto_increment,
tipo varchar(45),
fkTotem int,
constraint foreign key (fkTotem) references totem(codigoTotem)
)auto_increment = 0;

create table caracteristicaHardware(
idCaracteristica int primary key auto_increment,
tipo varchar(45),
dado varchar(45),
fkHardWare int,
fkTotem int,
constraint foreign key (fkHardWare) references hardware(idHardWare),
constraint foreign key (fkTotem) references totem(codigoTotem)
)auto_increment = 0;

create table dadosHardWare(
idDados int primary key auto_increment,
porcentagemUso long,
dataHora varchar(45),
nomeComponente varchar(45),
fkHardWare int,
fkTotem int,
constraint foreign key (fkHardWare) references hardware(idHardWare),
constraint foreign key (fkTotem) references totem(codigoTotem)
)auto_increment = 0;

create table alerta(
idAlerta int primary key auto_increment,
tipoAlerta varchar(45),
hardWareCorrespondente varchar(45),
diaDaSemana int,
dataAlerta date,
fkTotem int,
constraint foreign key (fkTotem) references totem(codigoTotem)
);

select * from empresa;
select * from franquia;
select * from gerente;
select * from tecnico;
select * from ajuste;
select * from totem;
select * from hardware;
select * from caracteristicaHardware;
select * from dadosHardWare;
select * from alerta; 

CREATE USER 'usuario'@'localhost' IDENTIFIED BY 'usuario';
GRANT insert, select, update, delete on ideabd.* TO 'usuario'@'localhost';
FLUSH PRIVILEGES;