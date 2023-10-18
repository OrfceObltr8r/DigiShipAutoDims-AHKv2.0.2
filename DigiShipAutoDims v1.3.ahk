#Requires AutoHotkey v2.0
#SingleInstance Force
#Include Functions\Func.ahk
;SAM MACIN 2023 v1.2

F24::	;SINGLE BOX GUI SETUP 1
	{
	DimEdit:= Gui(, "Setup 1")
		DimEdit.Add("Text",,"Ship Date [MM/DD/YYY]")
		DimEdit.Add("Text",,"Weight:[Leave Blank to use scale weight]")
		DimEdit.Add("Text",,"Length:")
		DimEdit.Add("Text",,"Width:")
		DimEdit.Add("Text",,"Height:")

		DimEdit.Add("Edit","vDate ym")
		DimEdit.Add("Edit","vWeight")	;adding input boxes (ym makes new column)
		DimEdit.Add("Edit","vLength")
		DimEdit.Add("Edit","vWidth")
		DimEdit.Add("Edit","vHeight")

		DimEdit.Add("Button", "default", "Enter Dims").OnEvent("Click", ProcessUserInput)

		
	DimEdit.Show()

		ProcessUserInput(*)
		{
			SavedDims := DimEdit.Submit() ;save the content of the stored variables
			SavedDate := SavedDims.Date
			SavedWeight:=  SavedDims.Weight
			SavedLength:= SavedDims.Length
			SavedWidth := SavedDims.Width
			SavedHeight := SavedDims.Height
			
			IniWrite(SavedDate, "TempVar.ini", "Dims", "Date")		;Writing saved values to an ini file
			IniWrite(SavedWeight, "TempVar.ini", "Dims", "Weight") 
			IniWrite(SavedLength, "TempVar.ini", "Dims", "Length")
			IniWrite(SavedWidth, "TempVar.ini", "Dims", "Width")
			IniWrite(SavedHeight, "TempVar.ini", "Dims", "Height")
		}
	}
	
F23::	;SINGLE BOX GUI SETUP 2
	{
	DimEdit:= Gui(, "Setup 2")
		DimEdit.Add("Text",,"Ship Date [MM/DD/YYY]")
		DimEdit.Add("Text",,"Weight:[Leave Blank to use scale weight]")
		DimEdit.Add("Text",,"Length:")
		DimEdit.Add("Text",,"Width:")
		DimEdit.Add("Text",,"Height:")

		DimEdit.Add("Edit","vDate ym")
		DimEdit.Add("Edit","vWeight")	;adding input boxes (ym makes new column)
		DimEdit.Add("Edit","vLength")
		DimEdit.Add("Edit","vWidth")
		DimEdit.Add("Edit","vHeight")

		DimEdit.Add("Button", "default", "Enter Dims").OnEvent("Click", ProcessUserInput)
		

	DimEdit.Show()

		ProcessUserInput(*)
		{
			SavedDims := DimEdit.Submit() ;save the content of the stored variables
			SavedDate := SavedDims.Date
			SavedWeight:=  SavedDims.Weight
			SavedLength:= SavedDims.Length
			SavedWidth := SavedDims.Width
			SavedHeight := SavedDims.Height
			
			IniWrite(SavedDate, "TempVar.ini", "Dims2", "Date")		;Writing saved values to an ini file
			IniWrite(SavedWeight, "TempVar.ini", "Dims2", "Weight") 
			IniWrite(SavedLength, "TempVar.ini", "Dims2", "Length")
			IniWrite(SavedWidth, "TempVar.ini", "Dims2", "Width")
			IniWrite(SavedHeight, "TempVar.ini", "Dims2", "Height")
		}
	}
			
