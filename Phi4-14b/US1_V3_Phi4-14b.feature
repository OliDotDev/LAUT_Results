Feature: Aircrafts - Add a new aircraft
As a fleet manager, I want to add new aircrafts with their basic details so that they are properly registered and can be tracked in the system

Background:
    Given the user is logged in as "Fleet Manager"
    And the user is on the "Aircrafts" page

Scenario: Add new aircraft button displayed
    Then the "Add new aircraft" button should be displayed

Scenario: Modal opened on clicking 'Add new aircraft'
    When the user clicks the "Add new aircraft" button
    Then the "Add new aircraft" modal should be displayed
    And the "Name" input field should be visible
    And the "MSN" input field should be visible
    And the "Manufacturer" dropdown should be visible
    And the "Description" text area should be visible
    And the "Save" button should be displayed
    And the "Cancel" button should be displayed

Scenario: Required field validation messages shown
    When the user clicks the "Add new aircraft" button
    And the modal displays and the user leaves any of the "Name", "MSN", "Manufacturer", or "Description" fields empty
    And the user clicks the "Save" button
    Then a validation message "This field is required." should be shown for each empty field

Scenario: Modal closed without saving on 'Cancel'
    When the user clicks the "Add new aircraft" button
    And the user enters "<aircraftName>" into the "Name" input field
    And the user enters "<msn>" into the "MSN" input field
    And the user selects "<manufacturer>" from the "Manufacturer" dropdown
    And the user enters "<description>" into the "Description" text area
    And the user clicks the "Cancel" button
    Then the "Add new aircraft" modal should be closed

Scenario: Aircraft added and redirected to detail page
    When the user clicks the "Add new aircraft" button
    And the user enters "<aircraftName>" into the "Name" input field
    And the user enters "<msn>" into the "MSN" input field
    And the user selects "<manufacturer>" from the "Manufacturer" dropdown
    And the user enters "<description>" into the "Description" text area
    And the user clicks the "Save" button
    Then the modal should be closed
    And the user should be redirected to the detail page of the aircraft with name "<aircraftName>"

Scenario: Aircrafts page displays "Add new aircraft" button
    Then the "Add new aircraft" button should be displayed

Scenario: Modal opens with manufacturer dropdown
    When the user clicks the "Add new aircraft" button
    Then the "Add new aircraft" modal should be displayed
    And the "Manufacturer" dropdown should contain all manufacturers stored in the system

Scenario: Manufacturer dropdown contains all system manufacturers
    When the user clicks the "Add new aircraft" button
    Then the "Manufacturer" dropdown should contain all manufacturers stored in the system

Scenario: Modal closes after successful save
    When the user clicks the "Add new aircraft" button
    And the user enters "<aircraftName>" into the "Name" input field
    And the user enters "<msn>" into the "MSN" input field
    And the user selects "<manufacturer>" from the "Manufacturer" dropdown
    And the user enters "<description>" into the "Description" text area
    And the user clicks the "Save" button
    Then the "Add new aircraft" modal should be closed
    And the user should be redirected to the new aircraft detail page

Scenario: Redirect to new aircraft detail page
    When the user clicks the "Add new aircraft" button
    And the user enters "<aircraftName>" into the "Name" input field
    And the user enters "<msn>" into the "MSN" input field
    And the user selects "<manufacturer>" from the "Manufacturer" dropdown
    And the user enters "<description>" into the "Description" text area
    And the user clicks the "Save" button
    Then the modal should be closed
    And the user should be redirected to the aircraft detail page for "<aircraftName>"

