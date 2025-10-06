Feature: Aircrafts - Add a new aircraft
As a fleet manager, I want to add new aircrafts with their basic details so that they are properly registered and can be tracked in the system

Background:
    Given the user is logged in as "Fleet Manager"
    And the user is on the "Aircrafts" page

Scenario: Add new aircraft button displayed
    Then the "Add new aircraft" button should be displayed

Scenario: Add aircraft modal displayed
    When the user clicks the "Add new aircraft" button
    Then the "Add new aircraft" modal should be displayed
    And the "Name" input field should be visible
    And the "MSN" input field should be visible
    And the "Manufacturer" dropdown should be visible
    And the "Description" text area should be visible
    And the "Save" button should be displayed
    And the "Cancel" button should be displayed

Scenario: Name field required validation shown
    When the user clicks the "Add new aircraft" button
    And the user leaves the "Name" input field empty
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed for the "Name" input field

Scenario: MSN field required validation shown
    When the user clicks the "Add new aircraft" button
    And the user enters "<aircraftName>" into the "Name" input field
    And the user leaves the "MSN" input field empty
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed for the "MSN" input field

Scenario: Description field required validation shown
    When the user clicks the "Add new aircraft" button
    And the user enters "<aircraftName>" into the "Name" input field
    And the user enters "<aircraftMSN>" into the "MSN" input field
    And the user selects "<aircraftManufacturer>" from the "Manufacturer" dropdown
    And the user leaves the "Description" text area empty
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed for the "Description" text area

Scenario: Cancel button closes modal
    When the user clicks the "Add new aircraft" button
    And the user clicks the "Cancel" button
    Then the "Add new aircraft" modal should be closed

Scenario: Aircraft added and redirected
    When the user clicks the "Add new aircraft" button
    And the user enters "<aircraftName>" into the "Name" input field
    And the user enters "<msn>" into the "MSN" input field
    And the user selects "<manufacturer>" from the "Manufacturer" dropdown
    And the user enters "<description>" into the "Description" text area
    And the user clicks the "Save" button
    Then the modal should be closed
    And the user should be redirected to the new aircraft detail page
    And the page should display the value "<aircraftName>" in the "Name" field

Scenario: Manufacturer dropdown populated
    When the user clicks the "Add new aircraft" button
    Then the "Manufacturer" dropdown should contain a list of manufacturers

