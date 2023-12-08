#Requires AutoHotkey v2.0
#SingleInstance Force
;SAM MACIN 2023

;Per User Setup required
;Adjust the click coordinates of every click labeled below  (screen space coordinates required)
;There are 9 Mouse clicks to adjust in this script. Use the AHK built in Window Spy for quick coordinates
;=============================================================================================================================================================================
Esc:: Reload


F24::	;SINGLE BOX GUI SETUP 1
	{
	DimEdit:= Gui(, "International Shipments")
		DimEdit.Add("Text",,"Ship Date [MM/DD/YYY]")
		DimEdit.Add("Text",,"Weight:[Leave Blank to use scale weight]")
		DimEdit.Add("Text",,"Length:")
		DimEdit.Add("Text",,"Width:")
		DimEdit.Add("Text",,"Height:")
        DimEdit.Add("Text",,"Acct Number")

		DimEdit.Add("Edit","vDate ym")
		DimEdit.Add("Edit","vWeight")	;adding input boxes (ym makes new column)
		DimEdit.Add("Edit","vLength")
		DimEdit.Add("Edit","vWidth")
		DimEdit.Add("Edit","vHeight")
        DimEdit.Add("Edit","vAcctNumber")

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
            SavedAcct := SavedDims.AcctNumber
			
			IniWrite(SavedDate, "Functions/TempVar.ini", "IntDims", "Date")		;Writing saved values to an ini file
			IniWrite(SavedWeight, "Functions/TempVar.ini", "IntDims", "Weight") 
			IniWrite(SavedLength, "Functions/TempVar.ini", "IntDims", "Length")
			IniWrite(SavedWidth, "Functions/TempVar.ini", "IntDims", "Width")
			IniWrite(SavedHeight, "Functions/TempVar.ini", "IntDims", "Height")
            IniWrite(SavedAcct, "Functions/TempVar.ini", "IntDims", "Acct")
		}
	}
F20::	;SINGLE BOX SHIPMENT 1
	{
	if WinActive("Shipments")
		{
		Date := IniRead("Functions/TempVar.ini", "IntDims", "Date")			;Retrieves values from ini file
		Weight := IniRead("Functions/TempVar.ini" ,"IntDims", "Weight")
		Length := IniRead("Functions/TempVar.ini", "IntDims", "Length")
		Width := IniRead("Functions/TempVar.ini", "IntDims", "Width")
		Height := IniRead("Functions/TempVar.ini", "IntDims", "Height")
        Acct := IniRead("Functions/TempVar.ini", "IntDims", "Acct")

		
		Sleep 500
		Send "{tab 17}"
			Send Date			;Ship Date as MM/DD/YYYY / leave blank if you wish to used today's date
		Send "{Tab 4}"
			Send Weight		;weight variable / leave blank if you are weighing a box
		Send "{tab 3}"
			Send Length		;length variable
		Send "{tab}"
			Send Width		;width variable
		send "{tab}"
			Send Height		;height variable
        send "{tab 42}" ;may vary depending on # of bookmarks
        sleep 300
        send "{enter}"  ;open "International Shipment" submenu
        
            ExportReady := false
            While (!ExportReady) { ;Checks to see if the Export Window is open before proceeding
                If ImageSearch(&X, &Y, 357, 266, 569, 313, "Functions\ShipmentExport.bmp"){
                    ExportReady := true
                    
                }
                sleep 100
            }
  
        sleep 400
            CoordMode "Mouse", "Screen"
            Click 464, 290, "left"     ;Click "Add Shipment Export"
        sleep 400
            Click 1000, 209, "left"     ;Click Off "Sender Tax ID type to enable PgDn"
        sleep 300
        send "{PgDn}"
        sleep 500
            Click 724, 938, "left" ;Click "Add Shipment Export"
            sleep 400
        Send "{tab 2}"
        sleep 200       
        send "{enter}"
        sleep 400
        send "{tab 5}"
        send Weight
        sleep 300
           
            Click 849, 754, "left" ;click confirm "add package commodity"
        sleep 500
           
            Click 435, 776, "left" ;click "Close"
        sleep 400
        send "{Shift Down}"
        sleep 100
        send "{tab 2}"
        send "{Shift Up}"
        send "{enter}"
        sleep 700



        ;Adding Special Services (Billing options)
        Click 648, 255, "left" ;click "Special Services" dropdown menu
        sleep 400
        SetKeyDelay 200
        send "{down 4}"
        send "{enter}"
        sleep 300
        send "{tab}"
        sleep 200
        send "{down 2}"
        send "{tab}"
        send Acct
        send "{tab}"
        sleep 50
        SendText "USA"
        send "{tab 3}"
        send "{enter}"
        sleep 400


        ;Adding Special Services (Duty and Tax)
        Click 648, 255, "left" ;click "Special Services" dropdown menu
        sleep 200
        send "{down 9}"
        send "{enter}"
        sleep 300
        send "{tab}"
        sleep 200
        send "{down 2}"
        send "{tab}"
        send Acct
        send "{tab}"
        SendText "USA"
        send "{tab 3}"
        send "{enter}"
        sleep 400

        ;Adding Special Services (Commercial Invoice)
        Click 648, 255, "left" ;click "Special Services" dropdown menu
        sleep 300
        send "{down 10}"
        send "{enter}"
        sleep 300
        send "{tab 3}"
        send "{enter}"
        sleep 300
           
        Click 443, 673, "left"  ;close small window
        sleep 400
        Click 920, 534, "left"  ;check special instructions
        sleep 400
        send "{tab 3}"
        send "{enter}"
        
        }
        
		
	else
		{
			MsgBox("Digital Shipper is not the active window!")
		}
	}

F8:: Reload

^space::
	{
		WinSetAlwaysOnTop -1, "A"
	}
    
Return