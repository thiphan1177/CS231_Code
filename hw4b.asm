;;; ; hw4b.asm
;;; ; Thao Phan
;;; ;
;;; ; this program reads a 32-bit integer from the user, and decodes it into a string
;;; ;
;;; ; to assemble and run:
;;; ;
;;; ;     nasm -f elf -F  stabs program.asm
;;; ;     ld -melf_i386 -o program program.o
;;; ;     ./program
;;; ; -------------------------------------------------------------------

	;; %include files here...
	extern	_printInt
	extern	_println
	extern	_getInput
	extern	_printRegs
	extern	_printString
;;;  ------------------------------------------------------------
;;;  data areas
;;;  ------------------------------------------------------------

	        section .data
	prompt		db	"> "
	promptLen	equ	$-prompt
	userInput	dd	"    "
	userInputLen	equ	$-userInput
	lineFeed	db	10
	lineFeedLen	equ	$-lineFeed
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
	
;;;  -------------------------------------------------------------
;;;  Access memory and print out string
;;;  -------------------------------------------------------------
		mov	eax, dword[userInput] ;eax <-- userInput
		mov	ecx, 0	;clear ecx and edx
		mov	edx, 0
	

	 	mov	eax, 4
	 	mov	ebx, 1
		mov	ecx, userInput+3 ;prints first letter
		mov	edx, userInputLen-3
		int	0x80

	
	 	mov	eax, 4
	 	mov	ebx, 1
		mov ecx, userInput+2 ;prints 2nd letter!
		mov	edx, userInputLen-3
		int	0x80

	
	 	mov	eax, 4
	 	mov	ebx, 1
		mov	ecx, userInput+1 ;prints 3rd letter!
		mov	edx, userInputLen-3
		int	0x80

	
	 	mov	eax, 4
	 	mov	ebx, 1
		mov	ecx, userInput ;prints last letter!
		mov	edx, userInputLen-3
		int	0x80
	
		call	_println
	
	;; 	mov	eax, 4
	;; 	mov	ebx, 1
	;; 	mov	ecx, lineFeed ;prints line feed
	;; 	mov	edx, lineFeedLen
	;; 	int	0x80
	
;;;  exit()

	        mov     eax,1
	        mov     ebx,0
	        int     0x80	; final system call	 	  	 	 		     	      	      	  	 	
