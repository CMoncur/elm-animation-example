module Main exposing ( main )

-- Core Dependencies
import Html exposing ( Html, div, input, p, program, text )
import Html.Attributes exposing ( class, placeholder )
import Html.Events exposing ( onInput )
import String as String
import Task as Task
import Time as Time exposing ( Time, every, second )

-- Internal Dependencies
import Card as Card
import InfluencerScore exposing ( influencerScoreSvg )
import Model exposing ( Model )
import Msg exposing ( Msg( .. ) )
import Util exposing ( .. )


-- Supporting Functions
init : ( Model, Cmd Msg )
init =
  ( { active_item  = 0
    , rotation_1   = 0
    , rotation_2   = 0
    , rotation_3   = 0
    , rotation_4   = 0
    , rotation_5   = 0
    , rotation_6   = 0
    , time         = 0
    }
  , Cmd.batch
      [ Time.now |> Task.perform NewTime
      ]
  )


subscriptions : Model -> Sub Msg
subscriptions _ =
  Sub.batch
    [ every ( second * 0.75 ) NewTime
    ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    NewTime new_time ->
      { model | time = new_time }
      ! [ Util.generateBool ]

    IsFlipped ( first_int, second_int ) ->
      case ( first_int, second_int ) of
        ( 1, 1 ) ->
          { model |
              rotation_1 = Util.updateRotation False model.rotation_1
          }
          ! [ Cmd.none ]

        ( 1, 2 ) ->
          { model |
              rotation_1 = Util.updateRotation False model.rotation_1,
              rotation_2 = Util.updateRotation False model.rotation_2
          }
          ! [ Cmd.none ]

        ( 1, 3 ) ->
          { model |
              rotation_1 = Util.updateRotation False model.rotation_1,
              rotation_3 = Util.updateRotation False model.rotation_3
          }
          ! [ Cmd.none ]

        ( 1, 4 ) ->
          { model |
              rotation_1 = Util.updateRotation False model.rotation_1,
              rotation_4 = Util.updateRotation False model.rotation_4
          }
          ! [ Cmd.none ]

        ( 1, 5 ) ->
          { model |
              rotation_1 = Util.updateRotation False model.rotation_1,
              rotation_5 = Util.updateRotation False model.rotation_5
          }
          ! [ Cmd.none ]

        ( 1, 6 ) ->
          { model |
              rotation_1 = Util.updateRotation False model.rotation_1,
              rotation_6 = Util.updateRotation False model.rotation_6
          }
          ! [ Cmd.none ]

        ( 3, 1 ) ->
          { model |
              rotation_1 = Util.updateRotation False model.rotation_1,
              rotation_3 = Util.updateRotation False model.rotation_3
          }
          ! [ Cmd.none ]

        ( 3, 2 ) ->
          { model |
              rotation_2 = Util.updateRotation False model.rotation_2,
              rotation_3 = Util.updateRotation False model.rotation_3
          }
          ! [ Cmd.none ]

        ( 3, 3 ) ->
          { model |
              rotation_3 = Util.updateRotation False model.rotation_3
          }
          ! [ Cmd.none ]

        ( 3, 4 ) ->
          { model |
              rotation_3 = Util.updateRotation False model.rotation_3,
              rotation_4 = Util.updateRotation False model.rotation_4
          }
          ! [ Cmd.none ]

        ( 3, 5 ) ->
          { model |
              rotation_3 = Util.updateRotation False model.rotation_3,
              rotation_5 = Util.updateRotation False model.rotation_5
          }
          ! [ Cmd.none ]

        ( 3, 6 ) ->
          { model |
              rotation_3 = Util.updateRotation False model.rotation_3,
              rotation_6 = Util.updateRotation False model.rotation_6
          }
          ! [ Cmd.none ]

        ( 5, 1 ) ->
          { model |
              rotation_1 = Util.updateRotation False model.rotation_1,
              rotation_5 = Util.updateRotation False model.rotation_5
          }
          ! [ Cmd.none ]

        ( 5, 2 ) ->
          { model |
              rotation_2 = Util.updateRotation False model.rotation_2,
              rotation_5 = Util.updateRotation False model.rotation_5
          }
          ! [ Cmd.none ]

        ( 5, 3 ) ->
          { model |
              rotation_3 = Util.updateRotation False model.rotation_3,
              rotation_5 = Util.updateRotation False model.rotation_5
          }
          ! [ Cmd.none ]

        ( 5, 4 ) ->
          { model |
              rotation_4 = Util.updateRotation False model.rotation_4,
              rotation_5 = Util.updateRotation False model.rotation_5
          }
          ! [ Cmd.none ]

        ( 5, 5 ) ->
          { model |
              rotation_5 = Util.updateRotation False model.rotation_5
          }
          ! [ Cmd.none ]

        ( 5, 6 ) ->
          { model |
              rotation_5 = Util.updateRotation False model.rotation_5,
              rotation_6 = Util.updateRotation False model.rotation_6
          }
          ! [ Cmd.none ]

        ( _, _ ) -> ( model, Cmd.none )

    UpdateActiveItem int ->
      { model | active_item = int }
      ! [ Cmd.none ]


view : Model -> Html Msg
view model =
  div
    [ class "card-influencer-cont" ]
    [ Card.render model.rotation_1
    , Card.render model.rotation_2
    , Card.render model.rotation_3
    , Card.render model.rotation_4
    , Card.render model.rotation_5
    , Card.render model.rotation_6
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
