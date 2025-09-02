// 

const express = require("express");
const dotenv = require("dotenv");
const connectDB = require("./config/db");

dotenv.config();
connectDB();

const app = express();
app.use(express.json());

// Routes
app.use("/api/auth", require("./routes/auth"));
app.use("/api/medicines", require("./routes/medicine"));
app.use("/api/order", require("./routes/order"));
app.use("/api/scan", require("./routes/scan"));

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
