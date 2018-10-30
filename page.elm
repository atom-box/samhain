module Main exposing (main)

import Browser exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



{-
   https://css-tricks.com/introduction-elm-architecture-build-first-application/
-}


main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }



-- MODEL -------------------------


type alias Model =
    { entries : List String
    , results : List String
    , filter : String
    }



{-
   x =
       """
       RESOLVED by the Senate and House of Representatives of the United States of America, in Congress assembled, two thirds of both Houses concurring, that the following Articles be proposed to the Legislatures of the several States, as amendments to the Constitution of the United States, all, or any of which Articles, when ratified by three fourths of the said Legislatures, to be valid to all intents and purposes, as part of the said Constitution; viz.

   ARTICLES in addition to, and Amendment of the Constitution of the United States of America, proposed by Congress, and ratified by the Legislatures of the several States, pursuant to the fifth Article of the original Constitution.

   Article the first... After the first enumeration required by the first article of the Constitution, there shall be one Representative for every thirty thousand, until the number shall amount to one hundred, after which the proportion shall be so regulated by Congress, that there shall be not less than one hundred Representatives, nor less than one Representative for every forty thousand persons, until the number of Representatives shall amount to two hundred; after which the proportion shall be so regulated by Congress, that there shall not be less than two hundred Representatives, nor more than one Representative for every fifty thousand persons.
   """


   y =
       """
   Article the second... No law, varying the compensation for the services of the Senators and Representatives, shall take effect, until an election of Representatives shall have intervened.

   Article the third... Congress shall make no law respecting an establishment of religion, or prohibiting the free exercise thereof; or abridging the freedom of speech, or of the press; or the right of the people peaceably to assemble, and to petition the Government for a redress of grievances.

   Article the fourth... A well regulated Militia, being necessary to the security of a free State, the right of the people to keep and bear Arms, shall not be infringed.

   Article the fifth... No Soldier shall, in time of peace be quartered in any house, without the consent of the Owner, nor in time of war, but in a manner to be prescribed by law.

   Article the sixth... The right of the people to be secure in their persons, houses, papers, and effects, against unreasonable searches and seizures, shall not be violated, and no Warrants shall issue, but upon probable cause, supported by Oath or affirmation, and particularly describing the place to be searched, and the persons or things to be seized.

   Article the seventh... No person shall be held to answer for a capital, or otherwise infamous crime, unless on a presentment or indictment of a Grand Jury, except in cases arising in the land or naval forces, or in the Militia, when in actual service in time of War or public danger; nor shall any person be subject for the same offence to be twice put in jeopardy of life or limb; nor shall be compelled in any criminal case to be a witness against himself, nor be deprived of life, liberty, or property, without due process of law; nor shall private property be taken for public use, without just compensation.

   Article the eighth... In all criminal prosecutions, the accused shall enjoy the right to a speedy and public trial, by an impartial jury of the State and district wherein the crime shall have been committed, which district shall have been previously ascertained by law, and to be informed of the nature and cause of the accusation; to be confronted with the witnesses against him; to have compulsory process for obtaining witnesses in his favor, and to have the Assistance of Counsel for his defence.

   Article the ninth... In suits at common law, where the value in controversy shall exceed twenty dollars, the right of trial by jury shall be preserved, and no fact tried by a jury, shall be otherwise re-examined in any Court of the United States, than according to the rules of the common law.

   Article the tenth... Excessive bail shall not be required, nor excessive fines imposed, nor cruel and unusual punishments inflicted.

   Article the eleventh... The enumeration in the Constitution, of certain rights, shall not be construed to deny or disparage others retained by the people.

   Article the twelfth... The powers not delegated to the United States by the Constitution, nor prohibited by it to the States, are reserved to the States respectively, or to the people.
       """
-}


init : Model
init =
    Model [] [] "fred"



-- UPDATE -----------------------------


type Msg
    = Add
    | Filter String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Filter filter ->
            { model
                | results = List.filter (String.contains filter) model.entries
                , filter = filter
            }

        Add ->
            { model
                | entries = model.filter :: model.entries
                , results = model.filter :: model.results
            }



-- VIEW -------------------------------


view : Model -> Html Msg
view model =
    div []
        [ input [ placeholder "Filter…", onInput Filter ] []
        , button [ onClick Add ] [ text "Add New" ]
        , ul [] (List.map viewEntry model.results)
        ]


viewEntry : String -> Html Msg
viewEntry entry =
    li [] [ text entry ]
