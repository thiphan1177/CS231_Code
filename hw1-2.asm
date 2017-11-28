;;; ; hw1.asm
;;; ; Thao Phan
;;; ;
;;; ; this program prints out the following:
;;; ; ------------------------------------
;;; ; --------- CSC231 Assembly ----------
;;; ; ------------------------------------

;;;  ------------------------------------------------------------
;;;  data areas
;;;  ------------------------------------------------------------

	        section .data
msg		db	"  CSC231 Assembly "
linefeed	db	10
dashline	db	"------------------"
lineLen		equ	$-dashline

;;;  ------------------------------------------------------------
;;;  code area
;;;  ------------------------------------------------------------

	        section .text
	        global  _start
_start:

;;; outputs the 36 dashes
		mov	eax, 4
		mov	ebx, 1
		mov	ecx, dashline
		mov	edx, lineLen
		int	0x80

		mov	eax, 4
		mov	ebx, 1
		mov	ecx, dashline
		mov	edx, lineLen
		int	0x80

;;; outputs a new line
		mov 	eax, 4
		mov	ebx, 1
		mov	ecx, linefeed
		mov	edx, 1 	; creates 1 new line feed
		int	0x80

;;; creates the 2nd line with 9 dashes first, then the words CSC Assembly, then 10 dashes
		mov	eax, 4
		mov	ebx, 1
		mov	ecx, dashline 
		mov	edx, 9	      ; specifies the exact amount of chars to output 
		int	0x80

		mov 	eax, 4
		mov	ebx, 1
		mov	ecx, msg+1 ; gets rid of 1 space in front of CSC Assembly
		mov	edx, 17  
		int	0x80

		mov 	eax, 4
		mov	ebx, 1
		mov	ecx, dashline 
		mov	edx, 10	      ;specifies exact amount of dashes to output
		int	0x80

;;; a new line feed
		mov	eax, 4
		mov	ebx, 1
		mov	ecx, linefeed
		mov	edx, 1
		int	0x80

;;; the 3rd line with 36 dashes
		mov	eax, 4
		mov	ebx, 1
		mov	ecx, dashline
		mov	edx, lineLen
		int	0x80

		mov	eax, 4
		mov	ebx, 1
		mov	ecx, dashline
		mov	edx, lineLen
		int	0x80

;;; one more new line feed
		mov 	eax, 4
		mov	ebx, 1
		mov	ecx, linefeed
		mov	edx, 1
		int	0x80
	
;;;   exit()
	        mov     eax,1
	        mov     ebx,0
	        int     0x80	; final system call
	 	  	 	 		     	      	      	  	 	
