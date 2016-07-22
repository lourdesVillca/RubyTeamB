@test
Feature: Workflow to create a project, add story and epics and add comments to a story

  @workflow
  Scenario Outline: Final Project WORKFLOW
    Given I have set a connection to pivotal_tracker API service
    When I send project POST request for a project with json
       """
        {
        "name":"<project>"
        }
      """
      And I send story POST request to belong to the created project with the json
      """
          {"name":"<story>"}
      """
      And I send a epic POST request to belong to the created project with the json
      """
        {
        "name":"<name_epic>"
       }
      """
      And I send a Comments POST request for a created story with the json
      """
        {
        "text":"<text>"
        }
      """
      And I add a workspaces POST request to add a created project with json
      """
      {
        "name":"<workspace>"
      }
      """
      And I PUT the created project to workspace
    Then I expect Status code 200

    Examples:
     | text |name_epic|story|project|workspace|
     | Comments-01 | new_epic |storyTest|Project_Workflow9|workspace_workflow9|

    Scenario: Delete project and workspace
      Given I have set a connection to pivotal_tracker API service
      When I DELETE the created project
        And I DELETE the created workspace
      Then I expect Status code 204