Feature: Aircrafts - Add a new aircraft
As a fleet manager, I want to add new aircrafts with their basic details so that they are properly registered and can be tracked in the system

Background:
    Given the user is logged in as "Fleet Manager"
    And the user is on the "Aircrafts" page

Scenario: Add new aircraft button displayed
    When the user clicks the "Add new aircraft" button
    Then the "Add new aircraft" modal should be displayed

Scenario: Aircraft added successfully
    When the user clicks the "Add new aircraft" button
    And the user enters "<aircraftName>" into the "Name" input field
    And the user enters "<MSN>" into the "MSN" input field
    And the user selects a value from the "Manufacturer" dropdown
    And the user enters "<description>" into the "Description" text area
    And the user clicks the "Save" button
    Then the modal should be closed
    And the user should be redirected to the new aircraft detail page

Scenario: Modal closed on cancel
    When the user clicks the "Add new aircraft" button
    And the user leaves all required fields empty
    And the user clicks the "Cancel" button
    Then the modal should be closed
    And no new aircraft should be added

