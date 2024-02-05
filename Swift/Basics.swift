// Variables
var x = 10 // VAR -> mutable
var name = "Giuseppe" // Option + click -> to see the type

let y = 20 // LET -> CONSTANT, should be used as much as possible

var price: Double = 10.99 // Explicit type
var otherPrice = 329.99 // Implicit type (also Double)
let string: String // String in double quotes
let integer: Int
let boolean: Bool // true or false
let any: Any // Any type, not preferred unless necessary

let city: (String, Int) = ("New York", 200_000) // Tuple
let state: (name: String, population: Int) = ("California", 40_000_000) // Named tuple

// Console log
print(name) // Giuseppe

// Functions
func greet() {
    print(name)
}

greet() // Giuseppe

// Conditional
if name == "Giuseppe" {
    print("Hello \(name)") // String literal
} else {
    print("Hello stranger")
} // Hello Giuseppe

while x < 10 {
    x += 1
}
print(x) // 10

// Visiblity
public var visible = 1 // Everything is public by default
private var invisible = 2 // Only visible inside the structure
fileprivate var kindOfVisible = 3 // Only visible inside the file

// Null safety
class Person {
    var name: String? = nil // Optional type with nil value
    var coords: (Int, Int)? // Optional tuple
}

var something: String? // = "cheburek"

//var data = something!.count // Explicit optional unwrap, will crash if nil
var anotherData = something?.count // Safe operator, will not crash if nil
var countOrDefault = something?.count ?? 0 // Nil coalescing operator

// print(data) // 8 - Int OR crash
print(anotherData) // Optional(8) - Int? OR nil
print(countOrDefault) // 8 - Int OR 0

// If let
if let something = something { // Unwrap the optional
    print(something.count)
} else {
    print("No value")
}
