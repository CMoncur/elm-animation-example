module Msg exposing ( Msg( .. ) )

import Time exposing ( Time )

type Msg
  = NewTime Time
  | IsFlipped ( Int, Int )
  | UpdateActiveItem Int
