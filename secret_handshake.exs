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
  
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
      #IO.puts "in commands"
      
      codes = findactions(code) 
      
      
      list =[]
      list = Enum.map(codes, fn (c) -> build_list(c,list) end) |> List.flatten
      list
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


  def findactions(code) do
     
     actionslist = assignaction(code) 
     Enum.map(actionslist, fn (a) -> a &&& code end)
  end
 
  
  defp assignaction(code) do
    cond  do 
      ((0b10000 &&& code) ==0b10000 ) -> [0b1000, 0b100, 0b10, 0b1]
      true -> [0b1, 0b10, 0b100, 0b1000]
  
      end
      
  end

  

  
  

  defp build_list(code, list) when code < 1 do
   []
   end

   defp build_list(code, list) when code >= 0b100000 do
  []
  end
   
  defp build_list(0b1, list ) do
    #IO.puts "in the build_list"
    list ++ ["wink"]
   end
    
  defp build_list(0b10, list) do
    #IO.puts "in the build_list double blink"
       list ++ ["double blink"]
       end

  defp build_list(0b100, list ) do 
       list ++ ["close your eyes"]
       end

  defp build_list(0b1000, list) do
       list ++ ["jump"]
       end

  defp build_list(0b10000, list) do
      IO.puts "in reverse function"
      IO.puts list
       Enum.reverse(list)
       end

       def myreverse(list) do
       Enum.reverse(list)
       end
  #defp build_list(code, list ) do
   # case 0b1 &&&code do
     # (0b1) -> build_list( build_list(list, 0b1 &&& code) , code-0b1)
     # true -> build_list(list, code-0b1)

     # end
    
    #code = newcode(code)
    #list ++ build_list(list, newcode(code))
   # end

end
