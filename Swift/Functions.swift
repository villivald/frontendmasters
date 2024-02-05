func aFunction() {
    print("This is a function")
}

func aFunctionReturn() -> String { // -> String is the return type
    return "This is a function with return"
}

// Function with named parameters
func aFunctionWithArgs(a: Int, b: Int) -> Int {
    return a + b
}
var sum = aFunctionWithArgs(a: 1, b: 2)
print (sum) // 3

// Function with unnamed parameters
func sumVars(_ a: Int, _ b: Int) -> Int {
    return a + b
}
var anotherSum = sumVars(5, 6)
print (anotherSum) // 3

// Function with named and unnamed parameters
func multiply(_ a: Int, with b: Int) -> Int {
    return a * b
}
var product = multiply(10, with: 3)
print (product) // 30
