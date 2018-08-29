{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DeriveGeneric #-}

module User (app) where

import Servant.API ( JSON
                   , Get
                   , (:>)
                   )
import Servant ( Server
               , Proxy (Proxy)
               , serve
               )
import GHC.Generics (Generic)
import Data.Aeson (ToJSON)
import Network.Wai (Application)

data User = User { name     :: String
                 , age      :: Int
                 , username :: String
                 , email    :: String
                 } deriving Generic

instance ToJSON User

type UserAPI = "user" :> Get '[JSON] User

user :: User
user = User "Nerso" 2 "dnery" "dznery@gmail.com"

server :: Server UserAPI
server = return user

userApi :: Proxy UserAPI
userApi = Proxy

app :: Application
app = serve userApi server

