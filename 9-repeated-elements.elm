import Html exposing (text)
import List 
import List exposing (append)


pack : List a -> List (List a)
pack xs =
    -- your implementation goes here
    case xs of
        []      -> [[]]
        [x]     -> [[x]]
        hd::tl  -> myPack tl hd [hd] []

myPack : List a -> a -> List a -> List (List a) -> List (List a)
myPack xs prev accumulator rezult =
    case xs of 
        [] -> append
                rezult 
                [accumulator]
        hd :: tl ->
            if hd == prev then
                myPack tl hd (append accumulator [hd]) rezult
            else
                myPack tl hd [hd] (append rezult [accumulator])

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
        [ ( pack [1, 1, 1, 1, 2, 5, 5, 2, 1], [[1, 1, 1, 1], [2], [5, 5], [2], [1]] )
        , ( pack [2, 1, 1, 1], [[2], [1, 1, 1]] )
        , ( pack [2, 2, 2, 1, 1, 1], [[2, 2, 2], [1, 1, 1]] )
        , ( pack [1], [[1]] )
        , ( pack [], [[]])
        ]
        && List.all (\(result, expect) -> result == expect)
            [ ( pack [ "aa", "aa", "aa" ], [ ["aa", "aa", "aa"] ] )
            , ( pack [ "aab", "b", "b", "aa" ], [ ["aab"], ["b", "b"], ["aa"] ] )
            ]