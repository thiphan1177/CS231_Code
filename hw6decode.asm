;;; ; hw6decode.asm
;;; ; Thao Phan
;;; ;
;;; ; This program takes an encoded word and decodes it.
;;; ;
;;; ; to assemble and run:
;;; ;
;;; ;     nasm -f elf -F  stabs program.asm
;;; ;     ld -melf_i386 -o program program.o
;;; ;     ./program
;;; ; -------------------------------------------------------------------

;;;  ------------------------------------------------------------
;;;  data areas
;;;  ------------------------------------------------------------

	        section .data
table		db	"aelkchmnopqfdristjbuvwxygz" ; this is the table to use
prompt		db	"> "		
address		dd	0
numChars	dd	0

;;;  ------------------------------------------------------------
;;;  code area
;;;  ------------------------------------------------------------

	        section .text
	        global  _start
		extern	_getString
		extern	_printString
		extern	_println
		extern	_printRegs
		extern	_printHex
_start:
	;; prompt the user
	mov	ecx, prompt
	mov	edx, 2
	call	_printString

	;; get a string from the user
	;; _getString sets ecx to address of array containing string, & sets edx
	;; to number of characters the string has.
	call	_getString
	mov	dword[address], ecx
	mov	dword[numChars], edx
	mov	ebx, ecx	       ; ebx points to first char in string
	mov	ecx, edx	       ; set counter to # of chars in string
;; loop through string and decode each character!
loopthis:
	mov	esi, ecx	; save current counter value in ecx in esi
	mov	eax, 0	        ; clear eax register
	mov	al, byte[ebx]	; move first char into al
	sub	al, 'a' 	; substract 'a' (or 97) from al to get index number
	mov	ecx, 0		; clear ecx
	mov	cl, byte[table+eax] ; go into table at index [table+eax]. Move letter there to cl
	mov	byte[ebx], cl	; change original letter into the new letter
	inc	ebx 		; increment ebx to get next letter
	mov	ecx, esi	; mov current counter value back into ecx so loop can keep decrementing
	loop 	loopthis

	;; print decoded string
	mov	ecx, dword[address]	; move original string address into ecx
	call	_printString
	call	_println

;;;  exit()

	        mov     eax,1
	        mov     ebx,0
	        int     0x80	; final system call	 	  	 	 		     	      	      	  	 	
