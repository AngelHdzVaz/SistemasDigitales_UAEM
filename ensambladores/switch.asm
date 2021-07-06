
    list        p=16f887    ; list directive to define processor
    #include    <p16f887.inc>   ; processor specific variable definitions

; '__CONFIG' directive is used to embed configuration data within .asm file.
; The labels following the directive are located in the respective .inc file.
; See respective data sheet for additional information on configuration word.

    __CONFIG    _CONFIG1, _LVP_OFF & _FCMEN_ON & _IESO_OFF & _BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_ON & _WDT_OFF & _INTRC_OSC_NOCLKOUT
    __CONFIG    _CONFIG2, _WRT_OFF & _BOR21V

RESET_VECTOR    CODE    0x0000 ; processor reset vector
    nop
    goto    start              ; go to beginning of program

INT_VECTOR      CODE    0x0004 ; interrupt vector location

MAIN_PROG       CODE

start

 	MOVLW 0XFF
	MOVWF TRISA
	CLRF ANSEL
	CLRF ANSELH
	BSF STATUS,RP1
	BCF STATUS,RP0
	CLRF PORTA
	CLRF PORTB
	MOVF PORTA,0
	CALL TABLA_1
	MOVWF PORTB
	


TABLA_1:
	ADDWF PCL,1
	RETLW B'00011111'
	RETLW B'00000110'
	RETLW B'01011011'
	RETLW B'01001111'
	RETLW B'01100110'
	RETLW B'01101101'
	RETLW B'01111101'
	RETLW B'01000111'
	RETLW B'01111111'
	RETLW B'01100111'
	RETLW B'01110111'
	RETLW B'01111100'
	RETLW B'00111001'
	RETLW B'01011110'
	RETLW B'01111001'
	RETLW B'01110011'

    
    END                       ; directive 'end of program'
