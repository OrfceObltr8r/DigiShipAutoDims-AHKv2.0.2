#Requires AutoHotkey v2.0
#SingleInstance Force
#Include Functions\Func.ahk
;©SAM MACIN 2023

Kill := (*) => ExitApp()


TxtBox := Gui(, "Scanned")
TxtBox.AddEdit("r25 w220", "Enter Dimensions under Setup 1")
TxtBox.AddButton("x160","Batch Labels").OnEvent("Click", ProcessUserInput)
TxtBox.OnEvent("Close", Kill)
TxtBox.Show()


ProcessUserInput(*)
{
boxes := EditGetLineCount("Edit1","Scanned")
IniWrite(boxes, "TempVar.ini", "Dims", "Boxes")
TxtBox.AddStatusBar(,"You Scanned " boxes-1 " labels")
loop boxes  
        {
	Send "{up}"
        }
sleep 200
            
   
        
    BoxQty := IniRead("TempVar.ini","Dims", "Boxes")
    Date := IniRead("TempVar.ini", "Dims", "Date")			;Retrieves values from ini file
    Weight := IniRead("TempVar.ini" ,"Dims", "Weight")
    Length := IniRead("TempVar.ini", "Dims", "Length")
    Width := IniRead("TempVar.ini", "Dims", "Width")
    Height := IniRead("TempVar.ini", "Dims", "Height")

    WinActivate ("Shipments") 
    WinMaximize ("Shipments")
    sleep 300
    Click 589, 620, "Left" ;reset button
    WinActivate ("Scanned")

	Loop  BoxQty-1 {
	sleep 200				;delay before copying current label
    OrderCut ;Custom Function
	WinActivate ("Shipments") 
	Sleep 1000					;wait before pasting current label # (increase if Digital Shipper is taking too long to return to Shipments tab)
    Retry:
	ClipboardPaste  ;Custom Function
    
    
	
	if WinActive("Shipments") ;checks if digital shipper is active
		{
        Sleep 400
        CoordMode "Pixel", "Screen"
		if PixelSearch(&Px, &Py, 763, 286, 763, 286, 0xC73838) ;checks if there is an error from last loop (Carrier/Input Required)
			{ ;If Ship or Lookup button was pressed with no order
            MsgBox("Error Detected, Retrying",,"T2")
            WinActivate ("Shipments")
            Sleep 500
            Coordmode "Mouse", "Screen"
            Click 589, 614, "Left" ;reset button
            Sleep 500
            Goto Retry

            }
		
		
        Send "{enter}"
        Sleep 300


        CoordMode "Pixel", "Screen"
        If PixelSearch(&Px, &Py, 910, 228, 910, 228, 0xFF0000) ;detected Order Status Issue, skip to next
            { ;If issue, reset and skip to next order
            MsgBox("Order Cannot be Shipped, Skipping to next order",,"T2")
            sleep 300
            WinActivate ("Shipments")
            Sleep 300
            Coordmode "Mouse", "Screen"
            Click 590, 648, "Left" ;reset button (moved down due to error message)
            Goto NewOrder
            }
        
            Sleep 500
            ProcessParcel(Date, Weight, Length, Width, Height) ;Custom Function
            sleep 600
                


        CoordMode "Pixel", "Screen"
        If PixelSearch(&PX, &Py, 468, 561, 468, 561, 0xFFA500) ;NEED TO UPDATE
            { ;Check if there is a special instruction/ warning
            MsgBox("Please check Shipping Notes and resolve conflict",,"T3")
            Sleep 400
            WinActivate("Shipments") 
            sleep 400
            Click 1333, 832, "Left" ;Click off autocomplete window
            sleep 50
            Click 924, 526, "Left" ;Accept all notes
            sleep 500                       
            send "{tab 3}"
            send "{enter}"
            sleep 300
            Goto NewOrder

            }

        }
	else ;if window not active
		{
			MsgBox("Digital Shipper is not the active window! `n Please select Digital shipper and try again",,"T5")
            ExitApp
		}


	sleep 100
    NewOrder:
    WinActivate ("Scanned")
    Send "{down}"
                    }
    ExitApp
}

Pause:: Pause -1
Esc:: ExitApp
return
