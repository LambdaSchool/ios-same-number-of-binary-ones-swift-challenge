import UIKit

func sameNumberOfBinaryOnes(number: Int) -> (Int?, Int?) {
    var highNum: Int? = number
    var lowNum: Int? = number
    let topBinary = String(number, radix: 2)
    var binary = ""
    var lowBinary = ""
    
    repeat {
        highNum! += 1
        if let highNum = highNum {
            binary = String(highNum, radix: 2)
        }
        print("HIGHNUM = \(highNum!)")
    } while binary.filter{$0 == "1"}.count != topBinary.filter{$0 == "1"}.count
    
    repeat {
        lowNum! -= 1
        if let lowNum = lowNum {
            lowBinary = String(lowNum, radix: 2)
        }
        if lowNum! == 0 {
            break
        }
        print("LOWNUM = \(lowNum!)")
    } while lowBinary.filter{$0 == "1"}.count != topBinary.filter{$0 == "1"}.count || lowNum! <= 0
    
    if lowNum == 0 {
        lowNum = nil
    }
    
    return (highNum ?? nil, lowNum ?? nil)
}

// Test Cases
sameNumberOfBinaryOnes(number: 3) // returns (nextHighestInteger 5, nil)
sameNumberOfBinaryOnes(number: 42) // returns (nextHighestInteger 44, nextLowestInteger 41)
sameNumberOfBinaryOnes(number: 666) // returns (nextHighestInteger 668, nextLowestInteger 665)
sameNumberOfBinaryOnes(number: 10001) // returns (nextHighestInteger 10002, nextLowestInteger 9996)
sameNumberOfBinaryOnes(number: 22) // returns (nextHighestInteger 25, nextLowestInteger 21)
