
	list		p=16f887	; list directive to define processor
	#include	<p16f887.inc>	; processor specific variable definitions

	__CONFIG    _CONFIG1, _LVP_OFF & _FCMEN_ON & _IESO_OFF & _BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_ON & _WDT_OFF & _INTRC_OSC_NOCLKOUT
	__CONFIG    _CONFIG2, _WRT_OFF & _BOR21V

;********************** VARIABLE DEFINITIONS *************************** 
	CBLOCK 0x20
	N1
	N2
	cont
	ENDC

;***********************************************************************

	ORG     0x000             ; processor reset vector
	nop
  	goto    INICIO              ; go to beginning of program

;ZONA DE CODIGOS********************************************************

INICIO
	bsf		 	STATUS,RP0	   ;ACCESO AL BANCO 1
	bcf	 	 	STATUS,RP1
	movlw	 	b'11111111'    ;CONFIGURO PORTA COMO ENTRADAS
	movwf	 	TRISA
	clrf	 	TRISB		   ;CONFIGURO PORTB COMO SALIDA
	bsf		 	STATUS,RP1	   ;ACCESO AL BANCO 3
	clrf	 	ANSEL		   ;CONFIGURACION DE SALIDAS DIGITALES
	clrf	 	ANSELH		   ;CONFIGURACION DE ENTRADAS DIGITALES
	bcf		 	STATUS,RP0	   ;ACCESO AL BANCO 0
	bcf		 	STATUS,RP1
PRINCIPAL
	movlw		d'0'
	movwf		cont
	movf		PORTA,W        ;CARGO A W = PORTA
	movwf		N1
	movwf		N2
	movlw		b'00001111'
    swapf		N2,1
	andwf		N1,1
	andwf		N2,1
	movf		N2,W
	subwf	    N1,W
	btfsc		STATUS,C
	goto		MayorIgual
Menor
	movlw		b'00001111'
	movwf		PORTB
	goto		PRINCIPAL
MayorIgual
	btfsc		STATUS,Z
	goto		Igual
Mayor
	movlw		b'11110000'
	movwf		PORTB          ;MOSTRAMOS POR EL PORTB LO QUE SE CARGO EN W 
	goto		PRINCIPAL
Igual
	incf		cont,F
	movf		cont,W		
	movwf		PORTB
	goto		PRINCIPAL      
	END

