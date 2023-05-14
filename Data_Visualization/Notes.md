## Data Visualization Tools

- [D3](https://frontendmasters.com/courses/d3/)
- [Vega-Lite](https://observablehq.com/@observablehq/vega-lite?collection=@observablehq/observable-for-vega-lite)
- [Arquero](https://observablehq.com/@uwdata/introducing-arquero)
- [tidy.js](https://observablehq.com/@pbeshai/tidy-js-intro-demo)
- [Observable Plot](https://observablehq.com/plot/)
- [more...](https://cube.dev/blog/dataviz-ecosystem-2021)

## Using Plot with JS & React

[Instructions](https://observablehq.com/@anjana/dvfs-using-plot-around-the-web?collection=@anjana/data-visualization-first-steps)

npm i @observablehq/plot

```jsx
import * as Plot from "@observablehq/plot";
import { useRef, useEffect, useState } from "react";

const MyPlot = ({ data }) => {
  const ref = useRef();

  useEffect(() => {
    const dotPlot = Plot.dot(data, {
      x: "timestamp",
      y: "duration",
      fill: "path",
      fillOpacity: 0.5,
      title: (d) =>
        [d.path, `${d.duration} ms`, `status ${d.status_code}`].join("\n"),
    }).plot({
      marginTop: 50,
      marginLeft: 50,
    });

    ref.current.append(dotPlot);

    return () => dotPlot.remove();
  }, [data]);

  return <div ref={ref}></div>;
};

const App = () => {
  const exampleDataset = [
    {
      duration: 2731,
      status_code: 304,
      path: "/files/search",
      timestamp: "2021-05-09T09:51:54.884Z",
    },
    {
      duration: 2802,
      status_code: 304,
      path: "/files/search",
      timestamp: "2021-04-22T21:29:25.553Z",
    },
  ];

  return (
    <MyPlot
      data={exampleDataset.map((d) => ({
        ...d,
        timestamp: new Date(d.timestamp),
      }))}
    />
  );
};
```
