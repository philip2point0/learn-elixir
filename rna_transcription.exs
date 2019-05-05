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
    #rna = ""
    #walk_strand(dna, rna)
    
   # rna = 
   # walk_strand(dna)
    #rna
    #rna = Enum.map(dna, fn x -> swap(x) end)
    # calling "swap" works with one char
    # swap(dna)
    # make it work with Enum
    # if i use enum, need to conver to charlist to pass the test.
    # this line works - Enum.map(dna, fn x -> if x == 71 do 'C' end end) |> List.to_charlist
   # this line works as final solution - 
   Enum.map(dna, &swap/1) |> List.to_charlist
   #test with testswap
   # this line is currently not working - Enum.map(dna, &testswap/1) |> List.to_charlist
    #Enum.map(dna, fn x -> cond do x == 'G' -> 'C' end end)|> List.to_charlist
    # try using Enum.map work through the charlist
   # Enum.map(dna, &swap/1) |> Enum.join
   # need to be able to process every item in the 'char' 
   #Stream.map(dna, &swap/1) #|> List.to_charlist
  end

#def walk_strand([]) do
  []
#end
def walk_strand([head | tail]) do
  [swap(head) | walk_strand(tail)]
end
  
  def swap(my_char) do
  cond do 
    my_char == 71 -> 'C'
    my_char == 67 -> 'G'
    my_char == 84 -> 'A'
    my_char == 65 -> 'U'
  end
end

def testswap(x) do
    my_char = List.to_charlist(x)
    cond do
      my_char == 'G' -> 'C'
      my_char == 'C' -> 'G'
      my_char == 'T' -> 'A'
      my_char == 'A' -> 'U'
    end
end

  

    def pick_string(str) do
        str_length = String.length(str)
        cond do
            str_length > 0 ->
                 String.next_grapheme(str) #-> head, tail
                
            str_length == 0 -> str  
        end
        
    end
  
end
