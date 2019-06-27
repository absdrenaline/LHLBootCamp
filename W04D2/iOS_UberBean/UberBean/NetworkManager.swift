// Copyright (c) 2017 Lighthouse Labs. All rights reserved.
// 
// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
// distribute, sublicense, create a derivative work, and/or sell copies of the
// Software in any work that is designed, intended, or marketed for pedagogical or
// instructional purposes related to programming, coding, application development,
// or information technology.  Permission for such use, copying, modification,
// merger, publication, distribution, sublicensing, creation of derivative works,
// or sale is expressly withheld.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit
import MapKit

let kYelpAPIKey = ""

@objc class NetworkManager: NSObject {
  @objc func fetchCafes(userLocation location: CLLocationCoordinate2D, searchTerm: String?, completion: @escaping ([MKAnnotation]?) -> ()) {
    let yelpAPIString = "https://api.yelp.com/v3/businesses/search"
    guard var urlComponents = URLComponents(string: yelpAPIString) else {
      return
    }
    let categoryItem = URLQueryItem(name:"categories", value:"cafes")
    let searchItem =  URLQueryItem(name:"term", value:searchTerm)
    let latItem =  URLQueryItem(name:"latitude", value:String(location.latitude))
    let lngItem =  URLQueryItem(name:"longitude", value:String(location.longitude))
    urlComponents.queryItems = [categoryItem, latItem, lngItem,searchItem]
    
    guard let url = urlComponents.url else {
      return
    }
    var request = URLRequest(url:url);
    request.httpMethod = "GET";
    request.addValue("Bearer \(kYelpAPIKey)", forHTTPHeaderField: "Authorization")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let session = URLSession.shared
    let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
      if let error = error {
        print(error.localizedDescription);
        return;
      }
      
      guard let response = response as? HTTPURLResponse else {
        return
      }
      
      if (response.statusCode != 200) {
        print("Error: status code is equal to \(response.statusCode)");
        return;
      }
      guard let data = data else {
        return
      }
      
      do {
        guard let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String:Any] else {
          print("Unexpected JSON Format")
          return
        }
        
        guard let jsonArray = json["businesses"] as? [AnyObject] else {
          print("The dictionary item businesses not found or is not in correct format")
          return
        }
        var cafes = [Cafe]()
        for item in jsonArray {
          guard let item = item as? [AnyHashable:Any] else {
            print("Business Item is not in correct JSON format")
            continue
          }
          guard let cafe = Cafe(json:item) else {
            print("Failed to create a cafe item from the json data")
            continue
          }
          cafes.append(cafe)
        }
        completion(cafes)
      } catch {
        print(error)
      }
    })
    task.resume()
  }

}

