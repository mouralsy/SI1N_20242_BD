CREATE SCHEMA EC4_SI1N

USE EC4_SI1N

CREATE TABLE IF NOT EXISTS ALUNOS(
CPF_ALUNOS INT PRIMARY KEY,
NOME_ALUNO VARCHAR(45) NOT NULL,
DATA_NASC_ALUNO DATE NOT NULL,
RUA_NUM_ALUNO VARCHAR(20) NOT NULL,
BAIRRO_ALUNO VARCHAR(45) NOT NULL,
CIDADE_ALUNO VARCHAR(45) NOT NULL,
ESTADO_ALUNO VARCHAR(45) NOT NULL,
MODALID_ALUNO VARCHAR(100) NOT NULL,
CONSTRAINT FK_AULAS FOREIGN KEY(ALUNOS_AULAS)
REFERENCES AULAS(ID_AULAS)
);

CREATE TABLE IF NOT EXISTS INSTRUTORES(
ID_INST INT PRIMARY KEY,
NOME_INST VARCHAR(45) NOT NULL,
DATA_NASC_INST DATE NOT NULL,
RUA_NUM_INST VARCHAR(20) NOT NULL,
BAIRRO_INST VARCHAR(45) NOT NULL,
CIDADE_INST VARCHAR(45) NOT NULL,
ESTADO_INST VARCHAR(45) NOT NULL,
MODALID_INST VARCHAR(100) NOT NULL,
CONSTRAINT FK_MODALIDADES FOREIGN KEY(INSTRUT_MODALID)
REFERENCES MODALIDADES(COD_MODALID)
);

CREATE TABLE IF NOT EXISTS MODALIDADES(
COD_MODALID INT PRIMARY KEY,
NOME_MODALID VARCHAR(45) NOT NULL,
MODALID_INSTRUT INT NOT NULL,
CONSTRAINT FK_INSTRUTORES FOREIGN KEY (MODALID_INSTRUT)
REFERENCES INSTRUTORES(ID_INST)
);

CREATE TABLE IF NOT EXISTS PLANOS DE TREINAMENTO(
ID_PLTR INT PRIMARY KEY,
DATA_PLTR DATE NOT NULL,
REGISTRO_PLTR TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS AULAS(
ID_AULA INT PRIMARY KEY,
MODAL_AULA VARCHAR(45) NOT NULL,
TIPO_AULA VARCHAR(45) NOT NULL,
DATAHORA_AULA DATETIME NOT NULL,
CAPAC_AULA VARCHAR(20) NOT NULL,
INSTRESP_AULAS VARCHAR(45) NOT NULL,
AULAS_ALUNOS INT NOT NULL
CONSTRAINT FK_ALUNOS FOREIGN KEY (AULAS_ALUNOS)
REFERENCES ALUNOS(CPF_ALUNOS)
);

CREATE TABLE IF NOT EXISTS PAGAMENTOS(
CONFIRM_PAG INT PRIMARY KEY,
DATA_PAG DATE NOT NULL,
VALOR_PAG VARCHAR(20) NOT NULL,
STATUS_PAG VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS ALUNOS_AULAS(
ALAU_ALUNOS INT,
ALAU_AULAS INT,
PRIMARY KEY(ALAU_ALUNOS, ALAU_AULAS),
CONSTRAINT ALAU_FK_ALUNOS FOREIGN KEY(ALAU_ALUNOS)
REFERENCES ALUNOS(CPF_ALUNOS),
CONSTRAINT ALAU_FK_AULAS FOREIGN KEY(ALAU_AULAS)
REFERENCES AULAS(ID_AULAS)
);

CREATE TABLE IF NOT EXISTS INSTRUTORES_MODALIDADES(
INSTMOD_INSTRUTORES INT,
INSTMOD_MODALIDADES INT,
PRIMARY KEY(INSTMOD_INSTRUTORES, INSTMOD_MODALIDADES),
CONSTRAINT INSTMOD_FK_INSTRUTORES FOREIGN KEY(INSTMOD_INSTRUTORES)
REFERENCES INSTRUTORES(ID_INST),
CONSTRAINT INSTMOD_FK_MODALIDADES FOREIGN KEY(INSTMOD_MODALIDADES)
REFERENCES MODALIDADES(COD_MODALID)  
);
