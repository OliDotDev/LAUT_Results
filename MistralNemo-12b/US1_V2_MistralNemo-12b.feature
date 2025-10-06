Feature: Aircrafts - Add a new aircraft
As a fleet manager, I want to add new aircrafts with their basic details so that they are properly registered and can be tracked in the system

Background:
    Given the user is logged in as "Fleet Manager"
    And the user is on the "Aircrafts" page

Scenario: Add new aircraft button displayed
    Then the "Add new aircraft" button should be displayed

Scenario: Add new aircraft modal opened
    When the user clicks the "Add new aircraft" button
    Then the "Add new aircraft" modal should be displayed with input fields for "Name", "MSN", and "Manufacturer", a text area for "Description", and "Save/Cancel" buttons

Scenario: Required fields validation shown
    When the user clicks the "Add new aircraft" button
    And the user leaves all fields empty in the "Add new aircraft" modal
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed next to each of the following fields: Name, MSN, Manufacturer, Description

Scenario: New aircraft added successfully
    When the user clicks the "Add new aircraft" button
    And the user enters "<aircraftName>" into the "Name" input field
    And the user enters "<MSN>" into the "MSN" input field
    And the user selects a manufacturer from the "Manufacturer" dropdown
    And the user enters "<description>" into the "Description" text area
    And the user clicks the "Save" button
    Then the modal should be closed
    And the user should be redirected to the new aircraft detail page

Scenario: Add new aircraft cancelled
    When the user clicks the "Add new aircraft" button
    Then the "Add new aircraft" modal should be displayed
    When the user clicks the "Cancel" button
    Then the "Add new aircraft" modal should be closed without adding a new aircraft

Scenario: Add new aircraft modal displayed
    When the user clicks the "Add new aircraft" button
    Then the "Add new aircraft" modal should be displayed
    And the modal contains input fields for "Name", "MSN", and "Description"
    And the modal contains a "Manufacturer" dropdown with all manufacturers stored in the system
    And the modal contains "Save" and "Cancel" buttons

Scenario: Validation messages shown for empty fields
    When the user clicks the "Add new aircraft" button
    And the user leaves all fields empty in the "Add new aircraft" modal
    And the user clicks the "Save" button
    Then validation messages should be shown next to Name, MSN, Manufacturer, and Description fields

Scenario: Manufacturer dropdown populated
    When the user clicks the "Add new aircraft" button
    Then the "Manufacturer" dropdown should contain all manufacturers stored in the system

Scenario: Modal closed on Cancel click
    When the user clicks the "Add new aircraft" button
    And the user clicks the "Cancel" button in the "Add new aircraft" modal
    Then the "Add new aircraft" modal should be closed

