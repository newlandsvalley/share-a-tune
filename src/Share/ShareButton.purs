module Share.ShareButton where

import Prelude
import Data.Abc (AbcTune)
import Data.Abc.Canonical (fromTune)
import Data.Either (Either(..))
import Data.Enum (fromEnum)
import Data.Foldable (traverse_)
import Data.Maybe (Maybe(..), isJust, maybe)
import Data.String (takeWhile)
import Effect (Effect)
import Effect.Aff (Aff, Milliseconds(..), delay, makeAff)
import Effect.Uncurried (EffectFn3, runEffectFn3)
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP 
import Share.QueryString (compressToEncodedURIComponent)
import Web.HTML (window)
import Web.HTML.Location (href)
import Web.HTML.Window (location)

-- | this implementation of a 'copy URL' button based on the one found in tryPurescript.

type Slot = H.Slot Query {}

type SucceedCb = Effect Unit
type FailCb = Effect Unit
foreign import copyToClipboard :: EffectFn3 String SucceedCb FailCb Unit

-- the input is the ABC string to be encoded and added as a query parameter
type Input = Maybe AbcTune

type ShareButtonState =
  { mTune :: Maybe AbcTune
  , forkId :: Maybe H.ForkId
  , showCopySucceeded :: Maybe Boolean
  }

data Query a =
  SetTune (Maybe AbcTune) a

shareButton :: forall o. H.Component Query (Maybe AbcTune) o Aff
shareButton =  H.mkComponent
  { initialState
  , eval: H.mkEval $ H.defaultEval
      { handleAction = handleAction
      , handleQuery = handleQuery
      }
  , render
  }
  where 

  initialState :: Input -> ShareButtonState
  initialState mTune = 
    { mTune
    , forkId: Nothing
    , showCopySucceeded: Nothing 
    }

  handleAction :: Unit -> H.HalogenM ShareButtonState Unit () o Aff Unit
  handleAction _ = do
    H.gets _.forkId >>= traverse_ H.kill
    mTune <- H.gets _.mTune
    let 
       abc = maybe "" fromTune mTune
    url <- H.liftEffect $ window >>= location >>= href
    copySucceeded <- H.liftAff $ makeAff \f -> do
      runEffectFn3 copyToClipboard (urlToPath url <> buildQueryString abc) (f (Right true)) (f (Right false))
      mempty
    forkId <- H.fork do
      H.liftAff $ delay (1_500.0 # Milliseconds) 
      H.modify_ _ { showCopySucceeded = Nothing }
    H.put { mTune, showCopySucceeded: Just copySucceeded, forkId: Just forkId }

  handleQuery :: ∀ a act. Query a -> H.HalogenM ShareButtonState act () o Aff (Maybe a)
  handleQuery = case _ of     
    SetTune mTune next -> do  
      _ <- H.modify (\st -> st { mTune = mTune })
      pure (Just next)

  render :: ShareButtonState -> H.ComponentHTML Unit () Aff
  render { mTune, showCopySucceeded } = do
    let
      message = case showCopySucceeded of
        Just true -> "️✅ copied to clipboard" 
        Just false -> "️❌ failed to copy" 
        Nothing -> "share tune URL"       
      enabled = isJust mTune
      className =
          maybe ("unhoverable") (const "hoverable") mTune
    HH.button
      [ HP.class_ $ HH.ClassName className
      , HE.onClick \_ -> unit
      , HP.enabled enabled        
      ]
      [ HH.text message ]
      

-- return the entire url up to but not including the query parameters
urlToPath :: String -> String
urlToPath url = 
  takeWhile (\c -> fromEnum c /= 0xBF) url 

buildQueryString :: String -> String 
buildQueryString abc = 
  "?abc=" <> compressToEncodedURIComponent abc

