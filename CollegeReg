;============================================================================================================================================
;Program: Final.asm
;Programmer: Karigan Stewart
;Date: 03-18-24

;Purpose: This is to gather two pieces of information from the user, their GPA and their credits. 
;It is to then compares the values to see it the values meet the requirements for registration. 
;Then it displays a string message telling the user whether they can register or not. 
;============================================================================================================================================


.386
.model flat,stdcall
.stack 4096

INCLUDE Irvine32.inc

.data

; Upper and Lower Limits of Grade Average and Credits for later comparison
	LowerGradeAverage = 1
	UpperGradeAverage = 400
	LowCreditLimit = 1
	UpperCreditLimit = 30

; Inputs of Grade Average and Credits
	gradeAverage	DWORD 375;?
	credits			DWORD 28;?

; Prompts to display to user to ask for information 
	GradeAvgMsg			BYTE "Input the students grade average (1-400): ",0					; Gets the user GPA
	GPAToHighMsg		BYTE "The grade average is over the upper limit of 400.",0			; Display that the GPA is above the limit
	GPAToLowMsg			BYTE "The grade average is below the lower limit of 1.",0			; Displays that GPA is below limit
	
	CreditMsg			BYTE "Input the students total credits (1-30): ",0					; Gets the users credit
	CreditToHighMsg		BYTE "The credit total is over the upper limit of 30.",0			; Tells User that credits is above limit
	CreditLowMsg		BYTE "The credit total is below the lower limit of 1.",0			; Tells user that credits is below the limit
	
	OKtoRegisterMsg		BYTE "The student can register.",0					; Tells user they are able to register
	NotOkRegisterMsg	BYTE "The student cannot register.",0				; Tells user they are NOT able to register

; row position tracking
	newY BYTE 0

.code
main PROC

	; Get grade average
		mov edx, OFFSET GradeAvgMsg							; Writes prompts asking for users GPA
		call WriteString
	call SkipLine
	call ReadInt											; Reads user input for credit
	call SkipLine
		mov gradeAverage, eax

	; Check if grade average is within limits
		cmp eax, UpperGradeAverage							; Compares to see if gradeAverage is within upper limit
		jg	GRDAVGHIGH
		cmp eax, LowerGradeAverage							; Compares to see  if gradeAverage is within lower limit
		jl	GRDAVGLOW

	; Get credit total
		mov edx, OFFSET CreditMsg							; Moves output of prompt asking for credits into edx
		call WriteString									; Writes out prompt
	call SkipLine
	call ReadInt											; Reads user input for number of credit
	call SkipLine
		mov credits, eax
		
	; Check if credits is within limits
		cmp eax, UpperCreditLimit							; Compares if credits is within upper limit
		jg CREDITHIGH
		cmp eax, LowCreditLimit								; Compares if credits is within lower limit
		jl CREDITLOW


	; store inputs
		mov eax, gradeAverage							; Store grade average in eax register
		mov ebx, credits								; Store credits in ebx register
	
	
	; check if ok to register
		cmp eax, 350									; if grade average is greater than 350
		ja	OKTOREGISTER

		cmp eax, 250									; else if grade average is greater than 250
		ja	COMPARECRED16				
		jmp COMPARECRED12
		
;--------------------------------
;If the GPA is greater than 250
;AND Credits is > than 16
;--------------------------------
COMPARECRED16:			
		cmp ebx, 16							; If the 250 > GPA < 350 AND credit > 16 its okay to register
		jbe OKTOREGISTER
		jmp NOTOKTOREGISTER

;--------------------------------
; If GPA is greater than 250
; AND credit is greater than 12
;-------------------------------
COMPARECRED12:
		cmp ebx, 12							; If the GPA > 250 and credit > 12 its okay to register
		jbe OKTOREGISTER
		jmp NOTOKTOREGISTER					; if not its not okay to register

;-------------------------------
; Displays MSG that the GPA is 
; above limit and ends Program
;-------------------------------
GRDAVGHIGH:
	mov edx, OFFSET GPAToHighMsg							; Moves offset of prompt telling user thier GPA above the limit
	call WriteString										; Writes out the prompt 
	call SkipLine											
	jmp NOTOKTOREGISTER

;--------------------------------
; Display Msg that the GPA is 
; below limit and ends Program
;--------------------------------
GRDAVGLOW:
	mov edx, OFFSET GPAToLowMsg							; Moves offset of prompt telling user their GPA is too low to register
	call WriteString									; Writes out prompt
	call SkipLine
	jmp NOTOKTOREGISTER

;--------------------------------
; Display Msg that credits are 
; above limit and ends Program
;--------------------------------
CREDITHIGH:
	mov edx, OFFSET CreditToHighMsg							; Moves offset of the prompt telling user the inputed credit is too high 
	call WriteString										; Writes out the prompt 
	call SkipLine
	jmp NOTOKTOREGISTER

;--------------------------------
; Display Msg that credits are 
; below limit and ends Program
;--------------------------------
CREDITLOW:
	mov edx, OFFSET CreditLowMsg							; Moves offset of the prompt telling user it is OKAY to register
	call WriteString										; Writes out the prompt 	
	call SkipLine											; Skips the the next line
	jmp NOTOKTOREGISTER

;-------------------------------------------------
; Student does NOT meet requirements to register
;-------------------------------------------------
NOTOKTOREGISTER:
	call SkipLine
	mov edx, OFFSET NotOkRegisterMsg					; Moves the offset of the promtp telling use it is not ok to register
	call WriteString									; writes the prompt out
	call SkipLine										; skips to the next line
	JMP quit

;-------------------------------------------------
; Student DOES meet requirements to register
;-------------------------------------------------
OKTOREGISTER:
	call SkipLine
	mov edx, OFFSET OKtoRegisterMsg						; Moves offset to edx
	call WriteString									; Writes the prompt out
	call SkipLine										; skips to next line
	JMP QUIT

;---------------------------------------------------
; Waits for user to press a key to end program
;---------------------------------------------------
QUIT:
	call SkipLine
	call waitMsg
	exit
main ENDP


;---------------------------------------
; SkipLine
;Skips to the next line
;---------------------------------------
SkipLine PROC
	; Sets cursor position
		inc newY										; increment the row
		mov dh, newY									; set the Y coordinates
		mov dl, 0										; set the X coordinates
		Call Gotoxy										; move the cursor
	
	ret
SkipLine ENDP

END main

