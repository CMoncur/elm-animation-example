module Card exposing ( render )

import Html exposing ( Html, div, i, h3, h4, p, span, text )
import Html.Attributes exposing ( class, src, style )

import InfluencerScore exposing ( influencerScoreSvg )
import Msg exposing ( Msg( .. ) )
import Model exposing ( Model )


--Influencer Card Supporting Functions
progressBar : Html Msg
progressBar =
  div
    [ class "progress-base" ]
    [ div
        [ class "progress-bar" ][]
    ]

influencerText : Html Msg
influencerText =
  div
    [ class "influencer-text" ]
    [ h3 [] [ text "NathanExplosion" ]
    , h4 [] [ text "3m followers" ]
    , i [ class "fa fa-instagram fa-fw" ] []
    ]

influencerMetadata : Html Msg
influencerMetadata =
  div
    [ class "influencer-metadata" ]
    [ div [ class "approval-status" ] []
    , div
        [ class "influencer-info" ]
        [ influencerText
        ]
    ]

influencerProgress : Html Msg
influencerProgress =
  div
    [ class "influencer-progress" ]
    [ p
        []
        [ span [] [ text "75%" ]
        , text " in-demo"
        ]
    , progressBar
    ]

influencerScore : Html Msg
influencerScore =
  div
    [ class "influencer-score" ]
    [ influencerScoreSvg
    , h4 [] [ text "99" ]
    ]

slogan : Html Msg
slogan =
  div
    [ class "campaign-slogan" ]
    [ h4 [] [ text "#superawesome" ]
    ]

portrait : Html Msg
portrait =
  div
    [ class "influencer-portrait" , style [ ( "background-image", "url(https://ipdashboarddev.s3.amazonaws.com/i_296ded64-f476-4072-9862-139ab07946c7_28113342.png) ") ] ]
    [ div [ class "influencer-portrait-info" ]
        [ influencerScore
        , slogan
        , influencerProgress
        ]
    ]


-- Main Influencer Card
render : Html Msg
render =
  div
    [ class "card-influencer" ]
    [ div
        []
        [ div
            [ class "front" ]
            [ portrait
            , influencerMetadata
            ]
        , div
            [ class "back" ]
            [ influencerMetadata ]
        ]
    ]
