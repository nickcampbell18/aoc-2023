defmodule AdventOfCode.Day01Test do
  use ExUnit.Case

  import AdventOfCode.Day01

  test "part1" do
    input = ~w(
      1abc2
      pqr3stu8vwx
      a1b2c3d4e5f
      treb7uchet
    )
    result = part1(input)

    assert result === 142
  end

  test "part2" do
    input = ~w(
      eighthree
    )
    result = part2(input)

    assert result === 83
  end
end