F22::	;Double BOX GUI SETUP
	{
	DimEdit:= Gui(, "Enter Dims and Weight [Double Box]")
		DimEdit.Add("Text",,"Ship Date [MM/DD/YYY]")
		DimEdit.Add("Text",,"Weight:[Leave Blank to use scale weight]")
		DimEdit.Add("Text",,"Length:")
		DimEdit.Add("Text",,"Width:")
		DimEdit.Add("Text",,"Height:")
	
		DimEdit.Add("Edit","vDate ym")
		DimEdit.Add("Edit","vWeight")	;adding input boxes (ym makes new column)
		DimEdit.Add("Edit","vLength")
		DimEdit.Add("Edit","vWidth")
		DimEdit.Add("Edit","vHeight")
		
		DimEdit.Add("Text","ys","Weight 2:")
		DimEdit.Add("Text",,"Length 2:")
		DimEdit.Add("Text",,"Width 2:")
		DimEdit.Add("Text",,"Height 2:")

		DimEdit.Add("Edit","vWeight2 ym")	;adding input boxes (ym makes new column)
		DimEdit.Add("Edit","vLength2")
		DimEdit.Add("Edit","vWidth2")
		DimEdit.Add("Edit","vHeight2")

		DimEdit.Add("Button", "default", "Enter Dims").OnEvent("Click", ProcessUserInput)
		

	DimEdit.Show()

		ProcessUserInput(*)
		{
			SavedDims := DimEdit.Submit() ;save the content of the stored variables
			SavedDate := SavedDims.Date
			SavedWeight:=  SavedDims.Weight
			SavedLength:= SavedDims.Length
			SavedWidth := SavedDims.Width
			SavedHeight := SavedDims.Height
			
			SavedWeight2:=  SavedDims.Weight2
			SavedLength2:= SavedDims.Length2
			SavedWidth2 := SavedDims.Width2
			SavedHeight2 := SavedDims.Height2

			
			IniWrite(SavedDate, "TempVar.ini", "MultiDims", "Date")
			IniWrite(SavedWeight, "TempVar.ini", "MultiDims", "Weight") 
			IniWrite(SavedLength, "TempVar.ini", "MultiDims", "Length")
			IniWrite(SavedWidth, "TempVar.ini", "MultiDims", "Width")
			IniWrite(SavedHeight, "TempVar.ini", "MultiDims", "Height")

			IniWrite(SavedWeight2, "TempVar.ini", "MultiDims", "Weight2") 
			IniWrite(SavedLength2, "TempVar.ini", "MultiDims", "Length2")
			IniWrite(SavedWidth2, "TempVar.ini", "MultiDims", "Width2")
			IniWrite(SavedHeight2, "TempVar.ini", "MultiDims", "Height2")
		}
	}

