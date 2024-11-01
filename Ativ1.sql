create database bd_exporta;
use bd_exporta;
create table departamento (
id int primary key auto_increment not null,
nome varchar(50),
locali varchar(50),
orcam decimal (10,2)
);
desc departamento;

insert into departamento (nome, locali, orcam) 
values ("Giovana","SESI",10000),
("Matarato","SENAI",17000),
("Elias","SHOPPING",20000),
("Lucas E","CASAS-BAHIA",100000),
("Isabella","UBER",10000),
("Guhneli","Festa",30000);

SHOW VARIABLES LIKE 'secure_file_priv';


select * from departamento
into outfile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\depto2.csv'
fields terminated by ',' enclosed by '"'
lines terminated by '\n';

SET SQL_SAFE_UPDATES=0;

delete from departamento; 

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\depto.csv'
into table departamento
fields terminated by ',' enclosed by '"'
lines terminated by '\n';

start transaction;

-- Aumentar o orcamento do departamento do ti em 1000
update departamento set orcam = orcam + 1000.0 where nome = 'TI';

-- Aumentar o orcamento do departamento do financiero em 1000
update departamento set orcam = orcam + 1000.0 where nome = 'Financeiro';

-- confirmar a tranação
commit;