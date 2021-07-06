    list        p=16f887    ; list directive to define processor
    #include    <p16f887.inc>   ; processor specific variable definitions

; '__CONFIG' directive is used to embed configuration data within .asm file.
; The labels following the directive are located in the respective .inc file.
; See respective data sheet for additional information on configuration word.

    __CONFIG    _CONFIG1, _LVP_OFF & _FCMEN_ON & _IESO_OFF & _BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_ON & _WDT_OFF & _INTRC_OSC_NOCLKOUT
    __CONFIG    _CONFIG2, _WRT_OFF & _BOR21V
;**********************************************************************
RESET_VECTOR    CODE    0x0000 ; processor reset vector
    nop
    goto    start              ; go to beginning of program

INT_VECTOR      CODE    0x0004 ; interrupt vector location


MAIN_PROG       CODE


start
	bsf		 STATUS,RP0			;ACCESO AL BANCO 1
	bcf	 	 STATUS,RP1
	movlw		 b'00000011'
	movwf		 TRISA
	CLRW
	clrf		 TRISB			;CONFIGURO PORTB COMO SALIDA
	bsf		 STATUS,RP1			;ACCESO AL BANCO 3
	clrf		 ANSEL			;CONFIGURACION DE SALIDAS DIGITALES
	clrf		 ANSELH			;CONFIGURACION DE ENTRADAS DIGITALES
	bcf		 STATUS,RP0			;ACCESO AL BANCO 0
	bcf		 STATUS,RP1
	
; Empieza Programa
pregunta
	btfss   PORTA,0 ;pregunta por bita si es 1
	goto	p1e0 ; si es falso ira a la combinacion 0, 00 o 10
	goto	p1e1 ; si es verdadero ira a la combinacion 1, 01,11
	
	
p1e0
	bsf	STATUS,C	
	clrf	PORTB
	btfss	PORTA,1 ;pregunta por el segundo bit
	goto	RotaIzquierda ; 00
	goto	Combinado    ; 10
	
	
p1e1
	bsf	STATUS,C	
	clrf	PORTB
	btfss	PORTA,1
	goto	RotaDerecha ;01
	goto	Secuencia   ;11
	
					;termina uso del codigo			
RotaDerecha ;01
	
	btfss	PORTA,0	    ;*1 primer bit es uno salta el goto
	goto	p1e0	    ;*1 primer bit es diferene de 0 ira a p1e0
	btfsc	PORTA,1	    ;01 pregunta si el segunto bit es 0
	goto	Secuencia   ;11 ira a la secuencia combinado
	call	Retardo_200ms		; delay
	call	Retardo_200ms		; delay
	call	Retardo_200ms		
	rlf	PORTB,F
	btfss	STATUS,C
	goto	RotaDerecha
	goto	RotaDerecha
	
	
					;aqui empieza rota izquierda
RotaIzquierda ;00
	
	btfsc	PORTA,0	    ;*1 primer bit es uno salta el goto
	goto	p1e1	    ;*1 primer bit es diferene de 0 ira a p1e0
	btfsc	PORTA,1	    ;01 pregunta si el segunto bit es 0
	goto	Combinado   ;11 ira a la secuencia combinado
	call	Retardo_200ms		; delay
	call	Retardo_200ms		; delay
	call	Retardo_200ms		
	rrf	PORTB,F
	btfss	STATUS,C
	goto	RotaIzquierda
	goto	RotaIzquierda
					;aqui termina rota izquierda
					
					
					
Combinado ;10
	
RotaPrimero
	btfsc   PORTA,0	    ;*0 primer bit es cero salta el goto
	goto	p1e1	    ;primer bit es diferene de 0 ira a p1e0
	btfss	PORTA,1	    ;10
	goto	RotaIzquierda	    ;00
	call	Retardo_200ms
	call	Retardo_200ms		; delay
	call	Retardo_200ms		
	rlf	PORTB,F
	btfss	STATUS,C
	goto	RotaPrimero
	goto	RotaSegundo
RotaSegundo
	btfsc   PORTA,0	    ;*0 primer bit es cero salta el goto
	goto	p1e1	    ;primer bit es diferene de 0 ira a p1e0
	btfss	PORTA,1	    ;10
	goto	RotaIzquierda
	call	Retardo_200ms
	call	Retardo_200ms		; delay
	call	Retardo_200ms		
	rrf	PORTB,F
	btfss	STATUS,C
	goto	RotaSegundo
	goto    RotaPrimero		;aqui termina cominacion
			
					    ;aqui empieza secuencia
Secuencia ;11
	MOVLW				0X07
	MOVWF				0X20
	MOVLW				0X00
	MOVWF				0X22
	CLRW
otra	
	clrf	PORTB
	btfss   PORTA,0	    ;*1 primer bit es cero salta el goto
	goto	p1e0	    ;primer bit es diferene de 0 ira a p1e0
	btfss	PORTA,1	    ;00
	goto	RotaDerecha
	;01
	MOVF				0X22,0
	CALL				SERRA
	MOVWF				PORTB
	CALL				Retardo_200ms
	CALL				Retardo_200ms
	CALL				Retardo_200ms
	INCF				0X22,1
	DECFSZ				0X20,1
	GOTO 				otra
	GOTO				Secuencia
	INCLUDE    <RETARDOS.inc>
SERRA
	ADDWF PCL,F
	RETLW 0X18 ;00011000
	RETLW 0X24 ;00100100
	RETLW 0X42 ;01000010
	RETLW 0X81
	RETLW 0X81 ;10000001
	RETLW 0X42 ;01000010
	RETLW 0X24 ;00100100
	RETLW 0X18 ;00011000
						    ;aqui termina secuencia

    END    



