const express = require('express');
const dotenv = require('dotenv');
const cors = require('cors');
const connectDB = require('./config/db');
const authRoutes = require('./routes/auth');

dotenv.config();
connectDB();

const app = express();

// ✅ Required for Flutter form data
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(cors());

// ✅ All /api routes go through authRoutes
app.use('/api', authRoutes);

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`🚀 Server running on port ${PORT}`);
});
