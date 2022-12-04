# Observer pattern

The observer pattern can be used for notifying subscribers
when an event occurs.

_observer.js_

```js
const observers = [];

export default Object.freeze({
  notify: (data) => observers.forEach((observer) => observerdata),
  subscribe: (func) => observers.push(func),
  unsubscribe: (func) => {
    [...observers].forEach((observer, index) => {
      if (observer === func) {
        observers.splice(index, 1);
      }
    });
  },
});
```

_index.js_

```js
import Observer from "./observer.js";

Observer.notify("New Data Alert!");

setTimeout(() => {
  Observer.notify("New Data Alert!");
}, 1000);
```

Example of using the observer pattern in an app:

```js
function sendToGoogleAnalytics(data) {
  console.log("Sent to Google analytics: ", data);
}

function sendToCustomAnalytics(data) {
  console.log("Sent to custom analytics: ", data);
}

function sendToEmail(data) {
  console.log("Sent to email: ", data);
}

// Subscribing to the observer
Observer.subscribe(sendToGoogleAnalytics);
Observer.subscribe(sendToCustomAnalytics);
Observer.subscribe(sendToEmail);

// Array to push observer data into
const observers = [];

const Observer = Object.freeze({
  notify: (data) => observers.forEach((observer) => observer(data)),
  subscribe: (func) => observers.push(func),
  unsubscribe: (func) => {
    [...observers].forEach((observer, index) => {
      if (observer === func) {
        observers.splice(index, 1);
      }
    });
  },
});

const pinkBtn = document.getElementById("pink-btn");
const blueBtn = document.getElementById("blue-btn");

pinkBtn.addEventListener("click", () => {
  const data = "🎀 Click on pink button! 🎀";
  Observer.notify(data);
});

blueBtn.addEventListener("click", () => {
  const data = "🦋 Click on blue button! 🦋";
  Observer.notify(data);
});
```

Good: observer helps to monitor the state of the application and notify subscribers when an event occurs.

Bad: decrease in performance in case of a large number of subscribers.
