CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE fluxos (
id serial primary key,
nome_fluxo varchar(255) not null
);

CREATE TABLE categorias (
id serial primary key,
nome_categoria varchar(255) not null);

CREATE TABLE fornecedores (
id serial primary key,
nome varchar (255) not null,
endereco varchar (255) not null,
bairro varchar (255) not null,
cidade varchar (255) not null,
email varchar (255) not null,
cep int not null,
telefone int not null,
cnpj int not null unique);

CREATE TABLE clientes (
id serial primary key,
nome_cliente varchar (255) not null,
endereco varchar (255) not null,
bairro varchar (255) not null,
cidade varchar (255) not null,
email varchar (255) not null,
cep int not null,
telefone int not null,
cpf int not null unique);

CREATE TABLE usuarios (
id serial primary key,
nome_usuário varchar(255) not null,
login varchar(40) not null unique,
email varchar(255) not null,
telefone int not null,
cpf int not null unique);

CREATE TABLE produtos (
id serial primary key,
nome_produto varchar (255) not null,
descricao varchar (255) not null,
id_categoria int references categorias(id),
estoque_minimo int not null,
estoque_maximo int not null,
id_fornecedor int references fornecedores(id),
preco_custo float not null,
preco_venda float not null
);

CREATE TABLE vendas (
id serial primary key,
id_cliente int  references clientes(id),
valor_total float not null,
desconto float not null,
data_venda timestamp not null);

CREATE TABLE itens_vendas (
id serial primary key,
id_produto int  references produtos(id),
id_venda int  references vendas(id),
quantidade_vendida int not null,
valor_unitário float not null,
id_fluxo int  references fluxos(id));

CREATE TABLE compras (
id serial primary key,
id_compra int  references vendas(id),
id_fornecedor int  references fornecedores(id),
valor_total float not null,
data_venda timestamp not null);

CREATE TABLE itens_compras (
id serial primary key,
id_produto int  references produtos(id),
quantidade int not null,
valor_unitário float not null,
id_fluxo int  references fluxos(id));

CREATE TABLE estoque (
id serial primary key,
id_produto int  references produtos(id),
quantidade int not null,
id_fluxo int  references fluxos(id)
);