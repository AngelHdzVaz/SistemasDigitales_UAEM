
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
;Empieza programa
;MANDA DATOS
   PATRICIO	
	MOVF PORTA,W
	CALL TABLA
	MOVWF PORTB
	GOTO PATRICIO 
	
TABLA
	ADDWF PCL,F
	RETLW B'10111111' ;0
	RETLW B'10000110' ;1
	RETLW B'11011011' ;2
	RETLW B'11001111' ;3 
	RETLW B'11100110' ;4
	RETLW B'11101101'
	RETLW B'11111101'
	RETLW B'11000111'
	RETLW B'11111111'
	RETLW B'11100111'
	RETLW B'11110111'
	RETLW B'11111100'
	RETLW B'10111001'
	RETLW B'11011110'
	RETLW B'11111001'
	RETLW B'11110001'
	
	
END

