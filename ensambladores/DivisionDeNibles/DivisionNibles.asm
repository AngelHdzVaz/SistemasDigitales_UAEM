	list		p=16f887	; list directive to define processor
	#include	<p16f887.inc>	; processor specific variable definitions

	__CONFIG    _CONFIG1, _LVP_OFF & _FCMEN_ON & _IESO_OFF & _BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_ON & _WDT_OFF & _INTRC_OSC_NOCLKOUT
	__CONFIG    _CONFIG2, _WRT_OFF & _BOR21V

;********************** VARIABLE DEFINITIONS *************************** 
	CBLOCK 0x20
	N1
	N2
	cont
	temp1
	temp2
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
	movwf		N1			   ;N1 = W	
	movwf		N2			   ;N2 = W
	movlw		b'00001111'    ;W = 00001111
    swapf		N2,1		   ;SE INVIERTEN LOS NIBLES EN N2	
	andwf		N1,1		   ;SE HACE UN FILTRO A N1	
	andwf		N2,1		   ;SE HACE UN FILTRO A N2	
	movf		N2,W		   ;W = N2	
	movwf		temp2		   ;temp2 = N2	
	movf		N1,W		   ;W = N1	
	movwf		temp1		   ;temp1 = N1
	movf		temp2,W		   ;W = temp2	
;Primero necesitamos saber si es posible hacer la division
	movf		N2,F		   ;N2 = N2 si Z=1 salta
	btfss		STATUS,Z	   ;Si Z=1 salta a DivisionPorCero en caso contrario RestaDeTest		
	goto		RestaDeTest		
	goto		DivisionPorCero	
DivisionPorCero
	movlw		b'11111111'
	movwf		PORTB
	goto		PRINCIPAL
RestaDeTest
	subwf	    N1,F
	btfsc		STATUS,C
	goto		MayorIgual
Menor
	movlw		b'11111111'
	movwf		PORTB
	goto		PRINCIPAL
MayorIgual
	btfsc		STATUS,Z
	goto		Igual
Mayor
	incf		cont,F          
	movf		N2,W
	subwf		N1,F
	btfsc		STATUS,C
	goto		MayorIgual2
Menor2
	movf		N2,W
	addwf		N1,F
	bcf			STATUS,C
	rlf			N1,F
	rlf			N1,F
	rlf			N1,F
	rlf			N1,F
	movf		cont,W
	iorwf		N1,W
	movwf		PORTB
	goto		PRINCIPAL
MayorIgual2	
	btfsc		STATUS,Z
	goto		Igual
	goto		Mayor
Igual
	incf		cont,F
	movf		cont,W		
	movwf		PORTB
	goto		PRINCIPAL      
	END

