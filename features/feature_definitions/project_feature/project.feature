@api_test
Feature: Final Projects for API Testing class

  @test
  Scenario: Project
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request to /projects/1640321
    Then I expect Status code 200
