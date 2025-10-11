Feature: Booking an Event
As a user
I want to book an event with a type and start/end dates
so that the booking period is valid and categorized.

Background:
    Given the user is logged in as "user"
    And the user is on the "Event Management - Booking form" page

Scenario: Initial Display
    Then the "Event Type" dropdown should be visible
    And the "Start Date" input field should be visible
    And the "End Date" input field should be visible
    And the "Submit" button should be visible
    And the "Cancel" button should be visible

Scenario: Dropdown "Event Type" contains predefined options
    Then the "Event Type" dropdown should contain the options "Conference;Workshop;Seminar"

Scenario: Validation - Empty "Event Type" dropdown
    When the user does not select an option from the "Event Type" dropdown
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Event Type" dropdown

Scenario: Validation - Empty "Start Date" input field
    When the user leaves the "Start Date" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Start Date" input field

Scenario: Validation - Empty "End Date" input field
    When the user leaves the "End Date" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "End Date" input field

Scenario: Validation - Invalid "Start Date"
    When the user enters "<invalidDate>" into the "Start Date" input field
    And the user clicks the "Submit" button
    Then the validation message "Value is not a valid date." should be displayed for the "Start Date" input field 

Scenario: Validation - Invalid "End Date"
    And the user enters "<invalidDate>" into the "End Date" input field
    And the user clicks the "Submit" button
    Then the validation message "Value is not a valid date." should be displayed for the "End Date" input field 

Scenario: Validation - "End Date" is before "Start Date"
    When the user enters "<laterStartDate>" into the "Start Date" input field
    And the user enters "<earlierEndDate>" into the "End Date" input field
    And the user clicks the "Submit" button
    Then the validation message "End Date must be the same as or later than Start Date." should be displayed for the "End Date" input field 

Scenario: No Validation - "End Date" is the same as "Start Date"
    When the user enters "<date>" into the "Start Date" input field
    And the user enters "<date>" into the "End Date" input field
    And the user clicks the "Submit" button
    Then no validation message should be displayed for the "Start Date" input field
    And no validation message should be displayed for the "End Date" input field

Scenario: Cancel event booking
    When the user clicks the "Cancel" button
    Then the form should be closed
    And the user should be on the "Event overview" page

Scenario: Cancel event booking with inputs
    When the user selects "<eventType>" from the "Event Type" dropdown
    And the user enters "<startDate>" into the "Start Date" input field
    And the user enters "<endDate>" into the "End Date" input field
    And the user clicks the "Cancel" button
    Then the form should be closed
    And the booking should not be saved 
    And the user should be on the "Event overview" page

Scenario: Successful Submission
    When the user selects "<eventType>" from the "Event Type" dropdown
    And the user enters "<startDate>" into the "Start Date" input field
    And the user enters "<endDate>" into the "End Date" input field
    And the user clicks the "Submit" button
    Then the form should be closed
    And the booking should be saved
    And the user should be on the "Event overview" page