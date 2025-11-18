const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");

const app = express();
app.use(cors());

// Conexão MySQL
const db = mysql.createConnection({
  host: "localhost", // ou ip
  user: "root", // usuario
  password: "12345678", // senha
  database: "IntegraDB",
});

// Endpoint

app.get("/produtos", (req, res) => {
  const category = req.query.categoria || "";
  const ignorarId = req.query.exclude || 0;

  let query = `
    SELECT
        IdProd AS Codigo,
        NomeProd,
        DescProd AS Descricao,
        ImgProd AS FotProd,
        PrecoProd AS Preco,
        QtdProd AS QtdEstoque,
        CategoriaProd AS Categoria
      FROM
        tbProduto
    `;

  const params = [];
  const conditions = [];

  if (category) {
    conditions.push("CategoriaProd = ?");
    params.push(category);
  }

  //eu espero que isso de certo pelo amor de deus

  if (ignorarId > 0) {
    conditions.push("IdProd != ?");
    params.push(ignorarId);
  }

  if (conditions.length > 0) {
    query += " WHERE " + conditions.join(" AND ");
  }

  if (category) {
    query += " LIMIT 4";
  }

  db.query(query, params, (erro, result) => {
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
