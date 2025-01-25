const express = require("express");
const app = express();

const admin = require("firebase-admin");
const serviceAccount = require("./city-grow-firebase-adminsdk-fbsvc-32647e9df3.json");

const verifyToken = require("./middleware/decodeToken");


admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: "https://city-grow.firebaseio.com",
});


app.get("/", verifyToken, async (req, res) => {
  try {
    const user = await admin.auth().getUser(req.user.uid);
    res.json({
      uid: user.uid,
      email: user.email
      
    });
  } catch (error) {
    res.status(500).json({ error: "Error fetching user data" });
  }
});

app.listen(3000, () => {
  console.log("Server is running on port 3000");
});
