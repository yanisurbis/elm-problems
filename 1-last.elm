import Html exposing (text)
import Maybe



import Html exposing (text)
import Maybe

-- my implementation
last : List a -> Maybe a
last xs = 
    case xs of
        x::[] -> Just x
        x::xs -> last xs
        []    -> Nothing 


-- another implementations
{--
last : List a -> Maybe a
last xs = 
  case list of
    [ ] -> Nothing
    [a] -> Just a
    y::ys -> last ys

last : List a -> Maybe a
last xs = 
   List.reverse xs |> List.head
--}

main =
    case last [ 1, 2, 3, 4 ] of
        Just a ->
            text (toString a)

        Nothing ->
            text "No element found"