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
    Then the "Add new document" modal should be closed

Scenario: Validate Name Field
    When the user clicks the "Add new document" button
    And the user leaves the "Name" input field empty
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed for the "Name" input field

Scenario: Validate Document Field
    When the user clicks the "Add new document" button
    And the user leaves the "Name" input field empty
    And the user does not select a file in the "Document" file input
    And the user clicks the "Save" button
    Then the validation message "No document provided." should be displayed for the "Document" file input

Scenario: Validate PDF File Format
    When the user clicks the "Add new document" button
    And the user selects a non-PDF file in the "Document" file input
    And the user clicks the "Save" button
    Then the validation message "Only PDF files are allowed." should be displayed for the "Document" file input

Scenario: Save Valid Document
    When the user clicks the "Add new document" button
    And the user enters "<documentName>" into the "Name" input field
    And the user selects a PDF file for the "Document" file input
    And the user clicks the "Save" button
    Then the document should be uploaded and shown in the list
    And the "Add new document" modal should be closed

Scenario: Add new document button displayed
    Then the "Add new document" button should be displayed

Scenario: Add new document modal opened
    When the user clicks the "Add new document" button
    Then the "Add new document" modal should be displayed
    And the modal should contain a "Name" input field
    And the modal should contain a "Document" file input
    And the modal should contain a "Tags" dropdown

Scenario: Name field required validation shown
    When the user clicks the "Add new document" button
    And the user leaves the "Name" input field empty
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed for the "Name" input field

Scenario: Non-PDF file error shown
    When the user clicks the "Add new document" button
    And the user selects a non-PDF file in the "Document" file input
    And the user clicks the "Save" button
    Then the validation message "Only PDF files are allowed." should be displayed near the "Document" file input

Scenario: Tags dropdown displayed
    When the user clicks the "Add new document" button
    Then the "Tags" dropdown in the "Add new document" modal should contain all available tags for multi-select

Scenario: Modal closed on Cancel click
    When the user clicks the "Add new document" button
    And the user clicks the "Cancel" button in the "Add new document" modal
    Then the "Add new document" modal should be closed

Scenario: Validation shown for missing inputs
    When the user clicks the "Add new document" button
    And the user leaves the "Name" input field empty
    And the user selects no document in the "Document" file input
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed for the "Name" input field
    And the validation message "No document provided." should be displayed for the "Document" file input

Scenario: Upload Document Successfully
    When the user clicks the "Add new document" button
    And the user enters "<documentName>" into the "Name" input field
    And the user selects a PDF file for the "Document" file input
    And the user clicks the "Save" button
    Then the document should be uploaded and displayed in the list

