.data
a:		  .double 4.2,7.2,3.4,7.7,4.3,6.9,5.7,8.1,6.1  ; input: matrice A
b:        .double 1.4,3.0,2.1,1.9,2.4,1.6,2.8,1.2,2.1  ; input: matrice B
c:        .double 0,0,0,0,0,0,0,0,0                    ; output: matrice risultato

.text
start:	
    DADDI   r1, r0, a        ; puntatore al primo elemento della matrice A
	DADDI   r2, r0, b        ; puntatore al primo elemento della matrice B
	DADDI   r3, r0, c        ; puntatore al primo elemento della matrice risultato
	
loop:
	L.D		f0, 0(r1)        ; lettura a[i]
	L.D     f1, 0(r2)        ; lettura b[i]
	L.D		f2, 8(r1)        ; lettura a[i+1]
	L.D     f3, 8(r2)        ; lettura b[i+1]
	L.D		f4, 16(r1)       ; lettura a[i+2]
	L.D     f5, 16(r2)       ; lettura b[i+2]
	MUL.D   f6, f1, f0       ; prodotto tra a[i] e b[i]
	MUL.D   f7, f2, f3       ; prodotto tra a[i+1] e b[i+1]
	MUL.D   f8, f4, f5       ; prodotto tra a[i+2] e b[i+2]
	L.D		f11, 0(r1)       ; lettura a[i]
	L.D     f12, 24(r2)      ; lettura b[i]
	L.D		f13, 8(r1)       ; lettura a[i+1]
	L.D     f14, 32(r2)      ; lettura b[i+1]
	ADD.D   f9, f6, f7       ; somma dei prodotti parziali
	L.D		f15, 16(r1)      ; lettura a[i+2]
	L.D     f16, 40(r2)      ; lettura b[i+2]
	ADD.D   f10, f9, f8      ; somma dei prodotti parziali	
	MUL.D   f17, f12, f11    ; prodotto tra a[i] e b[i]
	MUL.D   f18, f13, f14    ; prodotto tra a[i+1] e b[i+1]
	MUL.D   f19, f15, f16    ; prodotto tra a[i+2] e b[i+2]
	S.D     f10, 0(r3)       ; scrittura del risultato in c[i]
	L.D		f0, 0(r1)        ; lettura a[i]
	L.D     f1, 48(r2)       ; lettura b[i]
	L.D		f2, 8(r1)        ; lettura a[i+1]
	L.D     f3, 56(r2)       ; lettura b[i+1]
	ADD.D   f20, f17, f18    ; somma dei prodotti parziali
	L.D		f4, 16(r1)       ; lettura a[i+2]
	L.D     f5, 64(r2)       ; lettura b[i+2]
	ADD.D   f21, f20, f19    ; somma dei prodotti parziali	
	MUL.D   f6, f1, f0       ; prodotto tra a[i] e b[i]
	MUL.D   f7, f2, f3       ; prodotto tra a[i+1] e b[i+1]
	MUL.D   f8, f4, f5       ; prodotto tra a[i+2] e b[i+2]
	S.D     f21, 8(r3)       ; scrittura del risultato in c[i]
	L.D		f11, 24(r1)      ; lettura a[i]
	L.D     f12, 0(r2)       ; lettura b[i]
	L.D		f13, 32(r1)      ; lettura a[i+1]
	L.D     f14, 8(r2)       ; lettura b[i+1]
	ADD.D   f9, f6, f7       ; somma dei prodotti parziali
	L.D		f15, 40(r1)      ; lettura a[i+2]
	L.D     f16, 16(r2)      ; lettura b[i+2]
	ADD.D   f10, f9, f8      ; somma dei prodotti parziali	
	MUL.D   f17, f12, f11    ; prodotto tra a[i] e b[i]
	MUL.D   f18, f13, f14    ; prodotto tra a[i+1] e b[i+1]
	MUL.D   f19, f15, f16    ; prodotto tra a[i+2] e b[i+2]
	S.D     f10, 16(r3)      ; scrittura del risultato in c[i]
	L.D		f0, 24(r1)       ; lettura a[i]
	L.D     f1, 24(r2)       ; lettura b[i]
	L.D		f2, 32(r1)       ; lettura a[i+1]
	L.D     f3, 32(r2)       ; lettura b[i+1]
	L.D		f4, 40(r1)       ; lettura a[i+2]
	L.D     f5, 40(r2)       ; lettura b[i+2]
	ADD.D   f20, f17, f18    ; somma dei prodotti parziali
	L.D		f4, 40(r1)       ; lettura a[i+2]
	L.D     f5, 40(r2)       ; lettura b[i+2]
	ADD.D   f21, f20, f19    ; somma dei prodotti parziali	
	MUL.D   f6, f1, f0       ; prodotto tra a[i] e b[i]
	MUL.D   f7, f2, f3       ; prodotto tra a[i+1] e b[i+1]
	MUL.D   f8, f4, f5       ; prodotto tra a[i+2] e b[i+2]
	S.D     f21, 24(r3)      ; scrittura del risultato in c[i]
	L.D		f11, 24(r1)      ; lettura a[i]
	L.D     f12, 48(r2)      ; lettura b[i]
	L.D		f13, 32(r1)      ; lettura a[i+1]
	L.D     f14, 56(r2)      ; lettura b[i+1]
	ADD.D   f9, f6, f7       ; somma dei prodotti parziali
	L.D		f15, 40(r1)      ; lettura a[i+2]
	L.D     f16, 64(r2)      ; lettura b[i+2]
	ADD.D   f10, f9, f8      ; somma dei prodotti parziali	
	MUL.D   f17, f12, f11    ; prodotto tra a[i] e b[i]
	MUL.D   f18, f13, f14    ; prodotto tra a[i+1] e b[i+1]
	MUL.D   f19, f15, f16    ; prodotto tra a[i+2] e b[i+2]
	S.D     f10, 32(r3)      ; scrittura del risultato in c[i]
	L.D		f0, 48(r1)       ; lettura a[i]
	L.D     f1, 0(r2)        ; lettura b[i]
	L.D		f2, 56(r1)       ; lettura a[i+1]
	L.D     f3, 8(r2)        ; lettura b[i+1]
	ADD.D   f20, f17, f18    ; somma dei prodotti parziali
	L.D		f4, 64(r1)       ; lettura a[i+2]
	L.D     f5, 16(r2)       ; lettura b[i+2]
	ADD.D   f21, f20, f19    ; somma dei prodotti parziali	
	MUL.D   f6, f1, f0       ; prodotto tra a[i] e b[i]
	MUL.D   f7, f2, f3       ; prodotto tra a[i+1] e b[i+1]
	MUL.D   f8, f4, f5       ; prodotto tra a[i+2] e b[i+2]
	S.D     f21, 40(r3)      ; scrittura del risultato in c[i]
    L.D		f11, 48(r1)      ; lettura a[i]
	L.D     f12, 24(r2)      ; lettura b[i]
	L.D		f13, 56(r1)      ; lettura a[i+1]
	L.D     f14, 32(r2)      ; lettura b[i+1]
	ADD.D   f9, f6, f7       ; somma dei prodotti parziali
	L.D		f15, 64(r1)      ; lettura a[i+2]
	L.D     f16, 40(r2)      ; lettura b[i+2]
	ADD.D   f10, f9, f8      ; somma dei prodotti parziali
	MUL.D   f17, f12, f11    ; prodotto tra a[i] e b[i]
	MUL.D   f18, f13, f14    ; prodotto tra a[i+1] e b[i+1]
	MUL.D   f19, f15, f16    ; prodotto tra a[i+2] e b[i+2]
	S.D     f10, 48(r3)      ; scrittura del risultato in c[i]
	L.D		f0, 48(r1)       ; lettura a[i]
	L.D     f1, 48(r2)       ; lettura b[i]
	L.D		f2, 56(r1)       ; lettura a[i+1]
	L.D     f3, 56(r2)       ; lettura b[i+1]
	ADD.D   f20, f17, f18    ; somma dei prodotti parziali
	L.D		f4, 64(r1)       ; lettura a[i+2]
	L.D     f5, 64(r2)       ; lettura b[i+2]
	ADD.D   f21, f20, f19    ; somma dei prodotti parziali	
	MUL.D   f6, f1, f0       ; prodotto tra a[i] e b[i]
	MUL.D   f7, f2, f3       ; prodotto tra a[i+1] e b[i+1]
	MUL.D   f8, f4, f5       ; prodotto tra a[i+2] e b[i+2]
	S.D     f21, 56(r3)      ; scrittura del risultato in c[i]
	ADD.D   f9, f6, f7       ; somma dei prodotti parziali
	ADD.D   f10, f9, f8      ; somma dei prodotti parziali
	S.D     f10, 64(r3)      ; scrittura del risultato in c[i]
	
end:
	HALT                     ; terminazione programma