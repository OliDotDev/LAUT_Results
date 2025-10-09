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
    And the "Submit" button should be displayed
    And the "Cancel" button should be displayed

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
    And the user enters today's date into the "Begin Date" input field
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
    And the user enters today's date into the "Begin Date" input field
    And the user leaves the "Total Duration" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Total Duration" input field

Scenario: Repair request submitted successfully
    Given the user is on the "Aircraft detail page - Repairs"
    When the user clicks the "Add repair" button
    And the user enters "<title>" into the "Title" input field
    And the user enters "<description>" into the "Description" text area
    And the user selects "<affectedAircraftSystem>" from the "Affected Aircraft System" dropdown
    And the user enters "<beginDate>" into the "Begin Date" input field
    And the user enters "<totalDuration>" into the "Total Duration" input field
    And the user clicks the "Submit" button
    Then the user should be redirected to the "Aircraft detail page - Repairs"

Scenario: Form submission cancelled
    Given the user is on the "Aircraft detail page - Repairs"
    When the user clicks the "Add repair" button
    Then the Repair Request form should be displayed
    When the user clicks the "Cancel" button
    Then the user should remain on the "Aircraft detail page - Repairs"

Scenario: "Repairs" section displayed on aircraft detail page
    Given the user is on the "Aircraft Detail Page - Repairs"
    When the user clicks the "Add repair" button
    Then the Repair Request form should be displayed
    When the user enters "<title>" into the "Title" input field
    And the user enters "<description>" into the "Description" text area
    And the user selects "<affectedAircraftSystem>" from the "Affected Aircraft System" dropdown
    And the user enters today's date or a future date into the "Begin Date" input field
    And the user enters "<totalDuration>" into the "Total Duration" input field
    And the user clicks the "Submit" button
    Then a confirmation message should be displayed indicating that the repair request was submitted successfully
    And the user should be redirected to the "Aircraft Detail Page - Repairs"

Scenario: Dropdown contains all stored systems for the aircraft
    Given the user is on the "Aircraft detail page - Repairs"
    When the user clicks the "Add repair" button
    Then the "Repair Request form" should be displayed
    And the "Affected Aircraft System" dropdown should contain all stored systems for the selected aircraft

Scenario: Valid data submission redirects to aircraft detail page
    Given the user is on the "Aircraft Detail Page - Repairs"
    When the user clicks the "Add repair" button
    And the user enters "<title>" into the "Title" input field
    And the user enters "<description>" into the "Description" text area
    And the user selects "<affectedAircraftSystem>" from the "Affected Aircraft System" dropdown
    And the user enters a date no earlier than today into the "Begin Date" input field
    And the user enters "<totalDuration>" into the "Total Duration" input field
    And the user clicks the "Submit" button
    Then the user should be redirected to the "Aircraft Detail Page - Repairs"

