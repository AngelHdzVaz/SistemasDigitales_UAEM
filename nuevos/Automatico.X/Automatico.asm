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
	clrf		 TRISB			;CONFIGURO PORTB COMO SALIDA
	bsf		 STATUS,RP1			;ACCESO AL BANCO 3
	clrf		 ANSEL			;CONFIGURACION DE SALIDAS DIGITALES
	clrf		 ANSELH			;CONFIGURACION DE ENTRADAS DIGITALES
	bcf		 STATUS,RP0			;ACCESO AL BANCO 0
	bcf		 STATUS,RP1
; Empieza Programa
programa
	MOVLW				0X16
	MOVWF				0X20
	MOVLW				0X00
	MOVWF				0X22
	CLRW
otra	
	MOVF				0X22,0
	CALL				SERRA
	MOVWF				PORTB
	CALL				Retardo_200ms
	CALL				Retardo_200ms
	CALL				Retardo_200ms
	CALL				Retardo_200ms
	CALL				Retardo_200ms
	INCF				0X22,1
	DECFSZ				0X20,1
	GOTO 				otra
	GOTO 				start
	INCLUDE    <RETARDOS.inc>
SERRA
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


