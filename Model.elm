module Model exposing ( Model )

import Time exposing ( Time )

type alias Model =
  { active_item : Int
  , time        : Time
  }
