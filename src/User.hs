{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DeriveGeneric #-}

-- module User exports this
module User (app) where

import Network.Wai (Application)
import Servant
import Data.Aeson
import GHC.Generics
import Servant.API (JSON
                   , Get
                   , (:>)
                   )

-- Sample data structure
data User = User { name     :: String
                 , email    :: String
                 , username :: String
                 , age      :: Int
                 } deriving Generic

-- Possible because derives Generic
instance ToJSON User

-- Define API for data TYPE
type UserAPI = "user" :> Get '[JSON] User

-- Define data INSTANCE
user :: User
user = User "Justu" "alegro@gmail.com" "kasama" 10

-- Serve something (high level)
server :: Server UserAPI
server = return user

-- Like creating an instance or "proxy" of my "API / endpoints type"
userApi :: Proxy UserAPI
userApi = Proxy

-- The served application
app :: Application
app = serve userApi server
