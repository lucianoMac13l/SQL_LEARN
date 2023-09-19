/*-- comando para mostrar os banco de dados
show databases;
/*usar para comentar varias linhas*/
create database aula;
use	aula;
select database();
create table exemplo(
id int,
nome varchar(100)
);
show tables;
insert into exemplo(id, nome) values(1, 'ana');
select * from exemplo; -- ate aqui foi a aula 3 SQL NA PRATICA*/

-- AULA 03  SQL PK, FK, UK
-- criando uma tablea (table) e inserindo os dados 
use aula;
create table cidade (
id int primary key, /*  chave primaria*/
nome varchar(100), /* o varchar utiliza um limete variavel de caracteres, se a palavra inserida tiver apenas 3 char, ele usa apenas 4 espaços*/
sigla char(3)unique /* esse unique faz com que cada item de cada coluna seja unico e não possa ser repedido na tabela*/
);
--foi inserido os dados id nome e sigla na tabela cidade.
insert into cidade (id, nome, sigla)
values (1, 'guarapuava', 'gp');
-- o select * from mostra os dados da tabela
select * from  cidade

/*--insert into, insere os dados na tabela selecionada*/
insert into cidade (id, nome, sigla) values (1,'natal','nta');
insert into cidade (id, nome, sigla) values (2,'natal','nta');

select * from cidade;
insert into cidade (id, nome, sigla) values (3,'palmeirinha','nta');

-- aqui está sendo criado uma nova tabela cliente - com os dados id, nome e idCidade, que faz referencia a tabela anterior, ou seja, uma chave estrangeira foreign key ou FK
create table cliente (
id int primary key,
nome varchar(100),
idCidade int,
constraint fkClienteCidade foreign key (idCidade) /*o constrait é uma restrição de chave estrangeira que faz ligação com a tabela cidade*/
references cidade(id)
);

insert into cliente values(1,'luciano','1');
insert into cliente values(2,'izabella','2');

select * from cidade /*mostra os dados da tabela cidade*/
select * from cliente

/*###############################################################################################*/
/*criando nova tabela e fazendo alterções - AULA 3*/

select * from cidade

alter table cidade /*ALTERANDO A TABELA CIDADE, ADICIONANDO UMA COLUNA*/
add dddd char(05); /*ERRO PROPOSITAL*/

describe cidade

alter table cidade
change dddd ddd char(05);

describe cidade

alter table cidade
modify ddd char(03);

describe cidade

alter table cidade
add CepGeral char(09);

describe cidade

select * from cidade

insert into cidade (id, nome, sigla, ddd, CepGeral)
values(4,'campina da lagoa','cdl', 044, 87345000);	

select * from cidade

/*ALTERAR A TABELA CIDADE PARA AUTO INCREMENTO*/


