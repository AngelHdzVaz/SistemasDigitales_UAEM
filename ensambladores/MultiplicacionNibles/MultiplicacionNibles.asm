
	list		p=16f887	; list directive to define processor
	#include	<p16f887.inc>	; processor specific variable definitions

	__CONFIG    _CONFIG1, _LVP_OFF & _FCMEN_ON & _IESO_OFF & _BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_ON & _WDT_OFF & _INTRC_OSC_NOCLKOUT
	__CONFIG    _CONFIG2, _WRT_OFF & _BOR21V

;********************** VARIABLE DEFINITIONS *************************** 
	CBLOCK 0x20
	N1
	N2
	ENDC

;***********************************************************************

	ORG     0x000             ; processor reset vector
	nop
  	goto    INICIO              ; go to beginning of program

;ZONA DE CODIGOS********************************************************

INICIO
	bsf		 STATUS,RP0			;ACCESO AL BANCO 1
	bcf	 	 STATUS,RP1
	movlw		 b'11111111'    ;CONFIGURO PORTA COMO ENTRADAS
	movwf		 TRISA
	clrf		 TRISB			;CONFIGURO PORTB COMO SALIDA
	bsf		 STATUS,RP1			;ACCESO AL BANCO 3
	clrf		 ANSEL			;CONFIGURACION DE SALIDAS DIGITALES
	clrf		 ANSELH			;CONFIGURACION DE ENTRADAS DIGITALES
	bcf		 STATUS,RP0			;ACCESO AL BANCO 0
	bcf		 STATUS,RP1
PRINCIPAL
	movf		 PORTA,W        ;CARGO A W = PORTA
	movwf		 N1
	movwf		 N2
	movlw		 b'00001111'
    swapf		 N2,1
	andwf		 N1,1
	andwf		 N2,1
	movf		 N2,W
	andlw		 b'00001111'
	addwf		 PCL,F
TABLA
	goto		Mulx0
	goto		Mulx1
	goto		Mulx2
	goto		Mulx3
	goto		Mulx4
	goto		Mulx5
	goto		Mulx6
	goto		Mulx7
	goto		Mulx8
	goto		Mulx9
	goto		Mulx10
	goto		Mulx11
	goto		Mulx12
	goto		Mulx13
	goto		Mulx14
	goto		Mulx15
Mulx0
	movlw		b'00000000'
	goto		Salida
Mulx1
	movf		N1,W
	goto		Salida
Mulx2
	rlf			N1,W
	goto		Salida
Mulx3
	movf		N1,W
	rlf			N1,F
	addwf		N1,W
	goto		Salida
Mulx4
	rlf			N1,F
	rlf			N1,W
	goto		Salida
Mulx5
	movf		N1,W
	rlf			N1,F
	rlf			N1,F
	addwf		N1,W
	goto		Salida
Mulx6
	movf		N1,W
	rlf			N1,F
	rlf			N1,F
	addwf		N1,F
	addwf		N1,W
	goto		Salida
Mulx7
	movf		N1,W
	rlf			N1,F
	rlf			N1,F
	addwf		N1,F
	addwf		N1,F
	addwf		N1,W
	goto		Salida
Mulx8
	rlf			N1,F
	rlf			N1,F
	rlf			N1,W
	goto		Salida
Mulx9
	movf		N1,W
	rlf			N1,F
	rlf			N1,F
	rlf			N1,F
	addwf		N1,W
	goto		Salida
Mulx10
	movf		N1,W
	rlf			N1,F
	rlf			N1,F
	rlf			N1,F
	addwf		N1,F
	addwf		N1,W
	goto		Salida
Mulx11
	movf		N1,W
	rlf			N1,F
	rlf			N1,F
	rlf			N1,F
	addwf		N1,F
	addwf		N1,F
	addwf		N1,W
	goto		Salida
Mulx12
	movf		N1,W
	rlf			N1,F
	rlf			N1,F
	rlf			N1,F
	addwf		N1,F
	addwf		N1,F
	addwf		N1,F
	addwf		N1,W
	goto		Salida
Mulx13
	movf		N1,W
	rlf			N1,F
	rlf			N1,F
	rlf			N1,F
	addwf		N1,F
	addwf		N1,F
	addwf		N1,F
	addwf		N1,F
	addwf		N1,W
	goto		Salida
Mulx14
	movf		N1,W
	rlf			N1,F
	rlf			N1,F
	rlf			N1,F
	addwf		N1,F
	addwf		N1,F
	addwf		N1,F
	addwf		N1,F
	addwf		N1,F
	addwf		N1,W
	goto		Salida
Mulx15
	movf		N1,W
	rlf			N1,F
	rlf			N1,F
	rlf			N1,F
	addwf		N1,F
	addwf		N1,F
	addwf		N1,F
	addwf		N1,F
	addwf		N1,F
	addwf		N1,F
	addwf		N1,W
	goto		Salida
Salida 	
	movwf		 PORTB          ;MOSTRAMOS POR EL PORTB LO QUE SE CARGO EN W 
	goto		 PRINCIPAL      
	END

	
			