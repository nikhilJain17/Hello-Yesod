module Handler.PostNew where

import Import
import Yesod.Form.Bootstrap3
import Text.Markdown (Markdown)
import Yesod.Text.Markdown

-- Custom data structure for a blog post
data BlogPost = BlogPost
	{
		title :: Text ,
		article :: Markdown -- support stuff in markdown
	}


blogPostForm :: AForm Handler BlogPost
blogPostForm = BlogPost 
			<$> areq textField (bfs ("Title" :: Text)) Nothing		 -- make a regular text field for the title
			<*> areq markdownField (bfs ("Article" :: Text)) Nothing -- make a markdown-supported text field

getPostNewR :: Handler Html
getPostNewR = do
	-- form is a widget u will embed
	(widget, enctype) <- generateFormPost $ renderBootstrap3 BootstrapBasicForm blogPostForm
	defaultLayout $ 
		$(widgetFile "posts/new") -- throw up some basic html in the file posts/new
