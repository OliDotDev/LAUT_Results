Feature: Adding a new document
As a user, I want to upload documents and tag them so that they are easy to find later

Background:
    Given the user is logged in as "User"
    And the user is on the "Document Management - Directory overview" page

Scenario: Open Add New Document Modal
    When the user clicks the "Add new document" button
    Then the "Add new document" modal should be displayed

Scenario: Cancel Adding Document
    When the user clicks the "Add new document" button
    And the user clicks the "Cancel" button in the "Add new document" modal
    Then the "Add new document" modal should be closed without saving any data

Scenario: Validate Name Field (Required)
    When the user clicks the "Add new document" button
    And the user leaves the "Name" input field empty
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed for the "Name" input field

Scenario: Validate Document Field (Required)
    When the user clicks the "Add new document" button
    And the user leaves the "Name" input field empty
    And the user leaves the "Document" file input empty
    When the user clicks the "Save" button
    Then the validation message "No document provided." should be displayed for the "Document" file input

Scenario: Validate Document Format
    When the user clicks the "Add new document" button
    And the user enters "<documentName>" into the "Name" input field
    And the user selects a non-PDF file in the "Document" file input
    And the user clicks the "Save" button
    Then the validation message "Only PDF files are allowed." should be displayed for the "Document" file input

Scenario: Upload Document Successfully
    When the user clicks the "Add new document" button
    And the user enters "<documentName>" into the "Name" input field
    And the user selects a PDF file using the "Document" file input
    And the user clicks the "Save" button
    Then the "Add new document" modal should be closed
    And the table of documents should contain the value "<documentName>" in the "Name" column

Scenario: Add new document modal opens
    When the user clicks the "Add new document" button
    Then the "Add new document" modal should be displayed

Scenario: Name field required validation shown
    When the user clicks the "Add new document" button
    And the user leaves the "Name" input field empty
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed for the "Name" input field

Scenario: Cancel closes modal without saving
    When the user clicks the "Add new document" button
    And the user clicks the "Cancel" button in the "Add new document" modal
    Then the "Add new document" modal should be closed without saving any data

Scenario: Invalid data validation shown
    When the user clicks the "Add new document" button
    And the user leaves the "Name" input field empty
    And the user selects a non-PDF file in the "Document" file input
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed for the "Name" input field
    And the validation message "Only PDF files are allowed." should be displayed for the "Document" file input

Scenario: Document uploads successfully
    When the user clicks the "Add new document" button
    And the user enters "<documentName>" into the "Name" input field
    And the user selects a PDF file for the "Document" file input
    And the user selects one or more tags from the "Tags" dropdown
    And the user clicks the "Save" button
    Then the document should be uploaded and shown in the list
    And the "Add new document" modal should be closed

Scenario: No document provided validation shown
    When the user clicks the "Add new document" button
    And the user leaves the "Name" input field empty
    And the user does not select a file in the "Document" file input
    And the user clicks the "Save" button
    Then the validation message "No document provided." should be displayed next to the "Document" file input

Scenario: Invalid file format validation shown
    When the user clicks the "Add new document" button
    And the user leaves the "Name" input field empty
    And the user selects a non-PDF file in the "Document" file input
    And the user clicks the "Save" button
    Then the validation message "Only PDF files are allowed." should be displayed for the "Document" file input

