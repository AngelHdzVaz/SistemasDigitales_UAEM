
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
	BSF		 PORTC,7
PRINCIPAL
	
	BSF		STATUS,C
	MOVLW		0X80
	

RUT_1
	MOVF		0X20,W
	MOVWF		PORTB
	CALL		Retardo_200ms
	RRF		PORTB,W
	MOVWF		0X20
	BTFSS		PORTB,0
	GOTO		RUT_1
	GOTO		RUT_2

RUT_2
	MOVF		0X20,W
	MOVWF		PORTB
	CALL		Retardo_200ms
	RLF		PORTB,W
	MOVWF		0X20
	BTFSS		PORTB,7
	GOTO		RUT_2
	GOTO		RUT_1
	INCLUDE <Retardos.inc>  
	
	END

	
			


