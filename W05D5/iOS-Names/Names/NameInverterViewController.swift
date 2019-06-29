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

class NameInverterViewController: UIViewController {
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var nameTextInput: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupBackgroundTap()
  }
  
  func setupBackgroundTap() {
    
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapBackground))
    self.view.addGestureRecognizer(tapGesture)
  }
  
  @objc func tapBackground() {
    nameTextInput.resignFirstResponder()
  }
  
  func formatName() {
    guard let name = nameTextInput.text else {
      return
    }
    
    let nameFormatter = NameFormatter(name: name)
    let invertedName = nameFormatter.inverted()
    
    nameLabel.text = invertedName
  }
  
  @IBAction func submitName(_ sender: Any) {
    formatName()
  }
  
}

extension NameInverterViewController: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    formatName()
    return true
  }
}
