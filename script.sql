create database faculdade_unifecaf;

use faculdade_unifecaf;

#Criar a tabela de professores
create table tbl_professores (
id int not null primary key auto_increment,
nome varchar(100) not null,
cpf varchar(18) not null,
rg varchar(15) not null,
data_nascimento date
);

#Criar a tabela de cursos
create table tbl_cursos (
id int not null primary key auto_increment,
nome varchar(255) not null,
sigla varchar(45),
modalidade varchar(50) not null,
grau varchar(50) not null,
duracao int,
id_professor int,
constraint fk_professor foreign key (id_professor) references tbl_professores(id)
);

#Criar a tabela de alunos
create table tbl_alunos (
id int not null primary key auto_increment,
nome varchar(100) not null,
cpf varchar(18) not null,
rg varchar(15) not null,
ra int, 
data_nascimento date, 
id_curso int,
constraint fk_curso foreign key (id_curso) references tbl_cursos(id)
);

#Criar a tabela de disciplinas
create table tbl_disciplinas (
id int not null primary key auto_increment,
nome varchar(255) not null,
carga_horaria int,
tipo varchar(45) not null,
id_curso int,
constraint fk_cursos foreign key (id_curso) references tbl_cursos(id)
);

#Inserir os dados na tabela de professores 
insert into tbl_professores (nome, cpf, rg, data_nascimento) values
('Mateus de Souza Lima', '98759385778', '453764879', '1978-10-05'),
('Carla Mendes Rocha', '24659138477', '481275963', '1982-04-12'),
('João Paulo Ribeiro Nunes', '73984625109', '519384726', '1975-11-23'),
('Fernanda Oliveira Costa', '56192837466', '407316589', '1980-06-30'),
('Marcos Antônio da Luz', '39475618240', '328946175', '1969-02-17'),
('Luciana Figueiredo Martins', '18569347215', '294817563', '1985-08-09'),
('Rodrigo Ferreira de Almeida', '63847215986', '376519284', '1977-12-01'),
('Patrícia Helena Vasconcelos', '50482917631', '182946753', '1981-03-22'),
('Bruno César Gonçalves', '92736184500', '593817264', '1974-09-15'),
('Simone Duarte Cardoso', '36172849504', '182957364', '1983-07-18'),
('Leandro Henrique Pires', '71829463501', '293847561', '1976-10-26'),
('Daniela Souza Monteiro', '84917536249', '318275964', '1984-05-03'),
('André Luiz Tavares', '52678139462', '487263591', '1972-01-08'),
('Juliana Moraes Bastos', '69284317509', '185729364', '1979-12-29'),
('Felipe dos Santos Vieira', '30594817263', '472839165', '1980-11-11');

#Checar se os dados estão corretos
select * from tbl_professores;

#Inserir os dados na tabela de cursos
insert into tbl_cursos (nome, sigla, modalidade, grau, duracao, id_professor) values
('Medicina', 'MED', 'Presencial', 'Bacharelado', 5, 1),
('Direito', 'DIR', 'Presencial', 'Bacharelado', 5, 2),
('Engenharia Civil', 'ENGCIV', 'Presencial', 'Bacharelado', 5, 3),
('Psicologia', 'PSI', 'Presencial', 'Bacharelado', 5, 4),
('Administração', 'ADM', 'EAD', 'Bacharelado', 4, 5),
('Enfermagem', 'ENF', 'Presencial', 'Bacharelado', 5, 6),
('Ciência da Computação', 'CCOMP', 'Presencial', 'Bacharelado', 4, 7),
('Educação Física', 'EDF', 'Híbrido', 'Licenciatura', 4, 8),
('Pedagogia', 'PED', 'EAD', 'Licenciatura', 4, 9),
('Arquitetura e Urbanismo', 'ARQ', 'Presencial', 'Bacharelado', 5, 10),
('Biomedicina', 'BIO', 'Presencial', 'Bacharelado', 4, 11),
('Fisioterapia', 'FISIO', 'Presencial', 'Bacharelado', 5, 12),
('Nutrição', 'NUT', 'Presencial', 'Bacharelado', 4, 13),
('Engenharia de Produção', 'ENGPROD', 'Presencial', 'Bacharelado', 5, 14),
('Serviço Social', 'SSOCIAL', 'EAD', 'Bacharelado', 4, 15);

#Checar se os dados estão corretos
select * from tbl_cursos;

