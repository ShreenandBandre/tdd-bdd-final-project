Feature: The product store service back-end
  As a Product Store Owner
  I need a RESTful catalog service
  So that I can keep track of all my products

  Background:
    Given the following products
      | name    | description     | price  | available | category   |
      | Hat     | A red fedora    | 59.95  | True      | CLOTHS     |
      | Shoes   | Blue shoes      | 120.50 | False     | CLOTHS     |
      | Big Mac | 1/4 lb burger   | 5.99   | True      | FOOD       |
      | Sheets  | Full bed sheets | 87.00  | True      | HOUSEWARES |

  ###########################################################
  # Read a Product
  ###########################################################
  Scenario: Read a Product
    When I visit the "Home Page"
    And I set the "Name" to "Hat"
    And I press the "Search" button
    Then I should see the message "Success"
    When I copy the "Id" field
    And I press the "Clear" button
    And I paste the "Id" field
    And I press the "Retrieve" button
    Then I should see the message "Success"
    And I should see "Hat" in the "Name" field
    And I should see "A red fedora" in the "Description" field
    And I should see "True" in the "Available" dropdown
    And I should see "CLOTHS" in the "Category" dropdown
    And I should see "59.95" in the "Price" field

  ###########################################################
  # Update a Product
  ###########################################################
  Scenario: Update a Product
    When I visit the "Home Page"
    And I set the "Name" to "Big Mac"
    And I press the "Search" button
    Then I should see the message "Success"
    When I copy the "Id" field
    And I press the "Clear" button
    And I paste the "Id" field
    And I set the "Description" to "1/2 lb burger"
    And I press the "Update" button
    Then I should see the message "Success"
    And I should see "1/2 lb burger" in the "Description" field

  ###########################################################
  # Delete a Product
  ###########################################################
  Scenario: Delete a Product
    When I visit the "Home Page"
    And I set the "Name" to "Sheets"
    And I press the "Search" button
    Then I should see the message "Success"
    When I copy the "Id" field
    And I press the "Delete" button
    Then I should see the message "Success"
    And I press the "Search" button
    Then I should not see "Sheets" in the product list

  ###########################################################
  # List all Products
  ###########################################################
  Scenario: List all Products
    When I visit the "Home Page"
    And I press the "List All" button
    Then I should see "Hat" in the product list
    And I should see "Shoes" in the product list
    And I should see "Big Mac" in the product list
    And I should see "Sheets" in the product list

  ###########################################################
  # Search Products by Category
  ###########################################################
  Scenario: Search Products by Category
    When I visit the "Home Page"
    And I select "CLOTHS" in the "Category" dropdown
    And I press the "Search" button
    Then I should see "Hat" in the product list
    And I should see "Shoes" in the product list
    And I should not see "Big Mac" in the product list
    And I should not see "Sheets" in the product list

  ###########################################################
  # Search Products by Availability
  ###########################################################
  Scenario: Search Products by Availability
    When I visit the "Home Page"
    And I select "True" in the "Available" dropdown
    And I press the "Search" button
    Then I should see "Hat" in the product list
    And I should see "Big Mac" in the product list
    And I should see "Sheets" in the product list
    And I should not see "Shoes" in the product list

  ###########################################################
  # Search Products by Name
  ###########################################################
  Scenario: Search Products by Name
    When I visit the "Home Page"
    And I set the "Name" to "Shoes"
    And I press the "Search" button
    Then I should see "Shoes" in the product list
    And I should not see "Hat" in the product list
    And I should not see "Big Mac" in the product list
    And I should not see "Sheets" in the product list