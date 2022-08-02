import Foundation

struct MathCalculator {
    func sum<T: Numeric>(nums: [T]) -> T? {
        var total:T?
        
        for num in nums {
            if let tmp = total {
                total = tmp + num
            } else {
                total = num
            }
        }
        
        return total
    }
}


let calculator = MathCalculator()

print(calculator.sum(nums: [2, 3, 1]))

