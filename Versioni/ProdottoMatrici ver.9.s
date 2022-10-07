.data
a:		  .double 4.2,7.2,3.4,7.7,4.3,6.9,5.7,8.1,6.1  ; input: matrice A
b:        .double 1.4,3.0,2.1,1.9,2.4,1.6,2.8,1.2,2.1  ; input: matrice B
c:        .double 0,0,0,0,0,0,0,0,0                    ; output: matrice risultato

.text
start:	
    DADDI   r1, r0, a        ; puntatore al primo elemento della matrice A
	DADDI   r2, r0, b        ; puntatore al primo elemento della matrice B
	DADDI   r3, r0, c        ; puntatore al primo elemento della matrice risultato
	
loop1:
	L.D		f0, 0(r1)        ; lettura a[i]
	L.D     f1, 0(r2)        ; lettura b[i]
	L.D		f2, 8(r1)        ; lettura a[i+1]
	L.D     f3, 8(r2)        ; lettura b[i+1]
	L.D		f4, 16(r1)       ; lettura a[i+2]
	L.D     f5, 16(r2)       ; lettura b[i+2]
	MUL.D   f6, f1, f0       ; prodotto tra a[i] e b[i]
	MUL.D   f7, f2, f3       ; prodotto tra a[i+1] e b[i+1]
	MUL.D   f8, f4, f5       ; prodotto tra a[i+2] e b[i+2]
	ADD.D   f9, f6, f7       ; somma dei prodotti parziali
	ADD.D   f10, f9, f8      ; somma dei prodotti parziali
	S.D     f10, 0(r3)       ; scrittura del risultato in c[i]

loop2:	
	L.D		f0, 0(r1)        ; lettura a[i]
	L.D     f1, 24(r2)       ; lettura b[i]
	L.D		f2, 8(r1)        ; lettura a[i+1]
	L.D     f3, 32(r2)       ; lettura b[i+1]
	L.D		f4, 16(r1)       ; lettura a[i+2]
	L.D     f5, 40(r2)       ; lettura b[i+2]
	MUL.D   f6, f1, f0       ; prodotto tra a[i] e b[i]
	MUL.D   f7, f2, f3       ; prodotto tra a[i+1] e b[i+1]
	MUL.D   f8, f4, f5       ; prodotto tra a[i+2] e b[i+2]
	ADD.D   f9, f6, f7       ; somma dei prodotti parziali
	ADD.D   f10, f9, f8      ; somma dei prodotti parziali
	S.D     f10, 8(r3)       ; scrittura del risultato in c[i]

loop3:	
	L.D		f0, 0(r1)        ; lettura a[i]
	L.D     f1, 48(r2)       ; lettura b[i]
	L.D		f2, 8(r1)        ; lettura a[i+1]
	L.D     f3, 56(r2)       ; lettura b[i+1]
	L.D		f4, 16(r1)       ; lettura a[i+2]
	L.D     f5, 64(r2)       ; lettura b[i+2]
	MUL.D   f6, f1, f0       ; prodotto tra a[i] e b[i]
	MUL.D   f7, f2, f3       ; prodotto tra a[i+1] e b[i+1]
	MUL.D   f8, f4, f5       ; prodotto tra a[i+2] e b[i+2]
	ADD.D   f9, f6, f7       ; somma dei prodotti parziali
	ADD.D   f10, f9, f8      ; somma dei prodotti parziali
	S.D     f10, 16(r3)       ; scrittura del risultato in c[i]
	
loop4:	
	L.D		f0, 24(r1)       ; lettura a[i]
	L.D     f1, 0(r2)        ; lettura b[i]
	L.D		f2, 32(r1)       ; lettura a[i+1]
	L.D     f3, 8(r2)        ; lettura b[i+1]
	L.D		f4, 40(r1)       ; lettura a[i+2]
	L.D     f5, 16(r2)       ; lettura b[i+2]
	MUL.D   f6, f1, f0       ; prodotto tra a[i] e b[i]
	MUL.D   f7, f2, f3       ; prodotto tra a[i+1] e b[i+1]
	MUL.D   f8, f4, f5       ; prodotto tra a[i+2] e b[i+2]
	ADD.D   f9, f6, f7       ; somma dei prodotti parziali
	ADD.D   f10, f9, f8      ; somma dei prodotti parziali
	S.D     f10, 24(r3)       ; scrittura del risultato in c[i]

