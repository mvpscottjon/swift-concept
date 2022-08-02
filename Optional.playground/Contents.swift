import Foundation

/// A `CustomOption` enum which has effect like `Swift.Optional`.
enum CustomOptional<Wrapped>: ExpressibleByNilLiteral {
    case some(Wrapped)
    case none
    
    init(nilLiteral: ()) {
        self = .none
    }
    
    func unwrap() -> Wrapped? {
        switch self {
        case .none:
            return nil
        case .some(let wrapped):
            return wrapped
        }
    }
    
}

/// Extension to conform Equatable protocol.
extension CustomOptional: Equatable where Wrapped: Equatable {
    static func == (lhs: CustomOptional<Wrapped>, rhs: CustomOptional<Wrapped>) -> Bool {
        switch (lhs, rhs) {
        case let (l, r):
            return l.unwrap() == r.unwrap()
        case (nil, nil):
            return true
        default:
            return false
        }
    }
}

// MARK: - Use some or none value

let someValue = CustomOptional<String>.some("has value")
let someValue2 = CustomOptional<String>.some("has value")
let someValue3 = CustomOptional<String>.some("different value")
let noneValue = CustomOptional<String>.none

// expect `some("has value")`
print(someValue)

// expect `none`
print(noneValue)

print("========")

// MARK: - Use Unwrap value

// expect Optional("has value")
print(someValue.unwrap() as Any)

// expect nil
print(noneValue.unwrap() as Any)

// equal
print(someValue == someValue2)

// not equal
print(someValue == noneValue)

// not equal

print(someValue3 == someValue2)




