;===================================================================================================================================================
;Program: Final.asm
;Programmer: Karigan Stewart
;Date: 03-18-24

;Purpose: This program is to ask the user for two integer numbers and will calculate and display the sum of the two numbers. The program will
;loop this process 3 times (when ecx reaches 0)
;===================================================================================================================================================

.386
.model flat,stdcall
.stack 4096

INCLUDE Irvine32.inc

.data
firstInt BYTE "Enter the first integer:   (and press ENTER) ",0                ; asks user to enter the first integer addend
secondInt BYTE "Enter the second integer:  (and press ENTER) ",0               ; asks user to enter the second integer addend
sumMsg BYTE "The sum is: ",0                                                   ; message outputs sum
count DWORD 3 ; loop counter

.code
main PROC

; set up the loop
    mov ecx, count                      ; initialize the loop counter
    L1:                                 ; loop label
    
; clear the screen
    call Clrscr
    
; Set cursor near the middle of the screen                              
    mov edx, 12                         ; Row
    mov ecx, 30                         ; Column
    call Gotoxy                         ; Function goes to specified column and row location
    
; prompt the user for the first integer
    mov edx, OFFSET firstInt    
    call WriteString                        ; Displays the message asking for the FIRST integer
    call ReadInt
    mov ebx, eax                            ; store the first integer in ebx
    
; prompt the user for the second integer
    mov edx, OFFSET secondInt               ; Displays the message asking for the SECOND integer
    call WriteString
    call ReadInt
    mov ecx, eax                            ; store the second integer in ecx
    
; add the integers and display the sum
    add ebx, ecx                            ; add ebx and ecx and store the result in ebx
    mov edx, OFFSET sumMsg                  ; Writes a message displaying sum
    call WriteString
    mov eax, ebx                            ; move the sum to eax
    call WriteInt                           ; Writes sum of the two numbers 
    
; decrement the loop counter and repeat the loop
    dec count

    loop L1  ;loop ends when ecx register reaches 0

exit
main endp
end main
