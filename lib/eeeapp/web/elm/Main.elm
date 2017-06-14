module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


type alias Model =
    { gamesList : List Game
    , displayGamesList : Bool
    }


type alias Game =
    { gameTitle : String
    , gameDescription : String
    }


initialModel : Model
initialModel =
    { gamesList =
        [ { gameTitle = "Adventure Game", gameDescription = "Adventure game example." }
        , { gameTitle = "Driving Game", gameDescription = "Driving game example." }
        , { gameTitle = "Platform Game", gameDescription = "Platform game example." }
        ]
    , displayGamesList = False
    }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ button [ class "btn btn-success", onClick DisplayGamesList ] [ text "Display Games List" ]
        , button [ class "btn btn-danger", onClick HideGamesList ] [ text "Hide Games List" ]
        , if model.displayGamesList then
            gamesIndex model
          else
            div [] []
        ]


gamesIndex : Model -> Html msg
gamesIndex model =
    div [ class "games-index" ] [ gamesList model.gamesList ]


gamesList : List Game -> Html msg
gamesList listOfGames =
    ul [ class "games-list" ] (List.map gamesListItem listOfGames)


gamesListItem : Game -> Html msg
gamesListItem game =
    li []
        [ strong [] [ text (game.gameTitle ++ ": ") ]
        , span [] [ text game.gameDescription ]
        ]



-- UPDATE


type Msg
    = DisplayGamesList
    | HideGamesList


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        DisplayGamesList ->
            ( { model | displayGamesList = True }, Cmd.none )

        HideGamesList ->
            ( { model | displayGamesList = False }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
