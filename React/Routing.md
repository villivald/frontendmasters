## Routing in React

```jsx
import {
  BrowserRouter,
  Route,
  Routes,
  Link,
  useParams,
} from "react-router-dom";

function App() {
  return (
    <BrowserRouter>
      <header>
        <Link to="/">Home</Link>
      </header>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/about" element={<About />} />
        <Route path="/contact" element={<Contact />} />
        <Route path="/contact/:id" element={<ContactDetail />} />
      </Routes>
    </BrowserRouter>
  );
}

const Home = () => {
  return (
    <div>
      <h1>Home</h1>
      <Link to="/about">About</Link>
    </div>
  );
};

const ContactDetail = () => {
  const { id } = useParams();
  return (
    <div>
      <h1>Contact Detail</h1>
      <p>{id}</p>
    </div>
  );
};
```
