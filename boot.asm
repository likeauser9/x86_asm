mov ah, 0x0e
mov al, 0x61
mov bl, 0x42

loop:
  int 0x10
  mov al, bl
  int 0x10
  mov al, bl

  inc al
  inc bl

  cmp al, 'z' + 1
  je exit
  cmp bl, 'Z' + 1
  je exit

  jmp loop

exit:
  jmp $

times 510 - ($ - $$) db 0
db 0x55, 0xaa
