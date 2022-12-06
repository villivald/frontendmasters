# Prototype pattern

Protype pattern can be used when we need to share properties among differet object of the same type:

_FACTORY PATTERN_

```js
const createDog = (name, bread) => ({
  // Will vary for each dog
  name,
  bread,
  // Will exist in prorotype object and be the same for all dogs
  bark: () => console.log("Woof!"),
});

const dog1 = createDog("Rex", "Labrador");
const dog2 = createDog("Lassie", "Collie");
```

**VS**

_PROTOTYPE PATTERN_

```js
class Dog {
  constructor(name, bread) {
    this.name = name;
    this.bread = bread;
  }

  bark() {
    console.log(`${this.name} is barking!`);
  }
  wagTail() {
    console.log(`${this.name} is wagging their tail!`);
  }
}

const dog1 = new Dog("Pjotr", "Labrador");
const dog2 = new Dog("Sam", "Collie");
```

Good: The prototype pattern approach is more memory efficient.

Bad: If there are many nested classes, it can be hard to keep track of where certain property comes from.
