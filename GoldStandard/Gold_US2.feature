Feature: Repair Request
As a maintenance engineer, 
I want to submit repair requests for an aircraft
so that repair activities can be tracked and managed.

Background:
    Given the user is logged in as "maintenance engineer"
    And the user is on the "Aircrafts - Aircraft detail page - Repairs" page

Scenario: Button "Add repair" displayed
    Then the "Add repair" button should be visible

Scenario: Navigation to form
    When the user clicks the "Add repair" button
    Then the user should be on the "Repair Request" page

Scenario: Initial Display of form
    Given the "Add repair" button is clicked
    Then the "Title" input field should be visible
    And the "Description" text area should be visible
    And the "Affected Aircraft System" dropdown should be visible
    And the "Begin Date" input field should be visible
    And the "Total Duration" input field should be visible
    And the "Submit" button should be visible
    And the "Cancel" button should be visible

Scenario: Dropdown contains all aircraft systems
    Given the "Add repair" button is clicked
    Then the "Affected Aircraft Systems" dropdown should contain all stored systems for the "<aircraft>" aircraft

Scenario: Validation - Empty "Title" input field
    Given the "Add repair" button is clicked
    When the user leaves the "Title" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Title" input field

Scenario: Validation - Empty "Description" text area
    Given the "Add repair" button is clicked
    When the user leaves the "Description" text area empty
    And the user clicks the "Submit" button
    Then the validation message "Description must be at least 150 characters." should be displayed for the "Description" text area

Scenario: Validation - "Description" text area with less than 150 characters
    Given the "Add repair" button is clicked
    When the user enters "<descriptionWithLessThan150Chars>" into the "Description" text area
    And the user clicks the "Submit" button
    Then the validation message "Description must be at least 150 characters." should be displayed for the "Description" text area

Scenario: Validation - Empty "Affected Aircraft System" dropdown
    Given the "Add repair" button is clicked
    When the user does not select an option from the "Affected Aircraft System" dropdown
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Affected Aircraft Systems" dropdown

Scenario: Validation - Value of "Begin Date" is before Today
    Given the "Add repair" button is clicked
    When the user enters "<dateBeforeCurrent>" into the "Begin Date" input field
    And the user clicks the "Submit" button
    Then the validation message "Begin Date cannot be earlier than today." should be displayed for the "Begin Date" input field

Scenario: Validation - Empty "Total Duration" input field
    Given the "Add repair" button is clicked
    When the user leaves the "Total Duration" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Total Duration" input field

Scenario: No Validation - Value of "Begin Date" is Today
    Given the "Add repair" button is clicked
    When the user enters "<dateOfToday>" into the "Begin Date" input field
    And the user clicks the "Submit" button
    Then no validation message should be displayed for the "Begin Date" input field

Scenario: No Validation - "Description" text area with exactly 150 characters
    Given the "Add repair" button is clicked
    When the user enters "<descriptionWithExactly150Chars>" into the "Description" text area
    And the user clicks the "Submit" button
    Then no validation message should be displayed for the "Description" text area

Scenario: Cancel submission
    Given the "Add repair" button is clicked
    When the user clicks the "Cancel" button
    Then the user should be on the "Aircrafts - Aircraft detail page" page	

Scenario: Successful Submit
    Given the "Add repair" button is clicked
    When the user enters "<title>" into the "Title" input field
    And the user enters "<description>" into the "Description" text area
    And the user selects "<affectedSystem>" from the "Affected Aircraft System" dropdown
    And the user enters "<beginDate>" into the "Begin Date" date input field
    And the user enters "<totalDuration>" into the "Total Duration" input field
    And the user clicks the "Submit" button
    Then the repair request for "<title>" should be successfully submitted
    And the user should be on the "Aircrafts - Aircraft detail page" page