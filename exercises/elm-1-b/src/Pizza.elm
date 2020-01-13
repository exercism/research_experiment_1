module Pizza exposing (Pizza, retrieveMenu)


type alias Pizza =
    { name : String
    , vegetarian : Bool
    , price : Int
    }


retrieveMenu : String -> List Pizza
retrieveMenu stringMenu =
    Debug.todo "retrieveMenu"
