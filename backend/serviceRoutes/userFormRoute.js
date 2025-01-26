const express = require("express");
const router = express.Router();
const admin = require("firebase-admin");
const multer = require("multer"); 



const storage = multer.memoryStorage();
const upload = multer({ storage });


const verifyToken = require("../middleware/decodeToken");


router.post("/upload", verifyToken, upload.single("image"), async (req, res) => {
  const { location } = req.body;
  console.log(location);

  if (!req.file || !location) {
    return res.status(400).json({ error: "Image and location are required." });
  }

  try {
    
    const bucket = admin.storage().bucket();
    const uniqueFileName = `${Date.now()}-${req.file.originalname}`;
    const file = bucket.file(uniqueFileName);

    await file.save(req.file.buffer, {
      metadata: { contentType: req.file.mimetype },
      public: true,
    });

    
    const imageUrl = file.publicUrl();

    await admin.firestore().collection("user-Data").add({
      userId: req.user.uid, 
      imageUrl,
      location,
      timestamp: admin.firestore.FieldValue.serverTimestamp(),
    });

    res.status(200).json({ message: "Image and location uploaded successfully.", imageUrl });
  } catch (error) {
    console.error("Error uploading image or saving data:", error);
    res.status(500).json({ error: "Error uploading image or saving data. Please try again." });
  }
});

module.exports = router;
