Feature: Task Management
  Background:
    Given I am logged in as a user

  Scenario: Viewing the list of tasks
    When I visit the tasks page
    And I should see "Name"
    And I should see "Due Date"
    And I should see "Priority"
    And I should see "Actions"

  Scenario: Creating a new task
    When I visit the new task page
    And I fill in "Name" with "New Task"
    And I fill in "Description" with "Task Description"
    And I fill in "Due date" with "2023-12-31"
    And I select "Medium" from "Priority"
    And I fill in "Estimate time range(in hours)" with "5"
    And I press "Create Task"
    Then I should be on the tasks page

  Scenario: Viewing a task
    Given a task with the name "Sample Task" exists
    When I visit the task page for "Sample Task"
    Then I should see "Task Details"
    And I should see "Name: Sample Task"
    And I should see "Description: 11"
    And I should see "Due Date: 2023-12-21"
    And I should see "Priority: low"
    And I should see "Estimated Time Range(Hours): 2"

  Scenario: Editing a task
    Given a task with the name "Editable Task" exists
    When I visit the edit task page for "Editable Task"
    And I fill in "Name" with "Edited Task"
    And I fill in "Description" with "Updated Description"
    And I fill in "Due date" with "2023-12-30"
    And I select "Low" from "Priority"
    And I fill in "Estimated time range" with "3"
    And I press "Update Task"
    Then I should be on the tasks page
    
    And I should see "Edited Task"
    And I should see "2023-12-30"
    And I should see "low"

  Scenario: Deleting a task
    Given a task with the name "Deletable Task" exists
    When I visit the tasks page
    And I delete the task named "Deletable Task"
    Then I should be on the tasks page
    And I should not see "Deletable Task"
