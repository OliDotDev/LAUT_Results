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

Scenario: Validation message shown for empty title
    When the user clicks the "Add repair" button
    And the user leaves the "Title" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Title" input field

Scenario: Description minimum length validation shown
    When the user clicks the "Add repair" button
    And the user enters "<title>" into the "Title" input field
    And the user leaves the "Description" text area empty
    Then the validation message "Description must be at least 150 characters." should be displayed for the "Description" text area

Scenario: Validation message shown for empty affected aircraft system
    When the user clicks the "Add repair" button
    And the user leaves the "Affected Aircraft System" dropdown empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Affected Aircraft System" dropdown

Scenario: Begin Date cannot be earlier than today validation shown
    When the user clicks the "Add repair" button
    And the user enters a date earlier than today into the "Begin Date" input field
    Then the validation message "Begin Date cannot be earlier than today." should be displayed for the "Begin Date" input field

Scenario: Validation message shown for empty total duration
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
    Then the user should be redirected to the aircraft detail page

Scenario: Repair request form displayed
    When the user clicks the "Add repair" button
    Then the "Title" input field should be displayed and required
    And the "Description" text area should be displayed and required with a minimum length of 150 characters
    And the "Affected Aircraft System" dropdown should be displayed and required
    And the "Begin Date" input field should be displayed and have a validation message for dates earlier than today
    And the "Total Duration" input field should be displayed and required

Scenario: Description required validation shown
    When the user clicks the "Add repair" button
    And the user leaves the "Description" text area empty
    Then the validation message "This field is required." should be displayed for the "Description" text area

Scenario: Affected Aircraft System dropdown required validation shown
    When the user clicks the "Add repair" button
    And the user leaves the "Affected Aircraft System" dropdown empty
    Then the validation message "This field is required." should be displayed for the "Affected Aircraft System" dropdown

Scenario: Begin Date cannot be earlier than today validation shown
    When the user clicks the "Add repair" button
    And the user leaves the "Title" input field empty
    Then the validation message "This field is required." should be displayed for the "Title" input field
    When the user enters a description with fewer than 150 characters into the "Description" text area
    Then the validation message "Description must be at least 150 characters." should be displayed for the "Description" text area
    When the user selects no system from the "Affected Aircraft System" dropdown
    Then the validation message "This field is required." should be displayed for the "Affected Aircraft System" dropdown
    When the user enters a begin date earlier than today into the "Begin Date" input field
    Then the validation message "Begin Date cannot be earlier than today." should be displayed for the "Begin Date" input field
    When the user leaves the "Total Duration" input field empty
    Then the validation message "This field is required." should be displayed for the "Total Duration" input field

