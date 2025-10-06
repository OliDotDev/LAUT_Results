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
    Then the "Add new aircraft" modal should be displayed with all fields empty
    When the user clicks the "Save" button
    Then validation messages "This field is required." should appear at "Name", "MSN", "Manufacturer", and "Description"

Scenario: New aircraft added successfully
    When the user clicks the "Add new aircraft" button
    And the user enters "<aircraftName>" into the "Name" input field
    And the user enters "<MSN>" into the "MSN" input field
    And the user selects "<manufacturer>" from the "Manufacturer" dropdown
    And the user enters "<description>" into the "Description" text area
    And the user clicks the "Save" button
    Then the modal should be closed
    And the user should be redirected to the aircraft detail page with details: Name = <aircraftName>, MSN = <MSN>, Manufacturer = <manufacturer>, Description = <description>

Scenario: Add new aircraft cancelled
    When the user clicks the "Add new aircraft" button
    Then the "Add new aircraft" modal should be displayed
    When the user clicks the "Cancel" button
    Then the "Add new aircraft" modal should be closed without adding a new aircraft

Scenario: Add New Aircraft
    When the user clicks the "Add new aircraft" button
    Then the "Add new aircraft" modal should be displayed with fields for "Name", "MSN", "Manufacturer", and "Description"

Scenario: Validation message shown for empty Name field
    When the user clicks the "Add new aircraft" button
    And the user leaves the "Name" input field empty
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed for the "Name" input field

Scenario: Validation message shown for empty MSN field
    When the user clicks the "Add new aircraft" button
    And the user leaves the "MSN" input field empty
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed for the "MSN" input field

Scenario: Validation message shown for empty Manufacturer field
    When the user clicks the "Add new aircraft" button
    And the user leaves the "Manufacturer" dropdown empty
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed for the "Manufacturer" dropdown

Scenario: Validation message shown for empty Description field
    When the user clicks the "Add new aircraft" button
    And the user leaves the "Description" text area empty
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed for the "Description" text area

Scenario: Cancel button closes modal without saving
    When the user clicks the "Add new aircraft" button
    Then the "Add new aircraft" modal should be displayed
    When the user clicks the "Cancel" button
    Then the "Add new aircraft" modal should be closed without saving any data

Scenario: New aircraft detail page displayed after successful addition
    When the user clicks the "Add new aircraft" button
    And the user enters "<aircraftName>" into the "Name" input field
    And the user enters "<MSN>" into the "MSN" input field
    And the user selects a manufacturer from the "Manufacturer" dropdown
    And the user enters "<description>" into the "Description" text area
    And the user clicks the "Save" button
    Then the user should be redirected to the detail page of the newly added aircraft with name "<aircraftName>", MSN "<MSN>", manufacturer selected, and description "<description>"

