## Typing API response

```tsx
const fetchSomeData = async () => {
  const response = await fetch("https://api.example.com/some-data");
  return response.json();
};

type SomeData = {
  title: string;
  description: string;
};

const App = () => {
  const [data, setData] = useState<SomeData | undefined>();

  const [dataArray, setDataArray] = useState<SomeData[]>([]);

  useEffect(() => {
    fetchSomeData().then((data) => setData(data));
  }, []);

  return (
    <div>
      {data && (
        <div>
          <h1>{data.title}</h1>
          <p>{data.description}</p>
        </div>
      )}
      {/* {dataArray.map((data) => ( ... */}
  );
};
```
