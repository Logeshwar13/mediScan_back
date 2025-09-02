const express = require("express");
const router = express.Router();
const Medicine = require("../models/Medicine");

// Get all medicines
router.get("/", async (req, res) => {
  const medicines = await Medicine.find();
  res.json(medicines);
});

// Search medicine
router.get("/search/:name", async (req, res) => {
  const medicines = await Medicine.find({
    name: { $regex: req.params.name, $options: "i" }
  });
  res.json(medicines);
});

module.exports = router;
