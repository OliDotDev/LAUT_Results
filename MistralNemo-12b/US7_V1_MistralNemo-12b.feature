Feature: Booking an Event
As a user, I want to book an event with a type and start/end dates so that the booking period is valid and categorized

Scenario: Select Event Type
    Given the user is logged in as "User"
    And the user is on the "Event Management - Booking form" page
    When the user clicks the "Submit" button without selecting an event type from the dropdown
    Then the validation message "This field is required." should be displayed for the "Event Type" dropdown

Scenario: Enter Start Date
    Given the user is logged in as "User"
    And the user is on the "Event Management - Booking form" page
    When the user leaves the "Start Date" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Start Date" input field

Scenario: Enter End Date
    Given the user is logged in as "User"
    And the user is on the "Event Management - Booking form" page
    When the user leaves the "End Date" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "End Date" input field

Scenario: Valid Start Date
    Given the user is logged in as "User"
    And the user is on the "Event Management - Booking form" page
    When the user enters an invalid date into the "Start Date" input field
    And the user clicks the "Submit" button
    Then the validation message "Value is not a valid date." should be displayed for the "Start Date" input field

Scenario: Valid End Date
    Given the user is logged in as "User"
    And the user is on the "Event Management - Booking form" page
    When the user enters an invalid date into the "End Date" input field
    And the user clicks the "Submit" button
    Then the validation message "Value is not a valid date." should be displayed for the "End Date" input field

Scenario: Later End Date
    Given the user is logged in as "User"
    And the user is on the "Event Management - Booking form" page
    When the user selects an event type from the "Event Type" dropdown
    And the user enters a valid start date into the "Start Date" input field
    And the user enters an earlier end date than the start date into the "End Date" input field
    When the user clicks the "Submit" button
    Then the validation message "End Date must be the same as or later than Start Date." should be displayed for the "End Date" input field

Scenario: Save Booking
    Given the user is logged in as "User"
    And the user is on the "Event Management - Booking form" page
    When the user selects "<eventType>" from the "Event Type" dropdown
    And the user enters "<startDate>" into the "Start Date" input field
    And the user enters "<endDate>" into the "End Date" input field
    When all fields are valid and the user clicks the "Submit" button
    Then the user is redirected to the "Event overview" page

Scenario: Cancel Booking
    Given the user is logged in as "User"
    And the user is on the "Event Management - Booking form" page
    When the user clicks the "Cancel" button
    Then the user should be redirected to the "Event overview" page without saving any changes

Scenario: Select Event Type
    Given the user is logged in as "User"
    And the user is on the "Event Management - Booking form" page
    When the user leaves the "Event Type" dropdown empty
    Then the validation message "This field is required." should be displayed for the "Event Type" dropdown

Scenario: Enter Start Date
    Given the user is logged in as "User"
    And the user is on the "Event Management - Booking form" page
    When the user selects an event type from the "Event Type" dropdown
    And the user enters a valid date into the "Start Date" input field
    Then the validation messages for "Start Date" should not be displayed

Scenario: Enter End Date
    Given the user is logged in as "User"
    And the user is on the "Event Management - Booking form" page
    When the user selects "<eventType>" from the "Event Type" dropdown
    And the user enters "<startDate>" into the "Start Date" input field
    And the user enters a date earlier than "<startDate>" into the "End Date" input field
    Then the validation message "End Date must be the same as or later than Start Date." should be displayed for the "End Date" input field

Scenario: Submit Booking Form
    Given the user is logged in as "User"
    And the user is on the "Event Management - Booking form" page
    When the user selects "<eventType>" from the "Event Type" dropdown
    And the user enters "<startDate>" into the "Start Date" input field
    And the user enters "<endDate>" into the "End Date" input field
    And all fields are valid
    And the user clicks the "Submit" button
    Then the user should be redirected to the "Event overview" page

Scenario: Cancel Booking Form
    Given the user is logged in as "User"
    And the user is on the "Event Management - Booking form" page
    When the user clicks the "Cancel" button
    Then the user should be redirected to the "Event overview" page without saving any changes

Scenario: Validation: Empty Event Type
    Given the user is logged in as "User"
    And the user is on the "Event Management - Booking form" page
    When the user leaves the "Event Type" dropdown unselected
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Event Type" dropdown

Scenario: Validation: Empty End Date
    Given the user is logged in as "User"
    And the user is on the "Event Management - Booking form" page
    When the user leaves the "End Date" input field empty
    Then the validation message "This field is required." should be displayed for the "End Date" input field

Scenario: Validation: Invalid End Date Format
    Given the user is logged in as "User"
    And the user is on the "Event Management - Booking form" page
    When the user leaves the "Event Type" dropdown unselected
    Then the validation message "This field is required." should be displayed for the "Event Type" dropdown
    Given the user selects "Conference" from the "Event Type" dropdown
    When the user enters an invalid date format into the "End Date" input field
    Then the validation message "Value is not a valid date." should be displayed for the "End Date" input field

Scenario: Validation: End Date Earlier Than Start Date
    Given the user is on the "Event Management" page
    When the user enters a date into the "Start Date" input field
    And the user enters an earlier date into the "End Date" input field
    Then the validation message "End Date must be the same as or later than Start Date." should be displayed for the "End Date" input field

