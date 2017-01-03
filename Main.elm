module Main exposing ( main )

-- Core Dependencies
import Html exposing ( Html, div, input, p, program, text )
import Html.Attributes exposing ( class, placeholder )
import Html.Events exposing ( onInput )

-- Internal Dependencies
import Card as Card
import InfluencerScore exposing ( influencerScoreSvg )
import Model exposing ( Model )
import Msg exposing ( Msg( .. ) )


-- Supporting Functions
init : ( Model, Cmd Msg )
init =
  ( { active_item = 0
    }
  , Cmd.none
  )


subscriptions : Model -> Sub Msg
subscriptions _ =
  Sub.none


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    UpdateActiveItem int ->
      { model | active_item = int }
      ![ Cmd.none ]


view : Model -> Html Msg
view model =
  div
    [ class "card-influencer-cont" ]
    [ Card.render
    , Card.render
    , Card.render
    , Card.render
    , Card.render
    , Card.render
    ]


-- Elm Animation Main
main : Program Never Model Msg
main =
  program
    { init          = init
    , subscriptions = subscriptions
    , update        = update
    , view          = view
    }