#Checar os cursos que cada professor leciona
select tbl_professores.id,
tbl_professores.nome,
tbl_cursos.nome,
tbl_cursos.sigla,
tbl_cursos.modalidade,
tbl_cursos.grau,
tbl_cursos.duracao

from tbl_professores

join tbl_cursos ON tbl_cursos.id_professor = tbl_professores.id;

#Inserir os dados na tabela de alunos
insert into tbl_alunos (nome, cpf, rg, ra, data_nascimento, id_curso) values
('Bruno Henrique Duarte', '71589362745', '982134567', 20231002, '2002-03-12', 1),
('Carla Almeida de Souza', '98452874599', '988998840', 20231001, '2003-10-05', 2),
('Letícia Faria Nogueira', '39284617588', '885634209', 20231003, '2001-07-28', 3),
('Vinícius Lopes Martins', '83619472500', '972348651', 20231004, '2000-11-14', 4),
('Amanda Ribeiro Costa', '59826471329', '974153268', 20231005, '2004-02-05', 5),
('Lucas Tavares Pinheiro', '72198456378', '908765432', 20231006, '2002-06-17', 6),
('Juliana Castro Mendes', '48291736500', '956781234', 20231007, '2003-09-09', 7),
('Gabriel Silva Fonseca', '63928475129', '903476182', 20231008, '2001-01-22', 8),
('Mariana Rocha Peixoto', '92718465321', '919384756', 20231009, '2000-05-30', 9),
('Thiago Almeida Barros', '89427615348', '984561237', 20231010, '2003-08-11', 10),
('Bianca Souza Teixeira', '34879216500', '901278645', 20231011, '2002-12-03', 11),
('Felipe Cunha Lacerda', '78519326452', '933847512', 20231012, '2000-04-18', 12),
('Natália Vieira Gomes', '65829417385', '902836417', 20231013, '2001-10-27', 13),
('Rodrigo Santos Carvalho', '90327518496', '975126384', 20231014, '2002-09-06', 14),
('Ana Paula Matos Freitas', '41938765200', '968342175', 20231015, '2003-03-21', 15);

#Checar se os dados estão corretos
select * from tbl_alunos;

#Checar o curso que cada aluno está matriculado
select tbl_alunos.id,
tbl_alunos.nome as nome_aluno,
tbl_cursos.nome as nome_curso,
tbl_cursos.sigla,
tbl_cursos.modalidade,
tbl_cursos.grau,
tbl_cursos.duracao

from tbl_alunos

join tbl_cursos ON tbl_alunos.id_curso = tbl_cursos.id;

#Inserir os dados na tabela de disciplinas
insert into tbl_disciplinas (nome, carga_horaria, tipo, id_curso) values

#Curso 1: Medicina
('Anatomia Humana', 60, 'Obrigatória', 1),
('Fisiologia', 60, 'Obrigatória', 1),
('Bioquímica Médica', 60, 'Obrigatória', 1),
('Farmacologia', 45, 'Optativa', 1),
('Genética Médica', 45, 'Optativa', 1),

#Curso 2: Direito
('Direito Constitucional', 60, 'Obrigatória', 2),
('Direito Penal I', 60, 'Obrigatória', 2),
('Teoria Geral do Direito', 45, 'Obrigatória', 2),
('Ética Jurídica', 30, 'Optativa', 2),
('Direitos Humanos', 45, 'Optativa', 2),

#Curso 3: Engenharia Civil
('Cálculo I', 60, 'Obrigatória', 3),
('Física para Engenharias', 60, 'Obrigatória', 3),
('Mecânica dos Materiais', 60, 'Obrigatória', 3),
('Topografia', 45, 'Optativa', 3),
('Desenho Técnico', 45, 'Optativa', 3),

#Curso 4: Psicologia
('Psicologia do Desenvolvimento', 60, 'Obrigatória', 4),
('Psicologia Social', 60, 'Obrigatória', 4),
('Psicanálise', 60, 'Obrigatória', 4),
('Neuropsicologia', 45, 'Optativa', 4),
('Ética Profissional', 30, 'Optativa', 4),

#Curso 5: Administração
('Fundamentos de Administração', 60, 'Obrigatória', 5),
('Gestão de Pessoas', 60, 'Obrigatória', 5),
('Marketing', 60, 'Obrigatória', 5),
('Empreendedorismo', 45, 'Optativa', 5),
('Contabilidade Básica', 45, 'Optativa', 5),

