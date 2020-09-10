{-# LANGUAGE DeriveGeneric #-}
module Lib where

import Data.Aeson
import GHC.Generics

import Aws.Lambda

data Person = Person
  { personName :: String
  , personAge  :: Int
  } deriving (Generic)

instance FromJSON Person
instance ToJSON Person

handler :: Person -> Context () -> IO (Either String Person)
handler person context =
  if personAge person > 0 then
    return (Right person)
  else
    return (Left "A person's age must be positive")
