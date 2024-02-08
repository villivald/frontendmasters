func requestData(callback: (String)->Void) {
    callback("Hello, World!")
}
requestData(callback: { data in
    print(data)
})

// The same as above, but using trailing closure syntax
requestData { data in
    print(data)
}