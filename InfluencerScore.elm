module InfluencerScore exposing ( influencerScoreSvg )

import Html exposing ( Html )
import Svg exposing ( .. )
import Svg.Attributes exposing ( .. )

import Msg exposing ( Msg( .. ) )

ellipses : Html Msg
ellipses =
  g
    []
    [ ellipse
        [ fill "none"
        , stroke "#FFFFFF"
        , strokeWidth "1.2"
        , opacity "0.275827892"
        , cx "7.61446969"
        , cy "7.46518167"
        , rx "7.61446969"
        , ry "7.46518167"
        ] []
    , ellipse
        [ fill "none"
        , stroke "#FFFFFF"
        , strokeWidth "1.2"
        , opacity "0.704815765"
        , cx "7.61446969"
        , cy "7.46518167"
        , rx "5.43890692"
        , ry "5.33227262"
        ] []
    , ellipse
        [ fill "none"
        , stroke "#FFFFFF"
        , strokeWidth "1.2"
        , cx "7.61446969"
        , cy "7.46518167"
        , rx "3.26334415"
        , ry "3.19936357"
        ] []
    ]

influencerScoreSvg : Html Msg
influencerScoreSvg =
  svg
    [ class "influencer-score-svg"
    , width "17px"
    , height "17px"
    , viewBox "-1 -1 17 17"
    , version "1.1" ]
    [ ellipses ]
