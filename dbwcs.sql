create database dbWCS;

CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40) NOT NULL,
    cpf CHAR(14) NOT NULL,
    rg CHAR(9),
    dataNasc DATE NOT NULL,
    sexo VARCHAR(15) NOT NULL,
    celular VARCHAR(15) NOT NULL,
    email VARCHAR(40)
)  ENGINE=INNODB;

CREATE TABLE Funcionario (
    idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40) NOT NULL,
    cpf CHAR(14) NOT NULL,
    rg CHAR(9) NOT NULL,
    dataNasc DATE NOT NULL,
    sexo VARCHAR(15) NOT NULL,
    celular VARCHAR(15) NOT NULL,
    email VARCHAR(40) NOT NULL,
    funcao VARCHAR(15),
    statusFuncionario varchar(15) not null
)  ENGINE=INNODB;

insert into Funcionario(nome, cpf, rg, dataNasc, sexo, celular, email, funcao, statusFuncionario)
values                 ('kayky', '038.030.345-45','2.333.233', '1984/12/12', 'masculino', '(21)12345-6789', 'rafaek@gmail.com', 'ti', 'ativo');


CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    login VARCHAR(30) NOT NULL,
    senha VARCHAR(30) NOT NULL,
    statusUsuario VARCHAR(15) NOT NULL,
    idFuncionario INT NOT NULL,
    FOREIGN KEY (idFuncionario)
        REFERENCES Funcionario (idFuncionario)
        ON UPDATE CASCADE
)  ENGINE=INNODB;

insert into Usuario (login, senha, statusUsuario, idFuncionario)
values              ('testeUsuario', '223131', 'ativo',1);


CREATE TABLE Profissional (
    idProfissional INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40) NOT NULL,
    cpf CHAR(14) NOT NULL,
    sexo VARCHAR(15) NOT NULL,
    profissao VARCHAR(35) NOT NULL
)  ENGINE=INNODB;

CREATE TABLE Profissao (
    idProfissao INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(30) NOT NULL
)  ENGINE=INNODB;

CREATE TABLE ProfissionalProfissao (
    idProfissional INT NOT NULL,
    idProfissao INT NOT NULL,
    FOREIGN KEY (idProfissional)
        REFERENCES Profissional (idProfissional) on update cascade,
    FOREIGN KEY (idProfissao)
        REFERENCES Profissao (idProfissao) on update cascade
)  ENGINE=INNODB;

CREATE TABLE Fornecedor (
    idFornecedor INT PRIMARY KEY AUTO_INCREMENT,
    nomeFantasia VARCHAR(30) NOT NULL,
    razaoSocial VARCHAR(30) NOT NULL,
    cnpj CHAR(14) NOT NULL,
    celular VARCHAR(13) NOT NULL,
    telefone VARCHAR(13) NOT NULL,
    email VARCHAR(50) NOT NULL,
    logradouro VARCHAR(20) NOT NULL,
    descLogradouro VARCHAR(50) NOT NULL,
    numero VARCHAR(15) NOT NULL,
    bairro VARCHAR(30) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    estado CHAR(2) NOT NULL,
    pais VARCHAR(25) NOT NULL,
    statusFornecedor VARCHAR(15) NOT NULL
)  ENGINE=INNODB;

CREATE TABLE Produto (
    idProduto INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(30) NOT NULL,
    marca VARCHAR(30) NOT NULL,
    unCompra CHAR(2) NOT NULL,
    unVenda CHAR(2) NOT NULL,
    precoCompra DECIMAL(10 , 2 ) NOT NULL,
    statusProduto VARCHAR(15) NOT NULL,
    observacao VARCHAR(100)
)  ENGINE=INNODB;

CREATE TABLE ProdutoFornecedor (
    idProduto INT NOT NULL,
    idFornecedor INT NOT NULL,
    FOREIGN KEY (idProduto)
        REFERENCES Produto (idProduto) on update cascade,
    FOREIGN KEY (idFornecedor)
        REFERENCES Fornecedor (idFornecedor) on update cascade
)  ENGINE=INNODB;

CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY AUTO_INCREMENT,
    dataPedido DATE NOT NULL,
    valorTotal DECIMAL(10 , 2 ) NOT NULL,
    idCliente INT NOT NULL,
    idUsuario INT NOT NULL,
    FOREIGN KEY (idCliente)
        REFERENCES Cliente (idCliente)
        ON UPDATE CASCADE,
    FOREIGN KEY (idUsuario)
        REFERENCES Usuario (idUsuario)
        ON UPDATE CASCADE
)  ENGINE=INNODB;

CREATE TABLE PedidoProduto (
    idPedido INT NOT NULL,
    idProduto INT NOT NULL,
    precoVenda DECIMAL(10 , 2 ) NOT NULL,
    quantidade INT NOT NULL,
    foreign key (idPedido) references Pedido(idPedido) on update cascade,
    foreign key (idProduto) references Produto(idProduto) on update cascade
)  ENGINE=INNODB;

CREATE TABLE Agendamento (
    idAgendamento INT PRIMARY KEY AUTO_INCREMENT,
    dataAgendamento DATE NOT NULL,
    statusAgendamento VARCHAR(15) NOT NULL,
    idCliente INT NOT NULL,
    idUsuario INT NOT NULL,
    idProfissional INT,
    FOREIGN KEY (idCliente)
        REFERENCES Cliente (idCliente)
        ON UPDATE CASCADE,
    FOREIGN KEY (idUsuario)
        REFERENCES Usuario (idUsuario)
        ON UPDATE CASCADE,
    FOREIGN KEY (idProfissional)
        REFERENCES Profissional (idProfissional)
)  ENGINE=INNODB;

CREATE TABLE Venda (
    idVenda INT PRIMARY KEY AUTO_INCREMENT,
    dataVenda DATE NOT NULL,
    idPedido INT NOT NULL,
    FOREIGN KEY (idPedido)
        REFERENCES Pedido (idPedido)
        ON UPDATE CASCADE
)  ENGINE=INNODB;





