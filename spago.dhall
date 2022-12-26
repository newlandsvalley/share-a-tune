{-
Welcome to a Spago project!
You can edit this file as you like.

Need help? See the following resources:
- Spago documentation: https://github.com/purescript/spago
- Dhall language tour: https://docs.dhall-lang.org/tutorials/Language-Tour.html

When creating a new Spago project, you can use
`spago init --no-comments` or `spago init -C`
to generate this file without the comments in this block.
-}
{ name = "share-a-tune"
, dependencies =
  [ "abc-parser"
  , "abc-scores"
  , "abc2psom"
  , "aff"
  , "arrays"
  , "console"
  , "dom-indexed"
  , "effect"
  , "either"
  , "ensemble-scores"
  , "enums"
  , "foldable-traversable"
  , "foreign-object"
  , "halogen"
  , "halogen-components"
  , "js-uri"
  , "lists"
  , "maybe"
  , "media-types"
  , "midi"
  , "newtype"
  , "nullable"
  , "ordered-collections"
  , "partial"
  , "prelude"
  , "school-of-music"
  , "soundfonts"
  , "string-parsers"
  , "strings"
  , "tuples"
  , "web-html"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
