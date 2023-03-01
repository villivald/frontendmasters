## React Query

npm install @tanstack/react-query

**_App.js_**

```jsx
import {
  QueryClient,
  QueryClientProvider,
  useQuery,
} from "@tanstack/react-query";
import fetchPerson from "./fetchPerson";

const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      staleTime: Infinity, //1000 * 60 * 5, // 5 minutes
      cacheTime: Infinity,
    },
  },
});

function App() {
  const result = useQuery(["person", id], fetchPerson);

  if (result.isLoading) {
    return <h1>Loading...</h1>;
  }

  const person = result.data;

  return (
    <QueryClientProvider client={queryClient}>
      <p>{person.name}</p>
      <p>{person.email}</p>
    </QueryClientProvider>
  );
}
```

**_fetchPerson.js_**

```jsx
const fetchPerson = async ({ queryKey }) => {
  const id = queryKey[1];

  const response = await fetch(
    `https://jsonplaceholder.typicode.com/users/${id}`
  );

  if (!response.ok) {
    throw new Error("Failed to fetch");
  }

  return response.json();

  export default fetchPerson;
};
```
