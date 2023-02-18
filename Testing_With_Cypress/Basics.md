### Basic tests

```js
describe("Test Koripallopaikat app", () => {
  // runs before each test
  beforeEach(() => {
    cy.visit("https://koripallopaikat.com");
  });

  it("Intro img should exist", () => {
    cy.get("img").should("have.class", "introImage").should("exist");
  });

  it("Should have the title", () => {
    const title = "Koripallopaikat"; // variable
    cy.contains(title); // check if the title is in the page
  });

  it("User should click the Contact link and go to the right page", () => {
    cy.get("a").contains("Contact").click(); // click the link
    cy.url().should("include", "/contact"); // check the url
  });

  it("Send email from contact form", () => {
    cy.get("a").contains("Contact").click(); // click the link
    cy.get("input").eq(0).type("Testi"); // type in the first input field
    cy.get("input").eq(1).type("hello@there.com"); // type in the second input field
    cy.get("textarea").eq(0).type("This is a test message"); // type in the textarea
    cy.get("form").submit(); // submit the form
    cy.get("h2").should("contain", "Thank you for your message"); // check if the message is in the page
  });

  it("User can sort courts by amount of baskets", () => {
    cy.get("a").contains("Search").click(); // click the link
    cy.get(":nth-child(2) > .MuiSwitch-root > .MuiButtonBase-root").click(); // click the switch
    cy.get(".MuiCardContent-root").eq(0).should("contain", "8 baskets"); // check the first card
    cy.get(".MuiCardContent-root").eq(1).should("contain", "6 baskets"); // check the second card
    cy.get(".MuiCardContent-root").eq(-1).should("contain", "1 basket"); // check the last card
  });

  it("Each card has content", () => {
    cy.get("a").contains("Search").click(); // click the link
    cy.get(".MuiCard-root").each(($items) => {
      // loop through each card
      expect($items.find("a")).to.exist; // check that each card has a link
    });
  });

  it("Each card on main page (except the first one) has an image an exactly five links", () => {
    // loop through each card
    cy.get(".MuiPaper-root").each(($item) => {
      cy.wrap($item).find("img").should("exist"); // check that each card has an image
      // skip the first card
      if ($item.index() > 0) {
        cy.wrap($item).find("a").should("have.length", 5); // check that each card has exactly five links
      }
    });
  });
});
```
