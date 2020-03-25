import UIKit

func sameNumberOfBinaryOnes(number: Int) -> (Int, Int?) {
    let numberofones = number.nonzeroBitCount
    var nextHighestInteger: Int = number
    var nextLowestInteger: Int? = nil
    
    // find next lowest number with same number of nonzero bits
    for i in 0..<number {
        if numberofones == i.nonzeroBitCount {
            nextLowestInteger = i
        }
    }
    
    for i in number+1...number*2 {
        if numberofones == i.nonzeroBitCount {
            nextHighestInteger = i
            break
        }
    }
    if let nextLowestInteger = nextLowestInteger {
        print("nextHighestInteger \(nextHighestInteger), nextLowestInteger \(nextLowestInteger)")
    } else {
        print("nextHighestinteger \(nextHighestInteger), nil")
    }

    return (nextHighestInteger, nextLowestInteger)
}







// Test Cases
sameNumberOfBinaryOnes(number: 3) // returns (nextHighestInteger 5, nil)
sameNumberOfBinaryOnes(number: 42) // returns (nextHighestInteger 44, nextLowestInteger 41)
sameNumberOfBinaryOnes(number: 666) // returns (nextHighestInteger 668, nextLowestInteger 665)
sameNumberOfBinaryOnes(number: 10001) // returns (nextHighestInteger 10002, nextLowestInteger 9996)
sameNumberOfBinaryOnes(number: 22) // returns (nextHighestInteger 25, nextLowestInteger 21)