F21::	;TRIPLE BOX SETUP
	{
		DimEdit:= Gui(, "Enter Dims and Weight [Triple Box]")
		DimEdit.Add("Text",,"Ship Date [MM/DD/YYY]")
		DimEdit.Add("Text",,"Weight:[Leave Blank to use scale weight]")
		DimEdit.Add("Text",,"Length:")
		DimEdit.Add("Text",,"Width:")
		DimEdit.Add("Text",,"Height:")
	
		DimEdit.Add("Edit","vDate ym")
		DimEdit.Add("Edit","vWeight")	;adding input boxes (ym makes new column)
		DimEdit.Add("Edit","vLength")
		DimEdit.Add("Edit","vWidth")
		DimEdit.Add("Edit","vHeight")
		
		DimEdit.Add("Text","ys","Weight 2:")
		DimEdit.Add("Text",,"Length 2:")
		DimEdit.Add("Text",,"Width 2:")
		DimEdit.Add("Text",,"Height 2:")

		DimEdit.Add("Edit","vWeight2 ym")	;adding input boxes (ym makes new column)
		DimEdit.Add("Edit","vLength2")
		DimEdit.Add("Edit","vWidth2")
		DimEdit.Add("Edit","vHeight2")

		DimEdit.Add("Text","ys","Weight 3:")
		DimEdit.Add("Text",,"Length 3:")
		DimEdit.Add("Text",,"Width 3:")
		DimEdit.Add("Text",,"Height 3:")

		DimEdit.Add("Edit","vWeight3 ym")	;adding input boxes (ym makes new column)
		DimEdit.Add("Edit","vLength3")
		DimEdit.Add("Edit","vWidth3")
		DimEdit.Add("Edit","vHeight3")

		DimEdit.Add("Button", "default", "Enter Dims").OnEvent("Click", ProcessUserInput)
		
	DimEdit.Show()

		ProcessUserInput(*)
		{
			SavedDims := DimEdit.Submit() ;save the content of the stored variables
			SavedDate := SavedDims.Date
			SavedWeight:=  SavedDims.Weight
			SavedLength:= SavedDims.Length
			SavedWidth := SavedDims.Width
			SavedHeight := SavedDims.Height
			
			SavedWeight2:=  SavedDims.Weight2
			SavedLength2:= SavedDims.Length2
			SavedWidth2 := SavedDims.Width2
			SavedHeight2 := SavedDims.Height2

			SavedWeight3:=  SavedDims.Weight3
			SavedLength3:= SavedDims.Length3
			SavedWidth3 := SavedDims.Width3
			SavedHeight3 := SavedDims.Height3

			
			IniWrite(SavedDate, "TempVar.ini", "MultiDims2", "Date")
			IniWrite(SavedWeight, "TempVar.ini", "MultiDims2", "Weight") 
			IniWrite(SavedLength, "TempVar.ini", "MultiDims2", "Length")
			IniWrite(SavedWidth, "TempVar.ini", "MultiDims2", "Width")
			IniWrite(SavedHeight, "TempVar.ini", "MultiDims2", "Height")

			IniWrite(SavedWeight2, "TempVar.ini", "MultiDims2", "Weight2") 
			IniWrite(SavedLength2, "TempVar.ini", "MultiDims2", "Length2")
			IniWrite(SavedWidth2, "TempVar.ini", "MultiDims2", "Width2")
			IniWrite(SavedHeight2, "TempVar.ini", "MultiDims2", "Height2")

			IniWrite(SavedWeight3, "TempVar.ini", "MultiDims2", "Weight3") 
			IniWrite(SavedLength3, "TempVar.ini", "MultiDims2", "Length3")
			IniWrite(SavedWidth3, "TempVar.ini", "MultiDims2", "Width3")
			IniWrite(SavedHeight3, "TempVar.ini", "MultiDims2", "Height3")
		}
	}

;SETUP SCRIPTS ABOVE THIS LINE=================================================================================================================================================
	
F20::	;SINGLE BOX SHIPMENT 1
	{
	if WinActive("Shipments")
		{
		Date := IniRead("TempVar.ini", "Dims", "Date")			;Retrieves values from ini file
		Weight := IniRead("TempVar.ini" ,"Dims", "Weight")
		Length := IniRead("TempVar.ini", "Dims", "Length")
		Width := IniRead("TempVar.ini", "Dims", "Width")
		Height := IniRead("TempVar.ini", "Dims", "Height")

		SetKeyDelay 200
		Send "{enter}"
		Sleep 400
		Send "{tab 17}"
			Send Date			;Ship Date as MM/DD/YYYY / leave blank if you wish to used today's date
		Send "{Tab 4}"
			Send Weight		;weight variable / leave blank if you are weighing a box
		Send "{tab 2}"
			Send Length		;length variable
		Send "{tab}"
			Send Width		;width variable
		send "{tab}"
			Send Height		;height variable
		send "{tab 3}"
		sleep 400
		send "{enter}"			;final ship button, comment this line out if you need to verify function
		}
	else
		{
			MsgBox("Digital Shipper is not the active window!")
		}
	}

F19::	;SINGLE BOX SHIPMENT 2
	{
	if WinActive("Shipments")
		{
		Date := IniRead("TempVar.ini", "Dims2", "Date")			;Retrieves values from ini file
		Weight := IniRead("TempVar.ini" ,"Dims2", "Weight")
		Length := IniRead("TempVar.ini", "Dims2", "Length")
		Width := IniRead("TempVar.ini", "Dims2", "Width")
		Height := IniRead("TempVar.ini", "Dims2", "Height")

		SetKeyDelay 200
		Send "{enter}"
		Sleep 400
		Send "{tab 17}"
			Send Date			;Ship Date as MM/DD/YYYY / leave blank if you wish to used today's date
		Send "{Tab 4}"
			Send Weight		;weight variable / leave blank if you are weighing a box
		Send "{tab 2}"
			Send Length		;length variable
		Send "{tab}"
			Send Width		;width variable
		send "{tab}"
			Send Height		;height variable
		send "{tab 3}"
		sleep 400
		send "{enter}"			;final ship button, comment this line out if you need to verify function
		}
	else
		{
			MsgBox("Digital Shipper is not the active window!")
		}
	}

