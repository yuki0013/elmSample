import Browser
import Html exposing (Html, button, div, text, table, tbody, tr, td)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

main =
  Browser.sandbox { init = init, update = update, view = view }


-- MODEL

type alias Item = {itemName : String, crtQuantity : Int, reqQuantity : Int}
type alias Model = {itemList : List Item, item : Item}

init : Model
init = { itemList = [] , item = {itemName = "", crtQuantity = 0, reqQuantity = 0}}

-- UPDATE

type Msg = Increment | Decrement | Reset | Delete Int | SetValue Int
-- type Msg = Increment | Decrement | Reset
update : Msg -> Item -> Item
update msg model =
  case msg of
    Increment ->
      {model | crtQuantity = model.crtQuantity + 1}
    Decrement ->
      if model.crtQuantity <= 0 then { model | crtQuantity = 0 }
      else {model | crtQuantity = model.crtQuantity - 1}
    Reset ->
      {model | crtQuantity = 0}
    SetValue n ->
      {model | crtQuantity = n}
    Delete n -> 
      let t = model.itemList
      in {}

-- VIEW

view : Model -> Html Msg
view model = text("Hello World!")

view1 : Model -> Html Msg
view1 model =
  div [id "Main"] [ 
      div [] [
        table[][
          tbody[][
            tr[][
              td[style "width" "100px"][
                tr[][
                  text (model.itemName ++ ": ")
                ]
                , tr[] [text (String.fromInt model.crtQuantity ++ "/" ++ String.fromInt model.reqQuantity)]
              ]
              ,tr[][
                  button[ onClick Increment] [ text "∧" ]
              ]
              , tr[][
                button [ onClick Decrement ] [ text "∨" ]
              ]
              , td[style "rowspan" "2"] [
                  button [ onClick Reset ] [text "rest"]
              ]
            ]
          ]
        ]
      ]
    ]