;===================================================================================================================================================
;Program: CalcGrade.asm
;Programmer: Karigan Stewart
;Date: 04-02-2024

;Purpose: This program receives an integer value between 0 and 100 and returns the corresponding letter grade
;according to its score. 
;===================================================================================================================================================


.386
.model flat, stdcall
.stack 4096

INCLUDE Irvine32.inc

.data
scoreMin DWORD 50                                   ; Define Minimum Score (for comparison)
scoreMax DWORD 100                                  ; Define maximum score 
strScoreMsg BYTE "The integer score is: ", 0        ; Displays integer score
strGradeMsg BYTE "The letter grade is: ", 0         ; Displays coorspondng letter grade

.code
main PROC
    call Clrscr
    mov ecx, 10                             ; Initialize loop counter to 10

; LOOP TO GENERATE AND DISPLAY NUMBER
    l1:  
        mov eax, scoreMin                   ; load minimum score into eax
        mov ebx, scoreMax                   ; load max score into ebx
        dec ebx     
        sub ebx, eax                        ; calculates range from 0 to 100
        xchg ebx, eax                       ; exchanges values of ebx and eax
        call RandomRange                    ; Generates random number 50 - 100
        neg ebx                             ; Changes sign of ebx
        sub eax, ebx                        ; Defines the range by subtracting from eax
        mov edx, OFFSET strScoreMsg         ; Puts message in edx to display integer
        call WriteString                    ; Display Score Message
        call WriteInt                       ; Displays the random integer
        call crlf
        call CalcGrade                      ; calls CalcGrade to calculate the letter grade
        call crlf

;loops ubtil ecx becomes 0 (10 times)
    loop l1             

; Waits for user to press a key to end program
    call WaitMsg     
    
    exit
main ENDP

; GETS LETTER GRADE
CalcGrade PROC
    .IF eax >= 90           ; If random in it greater than or equal to 90
      mov al,'A'            ; Display "A" as letter grade
      
    .ELSEIF eax >= 80       ; If random in it greater than or equal to 80
      mov al,'B'            ; Display "B" as letter grade
        
    .ELSEIF eax >= 70       ; If random in it greater than or equal to 70
      mov al,'C'            ; Display "C" as letter grade

    .ELSEIF eax >= 60       ; If random in it greater than or equal to 60
      mov al,'D'            ; Display "D" as letter grade

    .ELSE                   ; anything lower than 60 (0-59), an "F" is displayed
      mov al,'F'
    .ENDIF
      
    mov edx,OFFSET strGradeMsg          ; Loads address of grade message
    call WriteString                    ; Displays the Grade Message
    call WriteChar                      ; Display Grade LETTER in AL
    call Crlf

; RETURN TO MAIN
    ret
    
CalcGrade ENDP

END main
