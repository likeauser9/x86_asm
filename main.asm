; In assembly we have these conditions
; je - jump if equal
; jne - jump if not equal
; jg - jump if greater
; jl - jump if lower
; jge - jump if greater or equal
; jgl - jump if greater or lower


; mov bx, 4
; cmp bx, 5
; je label
; jmp $

; label:
;   mov ah, 0x0e
;   mov al, 'A'
;   int 0x10

; mov ah, 0x0e
; mov al, 'A'
; int 0x10

; loop:
;   inc al
;   cmp al, 'Z' + 1
;   je exit
;   int 0x10
;   jmp loop

; exit:
;   jmp $

[org 0x7c00]
mov ah, 0x0e
mov al, 0x61
mov bl, 0x42
mov cl, name

name:
  db "this is a string", 0

print_string:
  mov al, cl
  cmp al, 0
  je exit
  int 0x10
  inc cl
  jmp print_string

; loop:
;   int 0x10
;   mov al, bl

;   int 0x10
;   mov al, bl

;   inc al
;   inc bl

;   cmp al, 'z' + 1
;   je exit

;   cmp bl, 'Z' + 1
;   je exit

;   jmp loop

exit:
  jmp $

times 510 - ($ - $$) db 0
db 0x55, 0xaa