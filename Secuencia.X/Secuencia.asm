
    list		p=16f887	; list directive to define processor
	#include	<p16f887.inc>	; processor specific variable definitions

	__CONFIG    _CONFIG1, _LVP_OFF & _FCMEN_ON & _IESO_OFF & _BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_ON & _WDT_OFF & _INTRC_OSC_NOCLKOUT
	__CONFIG    _CONFIG2, _WRT_OFF & _BOR21V

;********************** VARIABLE DEFINITIONS *************************** 
	CBLOCK 0x20
	SECUENCIA
	ENDC

;***********************************************************************

	ORG     0x000             ; processor reset vector
	NOP
  	GOTO    CONFIG_PTOS             ; go to beginning of program

;ZONA DE CODIGOS********************************************************
    
    
    
	
CONFIG_PTOS
	
	BSF		STATUS,RP0	    ;Cambio al banco 1
	MOVLW		.0
	MOVWF		TRISB
	MOVLW		0X7F
	MOVWF		TRISC
	
	BSF		STATUS,RP1	    ;Cambio al banco 2
	CLRF		ANSELH		    ;config puerto b digital
	BCF		STATUS,RP0	    ;Cambio al banco 0
	BCF		STATUS,RP1
	CLRF		PORTA		    ;Limpio puertos
	CLRF		PORTB
	CLRF		PORTC
	BSF		PORTC,7
	

	INICIO
	
	BSF		STATUS,C	    ;Se pone en 1 el Carry

RUT_1
	RRF		PORTB,W		    ;Se recorre a la derecha
	MOVWF		PORTB		    ;Se carga alpuerto b
	CALL		Retardo_200ms
	BTFSS		PORTB,0		    ;Pregunta si en el indice 0 esta en 1
	GOTO		RUT_1
	GOTO		RUT_2
	
RUT_2
	RLF		PORTB,W
	MOVWF		PORTB
	
	CALL		Retardo_200ms
	BTFSS		PORTB,7
	GOTO		RUT_2
	GOTO		RUT_1
	
	INCLUDE<RETARDOS.INC>
	
	END