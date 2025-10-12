Feature: Deleting documents from directory
As a user, I want to delete outdated or incorrect documents so that my directory remains clean and up to date

Background:
    Given the user is logged in as "User"
    And the user is on the "Document Management - Directory overview" page

Scenario: Document checkboxes displayed
    Then each document row in the "Documents" table should have a checkbox in the first column

Scenario: Delete button shown when at least one document is selected
    When the user checks at least one document checkbox in the "Documents" table
    Then the "Delete" button should be displayed

Scenario: Confirm Document Deletion prompt opened
    When the user checks at least one checkbox in the "Documents" table
    And the user clicks the "Delete" button
    Then a "Confirm Document Deletion" prompt should be displayed
    And the text "Are you sure you want to delete the selected document(s)?" should be displayed in the prompt
    And the buttons "Yes" and "No" should be displayed in the prompt

Scenario: Deletion cancelled by clicking No
    When the user checks at least one document checkbox in the "Documents" table
    And the user clicks the "Delete" button
    And the user clicks the "No" button in the "Confirm Document Deletion" prompt
    Then the "Confirm Document Deletion" prompt should be closed
    And the checked documents should still be present in the "Documents" table

Scenario: Documents deleted after confirming Yes
    When the user checks the checkbox for document "<documentName>" in the "Documents" table
    And the user clicks the "Delete" button
    And the user clicks the "Yes" button in the "Confirm Document Deletion" prompt
    Then the "Confirm Document Deletion" prompt should be closed
    And the document "<documentName>" should not be present in the "Documents" table

Scenario: Delete confirmation modal displayed
    When the user checks the checkbox of a document row in the "Documents" table
    And the user clicks the "Delete" button
    Then a "Confirm Document Deletion" prompt should be displayed
    And the text "Are you sure you want to delete the selected document(s)?" should be displayed in the prompt
    And the button "Yes" should be displayed in the prompt
    And the button "No" should be displayed in the prompt

Scenario: Documents deleted on confirmation
    When the user checks the checkboxes for selected documents in the "Documents" table
    And the user clicks the "Delete" button
    And the user clicks the "Yes" button in the "Confirm Document Deletion" prompt
    Then the selected documents should be removed from the "Documents" table