#Curso 6: Enfermagem
('Fundamentos de Enfermagem', 60, 'Obrigatória', 6),
('Enfermagem Médico-Cirúrgica', 60, 'Obrigatória', 6),
('Saúde Coletiva', 60, 'Obrigatória', 6),
('Ética e Bioética', 45, 'Optativa', 6),
('Farmacologia Aplicada', 45, 'Optativa', 6),

#Curso 7: Ciência da Computação
('Algoritmos e Lógica', 60, 'Obrigatória', 7),
('Programação Estruturada', 60, 'Obrigatória', 7),
('Banco de Dados I', 60, 'Obrigatória', 7),
('Estrutura de Dados', 60, 'Optativa', 7),
('Arquitetura de Computadores', 45, 'Optativa', 7),

#Curso 8: Educação Física
('Biomecânica', 60, 'Obrigatória', 8),
('Fisiologia do Exercício', 60, 'Obrigatória', 8),
('Educação Física Escolar', 60, 'Obrigatória', 8),
('Psicologia do Esporte', 45, 'Optativa', 8),
('Recreação e Lazer', 45, 'Optativa', 8),

#Curso 9: Pedagogia
('Didática', 60, 'Obrigatória', 9),
('História da Educação', 60, 'Obrigatória', 9),
('Educação Infantil', 60, 'Obrigatória', 9),
('Psicologia da Educação', 45, 'Optativa', 9),
('Educação e Diversidade', 45, 'Optativa', 9),

#Curso 10: Arquitetura e Urbanismo
('Desenho Arquitetônico', 60, 'Obrigatória', 10),
('História da Arquitetura', 60, 'Obrigatória', 10),
('Conforto Ambiental', 60, 'Obrigatória', 10),
('Urbanismo', 45, 'Optativa', 10),
('Maquetes e Modelagem', 45, 'Optativa', 10),

#Curso 11: Biomedicina
('Biologia Celular', 60, 'Obrigatória', 11),
('Microbiologia', 60, 'Obrigatória', 11),
('Imunologia', 60, 'Obrigatória', 11),
('Parasitologia', 45, 'Optativa', 11),
('Genética', 45, 'Optativa', 11),

#Curso 12: Fisioterapia
('Cinesiologia', 60, 'Obrigatória', 12),
('Anatomia Aplicada', 60, 'Obrigatória', 12),
('Terapias Manuais', 60, 'Obrigatória', 12),
('Neurologia Funcional', 45, 'Optativa', 12),
('Fisioterapia Desportiva', 45, 'Optativa', 12),

#Curso 13: Nutrição
('Nutrição Básica', 60, 'Obrigatória', 13),
('Bioquímica dos Alimentos', 60, 'Obrigatória', 13),
('Avaliação Nutricional', 60, 'Obrigatória', 13),
('Educação Nutricional', 45, 'Optativa', 13),
('Microbiologia dos Alimentos', 45, 'Optativa', 13),

#Curso 14: Engenharia de Produção
('Cálculo Diferencial', 60, 'Obrigatória', 14),
('Logística', 60, 'Obrigatória', 14),
('Gestão da Qualidade', 60, 'Obrigatória', 14),
('Pesquisa Operacional', 45, 'Optativa', 14),
('Engenharia Econômica', 45, 'Optativa', 14),

#Curso 15: Serviço Social
('Fundamentos do Serviço Social', 60, 'Obrigatória', 15),
('Política Social', 60, 'Obrigatória', 15),
('Ética Profissional', 60, 'Obrigatória', 15),
('Gênero e Sociedade', 45, 'Optativa', 15),
('Direitos Sociais', 45, 'Optativa', 15);

#Checar se os dados estão corretos
select * from tbl_disciplinas;

#Checar os cursos que a faculdade possui, os professores de cada curso, as disciplinas e os alunos matriculados
select
tbl_cursos.nome AS nome_curso,
tbl_professores.nome AS nome_professor,
tbl_disciplinas.nome AS nome_disciplina,
tbl_alunos.nome AS nome_aluno

from tbl_cursos

join tbl_professores ON tbl_professores.id = tbl_cursos.id_professor

left join tbl_disciplinas ON tbl_disciplinas.id_curso = tbl_cursos.id

left join tbl_alunos ON tbl_alunos.id_curso = tbl_cursos.id

order by tbl_cursos.nome, tbl_disciplinas.nome, tbl_alunos.nome;

