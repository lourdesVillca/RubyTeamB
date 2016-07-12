@api_test
Feature: Final Projects for API Testing class

  @smoke
  Scenario: Story GET
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request to /projects/1655707/stories/126075565
    Then I expect Status code 200

   @smoke
  Scenario Outline: Story PUT
    Given I have set a connection to pivotal_tracker API service
    When I send a PUT request to /projects/1655707/stories/126075565
     """
		{"current_state":"<CurrentState>","estimate":<Estimate>,"name":"<Name>"}
     """
    Then I expect Status code 200

	Examples:
	| CurrentState |Estimate| Name |
	| accepted | 1 | Exhaust ports have ray shielding |
	

 @smoke
  Scenario Outline: Story POST
    Given I have set a connection to pivotal_tracker API service
    When I send a POST request to /projects/1655707/stories/
     """
		{"name":"<Name>"}
     """
    Then I expect Status code 200

	Examples:
	| Name  |
	| Story 11| 
	| Story 22|
	| Story 33|

@smoke
  Scenario: Story DELETE
     Given I have set a connection to pivotal_tracker API service
     When I send a DELETE request to /projects/1655707/stories/126078753
     Then I expect Status code 204