;;; ; hw4d.asm
;;; ; Thao Phan
;;; ;
;;; ; this program prompts the user for a string & displays the checksum
;;; ; of this string, in decimal.
;;; ;
;;; ; to assemble and run:
;;; ;
;;; ;     nasm -f elf -F  stabs program.asm
;;; ;     ld -melf_i386 -o program program.o
;;; ;     ./program
;;; ; -------------------------------------------------------------------

	;; %include files here...

;;;  ------------------------------------------------------------
;;;  data areas
;;;  ------------------------------------------------------------
	section .data
	prompt          db      "> "

;;;  ------------------------------------------------------------
;;;  code area
;;;  ------------------------------------------------------------

		section .text
        	global  _start
		extern	_getString
		extern	_printString
		extern	_println
		extern	_printDec
_start:
	;; prompt the user
		mov	ecx, prompt
		mov	edx, 2
		call	_printString
	
	;;;  get a string from the user
	;; _getString sets ecx to address of array containing the string, & sets edx
	;; to number of characters the string has. 
		call    _getString
	

		mov	esi, ecx      ; move string address (from ecx) to esi
		mov	ecx, edx      ; move string's # of chars (from edx) to ecx
		mov	edx, 1
		dec	ecx	      ; decrement ecx by 1 so that _printDec prints the right DEC
		mov	al, byte[esi] ; move 1st letter into reg al

;;; Do checksum!!
loopthis:
		mov	bl, byte[esi+edx] ; move subsequent letter(s) into reg bl
		xor	al, bl
		inc	edx
		loop	loopthis

	;; print final result in decimal
		call	_printDec
		call	_println
	
	
;;;  exit()

	        mov     eax,1
	        mov     ebx,0
	        int     0x80	; final system call