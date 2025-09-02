const Order = require("../models/Order");
const Medicine = require("../models/Medicine");

// Create order
exports.createOrder = async (req, res) => {
  try {
    const { userId, items } = req.body;

    // calculate total price
    let totalPrice = 0;
    for (let item of items) {
      const medicine = await Medicine.findById(item.medicine);
      if (!medicine) return res.status(404).json({ error: "Medicine not found" });
      totalPrice += medicine.price * item.quantity;
    }

    const order = new Order({
      user: userId,
      items,
      totalPrice,
    });

    await order.save();
    res.json(order);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

// Get orders by userId
exports.getUserOrders = async (req, res) => {
  try {
    const orders = await Order.find({ user: req.params.userId })
      .populate("items.medicine")
      .sort({ createdAt: -1 });

    res.json(orders);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

// Update order status
exports.updateOrderStatus = async (req, res) => {
  try {
    const { status } = req.body;
    const order = await Order.findByIdAndUpdate(
      req.params.orderId,
      { status },
      { new: true }
    );

    res.json(order);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};
