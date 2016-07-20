import Html exposing (text)
import List exposing (length, head, tail)
import List
import Maybe


elementAt : List a -> Int -> Maybe a
elementAt xs n =
    if n <= 0 then 
        Nothing
    else if n == 1 then 
        if length xs <= 0 then 
            Nothing
        else
            head xs
    else
        case tail xs of
            Just elms -> elementAt elms (n - 1)
            Nothing   -> Nothing


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
        [ ( elementAt [1..4] 2, Just 2 )
        , ( elementAt [ 1 ] 2, Nothing )
        , ( elementAt [] 2, Nothing )
        , ( elementAt [] (-1), Nothing )
        ]
        && List.all (\(result, expect) -> result == expect)
            [ ( elementAt [ 'a', 'b', 'c' ] 2, Just 'b' )
            ]