// const jwt = require("jsonwebtoken");

// const auth = (req, res, next) => {
//   const token = req.header("Authorization")?.replace("Bearer ", "");
//   if (!token) return res.status(401).json({ error: "No token, authorization denied" });

//   try {
//     const decoded = jwt.verify(token, process.env.JWT_SECRET);
//     req.user = decoded.id;
//     next();
//   } catch (err) {
//     res.status(401).json({ error: "Token is not valid" });
//   }
// };

// module.exports = auth;


const jwt = require("jsonwebtoken");
const User = require("../models/User");

const authMiddleware = async (req, res, next) => {
  try {
    // Get token from header
    const token = req.header("Authorization");
    
    if (!token) {
      return res.status(401).json({ error: "No token provided" });
    }

    // Check if token starts with 'Bearer '
    const tokenValue = token.startsWith('Bearer ') ? token.slice(7) : token;

    // Verify token
    const decoded = jwt.verify(tokenValue, process.env.JWT_SECRET);
    
    // Find user by id
    const user = await User.findById(decoded.id);
    if (!user) {
      return res.status(401).json({ error: "Invalid token - user not found" });
    }

    // Add user to request object
    req.user = user;
    next();
  } catch (error) {
    console.error("Auth middleware error:", error);
    return res.status(401).json({ error: "Invalid token" });
  }
};

module.exports = authMiddleware;