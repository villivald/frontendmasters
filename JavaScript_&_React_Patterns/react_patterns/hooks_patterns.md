# Hooks pattern

Example of using hook to create effect on hover:

_Hook_

```js
export function useHover() {
  const [isHovering, setIsHovering] = React.useState(false);
  const ref = React.useRef(null);

  const handleMouseOver = () => setIsHovering(true);
  const handleMouseOut = () => setIsHovering(false);

  React.useEffect(() => {
    const node = ref.current;
    if (node) {
      node.addEventListener("mouseover", handleMouseOver);
      node.addEventListener("mouseout", handleMouseOut);
      return () => {
        node.removeEventListener("mouseover", handleMouseOver);
        node.removeEventListener("mouseout", handleMouseOut);
      };
    }
  }, [ref.current]);

  return [ref, isHovering];
}
```

_Usage of hook_

```js
import { useHover } from "../hooks/useHover";

export function Listing() {
  const [ref, isHovering] = useHover();

  React.useEffect(() => {
    if (isHovering) {
      // Add logic here
    }
  }, [isHovering]);

  return (
    <div ref={ref}>
      <ListingCard />
    </div>
  );
}
```

Example of using custom hook to fetch data from API:

_hooks/useListings.js_

```js
import useSWR from "swr"; //React Hooks for Data Fetching

const fetcher = (url) => fetch(url).then((res) => res.json());

export function useListings() {
  const { data, error } = useSWR(
    "https://house-lydiahallie.vercel.app/api/listings",
    fetcher
  );

  if (error) return <div>failed to load</div>;
  if (!data) return <div>loading...</div>;

  return data;
}
```

_Listings.js_

```js
import { useListings } from "../hooks/useListings";

export function Listings() {
  const listings = useListings(); //Using hook to fetch data

  return (
    <ListingsGrid>
      {listings.map((listing) => (
        <Listing key={listing.id} listing={listing} />
      ))}
    </ListingsGrid>
  );
}
```
