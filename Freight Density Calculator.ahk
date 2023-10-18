#Requires AutoHotkey v2.0
#SingleInstance Force
#Include Functions\Func.ahk

Kill := (*) => ExitApp()
; WinSetAlwaysOnTop -1, "Freight Density Calculator.ahk"

Calc := Gui(,"Freight Calculator")
Calc.BackColor := "c002451"
Calc.SetFont("s13 q5 c4ABDA1","Gill Sans MT")
    Calc.AddText("w50 center","Length")
    Calc.AddText("w50 x+10 ","Width")
    Calc.AddText("w50 x+10 ","Height")
    Calc.AddText("w50 x+10 ","Weight")

    Calc.SetFont("s12 c362FBA","Century Gothic")
    Calc.AddEdit("w54 h23 center vLength0 xs")
    Calc.AddEdit("w50 h23 center vWidth0 x+9")
    Calc.AddEdit("w53 h23 center vHeight0 x+12")
    Calc.AddEdit("w53 h23 center vWeight0 x+10")

    Calc.AddEdit("w54 h23 center vLength1 xs")
    Calc.AddEdit("w50 h23 center vWidth1 x+9")
    Calc.AddEdit("w53 h23 center vHeight1 x+12")
    Calc.AddEdit("w53 h23 center vWeight1 x+10")

    Calc.AddEdit("w54 h23 center vLength2 xs")
    Calc.AddEdit("w50 h23 center vWidth2 x+9")
    Calc.AddEdit("w53 h23 center vHeight2 x+12")
    Calc.AddEdit("w53 h23 center vWeight2 x+10")

    Calc.AddEdit("w54 h23 center vLength3 xs")
    Calc.AddEdit("w50 h23 center vWidth3 x+9")
    Calc.AddEdit("w53 h23 center vHeight3 x+12")
    Calc.AddEdit("w53 h23 center vWeight3 x+10")

    Calc.AddEdit("w54 h23 center vLength4 xs")
    Calc.AddEdit("w50 h23 center vWidth4 x+9")
    Calc.AddEdit("w53 h23 center vHeight4 x+12")
    Calc.AddEdit("w53 h23 center vWeight4 x+10")

    Calc.AddButton("x170 h26","Calculate").OnEvent("Click", CalculateFreight)
    Calc.OnEvent("Close", Kill)
Calc.Show()

