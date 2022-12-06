# High Order Component pattern

This pattern is used to pass logics to components by wrapping them.

_HOC_

```js
export function withStyles(Component) {
  return (props) => {
    const style = {
      color: "red",
      fontSize: "1em",
      ...props.style,
    };

    return <Component {...props} style={style} />;
  };
}
----------------------------------------
export function withLoader(Element, url) {
  return (props) => {
    const [data, setData] = React.useState(null);

    React.useEffect(() => {
      fetch(url)
        .then((res) => res.json())
        .then((res) => setData(res));
    }, []);

    if (!data) return <LoadingSpinner />;

    return <Element {...props} data={data} />;
  };
}
```

_Using HOC_

```js
import { withStyles, withLoader } from "./hoc/withHocs";

const Text = () => <p style={{ fontFamily: "Inter" }}>Hello world!</p>;

const StyledText = withStyles(Text); // This will have a red color, the font size will be 1em, and the font family will be Inter.
----------------------------------------
export function Listings(props) {
  return (
    <ListingsGrid>
      {props.data.listings.map((listing) => (
        <Listing key={listing.id} listing={listing} />
      ))}
    </ListingsGrid>
  );
}

export default withLoader(
  // This will have a loading spinner until the data is fetched.
  Listings,
  "https://house-lydiahallie.vercel.app/api/listings"
);
```
