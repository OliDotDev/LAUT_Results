Feature: Repair Request
As a maintenance engineer, I want to submit repair requests for an aircraft so that repair activities can be tracked and managed

Background:
    Given the user is logged in as "Maintenance Engineer"
    And the user is on the "Aircraft detail page - Repairs" page

Scenario: Initial display
    Then the "Add repair" button should be displayed

Scenario: Title required validation
    When the user clicks the "Add repair" button
    And the user leaves the "Title" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Title" input field

Scenario: Description length validation
    When the user clicks the "Add repair" button
    And the user enters "<title>" into the "Title" input field
    And the user enters a description shorter than 150 characters into the "Description" text area
    And the user clicks the "Submit" button
    Then the validation message "Description must be at least 150 characters." should be displayed for the "Description" text area

Scenario: Affected Aircraft System required
    When the user clicks the "Add repair" button
    And the user enters "<repairTitle>" into the "Title" input field
    And the user leaves the "Affected Aircraft System" dropdown without selecting a value
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Affected Aircraft System" dropdown

Scenario: Begin Date validation
    When the user clicks the "Add repair" button
    And the user enters "<repairTitle>" into the "Title" input field
    And the user enters "<repairDescription>" into the "Description" text area
    And the user selects "<affectedSystem>" from the "Affected Aircraft System" dropdown
    And the user selects a "Begin Date" earlier than today
    And the user enters "<totalDuration>" into the "Total Duration" input field
    And the user clicks the "Submit" button
    Then the validation message "Begin Date cannot be earlier than today." should be displayed for the "Begin Date" input field

Scenario: Total Duration required
    When the user clicks the "Add repair" button
    And the user enters "<title>" into the "Title" input field
    And the user enters "<description>" into the "Description" text area
    And the user selects "<affectedSystem>" from the "Affected Aircraft System" dropdown
    And the user selects "<beginDate>" from the "Begin Date" input field
    And the user leaves the "Total Duration" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Total Duration" input field

Scenario: Repair request submitted
    When the user clicks the "Add repair" button
    And the user enters "<repairTitle>" into the "Title" input field
    And the user enters "<repairDescription>" into the "Description" text area
    And the user selects "<affectedSystem>" from the "Affected Aircraft System" dropdown
    And the user selects "<beginDate>" from the "Begin Date" input field
    And the user enters "<totalDuration>" into the "Total Duration" input field
    And the user clicks the "Submit" button
    Then the user should be redirected to the "Aircraft detail page"

Scenario: Repair request cancelled
    When the user clicks the "Add repair" button
    And the user clicks the "Cancel" button
    Then the user should be redirected to the "Aircraft detail page" page

