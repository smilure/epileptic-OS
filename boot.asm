[ORG 0x7C00]
; DEFINE O MODO DE TEXTO AH e AL
 mov ah,0x00;Tipo de funçao Definir modo de Video
 mov al,0x13; modo de video
 int 0x10 ; interrupçao de video
 mov al,0x01    ; cor do pixel
 mov bh, 0x00  ; Numero da pagina
 mov cx,0x00   ; Posiao x
 mov dx, 0x00   ; Posiçao y
 
 
LOOP:
 mov ah,0x0C ; Funçao para escrever o pixel na tela
 int 0x10 ; interrupçao de video
 inc cx; avança para o pixel a direita
 cmp cx,0x0140; verifica se e igual 320
 jne LOOP; se nao e igual continua o loop
 mov cx,0x00; volta para a posiçao 0
 inc dx; avança para a proxima linha
 cmp dx,0xC8; verifica se atingiu o final da tela
 jne LOOP ; se nao chegou no fim da tela continua o loop
 mov dx,0x00; volta para a primeira linha
 inc al; pula para proxima cor
 cmp al,0xFF; verifica se e a ultima cor
 je RESETCOR; Se e a ultima cor volta para a primeira
 jmp LOOP
   RESETCOR:
   mov al,0x00; reinicia para a primeira cor
   jmp LOOP
 


times 510-($-$$) db 0

db 0x55
db 0xAA