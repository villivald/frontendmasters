typealias Distance = Float
typealias Coordinate = (Int, Int)

enum Language {
    case Swift
    case ObjectiveC
    case C
    case Java
}

class Person {
    var name = "John"
    var age = 25

    init(withName name: String, andAge age: Int) {
        self.name = name
        self.age = age
    }

    func print() {
        print("Name: \(name), Age: \(age)")
    }
}

class Customer: Person {
    var email = ""
}

struct ApiResponse {
    var status: Int
    var data: [String]
}

protocol Printable {
    func print()
}