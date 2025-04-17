Hamburger dropdown menu

```html
<header>
  <button aria-controls="primary-navigation" aria-expanded="false">
    <!-- see Links.md fro visually-hidden class -->
    <span class="visually-hidden">Menu</span>
    <!-- empty alt for decorative image -->
    <img src="/assets/hamburger.svg" alt="" />
  </button>

  <nav id="primary-navigation" class="primary-navigation">
    <ul role="list">
      <li><a href="#">Discover</a></li>
      <li><a href="#">Guide</a></li>
      <li><a href="#">Faq</a></li>
    </ul>
  </nav>
</header>
```
