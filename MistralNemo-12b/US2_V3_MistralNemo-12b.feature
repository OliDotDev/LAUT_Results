Feature: Repair Request
As a maintenance engineer, I want to submit repair requests for an aircraft so that repair activities can be tracked and managed

Background:
    Given the user is logged in as "Maintenance Engineer"

Scenario: Repair Request Form Displayed
    Given the user is on the "Aircraft detail page - Repairs" for a specific aircraft
    When the user clicks the "Add repair" button
    Then the Repair Request form should be displayed with fields: Title, Description, Affected Aircraft System, Begin Date, Total Duration
    And all fields should be empty
    And the "Title" input field should have focus

Scenario: Title Field Required Validation
    Given the user is on the "Aircraft detail page - Repairs" page
    When the user clicks the "Add repair" button
    And the user leaves the "Title" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Title" input field

Scenario: Description Field Minimum Length Validation
    Given the user is on the "Aircraft detail page - Repairs" for an aircraft
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
    And the user leaves the "Total Duration" input field empty
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
    Then the user should be redirected to the aircraft detail page for aircraft "<aircraftID>"
    And the new repair request should be listed in the "Repairs" section with title "<repairTitle>" and affected system "<affectedSystem>"

Scenario: Repair Request Form Cancelled
    Given the user is on the "Aircraft detail page - Repairs" for aircraft "<aircraftID>"
    When the user clicks the "Add repair" button
    And the user clicks the "Cancel" button without entering any data
    Then the user should be redirected to the aircraft detail page for aircraft "<aircraftID>" without submitting any changes

Scenario: Title field gets focus after clicking 'Add repair'
    Given the user is on the "Aircraft detail page - Repairs" for an aircraft
    When the user clicks the "Add repair" button
    Then the cursor should be positioned in the "Title" input field

Scenario: 'Required' validation shown for empty Title
    Given the user is on the "Aircraft detail page - Repairs" page
    When the user clicks the "Add repair" button
    And the user leaves the "Title" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Title" input field

Scenario: Description validation shown for less than 150 characters
    Given the user is on the "Aircraft detail page - Repairs" page
    When the user clicks the "Add repair" button
    And the user enters fewer than 150 characters into the "Description" text area
    Then the validation message "Description must be at least 150 characters." should be displayed for the "Description" text area

Scenario: All aircraft systems listed in dropdown
    Given the user is on the "Aircraft detail page - Repairs" for a selected aircraft
    When the user clicks the "Add repair" button
    Then the Repair Request form should be displayed with all stored systems listed in the "Affected Aircraft System" dropdown

Scenario: 'Begin Date' validation shown for dates earlier than today
    Given the user is on the "Aircraft detail page - Repairs" page
    When the user clicks the "Add repair" button
    And the user enters a date earlier than today into the "Begin Date" input field
    Then the validation message "Begin Date cannot be earlier than today." should be displayed

Scenario: 'Required' validation shown for empty Total Duration
    Given the user is on the "Aircraft detail page - Repairs" page
    When the user leaves the "Total Duration" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Total Duration" input field

Scenario: Submit button redirects user after successful submission
    Given the user is on the "Aircraft detail page - Repairs" page
    When the user clicks the "Add repair" button
    And the user enters "<repairTitle>" into the "Title" input field
    And the user enters "<repairDescription>" into the "Description" text area
    And the user selects "<affectedSystem>" from the "Affected Aircraft System" dropdown
    And the user enters a date later than today into the "Begin Date" input field
    And the user enters "<totalDuration>" into the "Total Duration" input field
    And the user clicks the "Submit" button
    Then the user should be redirected to the aircraft detail page

Scenario: Cancel button redirects user without submitting changes
    Given the user is on the "Aircraft detail page - Repairs" for aircraft "<aircraftId>"
    When the user clicks the "Add repair" button
    And the user clicks the "Cancel" button without entering any data
    Then the user should be redirected to the aircraft detail page for aircraft "<aircraftId>"

