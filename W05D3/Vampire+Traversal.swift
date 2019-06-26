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

class Vampire {
  
  var name: String
  var yearConverted: Int
  var offspring: [Vampire] = []
  var creator: Vampire?
  
  init(name: String, yearConverted: Int) {
    self.name = name
    self.yearConverted = yearConverted
  }
  
  // MARK: Simple tree methods
  
  /// Adds the vampire as an offspring of this vampire
  func add(offspring: Vampire) {
    offspring.creator = self
    self.offspring.append(offspring)
  }
  
  /// The total number of vampires created by that vampire
  var numberOfOffspring: Int {
    return offspring.count
  }
  
  /// Returns the number of vampires away from the original vampire this vampire is
  var numberOfVampiresFromOriginal: Int {
    guard let creator = self.creator else {
      return 0
    }
    
    return 1 + creator.numberOfVampiresFromOriginal
  }
  
  /// Returns true if this vampire is more senior than the other vampire. (Who is closer to the original vampire)
  func isMoreSenior(than vampire: Vampire) -> Bool {
    return self.numberOfVampiresFromOriginal < vampire.numberOfVampiresFromOriginal
  }
  
  // MARK: Tree traversal methods
  
  /// Returns the vampire object with that name, or null if no vampire exists with that name
  func vampire(withName name: String) -> Vampire? {
    if self.name == name {
      return self
    } else {
      for vampire in offspring {
        if let matchedVampire = vampire.vampire(withName:name) {
          return matchedVampire
        }
      }
      return nil
    }
  }
  
  /// Returns the total number of vampires that exist
  var totalDescendent: Int {
    var count = 0
    for vampire in offspring {
      count += vampire.totalDescendent + 1
    }
    return count
  }
  
  /// Returns an array of all the vampires that were converted after 1980
  var allMillennialVampires: [Vampire] {
    var vampires = [Vampire]()
    if self.yearConverted > 1980 {
      vampires.append(self)
    }
    
    for vampire in offspring {
      vampires += vampire.allMillennialVampires
    }
    
    return vampires
  }
  
  // MARK: Stretch 
  
  /**
    Returns the closest common ancestor of two vampires.
    The closest common anscestor should be the more senior vampire if a direct ancestor is used.
 
    - Example:
      * when comparing Ansel and Sarah, Ansel is the closest common anscestor.
      * when comparing Ansel and Andrew, Ansel is the closest common anscestor.
   */
  func closestCommonAncestor(vampire: Vampire) -> Vampire {
    if self === vampire || self.creator == nil {
        return self
    } else if vampire.creator == nil {
      return vampire
    }
    if vampire.isMoreSenior(than: self) {
      return self.creator!.closestCommonAncestor(vampire: vampire)
    } else if self.isMoreSenior(than: vampire) {
      return vampire.creator!.closestCommonAncestor(vampire: self)
    }
    return self.creator!.closestCommonAncestor(vampire: vampire.creator!)
  }
}
