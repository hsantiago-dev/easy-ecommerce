## Integrantes

 Henrick Santiago  
 Samarone

## Instalação

  Rodar o comando "flutter pub get" para assim instalar as dependências necessárias para o projeto.
  
  Após isso, verificar se o arquivo android/gradlew já está criado. Caso não, basta rodar o projeto uma vez (Mesmo gerando erro, ele irá gerar o arquivo).
  E então rode os comandos no terminal para pegar a SHA1 key. 'cd android' e depois './gradlew sigingReport' e copiar a chave SHA1.
  Com essa chave em mãos é só acessar o console do projeto Firebase e cadastrar a nova chave em 'Configurações do projeto'.

## Particuladores do projeto

  A tela de pedidos ainda está com dados estáticos no código e sem funcionalidades, parte das funcionalidades já estão prontas porém ao juntarmos as alterações do projeto gerou muitos erros.  
  Falta o cadastro e escolha de endereços de entrega do usuário (Hoje estão todos fixos em tela), que serão implementados junto a próxima entrega pois utilizaremos HTTP requests para buscar o endereço a partir do CEP.  
  Login do Facebook só funciona com o meu perfil (Henrick Santiago), provavelmente alguma permissão que não consegui encontrar no console do app no Facebook.
