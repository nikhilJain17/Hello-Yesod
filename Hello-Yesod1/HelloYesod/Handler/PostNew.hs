module Handler.PostNew where

import Import

getPostNewR :: Handler Html
getPostNewR = do
	defaultLayout $ 
		$(widgetFile "posts/new") -- throw up some basic html in the file posts/new
