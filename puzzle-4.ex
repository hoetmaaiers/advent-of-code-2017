defmodule Puzzle do
  @input File.read!("input/day_4.txt")
  @line_sep "\n"
  @word_sep " "

  def solve() do
    @input
    |> parse
    |> Enum.map(&valid_passphrase/1)
    |> Enum.filter(fn(x) -> x end)
    |> length
    |> IO.inspect
  end

  defp parse(input) do
    input
    |> String.splitter(@line_sep, trim: true)
    |> Enum.map(fn(line) ->
      line
      |> String.split(@word_sep)
    end)
  end

  def valid_passphrase(phrase) do
    length(Enum.uniq(phrase)) == length(phrase)
  end

end

Puzzle.solve()
