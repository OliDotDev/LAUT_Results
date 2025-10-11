Feature: Deleting documents from directory
As a user
I want to delete outdated or incorrect documents
so that my directory remains clean and up to date.

Background:
    Given the user is logged in as "user"
    And the user is on the "Document Management - Directory overview" page

Scenario: Initial Display
    Then the "Documents" table should be visible
    And the "Delete" button should be hidden
	
Scenario: Checkbox for all documents
    Then each row in the "Documents" table should have a checkbox in the 1. column

Scenario: "Delete" Button displayed - Single selection
    Given the "<document>" document is in the "Documents" table
    When the user checks the checkbox for the "<document>" document
    Then the "Delete" button should be visible

Scenario: "Delete" Button displayed - Multiple selections
    Given the "<document1>" document is in the "Documents" table
    And the "<document2>" document is in the "Documents" table
    When the user checks the checkbox for the "<document1>" document
    And the user checks the checkbox for the "<document2>" document
    Then the "Delete" button should be visible

Scenario: "Delete" Button not displayed - No selection
    Given the "<document>" document is in the "Documents" table
    When the user checks the checkbox for the "<document>" document
    And the user unchecks the checkbox for the "<document>" document
    Then the "Delete" button should be hidden

Scenario: Deletion prompt displayed
    Given the "<document>" document is in the "Documents" table
    When the user checks the checkbox for the "<document>" document
    And the user clicks the "Delete" button
    Then the "Confirm Document deletion" prompt should be visible
    And the "Yes" button should be visible
    And the "No" button should be visible
    And the "Confirm Document deletion" prompt should contain the text "Are you sure you want to delete the selected document(s)?"

Scenario: Cancel deletion
    Given the "<document>" document is in the "Documents" table
    When the user checks the checkbox for the "<document>" document
    And the user clicks the "Delete" button
    And the user clicks the "No" button
    Then the "Confirm Document deletion" prompt should be hidden
    And the "Documents" table should contain a row with "<document>"

Scenario: Successful deletion - Single document
    Given the "<document>" document is in the "Documents" table
    When the user checks the checkbox for the "<document>" document
    And the user clicks the "Delete" button
    And the user clicks the "Yes" button
    Then the "Confirm Document deletion" prompt should be hidden
    And the "Documents" table should not contain a row with "<document>"

Scenario: Successful deletion - Multiple documents
    Given the "<document1>" document is in the "Documents" table  
    And the "<document2>" document is in the "Documents" table 
    When the user checks the checkbox for the "<document1>" document
    And the user checks the checkbox for the "<document2>" document
    And the user clicks the "Delete" button
    And the user clicks the "Yes" button
    Then the "Confirm Document deletion" prompt should be hidden
    And the "Documents" table should not contain a row with "<document1>"
    And the "Documents" table should not contain a row with "<document2>"