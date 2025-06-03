import UIKit

// Load Image and Convert to Base64
let image = UIImage(named: "your-image-path") // path to image to upload ex: image.jpg
let imageData = image?.jpegData(compressionQuality: 1)
let fileContent = imageData?.base64EncodedString()
let postData = fileContent!.data(using: .utf8)

// Initialize Inference Server Request with API KEY, Model, and Model Version
var request = URLRequest(url: URL(string: "https://serverless.roboflow.com/egg-quality-grading-1c0ey/1?api_key=API_KEY&name=YOUR_IMAGE.jpg")!,timeoutInterval: Double.infinity)
request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
request.httpMethod = "POST"
request.httpBody = postData

// Execute Post Request
URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in

    // Parse Response to String
    guard let data = data else {
        print(String(describing: error))
        return
    }

    // Convert Response String to Dictionary
    do {
        let dict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
    } catch {
        print(error.localizedDescription)
    }

    // Print String Response
    print(String(data: data, encoding: .utf8)!)
}).resume()
