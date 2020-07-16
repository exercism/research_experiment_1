function gamestate(bs)
    # Parse to Matrix
    b = hcat(split.(split(bs, "\n"), "")...)

    # Invalid boards
    nₒ = count(x -> x == "O", b)
    nₓ = count(x -> x == "X", b)
    # Not taking turns in order 
    if nₒ > nₓ || abs(nₒ - nₓ) > 1
        throw(DomainError(b, "Invalid board: did not take turns in order"))
    end

    wins = 0

    for i in 1:3
        # Row victory
        wins += b[i, 1] != " " && (b[i, 1] == b[i, 2] == b[i, 3]) ? 1 : 0
        
        # Col victory
        wins += b[1, i] != " " && (b[1, i] == b[2, i] == b[3, i]) ? 1 : 0
    end

    # Diagonal victories
    wins += b[1, 1] != " " && (b[1, 1] == b[2, 2] == b[3, 3]) ? 1 : 0
    wins += b[1, 3] != " " && (b[1, 3] == b[2, 2] == b[3, 1]) ? 1 : 0

    if wins == 1
        return :win
    elseif wins > 1
        throw(DomainError(b, "Invalid board: more than one win"))
    end

    # Draw
    " " ∉ b && return :draw

    :ongoing
end
