defmodule Puzzle do
  @input File.read!("input/day_5.txt")
  @line_sep "\n"

  def solve(input \\ @input) do
    input
    |> parse
    |> follow_steps(0, 0)
    |> IO.inspect
  end

  defp parse(input) do
    input
    |> String.split(@line_sep, trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  defp follow_steps(steps, index, step_count)
  when index < 0 or index >= length(steps),
    do: step_count

  defp follow_steps(steps, index, step_count) do
    next_steps = List.update_at(steps, index, &(&1 + 1))
    next_index = index + Enum.at(steps, index)
    follow_steps(next_steps, next_index, step_count + 1)
  end

end

Puzzle.solve()
