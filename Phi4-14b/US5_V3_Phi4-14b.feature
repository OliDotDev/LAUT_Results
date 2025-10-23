Feature: Changing order of tasks
As a user, I want to change the order of tasks in a directory so that I can arrange them according to priority or workflow

Background:
    Given the user is logged in as "User"
    And the user is on the "Task Management" page

Scenario: Arrow buttons revealed for single task selection
    When the user selects a single task via checkbox
    Then a button with an "Arrow-up" icon should be displayed next to the selected task
    And a button with an "Arrow-down" icon should be displayed next to the selected task

Scenario: Task moved up in order
    When the user selects a task with sequence number "<currentSequenceNumber>" via checkbox
    Then the "Arrow-up" button should be visible
    And the "Arrow-down" button should be visible
    When the user clicks the "Arrow-up" button
    Then the task with sequence number "<currentSequenceNumber>" should have sequence number "<newSequenceNumber>" in the table "Tasks"
    And the task with sequence number "<newSequenceNumber>" should have sequence number "<currentSequenceNumber>" in the table "Tasks"
    And the checkbox for the task with sequence number "<currentSequenceNumber>" should be selected

Scenario: Task moved down in order
    When the user selects a task with sequence number "<currentSequenceNumber>" via checkbox
    Then a button with an "Arrow-up" icon should be visible
    And a button with an "Arrow-down" icon should be visible
    When the user clicks the "Arrow-down" button
    Then the task should have sequence number "<newSequenceNumber>" in the "Tasks" table
    And the checkbox for the task should remain selected

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

Scenario: Task sequence numbers displayed
    Then the table "Tasks" should contain a column named "Sequence Number"

