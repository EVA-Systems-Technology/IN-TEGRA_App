

# IN-TEGRA - Catálogo 

Aplicativo desenvolvido em Flutter para catálogo de produtos integrado a uma API RESTful em Node.js e banco de dados MySQL.
Este projeto foi desenvolvido como parte do Trabalho de Conclusão de Curso (TCC).

## Pré-requisitos

  * [Flutter SDK](https://flutter.dev/docs/get-started/install)
  * [Node.js](https://nodejs.org/) (v16 ou superior)
  * [MySQL](https://www.mysql.com/)
  * (opcional): Um dispositivo físico Android ou Emulador Android.

----

## Como Rodar o Projeto


### Configurar o Banco de Dados 

1.  Certificar de que o MySQL está rodando.
2.  Abra seu gerenciador de banco de dados
3.  Executar o script SQL `integraScript.sql`

### Iniciar a API 

1.  Abra o terminal e navegue até a pasta da API:
    ```bash
    cd ApiProd
    ```
2.  Instale as dependências do projeto:
    ```bash
    npm install
    ```
3.  Configure as credenciais do banco de dados no arquivo `server.js`:
      * Preencha com suas configurações locais:
        ```env
        DB_HOST=localhost
        DB_USER=root
        DB_PASSWORD=suasenha
        DB_DATABASE=IntegraDB
        ```
4.  Inicie o servidor:
    ```bash
    node server.js
    ```
      * Vai aparecer a mensagem: `API rodando em http://localhost:3000/produtos`

### Configurar o Aplicativo

1.  Abra um novo terminal e navegue até a pasta do aplicativo:

    ```bash
    cd integra_catalogo_app
    ```

2.  Baixe as dependências do Flutter:

    ```bash
    flutter pub get
    ```

3.  **Configuração para rodar a API corretamente**

      * **celular fisico**

        1.  No terminal, rode: `adb reverse tcp:3000 tcp:3000`

      * **rodar direto**
  
        1. So seguir o proximo passo

### Executar o App 

Com a API rodando, só falta iniciar o aplicativo.

```bash
flutter run
```
