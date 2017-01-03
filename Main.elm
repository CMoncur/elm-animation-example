module Main exposing ( main )

-- Core Dependencies
import Html exposing ( Html, div, input, p, program, text )
import Html.Attributes exposing ( class, placeholder )
import Html.Events exposing ( onInput )
import Task as Task
import Time as Time exposing ( Time, every, second )

-- Internal Dependencies
import Card as Card
import InfluencerScore exposing ( influencerScoreSvg )
import Model exposing ( Model )
import Msg exposing ( Msg( .. ) )


-- Supporting Functions
init : ( Model, Cmd Msg )
init =
  ( { active_item = 0
    , time        = 0
    }
  , Cmd.batch
      [ Time.now |> Task.perform NewTime
      ]
  )


subscriptions : Model -> Sub Msg
subscriptions _ =
  Sub.batch
    [ every ( second * 1.5 ) NewTime
    ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    NewTime new_time ->
      { model | time = new_time }
      ! [ Cmd.none ]

    UpdateActiveItem int ->
      { model | active_item = int }
      ! [ Cmd.none ]


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
    , text <| toString model.time
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
