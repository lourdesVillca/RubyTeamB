@api_test
  Feature: stories
    @smoke @create_project
    Scenario: verify that stories get
      Given I have set a connection to pivotal_tracker API service
      When I send story GET request to a project
      Then I expect Status code 200
      
      @smoke
      Scenario: verify that stories post
        Given I have set a connection to pivotal_tracker API service
        When I send stories POST with json
        """
          {"name":"storyTest"}
        """
        Then I expect Status code 200

    @smoke
    Scenario: Verify method PUT for Story
      Given I have set a connection to pivotal_tracker API service
      When I send a story PUT request to StoriesRequest with json
    """
      {"current_state":"accepted","estimate":1,"name":"blabla"}
    """
      Then I expect Status code 200

    @smoke
    Scenario: Verify method DELETE for Story
      Given I have set a connection to pivotal_tracker API service
      When I send a story DELETE request to StoriesRequest
      Then I expect Status code 204



    @acceptance
    Scenario Outline: Verify create a story with the same parameter send
      Given I have set a connection to pivotal_tracker API service
      When I send storiesAcceptance POST with json
    """
      {"name":"<Name>"}
    """
      Then I expect Status code 200
      And I expect the data same of data send
      Examples:
        | Name |
        | testA |

    @acceptance
    Scenario Outline: Verify format date
      Given I have set a connection to pivotal_tracker API service
      When I send storiesAcceptance POST with json
    """
      {
        "name":"<Name>"
      }
    """
      Then I expect Status code 200
      And I expect the all date format are correct
      Examples:
        | Name |
        | testB |

    @acceptance
    Scenario Outline: Verify Kind Story Registered
      Given I have set a connection to pivotal_tracker API service
      When I send storiesAcceptance POST with json
    """
      {
        "name":"<Name>"
      }
    """
      Then I expect Status code 200
      And I expect the kind of story is equal to story
      Examples:
        | Name |
        | testC |

    @acceptance @delete_project
    Scenario Outline: Verify that the project_id is the same that I have sent
      Given I have set a connection to pivotal_tracker API service
      When I send storiesAcceptance POST with json
    """
      {
        "name":"<Name>"
      }
    """
      Then I expect Status code 200
      And I expect the project_id is the same that I have send
      Examples:
        | Name |
        | testD|
