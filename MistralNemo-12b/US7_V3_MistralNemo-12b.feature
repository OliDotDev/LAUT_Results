Feature: Booking an Event
As a user, I want to book an event with a type and start/end dates so that the booking period is valid and categorized

Background:
    Given the user is logged in as "User"
    And the user is on the "Event Management - Booking form" page

Scenario: Select Event Type
    When the user clicks the "Submit" button without selecting an event type from the "Event Type" dropdown
    Then the validation message "This field is required." should be displayed for the "Event Type" dropdown

Scenario: Enter Start Date
    When the user leaves the "Start Date" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Start Date" input field

Scenario: Enter End Date
    When the user leaves the "End Date" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "End Date" input field

Scenario: Valid Date Format
    When the user leaves the "Start Date" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Start Date" input field
    Given the user enters an invalid date into the "Start Date" input field
    When the user clicks the "Submit" button
    Then the validation message "Value is not a valid date." should be displayed for the "Start Date" input field

Scenario: End Date Later Than Start Date
    When the user selects an event type from the "Event Type" dropdown
    And the user enters a valid start date into the "Start Date" input field
    And the user enters an earlier end date than the start date into the "End Date" input field
    And the user clicks the "Submit" button
    Then the validation message "End Date must be the same as or later than Start Date." should be displayed for the "End Date" input field

Scenario: Save Booking
    When the user selects "<eventType>" from the "Event Type" dropdown
    And the user enters a valid date into the "Start Date" input field
    And the user enters a later or equal valid date into the "End Date" input field
    When the user clicks the "Submit" button
    Then the user should be redirected to the "Event overview" page with booking saved

Scenario: Cancel Booking
    When the user clicks the "Cancel" button
    Then the user should be redirected to the "Event overview" page without saving any changes

Scenario: Start Date validation
    When the user leaves the "Start Date" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Start Date" input field

Scenario: End Date validation
    When the user leaves the "End Date" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "End Date" input field

Scenario: Invalid date format error shown
    When the user leaves the "Event Type" dropdown empty
    And the user enters an invalid date into the "Start Date" input field
    And the user clicks the "Submit" button
    Then the validation message "Value is not a valid date." should be displayed for the "Start Date" input field

Scenario: End Date earlier than Start Date validation
    When the user selects an event type from the "Event Type" dropdown
    And the user enters a valid date into the "Start Date" input field
    And the user enters a date earlier than the Start Date into the "End Date" input field
    And the user clicks the "Submit" button
    Then the validation message "End Date must be the same as or later than Start Date." should be displayed for the "End Date" input field

Scenario: All fields required validation
    When the user leaves all fields empty and clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Event Type" dropdown
    And the validation message "This field is required." should be displayed for both "Start Date" and "End Date" input fields

Scenario: Booking saved successfully
    When the user selects "<eventType>" from the "Event Type" dropdown
    And the user enters "<startDate>" into the "Start Date" input field
    And the user enters "<endDate>" into the "End Date" input field
    And all fields are valid
    When the user clicks the "Submit" button
    Then the user should be redirected to the "Event overview" page

Scenario: Cancel button closes form without saving
    When the user clicks the "Cancel" button
    Then the user should be redirected to the "Event overview" page without saving any changes

