using LinearAlgebra

function gamestate(bs)
    # Parse to Int Matrix
    b_str = hcat(split.(split(bs, "\n"), "")...)
    replace!(b_str, "X" => "1")
    replace!(b_str, " " => "0")
    replace!(b_str, "O" => "-1")
    b = parse.(Int, b_str)

    # It's a win if any of the rows, columns, or diagonals add up to ±3
    wins = count(sum(row) in (-3, 3) for row in eachrow(b)) + count(sum(col) in (-3, 3) for col in eachcol(b)) + (sum(diag(b)) in (-3, 3) ? 1 : 0) + (sum(diag(rotr90(b))) in (-3, 3) ? 1 : 0)
    if wins == 1
        :win
    elseif wins > 1
        error("Too many wins!")
    elseif sum(b) == 1 && !any(x == 0 for x in b)
        :draw
    elseif sum(b) ∉ (0, 1)
        error("Must take turns in order")
    else
        :ongoing
    end
end
