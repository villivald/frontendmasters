## Tanstack Query

https://tanstack.com/query/latest/docs/framework/react/quick-start

```zsh
npm install @tanstack/react-query
npm i -D @tanstack/eslint-plugin-query
npm i -D @tanstack/react-query-devtools
```

**_App.js_**

```jsx
import {
  QueryClient,
  QueryClientProvider,
  useQuery,
} from "@tanstack/react-query";
import fetchPerson from "./fetchPerson";

const queryClient = new QueryClient();

function App() {
  const [id, setId] = useState(1);

  const { isLoading, data } = useQuery({
    queryKey: ["person", id],
    queryFn: () => fetchPerson(id),
    staleTime: 30000,
  });

  if (isLoading) return <h1>Loading...</h1>;

  return (
    <StrictMode>
      <QueryClientProvider client={queryClient}>
        {/* <RouterProvider> */}
          <p>{data.name}</p>
          <p>{data.email}</p>
        {/* </RouterProvider> */}
      </QueryClientProvider>
    </StrictMode>
  );
}
```

**_fetchPerson.js_**

```jsx
const default async function fetchPerson(id) {
  const response = await fetch(
    `https://jsonplaceholder.typicode.com/users/${id}`
  );
  const data = await response.json();

  return data;
};
```

**_useMutation_** can be used to update data on the server.

```jsx
import { useMutation } from "@tanstack/react-query";

const [mutate, result] = useMutation(
  mutationFn: updatePerson,
  onSuccess: () => {
    queryClient.invalidateQueries({ queryKey: ["person", id] });
  }
);
```
