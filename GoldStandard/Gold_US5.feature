Feature: Changing order of tasks
As a user
I want to change the order of tasks in a directory
so that I can arrange them according to priority or workflow.

Background:
    Given the user is logged in as "user"
    And the user is on the "Task Management" page

Scenario: Initial Display
    Then the "Tasks" table should be visible
    And the "Tasks" table should have a "Sequence Number" column
    And each task in the "Tasks" table should have a sequence number

Scenario: Ordering by "Sequence Number"
    Then all entries in the "Tasks" table should be ordered by "Sequence Number"

Scenario: "Arrow" Buttons displayed - Single selection
    When the user checks the checkbox for the "<task>" task
    Then the button with the "Arrow-up" icon should be visible
    And the button with the "Arrow-down" icon should be visible

Scenario: "Arrow" Buttons displayed - Multiple selections
    When the user checks the checkbox for the "<task1>" task
    And the user checks the checkbox for the "<task2>" task
    Then the button with the "Arrow-up" icon should be hidden
    And the button with the "Arrow-down" icon should be hidden

Scenario: "Arrow" Buttons when first checkbox checked
    When the user checks the checkbox of the first row in the "Tasks" table
    Then the button with the "Arrow-up" icon should be disabled
    And the button with the "Arrow-down" icon should be enabled

Scenario: "Arrow" Buttons when last checkbox checked
    When the user checks the checkbox of the last row in the "Tasks" table
    Then the button with the "Arrow-up" icon should be enabled
    And the button with the "Arrow-down" icon should be disabled

Scenario: Move task up
    When the user checks the checkbox for the "<task2>" task
    And the user clicks the button with the "Arrow-up" icon
    Then the "<task2>" task should be in the <position>. row in the "Tasks" table
    And the "Sequence Number" of the "<task1>" task in the "Tasks" table should be <sequenceNumber>
    And the "Sequence Number" of the "<task2>" task in the "Tasks" table should be <sequenceNumber>

Scenario: Move task down
    When the user checks the checkbox for the "<task1>" task
    And the user clicks the button with the "Arrow-down" icon
    Then the "<task1>" task should be in the <position>. row in the "Tasks" table
    And the "Sequence Number" of the "<task1>" task in the "Tasks" table should be <sequenceNumber>
    And the "Sequence Number" of the "<task2>" task in the "Tasks" table should be <sequenceNumber>

Scenario: Seletion remains after moving task
    When the user checks the checkbox for the "<task1>" task
    And the user clicks the button with the "Arrow-down" icon

    Then the checkbox for the "<task1>" task should be checked
