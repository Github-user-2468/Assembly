;===================================================================================================================================================
;Program: LinkingArray.asm
;Programmer: Karigan Stewart
;Date: 03-28-2024
;Purpose: the program generates a sequence of characters based on the defined pattern and displays it to the use by stepping through the links array determing the order of characters. 
;===================================================================================================================================================


.386
.model flat,stdcall
.stack 4096

INCLUDE Irvine32.inc

.data
	start DWORD 1   ;starting value
	chars BYTE 'H', 'A', 'C', 'E', 'B', 'D', 'F', 'G'
	links DWORD 0,4,5,6,2,3,7,0
	
	linksType BYTE TYPE links
	array BYTE LENGTHOF chars DUP(?)     ;used as a counter for the loop and hold values

	
.code
main PROC
	mov ecx, LENGTHOF array			; Set counter to 8
	mov edi, OFFSET array           ; Set edi to point to the beginning of the array

	L1:
		
		mov esi, OFFSET chars		; reset esi to chars starting position
		add esi, start				; Move to the position in chars indicated by 'start' iteration
		mov al, [esi]				; Move the character at esi into al
		mov [edi], al				; Store the character at edi position in the array
		mov edx, offset links		; Set edx to the start of the links array
		mov eax, start				; Load eax with the current 'start' value
		mul linksType				; Multiply eax by the size of one element in the links array (4 bytes for DWORD)
		mov start, eax				; Store the result back in 'start'  
		add edx, start				; Move to the appropriate index in the links array

		mov eax, [edx]				; Move the value from the links array to eax
		mov start, eax				; Update start

		inc edi						; Move to the next position in the array

	loop L1							; Repeat the loop until ecx becomes zero

	mov edx, offset array
	call WriteString				; Display the resulting array of characters


exit
main endp
end main
