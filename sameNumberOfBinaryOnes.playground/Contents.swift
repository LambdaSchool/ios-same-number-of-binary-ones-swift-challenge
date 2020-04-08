import UIKit

func sameNumberOfBinaryOnes(number: Int) -> (nextHighest: Int?, nextLowest: Int?) {
    
    func numberOfOnes(in number: Int) -> Int {
        let currentBinary = String(number, radix: 2)
        return currentBinary.filter { (char: Character) -> Bool in char == "1" }.count // Calculate number of "1" in binary
    }

    let targetOnes = numberOfOnes(in: number)
    var nextHighest: Int? = nil
    var nextLowest: Int? = nil

    for i in number + 1 ... Int.max {
        if numberOfOnes(in: i) == targetOnes {
            nextHighest = i
            break
        }
    }

    for i in (0 ..< number).reversed() { // Do the reverse the find the next lowest integer
        if numberOfOnes(in: i) == targetOnes {
            nextLowest = i
            break
        }
    }

    return (nextHighest, nextLowest)
}

sameNumberOfBinaryOnes(number: 3)
sameNumberOfBinaryOnes(number: 42)

for i in (0 ... 42).reversed() {
    print(i )
}


// Test Cases
//sameNumberOfBinaryOnes(number: 3) // returns (nextHighestInteger 5, nil)
//sameNumberOfBinaryOnes(number: 42) // returns (nextHighestInteger 44, nextLowestInteger 41)
//sameNumberOfBinaryOnes(number: 666) // returns (nextHighestInteger 668, nextLowestInteger 665)
//sameNumberOfBinaryOnes(number: 10001) // returns (nextHighestInteger 10002, nextLowestInteger 9996)
//sameNumberOfBinaryOnes(number: 22) // returns (nextHighestInteger 25, nextLowestInteger 21)


