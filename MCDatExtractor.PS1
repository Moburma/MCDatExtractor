#Magic Carpet DAT/TAB Creator by Moburma

#VERSION 1.0
#LAST MODIFIED: 18/03/2023

<#
.SYNOPSIS
   This script can extract the individual levels from Magic Carpet LEVELS.DAT and LEVELS.TAB files. This is required to edit and otherwise 
   poke around in them, and actually doesn't help if you want to play them. The exception to this is if you want to play levels beyond
   127 in Magic Carpet 2, if you extract all the levels with this tool, you can play them in the fan project REMC2 using its
   --custom_level argument if you feed it the full path to the individual level file.
   

.DESCRIPTION    
    This script has no parameters, just run it in a directory with ALL the .DAT files from the LEVELS directory of any Magic Carpet game release
    Note this does NOT extract image .DAT/TAB formats, they work differently. Only levels!
    For Hidden Worlds, rename the DDLEVELS files to just LEVELS.DAT/TAB or change the variable looked for by the $levfile and $tabfile lines below

.RELATED LINKS
    
    Magic Carpet 2 HD/REMC2: https://github.com/thobbsinteractive/magic-carpet-2-hd
    
#>


function convert32bitint($tBytes) {
   
    $converbytes32 = [byte[]]($tBytes)
    $converted32 =[bitconverter]::ToUInt32($converbytes32,0)
        
    return $converted32
        
 }

    #Define Header for DAT file
    $levfile = Get-Content "LEVELS.DAT" -Encoding Byte -ReadCount 0
    $tabFile = Get-Content "LEVELS.TAB" -Encoding Byte -ReadCount 0
    
    $levelcount = 0  
    $tPos = 0

    DO{   # Script is hardcoded to only extract 200 levels. MC2 has this many, but dat/tab supports up to 1000 in theory, just change the number at the end of the DO loop below
    
       $fSegment1 =  convert32bitint($tabFile[$tPos..($tPos+3)])
       #write-host $fSegment1
       $fSegment2 =  convert32bitint($tabFile[($tPos+4)..($tPos+7)])
       #write-host $fSegment2
       $fSegment2 = $fSegment2 - 1

    
        if ($levelcount -lt 10){
            $oFName = "LEV0000$levelcount.DAT"

        }

        Elseif ($levelcount -lt 100){
            $oFName = "LEV000$levelcount.DAT"

        }
        Elseif ($levelcount -gt 100){
            $oFName = "LEV00$levelcount.DAT"

        }

    Set-Content $oFName -Value $levfile[$fsegment1..$fsegment2] -Encoding Byte
    write-host "Writing file $ofname"

    $levelcount = $levelcount + 1
    $tpos = $tpos + 4
    
    
    }UNTIL ($levelcount -eq 201)
    
    
    