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
    And the user clicks the "Cancel" button in the modal
    Then the modal should be closed without saving any changes

Scenario: Validate Name Field
    When the user clicks the "Add new document" button
    And the user leaves the "Name" input field empty
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed for the "Name" input field

Scenario: Validate Document Field
    When the user clicks the "Add new document" button
    And the user leaves the "Document" file input empty
    And the user clicks the "Save" button
    Then the validation message "No document provided." should be displayed for the "Document" file input

Scenario: Validate PDF File Format
    When the user clicks the "Add new document" button
    And the user selects a non-PDF file in the "Document" file input
    And the user clicks the "Save" button
    Then the validation message "Only PDF files are allowed." should be displayed for the "Document" file input

Scenario: Successfully Add Document
    When the user clicks the "Add new document" button
    And the user enters "<documentName>" into the "Name" input field
    And the user selects a PDF file using the "Document" file input
    And the user clicks the "Save" button
    Then the document is uploaded and shown in the list
    And the "Add new document" modal should be closed

Scenario: Modal closes after successful document addition
    When the user clicks the "Add new document" button
    And the user enters "<documentName>" into the "Name" input field
    And the user selects a PDF file for the "Document" file input
    And the user clicks the "Save" button
    Then the "Add new document" modal should be closed

Scenario: Name field validation for empty input
    When the user clicks the "Add new document" button
    And the user leaves the "Name" input field empty
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed for the "Name" input field

Scenario: PDF file format validation
    When the user clicks the "Add new document" button
    And the user leaves the "Name" input field empty
    And the user selects a non-PDF file in the "Document" file input
    And the user clicks the "Save" button
    Then the validation message "Only PDF files are allowed." should be displayed for the "Document" file input

Scenario: Modal closes on Cancel without saving changes
    When the user clicks the "Add new document" button
    And the user clicks the "Cancel" button in the "Add new document" modal
    Then the "Add new document" modal should be closed without saving any changes

Scenario: Validation message shown for empty Name field when adding new document
    When the user clicks the "Add new document" button
    And the user leaves the "Name" input field empty
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed for the "Name" input field

Scenario: Validation message shown for no document selected
    When the user clicks the "Add new document" button
    And the user leaves the "Document" file input empty
    And the user clicks the "Save" button
    Then the validation message "No document provided." should be displayed for the "Document" file input