loop5:	
	L.D		f0, 24(r1)       ; lettura a[i]
	L.D     f1, 24(r2)        ; lettura b[i]
	L.D		f2, 32(r1)       ; lettura a[i+1]
	L.D     f3, 32(r2)        ; lettura b[i+1]
	L.D		f4, 40(r1)       ; lettura a[i+2]
	L.D     f5, 40(r2)       ; lettura b[i+2]
	MUL.D   f6, f1, f0       ; prodotto tra a[i] e b[i]
	MUL.D   f7, f2, f3       ; prodotto tra a[i+1] e b[i+1]
	MUL.D   f8, f4, f5       ; prodotto tra a[i+2] e b[i+2]
	ADD.D   f9, f6, f7       ; somma dei prodotti parziali
	ADD.D   f10, f9, f8      ; somma dei prodotti parziali
	S.D     f10, 32(r3)       ; scrittura del risultato in c[i]

loop6:	
	L.D		f0, 24(r1)       ; lettura a[i]
	L.D     f1, 48(r2)       ; lettura b[i]
	L.D		f2, 32(r1)       ; lettura a[i+1]
	L.D     f3, 56(r2)       ; lettura b[i+1]
	L.D		f4, 40(r1)       ; lettura a[i+2]
	L.D     f5, 64(r2)       ; lettura b[i+2]
	MUL.D   f6, f1, f0       ; prodotto tra a[i] e b[i]
	MUL.D   f7, f2, f3       ; prodotto tra a[i+1] e b[i+1]
	MUL.D   f8, f4, f5       ; prodotto tra a[i+2] e b[i+2]
	ADD.D   f9, f6, f7       ; somma dei prodotti parziali
	ADD.D   f10, f9, f8      ; somma dei prodotti parziali
	S.D     f10, 40(r3)       ; scrittura del risultato in c[i]

loop7:	
	L.D		f0, 48(r1)       ; lettura a[i]
	L.D     f1, 0(r2)        ; lettura b[i]
	L.D		f2, 56(r1)       ; lettura a[i+1]
	L.D     f3, 8(r2)        ; lettura b[i+1]
	L.D		f4, 64(r1)       ; lettura a[i+2]
	L.D     f5, 16(r2)       ; lettura b[i+2]
	MUL.D   f6, f1, f0       ; prodotto tra a[i] e b[i]
	MUL.D   f7, f2, f3       ; prodotto tra a[i+1] e b[i+1]
	MUL.D   f8, f4, f5       ; prodotto tra a[i+2] e b[i+2]
	ADD.D   f9, f6, f7       ; somma dei prodotti parziali
	ADD.D   f10, f9, f8      ; somma dei prodotti parziali
	S.D     f10, 48(r3)       ; scrittura del risultato in c[i]

loop8:	
	L.D		f0, 48(r1)       ; lettura a[i]
	L.D     f1, 24(r2)       ; lettura b[i]
	L.D		f2, 56(r1)       ; lettura a[i+1]
	L.D     f3, 32(r2)       ; lettura b[i+1]
	L.D		f4, 64(r1)       ; lettura a[i+2]
	L.D     f5, 40(r2)       ; lettura b[i+2]
	MUL.D   f6, f1, f0       ; prodotto tra a[i] e b[i]
	MUL.D   f7, f2, f3       ; prodotto tra a[i+1] e b[i+1]
	MUL.D   f8, f4, f5       ; prodotto tra a[i+2] e b[i+2]
	ADD.D   f9, f6, f7       ; somma dei prodotti parziali
	ADD.D   f10, f9, f8      ; somma dei prodotti parziali
	S.D     f10, 56(r3)       ; scrittura del risultato in c[i]

loop9:	
	L.D		f0, 48(r1)       ; lettura a[i]
	L.D     f1, 48(r2)       ; lettura b[i]
	L.D		f2, 56(r1)       ; lettura a[i+1]
	L.D     f3, 56(r2)       ; lettura b[i+1]
	L.D		f4, 64(r1)       ; lettura a[i+2]
	L.D     f5, 64(r2)       ; lettura b[i+2]
	MUL.D   f6, f1, f0       ; prodotto tra a[i] e b[i]
	MUL.D   f7, f2, f3       ; prodotto tra a[i+1] e b[i+1]
	MUL.D   f8, f4, f5       ; prodotto tra a[i+2] e b[i+2]
	ADD.D   f9, f6, f7       ; somma dei prodotti parziali
	ADD.D   f10, f9, f8      ; somma dei prodotti parziali
	S.D     f10, 64(r3)       ; scrittura del risultato in c[i]
	
end:
	HALT                     ; terminazione programma