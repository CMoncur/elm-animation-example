module Util exposing ( .. )

-- Core Dependencies
import Random as Random exposing ( Generator )
import Task as Task

-- Internal Dependencies
import Msg exposing ( Msg( .. ) )


-- Utility Functions
generateBool : Cmd Msg
generateBool =
  Random.generate IsFlipped
    <| Random.pair ( Random.int 1 6 ) ( Random.int 1 6 )


updateRotation : Bool -> Int -> Int
updateRotation bool rotation =
  if ( rotation > 50000 )
    then rotation
  else if bool
    then ( rotation + 180 )
  else rotation
