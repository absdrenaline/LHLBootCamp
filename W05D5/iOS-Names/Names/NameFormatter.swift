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

import Foundation

class NameFormatter {
  
  let name: String
  
  init(name: String) {
    self.name = name
  }
  
  func inverted() -> String {
    if name == "" {
      return ""
    }
    
    let range = NSRange(location: 0, length: name.utf16.count)
    let regex = try! NSRegularExpression(pattern: "(?<honorific>\\w+[.])?\\s*(?<first>\\w+)(\\s+(?<last>\\w+))?\\s*$")
    guard let matches = regex.firstMatch(in: name, options: [], range: range) else {
      return ""
    }
    guard let first = Range(matches.range(withName:"first"),in:name) else {
      return ""
    }
    var result = String(name[first])
    
    if let last = Range(matches.range(withName:"last"),in:name) {
      result = "\(name[last]), \(result)"
    }
    
    if let honorific = Range(matches.range(withName: "honorific"),in:name) {
       result = "\(name[honorific]) \(result)"
    }
    
    print(result)
    return result
  }
  
}
