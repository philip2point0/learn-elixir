defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA
  Given a DNA strand, its transcribed RNA strand is formed by replacing each nucleotide with its complement:

    G -> C
    C -> G
    T -> A
    A -> U
  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    
    # make it work with Enum
    # if i use enum, 
    
    Enum.map(dna, &swap/1) 
   
  end

  
  # need to convert the charlist code point (?G is the codepoint of G)
  defp swap(my_char) do
   cond do 
      my_char == ?G -> ?C
      my_char == ?C -> ?G
      my_char == ?T -> ?A
      my_char == ?A -> ?U
    end
  end


  

  
end
