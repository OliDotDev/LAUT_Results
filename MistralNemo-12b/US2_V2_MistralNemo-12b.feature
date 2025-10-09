Feature: Repair Request
As a maintenance engineer, I want to submit repair requests for an aircraft so that repair activities can be tracked and managed

Background:
    Given the user is logged in as "Maintenance Engineer"

Scenario: Repair Request Form Displayed
    Given the user is on the "Aircraft detail page - Repairs" for a specific aircraft
    When the user clicks the "Add repair" button
    Then the Repair Request form should be displayed with fields: Title, Description, Affected Aircraft System, Begin Date, Total Duration

Scenario: Title Field Required Validation
    Given the user is on the "Aircraft detail page - Repairs" page
    When the user clicks the "Add repair" button
    And the user leaves the "Title" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Title" input field

Scenario: Description Field Minimum Length Validation
    Given the user is on the "Aircraft detail page - Repairs" for a specific aircraft
    When the user clicks the "Add repair" button
    And the user enters less than 150 characters into the "Description" text area
    And the user clicks the "Submit" button
    Then the validation message "Description must be at least 150 characters." should be displayed for the "Description" text area

Scenario: Affected Aircraft System Required Validation
    Given the user is on the "Repairs" page for an aircraft
    When the user clicks the "Add repair" button
    And the user leaves the "Affected Aircraft System" dropdown unselected
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Affected Aircraft System" dropdown

Scenario: Begin Date Cannot Be Earlier Than Today Validation
    Given the user is on the "Aircraft detail page - Repairs" for a specific aircraft
    When the user clicks the "Add repair" button
    And the user enters an earlier date than today into the "Begin Date" input field
    And the user clicks the "Submit" button
    Then the validation message "Begin Date cannot be earlier than today." should be displayed for the "Begin Date" input field

Scenario: Total Duration Required Validation
    Given the user is on the "Aircraft detail page - Repairs" for a specific aircraft
    When the user clicks the "Add repair" button
    Then the Repair Request form opens with all fields empty
    When the user leaves the "Total Duration" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Total Duration" input field

Scenario: Repair Request Successfully Submitted
    Given the user is on the "Aircraft detail page - Repairs" for aircraft "<aircraftID>"
    When the user clicks the "Add repair" button
    And the user enters "<repairTitle>" into the "Title" input field
    And the user enters "<repairDescription>" into the "Description" text area
    And the user selects "<affectedSystem>" from the "Affected Aircraft System" dropdown
    And the user enters today's date into the "Begin Date" input field
    And the user enters "<totalDuration>" into the "Total Duration" input field
    And the user clicks the "Submit" button
    Then the repair request should be transmitted successfully
    And the user should be redirected to the aircraft detail page for aircraft "<aircraftID>" with the new repair request listed

Scenario: Repair Request Form Cancelled
    Given the user is on the "Aircraft detail page - Repairs" for aircraft "<aircraftID>" (or "<aircraftId>")
    When the user clicks the "Add repair" button
    Then the Repair Request form should be displayed
    When the user clicks the "Cancel" button
    Then the user should be redirected to the aircraft detail page for aircraft "<aircraftID>" (or "<aircraftId>") without submitting any changes

Scenario: Add Repair Button Displayed
    Given the user is on the "Aircraft detail page - Repairs" for a specific aircraft
    Then the "Add repair" button should be displayed

Scenario: Repair Request Form Opens
    Given the user is on the "Aircraft detail page - Repairs" for a specific aircraft
    When the user clicks the "Add repair" button
    Then the Repair Request form should be displayed with all fields empty

Scenario: Title Field Required Validation
    Given the user is on the "Aircraft detail page - Repairs" page
    When the user clicks the "Add repair" button
    And the user leaves the "Title" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Title" input field

Scenario: Description Field Length Validation
    Given the user is on the "Aircraft detail page - Repairs" for an aircraft
    When the user clicks the "Add repair" button
    And the user enters fewer than 150 characters into the "Description" text area
    And the user clicks the "Submit" button
    Then the validation message "Description must be at least 150 characters." should be displayed for the "Description" text area

Scenario: Add Repair Request - Invalid Title
    Given the user is on the "Aircraft detail page - Repairs" for aircraft "<aircraftId>"
    When the user clicks the "Add repair" button
    And the user leaves the "Title" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Title" input field

Scenario: Begin Date Field Validation
    Given the user is on the "Aircraft detail page - Repairs" for a specific aircraft
    When the user clicks the "Add repair" button
    And the user enters an earlier date into the "Begin Date" input field
    And the user clicks the "Submit" button
    Then the validation message "Begin Date cannot be earlier than today." should be displayed for the "Begin Date" input field

Scenario: Total Duration Field Required Validation
    Given the user is on the "Aircraft detail page - Repairs" for a specific aircraft
    When the user clicks the "Add repair" button
    And the user leaves the "Total Duration" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Total Duration" input field

Scenario: Repair Request Successfully Submitted
    Given the user is on the "Aircraft detail page - Repairs" for aircraft "<aircraftID>"
    When the user clicks the "Add repair" button
    And the user enters "<repairTitle>" into the "Title" input field
    And the user enters "<repairDescription>" into the "Description" text area
    And the user selects "<affectedSystem>" from the "Affected Aircraft System" dropdown
    And the user enters a date later than today into the "Begin Date" input field
    And the user enters "<totalDuration>" into the "Total Duration" input field
    And the user clicks the "Submit" button
    Then the user should be redirected to the aircraft detail page for aircraft "<aircraftID>"

Scenario: Cancel Button Redirects Without Submission
    Given the user is on the "Aircraft detail page - Repairs" for a specific aircraft
    When the user clicks the "Add repair" button
    And the user clicks the "Cancel" button without filling any fields
    Then the user should be redirected to the aircraft detail page

