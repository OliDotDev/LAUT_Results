Feature: Booking an Event
As a user, I want to book an event with a type and start/end dates so that the booking period is valid and categorized

Background:
    Given the user is logged in as "User"
    And the user is on the "Event Management - Booking form" page

Scenario: Booking form displayed with required fields
    When the user leaves the "Event Type" dropdown empty
    Then the validation message "This field is required." should be displayed for the "Event Type" dropdown
    When the user enters an invalid date into the "Start Date" input field
    Then the validation message "Value is not a valid date." should be displayed for the "Start Date" input field
    When the user enters a date earlier than the "Start Date" into the "End Date" input field
    Then the validation message "End Date must be the same as or later than Start Date." should be displayed for the "End Date" input field
    When the user enters a valid date into both the "Start Date" and "End Date" input fields
    Then the booking is saved
    And the user should be redirected to the "Event overview" page
    When the user clicks the "Cancel" button
    Then the form should be closed and the user should be returned to the "Event overview" page

Scenario: Validation message shown for missing event type
    When the user leaves the "Event Type" dropdown empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Event Type" dropdown

Scenario: Start date and end date fields are required
    When the user leaves the "Start Date" input field empty
    Then the validation message "This field is required." should be displayed for the "Start Date" input field
    When the user enters a non-date value into the "Start Date" input field
    Then the validation message "Value is not a valid date." should be displayed for the "Start Date" input field
    When the user clicks the "Submit" button with an invalid start date
    Then the validation message "This field is required." should be displayed for the "End Date" input field
    When the user leaves the "End Date" input field empty
    Then the validation message "This field is required." should be displayed for the "End Date" input field
    When the user enters a start date later than the end date into the respective fields
    Then the validation message "End Date must be the same as or later than Start Date." should be displayed for the "End Date" input field
    When the user enters valid values into all required fields and clicks the "Submit" button
    Then the booking is saved and the user is redirected to the "Event overview" page

Scenario: Invalid date entered in start/end date fields
    When the user selects an event type from the "Event Type" dropdown
    And the user enters a valid date into the "Start Date" input field
    And the user leaves the "End Date" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "End Date" input field
    When the user enters an invalid date into the "Start Date" input field
    And the user clicks the "Submit" button
    Then the validation message "Value is not a valid date." should be displayed for the "Start Date" input field

Scenario: End date must be same as or later than start date
    When the user selects an event type from the "Event Type" dropdown
    And the user enters a valid date into the "Start Date" input field
    And the user enters a date earlier than the start date into the "End Date" input field
    And the user clicks the "Submit" button
    Then the validation message "End Date must be the same as or later than Start Date." should be displayed for the "End Date" input field

Scenario: Booking saved and user redirected to event overview
    When the user selects a valid "Event Type" from the dropdown
    And the user enters a valid date into the "Start Date" input field
    And the user enters a valid date into the "End Date" input field
    And the "End Date" is later than or equal to the "Start Date"
    And the user clicks the "Submit" button
    Then the booking is saved
    And the user should be redirected to the "Event overview" page

Scenario: Cancel button closes form without saving
    When the user leaves the "Event Type" dropdown empty
    Then the validation message "This field is required." should be displayed for the "Event Type" dropdown
    When the user enters an invalid date into the "Start Date" input field
    Then the validation message "Value is not a valid date." should be displayed for the "Start Date" input field
    When the user selects an event type from the "Event Type" dropdown and enters an invalid date into the "End Date" input field that is earlier than the selected start date
    Then the validation message "End Date must be the same as or later than Start Date." should be displayed for the "End Date" input field
    When the user clicks the "Cancel" button
    Then the form should close and the user should be redirected to the "Event overview" page without any changes being saved

