## Transitions

```css
.ball {
  background: red;
  /* this transition will apply when the mouse is moved from the element */
  transition: all /*property*/ 1s /*duration*/ 0.5s /*delay*/ ease-in-out
    /*function*/;
  /* The more specific syntax:
    transition-property: background, transform;
    transition-duration: 0.5s, 3s; -> can not set to zero
    transition-delay: 0s, 0.5s;
    transition-timing-function: ease-in-out, linear;
    */
}

.ball:hover {
  /* transition will apply on hover */
  transition: all 2s 0.5s linear;
  /* cat be used to override the line above - transition will apply only to the transform property:
  transition-property: transform; */
  background: blue;
  transform: scale(2);
}
```
