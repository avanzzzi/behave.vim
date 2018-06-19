Feature: Test
  Scenario: Switching to vim
    Given I am using "emacs"
    And I am '100%' 'not happy'
    When I switch to "vim"
    Then I will be happy
