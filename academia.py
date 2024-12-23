import mysql.connector

conexao = mysql.connector.connect(
    host='localhost',
    user='???????',
    password='???????',
    database='academia',
)


cursor = conexao.cursor()

def ler(tabela):
    comando = f'SELECT * FROM {tabela};'
    cursor.execute(comando)
    resultado = cursor.fetchall()
    print(resultado)

# Função para atualizar registros
def atualizar(tabela, coluna, novo_valor, condicao_coluna, condicao_valor):
    comando = f'UPDATE {tabela} SET {coluna} = "{novo_valor}" WHERE {condicao_coluna} = "{condicao_valor}";'
    cursor.execute(comando)
    conexao.commit()
    print(f"Registro atualizado com sucesso na tabela {tabela}.")

# Função para deletar registros
def deletar(tabela, condicao_coluna, condicao_valor):
    comando = f'DELETE FROM {tabela} WHERE {condicao_coluna} = "{condicao_valor}";'
    cursor.execute(comando)
    conexao.commit()
    print(f"Registro deletado com sucesso da tabela {tabela}.")

resposta = int(input ("digite 1: ver uma tabela, digite 2: criar em alguma tabela, digite 3: editar em uma tabela, digite 4: para excluir uma tabela "))

if resposta == 1:
    print (f"digite o que voce gostaria de ver: ")
    opcao = input(f"bonus, cadastro, cadastro_info,funcionario,orcamento: ")
    ler = f'select * from {opcao};'
    cursor.execute(ler)
    resultado = cursor.fetchall()
    print (resultado)

elif resposta == 2:
   teste = int(input("ditite as informacoes para serem colocadas na tabela "))
   nome = input("digite o nome do funcionario: ")
   telf =input ("digite o telefone da funcionario: ")
   email= input("digite o email da funcionario: ")
   conta= int(input("digite o conta da funcionario: ")) 
   cpf= int(input("digite o cpf da funcionario: "))
   Criar =  f'INSERT INTO  funcionario (nome,email,telf,conta,cpf) VALUES("{nome}","{email}","{telf}","{conta}","{cpf}")'
   cursor.execute(Criar)
   conexao.commit()
   print ("criação feita com sucesso")
   ler = f'select * from funcionario;'
   cursor.execute(ler)
   resultado = cursor.fetchall()
   print (resultado)

elif resposta == 3:
    tabela = input("Digite a tabela que deseja atualizar (bonus, cadastro, cadastro_info, funcionario, orcamento): ")
    coluna = input("Digite a coluna que deseja atualizar: ")
    novo_valor = input("Digite o novo valor: ")
    condicao_coluna = input("Digite a coluna da condição: ")
    condicao_valor = input("Digite o valor da condição: ")
    atualizar(tabela, coluna, novo_valor, condicao_coluna, condicao_valor)

elif resposta == 4:
    tabela = input("Digite a tabela que deseja deletar (bonus, cadastro, cadastro_info, funcionario, orcamento): ")
    condicao_coluna = input("Digite a coluna da condição: ")
    condicao_valor = input("Digite o valor da condição: ")
    deletar(tabela, condicao_coluna, condicao_valor)



cursor.close()
conexao.close()
