## Example of using Redux with toolkit

npm i @reduxjs/toolkit react-redux

**_store.js_**

```js
import { configureStore } from "@reduxjs/toolkit";
import counter from "./slice";
import { apiService } from "./apiService";

// Create store with reducer defined in slice.js
const store = configureStore({
  reducer: {
    counter,
    [apiService.reducerPath]: apiService.reducer, // redux toolkit query
  },
  middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware().concat(apiService.middleware), // redux toolkit query with middleware (cache)
});

export default store;
```

**_slice.js_**

```js
import { createSlice } from "@reduxjs/toolkit";

export const slice = createSlice({
  name: "counter",
  initialState: {
    value: 0,
  },
  reducers: {
    increment: (state) => {
      state.value += 1;
    },
    decrement: (state) => {
      state.value -= 1;
    },
    reset: (state) => {
      state.value = 0;
    },
  },
});

// Export actions
export const { increment, decrement, reset } = slice.actions;
// Export reducer (for store)
export default slice.reducer;
```

**_apiService.js_**

```js
// Example of using redux toolkit query
import { createApi, fetchBaseQuery } from "@reduxjs/toolkit/query/react";

export const apiService = createApi({
  reducerPath: "apiService",
  baseQuery: fetchBaseQuery({
    baseUrl: "https://jsonplaceholder.typicode.com",
  }),
  endpoints: (builder) => ({
    getPosts: builder.query({
      query: () => "/posts",
      transformResponse: (response) => response.slice(0, 10), //optional response transformation
    }),
  }),
});

// Generated by createApi, unique for each endpoint
export const { useGetPostsQuery } = apiService;
```

**_App.jsx_**

```jsx
import { Provider } from "react-redux";
import store from "./store";
import Counter from "./Counter";
import PresentationComponent from "./Presentation";

function App() {
  return (
    // Provide store to all components
    <Provider store={store}>
      <Counter />
      <PresentationComponent />
    </Provider>
  );
}
```

**_Counter.jsx_**

```jsx
import { useDispatch } from "react-redux";
import { increment, decrement, reset } from "./slice";

export default function Counter() {
  // Get dispatch function from store
  const dispatch = useDispatch();

  return (
    <div>
      {/* Use dispatch function to dispatch actions */}
      <button onClick={() => dispatch(increment())}>+</button>
      <button onClick={() => dispatch(decrement())}>-</button>
      <button onClick={() => dispatch(reset())}>Reset</button>
    </div>
  );
}
```

**_PresentationComponent.jsx_**

```jsx
import { useSelector } from "react-redux";
import { useGetPostsQuery } from "./apiService";

export default function PresentationComponent() {
  // Get data from store
  const counter = useSelector((state) => state.counter.value);

  // Use redux toolkit query
  const { data, error, isLoading } = useGetPostsQuery();

  return (
    <div>
      {/* Counter value from store */}
      {counter}

      {/* Redux toolkit query result */}
      {isLoading && <div>Loading...</div>}
      {error && <div>Error: {error}</div>}
      {data && (
        <div>
          {data.map((post) => (
            <div key={post.id}>{post.title}</div>
          ))}
        </div>
      )}
    </div>
  );
}
```