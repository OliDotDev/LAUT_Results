Feature: Deleting documents from directory
As a user, I want to delete outdated or incorrect documents so that my directory remains clean and up to date

Background:
    Given the user is logged in as "User"
    And the user is on the "Document Management - Directory overview" page

Scenario: Document row with checkbox displayed
    Then each document row in the table should have a checkbox in the first column
    When at least one document checkbox in the first column of the "Documents" table is checked
    Then the "Delete" button should be displayed
    When the user clicks the "Delete" button
    Then a "Confirm Document Deletion" prompt should be displayed
    And the text "Are you sure you want to delete the selected document(s)?" should be displayed in the prompt
    When the user clicks the "No" button
    Then the prompt should be closed and the selected documents should remain in the table
    When the user clicks the "Yes" button
    Then the selected documents should be deleted, the prompt should be closed, and the documents should be removed from the table

Scenario: Delete button shown after selecting documents
    When the user checks at least one document's checkbox in the "Documents" table
    Then the "Delete" button should be displayed
    When the user clicks the "Delete" button
    Then a "Confirm Document Deletion" prompt should be displayed
    And the selected documents should still be displayed in the table
    When the user clicks the "Yes" button
    Then the selected documents should be deleted from the table

Scenario: Confirm deletion prompt displayed
    When the user checks at least one document checkbox in the first column of the "Documents" table
    And the user clicks the "Delete" button
    Then the "Confirm Document Deletion" prompt should be displayed
    And the text "Are you sure you want to delete the selected document(s)?" should be displayed in the prompt
    And the button "Yes" and a "No" button should be displayed in the prompt

Scenario: Documents not deleted after clicking No in prompt
    When at least one document checkbox is checked in the first column of the "Documents" table
    And the user clicks the "Delete" button
    And the user clicks the "No" button in the "Confirm Document Deletion" prompt
    Then the selected documents should remain intact in the table "Documents"

Scenario: Selected documents deleted after clicking Yes in prompt
    When the user checks at least one document checkbox in the first column of the "Documents" table
    And the user clicks the "Delete" button
    And the user clicks the "Yes" button in the "Confirm Document Deletion" prompt
    Then the selected documents should be removed from the table "Documents"
    And the "Confirm Document Deletion" prompt should be closed

