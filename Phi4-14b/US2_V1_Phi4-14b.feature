Feature: Repair Request
As a maintenance engineer, I want to submit repair requests for an aircraft so that repair activities can be tracked and managed

Background:
    Given the user is logged in as "Maintenance Engineer"
    And the user is on the "Aircraft detail page - Repairs"

Scenario: Repair Request form displayed
    When the user clicks the "Add repair" button
    Then the Repair Request form should be displayed
    And the "Title" input field should be visible
    And the "Description" text area should be visible
    And the "Affected Aircraft System" dropdown should be visible
    And the "Begin Date" input field should be visible
    And the "Total Duration" input field should be visible
    And the "Submit" button should be displayed
    And the "Cancel" button should be displayed

Scenario: Title field validation shown
    When the user clicks the "Add repair" button
    And the user leaves the "Title" input field empty
    And the user enters "<description>" into the "Description" text area
    And the user selects "<affectedAircraftSystem>" from the "Affected Aircraft System" dropdown
    And the user enters "<beginDate>" into the "Begin Date" input field
    And the user enters "<totalDuration>" into the "Total Duration" input field
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Title" input field

Scenario: Description length validation shown
    When the user clicks the "Add repair" button
    And the user enters "<title>" into the "Title" input field
    And the user enters "<description>" into the "Description" text area
    And the user selects "<affectedAircraftSystem>" from the "Affected Aircraft System" dropdown
    And the user enters today's date into the "Begin Date" input field
    And the user enters "<totalDuration>" into the "Total Duration" input field
    And the user clicks the "Submit" button
    Then the validation message "Description must be at least 150 characters." should be displayed for the "Description" text area

Scenario: Affected Aircraft System dropdown validation shown
    When the user clicks the "Add repair" button
    And the user enters "<title>" into the "Title" input field
    And the user enters "<description>" into the "Description" text area
    And the user selects today's date in the "Begin Date" input field
    And the user enters "<totalDuration>" into the "Total Duration" input field
    And the user leaves the "Affected Aircraft System" dropdown unselected
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Affected Aircraft System" dropdown

Scenario: Begin Date validation shown
    When the user clicks the "Add repair" button
    And the user enters "<title>" into the "Title" input field
    And the user enters "<description>" into the "Description" text area
    And the user selects "<affectedAircraftSystem>" from the "Affected Aircraft System" dropdown
    And the user enters a date earlier than today into the "Begin Date" input field
    And the user enters "<totalDuration>" into the "Total Duration" input field
    And the user clicks the "Submit" button
    Then the validation message "Begin Date cannot be earlier than today." should be displayed for the "Begin Date" input field

Scenario: Total Duration field validation shown
    When the user clicks the "Add repair" button
    And the user enters "<title>" into the "Title" input field
    And the user enters "<description>" into the "Description" text area
    And the user selects "<affectedAircraftSystem>" from the "Affected Aircraft System" dropdown
    And the user enters today's date into the "Begin Date" input field
    And the user leaves the "Total Duration" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Total Duration" input field

Scenario: Repair request submitted successfully
    When the user clicks the "Add repair" button
    And the user enters "<title>" into the "Title" input field
    And the user enters "<description>" into the "Description" text area
    And the user selects "<affectedAircraftSystem>" from the "Affected Aircraft System" dropdown
    And the user enters "<beginDate>" into the "Begin Date" input field (where <beginDate> is today or a future date)
    And the user enters "<totalDuration>" into the "Total Duration" input field
    And the user clicks the "Submit" button
    Then the user should be redirected to the "Aircraft detail page - Repairs"

Scenario: Form submission cancelled
    When the user clicks the "Add repair" button
    Then the Repair Request form should be displayed
    When the user clicks the "Cancel" button
    Then the user should remain on the "Aircraft detail page - Repairs" without any new repair requests submitted

Scenario: Description field validation
    When the user clicks the "Add repair" button
    And the user enters "<title>" into the "Title" input field
    And the user leaves the "Description" text area empty
    And the user selects "<affectedAircraftSystem>" from the "Affected Aircraft System" dropdown
    And the user enters "<beginDate>" into the "Begin Date" input field
    And the user enters "<totalDuration>" into the "Total Duration" input field
    And the user clicks the "Submit" button
    Then the validation message "Description must be at least 150 characters." should be displayed for the "Description" text area

Scenario: Dropdown contains all aircraft systems
    When the user clicks the "Add repair" button
    Then the "Repair Request form" should be displayed
    And the dropdown "Affected Aircraft System" should contain all stored systems for the aircraft

Scenario: Redirect to aircraft detail page after submission
    When the user clicks the "Add repair" button
    And the user enters "<title>" into the "Title" input field
    And the user enters "<description>" into the "Description" text area
    And the user selects "<affectedAircraftSystem>" from the "Affected Aircraft System" dropdown
    And the user enters "<beginDate>" into the "Begin Date" input field
    And the user enters "<totalDuration>" into the "Total Duration" input field
    And the user clicks the "Submit" button
    Then the user should be redirected to the "Aircraft detail page - Repairs"

