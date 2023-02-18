### Aliases

```js
//Define aliases
cy.get('[data-cy="search-input"]').as("searchInput");
cy.get('[data-cy="search-button"]').as("searchButton");

//Use aliases
cy.get("@searchInput").type("Helsinki");
cy.get("@searchButton").click();
```

Aliases can be defined in beforeEach() section of the test. This way they are available in all tests.

```js
describe("Search", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000");

    cy.get('[data-cy="search-input"]').as("searchInput");
    cy.get('[data-cy="search-button"]').as("searchButton");

    cy.get('[data-cy="city"]').as("cities");
  });

  it("Searches for Helsinki", () => {
    cy.get("@searchInput").type("Helsinki");
    cy.get("@searchButton").click();
    cy.get("@searchInput").should("have.value", "Helsinki");
  });

  it("Searches for Turku", () => {
    cy.get("@searchInput").type("Turku");
    cy.get("@searchButton").click();
    cy.get("@searchInput").should("have.value", "Turku");
  });

  it("Searches for Oulu", () => {
    // Alias can be also used to select a specific element from a list inside of a particular test
    cy.get("@cities").first().as("Oulu");
    cy.get("@Oulu").click();
    cy.get("@searchInput").should("have.value", "Oulu");
  });
});
```
