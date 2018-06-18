Feature: Test
  Scenario: Switching to vim
    Given I am using "emacs"
    And I am not happy
    When I switch to "vim"
    Then I will be happy
