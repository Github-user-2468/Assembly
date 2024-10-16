;Program Summing the Gaps
:Programmer: Karigan Stewart
;Date: 2-22-24
;Purpose: This program acesses an non-decending array and sums the gaps into a total variable 
;Inputs : N/A
;Outputs: N/A
;=================================================================================

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode: dword

.data
    dwarray dword 2, 5, 9, 10     ; variables in array 
    count equ 4                   ;Size of array; used as counter variable for loop
    total dword 0                 ;Holds total of calculated sum 

.code
main proc
    mov esi, OFFSET dwarray      ;Moves array into esi register
    mov ecx, count               ;Moves count into ecx register

L1:                     ;Loop to calc sum
    mov eax, [esi]      ;Moves array held in esi register to eax register 
    add esi, 4          ;Increments array value (4 since doubleword label is used)  
    sub eax, [esi]      ;Subtracts array value from eax register
    add total, eax      ;Adds value of eax into total

    loop L1       ;ends loop when = to 0

    invoke ExitProcess, 0
main endp
end main

