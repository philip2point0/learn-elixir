defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  use Bitwise
  _actionslist =[]
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
      #IO.puts "in commands"
      build_list([], code)
      #assignaction(code)
      #if ((code &&& 0b10000) == 0b10000) do
      #  Enum.reverse_order(list)
      #end
  end
   
  #@spec commands(list:: list(String.t()), code :: integer) :: list(String.t())
  defp checkwink(list, code) do 
      if ((code &&& 0b1) == 0b1) do list = Enum.concat(list,["wink"]) end
      if ((code &&& 0b10) == 0b10) do list = Enum.concat(list, ["double blink"]) end
      IO.puts list
          #Enum.concat(actions_list, ["wink"])
          
      
  end 

  def checkblink() do
  end
 
  defp assignaction(code) when code == 0 do
  []
  end
  defp assignaction(code) when code >= 0b100000 do
  []
  end
  defp assignaction(code) do
    list = []
     case (code) do
       0b1 -> List.insert_at(list,0,"wink")

       0b10 -> List.insert_at(list,0,"double blink")

       0b100 -> List.insert_at(list,0,"close your eyes")

       0b1000 -> List.insert_at(list,0,"jump")

       0b10000 -> Enum.reverse(list)

       0 -> list

       code -> checkwink(list, code)
      end
  end

  defp newcode(code) do
    IO.puts "In newcode"
    IO.puts code 
     case (code) do
       0b1 -> code - 0b1

       0b10 -> code - 0b10

       0b100 -> code - 0b100

       0b1000 -> code - 0b1000

       0b10000 -> code - 0b10000



       0 -> 0

       
      end
  end
  

  defp build_list(list, code) when code < 1 do
   []
   end

   defp build_list(list, code) when code >= 0b100000 do
  []
  end
   
  defp build_list(list, 0b1 ) do
    IO.puts "in the build_list"
    list ++ ["wink"]
   end
    
  defp build_list(list, 0b10) do
    IO.puts "in the build_list double blink"
       list ++ ["double blink"]
       end

  defp build_list(list, 0b100) do 
       list ++ ["close your eyes"]
       end

defp build_list(list, 0b1000) do
       list ++ ["jump"]
       end

  defp build_list(list, code) do
    case 0b1 &&&code do
      (0b1) -> build_list( build_list(list, 0b1 &&& code) , code-0b1)
      true -> build_list(list, code-0b1)

      end
    
    #code = newcode(code)
    #list ++ build_list(list, newcode(code))
    end

end
