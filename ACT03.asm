;ACT03.COM

; A program to create an hourglass depending on the number given by user

.model tiny
.386
.data
	a DB 0ah, "ACT03.COM$"
	b DB 0ah, 0dh, "Programmed by: @khalysst / Github $"
	c DB 0ah, 0ah, 0dh, "enter a number (1-9): $"
	d DB 0ah, 0dh, "another try [y/n]: $"
	e DB 0ah, 0dh, '$'

.code
	org 100h
	
begin:
	lea dx,a
	mov ah,09h
	int 21h 
	
	lea dx,b
	mov ah,09h
	int 21h
	
	lea dx,c
	mov ah,09h
	int 21h
	mov ah,01h
	int 21h
	
	mov cl,al
	sub cl,30h
	
	lea dx,e
	mov ah,09h
	int 21h
	
	lea dx,e
	mov ah,09h
	int 21h
	
	
	mov bl,1
	mov bh,cl
	
	push bx
	
	L1:
	push cx
	mov cl,bl
	
	LS:
	mov dl,20h
	mov ah,02h
	int 21h 
	loop LS
	inc bl 
	
	pop cx 
	
	push cx 
	mov cl,bh

	L2:
	mov dl,bh
	add dl,30h
	mov ah,02h
	int 21h 
	mov dl,20h
	mov ah,02h
	int 21h
	loop L2
	
	lea dx,e 
	mov ah,09h
	int 21h

	dec bh

	pop cx 
	
	loop L1
	pop bx
	
	
	
	mov bl,1
	mov cl,bh
	
	L3:
	push cx 
	
	LP:
	mov dl,20h
	mov ah,02h
	int 21h 
	loop LP
	
	pop cx 
	
	push cx
	mov cl,bl 
	
	L4:
	mov dl,bl
	add dl,30h
	mov ah,02h
	int 21h
	mov dl,20h
	mov ah,02h
	int 21h 
	loop L4
	
	
	lea dx,e 
	mov ah,09h
	int 21h
	
	inc bl

	pop cx
	
	loop L3
	
	lea dx,e
	mov ah,09h
	int 21h
	
	lea dx,d 
	mov ah,09h
	int 21h
	mov ah,01h
	int 21h
	
	cmp al,'y'
	je begin 
	
exit:
	mov ah,4ch
	int 20h
	
end begin 
