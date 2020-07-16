using Test

include("tictactoe.jl")

@testset "Finished games where X won via colum victory" begin
    boards = [
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

    for b in boards
        @test gamestate(b) == :win
    end
end

@testset "Finished games where O won via colum victory" begin
    boards = [
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

    for b in boards
        @test gamestate(b) == :win
    end
end

@testset "Finished games where X won via row victory" begin
    boards = [
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

    for b in boards
        @test gamestate(b) == :win
    end
end

@testset "Finished games where O won via row victory" begin
    boards = [
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

    for b in boards
        @test gamestate(b) == :win
    end
end

@testset "Finished games where X won via diagonal victory" begin
    boards = [
        """
        XOO
         X 
          X""",
        """
        O X
        OX 
        X  """
    ]

    for b in boards
        @test gamestate(b) == :win
    end
end

@testset "Finished games where O won via diagonal victory" begin
    boards = [
        """
        OXX
        OOX
        X O""",
        """
          O
         OX
        OXX"""
    ]

    for b in boards
        @test gamestate(b) == :win
    end
end

@testset "Draws" begin
    boards = [
        """
        XOX
        XXO
        OXO""",
        """
        XXO
        OXX
        XOO"""
    ]

    for b in boards
        @test gamestate(b) == :draw
    end
end

@testset "Ongoing games" begin
    # The first test is parsed strangely so it requires extra trailing spaces
    boards = [
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

    for b in boards
        @test gamestate(b) == :ongoing
    end
end

@testset "Invalid boards" begin
    boards = [
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

    for b in boards
        @test_throws Exception gamestate(b)
    end
end
