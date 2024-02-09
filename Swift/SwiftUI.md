### Swift based UI framework

Xcode -> New Project -> iOS -> App

- **Body** should "return" a only one view
- **VStack** can be used to stack views vertically
- **HStack** can be used to stack views horizontally
- Elements can be added from the **library**

## Modifiers

- Elements can be modified in jQuery like style:

```swift
Text("Hello, World!")
    .font(.title)
    .foregroundColor(.green)
    .padding()
    .background(.black)
```

- Modifiers can be accessed from library as well
- Inspector can be used to modify the elements also (CTRL + click)
- CTRL + Option + click -> shortcut for the inspector

- **ScrollView** can be used to scroll the content

## Binding data

```swift
struct ContentView: View {
    @State var name = "" // name is a state variable

    var body: some View {
        VStack {
            TextField("Enter your name", text: $name) // $name is a binding
            Text("Hello \(name)") // no $ sign, since the value is displayed only
        }
    }
}
```

## Combininig views

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Greeting() //  Each view has its own state
            Greeting()
            Greeting()
        }
    }
}

struct Greeting: View {
   @State var name = ""

    var body: some View {
        VStack {
            TextField("Enter your name", text: $name)
            Text("Hello \(name)")
        }
    }
}
```

![SwiftUI - Main Concepts]("./images/mainConcepts.png")
![SwiftUI - Basic Views]("./images/views.png")
