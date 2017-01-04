module Model exposing ( Model )

import Time exposing ( Time )

type alias Model =
  { active_item : Int
  , rotation_1  : Int
  , rotation_2  : Int
  , rotation_3  : Int
  , rotation_4  : Int
  , rotation_5  : Int
  , rotation_6  : Int
  , time        : Time
  }
