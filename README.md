# share-a-tune

The idea is simply that you can load an ABC tune from your file system, see the score and play it.  If it exists in multiple parts you can choose to play either all the parts or merely an individual part.  If you then would like to share it with your friends, you press the __share tune__ button and the url for the tune is copied to the clipboard.  You can send them the link and they need have absolutely no knowledge of the inner mechanics of ABC - they can see and hear the tune as you did.

You can also, if you wish, modify the MIDI instruments on which the tune is played.

As an example, here's [Bas-Pelles Eriks Brudpolska](https://tunebank.org.uk:8605/?abc=BoLgBAjAsAUAKuAQgQwM4FoAKBTANr7VMAUQCcBLAayMVIFcATABwHtdVLlYBlcAEVLI6TAHZcYAJXCt2nWAFlwAZgD0AFlgBFcBHUBeCBACssADI6VEAGywA0uACC85ACsWpWADVwAJlgAfRx8AYx8wUMRgsAZgxAcwfzAAMzUwAG8kgF9sJIBzJLBsVMSHHzTgzIYwmLjo2PjEyIZsOtqAcQAxYj4EgLAAYSUoiKiahuTUjOy8gqKEsFLYhc7iMC6%2BfoSIMEQAGn6%2BVb4fboHUkH8wvYOjk57Bgd6YQJIHYPjsN-jiL-niNsQbUKAKB-0B8wcuz4HR6DmhsKhMIh%2B2Imwc-VRCxRm38fUh8KxBI6nTCJWxWIxm2IXVJA2uPW61IWJ1p9NupweFy8OgCQVC4R8kVa4xS6SyOXyhWKzPKlWq9WF8zaDiFcU6JA2eyeZKGAqFY3moqmEtm0uwPmQuWS2Biiv822VqpCiAW50uYEdUUQzoWSgavIWwWwUWQQaib2DSsQ2BduWjLoBMfm0IcHWiHVTYBTacSGIcq2CP1WedWuOeWYzaezCzitJLAyLNdK8zSiEyDkd4SahR8zcSnp2PocSjAXOesCAA). 


## To Build

    npm run build

and then navigate in your browser to /dist.  The browser must support web-audio.