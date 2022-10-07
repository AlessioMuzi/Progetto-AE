.data
a:		  .double 4.2,7.2,3.4,7.7,4.3,6.9,5.7,8.1,6.1  ; input: matrice A
b:        .double 1.4,3.0,2.1,1.9,2.4,1.6,2.8,1.2,2.1  ; input: matrice B
c:        .double 0,0,0,0,0,0,0,0,0                    ; output: matrice risultato
elementi: .word   9                                    ; numero elementi
counterR: .word   3                                    ; contatore righe
counterC: .word   3                                    ; contatore colonne

.text
start:	
    DADDI   r1, r0, a        ; puntatore al primo elemento della matrice A
	DADDI   r2, r0, b        ; puntatore al primo elemento della matrice B
	DADDI   r3, r0, c        ; puntatore al primo elemento della matrice risultato
	LW      r5, elementi(r0) ; numero degli elementi delle matrici
	LW      r6, counterR(r0) ; contatore righe
	LW      r7, counterC(r0) ; contatore colonne
	
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
	ADD.D   f9, f6, f7       ; somma dei prodotti parziali
	ADD.D   f10, f9, f8      ; somma dei prodotti parziali

controllo:	
	DADDI   r5, r5, -1       ; decremento contatore elementi
	DADDI   r6, r6, -1       ; decremento contatore righe
	DADDI   r7, r7, -1       ; decremento contatore colonne
    S.D     f10, 0(r3)       ; scrittura del risultato in c[i]
 	DADDI   r3, r3, 8        ; spostamento puntatore matrice risultato	
	SUB.D   f10, f10, f10    ; reset del registro delle somme parziali
	BNEZ    r6, righe        ; se il contatore delle righe è =/= 0, torna all'inizio della riga
	LW      r6, counterR(r0) ; altrimenti, reset contatore righe e 
	J       endif_1          ; salta

;selettore righe/colonne
righe:
    DADDI   r1, r1, -24      ; torna all'inizio della riga

endif_1:
	BEQZ    r7, colonne      ; se il contatore delle colonne è = 0, torna al primo elemento della matrice B
	J       endif_2          ; altrimenti, salta

colonne:
	DADDI   r2, r2, -72      ; torna al primo elemento della matrice B
	LW      r7, counterC(r0) ; reset contatore colonne

endif_2:
	BNEZ    r5, loop         ; se ci sono ancora elementi, ricomincia il ciclo
	
end:
	HALT                     ; terminazione programma