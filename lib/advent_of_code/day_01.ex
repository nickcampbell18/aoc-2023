defmodule AdventOfCode.Day01 do
  require IEx

  def part1(args) do
    args
    |> Enum.map(fn line ->
      matches = Regex.scan(~r/\d/, line) |> Enum.flat_map(& &1)

      [List.first(matches), List.last(matches)] |> Enum.join() |> String.to_integer()
    end)
    |> Enum.sum()
  end

  @spec part2(any()) :: nil
  def part2(args) do
    args
    |> Enum.map(fn line ->
      matches =
        Regex.scan(
          ~r/(?=(\d|one|two|three|four|five|six|seven|eight|nine)).*(\d|one|two|three|four|five|six|seven|eight|nine)/,
          line
        )
        |> Enum.flat_map(& &1)

      valid_parts =
        Enum.map(matches, fn
          "1" -> 1
          "2" -> 2
          "3" -> 3
          "4" -> 4
          "5" -> 5
          "6" -> 6
          "7" -> 7
          "8" -> 8
          "9" -> 9
          "one" -> 1
          "two" -> 2
          "three" -> 3
          "four" -> 4
          "five" -> 5
          "six" -> 6
          "seven" -> 7
          "eight" -> 8
          "nine" -> 9
          _x -> nil
        end)
        |> Enum.filter(&(&1 != nil))

      IO.inspect(valid_parts)

      [List.first(valid_parts), List.last(valid_parts)] |> Enum.join() |> String.to_integer()
    end)
    |> Enum.sum()
  end
end
