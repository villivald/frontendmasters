## Keyframes

```css
.ball {
  animation-name: move-like-a-square, red-to-blue, shake;
  animation-delay: 1s; /* delay between each iteration */
  animation-duration: 2s;
  animation-fill-mode: both; /* or forwards, backwards, none */
  animation-iteration-count: infinite; /* or 3, 5, etc. */
  animation-direction: alternate; /* or normal, reverse, alternate-reverse */
  animation-timing-function: ease-in-out;
  animation-play-state: running; /* or paused */

  /*shorthand*/
  animation: move-like-a-square 2s 1s infinite alternate both ease-in-out;
}

@keyframes move-like-a-square {
  /*from*/
  0% {
    transform: none;
  }
  25% {
    animation-timing-function: linear; /* can be set to each keyframe */
    transform: translateX(20vw);
  }
  50% {
    transform: translateX(20vw) translateY(20vh);
  }
  75% {
    transform: translateY(20vh);
  }
  /*to*/
  100% {
    transform: none;
  }
}

@keyframes red-to-blue {
  from {
    background-color: red;
  }
  to {
    background-color: blue;
  }
}

@keyframes shake {
  from,
  to {
    transform: none;
  }

  10%,
  30%,
  50%,
  70%,
  90% {
    transform: translate3d(-1px, 2px, 2px);
  }

  20%,
  40%,
  60%,
  80% {
    transform: translate3d(2px, -1px, 1px);
  }
}
```

Keyframes can be inspected in the browser dev tools -> CMD + Shift + P -> Show Animation
