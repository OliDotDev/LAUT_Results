Feature: Deleting documents from directory
As a user, I want to delete outdated or incorrect documents so that my directory remains clean and up to date

Background:
    Given the user is logged in as "User"
    And the user is on the "Document Management - Directory overview" page

Scenario: Document row with checkbox displayed
    When at least one document row has a checkbox checked in the first column of the "Documents" table
    Then the "Delete" button should be displayed
    When the user clicks the "Delete" button
    Then the "Confirm Document Deletion" prompt should be displayed
    And the text "Are you sure you want to delete the selected document(s)?" should be visible in the prompt
    When the user clicks the "Yes" button
    Then the selected documents should be deleted from the table
    And the prompt should close

Scenario: Delete button shown after selecting documents
    When the user checks the checkbox for at least one document in the "Documents" table
    Then the "Delete" button should be displayed
    When the user clicks the "Delete" button
    Then a "Confirm Document Deletion" prompt should be displayed
    When the user clicks the "Yes" button
    Then the selected documents should be deleted from the table
    And the "Confirm Document Deletion" prompt should be closed

Scenario: Confirm deletion prompt displayed
    When the user checks at least one document checkbox in the first column of the "Documents" table
    And the user clicks the "Delete" button
    Then the confirmation prompt with "Yes" and "No" buttons should be displayed
    And the text "Are you sure you want to delete the selected document(s)?" should be displayed in the confirmation prompt

Scenario: Prompt shows selected documents for deletion
    When the user checks the checkbox for a document in the "Documents" table
    And the user clicks the "Delete" button
    Then the prompt "Confirm Document Deletion" should be displayed
    And the text "Are you sure you want to delete the selected document(s)?" should be displayed in the prompt
    When the user clicks the "No" button
    Then the prompt should be closed and the documents should remain in the table
    When the user clicks the "Yes" button
    Then the selected documents should be deleted from the table

Scenario: Deletion confirmed
    When the user checks at least one document checkbox in the first column of the "Documents" table
    And the user clicks the "Delete" button
    And the user clicks the "Yes" button in the "Confirm Document Deletion" prompt
    Then the selected documents should be deleted
    And all rows of the deleted documents should disappear from the "Documents" table

Scenario: No action taken on cancel
    When the user checks at least one document checkbox in the first column of the "Documents" table
    And the user clicks the "Delete" button
    And the user clicks the "No" button in the "Confirm Document Deletion" prompt
    Then the "Confirm Document Deletion" prompt should be closed
    And all selected documents should still be visible in the table "Documents"

