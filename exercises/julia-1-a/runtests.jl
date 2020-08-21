using Test

include("tictactoe.jl")

let boards = [
    """
    XOO
    X  
    X  """,
    """
    OXO
     X 
     X """,
    """
    OOX
      X
      X"""
]
   

    @testset "Finished game where X won via column victory: \"$(escape_string(b))\"" for b in boards
        @test gamestate(b) == :win
    end
end

let boards = [
    """
    OXX
    OX 
    O  """,
    """
    XOX
     OX
     O """,
    """
    XXO
     XO
      O"""
]

    @testset "Finished game where O won via column victory: \"$(escape_string(b))\"" for b in boards
        @test gamestate(b) == :win
    end
end

let boards = [
    """
    XXX
    XOO
    O  """,
    """
    O O
    XXX
     O """,
    """
     OO
    O X
    XXX"""
]

    @testset "Finished game where X won via row victory: \"$(escape_string(b))\"" for b in boards
        @test gamestate(b) == :win
    end
end

let boards = [
    """
    OOO
    XXO
    XX """,
    """
    XX 
    OOO
    X  """,
    """
    XOX
     XX
    OOO"""
]

    @testset "Finished game where O won via row victory: \"$(escape_string(b))\"" for b in boards
        @test gamestate(b) == :win
    end
end

let boards = [
    """
    XOO
     X 
      X""",
    """
    O X
    OX 
    X  """
]

    @testset "Finished game where X won via diagonal victory: \"$(escape_string(b))\"" for b in boards
        @test gamestate(b) == :win
    end
end

let boards = [
    """
    OXX
    OOX
    X O""",
    """
      O
     OX
    OXX"""
]

    @testset "Finished game where O won via diagonal victory: \"$(escape_string(b))\"" for b in boards
        @test gamestate(b) == :win
    end
end

let boards = [
    """
    XOX
    XXO
    OXO""",
    """
    XXO
    OXX
    XOO"""
]

    @testset "Draw: \"$(escape_string(b))\"" for b in boards
        @test gamestate(b) == :draw
    end
end

# The first test is parsed strangely so it requires extra trailing spaces
let boards = [
    """
        
     X  
        """,
    """
    O  
     X 
       """,
    """
    X  
     XO
    OX """
]

    @testset "Ongoing game: \"$(escape_string(b))\"" for b in boards
        @test gamestate(b) == :ongoing
    end
end

let boards = [
    """
    XX 
       
       """,
    """
    OOX
       
       """,
    """
    XXX
    XOO
    XOO""",
    """
    XOX
    OXO
    XOX""",
    """
    XXX
    OOO
       """
]

    @testset "Invalid board: \"$(escape_string(b))\"" for b in boards
        @test_throws Exception gamestate(b)
    end
end
