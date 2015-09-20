Prerequisite:

$ gem update --system

$ gem install cucumber --no-ri --no-rdoc

$ cucumber --init    # creates file structure for tests


----


Run the cucumber on this level!!

$ cucumber




----


Feature: Title (one line describing the story/feature)

    As a    [role]
    I want  [feature]
    So that [benefit]

    Scenario: Title1 (for Behaviour 1)

        Given [context or setup]
        And  [some more context]...
        When [event occurs]
        Then [expected outcome]
        And  [another outcome]...

    Scenario: Title2 (for Behaviour 2)