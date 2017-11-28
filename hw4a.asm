;;; ; hw4a.asm
;;; ; Thao Phan
;;; ;
;;; ; this program takes a decimal unsigned integer and converts it into its octal equivalent.
;;; ;
;;; ; to assemble and run:
;;; ;
;;; ;     nasm -f elf -F  stabs program.asm
;;; ;     ld -melf_i386 -o program program.o
;;; ;     ./program
;;; ; -------------------------------------------------------------------

	;; %include files here...
	extern	_printDec
	extern	_printString
	extern	_println
	extern	_getInput
	extern	_printRegs
	
;;;  ------------------------------------------------------------
;;;  data areas
;;;  ------------------------------------------------------------

		section .data
	prompt		db	"> "
	promptLen	equ	$-prompt
	userInput	dd	0
	currentNum	dd	0
	
;;; remainder variables
	zeroth		dd	0
	first		dd	0
	second		dd	0
	third		dd	0
	fourth		dd	0
	fifth		dd	0
	sixth		dd	0
	seventh		dd	0
	eigth		dd	0
	ninth		dd	0 ; perhaps these variables are not all necessary
	tenth		dd	0 ; but they are here just-in-case
	eleventh	dd	0
	twelth		dd	0
	thirteenth	dd	0

	
;;;  ------------------------------------------------------------
;;;  code area
;;;  ------------------------------------------------------------

	        section .text
	        global  _start
_start:

;;; display prompt
		mov	ecx, prompt
		mov	edx, promptLen
		call	_printString

;;; get user input
		call	_getInput
		mov	dword[userInput], eax
	
;;;  ------------------------------------------------------------------
;;;  COMPUTATIONS: convert decimal to octal!
;;;  ------------------------------------------------------------------
	;; divide quotient 1st time!
		mov	eax, 0	;use dwords for division
		mov	edx, 0	;setup edx:eax <-- 0

		mov	eax, dword[userInput] ;edx: eax <-- userInput
		mov	ebx, 8	;get ready to divide by 8
		div	ebx	;edx
				;eax <- quotient 
		mov	dword[zeroth], edx ;zeroth <-- remainder
		mov	dword[currentNum], eax
	
	;; divide quotient 2nd time!
		mov	eax, 0
 		mov	edx, 0
	 	mov	eax, dword[currentNum]
	 	div	ebx
	 	mov	dword[first], edx ;first <- remainder
	 	mov	dword[currentNum], eax ;currentNum <- quotient

	;; divide quotient 3rd time
	 	mov	eax, 0
		mov	edx, 0
		mov	eax, dword[currentNum]
		div	ebx
		mov	dword[second], edx ;second <- remainder
		mov	dword[currentNum], eax ;currentNum <- quotient

	;; divide quotient 4th time!
		mov	eax, 0
		mov	edx, 0
		mov	eax, dword[currentNum]
		div	ebx
		mov	dword[third], edx
		mov	dword[currentNum], eax

	;; divide quotient 5th time!
		mov	eax, 0
		mov	edx, 0
		mov	eax, dword[currentNum]
		div	ebx
		mov	dword[fourth], edx
		mov	dword[currentNum], eax

	;; divide quotient 6th time!
		mov	eax, 0
		mov	edx, 0
		mov	eax, dword[currentNum]
		div	ebx
		mov	dword[fifth], edx
		mov	dword[currentNum], eax

	;; divide quotient 7th time!
		mov	eax, 0
		mov	edx, 0
		mov	eax, dword[currentNum]
		div	ebx
		mov	dword[sixth], edx
		mov	dword[currentNum], eax

	;; divide quotient 8th time!
 		mov	eax, 0
		mov	edx, 0
		mov	eax, dword[currentNum]
		div	ebx
		mov	dword[seventh], edx
		mov	dword[currentNum], eax

	;; divide quotient 9th time!
		mov	eax, 0
		mov	edx, 0
		mov	eax, dword[currentNum]
		div	ebx
		mov	dword[eigth], edx
		mov	dword[currentNum], eax

	;; divide quotient 10th time!
		mov	eax, 0
		mov	edx, 0
		mov	eax, dword[currentNum]
		div	ebx
		mov	dword[ninth], edx
		mov	dword[currentNum], eax
	
	;; divide quotient 11th time!
		mov	eax, 0
		mov	edx, 0
		mov	eax, dword[currentNum]
		div	ebx
		mov	dword[tenth], edx
		mov	dword[currentNum], eax
	
	;; divide quotient 12th time!
		mov	eax, 0
		mov	edx, 0
		mov	eax, dword[currentNum]
		div	ebx
		mov	dword[eleventh], edx
		mov	dword[currentNum], eax
	
	;; divide quotient 13th time!
		mov	eax, 0
		mov	edx, 0
		mov	eax, dword[currentNum]
		div	ebx
		mov	dword[twelth], edx
		mov	dword[currentNum], eax

	;; divide quotient 14th time!
		mov	eax, 0
		mov	edx, 0
		mov	eax, dword[currentNum]
		div	ebx
		mov	dword[thirteenth], edx
		mov	dword[currentNum], eax

;; display current number
		mov	eax, dword[currentNum]
		call	_printDec
		call	_println
		call	_println

;; print the octal number with leading zeros!
		mov	eax, dword[thirteenth]
		call	_printDec

		mov	eax, dword[twelth]
		call	_printDec

		mov	eax, dword[eleventh]
		call	_printDec

		mov	eax, dword[tenth]
		call	_printDec

		mov	eax, dword[ninth]
		call	_printDec

		mov	eax, dword[eigth]
		call	_printDec

		mov	eax, dword[seventh]
		call	_printDec

		mov	eax, dword[sixth]
		call	_printDec
	
		mov	eax, dword[fifth]
		call	_printDec

		mov	eax, dword[fourth]
		call	_printDec

		mov	eax, dword[third]
		call	_printDec

		mov	eax, dword[second]
		call	_printDec

		mov	eax, dword[first]
		call	_printDec

		mov	eax, dword[zeroth]
		call	_printDec

		call	_println

;;;  exit()

	        mov     eax,1
	        mov     ebx,0
	        int     0x80	; final system call
	 	  	 	 		     	      	      	  	 	
