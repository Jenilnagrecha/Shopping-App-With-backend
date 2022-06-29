console.log('hello world');
// import lib
const express = require('express');
const mongoose = require('mongoose');
// import pakage
const authRouter = require("./routes/auth");
//initialization
const app = express();
const PORT =3000;
// mongoose database
const DB = "mongodb+srv://jenil:qazx@cluster0.ueh7j.mongodb.net/?retryWrites=true&w=majority";
app.use(express.json());
app.use(authRouter);
mongoose.connect(DB).then(()=>{
    console.log('connection succesfull');
});
app.listen(PORT,() => {
    console.log(`connected at port ${PORT}`);
})