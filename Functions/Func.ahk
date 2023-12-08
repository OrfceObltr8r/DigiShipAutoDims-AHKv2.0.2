#Requires AutoHotkey v2
RegCopy()   { ;copies whatever is selected at the time
            Send "{Ctrl Down}"
            Send "{c}"
            Send "{Ctrl Up}"
            }
LineClear() { ;deletes entire line behind cursor position
            Send "{Ctrl Down}"
            Send "{Shift Down}"
            Send "{left}"
            Send "{Shift Up}"
            Send "{Ctrl Up}"
            Send "{Del}"
            }

OrderCopy() { ;selects word in front of cursor and copies it
            Send "{Ctrl Down}"
            Send "{Shift Down}"
            Send "{right}"
            Send "{Shift Up}"
            Send "{c}"
            Send "{Ctrl Up}"
            }


OrderCut() { ; selects word in front of cursor and cuts into clipboard
            Send "{Ctrl Down}"
            Send "{Shift Down}"
            Send "{right}"
            Send "{Shift Up}"
            Send "{x}"
            Send "{Ctrl Up}"
            }


ClipboardPaste(){
                Send "^{v}"
                }

RetryDimensions(Length, Width, Height){
                Click 597, 439, "left"
                sleep 200
                send "{tab 3}"
                    send Length
                Send "{tab}"
                    Send Width		;width variable
                send "{tab}"
                    send Height		;height variable
                send "{tab 3}"
                    send "{enter}"
    }

ProcessParcel(Date, Weight, Length, Width, Height) {
                Send "{tab 17}"
                    Send Date		;Ship Date as MM/DD/YYYY / leave blank if you wish to used today's date
                Send "{Tab 4}"
                Sleep 200
                    Send Weight		;weight variable / leave blank if you are weighing a box
                Sleep 300
                loop 3{
                    send "{tab}"
                    sleep 150
                }
                    Send Length		;length variable
                Send "{tab}"
                    Send Width		;width variable
                Send "{tab}"
                    Send Height		;height variable
                send "{tab}"
                sleep 300
                    CoordMode "mouse", "Screen" 
                    Click 948, 482, "left" ;Click off autofill window
                    sleep 200
                    Click 920, 530, "left"  ;Click Accept all notes
                    sleep 400
                send "{enter}"		;final ship button, comment this line out if you need to verify function
                }

ProcessDoubleShip(Date, Weight, Length, Width, Height, Weight2, Length2, Width2, Height2) {
                    Send "{tab 17}"
                        Send Date		;Ship Date as MM/DD/YYYY / leave blank if you wish to used today's date
                    Send "{Tab 2}"
                        SendText "2"			;enter number of packages in your shipment
                    Send "{tab 2}"
                        Send Weight		;weight variable / leave blank if you are weighing a box
                    send "{tab 3}"
                        Send Length		;length variable
                    Send "{tab}"
                        Send Width		;width variable
                    send "{tab}"
                        Send Height		;height variable
                    sleep 150
                        CoordMode "mouse", "Screen" ;This clicks accept all notes before shipping [BEWARE OF UNCORRECTED ERRORS!]
                        Click 920, 530, "left"
                    sleep 400
                    send "{tab 3}"
                    sleep 350
                    send "{enter}"		;final ship button, comment this line out if you need to verify function
                    Sleep 3000				
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

    Kill := (*) => ExitApp()


ProcessInternational(Date, Weight, Length, Width, Height, Acct){
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