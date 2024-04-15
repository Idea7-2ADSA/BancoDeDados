create database ideaBD;

use ideaBD;

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
fkTecnico int,
fkFranquia int,
fkEmpresa int,
constraint foreign key (fkTecnico) references tecnico(idTecnico),
constraint foreign key (fkFranquia) references franquia(idFranquia),
constraint foreign key (fkEmpresa) references empresa(idEmpresa)
);

create table totem(
idTotem int primary key auto_increment,
codigoTotem int,
fkFranquia int,
fkEmpresa int,
constraint foreign key (fkFranquia) references franquia(idFranquia),
constraint foreign key (fkEmpresa) references empresa(idEmpresa)
)auto_increment = 0;

create table reinicializacao(
idRelatorio int primary key auto_increment,
estado varchar(45),
dataHoraInicio datetime,
dataHoraFim datetime,
fkTotem int,
constraint foreign key (fkTotem) references totem(idTotem)
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
constraint foreign key (fkTotem) references totem(idTotem)
)auto_increment = 0;

create table caracteristicaHardware(
idCaracteristica int primary key auto_increment,
tipo varchar(45),
dado varchar(45),
fkHardWare int,
fkTotem int,
constraint foreign key (fkHardWare) references hardware(idHardWare),
constraint foreign key (fkTotem) references totem(idTotem)
)auto_increment = 0;

create table dadosHardWare(
idDados int primary key auto_increment,
uso varchar(45),
dataHora datetime,
fkHardWare int,
fkTotem int,
constraint foreign key (fkHardWare) references hardware(idHardWare),
constraint foreign key (fkTotem) references totem(idTotem)
)auto_increment = 0;