F18::	;DOUBLE BOX SHIPMENTS
	{
	if WinActive("Shipments")
		{
		Date := IniRead("TempVar.ini", "MultiDims", "Date")			;Retrieves values from ini file
		Weight := IniRead("TempVar.ini" ,"MultiDims", "Weight")
		Length := IniRead("TempVar.ini", "MultiDims", "Length")
		Width := IniRead("TempVar.ini", "MultiDims", "Width")
		Height := IniRead("TempVar.ini", "MultiDims", "Height")

		Weight2 := IniRead("TempVar.ini" ,"MultiDims", "Weight2")
		Length2 := IniRead("TempVar.ini", "MultiDims", "Length2")
		Width2 := IniRead("TempVar.ini", "MultiDims", "Width2")
		Height2 := IniRead("TempVar.ini", "MultiDims", "Height2")
		
		SetKeyDelay 200
		Send "{enter}"
		Sleep 400
		Send "{tab 17}"
			Send Date		;Ship Date as MM/DD/YYYY / leave blank if you wish to used today's date
		Send "{Tab 2}"
			SendText "2"			;enter number of packages in your shipment
		Send "{tab 2}"
			Send Weight		;weight variable / leave blank if you are weighing a box
		send "{tab 2}"
			Send Length		;length variable
		send "{tab}"
			Send Width		;width variable
		send "{tab}"
			Send Height		;height variable
		send "{tab 3}"
		sleep 300
		send "{enter}"			;final ship button, comment this line out if you need to verify function

		;AFTER THIS COMMENT, YOU WILL BE ENTERING THE DIMENSIONS FOR THE SECOND PACKAGE! (add identical sections with a 3 second delay in between)
		;Increase time to 3000 if 1st label takes too long to process causing subsequent inputs to be mis-timed
		
		Sleep 2500				
			Send "{Shift Down}"
			Send "{tab 1}"
			Send "{Shift Up}"
			Send Weight2			;Weight for second box
		send "{tab 3}"
			Send Length2	;length variable 2
		send "{tab}"
			Send Width2		;width variable 2
		send "{tab}"
			Send Height2		;height variable 2
		send "{tab 3}"
		sleep 300
		send "{enter}"			;label print step, comment out to test feature
		}
	else
		{
			MsgBox("Digital Shipper is not the active window!")
		}
	}
	

