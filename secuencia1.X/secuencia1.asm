
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
  	goto    start            ; go to beginning of program
start
	BSF		 STATUS,RP0			;ACCESO AL BANCO 1
	MOVLW		 0XFF
	MOVWF		 TRISA
	MOVLW		 0X7F
	MOVWF		 TRISC			;CONFIGURO PORTB COMO SALIDA
	CLRF		 TRISB
	
	BSF		 STATUS,RP1			;ACCESO AL BANCO 3
	CLRF		 ANSEL			;CONFIGURACION DE SALIDAS DIGITALES
	CLRF		 ANSELH			;CONFIGURACION DE ENTRADAS DIGITALES
	BCF		 STATUS,RP0			;ACCESO AL BANCO 0
	BCF		 STATUS,RP1
	CLRF		 PORTA
	CLRF		 PORTB
	CLRF		 PORTC
	BSF		 PORTC,7
	
	

PRINCIPAL
	BSF	STATUS,C	
	CLRF	PORTB
	BTFSS	PORTA,0
	GOTO	RotaDerecha
	GOTO	RotaIzquierda
RotaIzquierda
	CLRF	PORTA
	BTFSC	PORTA,0
	GOTO	RotaDerecha
	CALL	Retardo_100ms
	RLF	PORTB,F
	BTFSS	STATUS,C
	GOTO	RotaIzquierda
	GOTO	RotaIzquierda
RotaDerecha
	CLRF PORTA
	BTFSC PORTA,0
	GOTO	RotaIzquierda
	CALL	Retardo_100ms
	RRF	PORTB,F
	BTFSS	STATUS,C
	GOTO	RotaDerecha
	GOTO    RotaDerecha
	
	INCLUDE <Retardos.inc>  
    END    
