Feature: Deleting documents from directory
As a user, I want to delete outdated or incorrect documents so that my directory remains clean and up to date

Background:
    Given the user is logged in as "User"

Scenario: Document checkbox shown
    Given the user navigates to the "Document Management - Directory overview" page
    Then each document row in the "Documents" table displays a checkbox

Scenario: Delete button appears with checked boxes
    Given the user is on the "Document Management - Directory overview" page
    When the user checks at least one document checkbox
    Then the "Delete" button should be displayed

Scenario: Confirm deletion prompt opens on Delete click
    Given the user is on the "Document Management - Directory overview" page
    When the user checks at least one document checkbox
    And the user clicks the "Delete" button
    Then the "Confirm Document Deletion" prompt should be displayed with the message "Are you sure you want to delete the selected document(s)?"
    And the prompt should contain "Yes" and "No" buttons

Scenario: Prompt text and buttons displayed
    Given the user is on the "Document Management - Directory overview" page
    When the user checks at least one document checkbox
    And the user clicks the "Delete" button
    Then the prompt "Are you sure you want to delete the selected document(s)?" should be displayed with "Yes" and "No" buttons

Scenario: Prompt closes on No button click without deleting
    Given the user is on the "Document Management - Directory overview" page
    When the user checks at least one document checkbox
    And the user clicks the "Delete" button
    And the user clicks the "No" button in the "Confirm Document Deletion" prompt
    Then the "Confirm Document Deletion" prompt should be closed
    And all selected documents should remain in the table

Scenario: Selected documents deleted on Yes button click
    Given the user is on the "Document Management - Directory overview" page
    When the user checks at least one document checkbox in the "Documents" table
    And the user clicks the "Delete" button
    And the user clicks the "Yes" button in the "Confirm Document Deletion" prompt
    Then the selected documents are removed from the "Documents" table

Scenario: Check and uncheck document checkboxes
    Given the user is on the "Document Management - Directory overview" page
    When the user checks the checkbox next to a document named "<documentName>" in the "Documents" table
    Then the "Delete" button should be displayed
    When the user clicks the "Delete" button
    Then the "Confirm Document Deletion" prompt should be displayed with the message "Are you sure you want to delete the selected document(s)?"
    When the user clicks the "No" button in the prompt
    Then the prompt should close and the document checkbox should remain checked
    When the user clicks the "Yes" button in the prompt
    Then the prompt should close, the document checkbox should be unchecked, and the document row should be removed from the table

Scenario: Delete button not displayed when no documents are selected
    Given the user is on the "Document Management - Directory overview" page
    When no document checkboxes are checked
    Then the "Delete" button should not be displayed

Scenario: Open deletion confirmation prompt
    Given the user is on the "Document Management - Directory overview" page
    When at least one document checkbox is checked
    And the user clicks the "Delete" button
    Then the prompt with text "Are you sure you want to delete the selected document(s)?" and buttons "Yes" and "No" should be displayed

Scenario: Stay on page after clicking 'No' in deletion confirmation
    Given the user is on the "Document Management - Directory overview" page
    When the user checks at least one document checkbox
    And the user clicks the "Delete" button
    And the user clicks the "No" button in the "Confirm Document Deletion" prompt
    Then the user should be on the "Document Management - Directory overview" page

Scenario: Close deletion confirmation prompt after clicking 'Yes'
    Given the user is on the "Document Management - Directory overview" page
    When the user checks at least one document checkbox
    And the user clicks the "Delete" button
    And the user clicks the "Yes" button in the "Confirm Document Deletion" prompt
    Then the "Confirm Document Deletion" prompt should be closed