CalculateFreight(*)
{
    ;Assign Variable names from GUI
    SkidDims := Calc.Submit()
    SkidLength0 := SkidDims.Length0
    SkidWidth0  := SkidDims.Width0
    SkidHeight0 := SkidDims.Height0
    SkidWeight0 := SkidDims.Weight0
    
    SkidLength1 := SkidDims.Length1
    SkidWidth1 := SkidDims.Width1
    SkidHeight1 := SkidDims.Height1
    SkidWeight1 := SkidDims.Weight1

    SkidLength2 := SkidDims.Length2
    SkidWidth2  := SkidDims.Width2
    SkidHeight2 := SkidDims.Height2
    SkidWeight2 := SkidDims.Weight2

    SkidLength3 := SkidDims.Length3
    SkidWidth3  := SkidDims.Width3
    SkidHeight3 := SkidDims.Height3
    SkidWeight3 := SkidDims.Weight3

    SkidLength4 := SkidDims.Length4
    SkidWidth4  := SkidDims.Width4
    SkidHeight4 := SkidDims.Height4
    SkidWeight4 := SkidDims.Weight4

    SkidDensity0 := ""
    SkidDensity1 := ""
    SkidDensity2 := ""
    SkidDensity3 := ""
    SkidDensity4 := ""


    Results := Gui(,"Freight Class Calculator") ;Begin GUI for results
    Results.BackColor := "c002451"
    Results.SetFont("bold s12 c4ABDA1", "Arial Rounded MT")
    Results.AddText("w50 center","Length")
    Results.AddText("w50 x+10 ","Width")
    Results.AddText("w50 x+10 ","Height")
    Results.AddText("w50 x+10 ","Weight")
    Results.AddText("x+25 ","NMFC")
    Results.AddText("x+25","Class")
    Results.SetFont("","Arial Rounded MT")
    ;Make Calculations
    If SkidWeight0 != "" ;If SkidWeight has been assigned, do calculation
        {
            CubicFeet0 := (SkidLength0 * SkidWidth0 * SkidHeight0 / 1728)
            SkidDensity0 := SkidWeight0 / CubicFeet0
            switch ;Evaluate Skid 0
            {
            case (SkidDensity0 < 1):
                NMFC0 := "176050 01"
                Class0 := 400
            case (SkidDensity0 >= 1 and SkidDensity0 < 2):
                NMFC0 := "176050 02"
                Class0 := 300
            case (SkidDensity0 >= 2 and SkidDensity0 < 4):
                NMFC0 := "176050 03"
                Class0 := 250
            case (SkidDensity0 >= 4 and SkidDensity0 < 6):
                NMFC0 := "176050 04"
                Class0 := 150
            case (SkidDensity0 >= 6 and SkidDensity0 < 8):
                NMFC0 := "176050 05"
                Class0 := 125
            case (SkidDensity0 >= 8 and SkidDensity0 < 10):
                NMFC0 := "176050 06"
                Class0 := 100
            case (SkidDensity0 >= 10 and SkidDensity0 < 12):
                NMFC0 := "176050 07"
                Class0 := 92.5
            case (SkidDensity0 >= 12 and SkidDensity0 < 15):
                NMFC0 := "176050 08"
                Class0 := 85
            case (SkidDensity0 > 15):
                NMFC0 := "176050 09"
                Class0 := 70
            }
            Results.AddText("w50 center xs", SkidLength0)
            Results.AddText("w50 center x+10 ", SkidWidth0)
            Results.AddText("w50 center x+10 ", SkidHeight0)
            Results.AddText("w50 center x+20 ", SkidWeight0)
            Results.AddText("x+10",NMFC0 "   " Class0)
        }
    If SkidWeight1 != ""
        {
            CubicFeet1 := (SkidLength1 * SkidWidth1 * SkidHeight1 / 1728)
            SkidDensity1 := SkidWeight1 / CubicFeet1
            switch ;Evaluate Skid 1
            {
                case (SkidDensity1 < 1):
                    NMFC1 := "176050 01"
                    Class1 := 400
                case (SkidDensity1 >= 1 and SkidDensity1 < 2):
                    NMFC1 := "176050 02"
                    Class1 := 300
                case (SkidDensity1 >= 2 and SkidDensity1 < 4):
                    NMFC1 := "176050 03"
                    Class1 := 250
                case (SkidDensity1 >= 4 and SkidDensity1 < 6):
                    NMFC1 := "176050 04"
                    Class1 := 150
                case (SkidDensity1 >= 6 and SkidDensity1 < 8):
                    NMFC1 := "176050 05"
                    Class1 := 125
                case (SkidDensity1 >= 8 and SkidDensity1 < 10):
                    NMFC1 := "176050 06"
                    Class1 := 100
                case (SkidDensity1 >= 10 and SkidDensity1 < 12):
                    NMFC1 := "176050 07"
                    Class1 := 92.5
                case (SkidDensity1 >= 12 and SkidDensity1 < 15):
                    NMFC1 := "176050 08"
                    Class1 := 85
                case (SkidDensity1 > 15):
                    NMFC1 := "176050 09"
                    Class1 := 70
            }
            Results.AddText("w50 center xs", SkidLength1)
            Results.AddText("w50 center x+10 ", SkidWidth1)
            Results.AddText("w50 center x+10 ", SkidHeight1)
            Results.AddText("w50 center x+20 ", SkidWeight1)
            Results.AddText("x+10",NMFC1 "   " Class1)
        }
    If SkidWeight2 != ""
        {
            CubicFeet2 := (SkidLength2 * SkidWidth2 * SkidHeight2 / 1728)
            SkidDensity2 := SkidWeight2 / CubicFeet2
            switch ;Evaluate Skid 2
            {
                case (SkidDensity2 < 1):
                    NMFC2 := "176050 01"
                    Class2 := 400
                case (SkidDensity2 >= 1 and SkidDensity2 < 2):
                    NMFC2 := "176050 02"
                    Class2 := 300
                case (SkidDensity2 >= 2 and SkidDensity2 < 4):
                    NMFC2 := "176050 03"
                    Class2 := 250
                case (SkidDensity2 >= 4 and SkidDensity2 < 6):
                    NMFC2 := "176050 04"
                    Class2 := 150
                case (SkidDensity2 >= 6 and SkidDensity2 < 8):
                    NMFC2 := "176050 05"
                    Class2 := 125
                case (SkidDensity2 >= 8 and SkidDensity2 < 10):
                    NMFC2 := "176050 06"
                    Class2 := 100
                case (SkidDensity2 >= 10 and SkidDensity2 < 12):
                    NMFC2 := "176050 07"
                    Class2 := 92.5
                case (SkidDensity2 >= 12 and SkidDensity2 < 15):
                    NMFC2 := "176050 08"
                    Class2 := 85
                case (SkidDensity2 > 15):
                    NMFC2 := "176050 09"
                    Class2 := 70
            }
            Results.AddText("w50 center xs", SkidLength2)
            Results.AddText("w50 center x+10 ", SkidWidth2)
            Results.AddText("w50 center x+10 ", SkidHeight2)
            Results.AddText("w50 center x+20 ", SkidWeight2)
            Results.AddText("x+10",NMFC2 "   " Class2)
        }
    If SkidWeight3 != ""
        {
            CubicFeet3 := (SkidLength3 * SkidWidth3 * SkidHeight3 / 1728)
            SkidDensity3 := SkidWeight3 / CubicFeet3
            switch ;Evaluate Skid 3
            {
                case (SkidDensity3 < 1):
                    NMFC3 := "176050 01"
                    Class3 := 400
                case (SkidDensity3 >= 1 and SkidDensity3 < 2):
                    NMFC3 := "176050 02"
                    Class3 := 300
                case (SkidDensity3 >= 2 and SkidDensity3 < 4):
                    NMFC3 := "176050 03"
                    Class3 := 250
                case (SkidDensity3 >= 4 and SkidDensity3 < 6):
                    NMFC3 := "176050 04"
                    Class3 := 150
                case (SkidDensity3 >= 6 and SkidDensity3 < 8):
                    NMFC3 := "176050 05"
                    Class3 := 125
                case (SkidDensity3 >= 8 and SkidDensity3 < 10):
                    NMFC3 := "176050 06"
                    Class3 := 100
                case (SkidDensity3 >= 10 and SkidDensity3 < 12):
                    NMFC3 := "176050 07"
                    Class3 := 92.5
                case (SkidDensity3 >= 12 and SkidDensity3 < 15):
                    NMFC3 := "176050 08"
                    Class3 := 85
                case (SkidDensity3 > 15):
                    NMFC3 := "176050 09"
                    Class3 := 70
            }
            Results.AddText("w50 center xs", SkidLength3)
            Results.AddText("w50 center x+10 ", SkidWidth3)
            Results.AddText("w50 center x+10 ", SkidHeight3)
            Results.AddText("w50 center x+20 ", SkidWeight3)
            Results.AddText("x+10",NMFC3 "   " Class3)
        }
    If SkidWeight4 !=""
        {
            CubicFeet4 := (SkidLength4 * SkidWidth4 * SkidHeight4 / 1728)
            SkidDensity4 := SkidWeight4 / CubicFeet4
            switch ;Evaluate Skid 4
            {
                case (SkidDensity4 < 1):
                    NMFC4 := "176050 01"
                    Class4 := "400"
                case (SkidDensity4 >= 1 and SkidDensity4< 2):
                    NMFC4 := "176050 02"
                    Class4 := "300"
                case (SkidDensity4 >= 2 and SkidDensity4 < 4):
                    NMFC4 := "176050 03"
                    Class4 := "250"
                case (SkidDensity4 >= 4 and SkidDensity4 < 6):
                    NMFC4 := "176050 04"
                    Class4 := "150"
                case (SkidDensity4 >= 6 and SkidDensity4 < 8):
                    NMFC4 := "176050 05"
                    Class4 := "125"
                case (SkidDensity4 >= 8 and SkidDensity4 < 10):
                    NMFC4 := "176050 06"
                    Class4 := "100"
                case (SkidDensity4 >= 10 and SkidDensity4 < 12):
                    NMFC4 := "176050 07"
                    Class4 := "92.5"
                case (SkidDensity4 >= 12 and SkidDensity4 < 15):
                    NMFC4 := "176050 08"
                    Class4 := "85"
                case (SkidDensity4 > 15):
                    NMFC4 := "176050 09"
                    Class4 := "70"
            }
            Results.AddText("w50 center xs", SkidLength4)
            Results.AddText("w50 center x+10 ", SkidWidth4)
            Results.AddText("w50 center x+10 ", SkidHeight4)
            Results.AddText("w50 center x+20 ", SkidWeight4)
            Results.AddText("x+10",NMFC4 "   " Class4)
        }
        
        ;Initialize Variables
       
    switch ;add skids which were in fact entered
    {
        case (SkidDensity0 != "" and SkidDensity1 = "" and SkidDensity2 = "" and SkidDensity3 = "" and SkidDensity4 =""):
            DensityFinal := SkidWeight0 / CubicFeet0
            TotalWeight := SkidWeight0

        case (SkidDensity0 != "" and SkidDensity1 != "" and SkidDensity2 = "" and SkidDensity3 = "" and SkidDensity4 =""):
            CubicFeet := CubicFeet0 + CubicFeet1
            TotalWeight := SkidWeight0 + SkidWeight1
            DensityFinal := TotalWeight / CubicFeet
                   
        case (SkidDensity0 != "" and SkidDensity1 != "" and SkidDensity2 != "" and SkidDensity3 = "" and SkidDensity4 =""):
            CubicFeet := CubicFeet0 + CubicFeet1 + CubicFeet2
            TotalWeight := SkidWeight0 + SkidWeight1 + SkidWeight2
            DensityFinal := TotalWeight / CubicFeet

        case (SkidDensity0 != "" and SkidDensity1 != "" and SkidDensity2 != "" and SkidDensity3 != "" and SkidDensity4 =""):
            CubicFeet := CubicFeet0 + CubicFeet1 + CubicFeet2 + CubicFeet3
            TotalWeight := SkidWeight0 + SkidWeight1 + SkidWeight2 + SkidWeight3
            DensityFinal := TotalWeight / CubicFeet

        case (SkidDensity0 != "" and SkidDensity1 != "" and SkidDensity2 != "" and SkidDensity3 != "" and SkidDensity4 !=""):
            CubicFeet := CubicFeet0 + CubicFeet1 + CubicFeet2 + CubicFeet3 + CubicFeet4
            TotalWeight := SkidWeight0 + SkidWeight1 + SkidWeight2 + SkidWeight3 + SkidWeight4
            DensityFinal := TotalWeight / CubicFeet
                
    }
    switch ;Evaluate Final Density
            {
                case (DensityFinal < 1):
                    NMFCFINAL := "176050 01"
                    ClassFinal := 400
                case (DensityFinal >= 1 and DensityFinal < 2):
                    NMFCFINAL := "176050 02"
                    ClassFinal := 300
                case (DensityFinal >= 2 and DensityFinal < 4):
                    NMFCFINAL := "176050 03"
                    ClassFinal := 250
                case (DensityFinal >= 4 and DensityFinal < 6):
                    NMFCFINAL := "176050 04"
                    ClassFinal := 150
                case (DensityFinal >= 6 and DensityFinal < 8):
                    NMFCFINAL := "176050 05"
                    ClassFinal := 125
                case (DensityFinal >= 8 and DensityFinal < 10):
                    NMFCFINAL := "176050 06"
                    ClassFinal := 100
                case (DensityFinal >= 10 and DensityFinal < 12):
                    NMFCFINAL := "176050 07"
                    ClassFinal := 92.5
                case (DensityFinal >= 12 and DensityFinal < 15):
                    NMFCFINAL := "176050 08"
                    ClassFinal := 85
                case (DensityFinal > 15):
                    NMFCFINAL := "176050 09"
                    ClassFinal := 70
            }
        

    Results.AddText("xm+90 ","Total Weight: " TotalWeight)
    Results.AddEdit("x+20",NMFCFinal)
    Results.AddEdit("X+10", ClassFinal)
    Results.Show()

    
    Sleep 200
    A_Clipboard := NMFCFinal
    WinSetAlwaysOnTop 1, "Freight Class Calculator"

    Return
    }