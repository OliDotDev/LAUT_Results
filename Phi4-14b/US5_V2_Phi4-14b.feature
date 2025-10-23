Feature: Changing order of tasks
As a user, I want to change the order of tasks in a directory so that I can arrange them according to priority or workflow

Background:
    Given the user is logged in as "User"
    And the user is on the "Task Management" page

Scenario: Task order displayed with sequence numbers
    Then all tasks in the table "Tasks" should have a numerical value in the "Sequence Number" column

Scenario: Arrow buttons revealed for single task selection
    When the user selects a checkbox next to the task with sequence number "<sequenceNumber>"
    Then a button with an "Arrow-up" icon should be displayed next to the selected task
    And a button with an "Arrow-down" icon should be displayed next to the selected task

Scenario: Task moved up in order
    When the user selects a task with sequence number "<currentSequenceNumber>" via checkbox
    Then a button with an "Arrow-up" icon should be visible
    And a button with an "Arrow-down" icon should be visible
    When the user clicks the "Arrow-up" button
    Then the task should have sequence number "<newSequenceNumber>" in the "Tasks" table
    And the checkbox for the task with sequence number "<currentSequenceNumber>" should be selected

Scenario: Task moved down in order
    Given there are at least two tasks listed in the "Tasks" table
    When the user selects a task with sequence number "<currentSequenceNumber>" via checkbox
    Then a button with an "Arrow-up" icon should be visible for that task
    And a button with an "Arrow-down" icon should be visible for that task
    When the user clicks the "Arrow-down" button for the selected task
    Then the sequence number of the selected task should change to "<newSequenceNumber>" in the "Tasks" table
    And the checkbox selection of the task should remain unchanged

Scenario: Arrow buttons hidden for multiple selections
    When the user selects multiple tasks via checkboxes
    Then the button with an "Arrow-up" icon should not be displayed
    And the button with an "Arrow-down" icon should not be displayed

Scenario: Arrow-up button disabled for first task
    When the user selects the checkbox of the first task in the "Tasks" table
    Then the "Arrow-up" button should be disabled

Scenario: Arrow-down button disabled for last task
    When the user selects the checkbox of the last task in the "Tasks" table
    Then the button with an "Arrow-down" icon should be disabled

Scenario: Tasks sorted by sequence number
    When the user selects a task via checkbox
    Then a button with an "Arrow-up" icon should be displayed
    And a button with an "Arrow-down" icon should be displayed
    When the user clicks the "Arrow-up" button for a task that is not the first in sequence
    Then the selected task should move one position up in the "Tasks" table
    When the user clicks the "Arrow-down" button for a task that is not the last in sequence
    Then the selected task should move one position down in the "Tasks" table

