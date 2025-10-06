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
    And the dropdown for "Manufacturer" should be displayed with all manufacturers stored in the system
    And the "Description" text area should be visible
    And the "Save" button should be displayed
    And the "Cancel" button should be displayed

Scenario: Modal contains all manufacturers
    When the user clicks the "Add new aircraft" button
    Then the "Add new aircraft" modal should be displayed
    And the "Manufacturer" dropdown should contain all manufacturers stored in the system

Scenario: Required field validation messages shown
    When the user clicks the "Add new aircraft" button
    And the user leaves the "Name" input field empty
    And the user enters "<msn>" into the "MSN" input field
    And the user selects "<manufacturer>" from the "Manufacturer" dropdown
    And the user leaves the "Description" text area empty
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed for the "Name" input field
    And the validation message "This field is required." should be displayed for the "Description" text area

Scenario: Modal closed without saving on 'Cancel'
    When the user clicks the "Add new aircraft" button
    Then the "Add new aircraft" modal should be displayed
    When the user enters "<aircraftName>" into the "Name" input field
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

Scenario: Aircrafts page shows "Add Aircraft" button
    Then the "Add new aircraft" button should be displayed

Scenario: MSN input field is required
    When the user clicks the "Add new aircraft" button
    And the user enters "<aircraftName>" into the "Name" input field
    And the user leaves the "MSN" input field empty
    And the user selects "<manufacturer>" from the "Manufacturer" dropdown
    And the user enters "<description>" into the "Description" text area
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed for the "MSN" input field

Scenario: Manufacturer dropdown is required
    When the user clicks the "Add new aircraft" button
    And the user enters "<aircraftName>" into the "Name" input field
    And the user enters "<msn>" into the "MSN" input field
    And the user leaves the "Manufacturer" dropdown empty
    And the user enters "<description>" into the "Description" text area
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed for the "Manufacturer" dropdown

Scenario: Aircraft added successfully
    When the user clicks the "Add new aircraft" button
    And the user enters "<aircraftName>" into the "Name" input field
    And the user enters "<msn>" into the "MSN" input field
    And the user selects "<manufacturer>" from the "Manufacturer" dropdown
    And the user enters "<description>" into the "Description" text area
    And the user clicks the "Save" button
    Then the modal should be closed
    And the user should be redirected to the detail page of the aircraft with name "<aircraftName>"

