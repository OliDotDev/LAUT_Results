Feature: Deleting documents from directory
As a user, I want to delete outdated or incorrect documents so that my directory remains clean and up to date

Background:
    Given the user is logged in as "User"

Scenario: Document checkbox shown
    Given the user navigates to the "Document Management - Directory overview" page
    Then each row in the "Documents" table contains a checkbox

Scenario: Delete button appears with checked boxes
    Given the user is on the "Document Management - Directory overview" page
    When at least one document checkbox in the "Documents" table is checked
    Then the "Delete" button should be visible

Scenario: Confirm deletion prompt opens on Delete click
    Given the user is on the "Document Management - Directory overview" page
    When the user checks at least one document checkbox in the "Documents" table
    And the user clicks the "Delete" button
    Then the prompt "Confirm Document Deletion" should be displayed with the message "Are you sure you want to delete the selected document(s)?" and options to confirm or cancel

Scenario: Prompt text and buttons displayed
    Given the user is on the "Document Management - Directory overview" page
    When the user checks at least one document checkbox
    And the user clicks the "Delete" button
    Then the prompt "Confirm Document Deletion" should be displayed with the message "Are you sure you want to delete the selected document(s)?"
    And the buttons "Yes" and "No" should be displayed

Scenario: Prompt closes on No click, documents remain
    Given the user is on the "Document Management - Directory overview" page
    When the user checks at least one document checkbox
    And the user clicks the "Delete" button
    And the user clicks the "No" button in the "Confirm Document Deletion" prompt
    Then the prompt should be closed
    And all selected documents should remain in the table

Scenario: Selected documents deleted on Yes click
    Given the user is on the "Document Management - Directory overview" page
    When the user checks at least one document checkbox in the "Documents" table
    And the user clicks the "Delete" button
    And the user clicks the "Yes" button in the "Confirm Document Deletion" prompt
    Then the selected documents are removed from the "Documents" table
    And the "Confirm Document Deletion" prompt is closed

Scenario: Hidden Delete button with no checked documents
    Given the user is on the "Document Management - Directory overview" page
    When no document checkboxes are selected
    Then the "Delete" button should be hidden

Scenario: Confirm Document Deletion prompt opens on Delete click
    Given the user is on the "Document Management - Directory overview" page
    When at least one document checkbox is checked
    And the user clicks the "Delete" button
    Then the "Confirm Document Deletion" modal should be displayed with the message "Are you sure you want to delete the selected document(s)?"

Scenario: Selected documents remain after clicking 'No' in prompt
    Given the user is on the "Document Management - Directory overview" page
    When the user selects one or more documents by checking their checkboxes
    And the user clicks the "Delete" button
    And the user clicks the "No" button in the "Confirm Document Deletion" prompt
    Then all selected documents are still present in the "Documents" table

Scenario: Confirmation message displayed on successful deletion
    Given the user is on the "Document Management - Directory overview" page
    When the user checks at least one document checkbox
    And the user clicks the "Delete" button
    And the user clicks the "Yes" button in the "Confirm Document Deletion" prompt
    Then the message "Item removed from cart" should be displayed

