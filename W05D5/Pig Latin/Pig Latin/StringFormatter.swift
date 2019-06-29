////  File.swift
// Created: 2019-06-28
//


import Foundation

class StringFormatter: NSObject {
    
    var string: String
    
    init(string: String) {
        self.string = string
        super.init()
    }
    
    func simplePigLatin() -> String {
        var latinized = string
        let firstLetter = latinized.remove(at: latinized.startIndex)
        return "\(latinized)\(firstLetter)ay"
    }
}
