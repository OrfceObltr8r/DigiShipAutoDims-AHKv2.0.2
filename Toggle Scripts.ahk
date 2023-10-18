#Requires AutoHotkey v2.0
#SingleInstance Force
;©SAM MACIN 2023

DetectHiddenWindows True
If WinExist("DigiShipAutoDims v1.3.ahk")
    {
        WinClose "DigiShipAutoDims v1.3.ahk"
        run "International Shipments.ahk"
        MsgBox("International Shipments is now the active Script", "Script Has Changed!", "T2")
        
    }
else{

        If WinExist("International Shipments.ahk")
            {
                WinClose("International Shipments.ahk")
                run "DigiShipAutoDims v1.3.ahk"
                MsgBox("DigiShipAutoDims is now the active script", "Script Has Changed!","T2")
                
            }
    }
return
