import Html exposing (text)
import List
import Maybe


penultimate : List a -> Maybe a
penultimate xs =
    case xs of
        x::[] -> Nothing
        x::xs -> 
            if (List.length xs) == 1 then
                Just x
            else
                penultimate xs
        []    -> Nothing


main =
    text
        (if (test) then
            "Your implementation passed all tests."
         else
            "Your implementation failed at least one test."
        )


test : Bool
test =
    List.all (\(result, expect) -> result == expect)
        [ ( penultimate [1..4], Just 3 )
        , ( penultimate [ 1, 2 ], Just 1 )
        , ( penultimate [ 1 ], Nothing )
        , ( penultimate [], Nothing )
        ]
        && List.all (\(result, expect) -> result == expect)
            [ ( penultimate [ "a", "b", "c" ], Just "b" )
            , ( penultimate [ "a" ], Nothing )
            ]