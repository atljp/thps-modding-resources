
script GetGap 
    StartGap GapID = GetGap_DefaultID flags = <flags> TrickText = <TrickText> TrickScript = <TrickScript>
    endgap GapID = GetGap_DefaultID Score = <Score> text = <text> gapscript = <gapscript>
endscript

script Gap_Gen_Rail2Rail 
    Gap_Gen_RailHop <...> 
endscript

script Gap_Gen_Ledge2Ledge 
    Gap_Gen_LedgeHop <...> 
endscript

script Gap_Gen_Rail2Ledge 
    if GotParam \{ start }
        Gap_Gen_Rail <...> 
    else
        Gap_Gen_End GapID = <GapID> text = 'Rail 2 Ledge' Score = 50 <...> 
    endif
endscript

script Gap_Gen_Rail2Bench 
    if GotParam \{ start }
        Gap_Gen_Rail <...> 
    else
        Gap_Gen_End GapID = <GapID> text = 'Z raila na ³awkê' Score = 50 <...> 
    endif
endscript

script Gap_Gen_Ledge2Rail 
    if GotParam \{ start }
        Gap_Gen_Rail <...> 
    else
        Gap_Gen_End GapID = <GapID> text = 'Ledge 2 Rail' Score = 50 <...> 
    endif
endscript

script Gap_Gen_Ledge2Bench 
    if GotParam \{ start }
        Gap_Gen_Rail <...> 
    else
        Gap_Gen_End GapID = <GapID> text = 'Z pó³ki na ³awkê' Score = 50 <...> 
    endif
endscript

script Gap_Gen_Wire2Ledge 
    if GotParam \{ start }
        Gap_Gen_Rail <...> 
    else
        Gap_Gen_End GapID = <GapID> text = 'Z drutów na pó³kê' Score = 50 <...> 
    endif
endscript

script Gap_Gen_Bench2Rail 
    if GotParam \{ start }
        Gap_Gen_Rail <...> 
    else
        Gap_Gen_End GapID = <GapID> text = 'Od ³awki do raila' Score = 50 <...> 
    endif
endscript

script Gap_Gen_Bench2Ledge 
    if GotParam \{ start }
        Gap_Gen_Rail <...> 
    else
        Gap_Gen_End GapID = <GapID> text = 'Bench 2 Ledge' Score = 50 <...> 
    endif
endscript

script Gap_Gen_WireHop 
    if GotParam \{ start }
        Gap_Gen_Rail <...> 
    else
        Gap_Gen_End GapID = <GapID> text = 'Wire hop' Score = 25 <...> 
    endif
endscript

script Gap_Gen_BenchHop 
    if GotParam \{ start }
        Gap_Gen_Rail <...> 
    else
        Gap_Gen_End GapID = <GapID> text = 'Bench hop' Score = 25 <...> 
    endif
endscript

script Gap_Gen_RailHop 
    if GotParam \{ start }
        Gap_Gen_Rail <...> 
    else
        Gap_Gen_End GapID = <GapID> text = 'Rail hop' Score = 25 <...> 
    endif
endscript

script Gap_Gen_LedgeHop 
    if GotParam \{ start }
        Gap_Gen_Rail <...> 
    else
        Gap_Gen_End GapID = <GapID> text = 'Ledge hop' Score = 25 <...> 
    endif
endscript

script Gap_Gen_AcrossTheStreet 
    if GotParam \{ start }
        Gap_Gen_Rail <...> 
    else
        Gap_Gen_End GapID = <GapID> text = 'Przez ulicê' Score = 50 <...> 
    endif
endscript

script Gap_Gen_HighLip 
    if GotParam \{ start }
        StartGap {
            GapID = <GapID>
            flags = [
                REQUIRE_LIP
                CANCEL_GROUND
                CANCEL_WALL
                CANCEL_MANUAL
                CANCEL_RAIL
                CANCEL_WALLPLANT
                CANCEL_HANG
                CANCEL_LADDER
            ]
            <...> 
        }
    else
        wait \{ 1 frame }
        Gap_Gen_End GapID = <GapID> text = 'High lip' Score = 100 <...> 
    endif
endscript

script Gap_Gen_RampTransfer 
    if GotParam \{ start }
        StartGap {
            GapID = <GapID>
            flags = PURE_AIR
            <...> }
    else
        Gap_Gen_End GapID = <GapID> text = 'Transfer miêdzy rampami' Score = 100 <...> 
    endif
endscript

script Gap_Gen_Rail 
    if GotParam start
        StartGap {
            GapID = <GapID>
            flags = [
                CANCEL_GROUND
                CANCEL_MANUAL
                CANCEL_WALL
                CANCEL_LIP
                CANCEL_WALLPLANT
                CANCEL_HANG
                CANCEL_LADDER
            ]
            <...> 
        }
    else
        if GotParam end
            Gap_Gen_End GapID = <GapID> text = <text> Score = <Score> <...> 
        else
            printf '### NO GAP TYPE SET FOR ID %g.  MUST BE START OR END ###' g = <GapID>
        endif
    endif
