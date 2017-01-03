module Msg exposing ( Msg( .. ) )

import Time exposing ( Time )

type Msg
  = NewTime Time
  | UpdateActiveItem Int