F17::	;TRIPLE BOX SHIPMENTS
	{
	if WinActive("Shipments")
		{
		Date := IniRead("TempVar.ini", "MultiDims2", "Date")			;Retrieves values from ini file
		Weight := IniRead("TempVar.ini" ,"MultiDims2", "Weight")
		Length := IniRead("TempVar.ini", "MultiDims2", "Length")
		Width := IniRead("TempVar.ini", "MultiDims2", "Width")
		Height := IniRead("TempVar.ini", "MultiDims2", "Height")

		Weight2 := IniRead("TempVar.ini" ,"MultiDims2", "Weight2")
		Length2 := IniRead("TempVar.ini", "MultiDims2", "Length2")
		Width2 := IniRead("TempVar.ini", "MultiDims2", "Width2")
		Height2 := IniRead("TempVar.ini", "MultiDims2", "Height2")

		Weight3 := IniRead("TempVar.ini" ,"MultiDims2", "Weight3")
		Length3 := IniRead("TempVar.ini", "MultiDims2", "Length3")
		Width3 := IniRead("TempVar.ini", "MultiDims2", "Width3")
		Height3 := IniRead("TempVar.ini", "MultiDims2", "Height3")
		
		SetKeyDelay 200
		Send "{enter}"
		Sleep 400
		Send "{tab 17}"
			Send Date		;Ship Date as MM/DD/YYYY / leave blank if you wish to used today's date
		Send "{Tab 2}"
			SendText "3"			;enter number of packages in your shipment
		Send "{tab 2}"
			Send Weight		;weight variable / leave blank if you are weighing a box
		send "{tab 2}"
			Send Length		;length variable
		send "{tab}"
			Send Width		;width variable
		send "{tab}"
			Send Height		;height variable
		Sleep 100
		Click 1333, 832, "Left" ;Click off autocomplete window
		sleep 100
		Click 924, 526, "Left" ;Accept all notes
		sleep 150
		send "{tab 3}"
		sleep 300
		send "{enter}"			;final ship button, comment this line out if you need to verify function

		;AFTER THIS COMMENT, YOU WILL BE ENTERING THE DIMENSIONS FOR THE SECOND PACKAGE! (add identical sections with a 2.5 second delay in between)
		;Increase time to 3000 if 1st label takes too long to process causing subsequent inputs to be mis-timed
		
		Sleep 2500				
			Send "{Shift Down}"
			Send "{tab 1}"
			Send "{Shift Up}"
			Send Weight2			;Weight for second box
		send "{tab 3}"
			Send Length2	;length variable 2
		send "{tab}"
			Send Width2		;width variable 2
		send "{tab}"
			Send Height2		;height variable 2
		send "{tab 3}"
		sleep 300
		send "{enter}"			;label print step, comment out to test

		;Third box inputs start here
		Sleep 2500				
			Send "{Shift Down}"
			Send "{tab 1}"
			Send "{Shift Up}"
			Send Weight3			;Weight for third box
		send "{tab 3}"
			Send Length3	;length variable 3
		send "{tab}"
			Send Width3		;width variable 3
		send "{tab}"
			Send Height3		;height variable 3
		send "{tab 3}"
		sleep 300
		send "{enter}"			;label print step, comment out to test
		}
	else
		{
			MsgBox("Digital Shipper is not the active window!")
		}
	}

F16:: 	;Relaunch Digital Shipper (UPDATED 9/14 [Single 1080p Screen])
	{
		CoordMode "Mouse","Screen"

		If WinExist("Shipments")
			{
			WinActivate("Shipments")
			WinMaximize("Shipments")
			sleep 100
			Click 190, 85, "left" ;Click Digital Shipper Bookmark
			sleep 400
			Click 191, 217, "left" ;Click Username Field
			sleep 300
			Click 179, 283, "left" ;move to Svilla user preset
			sleep 500
			send "{enter}"
			sleep 350
			Click 126, 262, "left" ;Click Login Button
			sleep 350
			Click 132, 313, "left" ;Click second login button
			}
		Else 
			{
				If WinExist("DigitalShipper")
					{
						WinActivate ("DigitalShipper")
						WinMaximize ("DigitalShipper")
						sleep 400
						Click 191, 217, "left" ;Click Username Field
						sleep 300
						Click 179, 283, "left" ;move to Svilla user preset
						sleep 500
						send "{enter}"
						sleep 350
						Click 126, 262, "left" ;Click Login Button
						sleep 350
						Click 132, 313, "left" ;Click second login button
					}
			}
	}
