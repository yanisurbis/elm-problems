import Html exposing (text)
import List 


myReverse : List a -> List a
myReverse xs =
    case xs of
        [] -> []
        hd::tl -> List.append (myReverse tl) [hd]            


main =
    text
        (if (test) then
            "Your implementation passed all tests."
         else
            "Your implementation failed at least one test."
        )


test : Bool
test =
    List.all ((==) True)
        [ ( myReverse [1..4] == [4, 3, 2, 1] )
        , ( myReverse [2, 1] == [1, 2] )
        , ( myReverse [1] == [1] )
        , ( myReverse [] == [] )
        ]
        && List.all ((==) True)
            [ myReverse [ 'a', 'b', 'c' ] == [ 'c', 'b', 'a' ]
            ]