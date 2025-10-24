Feature: Booking an Event
As a user, I want to book an event with a type and start/end dates so that the booking period is valid and categorized

Background:
    Given the user is logged in as "User"
    And the user is on the "Event Management - Booking form" page

Scenario: Required field validation for Event Type
    When the user leaves the "Event Type" dropdown empty
    And the user enters "<startDate>" into the "Start Date" input field
    And the user enters "<endDate>" into the "End Date" input field
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Event Type" dropdown

Scenario: Required field validation for Start Date
    When the user selects "<eventType>" from the "Event Type" dropdown
    And the user leaves the "Start Date" input field empty
    And the user enters "<endDate>" into the "End Date" input field
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Start Date" input field

Scenario: Required field validation for End Date
    When the user selects "<eventType>" from the "Event Type" dropdown
    And the user enters "<startDate>" into the "Start Date" input field
    And the user leaves the "End Date" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "End Date" input field

Scenario: Invalid date format error for Start Date
    When the user selects "<eventType>" from the "Event Type" dropdown
    And the user enters "<invalidStartDate>" into the "Start Date" input field
    And the user clicks the "Submit" button
    Then the validation message "Value is not a valid date." should be displayed for the "Start Date" input field

Scenario: Invalid date format error for End Date
    When the user selects "<eventType>" from the "Event Type" dropdown
    And the user enters "<startDate>" into the "Start Date" input field
    And the user enters an invalid value into the "End Date" input field
    And the user clicks the "Submit" button
    Then the validation message "Value is not a valid date." should be displayed for the "End Date" input field

Scenario: Start Date later than End Date error
    When the user selects "<eventType>" from the "Event Type" dropdown
    And the user enters "<startDate>" into the "Start Date" input field
    And the user enters "<endDate>" into the "End Date" input field, where <endDate> is earlier than <startDate>
    And the user clicks the "Submit" button
    Then the validation message "End Date must be the same as or later than Start Date." should be displayed for the "End Date" input field

Scenario: Booking saved successfully
    When the user selects "<eventType>" from the "Event Type" dropdown
    And the user enters "<startDate>" into the "Start Date" input field
    And the user enters "<endDate>" into the "End Date" input field
    And the user clicks the "Submit" button
    Then the user should be redirected to the "Event overview" page

Scenario: Form cancelled without saving
    When the user selects "<eventType>" from the "Event Type" dropdown
    And the user enters "<startDate>" into the "Start Date" input field
    And the user enters "<endDate>" into the "End Date" input field
    And the user clicks the "Cancel" button
    Then the form should be closed
    And the user should be redirected to the "Event overview" page

Scenario: Event Type dropdown displayed
    Then the "Event Type" dropdown should be displayed with options: Conference, Workshop, Seminar

Scenario: Start Date and End Date input fields displayed
    Then the "Start Date" input field should be visible
    And the "End Date" input field should be visible

Scenario: Validation process initiated on submit
    When the user selects "<eventType>" from the "Event Type" dropdown
    And the user enters "<startDate>" into the "Start Date" input field
    And the user enters "<endDate>" into the "End Date" input field
    And the user clicks the "Submit" button
    Then validation messages should be displayed for any invalid fields

