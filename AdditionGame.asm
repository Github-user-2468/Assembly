;===================================================================================================================================================
;Program: Final.asm
;Programmer: Karigan Stewart
;Date: 03-18-24

;Purpose: This program is to display two random number and caluclate the sum. It will them prompt the user for input and will compare the user sum
;with the calculated sum and will ouput whether the user was correct or incorrect
;===================================================================================================================================================


.386
.model flat,stdcall
.stack 4096

INCLUDE Irvine32.inc

.data
msg1 BYTE "What is sum of these two integers? ", 0                           ; Display message asking for first sum of 2 randomized integers
plusSign BYTE " + ", 0                                                       ; Plus sign operator seperating two random integers
equalSign BYTE " = ", 0                                                      ; Equal sign operator 
correctMsg BYTE "Correct! You are awesome!", 0dh, 0ah, 0                     ; Displays message when the users input answer is the SAME(CORRECT) from calculated sum
incorrectMsg BYTE "Incorrect. You got this, try again", 0dh, 0ah, 0          ; Displays message when the users input answer is DIFFERS from calculated sum


.code
main PROC
    
    call Randomize   ; Initialize the random number engine
    mov eax, 1000     ; Set the desired range

    call Clrscr     ;clears screen

 ; Set cursor near the middle of the screen                              
    mov edx, 12                        ; Row
    mov ecx, 30                        ; Column
    call Gotoxy                        ; Function goes to specified column and row location


 ; Generates first random number
    call RandomRange                  ; Calls Irvine32 function RandomRange to generate first addend
    mov ebx, eax                      ; Store the first number in EBX


 ; Displays the string question of msg1 using Irvine32 WriteString
    mov edx, OFFSET msg1
    call WriteString

    mov eax, ebx                      ; Move the first number back into eax in order to display the integer 
    call WriteDec                     ; Displays the first integer number 


 ; Display + sign using Irvine32 WriteString
    mov edx, OFFSET plusSign
    call WriteString


 ; Generates second random number which will be stored in eax register 
    call RandomRange                ; Calls Irvine32 function RandomRange to generate first addend
                                     

 ; Display the second number using Irvine32 WriteDec
    call WriteDec


 ; Display = sign using Irvine32 WriteString
    mov edx, OFFSET equalSign
    call WriteString                        


 ; Calculate the sum of the two numbers
    add eax, ebx                            ; calculates the sum by adding the ebx register ( second integer) into the eax register (first integer)


 ; Save the result for comparison 
    push eax                                ; Push the sum onto the stack for comparing correct answer to users answer which free eax register


 ; Ask the user to input the answer
    call ReadInt                            ; Read user's answer into the eax register


 ; Compare the user's answer with the correct sum
    pop ebx 				                 ; Pop the correct sum back into EBX for comparison
    cmp eax, ebx 	                         ; Compare the user's answer which is in eax with the CORRECT sum in ebx


; If user is CORRECT jump to correctAnswer answer
    je correctAnswer

; if user is INCORRECT jump to incorrectAnswer 
    jne incorrectAnswer


correctAnswer:                              ; User was CORRECT
    mov edx, OFFSET correctMsg         
    call WriteString
    jmp done                                ; Jumps to end of program
                                        

incorrectAnswer:                            ; User was INCORRECT
    mov edx, OFFSET incorrectMsg
    call WriteString


done:

exit
main endp
end main
