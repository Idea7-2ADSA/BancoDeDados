CREATE DATABASE IF NOT EXISTS ideabd;

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

insert into empresa values(null, 'McDonals', '42.591.651/0001-43');

insert into franquia values
(null, 'Mc1000', '01310-200', 'Bela Vista', '1811', '', 1),
(null, "McDonald's", '01310-100', 'Bela Vista', '810', '', 1),
(null, "McDonald's", '01310-928', 'Bela Vista', '2064', '', 1),
(null, "McDonald's", '06460-030', 'Tamboré', '669', '', 1),
(null, "McDonald's", '06090-023', 'Centro', '3330', '', 1),
(null, "McDonald's", '01502-001', 'Liberdade', '774', '', 1),
(null, "McDonald's", '03011-000', 'Brás', '440/442', '', 1);

insert into gerente values
(null, 'Maria Brasil', '123.456.789-01', '(11) 98765-4321', 'maria.brasil@gmail.com', 'maria123', 1, 1),
(null, 'Vitor Tigre', '987.654.321-02', '(21) 91234-5678', 'vitor.tigre@gmail.com', 'vitor123', 1, 1),
(null, 'Daniel Ricardo', '111.222.333-03', '(31) 99876-5432', 'daniel.ricardo@gmail.com', 'daniel123', 2, 1);

insert into tecnico values
(null, 'Gustavo Antunes', 'gustavo.antunes@gmail.com', 'gustavo123'),
(null, 'Julia Hikari', 'julia.hikari@gmail.com', 'julia123');

insert into totem values
(184329, null, 1, 1),
(597481, null, 1, 1),
(902173, null, 1, 1),
(375290, null, 1, 1),
(816453, null, 2, 1),
(470561, null, 2, 1),
(239846, null, 2, 1),
(682391, null, 2, 1),
(537104, null, 3, 1),
(128374, null, 3, 1),
(916527, null, 3, 1),
(304685, null, 3, 1),
(751239, null, 4, 1),
(847593, null, 4, 1),
(621908, null, 4, 1),
(439275, null, 4, 1),
(582613, null, 5, 1),
(760294, null, 5, 1),
(194736, null, 5, 1),
(835142, null, 5, 1),
(267483, null, 6, 1),
(948210, null, 6, 1),
(573821, null, 6, 1),
(310694, null, 6, 1),
(624159, null, 7, 1),
(789302, null, 7, 1),
(452170, null, 7, 1),
(901635, null, 7, 1);

insert into ajuste values
(null, '1', "00:00:00", null, 1),
(null, '1', "00:00:00", null, 2),
(null, '1', "00:00:00", null, 3),
(null, '1', "00:00:00", null, 4),
(null, '1', "00:00:00", null, 5),
(null, '1', "00:00:00", null, 6),
(null, '1', "00:00:00", null, 7);

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