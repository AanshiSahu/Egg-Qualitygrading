const axios = require("axios");
const fs = require("fs");

const image = fs.readFileSync("YOUR_IMAGE.jpg", {
    encoding: "base64"
});

axios({
    method: "POST",
    url: "https://serverless.roboflow.com/egg-quality-grading-1c0ey/1",
    params: {
        api_key: "API_KEY"
    },
    data: image,
    headers: {
        "Content-Type": "application/x-www-form-urlencoded"
    }
})
.then(function(response) {
    console.log(response.data);
})
.catch(function(error) {
    console.log(error.message);
});
const axios = require("axios");

axios({
    method: "POST",
    url: "https://serverless.roboflow.com/egg-quality-grading-1c0ey/1",
    params: {
        api_key: "API_KEY",
        image: "IMAGE_URL"
    }
})
.then(function(response) {
    console.log(response.data);
})
.catch(function(error) {
    console.log(error.message);
});
