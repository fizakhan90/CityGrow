require("dotenv").config();
const { GoogleGenerativeAI } = require("@google/generative-ai");

const genAI = new GoogleGenerativeAI(process.env.API_KEY);

const analyzeImage = async (imageUrl) => {
  try {
    const model = genAI.getGenerativeModel({ model: "gemini-1.5-flash" });

    const prompt =
      "Describe this image in detail. Carefully analyze the soil condition. What are the main elements?";

    const imageResponse = await fetch(imageUrl);
    const imageBuffer = await imageResponse.arrayBuffer();
    const base64Image = Buffer.from(imageBuffer).toString("base64");

    const imageParts = [
      {
        inlineData: {
          data: base64Image,
          mimeType: "image/jpeg",
        },
      },
    ];

    const result = await model.generateContent([prompt, ...imageParts]);
    const response = await result.response;

    console.log(response.text());
    return response.text();
  } catch (error) {
    console.error("Error analyzing image:", error);
    return null;
  }
};

module.exports = analyzeImage;
