;;; hw2.asm
;;;  Thao Phan
;;;  Computes 3 user-inputted numbers
;;;  explain how to assemble and run it.
;;; ; 	to assemble program, type the following: nasm -f elf hw2.asm
;;; ;   then link program by typing: ld -melf_i386 -o hw2 hw2.o
;;; ;   then run the program by typing: ./hw2

	        extern  _printDec
		    extern  _printInt
	        extern  _printString
	        extern  _println
	        extern  _getInput
	
	section	.data
prompt		db	"> "
promptLen	equ	$-prompt	
ansStr          db      "ans = "
ansStrLen	equ	$-ansStr	

a		dd	0
b		dd	0
c		dd	0
ans		dd	0
	
		section	.text
		global	_start
_start:
	;; display prompt
		mov	ecx, prompt
		mov	edx, promptLen
		call	_printString
	;; get a
		call	_getInput
		mov	dword[a], eax

	;; display prompt
		mov	ecx, prompt
		mov	edx, promptLen
		call	_printString
	;; get b
		call	_getInput
		mov	dword[b], eax
	
	;; display prompt
		mov	ecx, prompt
		mov	edx, promptLen
		call	_printString
	;; get c
		call	_getInput
		mov	dword[c], eax
	
	;; -----------------------------------
	;; computation: ans = 3*(a+b-c) + 2*(c-1)
	;; -----------------------------------
	
	; your code will go here...
		mov	eax, dword[a]
		mov	ebx, dword[b]
		mov	ecx, dword[c]
		add	eax, ebx ; adds b to a
		sub	eax, ecx ; subtracts c from (a+b)
		mov	edx, eax ; makes copy of eax value so we can use it to do the *3
		add	eax, eax ; adds value of eax again to eax
		add	eax, edx ; adds the same value of eax to eax
		sub	ecx, 1   ; subtracts 1 from c
		add	ecx, ecx ; adds c to itself so that we can do the *2
		add	eax, ecx ; adds sum of c to a
		mov	dword[ans], eax ; stores computed sum of 'a' into variable 'ans'
		int 	0x80
	;; -----------------------------------
	;; display "ans = "
	;; -----------------------------------
		mov	ecx, ansStr
		mov	edx, ansStrLen
		call	_printString

	;; -----------------------------------
	;; display ans variable
	;; -----------------------------------
		mov	eax, dword[ans]
		call	_printInt
		call	_println
		call	_println
	
;;; exit
		mov	ebx, 0
		mov	eax, 1
		int     0x80
	 	  	 	 		     	      	      	  	 	
