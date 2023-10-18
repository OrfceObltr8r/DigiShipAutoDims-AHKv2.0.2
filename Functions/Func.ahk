#Requires AutoHotkey v2
RegCopy()   {
            Send "{Ctrl Down}"
            Send "{c}"
            Send "{Ctrl Up}"
            }
LineClear() {
            Send "{Ctrl Down}"
            Send "{Shift Down}"
            Send "{left}"
            Send "{Shift Up}"
            Send "{Ctrl Up}"
            Send "{Del}"
        }

OrderCopy() {
            Send "{Ctrl Down}"
            Send "{Shift Down}"
            Send "{right}"
            Send "{Shift Up}"
            Send "{c}"
            Send "{Ctrl Up}"
            
            }


OrderCut() {              
            Send "{Ctrl Down}"
            Send "{Shift Down}"
            Send "{right}"
            Send "{Shift Up}"
            Send "{x}"
            Send "{Ctrl Up}"
            }


ClipboardPaste(){
                Send "{Ctrl Down}"
                Send "{v}"
                Send "{Ctrl Up}"
                }


ProcessParcel(Date, Weight, Length, Width, Height) {
                Send "{tab 17}"
                    Send Date		;Ship Date as MM/DD/YYYY / leave blank if you wish to used today's date
                Send "{Tab 4}"
                    Send Weight		;weight variable / leave blank if you are weighing a box
                Send "{tab 3}"
                    Send Length		;length variable
                Send "{tab}"
                    Send Width		;width variable
                send "{tab}"
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
