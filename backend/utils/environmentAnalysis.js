const axios = require("axios");
require("dotenv").config();

const getAltitude = async (latitude, longitude) => {
  const url = `https://maps.googleapis.com/maps/api/elevation/json?locations=28.6139,77.2090&key=${process.env.MAPS_KEY}`;
  const response = await axios.get(url);
  console.log(response.data.results[0]?.elevation);
  return response.data.results[0]?.elevation || "N/A";
};

// const getSoilType = async (latitude, longitude) => {
//     const url = `${SOILGRIDS_API_URL}?lon=${longitude}&lat=${latitude}`;
//     const response = await axios.get(url);
//     return response.data.properties?.TAXNWRB?.classification || "Unknown";
//   };

getAltitude();
