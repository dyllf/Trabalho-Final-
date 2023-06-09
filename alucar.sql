CREATE DATABASE alucar

CREATE TABLE IF NOT EXISTS clientes(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  `bi` VARCHAR(10) NOT NULL UNIQUE,
  `NIF` VARCHAR(15) NOT NULL UNIQUE,
  `endereço` VARCHAR(45) NOT NULL,
  `contactos` VARCHAR(45) NULL,
  `data_nascimento` DATE NULL
);

CREATE TABLE IF NOT EXISTS fornecedores (
  `id` INT PRIMARY KEY,
  `nome` VARCHAR(30) NULL,
  `endereço` VARCHAR(45) NULL,
  `contactos` VARCHAR(45) NULL,
  `NIF` VARCHAR(15) NOT NULL UNIQUE
  );

CREATE TABLE IF NOT EXISTS funcionarios (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  `bi` VARCHAR(10) NOT NULL UNIQUE,
  `NIF` VARCHAR(15) NOT NULL UNIQUE,
  `Endereço` VARCHAR(45) NOT NULL,
  `contactos` VARCHAR(45) NULL,
  `data_nascimento` DATE NULL,
  `cargo` VARCHAR(30) NULL,
  `turno` VARCHAR(45) NULL
);

CREATE TABLE IF NOT EXISTS intalações (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `endereco` VARCHAR(45) NOT NULL,
  `contactos` VARCHAR(45) NOT NULL,
  `Funcionarios_id` INT NOT NULL,
  INDEX `fk_Intalações_Funcionarios_idx` (`Funcionarios_id` ASC) VISIBLE,
  CONSTRAINT `fk_Intalações_Funcionarios`
    FOREIGN KEY (`Funcionarios_id`)
    REFERENCES `funcionarios` (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS veiculos (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `modelo` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `cilindrada` VARCHAR(45) NOT NULL,
  `potencia` VARCHAR(45) NOT NULL,
  `numero_portas` VARCHAR(45) NOT NULL,
  `acentos` VARCHAR(45) NOT NULL,
  `preco_aluger` VARCHAR(45) NOT NULL,
  `intalações_id` INT NOT NULL,
  INDEX `fk_veiculos_intalações` (`intalações_id` ASC) VISIBLE,
  CONSTRAINT `fk_veiculos_intalações`
    FOREIGN KEY (`intalações_id`)
    REFERENCES `intalações` (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

    CREATE TABLE IF NOT EXISTS reserva (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `veiculos_id` INT NOT NULL,
  `clientes_id` INT NOT NULL,
  `data_reserva` TIMESTAMP NULL,
  `data_entrega_veiculo` VARCHAR(45) NULL,
  `data_retoma_veiculo` VARCHAR(45) NULL,
  INDEX `fk_veiculos__clientes` (`clientes_id` ASC) VISIBLE,
  INDEX `fk_veiculos__clientes1` (`veiculos_id` ASC) VISIBLE,
  CONSTRAINT `fk_veiculos_clientes`
    FOREIGN KEY (`veiculos_id`)
    REFERENCES `veiculos` (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_veiculosclientes1`
    FOREIGN KEY (`clientes_id`)
    REFERENCES `clientes` (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS atendimento (
  `id` INT NOT NULL AUTO_INCREMENT,
  `clientes_id` INT NOT NULL,
  `funcionarios_id` INT NOT NULL,
  `descricao` MEDIUMTEXT NULL,
  `data_entrega` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_clientes_has_funcionarios_funcionarios1_idx` (`funcionarios_id` ASC) VISIBLE,
  INDEX `fk_clientes_has_funcionarios_clientes1_idx` (`clientes_id` ASC) VISIBLE,
  CONSTRAINT `fk_clientes_funcionarios`
    FOREIGN KEY (`clientes_id`)
    REFERENCES `clientes` (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_clientes_funcionarios1`
    FOREIGN KEY (`funcionarios_id`)
    REFERENCES funcionarios (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

  CREATE TABLE cargos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome_cargo VARCHAR(60) NOT NULL UNIQUE,
    descricao MEDIUMTEXT
  );

  ALTER TABLE funcionarios ADD cargo_id INT NOT NULL; 

ALTER TABLE funcionarios ADD CONSTRAINT fk_cargo_id FOREIGN KEY (cargo_id) REFERENCES cargos(id);


INSERT INTO funcionarios(nome,bi,NIF,contactos,cargo,turno) values ('Aylla maria','957628','956248627','9586742','Gerente','8:00-16:00'),
('Michelle Johnon','16528','897248627','1576742',1,'8:00-16:00'),


  INSERT INTO veiculos(modelo,marca,cilindrada,potencia,numero_portas,acentos,preco_aluger,intalações_id) 

INSERT INTO cargos(nome_cargo) VALUES ('condutor');
INSERT INTO cargos(nome_cargo) VALUES ('gerente');
INSERT INTO cargos(nome_cargo) VALUES ('atendedor');

INSERT INTO funcionarios(nome,bi,NIF,contactos,cargo_id,turno) values ('Maria Gomes', 923482, 7685693756, 9895454, 1,'12:00-20:00');


INSERT INTO funcionarios(nome,bi,NIF,contactos,cargo_id,turno) values ('Fábio Soares', 947582, 9425193756, 9885454 , 1,'8:00-16.00');
INSERT INTO funcionarios(nome,bi,NIF,contactos,cargo_id,turno) values ('Júnior Santos', 923476, 7685783756, 9894325, 2,'8:00-20:00');
INSERT INTO funcionarios(nome,bi,NIF,contactos,cargo_id,turno) values ('Ronaldo Araújo', 354322, 8615693756, 9934545, 2,'8:00-20:00');
INSERT INTO funcionarios(nome,bi,NIF,contactos,cargo_id,turno) values ('Sandro Rodrigues', 563482, 1975693756, 5885454, 2,'8:00-20:00');
INSERT INTO funcionarios(nome,bi,NIF,contactos,cargo_id,turno) values ('Aldina Maria', 923154, 7685675156, 9798854, 3,'9:00-19:00');
INSERT INTO funcionarios(nome,bi,NIF,contactos,cargo_id,turno) values ('Marta Santos', 923198, 76856947546, 998852, 3,'9:00-19:00');
INSERT INTO funcionarios(nome,bi,NIF,contactos,cargo_id,turno) values (' Joaquim Fortes', 923143, 754210395, 7598854, 3,'9:00-20:00');
INSERT INTO funcionarios(nome,bi,NIF,contactos,cargo_id,turno) values ('Pedro Dias', 923112, 7685675157, 9068854, 3,'9:00-20:00');
INSERT INTO funcionarios(nome,bi,NIF,contactos,cargo_id,turno) values ('Bernardo Silva', 987122, 76865855156, 5798854, 3,'9:00-20:00');
INSERT INTO funcionarios(nome,bi,NIF,contactos,cargo_id,turno) values ('Aldina Maria', 923172, 7685671554, 9718854, 3,'9:00-20:00');

INSERT INTO intalações(endereco,contactos,Funcionarios_id) VALUES ('Vila Nova', 2312318, 1 )
INSERT INTO intalações(endereco,contactos,Funcionarios_id) VALUES ('Monte Sossego', 2322318,  2)
INSERT INTO intalações(endereco,contactos,Funcionarios_id) VALUES ('Chã de Alecrim', 2332318, 5 )

INSERT INTO veiculos(modelo,marca,cilindrada,potencia,numero_portas,acentos,preco_aluger,intalações_id) VALUES ('Duster','Dacia','1330cm3','148HP',5,5,'3500$00', 1)
INSERT INTO veiculos(modelo,marca,cilindrada,potencia,numero_portas,acentos,preco_aluger,intalações_id) VALUES ('Jogger','Dacia','999cm3', '109HP',5,7,'5000$00', 2)
INSERT INTO veiculos(modelo,marca,cilindrada,potencia,numero_portas,acentos,preco_aluger,intalações_id) VALUES ('hilax', 'toyota', '2755cm3', '171HP',4,5,'7500$00',3) 
INSERT INTO veiculos(modelo,marca,cilindrada,potencia,numero_portas,acentos,preco_aluger,intalações_id) VALUES ('C-HR', 'toyota', '1797cm3', '120HP',5,5,'6500$00', 1)
INSERT INTO veiculos(modelo,marca,cilindrada,potencia,numero_portas,acentos,preco_aluger,intalações_id) VALUES ('prado', 'toyota', '2755cm3', '131HP',5,8,'7500$00', 2)
INSERT INTO veiculos(modelo,marca,cilindrada,potencia,numero_portas,acentos,preco_aluger,intalações_id) VALUES ('208', 'Peugeot', '2755cm3', '115HP',5,5,'4000$00', 3)

DELIMITER //

CREATE PROCEDURE base_de_dados (
    IN cliente VARCHAR(30),
    IN veiculo VARCHAR(30),
    IN veiculo_entrega DATE,
    IN veiculo_retoma DATE,
    OUT id_cliente INT,
    OUT id_veiculo INT
)
BEGIN
    DECLARE data DATE;
    
    SET data = CURRENT_DATE();

    SELECT id INTO id_cliente FROM clientes WHERE nome = cliente;
    SELECT id INTO id_veiculo FROM veiculos WHERE modelo = veiculo;

    INSERT INTO reserva (veiculos_id, clientes_id, data_reserva, data_entrega_veiculo, data_retoma_veiculo)
    VALUES (id_veiculo, id_cliente, data, veiculo_entrega, veiculo_retoma);
END //

DELIMITER ;

SELECT DATE_FORMAT(data_nascimento, '%d/%m/%Y') AS data_formatada FROM clientes;
SELECT DATE_FORMAT(data_entrega_veiculo, '%d/%m/%Y') AS data_formatada FROM reserva;
SELECT DATE_FORMAT(data_retoma_veiculo, '%d/%m/%Y') AS data_formatada FROM reserva;


