# Container/Presentational Pattern

Container/Presentational pattern is used to separate the logic from the view:

_container/Listings.jsx_

```jsx
import Listings from "./presentational/Listings";

export default function Listings() {
  const [data, setData] = useState(null);

  useEffect(() => {
    fetch("https://house-lydiahallie.vercel.app/api/listings")
      .then((res) => res.json())
      .then((res) => setData(res));
  }, []);

  if (!data) return null;

  return <Listings listings={data.listings} />;
}
```

_presentational/Listings.jsx_

```jsx
import { Listing } from "./Listing"; // single listing component with styles
import { ListingsGrid } from "./ListingsGrid"; // grid component with styles

export default function Listings(props) {
  return (
    <ListingsGrid>
      {props.listings.map((listing) => (
        <Listing key={listing.id} listing={listing} />
      ))}
    </ListingsGrid>
  );
}
```

_App.js_

```jsx
import Listings from "./components/container/Listings";

export default function App() {
  return <Listings />;
}
```
