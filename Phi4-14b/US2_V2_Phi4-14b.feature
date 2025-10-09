Feature: Repair Request
As a maintenance engineer, I want to submit repair requests for an aircraft so that repair activities can be tracked and managed

Background:
    Given the user is logged in as "Maintenance Engineer"

Scenario: Repair Request form displayed
    Given the user is on the "Aircraft detail page - Repairs"
    When the user clicks the "Add repair" button
    Then the Repair Request form should be displayed
    And the "Title" input field should be visible
    And the "Description" text area should be visible
    And the "Affected Aircraft System" dropdown should be visible
    And the "Begin Date" input field should be visible
    And the "Total Duration" input field should be visible
    And the "Submit" button should be visible
    And the "Cancel" button should be visible

Scenario: Title field validation shown
    Given the user is on the "Aircraft detail page - Repairs"
    When the user clicks the "Add repair" button
    And the user leaves the "Title" input field empty
    And the user enters "<description>" into the "Description" text area
    And the user selects "<affectedAircraftSystem>" from the "Affected Aircraft System" dropdown
    And the user enters "<beginDate>" into the "Begin Date" input field
    And the user enters "<totalDuration>" into the "Total Duration" input field
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Title" input field

Scenario: Description length validation shown
    Given the user is on the "Aircraft detail page - Repairs"
    When the user clicks the "Add repair" button
    And the user enters "<title>" into the "Title" input field
    And the user enters "<description>" (less than 150 characters) into the "Description" text area
    And the user selects "<affectedAircraftSystem>" from the "Affected Aircraft System" dropdown
    And the user enters "<beginDate>" (today or later) into the "Begin Date" input field
    And the user enters "<totalDuration>" into the "Total Duration" input field
    And the user clicks the "Submit" button
    Then the validation message "Description must be at least 150 characters." should be displayed for the "Description" text area

Scenario: Affected Aircraft System dropdown validation shown
    Given the user is on the "Aircraft detail page - Repairs"
    When the user clicks the "Add repair" button
    And the user enters "<title>" into the "Title" input field
    And the user enters "<description>" into the "Description" text area
    And the user selects today's date in the "Begin Date" input field
    And the user enters "<totalDuration>" into the "Total Duration" input field
    And the user leaves the "Affected Aircraft System" dropdown unselected
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Affected Aircraft System" dropdown

Scenario: Begin Date validation shown
    Given the user is on the "Aircraft detail page - Repairs"
    When the user clicks the "Add repair" button
    And the user enters "<title>" into the "Title" input field
    And the user enters "<description>" into the "Description" text area
    And the user selects "<affectedAircraftSystem>" from the "Affected Aircraft System" dropdown
    And the user enters a date earlier than today into the "Begin Date" input field
    And the user enters "<totalDuration>" into the "Total Duration" input field
    And the user clicks the "Submit" button
    Then the validation message "Begin Date cannot be earlier than today." should be displayed for the "Begin Date" input field

Scenario: Total Duration field validation shown
    Given the user is on the "Aircraft detail page - Repairs"
    When the user clicks the "Add repair" button
    And the user enters "<title>" into the "Title" input field
    And the user enters "<description>" into the "Description" text area
    And the user selects "<affectedAircraftSystem>" from the "Affected Aircraft System" dropdown
    And the user enters today's date or later into the "Begin Date" input field
    And the user leaves the "Total Duration" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Total Duration" input field

Scenario: Repair request submitted successfully
    Given the user is on the "Aircraft detail page - Repairs"
    When the user clicks the "Add repair" button
    And the user enters "<title>" into the "Title" input field
    And the user enters "<description>" into the "Description" text area
    And the user selects "<affectedAircraftSystem>" from the "Affected Aircraft System" dropdown
    And the user enters a date not earlier than today into the "Begin Date" input field
    And the user enters "<totalDuration>" into the "Total Duration" input field
    And the user clicks the "Submit" button
    Then the user should be redirected to the "Aircraft detail page - Repairs"

Scenario: Form submission cancelled
    Given the user is on the "Aircraft detail page - Repairs" section
    When the user clicks the "Add repair" button
    Then the Repair Request form should be displayed
    When the user enters "<title>" into the "Title" input field
    And the user enters "<description>" into the "Description" text area
    And the user selects "<affectedSystem>" from the "Affected Aircraft System" dropdown
    And the user enters "<beginDate>" into the "Begin Date" input field
    And the user enters "<totalDuration>" into the "Total Duration" input field
    And the user clicks the "Cancel" button
    Then the Repair Request form should be closed
    And the user should remain on the "Aircraft detail page - Repairs" section

Scenario: Repair form displayed
    Given the user is on the "Aircraft detail page - Repairs"
    When the user clicks the "Add repair" button
    Then the Repair Request form should be displayed
    And the "Title" input field should be visible
    And the "Description" text area should be visible
    And the "Affected Aircraft System" dropdown should be visible
    And the "Begin Date" input field should be visible
    And the "Total Duration" input field should be visible
    And the "Submit" button should be displayed
    And the "Cancel" button should be displayed

Scenario: Valid repair request submitted
    Given the user is on the "Aircraft detail page - Repairs" page
    When the user clicks the "Add repair" button
    And the user enters "<title>" into the "Title" input field
    And the user enters "<description>" into the "Description" text area
    And the user selects "<affectedAircraftSystem>" from the "Affected Aircraft System" dropdown
    And the user enters "<beginDate>" into the "Begin Date" input field
    And the user enters "<totalDuration>" into the "Total Duration" input field
    And the user clicks the "Submit" button
    Then the user should be redirected to the "Aircraft detail page - Repairs"

