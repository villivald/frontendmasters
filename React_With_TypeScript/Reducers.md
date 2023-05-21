## Typing reducers

```tsx
import React, { useReducer, ChangeEvent } from "react";

interface FormState {
  publisherName: string;
  publicationName: string;
}

interface FormAction {
  field: string;
  value: string;
}

const initialState: FormState = {
  publisherName: "",
  publicationName: "",
};

const formReducer = (state: FormState, action: FormAction): FormState => {
  return {
    ...state,
    [action.field]: action.value,
  };
};

const App: React.FC = () => {
  const [form, dispatch] = useReducer(formReducer, initialState);

  const handleInputChange = (e: ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    dispatch({ field: name, value: value });
  };

  return (
    <form>
      <input
        type="text"
        name="publisherName"
        value={form.publisherName}
        onChange={handleInputChange}
      />
      <input
        type="text"
        name="publicationName"
        value={form.publicationName}
        onChange={handleInputChange}
      />
    </form>
  );
};

export default App;
```
