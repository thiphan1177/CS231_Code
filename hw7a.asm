;;; hw7a.asm
;;; Thao Phan
;;;
;;; This program takes in a user integer and string of spaces and @'s.
;;; It then outputs a game of life with those inputs.
;;;
;;;
;;;
;;; dish = "                                      ##                                     "
;;; dish = [ 1 if c=='#' else 0 for c in dish ]
;;; N    = len( dish )
;;; newDish = N * [0]
;;; numGen  = 30
	section .data
dish	db      0,0,0,0,0,0,0,0,0,0
	db      0,0,0,0,0,0,0,0,0,0
	db      0,0,0,0,0,0,0,0,0,0
	db      0,0,0,0,0,0,0,0,0,0
	db      0,0,0,0,0,0,0,0,0,0
	db      0,0,0,0,0,0,0,0,0,0
	db      0,0,0,0,0,0,0,0,0,0
	db      0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0

N	equ	$-dish
newDish	times N db 0
dishString times N db ' '
	db	10
numGen	dd	0

prompt		db	"> "
address		dd	0
numChars	dd	0

	section	.text
	global	_start

	extern	_printString
	extern	_printRegs
	extern	_println
	extern	_getInput
	extern	_getString

_start:
;;;  prompt user
	mov	ecx, prompt
	mov	edx, 2
	call	_printString

;;;  get user's integer
	call	_getInput
	mov	dword[numGen], eax

;;;  prompt user again
	mov	ecx, prompt
	mov	edx, 2
	call	_printString

;;;  get user's string
	call	_getString
	mov	dword[address], ecx
	mov	dword[numChars], edx


;; store user string into dish
	mov	ebx, ecx 	; ebx points to address of user string
	mov	eax, dish	; eax points to address of dish
	mov	ecx, edx	; ecx holds length of user's string

for:	cmp	byte[ebx], '@'	; compare byte to '@'
	je	storeOne 	; if it's an '@' symbol, jump to storeOne

	;; storeZero:			; else, move on to storeZero
	;; mov	byte[eax], 0	; change corresponding address in dish to 0

update:	inc	eax
	inc	ebx
	dec	ecx
	cmp	ecx, 0
	je	endFor
	jmp	for

storeOne:
	mov	byte[eax], 1	; change corresponding address in dish to 1
	jmp	update

endFor:
	;; Clearing out all the registers. Probably overkill, but it's just a precautionary measure.
	mov	eax, 0
	mov	ebx, 0
	mov	ecx, 0
	mov	edx, 0
	mov	esi, 0
	mov	edi, 0
	mov	ecx, dword[numGen] ;mov num of generations into ecx

forGen:
	mov	dword[numGen], ecx ;mov ecx's value into num of generations

;;;     # print current dish
;;;     dishString = ''.join( [ '#' if c==1 else ' ' for c in dish ] )
;;;	print( dishString )

	mov	ebx, N
	mov	esi, dish
	mov	edi, dishString

forPrint:
	mov	al, byte[esi]
	cmp	al, 1
	je	addSixtyThree
	jmp	else

addSixtyThree:
	add	al, 63		; cus what's in al is the value 1. Thus, add 63 to get al to become '@'
	jmp	continue

else:	add	al,' '		; cus what's in al is the value 0. Thus, add ' ' to get 0 to become ' '

continue:
	mov	byte[edi],al
	inc	esi
	inc	edi
	dec	ebx
	cmp	ebx, 0
	jnz	forPrint

	mov	ecx, dishString
	mov	edx, N+1	; +1 for 0x10 at the end
	call	_printString

;;;     # generate newDish from what's in dish
;;;     newDish = N * [0]
;;;
;;;     # loop over dish and generate newDish
;;;     for j in range( 1, N-1 ):
;;;         # compute fate of cell by looking at neighbors
;;;         newDish[j] = dish[j-1] ^ dish[j+1]

	mov	ebx, N-2
	mov	esi, dish+1
	mov	edi, newDish+1
forFate:
	mov	al, byte[esi-1]
	xor	al, byte[esi+1]
	mov	byte[edi],al
	inc	esi
	inc	edi
	dec	ebx
	cmp	ebx, 0
	jnz	forFate

;;;     # copy newDish into dish
;;;     dish = newDish
;;;
	mov	ebx, N
	mov	esi, newDish
	mov	edi, dish
forCopy:
	mov	al, byte[esi]
	mov	byte[edi], al
	inc	esi
	inc	edi
	dec	ebx
	cmp	ebx, 0
	jnz	forCopy

;;; end of forGen loop

	mov	ecx, dword[numGen]
	sub	ecx, 1
	cmp	ecx, 0
	jg	forGen

;;; 	exit
	mov	eax, 1
	mov	ebx, 0
	int 	0x80
