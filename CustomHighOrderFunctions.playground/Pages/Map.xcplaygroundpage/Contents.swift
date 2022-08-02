import Foundation

/// A generic map function for any type
func newMap<T, U>(target: T, transform: (T) -> U) -> U{
    return transform(target)
}

let obj = 5

let newMapObj = newMap(target: 5, transform: { num in
    return "\(num)"
})

print(newMapObj)