endscript

script Gap_Gen_Lip 
    if GotParam start
        StartGap {
            GapID = <GapID>
            flags = [
                REQUIRE_LIP
                CANCEL_GROUND
                CANCEL_WALL
                CANCEL_MANUAL
                CANCEL_RAIL
                CANCEL_WALLPLANT
                CANCEL_HANG
                CANCEL_LADDER
            ]
            <...> 
        }
    else
        if GotParam end
            wait 1 frame
            endgap {
                GapID = <GapID>
                text = <text>
                Score = <Score>
            }
        else
            printf '### NO GAP TYPE SET FOR ID %g.  MUST BE START OR END ###' g = <GapID>
        endif
    endif
endscript

script Gap_Gen_Transfer 
    if GotParam \{ start }
        StartGap {
            GapID = <GapID>
            flags = PURE_AIR
            <...> 
        }
    else
        if GotParam \{ end }
            Gap_Gen_End GapID = <GapID> text = <text> Score = <Score> <...> 
        else
            printf '### NO GAP TYPE SET FOR ID %g.  MUST BE START OR END ###' g = <GapID>
        endif
    endif
endscript

script Gap_Gen_PureAir 
    if GotParam \{ start }
        StartGap {
            GapID = <GapID>
            flags = PURE_AIR
            <...> 
        }
    else
        if GotParam \{ end }
            Gap_Gen_End GapID = <GapID> text = <text> Score = <Score> <...> 
        else
            printf '### NO GAP TYPE SET FOR ID %g.  MUST BE START OR END ###' g = <GapID>
        endif
    endif
endscript

script Gap_Gen_Manual 
    if GotParam \{ start }
        StartGap {
            GapID = <GapID>
            flags = PURE_MANUAL
            <...> 
        }
    else
        if GotParam \{ end }
            Gap_Gen_End GapID = <GapID> text = <text> Score = <Score> <...> 
        else
            printf '### NO GAP TYPE SET FOR ID %g.  MUST BE START OR END ###' g = <GapID>
        endif
    endif
endscript

script Gap_Gen_End 
    if GotParam \{ end }
        endgap {
            GapID = <GapID>
            text = <text>
            Score = <Score>
            <...> 
        }
    else
        printf '### NO GAP TYPE SET FOR ID %g.  MUST BE START OR END ###' g = <GapID>
    endif
endscript

script Gap_CarHop \{ gapscript = CarHopGapScript }
    StartGap {GapID = <StartGapID> flags = PURE_AIR}
    endgap {GapID = <EndGapID> text = 'Car hop' Score = 100 gapscript = <gapscript>}
endscript

script CarHopGapScript 
    broadcastevent \{ type = SkaterCarHop }
endscript

script LipGap1 
    Gap_Gen_HighLip <...> 
endscript

script LedgeGap1 
    Gap_Gen_Ledge2Ledge <...> 
endscript

script LedgeGap2 
    Gap_Gen_Ledge2Ledge <...> 
endscript

script LedgeGap3 
    Gap_Gen_Ledge2Ledge <...> 
endscript

script LedgeGap4 
    Gap_Gen_Ledge2Ledge <...> 
endscript

script LedgeGap5 
    Gap_Gen_Ledge2Ledge <...> 
endscript

script RailHop1 
    Gap_Gen_RailHop <...> 
endscript

script RailHop2 
    Gap_Gen_RailHop <...> 
endscript

script RampTransfer1 
    Gap_Gen_RampTransfer <...> 
endscript

script Rail2Ledge1 
    Gap_Gen_Rail2Ledge <...> 
endscript

script Rail2Ledge2 
    Gap_Gen_Rail2Ledge <...> 
endscript

script RampTransfer2 
    Gap_Gen_RampTransfer <...> 
endscript

script RampTransfer3 
    Gap_Gen_RampTransfer <...> 
endscript

script RampTransfer4 
    Gap_Gen_RampTransfer <...> 
endscript

script RampTransfer5 
    Gap_Gen_RampTransfer <...> 
endscript

script HighLip1 
    Gap_Gen_HighLip <...> 
endscript

script BenchHop1 
    Gap_Gen_BenchHop <...> 
endscript

script BenchHop2 
    Gap_Gen_BenchHop <...> 
endscript

script BenchHop3 
    Gap_Gen_BenchHop <...> 
endscript

script Bench2Rail1 
    Gap_Gen_Bench2Rail <...> 
endscript

script Bench2Rail2 
    Gap_Gen_Bench2Rail <...> 
endscript

script Bench2Rail3 
    Gap_Gen_Bench2Rail <...> 
endscript

script WireHop1 
    Gap_Gen_WireHop <...> 
endscript

script RailGap1 
    Gap_Gen_RailHop <...> 
endscript

script RailGap2 
    Gap_Gen_RailHop <...> 
endscript
