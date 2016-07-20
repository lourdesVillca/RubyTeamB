@api_test
  Feature: Project for API Testing Class (workspace)

    @smoke
    Scenario: Get workspace
      Given I have set a connection to pivotal_tracker API service
      When I send a workspace GET request to
      Then I expect Status code 200

    @smoke
    Scenario: Post workspace
      Given I have set a connection to pivotal_tracker API service
      When I send a workspace POST with the json
      """
      {
        "name":"workspaceTest001"
      }
      """
      Then I expect Status code 200

    @smoke @create_project @delete_project
    Scenario: PUT workspace
      Given I have set a connection to pivotal_tracker API service
      When I send a workspace PUT request to add project
      Then I expect Status code 200

    @smoke @create_workspace
    Scenario: DELETE workspace
      Given I have set a connection to pivotal_tracker API service
      When I send a workspace DELETE request to delete WorkspaceRequest
      Then I expect Status code 204

    @acceptance
    Scenario Outline: Verify than the created workspace was created with the same values inserted.
      Given I have set a connection to pivotal_tracker API service
      When I send a workspace POST request with the json
    """
      {
        "name":"<Name>"
      }
    """
      Then I expect Status code 200
      And I expect the all inserted data workspace are the same
      Examples:
        | Name |
        | workspace-E1 |
        | workspace-E2 |
        | workspace-E3 |
