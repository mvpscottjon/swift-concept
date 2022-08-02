import Foundation

/// Contains custom function of `map`, `compactMap`, `filter`, `reduce` ,`flatMap`, `forEach`, `removeAll(where:)` 
/// in `Collection` extension.
///
/// Still lack of `sort`, `contains`, `orderedAscending`, `orderedDesending`, , `split`.
extension Collection {

    // MARK: - Map

    func customMap<T>(transform: (Element) -> T ) -> [T] {
        var rs = [T]()
        
        forEach { element in
            rs.append(transform(element))
        }
        return rs
    }
    
    // MARK: - CompactMap
    
    func customCompactMap<T>(transform: (Element) -> T?) -> [T] {
        var rs = [T]()
        
        forEach { element in
            if let trans = transform(element) {
                rs.append(trans)
            }
        }
        
        return rs
    }
    
    // MARK: - Filter
    
    func customFilter(condition: (Element) -> Bool ) -> [Element] {
        var rs = [Element]()
        
        forEach {
            if condition($0) {
                rs.append($0)
            }
        }
        
        return rs
    }
    
    // MARK: - Reduce
    
    func customReduce<Result>(initialValue: Result, nextResult: @escaping (Result, Element) -> Result) -> Result {
        var rs = initialValue
        
        forEach { element in
            rs = nextResult(rs, element)
        }
        
        return rs
    }
    
    // MARK: FlatMap
    
    func customFlatMap<T>(transform: (Element) -> [T]) -> [T] {
        var rs = [T]()
        
        forEach { element in
            rs.append(contentsOf: transform(element))
        }
        
        return rs
    }
    
    // MARK: ForEach
    
    func customForEach(body: (Element) -> Void) {
        for element in self {
            body(element)
        }
    }
    
    // MARK: RemoveAll
    
    func customRemoveAll(where condition: (Element) -> Bool) -> [Element] {
        var rs = [Element]()
        
        forEach { element in
            if !condition(element) {
                rs.append(element)
            }
        }
        
        return rs
    }

    // MARK: - Contains
    
    func customContains(where target: (Element) -> Bool ) -> Bool {
        var isContains = false
        forEach { element in
            if target(element) {
                isContains = true
            }
        }
        
        return isContains
    }
}


// map
let arr = [1, 2, 3, 4, 5]
let mapArr = arr.customMap(transform: { num in
    return "\(num)"
})

print(mapArr)

// compactMap
let arr2 = ["1", "tst", "2", "dds"]
let compactMapArr = arr2.customCompactMap(transform: { Int($0) })

print(compactMapArr)

// filter
let filterMap = arr.customFilter(condition: { $0 > 3})

print(filterMap)


// reduce
let arr3 = [3, 2]
let arr4 = ["1", "3"]
let reduce1 = arr3.customReduce(initialValue: 1, nextResult: { $0 * $1 })
let reduce2 = arr3.customReduce(initialValue: "str:", nextResult: { $0 + "\($1)" })
let reduce3 = arr4.customReduce(initialValue: "str:", nextResult: { $0 + $1 })

print(reduce1)
print(reduce2)
print(reduce3)

// flatMap
let arr5 = [[1], [2, 3], [4, 5]]
let flatMapRs = arr5.customFlatMap(transform: { $0 })
print(flatMapRs)

// forEach

arr.customForEach(body: {
    print($0)
})


// removeAll

let removeAllArr = arr.customRemoveAll(where: { num in
    return num > 3
})

print(removeAllArr)


// contains

let isContains = arr.customContains(where: { $0 > 5 })

print(isContains)
