defmodule Puzzle do
  @input File.read!("input/day_2.txt")
  @line_sep "\n"
  @col_sep "\t"

  def solve do
    @input
    |> parse
    |> checksum
    |> IO.inspect
  end

  defp parse(input) do
    input
    |> String.splitter(@line_sep, trim: true)
    |> Enum.map(fn(line) ->
      line
      |> String.split(@col_sep)
      |> Enum.map(&String.to_integer/1)
    end)
  end

  defp checksum(table) do
    table
    |> Enum.reduce(0, fn(line, sum) ->
      { min, max } = Enum.min_max(line)
      sum + max - min
    end)
  end

end

Puzzle.solve()
