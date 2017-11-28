;;; ; hw3.asm
;;; ; Thao Phan
;;; ;
;;; ; This is linked to 231Lib library. This program prompts the user for an integer
;;; ; (positive) number of seconds, which it will then translate into a number
;;; ; of days, hours, minutes and seconds.

;;; ;
;;; ; to assemble and run:
;;; ;
;;; ;     nasm -f elf -F  stabs program.asm
;;; ;     ld -melf_i386 -o program program.o
;;; ;     ./program
;;; ; -------------------------------------------------------------------

	;; %include files here...
	extern _printDec
	extern _printInt
	extern _printString
	extern _println
	extern _getInput

;;;  ------------------------------------------------------------
;;;  data areas
;;;  ------------------------------------------------------------

	        section .data
	prompt		db  "> "
	promptLen	equ $-prompt

	ansStrDay	db  " days "
	ansStrDayL	equ $-ansStrDay

	ansStrHour	db  " hours "
	ansStrHourL	equ $-ansStrHour

	ansStrMin	db  " minutes "
	ansStrMinL	equ $-ansStrMin

	ansStrSec     	db  " seconds "
	ansStrSecL  	equ $-ansStrSec

	
	userSecs        dd  0		 ;user's seconds
	finalAnsSec	dd  0
	finalAnsMin	dd  0
	finalAnsHour	dd  0
	finalAnsDay     dd  0
	totalSec	dd  0
	
;;;  ------------------------------------------------------------
;;;  code area
;;;  ------------------------------------------------------------

	        section .text
	        global  _start
_start:

	;; display prompt
	mov	ecx, prompt
	mov	edx, promptLen
	call	_printString

	;; get user's Seconds
	call	_getInput
	mov	dword[userSecs], eax

;;--------------------------------------------
;; computations: convert seconds to days, hours, minutes, seconds
;;--------------------------------------------

	;; split hours into days and seconds
	mov	eax, 0		    		; clear eax
	mov	eax, dword[userSecs] 		; eax <- user's integer input (in seconds)
	mov	ecx, 86400 		        ; store 86400 seconds in reg ecx - there's 86400 sec/day
	mov	edx, 0				; clear edx 
	div	ecx				; total seconds / 86400 sec -> edx: Remainder (seconds), eax: Quotient (days)
	mov	dword[finalAnsDay], eax		; finalAnsDay <- eax
	mov	dword[totalSec], edx		; totalSec <- seconds left to convert to hours

	;; split seconds into hours and seconds
	mov	eax, dword[totalSec] 		; eax <- totalSec
	mov	edx, 0				; clear edx again
	mov	ebx, 3600			; store 3600 seconds in reg ebx - there's 3600 sec/hr
	div     ebx				; totalSec / 3600 seconds -> edx: Remainder (seconds), eax: Quotient (hours)
	mov	dword[finalAnsHour], eax 	; finalAnsHour <- eax
	mov	dword[totalSec], edx 		; totalSec <- seconds left to convert to minutes

	;;  split seconds into minutes and seconds
	mov	eax, dword[totalSec] 		; eax <- totalSec
	mov	edx, 0				; clear edx once more
	mov	cx,  60				; store 60 seconds in reg cx - there's 60 sec/min
	div	cx				; totalSec / 60 seconds -> edx: Remainder (seconds), eax: Quotient (minutes)
	mov	dword[finalAnsMin], eax
	mov	dword[finalAnsSec], edx
	
;;; ------------------------------------------
;;; display answer variable
;;; ------------------------------------------

;;; print Days

	mov	eax, dword[finalAnsDay]
	call	_printInt

	mov	ecx, ansStrDay
	mov	edx, ansStrDayL
	call	_printString
	
;;; print Hours
	mov	eax, dword[finalAnsHour]
	call	_printInt

	mov	ecx, ansStrHour
	mov	edx, ansStrHourL
	call	_printString

;;; print Minutes
	mov	eax, dword[finalAnsMin]
	call 	_printInt
	
	mov	ecx, ansStrMin
	mov	edx, ansStrMinL
	call	_printString

	
;;; print Seconds
	mov	eax, dword[finalAnsSec]
	call	_printInt

	mov	ecx, ansStrSec
	mov	edx, ansStrSecL
	call	_printString

	call    _println
	
;;; ------------------------------------------
;;; display answer variable
;;; ------------------------------------------
;;; 
;;;  exit()

	        mov     eax,1
	        mov     ebx,0
	        int     0x80	; final system call
	 	  	 	 		     	      	      	  	 	
