Feature:

  Background:
    Given the blog is set up
    And I am logged into the admin panel

    #create article 1
    Given I am on the new article page
    When I fill in "article_title" with "Foobar"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    And I press "Publish"
    Then I should be on the admin content page
    When I go to the home page
    Then I should see "Foobar"
    When I follow "Foobar"
    Then I should see "Lorem Ipsum"

    #create article 2
    Given I am on the new article page
    When I fill in "article_title" with "example"
    And I fill in "article__body_and_extended_editor" with "qwer"
    And I press "Publish"
    Then I should be on the admin content page
    When I go to the home page
    Then I should see "example"
    When I follow "example"
    Then I should see "qwer"

  Scenario: The merge interface should not be presented for non-administrators
    #Given I follow "Logged in as"
    #Given I follow "Log out"
    And I am on the home page
    Then I should see "Foobar"
    And I follow "Foobar"
    Then I should not see "Merge Articles"
    And I should not see "Articles ID"


  Scenario: The merge interface should not be presented for new articles
    Given I am on the new article page
    Then I should not see "Merge Articles"
    And I should not see "Article ID"

  Scenario:
    As an admin
    I want to see a "Merge With This Article" button on the edit page
    So that I can merge the current article with another one

    When I am on the admin content page
    When I follow "Foobar"
    Then I should see "Merge Articles"
    And I should see "Article ID"





