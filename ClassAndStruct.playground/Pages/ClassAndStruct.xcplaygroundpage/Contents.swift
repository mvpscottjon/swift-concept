import UIKit

var greeting = "Hello, playground"

protocol Flyable {
    func fly()
}

struct BirdStruct: Flyable {
    let wings: Int

    func fly() {
        print("bird struct fly")
    }
}

// Struct can't be inhered. Only allow inhered protocols
//struct BigBirdStruct: Bird {
//
//}


class BirdClass: Flyable {
    func fly() {
        print("bird class fly")
    }
}

class Eagle: BirdClass {
    override func fly() {
        print("eagle fly")
    }
}


let birdStruct = BirdStruct(wings: 2)
birdStruct.fly()

let birdClass = BirdClass()
birdClass.fly()

let eagle = Eagle()
eagle.fly()
