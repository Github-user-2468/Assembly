;===================================================================================================================================================
;Program: Greatest_Common.asm
;Programmer: Karigan Stewart
;Date: 04-18-24

;Purpose: This program calculates the greatest common divisor (GCD) of two integers. 
;===================================================================================================================================================

.386
.model flat, stdcall
.stack 4096

INCLUDE Irvine32.inc

.data
prompt1 BYTE "Enter the first integer: ", 0                        ; Asks user for the first integer
prompt2 BYTE "Enter the second integer: ", 0                       ; Asks user for second integer
resultMsg BYTE "The greatest common divisor (GCD) is: ", 0
newline BYTE 0dh, 0ah, 0                                           ; Goes to a new line

.code
main PROC
    call Clrscr
    
; Get the first integer
    mov edx, OFFSET prompt1     ; Asks the user for the first number
    call WriteString
    call ReadInt
    mov eax, ebx                ; Move the input value to eax
    
 ; Get the second integer
    mov edx, OFFSET prompt2     ; Aks the user for the second integer
    call WriteString
    call ReadInt
    mov ebx, eax                ; Move the input value to ebx
    
; Call the GCD function
    call CalculateGCD           ; Calculate GCD
    call DisplayResult          ; Display result
    
    exit
main ENDP


; Function to calculate the greatest common divisor (GCD)
CalculateGCD PROC
    push ebx            ; Preserve ebx
    
    mov edx, 0          ; Initialize remainder to 0
    
; Calculates GCD
    gcdLoop:
        cmp ebx, 0      ; Check if ebx is zero
        je gcdDone      ; If zero, go to done
        
        div ebx         ; Divide eax by ebx, and put remainder in edx
        xchg eax, ebx   ; Swaps eax and ebx makes sure ebx contains remainder
        jmp gcdLoop     ; Repeat loop
    
    gcdDone:
    mov eax, edx       ; Move the result (remainder) to eax
    pop ebx            ; Restore ebx
    ret                ; Returns to main function

CalculateGCD ENDP

; Procedure to display the result
DisplayResult PROC
    mov edx, OFFSET resultMsg  ; Puts message displaying result into edx
    call WriteString           ; Display result message
    
    mov edx, eax               ; Move GCD result to edx
    call WriteInt              ; Display GCD result
    mov edx, OFFSET newline    ; Move to the next line
    call WriteString           ; Display newline
    
    ret
DisplayResult ENDP

END main


