const express = require("express");
const multer = require("multer");
const { scanPrescription } = require("../controllers/scanController");

const router = express.Router();
const upload = multer({ dest: "uploads/" });

// Upload prescription image
router.post("/", upload.single("image"), scanPrescription);

module.exports = router;