F15::	;Show values stored in ini file
	{
;==================== v Setup 1 v=================================================================
        Date1 := IniRead("TempVar.ini", "Dims", "Date")			;Retrieves values from ini file
		Weight1 := IniRead("TempVar.ini" ,"Dims", "Weight")
		Length1 := IniRead("TempVar.ini", "Dims", "Length")
		Width1 := IniRead("TempVar.ini", "Dims", "Width")
		Height1 := IniRead("TempVar.ini", "Dims", "Height")


        DisplayDims:= Gui(, "Stored Dimensions")
            DisplayDims.SetFont("bold s10")
                DisplayDims.Add("Text",,"Setup 1")
            DisplayDims.SetFont()
        DisplayDims.Add("Text",,"Ship Date:"  )
        DisplayDims.Add("Text",,"Weight:")
		DisplayDims.Add("Text",,"Length:")
		DisplayDims.Add("Text",,"Width:")
		DisplayDims.Add("Text",,"Height:")

        DisplayDims.Add("Text","ym y39",Date1)
        DisplayDims.Add("Text",,Weight1)
		DisplayDims.Add("Text",,Length1)
		DisplayDims.Add("Text",,Width1)
		DisplayDims.Add("Text",,Height1)
;=================== ^ Setup 1 ^ ===============================================================

;=================== v Setup 2 v ===============================================================

        Date2 := IniRead("TempVar.ini", "Dims2", "Date")			;Retrieves values from ini file
		Weight2 := IniRead("TempVar.ini" ,"Dims2", "Weight")
		Length2 := IniRead("TempVar.ini", "Dims2", "Length")
		Width2 := IniRead("TempVar.ini", "Dims2", "Width")
		Height2 := IniRead("TempVar.ini", "Dims2", "Height")

        DisplayDims.SetFont("bold s10")
            DisplayDims.Add("Text","ym","Setup 2")
        DisplayDims.SetFont()
        DisplayDims.Add("Text",,"Ship Date:"  )
        DisplayDims.Add("Text",,"Weight:")
		DisplayDims.Add("Text",,"Length:")
		DisplayDims.Add("Text",,"Width:")
		DisplayDims.Add("Text",,"Height:")

        DisplayDims.Add("Text","ym y39",Date2)
        DisplayDims.Add("Text",,Weight2)
		DisplayDims.Add("Text",,Length2)
		DisplayDims.Add("Text",,Width2)
		DisplayDims.Add("Text",,Height2)
;=================== ^ Setup 2 ^ ========================================================================

;=================== v 2 Box Setup v =======================================================================

        DoubleDate := IniRead("TempVar.ini", "MultiDims", "Date")			;Retrieves values from ini file
		DoubleWeight := IniRead("TempVar.ini" ,"MultiDims", "Weight")
		DoubleLength := IniRead("TempVar.ini", "MultiDims", "Length")
		DoubleWidth := IniRead("TempVar.ini", "MultiDims", "Width")
		DoubleHeight := IniRead("TempVar.ini", "MultiDims", "Height")

		DoubleWeight2 := IniRead("TempVar.ini" ,"MultiDims", "Weight2")
		DoubleLength2 := IniRead("TempVar.ini", "MultiDims", "Length2")
		DoubleWidth2 := IniRead("TempVar.ini", "MultiDims", "Width2")
		DoubleHeight2 := IniRead("TempVar.ini", "MultiDims", "Height2")

        DisplayDims.SetFont("bold s10")
            DisplayDims.Add("Text","xm","Double Box")
        DisplayDims.SetFont()
        DisplayDims.Add("Text",,"Ship Date:"  )
        DisplayDims.Add("Text",,"Weight:")
		DisplayDims.Add("Text",,"Length:")
		DisplayDims.Add("Text",,"Width:")
		DisplayDims.Add("Text",,"Height:")

        DisplayDims.Add("Text","yp y204 x70",DoubleDate)
        DisplayDims.Add("Text",,DoubleWeight)
		DisplayDims.Add("Text",,DoubleLength)
		DisplayDims.Add("Text",,DoubleWidth)
		DisplayDims.Add("Text",,DoubleHeight)
        
        DisplayDims.Add("Text","yp y226 x140","Weight[Box 2]:")
		DisplayDims.Add("Text",,"Length [Box 2]:")
		DisplayDims.Add("Text",,"Width  [Box 2]:")
		DisplayDims.Add("Text",,"Height [Box 2]:")

        DisplayDims.Add("Text","yp y198","")
        DisplayDims.Add("Text",,DoubleWeight2)
		DisplayDims.Add("Text",,DoubleLength2)
		DisplayDims.Add("Text",,DoubleWidth2)
		DisplayDims.Add("Text",,DoubleHeight2)

;=============== ^ 2 Box Setup ^ =============================================================================
        
;=============== v 3 Box Setup v =============================================================================

        TripleDate := IniRead("TempVar.ini", "MultiDims2", "Date")			;Retrieves values from ini file
		TripleWeight := IniRead("TempVar.ini" ,"MultiDims2", "Weight")
		TripleLength := IniRead("TempVar.ini", "MultiDims2", "Length")
		TripleWidth := IniRead("TempVar.ini", "MultiDims2", "Width")
		TripleHeight := IniRead("TempVar.ini", "MultiDims2", "Height")

		TripleWeight2 := IniRead("TempVar.ini" ,"MultiDims2", "Weight2")
		TripleLength2 := IniRead("TempVar.ini", "MultiDims2", "Length2")
		TripleWidth2 := IniRead("TempVar.ini", "MultiDims2", "Width2")
		TripleHeight2 := IniRead("TempVar.ini", "MultiDims2", "Height2")

		TripleWeight3 := IniRead("TempVar.ini" ,"MultiDims2", "Weight3")
		TripleLength3 := IniRead("TempVar.ini", "MultiDims2", "Length3")
		TripleWidth3 := IniRead("TempVar.ini", "MultiDims2", "Width3")
		TripleHeight3 := IniRead("TempVar.ini", "MultiDims2", "Height3")

        DisplayDims.SetFont("bold s10")
            DisplayDims.Add("Text","xm y+10","Triple Box")
        DisplayDims.SetFont()
        DisplayDims.Add("Text",,"Ship Date:"  )
        DisplayDims.Add("Text",,"Weight:")
		DisplayDims.Add("Text",,"Length:")
		DisplayDims.Add("Text",,"Width:")
		DisplayDims.Add("Text",,"Height:")

        DisplayDims.Add("Text","yp y362 x70",TripleDate)
        DisplayDims.Add("Text",,TripleWeight)
		DisplayDims.Add("Text",,TripleLength)
		DisplayDims.Add("Text",,TripleWidth)
		DisplayDims.Add("Text",,TripleHeight)
        
        DisplayDims.Add("Text","yp y388 x140","Weight[Box 2]:")
		DisplayDims.Add("Text",,"Length [Box 2]:")
		DisplayDims.Add("Text",,"Width  [Box 2]:")
		DisplayDims.Add("Text",,"Height [Box 2]:")

        DisplayDims.Add("Text","yp y361","")
        DisplayDims.Add("Text",,TripleWeight2)
		DisplayDims.Add("Text",,TripleLength2)
		DisplayDims.Add("Text",,TripleWidth2)
		DisplayDims.Add("Text",,TripleHeight2)
        
        DisplayDims.Add("Text","yp y388 x250","Weight[Box 3]:")
		DisplayDims.Add("Text",,"Length [Box 3]:")
		DisplayDims.Add("Text",,"Width  [Box 3]:")
		DisplayDims.Add("Text",,"Height [Box 3]:")

        DisplayDims.Add("Text","yp y361","")
        DisplayDims.Add("Text",,TripleWeight3)
		DisplayDims.Add("Text",,TripleLength3)
		DisplayDims.Add("Text",,TripleWidth3)
		DisplayDims.Add("Text",,TripleHeight3)

;============== ^ 3 Box Setup ^ ==============================================================================
        DisplayDims.Show()
	}

F14:: ;View Today's Pallets Shipping Out (UPDATED 9/14 [Single 1080p Screen])
	{
		CoordMode "Mouse","Screen"
		WinActivate("Production System")
		WinMaximize("Production System")
		sleep 400
		send "{ctrl down}"
		send "{f}"
		send "{ctrl up}"
		sleep 250
		Click 396, 225, "left" ;click "Ship Type" top box
		sleep 450
		Click 396, 225, "left" ;click "Ship Type" top box
		sleep 300
		SendText "skid"
		sleep 200
		Click 637, 225, "left" ;click Ship Date box
		sleep 250
		send "{enter}"
		sleep 200
		send "{enter}"
	}
F8::	;REFRESH SCRIPT
	{
		Reload
	}

^space::
	{
		WinSetAlwaysOnTop -1, "A"
	}
;============================================================================================
			SetTimer WiggleMouse, 7000 ; Wiggle Every 7 seconds

			WiggleMouse() {
				MouseMove 1, 1, 0, "R"
				Sleep(40)
				MouseMove -1, -1, 0, "R"
			}
;=============================================================================================			
return
	