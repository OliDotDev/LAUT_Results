Feature: Deleting documents from directory
As a user, I want to delete outdated or incorrect documents so that my directory remains clean and up to date

Background:
    Given the user is logged in as "User"

Scenario: Document checkbox shown
    Given the user navigates to the "Documents" page
    Then each row in the "Documents" table contains a checkbox in the first column

Scenario: Delete button appears with checked boxes
    Given the user is on the "Document Management - Directory overview" page
    When at least one checkbox in the first column of the "Documents" table is checked
    Then the "Delete" button should be visible

Scenario: Confirm deletion prompt opens on Delete click
    Given the user is on the "Document Management - Directory overview" page
    When the user checks at least one document checkbox
    And the user clicks the "Delete" button
    Then the "Confirm Document Deletion" prompt should be displayed with the text "Are you sure you want to delete the selected document(s)?"
    And the "Yes" and "No" buttons should be displayed

Scenario: Prompt text and buttons displayed
    Given the user is on the "Document Management - Directory overview" page
    When the user checks at least one document checkbox
    And the user clicks the "Delete" button
    Then the prompt text should be displayed as "Are you sure you want to delete the selected document(s)?"
    And the "Yes" and "No" buttons should be displayed

Scenario: Prompt closes on No click, documents remain
    Given the user is on the "Document Management - Directory overview" page
    When the user checks at least one document checkbox in the "Documents" table
    And the user clicks the "Delete" button
    And the user clicks the "No" button in the "Confirm Document Deletion" prompt
    Then the "Confirm Document Deletion" prompt should be closed
    And all previously checked documents should remain selected

Scenario: Selected documents deleted on Yes click
    Given the user is on the "Document Management - Directory overview" page
    When the user checks at least one document checkbox in the "Documents" table
    And the user clicks the "Delete" button
    And the user clicks the "Yes" button in the "Confirm Document Deletion" prompt
    Then the selected documents are removed from the "Documents" table
    And the "Confirm Document Deletion" prompt is closed

Scenario: Delete button visibility toggles with checkbox selection
    Given the user is on the "Document Management - Directory overview" page
    When no document checkboxes are checked
    Then the "Delete" button should be hidden
    When at least one document checkbox is checked
    Then the "Delete" button should be visible

Scenario: Delete Document - Confirmation Prompt
    Given the user is on the "Document Management" page
    When the user checks at least one document checkbox
    And the user clicks the "Delete" button
    Then the modal "Confirm Document Deletion" should be displayed with options "Yes" and "No"

Scenario: Prompt closes on clicking outside buttons
    Given the user is on the "Document Management - Directory overview" page
    When the user checks at least one document checkbox
    And the user clicks the "Delete" button
    Then the "Confirm Document Deletion" prompt is displayed with "Yes" and "No" buttons
    When the user clicks outside of the "Yes" or "No" buttons
    Then the "Confirm Document Deletion" prompt should be closed

Scenario: Message displayed after clicking No button
    Given the user is on the "Document Management - Directory overview" page
    When the user checks at least one document checkbox
    And the user clicks the "Delete" button
    And the user clicks the "No" button in the "Confirm Document Deletion" prompt
    Then a message confirming document deletion cancellation is displayed

Scenario: Confirmation before documents removal
    Given the user is on the "Document Management - Directory overview" page
    When the user checks at least one document checkbox in the "Documents" table
    And the user clicks the "Delete" button
    Then the "Confirm Document Deletion" prompt is displayed with the message "Are you sure you want to delete the selected document(s)?"
    When the user clicks the "Yes" button
    Then the selected documents are removed from the table