const fs = require("fs");

// For now we mock OCR response
exports.scanPrescription = async (req, res) => {
  try {
    if (!req.file) return res.status(400).json({ error: "No file uploaded" });

    // Placeholder: send to Flask/FastAPI OCR
    // const ocrResponse = await axios.post("http://127.0.0.1:8000/ocr", { file: req.file.path });

    // Mock structured response
    const mockMedicines = [
      { medicine: "Paracetamol", dosage: "500mg", quantity: 1 },
      { medicine: "ORS", dosage: "2 sachets", quantity: 2 }
    ];

    // Delete uploaded file (since no OCR yet)
    fs.unlinkSync(req.file.path);

    res.json(mockMedicines);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};
