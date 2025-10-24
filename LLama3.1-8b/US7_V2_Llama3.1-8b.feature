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
    When the user clicks the "Submit" button with all fields valid
    Then the booking is saved and the user is redirected to the "Event overview" page
    When the user clicks the "Cancel" button
    Then the form should be closed and the user should be returned to the "Event overview" page

Scenario: Validation message shown for missing event type
    When the user leaves the "Event Type" dropdown empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Event Type" dropdown

Scenario: Validation message shown for missing start date
    When the user selects an event type from the "Event Type" dropdown
    And the user leaves the "Start Date" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Start Date" input field

Scenario: Invalid date error shown for start date
    When the user selects an event type from the "Event Type" dropdown
    And the user enters a non-date value into the "Start Date" input field
    And the user clicks the "Submit" button
    Then the validation message "Value is not a valid date." should be displayed for the "Start Date" input field

Scenario: Validation message shown for missing end date
    When the user selects an event type from the "Event Type" dropdown
    And the user enters a valid date into the "Start Date" input field
    And the user leaves the "End Date" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "End Date" input field

Scenario: Invalid date error shown for end date
    When the user selects an event type from the "Event Type" dropdown
    And the user enters a non-date value into the "End Date" input field
    And the user clicks the "Submit" button
    Then the validation message "Value is not a valid date." should be displayed for the "End Date" input field

Scenario: Start and end dates must be valid dates
    When the user leaves the "Event Type" dropdown empty
    Then the validation message "This field is required." should be displayed for the "Event Type" dropdown
    When the user enters an invalid date into the "Start Date" input field
    Then the validation message "Value is not a valid date." should be displayed for the "Start Date" input field
    When the user leaves the "End Date" input field empty
    Then the validation message "This field is required." should be displayed for the "End Date" input field
    When the user enters an invalid date into the "End Date" input field and it is earlier than the "Start Date"
    Then the validation message "End Date must be the same as or later than Start Date." should be displayed for the "End Date" input field
    When the user clicks the "Submit" button
    Then the validation messages should still be displayed for the "Start Date" and "End Date" input fields

Scenario: End date must be later than or equal to start date
    When the user selects a valid event type from the "Event Type" dropdown
    And the user enters a valid date into the "Start Date" input field
    And the user enters a date earlier than the start date into the "End Date" input field
    And the user clicks the "Submit" button
    Then the validation message "End Date must be the same as or later than Start Date." should be displayed for the "End Date" input field

Scenario: Booking saved and user redirected to event overview
    When the user selects a valid value from the "Event Type" dropdown
    And the user enters a valid date into the "Start Date" input field
    And the user enters a valid date into the "End Date" input field, which is later than or equal to the "Start Date"
    And the user clicks the "Submit" button
    Then the booking should be saved
    And the user should be redirected to the "Event overview" page

Scenario: Form cancelled and user returned to event overview
    When the user clicks the "Cancel" button
    Then the form should be closed
    And the user should be redirected to the "Event overview" page

