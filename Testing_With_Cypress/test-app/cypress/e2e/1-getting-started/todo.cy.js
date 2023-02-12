/// <reference types="cypress" />

describe("Test an example app", () => {
  beforeEach(() => {
    cy.visit("https://koripallopaikat.com");
  });

  it("img should exist", () => {
    cy.get("img").should("have.class", "introImage").should("exist");
  });

  it("Should have the title", () => {
    const title = "Koripallopaikat";
    cy.contains(title);
  });

  it("click the Contact link and go to the right page", () => {
    cy.get("a").contains("Contact").click();
    cy.url().should("include", "/contact");
  });

  it("Send email from contact form", () => {
    cy.get("a").contains("Contact").click();
    cy.get("input").eq(0).type("Testi");
    cy.get("input").eq(1).type("hello@there.com");
    cy.get("textarea").eq(0).type("This is a test message");
    cy.get("form").submit();
    cy.get("h2").should("contain", "Thank you for your message");
  });

  it("User can sort courts by amount of baskets", () => {
    cy.get("a").contains("Search").click();
    cy.get(":nth-child(2) > .MuiSwitch-root > .MuiButtonBase-root").click();
    cy.get(".MuiCardContent-root").eq(0).should("contain", "8 baskets");
    cy.get(".MuiCardContent-root").eq(1).should("contain", "6 baskets");
    cy.get(".MuiCardContent-root").eq(-1).should("contain", "1 basket");
  });

  it("Each card has content", () => {
    cy.get("a").contains("Search").click();
    cy.get(".MuiCard-root").each(($items) => {
      //every item has a link
      expect($items.find("a")).to.exist;
    });
  });

  it("Each card has content", () => {
    cy.get(".MuiPaper-root").each(($item) => {
      cy.wrap($item).find("img").should("exist");
      // all items except first have five links
      if ($item.index() > 0) {
        cy.wrap($item).find("a").should("have.length", 5);
      }
    });
  });
});
