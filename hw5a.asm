;;; ; ; hw5a.asm
;;; ; ; Thao Phan
;;; ; ;
;;; ; ; the program prompts user for a string, and prints it back several
;;; ; ; times. The number of times string is printed is same as
;;; ; ; number of characters in the string.
;;; ; ;
;;; ; ; to assemble and run:
;;; ; ;
;;; ; ;     nasm -f elf -F  stabs program.asm
;;; ; ;     ld -melf_i386 -o program program.o
;;; ; ;     ./program
;;; ; ; -------------------------------------------------------------------

;;;  %include files here...

;;; ;  ------------------------------------------------------------
;;; ;  data areas
;;; ;  ------------------------------------------------------------
	section .data
	prompt          db      "> "
	address		dd	" "

;;; ;  ------------------------------------------------------------
;;; ;  code area
;;; ;  ------------------------------------------------------------

		section .text
		global  _start
		extern	_getString
		extern	_printString
		extern	_println

_start:
;;;  prompt the user
		mov	ecx, prompt
		mov	edx, 2
		call	_printString

;;; ;  get a string from the user
		call    _getString

		mov	dword[address], ecx	; stores string address in memory
		mov	ecx, edx		; set counter in ecx
		
loopthis:
		mov	esi, ecx		; save counter value in esi
		mov	ecx, dword[address]	; move address of string into ecx
		call	_printString		; print the string!!!
		call	_println
		mov	ecx, esi		; move current value of counter back into ecx
		loop	loopthis


;;; ;  exit()

	        mov     eax,1
	        mov     ebx,0
	        int     0x80	; final system call

