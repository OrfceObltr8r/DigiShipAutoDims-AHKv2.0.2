#Requires AutoHotkey v2.0
#SingleInstance Force
#Include Functions\Func.ahk

Esc:: ExitApp

Pause:: Pause -1

Kill := (*) => ExitApp()

global save := Gui(,"Scan Orders")
save.SetFont("s11 italic","Consolas")
global modify := save.Add("Edit", "vUserText r20 w240 h100")                    ;Add Edit box to scan orders
save.Add("Button", "Default", "Batch Labels").OnEvent("Click", BatchLabels1)             ;Add button to save user input line by line and then trigger automation loop
save.OnEvent("Close", Kill)
save.Show() ;Show the GUI

WinSetAlwaysOnTop(1,"Scan Orders")

BatchLabels1(*) {
        UserText := modify.Value ; Save the contents of the edit control to the UserText variable
    
        If (UserText = ""){ ;If there is no user input Do not Proceed
            MsgBox "No Input Given! Please Scan an Order To Proceed"
            Reload
        }
    
        if (UserText != ""){ ;Check if user text is NOT empty
            FileDelete("Functions\Orders.ini") ; Delete the file if it already exists (Start Over)
    
            lines := StrSplit(UserText, "`n", "`r") ;String Split user input
            for index, line in lines { ; Loop through each line of textn ( will save line by line as an ini entry)
                IniWrite(line, "Functions\Orders.ini", "OrderNumbers", "Order" . index) ; Write the line to the INI file
            }
        }
        
    
        save.Destroy() ; Destroy the current GUI

    Date := IniRead("Functions/TempVar.ini", "Dims", "Date")			;Retrieves values from ini file
    Weight := IniRead("Functions/TempVar.ini" ,"Dims", "Weight")
    Length := IniRead("Functions/TempVar.ini", "Dims", "Length")
    Width := IniRead("Functions/TempVar.ini", "Dims", "Width")
    Height := IniRead("Functions/TempVar.ini", "Dims", "Height")

    If WinExist("Shipments"){
    WinActivate("Shipments") 
    WinMaximize("Shipments")
    }

    else{
        MsgBox "Digital Shipper is not open, please open digital shipper and try again"
        Reload
    }
    sleep 300
    Click 589, 620, "Left" ;reset button
    sleep 500

    OrderIndex := 1 ; Initialize order index
    Loop ; Start a loop
    {
        
        Order := IniRead("Functions\Orders.ini", "OrderNumbers", "Order" . OrderIndex) ; Read the order from the INI file (starts at Order1 [initialized Ln52]then gets ++ at end of loop)
        If (Order = ""){              ; If there was an error (i.e., the order doesn't exist)
            Break ; Exit the loop
        }
;===============================================================================================================================
        ;Anything Below this line is what will happen in the loop excluding OrderIndex logic
        sleep 200
        CoordMode "Pixel" , "Screen"
        ScreenClear := False
        While (!ScreenClear) {
            If ImageSearch(&X, &Y, 0, 216, 418, 260, "Functions\Clear.bmp"){
                ScreenClear := true
            }
        }
        sleep 150
        Send Order
        sleep 150
        Send "{enter}"
        Sleep 600
        if WinActive("Shipments"){ ;checks if digital shipper is active
            Retry:
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

                CoordMode "Pixel", "Screen"
                If PixelSearch(&Px, &Py, 910, 228, 910, 228, 0xFF0000) ;detected Order Status Issue, skip to next
                    { ;If issue, reset and skip to next order
                            CoordMode "Pixel", "Screen"
                            if ImageSearch(&FoundX, &FoundY, 428, 199, 735, 240, "Functions\StatusProcessed.bmp"){ ;Check if the order with an issue is Processed already
                                Reprint := MsgBox("This Orders appears to already be processed. `n Do you want to print this label?","Order is Processed","YesNo")
                                    If (Reprint = "Yes"){
                                        WinActivate("Shipments")
                                        sleep 400
                                        CoordMode "Mouse", "Screen"
                                        MouseMove 556, 159, 100 ;move to shipment history tab
                                        sleep 100
                                        MouseMove 557, 159, 100 ;move slightly to appear organic(drop down menu will not appear otherwise)
                                        sleep 1000
                                        Click 598, 520, "Left" ;click on search bar
                                        sleep 300
                                        Send Order
                                        Send "{enter}"
                                        sleep 600
                                        Click 1793, 438, "left" ;click on three dots 
                                        sleep 250
                                        Click 1717, 487, "left" ;click print label
                                        sleep 1000
                                        Click 729, 169, "left" ;click shipments to return to shipment screen
                                        Goto NewOrder     
                                    }
                            }
                        MsgBox("Order Cannot be Shipped, Skipping to next order",,"T2")
                        sleep 300
                        WinActivate ("Shipments")
                        Sleep 300
                        Coordmode "Mouse", "Screen"
                        Click 590, 648, "Left" ;reset button (moved down due to error message)
                        Goto NewOrder
                        }                                                            
            
            Sleep 500
            ProcessParcel(Date, Weight, Length, Width, Height)
            sleep 400
                CoordMode "Pixel", "Screen"
                If PixelSearch(&PX, &Py, 468, 561, 468, 561, 0xFFA500) 
                    { ;Check if there is a special instruction/ warning
                    MsgBox("Special Instruction Detected! `n Please Resolve Conflict then press the Pause key on your keyboard",,"T6")
                    Pause
                    Sleep 500
                    WinActivate("Shipments")
                    sleep 100
                    Click 590, 648, "Left" ;reset button (moved down due to error message)
                    sleep 500
                    }
                sleep 400
                If PixelSearch(&Px, &Py, 910, 228, 910, 228, 0xFF0000) ;detected Issue after inputting dimensions
                    {
                        if ImageSearch(&FoundX, &FoundY, 428, 199, 735, 240, "Functions\DimensionsRequired.bmp"){ ;Check if dimensions did not input correctly
                            RetryDimensions(Length, Width, Height)
                        }
                    }

        }
        else ;if window not active
            {
                MsgBox("Digital Shipper is not the active window! `n Please select Digital shipper and try again",,"T5")
                ExitApp
            }
        NewOrder: 
        OrderIndex++ ; Increment the order index for the next loop iteration
    }
    ExitApp
}
