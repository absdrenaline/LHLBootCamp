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
import XCTest
@testable import Names

class NamFormatterTest : XCTestCase {
  func test_invertName_GivenAnEmptyString_ShouldReturnEmptyString() {
    let inputName = ""
    let expectedOutput = ""
    
    let nameFormatter = NameFormatter(name: inputName)
    
    XCTAssertEqual(nameFormatter.inverted(), expectedOutput)
  }
  
  func test_invertName_GivenASingleName_ShouldReturnASingleName() {
    let inputName = "name"
    let expectedOutput = "name"
    
    let nameFormatter = NameFormatter(name: inputName)
    
    XCTAssertEqual(nameFormatter.inverted(), expectedOutput)
  }
  
//  return a single name when passed a single name with extra spaces
//  input: " name "
//  output: "name"
  func test_invertName_GivenASingleNameWithSpaces_ShouldReturnASingleNameWithoutSpaces() {
    let inputName = "  name  "
    let expectedOutput = "name"
    
    let nameFormatter = NameFormatter(name: inputName)

    XCTAssertEqual(nameFormatter.inverted(), expectedOutput)
  }
  
//  return a last-name, first-name when passed a first and last-name
//  input: "first last"
//  output: "last, first"
  func test_invertName_GivenFirstAndLastName_ShouldReturnTheInvertedName() {
    let inputName = "first last"
    let expectedOutput = "last, first"
    
    let nameFormatter = NameFormatter(name: inputName)
    
    XCTAssertEqual(nameFormatter.inverted(), expectedOutput)
  }
  
//  return a last-name, first-name when passed a first and last-name with extra spaces around the names (You may want to use regular expressions to detect the whitespace)
//  input: " first last"
//  output: "last, first"
  func test_invertName_GivenFirstAndLastNameWithExtraSpaces_ShouldReturnTheInvertedNameWithoutExtraSpaces() {
    let inputName = "  first last"
    let expectedOutput = "last, first"
    
    let nameFormatter = NameFormatter(name: inputName)
    
    XCTAssertEqual(nameFormatter.inverted(), expectedOutput)
  }
//  return an empty string when passed a single honorific
//  input: "Dr. "
//  output: ""
  func test_invertName_GivenASingleHonorific_ShouldReturnEmptyString() {
    let inputName = "Dr. "
    let expectedOutput = ""
    
    let nameFormatter = NameFormatter(name: inputName)
    
    XCTAssertEqual(nameFormatter.inverted(), expectedOutput)
  }
  
//  return honorific first-name when passed honorific first-name
//  input: "Dr. first"
//  output: "Dr. first"
  func test_invertName_GivenASingleHonorificAndFirstName_ShouldReturnHonorificFirstName() {
    let inputName = "Dr. first"
    let expectedOutput = "Dr. first"
    
    let nameFormatter = NameFormatter(name: inputName)
    
    XCTAssertEqual(nameFormatter.inverted(), expectedOutput)
  }
  
//  return a honorific last-name, first-name when passed honorific first-name last-name
//  input: "Dr. first-name last-name"
//  output: "Dr. last-name, first-name"
  func test_invertName_GivenHonorificFirstAndLastName_ShouldReturnHonorificLastNameAndFirstName() {
    let inputName = "Dr. first_name last_name"
    let expectedOutput = "Dr. last_name, first_name"
    
    let nameFormatter = NameFormatter(name: inputName)
    
    XCTAssertEqual(nameFormatter.inverted(), expectedOutput)
  }
  
//  return a honorific last-name, first-name when passed honorific first-name last-name with extra spaces around the words
//  input: " Dr. first-name last-name "
//  output: "Dr. last-name, first-name"
  func test_invertName_GivenHonorificFirstAndLastNameWithExtraSpaces_ShouldReturnHonorificLastNameAndFirstNameWithoutSpaces() {
    let inputName = " Dr. first_name last_name "
    let expectedOutput = "Dr. last_name, first_name"
    
    let nameFormatter = NameFormatter(name: inputName)
    
    XCTAssertEqual(nameFormatter.inverted(), expectedOutput)
  }
}
