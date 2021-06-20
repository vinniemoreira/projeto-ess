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


asdasdas