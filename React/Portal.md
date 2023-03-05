## Portals

```html
<div id="modal"></div>
```

```jsx
import { useEffect, useRef } from "react";
import { createPortal } from "react-dom";

const Modal = ({ children }) => {
  // create a ref to store the DOM element we want to target
  const elRef = useRef(null);
  if (!elRef.current) {
    elRef.current = document.createElement("div");
  }

  useEffect(() => {
    // Add the newly created element to the DOM
    const modalRoot = document.getElementById("modal");
    modalRoot.appendChild(elRef.current);

    // clean up function, removes the element from the DOM when the component unmounts
    return () => modalRoot.removeChild(elRef.current);
  }, []);

  return createPortal(children, elRef.current);
};

export default Modal;
```

```jsx
import { useState } from "react";
import Modal from "./Modal";

const App = () => {
  const [showModal, setShowModal] = useState(false);

  return (
    <div>
      <button onClick={() => setShowModal(true)}>Show Modal</button>
      {showModal ? (
        <Modal>
          <h1>Modal</h1>
          <button onClick={() => setShowModal(false)}>Close Modal</button>
        </Modal>
      ) : null}
    </div>
  );
};
```
