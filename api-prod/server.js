const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");

const app = express();
app.use(cors());

// Conexão MySQL
const db = mysql.createConnection({
  host: "localhost", // ou ip
  user: "root", // usuario
  password: "alune", // senha
  database: "IntegraDB",
});

// Endpoint

app.get("/produtos", (req, res) => {
  const query = `
    SELECT
          IdProd AS Codigo,
          NomeProd AS NomeProd,
          DescProd AS Descricao,
          ImgProd AS FotProd,
          PrecoProd AS Preco,
          QtdProd AS QtdEstoque,
          CategoriaProd AS Categoria
        FROM
          tbProduto;
  `;

  db.query(query, (erro, result) => {
    if (erro) return res.status(500).json({ error: erro.message });
    res.json(result);
  });
});

app.listen(3000, "0.0.0.0", () => {
  console.log("API rodando em http://localhost:3000/produtos");
});
/* comandos para iniciar tudo e ver se ta certinho:

obs, tem q ter o node instalado, durr

node server.js > vai rodar onde ele ta sendo upado pra verificar os dados */
