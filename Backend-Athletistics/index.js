const express = require('express');
const cors = require('cors');
const app = express();
const router=require("./router");


app.use(cors());
//Se llama al enrutador 
app.use("/",router);


//Se inicia el servidor

app.listen(4000, () => {
    console.log(`Athletistics server listening on port 4000`)
}); 




