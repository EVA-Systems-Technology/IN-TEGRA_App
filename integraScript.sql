drop database IntegraDB;
create database IntegraDB;
use IntegraDB;


-- TABELA DO cliente (SE EU SOFRER COM ALGO VAI FICAR ANOTADO AQUI):

create table tbCliente(
	IdCliente int primary key auto_increment,
	CpfCli int not null,
    NomeCli varchar(250) not null,
    EmailCli varchar(256) unique not null,
    TelefoneCli varchar(11),
    SenhaCli varchar(100) not null,
    NascCli date not null,
    Situacao char(1) not null
);

-- TABELA DO FUNC (SE EU SOFRER COM ALGO VAI FICAR ANOTADO AQUI):

create table tbFuncionario(
	IdFunc int primary key auto_increment,
    NomeFunc varchar(250) not null,
    EmailFunc varchar(256) unique not null,
    SenhaFunc varchar(100) not null,
    CpfFunc int unique not null,
    TipoFunc varchar(8) not null
);

-- TABELA DO LOGIN (SE EU SOFRER COM ALGO VAI FICAR ANOTADO AQUI):

create table tbLogin(
	IdLogin int primary key auto_increment,
	IdFunc int,
    IdCliente int,
    TipoLogin varchar(11),
    DataLogin datetime not null default current_timestamp,
    foreign key (IdFunc) references tbFuncionario(IdFunc),
    foreign key (IdCliente) references tbCliente(IdCliente)
);

create table tbProduto(
	IdProd int primary key auto_increment,
    NomeProd varchar(150) unique not null,
    DescProd varchar (700) not null,
    ImgProd varchar(700) not null,
    PrecoProd decimal(10,2) not null,
    QtdProd int not null,
    CategoriaProd varchar(150)  not null
);


create table tbPedido (
	IdPedido int primary key auto_increment,
    IdCliente int,
    FretePedido decimal (10,2) not null default 0,
    ValorPedido decimal(10,2) not null,
    ConfirmacaoPedido boolean not null default false,
    foreign key (Idcliente) references tbCliente(IdCliente)
);


create table tbPagamento (
	IdPagamento int primary key auto_increment,
    IdPedido int not null,
    ValorPagamento decimal (10,2) not null,
    DataHoraPagamento datetime null default current_timestamp ,
    TipoPagamento varchar(50) null,
    ConfirmacaoPagamento boolean default false,
    NfPagamento varchar(100) unique not null,
    foreign key (IdPedido) references tbPedido(IdPedido)
);

select * from tbCliente;
select * from tbCroduto;
select * from tbCuncionario;

insert into tbFuncionario (nomefunc, emailfunc, senhafunc, cpffunc, tipofunc) values ("admin", "admin@admin.com", "123", 12333, "G");

insert into tbProduto(NomeProd, DescProd, ImgProd, PrecoProd, QtdProd, CategoriaProd) values ("Cadeira de rodas xlr8", "Uma cadeira de rodas baseada na coloração do alien XLR8 do Ben 10", "image/cadeira.png", 1234.99, 23, "Mobilidade");

insert into tbProduto(NomeProd, DescProd, ImgProd, PrecoProd) values ("Garfo Adaptado", "um garfo adaptado para facilitar a praticidade de pessoas com deficiencias motoras ao se alimentarem! ", "image/garfo.png", 78.99);

insert into tbProduto(NomeProd, DescProd, ImgProd, PrecoProd) values ("Muletas 'The root'", "Par de muletas com tamanho ajustavel! ", "image/garfo.png", 83.99)


-- trigger de quando fizer login ele registra na tb login