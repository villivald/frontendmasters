## Class Components

```js
import { Component } from "react";

class Carousel extends Component {
  state = {
    active: 0,
  };

  static defaultProps = {
    images: ["http://pets-images.dev-apis.com/pets/none.jpg"],
  };

  handleIndexClick = (event) => {
    this.setState({
      active: +event.target.dataset.index,
    });
  };

  render() {
    const { active } = this.state;
    const { images } = this.props;

    return (
      <div>
        <img src={images[active]} alt="animal" />
        <div>
          {images.map((photo, index) => (
            <img key={photo} src={photo} onClick={this.handleClick} />
          ))}
        </div>
      </div>
    );
  }
}

export default Carousel;
```
