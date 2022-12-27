# share-a-tune

The idea is simply that you can load an ABC tune file from your file system, and the score will be displayed and you can play it.  If it exists in multiple parts you can choose to play either all the parts or merely an individual part.  If you then would like to share this tune with your friends, you press the __share tune__ button and the url for the tune is copied to the clipboard.  You can send this link to your friends and they need have absolutely no knowledge of the inner mechanics of ABC - they can see and hear the tune as you did.

You can also, if you wish, modify the MIDI instruments on which the tune is played.

## Warning

In order for the _share tune URL_ button to work, the application must be hosted on a secure browser - i.e. one using _HTTPS_.


## To Build

    npm run build

and then navigate in your browser to /dist.  The browser must support web-audio.