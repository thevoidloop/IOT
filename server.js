const express = require('express');
const mysql = require('mysql');
const app = express();
const cors = require('cors'); 
const port = 3000;

const db = mysql.createConnection({
  host: 'localhost',
  user: 'voidloop',
  password: 'arduino',
  database: 'db',
});

app.use(cors());

app.get('/insertData', (req, res) => {
  const temperature = req.query.temperature;

  const query = `INSERT INTO SensorData (temperature) VALUES (${temperature})`;

  db.query(query, (err, result) => {
    if (err) {
      return res.send(err);
    }
    res.send('Datos ingresados exitosamente');
  });
});


app.get('/setDataLampara1', (req, res) => {
  const query = `INSERT INTO lamp1 (power, inicio) VALUES(1, NOW());`;

  db.query(query, (err, result) => {
    if (err) {
      return res.send(err);
    }
    res.send('Datos ingresados exitosamente');
  });
});

app.get('/updateDataLampara1', (req, res) => {
  const newPowerValue = 0; // Valor en duro para "power"

  // Crea y ejecuta la consulta SQL
  const query = `
    UPDATE lamp1
    SET power = ?, final = NOW()
    WHERE ID = (SELECT MAXID FROM (SELECT MAX(ID) AS MAXID FROM lamp1) AS TEMP);
  `;

  db.query(query, [newPowerValue], (err, result) => {
    if (err) {
      return res.send(err);
    }
    res.send('Datos actualizados exitosamente');
  });
});

app.get('/getLamp1PowerValue', (req, res) => {
  // Crea y ejecuta la consulta SQL
  const query = `
    SELECT power
    FROM lamp1
    ORDER BY ID DESC
    LIMIT 1;
  `;

  db.query(query, (err, result) => {
    if (err) {
      return res.send(err);
    }
    if (result.length > 0) {
      res.json({ power: result[0].power });
    } else {
      res.send('No se encontraron registros');
    }
  });
});









app.get('/getAverageTemperature', (req, res) => {
  const query = `
    SELECT AVG(temperature) as average_temperature 
    FROM (
      SELECT temperature 
      FROM SensorData 
      ORDER BY id DESC 
      LIMIT 10
    ) AS last_10_records;
  `;

  db.query(query, (err, result) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }
    res.json({ averageTemperature: result[0].average_temperature });
  });
});


app.listen(port, () => {
  console.log(`Servidor ejecutándose en http://localhost:${port}`);
});
