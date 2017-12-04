defmodule Puzzle do
  @input File.read!("input/day_4.txt")
  @line_sep "\n"
  @word_sep " "

  def solve() do
    @input
    |> parse
    |> Enum.map(valid_passphrase/1))
    |> Enum.filter(fn(x) -> x end)
    |> length
    |> IO.inspect
  end

  def valid_passphrase(phrase) do
    uniq_phrase = phrase
    |> Enum.map(&az_order(&1))
    |> Enum.uniq

    length(uniq_phrase) == length(phrase)
  end

  defp az_order(word) do
      word
      |> String.split("", trim: true)
      |> Enum.sort
      |> List.to_string
  end

  defp parse(input) do
    input
    |> String.splitter(@line_sep, trim: true)
    |> Enum.map(fn(line) ->
      line
      |> String.split(@word_sep)
    end)
  end
end

Puzzle.solve()
