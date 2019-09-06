### Challenge

Create a function ```sameNumberOfBinaryOnes(_:)``` that takes any positive integer as an argument and returns the next highest and next lowest integers having the same number of 1s as the passed argument's binary representation. If a solution can not be found for either case (higher or lower), return nil for that case.

```swift
/* Examples: 

sameNumberOfBinaryOnes(12) [1100 in binary] would return 17 [10001  in binary] - the next highest integer with two 1's and 10 [1010 in binary] - the next lowest integer with two 1's

sameNumberOfBinaryOnes(28) [11100 in binary] would return 35 [100011 in binary] - the next highest integer with three 1's and 26 [11010 in binary] - the next lowest integer with three 1's

sameNumberOfBinaryOnes(3) [00000011 in binary] would return 5 [00000101 in binary] - the next highest integer with two 1's and nil - because there is no possible solution for this case.
*/ 
```
Hint #1: You can find the binary representation of an `Integer` by converting it to a `String` – look [here](https://ericasadun.com/2018/12/14/more-fun-with-swift-5-string-interpolation-radix-formatting/) and [here](https://developer.apple.com/documentation/swift/int/2924481-init) for ideas.

Hint #2: Base-2 is binary.

Hint #3: Your return type should be the same as the one I'm always [_gushing_](https://lambdaschoolstudents.slack.com/archives/CDXMT7H5E/p1556389407153800?thread_ts=1556388528.146400) over. Oh, and it should be the named version.

Hint #4: Don’t be afraid to duplicate code as you work towards your final solution – it can sometimes be easier to repeat yourself at first, and refactor once things start working as you intend.

Hint #5: Since `for i in 5...1{ }` results in an infinite loop in Swift, you'll have to find another way to get a reverse range.  Check [here](https://developer.apple.com/documentation/swift/1641185-stride) and [over here](https://developer.apple.com/search/?q=reversed()).

Here are the overall [instructions for code challenges](https://github.com/LambdaSchool/ios-code-challenge-instructions). Before you begin, fork and clone this repo and work through your solution in the included starter playground file. When you're done, **Please make sure to save and push all your work, and submit a Pull Request. Don't forget tag your TL so they can review your submission!**