defmodule AdventOfCode.Day02 do
  alias IEx.Pry

  def part1(args) do
    String.split(args, "\n", trim: true)
    |> Enum.map(fn line ->
      ["Game", id, rest] = line |> String.trim() |> String.split(~r/\s|:\s?/, parts: 3)

      violations =
        rest
        |> String.split("; ", trim: true)
        |> Enum.flat_map(fn game ->
          game
          |> String.split(~r/\,|\s/, trim: true)
          |> Enum.chunk_every(2)
          |> Enum.map(fn [count, color] -> [String.to_integer(count), color] end)
        end)
        |> Enum.map(fn
          [n, "blue"] when n in 1..14 -> 0
          [n, "green"] when n in 1..13 -> 0
          [n, "red"] when n in 1..12 -> 0
          _ -> 1
        end)
        |> Enum.sum()

      if violations > 0 do
        0
      else
        String.to_integer(id)
      end
    end)
    |> Enum.sum()
  end

  def part2(args) do
    String.split(args, "\n", trim: true)
    |> Enum.map(fn line ->
      ["Game", id, rest] = line |> String.trim() |> String.split(~r/\s|:\s?/, parts: 3)

      things =
        rest
        |> String.split("; ", trim: true)
        |> Enum.flat_map(fn game ->
          game
          |> String.split(~r/\,|\s/, trim: true)
          |> Enum.chunk_every(2)
          |> Enum.map(fn [count, color] -> [String.to_integer(count), color] end)
        end)

      red_counts = things |> Enum.filter(&(Enum.at(&1, 1) === "red")) |> Enum.map(&Enum.at(&1, 0))

      blue_counts =
        things |> Enum.filter(&(Enum.at(&1, 1) === "blue")) |> Enum.map(&Enum.at(&1, 0))

      green_counts =
        things |> Enum.filter(&(Enum.at(&1, 1) === "green")) |> Enum.map(&Enum.at(&1, 0))

      Enum.max(red_counts) * Enum.max(blue_counts) * Enum.max(green_counts)
    end)
    |> Enum.sum()
  end
end
