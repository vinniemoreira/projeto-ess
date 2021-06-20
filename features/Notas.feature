Feature Notas

As a professor
I want to importar notas de alunos a partir da correção de roteiros
So that eu possa importar notas de roteiros de forma automática

Scenario: Importação de notas parcial a partir da correção de roteiro sucesso web
Given estou logado como “Professor”
And estou na página “Notas dos alunos”
And eu posso ver uma lista com os alunos “Vinicius Moreira” e “Maria Silva”
com notas para a meta “Requirements” em branco
And o aluno “Vinicius Moreira” fez o roteiro “Requirements” com avaliação “MA” e “Maria Silva” faltou
When eu clico na opção “Importar notas de correção de roteiro”
Then uma mensagem “importação realizada com sucesso” é exibida
And eu posso ver a nota do aluno “Vinicius Moreira” como “MA” e a nota de “Maria Silva” como “F”

Scenario: Importação de notas parcial a partir da correção de roteiro web falha
Given estou logado como “Professor”
And estou na página “Notas dos alunos”
And eu posso ver uma lista com os alunos “Vinicius Moreira” e “Maria Silva”
com notas para a meta “Requirements” em branco
And o roteiro “Requirements” ainda não foi cadastrado
When eu clico na opção “Importar notas de correção de roteiro”
Then uma mensagem “importação não realizada, roteiro inexistente” é exibida
And eu posso ver a nota do aluno “Vinicius Moreira” e “Maria Silva” ainda em branco
Cada aluno, individualmente, pede feedback ao monitor alocado a sua equipe e ao professor sobre os seus cenários 
especificações de cenários com erros básicos não serão analisados
cada especificação de cenário só será analisada uma vez, assim capriche na primeira versão
Seguir rigorosamente as práticas sugeridas nos slides e livro, e o checklist associado


Scenario: Importação de notas a partir da correção de roteiro falha service
Given estou logado como “Professor”
And o sistema tem cadastrado o aluno “Vinicius Moreira”
And o aluno “Vinicius Moreira” não fez o roteiro "Requirements"
When  “Importo notas de correção de roteiro”
Then o sistema não importa notas do aluno "Vinicius Moreira"

Scenario: Importação de notas parcial a partir da correção de roteiro inexistente service
Given estou logado como “Professor”
And o roteiro "Requirements" não está armazenado no sistema
And os alunos “Vinicius Moreira” e “Maria Silva” não tem nota para o roteiro "Requirements"
When “Importo notas de correção de roteiro”
Then um erro ocorre
And as notas não são armazenadas
And <Novo-passo-adicionado-roteiro>

Scenario: Importação de alunos a partir de uma planilha como a de Nomes e Logins
    Given estou logado como “Professor”
    And estou na página “importar alunos de planilha”
    When adiciono um arquivo “alunos.xlsx” que contém nomes e logins dos alunos a serem importados
    And confirmo o envio da planilha
    Then os alunos contidos na planilha são registrados na turma

Scenario:  Importação de notas
    Given estou logado como “Professor” com o login “agsa” e senha “1234”
    And estou na página “Notas dos Alunos”
    And vejo o campo de “Notas” dos alunos vazio
     When eu seleciono a opção “Importar Notas”
    Then vejo uma mensagem de sucesso
    And vejo o campo de “Notas” dos alunos preenchido
