@routing  @guidance @collapsing
Feature: Collapse

    Background:
        Given the profile "car"
        Given a grid size of 20 meters

    Scenario: Collapse Steps While On Ferry
        Given the node map
            """
            j    a   c   b    k


                        d


                                    f
                                e
            """

        And the ways
            | nodes | highway | route | name |
            | jacbk | primary |       | land |
            | ad    |         | ferry | sea  |
            | bd    |         | ferry | sea  |
            | cd    |         | ferry | sea  |
            | de    |         | ferry | sea  |
            | ef    | primary |       | land |

        When I route I should get
            | waypoints | route              | turns                                      | modes                         |
            | f,j       | land,sea,land,land | depart,notification right,turn left,arrive | driving,ferry,driving,driving |

    Scenario: Collapse Steps While On Ferry
        Given the node map
            """
            j    a   c   b    k


                        d


                        g


                                    f
                                e
            """

        And the ways
            | nodes | highway | route | name |
            | jacbk | primary |       | land |
            | ad    |         | ferry | sea  |
            | bd    |         | ferry | sea  |
            | cd    |         | ferry | sea  |
            | dg    |         | ferry | sea  |
            | ge    |         | ferry | sea  |
            | ef    | primary |       | land |

        When I route I should get
            | waypoints | route              | turns                                      | modes                         |
            | f,j       | land,sea,land,land | depart,notification right,turn left,arrive | driving,ferry,driving,driving |
