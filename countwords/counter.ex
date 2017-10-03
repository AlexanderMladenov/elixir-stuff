defmodule Counter do
  def print_name do
    IO.puts "Counter"
  end

  def read_file(fileName) do
    File.read!(fileName)
  end

  def count_words(fileName) do
    text = read_file(fileName)
    processedText = Enum.map(String.split(text), &(String.trim(&1)))
    wordMaps = Enum.map(processedText, &(Map.put(%{}, &1, 1)))
    Enum.reduce(wordMaps, fn(elem, acc) ->
      key = List.first(Map.keys(elem))
      if Map.has_key?(acc, key) do
        Map.update!(acc, key, &(&1 + 1))
      else
        Map.put(acc, key, 1)
      end
    end)
  end
  
end