// const mongoose = require("mongoose");

// const medicineSchema = new mongoose.Schema({
//   name: String,
//   category: String,
//   price: Number,
//   stock_quantity: Number,
//   image_url: String
// });

// module.exports = mongoose.model("Medicines", medicineSchema);



const mongoose = require("mongoose");

const medicineSchema = new mongoose.Schema({
  name: { type: String, required: true, trim: true },
  description: { type: String },
  price: { type: Number, required: true },
  currency: { type: String, default: "USD" },
  category: { type: String, required: true },
  subcategory: { type: String },
  brand: { type: String },
  sku: { type: String },
  stock_quantity: { type: Number, default: 0 },
  image_url: { type: String },
  rating: { type: Number, default: 0 },
  reviews_count: { type: Number, default: 0 },
  tags: [{ type: String }],
  specifications: {
    dosage: { type: String },
    form: { type: String },
    pack_size: { type: String },
    administration: { type: String },
    expiry_date: { type: String }
  },
  is_featured: { type: Boolean, default: false },
  created_at: { type: Date, default: Date.now },
  updated_at: { type: Date, default: Date.now }
});

module.exports = mongoose.model("Medicine", medicineSchema);
