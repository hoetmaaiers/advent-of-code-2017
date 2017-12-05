defmodule Puzzle do
  @input File.read!("input/day_5.txt")
  @line_sep "\n"

  def solve(input \\ @input) do
    input
    |> parse
    |> follow_steps(0, 0, 0)
    |> IO.inspect
  end

  defp parse(input) do
    input
    |> String.split(@line_sep, trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  defp define_offset_direction(a, b) do
    {min, max} = Enum.min_max([a, b])
    if (abs(min - max) >= 3), do: -1, else: 1
  end

  defp follow_steps(steps, _, index, step_count)
  when index < 0 or index >= length(steps),
    do: step_count

  defp follow_steps(steps, previous_index, index, step_count) do
    direction = define_offset_direction(previous_index, index)
    next_steps = List.update_at(steps, index, &(&1 + direction))
    next_index = index + Enum.at(steps, index)
    follow_steps(next_steps, index, next_index, step_count + 1)
  end

end

Puzzle.solve()
Puzzle.solve("0\n3\n0\n1\n-3")
