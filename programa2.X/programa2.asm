
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
	
	
DENUEVO
	BSF		 PORTC,7
	MOVF		 PORTA,w
	ANDLW		 0X0F	;parte baja
	MOVWF		 0X20	;aqui esta parte baja
	MOVF	         PORTA,w ;mueves lo del puerto a a w
	ANDLW		 0XF0    ;mantenermos solo lo importante
	MOVWF		 0X30   ;mueves a la 30 todo
	SWAPF		 0X30,F ;invertimos bits
	MOVF		 0X30,w  ;movemos al acumulador parte alta ya invertida
	ANDWF            0X20,W
	XORLW		 .105
	MOVWF		 PORTB
	
    END    



