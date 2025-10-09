Feature: Repair Request
As a maintenance engineer, I want to submit repair requests for an aircraft so that repair activities can be tracked and managed

Background:
    Given the user is logged in as "Maintenance Engineer"
    And the user is on the "Aircraft detail page - Repairs" page

Scenario: Repair Request form displayed
    When the user clicks the "Add repair" button
    Then the Repair Request form should be displayed with a "Title" input field
    And the Repair Request form should be displayed with a "Description" text area
    And the Repair Request form should be displayed with an "Affected Aircraft System" dropdown
    And the Repair Request form should be displayed with a "Begin Date" input field
    And the Repair Request form should be displayed with a "Total Duration" input field
    When the user leaves the "Title" input field empty
    Then the validation message "This field is required." should be displayed for the "Title" input field
    When the user enters a description with fewer than 150 characters into the "Description" text area
    Then the validation message "Description must be at least 150 characters." should be displayed for the "Description" text area
    When the user leaves the "Affected Aircraft System" dropdown empty
    Then the validation message "This field is required." should be displayed for the "Affected Aircraft System" dropdown
    When the user enters a begin date earlier than today into the "Begin Date" input field
    Then the validation message "Begin Date cannot be earlier than today." should be displayed for the "Begin Date" input field
    When the user leaves the "Total Duration" input field empty
    Then the validation message "This field is required." should be displayed for the "Total Duration" input field
    When the user enters a valid title into the "Title" input field, a description with at least 150 characters into the "Description" text area, selects an affected aircraft system from the dropdown, and enters a valid begin date into the "Begin Date" input field and a total duration into the "Total Duration" input field
    And the user clicks the "Submit" button
    Then the repair request should be transmitted and the user should be redirected to the aircraft detail page
    When the user clicks the "Cancel" button
    Then the user should be redirected to the aircraft detail page without submitting

Scenario: Title input field validation shown
    When the user clicks the "Add repair" button
    And the user leaves the "Title" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Title" input field

Scenario: Description text area validation shown
    When the user clicks the "Add repair" button
    And the user enters a description with fewer than 150 characters into the "Description" text area
    Then the validation message "Description must be at least 150 characters." should be displayed for the "Description" text area

Scenario: Affected Aircraft System dropdown validation shown
    When the user clicks the "Add repair" button
    And the user leaves the "Affected Aircraft System" dropdown empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Affected Aircraft System" dropdown

Scenario: Begin Date input field validation shown
    When the user clicks the "Add repair" button
    And the user enters "<title>" into the "Title" input field
    And the user leaves the "Description" text area empty
    And the user selects an option from the "Affected Aircraft System" dropdown
    And the user enters a date earlier than today into the "Begin Date" input field
    And the user leaves the "Total Duration" input field empty
    And the user clicks the "Submit" button
    Then the validation message "Description must be at least 150 characters." should be displayed for the "Description" text area
    And the validation message "This field is required." should be displayed for the "Total Duration" input field
    And the validation message "Begin Date cannot be earlier than today." should be displayed for the "Begin Date" input field

Scenario: Total Duration input field validation shown
    When the user clicks the "Add repair" button
    And the user leaves the "Total Duration" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Total Duration" input field

Scenario: Repair request submitted successfully
    When the user clicks the "Add repair" button
    And the user enters "<title>" into the "Title" input field
    And the user enters "<description>" into the "Description" text area
    And the user selects a value from the "Affected Aircraft System" dropdown
    And the user enters a valid date into the "Begin Date" input field
    And the user enters a valid duration into the "Total Duration" input field
    And the user clicks the "Submit" button
    Then the repair request is transmitted successfully
    And the user should be redirected to the aircraft detail page

Scenario: Cancel button redirects back to aircraft detail page
    When the user clicks the "Cancel" button
    Then the user should be redirected to the "Aircraft detail page - Repairs" page

