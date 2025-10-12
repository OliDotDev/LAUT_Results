Feature: Adding a new document
As a user, I want to upload documents and tag them so that they are easy to find later

Background:
    Given the user is logged in as "User"
    And the user is on the "Document Management - Directory overview" page

Scenario: Add new document button displayed
    Then the "Add new document" button should be displayed

Scenario: Modal opened on clicking 'Add new document'
    When the user clicks the "Add new document" button
    Then the "Add new document" modal should be displayed
    And the "Name" input field should be visible
    And the "Document" file input should be displayed
    And the "Tags" dropdown should be visible
    And the "Cancel" button should be displayed
    And the "Save" button should be displayed

Scenario: Modal closed on clicking 'Cancel'
    When the user clicks the "Add new document" button
    Then the "Add new document" modal should be displayed
    When the user clicks the "Cancel" button in the "Add new document" modal
    Then the "Add new document" modal should be closed

Scenario: Validation error for missing name
    When the user clicks the "Add new document" button
    And the user leaves the "Name" input field empty
    And the user selects a PDF file in the "Document" file input
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed for the "Name" input field

Scenario: Validation error for no document selected
    When the user clicks the "Add new document" button
    And the user enters "<documentName>" into the "Name" input field
    And the user leaves the "Document" file input empty
    And the user clicks the "Save" button
    Then the validation message "No document provided." should be displayed for the "Document" file input

Scenario: Validation error for non-PDF file
    When the user clicks the "Add new document" button
    And the user enters "<documentName>" into the "Name" input field
    And the user selects a non-PDF file in the "Document" file input
    And the user clicks the "Save" button
    Then the validation message "Only PDF files are allowed." should be displayed for the "Document" file input

Scenario: Document uploaded successfully
    When the user clicks the "Add new document" button
    And the user enters "<documentName>" into the "Name" input field
    And the user selects a PDF file in the "Document" file input
    And the user selects one or more tags from the "Tags" dropdown
    And the user clicks the "Save" button
    Then the modal should be closed
    And a new row with document name "<documentName>" and selected tags should appear in the list

Scenario: Tags dropdown is multi-select
    When the user clicks the "Add new document" button
    And the user enters "<documentName>" into the "Name" input field
    And the user selects "<tag1>, <tag2>, ..." from the "Tags" dropdown
    And the user uploads a PDF file to the "Document" file input
    And the user clicks the "Save" button
    Then the document should be uploaded and displayed in the list with tags "<tag1>, <tag2>, ..."

Scenario: Tags dropdown contains all system tags
    When the user clicks the "Add new document" button
    Then the "Tags" dropdown should contain all system tags

Scenario: Validation triggered on Save button click
    When the user clicks the "Add new document" button
    And the user enters an empty value into the "Name" input field
    And the user does not select any file for the "Document" file input
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed for the "Name" input field
    And the validation message "No document provided." should be displayed for the "Document" file input

Scenario: Confirmation message displayed after successful upload
    When the user clicks the "Add new document" button
    And the user enters "<documentName>" into the "Name" input field
    And the user selects a file named "<pdfFileName>.pdf" for the "Document" file input
    And the user selects tags from the "Tags" dropdown
    And the user clicks the "Save" button
    Then a confirmation message should be displayed indicating successful upload
    And the document with name "<documentName>" should appear in the list

Scenario: Document appears in list post-upload
    When the user clicks the "Add new document" button
    And the user enters "<documentName>" into the "Name" input field
    And the user selects a file in the "Document" file input and confirms it is a PDF
    And the user selects one or more tags from the "Tags" dropdown
    And the user clicks the "Save" button
    Then the "Add new document" modal should be closed
    And the document list should contain an entry with the name "<documentName>"

