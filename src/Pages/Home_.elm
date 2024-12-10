module Pages.Home_ exposing (Model, Msg, page)

-- import Css
-- import Tailwind.Breakpoints as Breakpoints

import Css.Global
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attr
import Html.Styled.Events exposing (onClick)
import Page exposing (Page)
import Tailwind.Theme as Tw
import Tailwind.Utilities as Tw
import View exposing (View)


type alias Model =
    { accordionOpen : Bool }


type Msg
    = ToggleAccordion


initial : Model
initial =
    { accordionOpen = False }


update : Msg -> Model -> Model
update msg mdl =
    case msg of
        ToggleAccordion ->
            { mdl | accordionOpen = not mdl.accordionOpen }


page : Page Model Msg
page =
    Page.sandbox
        { init = initial
        , update = update
        , view = view
        }


view : Model -> View Msg
view { accordionOpen } =
    View "Showreel home"
        [ Html.main_ []
            [ Css.Global.global Tw.globalStyles
            , accordion
                { summary = Html.text "Click me"
                , details = Html.text "Wow, you really did it! Now just let me start some Lorem ipsum dolor sit amet consecutur…"
                }
                accordionOpen
            ]
        ]


accordion : { summary : Html Msg, details : Html Msg } -> Bool -> Html Msg
accordion { summary, details } isOpen =
    Html.div [ onClick ToggleAccordion ]
        [ Html.input [ Attr.type_ "checkbox", Attr.class "toggle", Attr.checked isOpen ] []
        , Html.label [] [ summary ]
        , Html.div [ Attr.class "details" ] [ details ]
        ]
