Feature: Booking an Event
As a user, I want to book an event with a type and start/end dates so that the booking period is valid and categorized

Background:
    Given the user is logged in as "User"

Scenario: Select Event Type
    Given the user is on the "Event Management - Booking form" page
    When the user clicks the "Submit" button without selecting an event type from the dropdown
    Then the validation message "This field is required." should be displayed for the "Event Type" dropdown

Scenario: Enter Start Date
    Given the user is on the "Event Management - Booking form" page
    When the user leaves the "Start Date" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Start Date" input field

Scenario: Enter End Date
    Given the user is on the "Event Management - Booking form" page
    When the user leaves the "End Date" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "End Date" input field

Scenario: Valid Date Format
    Given the user is on the "Event Management - Booking form" page
    When the user leaves the "Start Date" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Start Date" input field
    When the user enters an invalid date format (e.g., "2023-13-01") into the "Start Date" input field and clicks "Submit"
    Then the validation message "Value is not a valid date." should be displayed for the "Start Date" input field

Scenario: End Date Later Than Start Date
    Given the user is on the "Event Management - Booking form" page
    When the user enters a valid date into the "Start Date" input field
    And the user enters an earlier date into the "End Date" input field
    When the user clicks the "Submit" button
    Then the validation message "End Date must be the same as or later than Start Date." should be displayed for the "End Date" input field

Scenario: Save Booking
    Given the user is on the "Event Management - Booking form" page
    When the user selects "<eventType>" from the "Event Type" dropdown
    And the user enters "<startDate>" into the "Start Date" input field
    And the user enters "<endDate>" into the "End Date" input field
    When the user clicks the "Submit" button
    Then the user should be redirected to the "Event overview" page with booking saved

Scenario: Cancel Booking Form
    Given the user is on the "Event Management - Booking form" page
    When the user clicks the "Cancel" button
    Then the user should be redirected to the "Event overview" page without saving any changes

Scenario: Event Type dropdown options verified
    Given the user is on the "Event Management - Booking form" page
    When the user navigates to the "Event Type" dropdown
    Then the options "Conference", "Workshop", and "Seminar" should be displayed

Scenario: Redirection after submitting valid booking details
    Given the user is on the "Event Management - Booking form" page
    When the user selects "Conference" from the "Event Type" dropdown
    And the user enters a valid date into the "Start Date" input field
    And the user enters a later valid date into the "End Date" input field
    And the user clicks the "Submit" button
    Then the user should be redirected to the "Event overview" page with the booking saved

Scenario: Redirection after clicking Cancel
    Given the user is on the "Event Management - Booking form" page
    When the user clicks the "Cancel" button
    Then the user should be redirected to the "Event overview" page

Scenario: Validation message shown for required Event Type
    Given the user is on the "Event Management - Booking form" page
    When the user leaves the "Event Type" dropdown unselected
    Then the validation message "This field is required." should be displayed for the "Event Type" dropdown

Scenario: Validation messages shown for required Start/End Dates
    Given the user is on the "Event Management" page
    When the user leaves both "Start Date" and "End Date" fields empty
    Then the validation message "This field is required." should be displayed for both "Start Date" and "End Date" input fields

Scenario: Validation message shown for invalid End Date
    Given the user is on the "Event Management - Booking form" page
    When the user enters a date earlier than today into the "Start Date" input field
    And the user enters a date earlier than the "Start Date" into the "End Date" input field
    When the user clicks the "Submit" button
    Then the validation message "End Date must be the same as or later than Start Date." should be displayed for the "End Date" input field

Scenario: Validation triggered on Submit
    Given the user is on the "Event Management - Booking form" page
    When the user clicks the "Submit" button without selecting an event type or entering dates
    Then the validation message "This field is required." should be displayed for the "Event Type" dropdown
    And the validation message "This field is required." should be displayed for both "Start Date" and "End Date" input fields

