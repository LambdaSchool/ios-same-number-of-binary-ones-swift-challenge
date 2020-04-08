import UIKit
import Foundation


func sameNumberOfBinaryOnes(number: Int) {
    
    guard number > 0 else { return }
    let binary = "\(number, radix: .binary)"
    let ones = binary.digits.filter{$0 == 1}.count
    
    // find highest number
    var highestNumber = number
    let highestNumberBinary = "\(highestNumber, radix: .binary)"
    let highestNumberOnes = highestNumberBinary.digits.filter{$0 == 1}.count
    
    for x in highestNumberOnes...ones {
       highestNumber += x
        print("HIGHEST: \(highestNumber)")
    }
    
    // find highest number
    var lowestNumber = number
    let lowestBinary = "\(lowestNumber, radix: .binary)"
    print(lowestBinary)
    let lowestNumberOnes = lowestBinary.digits.filter{$0 == 1}.count
    
    for x in lowestNumberOnes...ones {
        lowestNumber -= x
        print("LOWEST: \(lowestNumber)")
    }
    
    print( "nextHighestInteger: \(highestNumber), nextLowestInteger: \(String(describing: lowestNumber))")
}


 extension String.StringInterpolation {
    /// Represents a single numeric radix
    enum Radix: Int {
        case binary = 2, octal = 8, decimal = 10, hex = 16
        
        /// Returns a radix's optional prefix
        var prefix: String {
             return [.binary: "0b", .octal: "0o", .hex: "0x"][self, default: ""]
        }
    }
    
    /// Return padded version of the value using a specified radix
    mutating func appendInterpolation<I: BinaryInteger>(_ value: I, radix: Radix, prefix: Bool = false, toWidth width: Int = 0) {
        
        // Values are uppercased, producing `FF` instead of `ff`
        var string = String(value, radix: radix.rawValue).uppercased()
        
        // Strings are pre-padded with 0 to match target widths
        if string.count < width {
            string = String(repeating: "0", count: max(0, width - string.count)) + string
        }
        
        // Prefixes use lower case, sourced from `String.StringInterpolation.Radix`
        if prefix {
            string = radix.prefix + string
        }
        
        appendInterpolation(string)
    }
}

extension StringProtocol  {
    var digits: [Int] { compactMap{ $0.wholeNumberValue } }
}
extension LosslessStringConvertible {
    var string: String { .init(self) }
}
extension Numeric where Self: LosslessStringConvertible {
    var digits: [Int] { string.digits }
}


// Test Cases
sameNumberOfBinaryOnes(number: 3) // returns (nextHighestInteger 5, nil)
//sameNumberOfBinaryOnes(number: 42) // returns (nextHighestInteger 44, nextLowestInteger 41)
//sameNumberOfBinaryOnes(number: 666) // returns (nextHighestInteger 668, nextLowestInteger 665)
sameNumberOfBinaryOnes(number: 10001) // returns (nextHighestInteger 10002, nextLowestInteger 9996)
//sameNumberOfBinaryOnes(number: 22) // returns (nextHighestInteger 25, nextLowestInteger 21)
