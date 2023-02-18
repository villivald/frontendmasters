## Programmatically Generating Tests

```js
const properties = [
  "name",
  "age",
  "address",
  "phone",
  "email",
  "job",
  "city",
  "state",
  "zip",
  "country",
];

const ratings = [1, 2, 3, 4, 5, 6, 7];

for (const property of properties) {
  it(`Each person should have a ${property} property`, () => {
    cy.get('[data-cy="person"]').as("person");
    cy.get("@person").should("have.property", property);
  });

  it("should hide the column if clicked", () => {
    cy.get(`[data-cy="column-${property}"]`).click();
    cy.get('[data-cy="person"]').as("person");
    cy.get("@person").should("not.have.property", property);
  });
}

describe("Ratings Filter", () => {
  beforeEach(() => {
    cy.get("#minimum-rating-visibility").as("rating-filter");
  });

  for (const rating of ratings) {
    it(`should only display items with a popularity above ${rating}`, () => {
      cy.get("@rating-filter").invoke("val", rating).trigger("change");
      cy.get('td[headers="popularity-column"]').each(($el) => {
        expect(+$el.text()).to.be.gte(rating);
      });
    });
  }
});
```
