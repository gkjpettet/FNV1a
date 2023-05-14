#tag Module
Protected Module FNV1a
	#tag Method, Flags = &h1, Description = 43616C63756C6174657320464E562D316120686173682066726F6D206120646F75626C652E
		Protected Function Hash(d As Double) As UInteger
		  /// Calculates FNV-1a hash from a double.
		  
		  Var data As New MemoryBlock(8)
		  data.DoubleValue(0) = d
		  
		  Return Hash(data)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 43616C63756C6174657320464E562D316120686173682066726F6D20616E20696E74656765722E
		Protected Function Hash(int As Integer) As UInteger
		  /// Calculates FNV-1a hash from an integer.
		  
		  #If Target64Bit
		    Var data As New MemoryBlock(8)
		    data.Int64Value(0) = int
		  #Else
		    Var data As New MemoryBlock(4)
		    data.Int32Value(0) = int
		  #EndIf
		  
		  Return Hash(data)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 43616C63756C617465732074686520464E562D316120686173682066726F6D2061206D656D6F727920626C6F636B20286F7220737472696E67292E
		Protected Function Hash(mb As MemoryBlock) As UInt32
		  /// Calculates the FNV-1a hash from a memory block (or string).
		  
		  // Use a different offset basis for 32 or 64-bit systems.
		  #If Target64Bit
		    Var hash As UInteger = 14695981039346656037
		  #Else
		    Var hash As UInteger = 2166136261
		  #EndIf
		  
		  Var limit As Integer = mb.Size - 1
		  For i As Integer = 0 To limit
		    hash = hash Xor mb.Byte(i)
		    
		    // Use a different FNV prime for 32 and 64-bit systems.
		    #If Target64Bit
		      hash = hash * 1099511628211
		    #Else
		      hash = hash * 16777619
		    #EndIf
		  Next i
		  
		  Return hash
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		An implementation of the Fowler-Noll-Vo hash function:
		
		https://en.wikipedia.org/wiki/Fowler–Noll–Vo_hash_function
		
		Also so this fantastic comparison of hashing options:
		
		https://softwareengineering.stackexchange.com/questions/49550/which-hashing-algorithm-is-best-for-uniqueness-and-speed
		
	#tag EndNote


	#tag Constant, Name = VERISON, Type = String, Dynamic = False, Default = \"1.0.0", Scope = Protected
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
