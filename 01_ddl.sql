CREATE DATABASE Hospital;
USE Hospital;

CREATE TABLE Especialidades(
	Id_especialidade INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nome VARCHAR(100) NOT NULL
);

CREATE TABLE Pacientes(
	Id_paciente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	Nome VARCHAR(100) NOT NULL,
    Endereco VARCHAR(100),
    Telefone VARCHAR(100) NOT NULL,
    Data_nascimento DATE NOT NULL
);

CREATE TABLE Medicos(
	Id_medico INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Id_especialidade INT NOT NULL,
    Telefone VARCHAR(100),
    CONSTRAINT FK_Medico_especialidade
    FOREIGN KEY(Id_especialidade)
    REFERENCES Especialidades(Id_especialidade)
);

CREATE TABLE Consultas(
	Id_consulta INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Id_paciente INT NOT NULL,
    Id_medico INT NOT NULL,
    Data_consulta date NOT NULL,
    Observacoes VARCHAR(100),
    CONSTRAINT FK_Consulta_Paciente
    FOREIGN KEY(Id_paciente)
    REFERENCES Pacientes(Id_paciente),
    CONSTRAINT FK_Consulta_Medico
    FOREIGN KEY(Id_medico)
    REFERENCES Medicos(Id_medico)
);

INSERT INTO Especialidades(Nome)
VALUES
('Cardiologia'),
('Pediatria'),
('Dermatologia'),
('Ortopedia'),
('Ginecologia');

INSERT INTO Pacientes(Nome,Endereco,Telefone,Data_nascimento)
VALUES
('João Pereira', 'Rua das Flores, 123', '(11) 97777-0001', '1985-05-20'),
('Maria Oliveira', 'Av. Paulista, 1500', '(11) 97777-0002', '1992-11-10'),
('Pedro Henrique', 'Rua Amazonas, 45', '(11) 97777-0003', '2010-03-15'),
('Ana Costa', 'Rua Chile, 89', '(11) 97777-0004', '1978-08-25'),
('Lucas Martins', 'Rua Bahia, 210', '(11) 97777-0005', '2000-01-30');

INSERT INTO Medicos(Nome,Id_especialidade,Telefone)
VALUES
('Dr. Arnaldo Silva', 2, '(11) 98888-1111'),
('Dra. Beatriz Souza', 4, '(11) 98888-2222'),
('Dr. Carlos Oliveira', 1, '(11) 98888-3333'),
('Dra. Daniela Lima', 5, '(11) 98888-4444'),
('Dr. Eduardo Santos', 3, '(11) 98888-5555');

INSERT INTO Consultas(Id_paciente, Id_medico, Data_consulta, Observacoes) 
VALUES 
(1, 3, '2024-01-10', 'Check-up de rotina'),
(3, 5, '2024-01-12', 'Consulta dermatológica - acne'),
(2, 1, '2024-01-15', 'Acompanhamento pediátrico'),
(4, 4, '2024-01-18', 'Exames preventivos'),
(5, 2, '2024-01-20', 'Dor no joelho após exercício');
