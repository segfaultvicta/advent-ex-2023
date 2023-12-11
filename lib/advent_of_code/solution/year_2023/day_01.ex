defmodule AdventOfCode.Solution.Year2023.Day01 do
  def part1(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      just_digits = line |> String.replace(~r/[^\d]/, "") |> String.graphemes()
      {res, _} = (Enum.at(just_digits, 0) <> Enum.at(just_digits, -1)) |> Integer.parse()
      res
    end)
    |> Enum.sum()
  end

  def part2(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      {res, _} = (findFirstDigit(line) <> findLastDigit(line)) |> Integer.parse()
      res
    end)
    |> Enum.sum()
  end

  def findFirstDigit(line) do
    # we know that EVENTUALLY we will find a first digit
    test_integer = Integer.parse(line)

    ret =
      if test_integer != :error do
        String.at(line, 0)
      else
        cond do
          String.starts_with?(line, "one") ->
            "1"

          String.starts_with?(line, "two") ->
            "2"

          String.starts_with?(line, "three") ->
            "3"

          String.starts_with?(line, "four") ->
            "4"

          String.starts_with?(line, "five") ->
            "5"

          String.starts_with?(line, "six") ->
            "6"

          String.starts_with?(line, "seven") ->
            "7"

          String.starts_with?(line, "eight") ->
            "8"

          String.starts_with?(line, "nine") ->
            "9"

          true ->
            findFirstDigit(String.slice(line, 1..String.length(line)))
        end
      end

    ret
  end

  def findLastDigit(line) do
    # we know that EVENTUALLY we will find a first digit
    test_integer = Integer.parse(String.reverse(line))

    ret =
      if test_integer != :error do
        String.at(line, String.length(line) - 1)
      else
        cond do
          String.ends_with?(line, "one") ->
            "1"

          String.ends_with?(line, "two") ->
            "2"

          String.ends_with?(line, "three") ->
            "3"

          String.ends_with?(line, "four") ->
            "4"

          String.ends_with?(line, "five") ->
            "5"

          String.ends_with?(line, "six") ->
            "6"

          String.ends_with?(line, "seven") ->
            "7"

          String.ends_with?(line, "eight") ->
            "8"

          String.ends_with?(line, "nine") ->
            "9"

          true ->
            findLastDigit(String.slice(line, 0..(String.length(line) - 2)))
        end
      end

    ret
  end
end
