require("dotenv").config();
const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const admin = require("firebase-admin");
const serviceAccount = require("./city-grow-firebase-adminsdk-fbsvc-bdd511aa52.json");
const verifyToken = require("./middleware/decodeToken");
const userFormRoute = require("./serviceRoutes/userFormRoute");

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  storageBucket: "gs://city-grow.firebasestorage.app",
  databaseURL: "https://city-grow.firebaseio.com",
});


// to check user
app.get("/", verifyToken, async (req, res) => {
  try {
    const user = await admin.auth().getUser(req.user.uid);
    res.json({
      uid: user.uid,
      email: user.email,
    });
    console.log(user);
  } catch (error) {
    res.status(500).json({ error: "Error fetching user data" });
  }
});


//Routes
app.use("/api", userFormRoute);



app.listen(3000, () => {
  console.log("Server is running on port 3000");
});
