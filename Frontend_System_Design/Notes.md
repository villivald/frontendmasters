Frontend:

- API Communication
- UI Data Management
- User Interface Interactions
- Assets Management

Box model:
![Box Model](./images/box-sizing.png)
![Block box](./images/box_block.png)
![Inline box](./images/box_inline.png)

[CSS Triggers List – What Kind of Changes You Can Make](https://csstriggers.com/)

DOM Querying:

- getElementByID O(1) - best performance
- getElementsByClassName O(n) - slow, but low-memory overhead
- getElementsByTagName O(n) - slow, but low-memory overhead
- querySelector O(1)/O(n) - close to getElementById, slightly slower
- querySelectorAll O(n) - potentially high-memory overhead

![Best practices regarding query selectors performance](./images/css_query_performance.png)

Observer API:

![Intersection Observer](./images/intersection_observer.png)
![Mutation Observer](./images/mutation_observer.png)
![Resize Observer](./images/resize_observer.png)
![Resize vs other options](./images/resize_vs_other_options.png)

Application state:

- Every field in the data object should be atomic, e.g

  ```javascript
  {
    id: 1,
    name: 'John',
    age: 25,
    job_id: "XYZ",
    job_title: "Software Engineer"
    job_description: "Developing software"
    }

    // instead of

    {
      id: 1,
      name: 'John',
      age: 25,
      job: {
        id: "XYZ",
        title: "Software Engineer",
        description: "Developing software"
      }
    }
  ```

- Data has primary keys
- Non-primary keys depend on entity primary keys

![Storage options](./images/types_of_storage.png)
