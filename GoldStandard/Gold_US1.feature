Feature: Aircrafts - Add a new aircraft
As a fleet manager, 
I want to add new aircrafts with their basic details 
so that they are properly registered and can be tracked in the system.

Background:
    Given the user is logged in as "fleet manager"
    And the user is on the "Aircrafts" page

Scenario: Button "Add new aircraft" displayed
    Then the "Add new aircraft" button should be visible

Scenario: Modal Display
    When the user clicks the "Add new aircraft" button
    Then the "Add new aircraft" modal should be visible

Scenario: Display of elements in modal
    Given the "Add new aircraft" button is clicked
    Then the "Name" input field should be visible
    And the "MSN" input field should be visible
    And the "Manufacturer" dropdown should be visible
    And the "Description" text area should be visible
    And the "Save" button should be visible
    And the "Cancel" button should be visible

Scenario: Dropdown contains all manufacturers
    Given the "Add new aircraft" button is clicked
    Then the "Manufacturer" dropdown should contain all stored manufacturers

Scenario: Validation - Empty "Name" input field
    Given the "Add new aircraft" button is clicked
    When the user leaves the "Name" input field empty
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed for the "Name" input field

Scenario: Validation - Empty "MSN" input field
    Given the "Add new aircraft" button is clicked
    When the user leaves the "MSN" input field empty
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed for the "MSN" input field

Scenario: Validation - Empty "Manufacturer" dropdown
    Given the "Add new aircraft" button is clicked
    When the user does not select an option from the "Manufacturer" dropdown
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed for the "Manufacturer" dropdown

Scenario: Validation - Empty "Description" text area
    Given the "Add new aircraft" button is clicked
    When the user leaves the "Description" text area empty
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed for the "Description" text area

Scenario: Close modal with "Cancel" button
    Given the "Add new aircraft" button is clicked
    When the user clicks the "Cancel" button
    Then the "Add new aircraft" modal should be hidden

Scenario: Close modal with "Cancel" button with inputs
    Given the "Add new aircraft" button is clicked
    When the user enters "<aircraftName>" into the "Name" input field
    And the user enters "<msn>" into the "MSN" input field
    And the user selects "<manufacturer>" from the "Manufacturer" dropdown
    And the user enters "<description>" into the "Description" text area
    And the user clicks the "Cancel" button
    Then the "Add new aircraft" modal should be hidden
    And the page should not contain the value "<aircraftName>"

Scenario: Successful Save
    Given the "Add new aircraft" button is clicked
    When the user enters "<aircraftName>" into the "Name" input field
    And the user enters "<msn>" into the "MSN" input field
    And the user selects "<manufacturer>" from the "Manufacturer" dropdown
    And the user enters "<description>" into the "Description" text area
    And the user clicks the "Save" button
    Then the modal "Add new aircraft" should be hidden
    And the user should be on the detail page of the "<aircraftName>" aircraft
