Feature: Deleting documents from directory
As a user, I want to delete outdated or incorrect documents so that my directory remains clean and up to date

Background:
    Given the user is logged in as "User"
    And the user is on the "Document Management - Directory overview" page

Scenario: Document table displayed
    Then each row in the "Documents" table should have a checkbox in the first column
    When at least one document checkbox is checked
    Then the "Delete" button should be displayed
    When the user clicks the "Delete" button
    Then the "Confirm Document Deletion" prompt should be displayed
    And the prompt should contain the text "Are you sure you want to delete the selected document(s)?"
    And the prompt should contain the "Yes" button
    And the prompt should contain the "No" button
    When the user clicks the "No" button
    Then the "Confirm Document Deletion" prompt should be closed
    When the user clicks the "Yes" button
    Then the selected documents should be deleted from the table
    And the "Confirm Document Deletion" prompt should be closed

Scenario: Delete button appears with selected documents
    When the user checks the checkbox in the first column of at least one document row
    Then the "Delete" button should be visible

Scenario: Confirmation prompt displayed
    Given at least one checkbox in the first column of the "Documents" table is checked
    When the user clicks the "Delete" button
    Then a "Confirm Document Deletion" prompt should be displayed
    And the prompt should contain the text "Are you sure you want to delete the selected document(s)?"
    And the prompt should contain a "Yes" button
    And the prompt should contain a "No" button

Scenario: Deletion cancelled
    Given the user checks the checkbox in the first column of at least one document row
    When the user clicks the "Delete" button
    Then the "Confirm Document Deletion" prompt should be displayed
    When the user clicks the "No" button
    Then the "Confirm Document Deletion" prompt should be closed
    And the selected documents should remain in the "Documents" table

Scenario: Documents deleted
    Given the user checks the checkbox in the first column of at least one document row
    When the user clicks the "Delete" button
    Then the "Confirm Document Deletion" prompt should be displayed
    When the user clicks the "Yes" button
    Then the "Confirm Document Deletion" prompt should be closed
    And the selected documents should be removed from the "Documents" table

