Feature: Aircrafts - Add a new aircraft
As a fleet manager, I want to add new aircrafts with their basic details so that they are properly registered and can be tracked in the system

Background:
    Given the user is logged in as "Fleet Manager"
    And the user is on the "Aircrafts" page

Scenario: Add new aircraft button displayed
    When the user clicks the "Add new aircraft" button
    Then the "Add new aircraft" modal should be displayed
    And the modal contains an input field for "Name"
    And the modal contains an input field for "MSN"
    And the modal contains a "Manufacturer" dropdown

Scenario: Manufacturer dropdown populated
    When the user clicks the "Add new aircraft" button
    Then the "Manufacturer" dropdown should contain all manufacturers stored in the system

Scenario: Required fields for adding a new aircraft
    When the user clicks the "Add new aircraft" button
    And the user enters a valid name into the "Name" input field
    And the user leaves the "MSN" input field empty
    And the user selects a manufacturer from the "Manufacturer" dropdown
    And the user enters a valid description into the "Description" text area
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed for the "MSN" input field
    When the user enters a valid MSN into the "MSN" input field
    And the user clicks the "Save" button
    Then a new aircraft should be added
    And the modal should be closed
    And the user should be redirected to the new aircraft detail page

Scenario: Validation message shown for empty required field
    When the user clicks the "Add new aircraft" button
    And the user enters "<name>" into the "Name" input field
    And the user leaves the "MSN" input field empty
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed for the "MSN" input field

Scenario: Aircraft added successfully
    When the user clicks the "Add new aircraft" button
    And the user enters "<aircraftName>" into the "Name" input field
    And the user enters "<msn>" into the "MSN" input field
    And the user selects a value from the "Manufacturer" dropdown
    And the user enters "<description>" into the "Description" text area
    And the user clicks the "Save" button
    Then the modal should be closed
    And the user should be redirected to the new aircraft detail page

