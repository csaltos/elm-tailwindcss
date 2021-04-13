module Main exposing (..)

import Browser
import Html exposing (a, button, div, h1, text)
import Html.Attributes exposing (class, href)
import Html.Events exposing (onClick)


main : Program () Model Msg
main =
    Browser.sandbox { init = init, view = view, update = update }


type alias Model =
    Int


type Msg
    = Increment
    | Decrement



-- INIT


init : Model
init =
    0



-- UPDATE


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1



-- VIEW


view : Model -> Html.Html Msg
view model =
    div [ class "grid m-4" ]
        [ h1 [ class "flex justify-center font-bold text-4xl text-yellow-500" ] [ text "Elm and Tailwind CSS" ]
        , div [ class "flex justify-center" ] [ viewCounter model ]
        , div [ class "flex justify-center" ] [ a [ href "https://github.com/csaltos/elm-tailwindcss" ] [ text "github.com/csaltos/elm-tailwindcss" ] ]
        ]


viewCounter : Model -> Html.Html Msg
viewCounter model =
    div
        [ class "flex p-4" ]
        [ button [ class "btn m-4", onClick Decrement ] [ text "-" ]
        , div [ class "m-4 font-bold text-xl text-gray-600" ] [ text (String.fromInt model) ]
        , button [ class "btn m-4", onClick Increment ] [ text "+" ]
        ]
