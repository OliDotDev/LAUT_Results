Feature: Changing order of tasks
As a user, I want to change the order of tasks in a directory so that I can arrange them according to priority or workflow

Background:
    Given the user is logged in as "User"
    And the user is on the "Task Management" page

Scenario: Move task up button displayed for single selection
    When the user selects a single task via checkbox
    Then an "Arrow-up" button should be displayed next to the selected task
    When the user clicks the "Arrow-up" button
    Then the selected task should move one position up in the "Tasks" table

Scenario: Move task down button displayed for single selection
    When the user selects a single task via checkbox
    Then an "Arrow-down" button should be displayed next to the selected task

Scenario: Task moved up one position
    When the user selects a task via checkbox
    And the task has a sequence number of "<currentSequenceNumber>" in the "Tasks" table
    And the user clicks the "Arrow-up" button
    Then the selected task's sequence number should be increased by one in the "Tasks" table

Scenario: Task moved down one position
    When the user selects a task via checkbox
    And the selected task has a sequence number of "<initialSequenceNumber>" in the "Tasks" table
    And the user clicks the "Arrow-down" button
    Then the sequence number of the selected task should decrease by one in the "Tasks" table

Scenario: Checkbox selection remains after using buttons
    When the user selects a task via checkbox
    And the user clicks the "Arrow-up" button
    Then the selected task has moved one position up in the "Tasks" table
    And the checkbox selection remains checked for the task

Scenario: Multiple tasks selection hides arrow buttons
    When the user selects multiple tasks via checkboxes
    Then the "Arrow-up" button should be hidden
    And the "Arrow-down" button should be hidden

Scenario: First task cannot be moved up
    When the first task in the list is selected via checkbox
    Then the "Arrow-up" button should be disabled

Scenario: Last task cannot be moved down
    When the last task in the list is selected via checkbox
    Then the "Arrow-down" button should be disabled

