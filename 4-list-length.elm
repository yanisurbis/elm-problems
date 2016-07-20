import Html exposing (text)
import List 


countElements : List a -> Int
countElements xs =
    case xs of
        []     -> 0
        x::xss -> 1 + countElements xss


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
        [ ( countElements [1..4000], 4000 )
        , ( countElements [ 1 ], 1 )
        , ( countElements [], 0 )
        ]
        && List.all (\(result, expect) -> result == expect)
            [ ( countElements [ 'a', 'b', 'c' ], 3 )
            ]