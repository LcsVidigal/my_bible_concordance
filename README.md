# my_bible_concordance


Este é um projeto simples, criado para fins de aprendizado e uso pessoal. Trata-se de um aplicativo android desenvolvido em Flutter batizado carinhosamente de "my_bible_concordance" (ainda não achei um nome melhor haha).
Nesse projeto eu decidi unir o útil ao agradável, criando um aplicativo que auxiliasse no meu estudo bíblico e dando um grande salto nos meus conhecimentos em Flutter.

Abaixo explico para que serve exatamente este aplicativo, as tecnologias que foram utilizadas e os principais conceitos de Desenvolvimento de Software em Flutter que foram empregados nesse projeto.

## Para que serve este aplicativo

A ideia do aplicativo é criar um banco de anotações da bíblia.
Você pode criar "Coleções" que representam categorias ou assuntos, e dento dessas coleções você pode destacar versículos sobre esse assunto e fazer comentários.
Ao adicionar um verso em uma coleção, você pode: adicionar uma referência (livro, capítulo, versículos) e escrever um comentrário sobre este verso.
Dessa forma, você vai criando um repositório de versículos sobre determinados assuntos de forma organizado. E por isso o nome "my_bible_concordance", pois funciona como uma concordância que você mesmo criará.

## Tecnologias e conceitos aplicados

- Flutter (óbvio)
- SQLite - 
    Utilizado para persistir os dados offline. 
- Utilização de banco de dados externo - 
    Precisei adaptar um banco de dados externo com o conteúdo da bíblia, para não precisar fazer requisições online toda hora e facilitar o uso
- Gerenciamento de estado com "Provider" e "setState" - 
    Gerencia de estado é um grande desafio, optei por utilizar o Provider para ouvir as alterações do banco e setState para coisas mais simples.
- Figma para criar o protótipo das telas
    
## Oberservações

- Link do projeto no Figma: https://www.figma.com/file/5hhInB2URLJECgBvwWFNC7/My-Bible-DB?node-id=221%3A1890
- É claro que esse projeto ainda está em desenvolvimento, há muita para ser feito, então estarei atualizando esse repositório continuamente
- Na pasta "Download do aplicativo" coloquei o arquivo executável para instalar o aplicativo (apenas no SO Android) em sua versão utilizável mais recente.
