defmodule Puzzle do
  def solve(input) do
    numbers = create_numeric_list(input)

    # # make numbers "circular"
    # numbers = numbers ++ [Enum.at(numbers, 0)]

    Stream.with_index(numbers)
    |> Enum.reduce(0, fn({number, index}, acc) ->
      if (index < length(numbers) / 2) do
        acc + determine_sum(number, Enum.at(numbers, (div(length(numbers), 2) + index)))
      else
        acc
      end
    end)
  end

  defp determine_sum(i, j) when i == j, do: i + j
  defp determine_sum(_, _), do: 0

  defp create_numeric_list(string) do
    String.split(string, "", trim: true)
    |> Enum.map(&String.to_integer(&1))
  end
end
