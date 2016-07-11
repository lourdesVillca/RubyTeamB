@api_test
Feature: Project for API Testing Class (workspace)

  @smoke
  Scenario: Get workspace
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request to /my/workspaces/591593
    Then I expect Status code 200

  @smoke
  Scenario: Put workspace
    Given I have set a connection to pivotal_tracker API service
    When I send a PUT request to /my/workspaces/591595
    """
      {
        "id":591595,"project_ids":[1655737]
      }
    """
    Then I expect Status code 200

  @smoke
  Scenario: Post workspace
    Given I have set a connection to pivotal_tracker API service
    When I send a POST request to /my/workspaces
    """
      {
        "name": "the new workspace Ericka"
      }
    """
    Then I expect Status code 200

  @smoke
  Scenario: Delete workspace
    Given I have set a connection to pivotal_tracker API service
    When I send a workspace DELETE request to /my/workspaces/591611
    Then I expect Status code 204