import mysql.connector

conexao = mysql.connector.connect(
    host='localhost',
    user= '???????',
    password= '???????',
    database='academia',
)

cursor = conexao.cursor()
resposta = int(input ("digite 1: "))

if resposta == 1:
    print (f"digite o que voce gostaria de ver: ")
    opcao = input(f"bonus, cadastro, cadastro_info,funcionario,orcamento: ")
    ler = f'select * from {opcao};'
    cursor.execute(ler)
    resultado = cursor.fetchall()
    print (resultado)

elif resposta == 2:
   teste = int(input("ditite"))
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
    ler = f'select * from cadastro;'
    cursor.execute(ler)
    resultado = cursor.fetchall()
    print (resultado)

    telf= int(input("digite o telf da pessoa: "))
    id = int(input("digite o id da pessoa: "))
    atualizar = f'UPDATE cadastro SET telf= "{telf}"   WHERE ID = {id}'
    cursor.execute(atualizar)
    conexao.commit()
    
    print ("alteração feita com sucesso")
    cursor.execute(ler)
    resultado = cursor.fetchall()
    print (resultado)

else:
    ler = f'select * from cadastro;'
    cursor.execute(ler)
    resultado = cursor.fetchall()
    print (resultado)

    id = int(input("digite o id da pessoa que sera deletado: "))
    deletar= f'DELETE FROM cadastro WHERE ID = {id}'
    cursor.execute(deletar)
    conexao.commit()
    print ("o aqruivo foi excluido  com sucesso")
    ler = f'select * from cadastro;'
    cursor.execute(ler)
    resultado = cursor.fetchall()
    print (resultado)



cursor.close()
conexao.close()