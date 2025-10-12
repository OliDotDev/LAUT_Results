Feature: Deleting documents from directory
As a user, I want to delete outdated or incorrect documents so that my directory remains clean and up to date

Background:
    Given the user is logged in as "User"
    And the user is on the "Document Management - Directory overview" page

Scenario: Document row with checkbox displayed
    When at least one document row has a checked checkbox in the first column of the "Documents" table
    Then the "Delete" button should be displayed
    When the user clicks the "Delete" button
    Then a "Confirm Document Deletion" prompt should be displayed
    And the text "Are you sure you want to delete the selected document(s)?" should be displayed in the prompt
    When the user clicks the "No" button
    Then the prompt should be closed and the selected documents should remain in the table
    When the user clicks the "Yes" button
    Then the selected documents should be deleted, the prompt should be closed, and the documents should be removed from the table

Scenario: Delete button shown after selecting documents
    When the user checks the checkbox for at least one document in the "Documents" table
    Then the "Delete" button should be displayed
    When the user clicks the "Delete" button
    Then a prompt with title "Confirm Document Deletion" and text "Are you sure you want to delete the selected document(s)?" should be displayed
    When the user clicks the "Yes" button
    Then the selected documents should be deleted from the table
    And the prompt should close and the selected documents should no longer be present in the "Documents" table

Scenario: Confirm deletion prompt displayed
    When the user checks at least one document checkbox in the first column of the "Documents" table
    And the user clicks the "Delete" button
    Then the prompt with text "Are you sure you want to delete the selected document(s)?" and buttons "Yes" and "No" should be displayed

Scenario: Deletion confirmed
    When the user checks at least one document checkbox in the first column of the "Documents" table
    And the user clicks the "Delete" button
    And the user clicks the "Yes" button in the "Confirm Document Deletion" prompt
    Then the selected documents should be deleted
    And the rows of the deleted documents should disappear from the table

Scenario: No action taken on cancel
    When at least one document checkbox is checked in the table
    And the user clicks the "Delete" button
    And the user clicks the "No" button in the "Confirm Document Deletion" prompt
    Then the "Confirm Document Deletion" prompt should be closed
    And all selected documents should still be present in the table

