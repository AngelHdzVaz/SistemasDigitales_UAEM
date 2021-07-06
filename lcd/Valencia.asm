 list        p=16f887    ; list directive to define processor
    #include    <p16f887.inc>   ; processor specific variable definitions

; '__CONFIG' directive is used to embed configuration data within .asm file.
; The labels following the directive are located in the respective .inc file.
; See respective data sheet for additional information on configuration word.

    __CONFIG    _CONFIG1, _LVP_OFF & _FCMEN_ON & _IESO_OFF & _BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_ON & _WDT_OFF & _INTRC_OSC_NOCLKOUT
    __CONFIG    _CONFIG2, _WRT_OFF & _BOR21V
;**********************************************************************
    nop
    goto    INICIO              ; go to beginning of program
       
INICIO

	CLRF	PORTB
	CLRF	PORTD
	BSF	STATUS,RP0
	BCF	STATUS,RP1
	CLRF	TRISB
	CLRF	TRISD
	BCF	STATUS,RP0

	
START
	CALL	Retardo_5s
	CALL    LCD_Inicializa
	CALL    MENSAJE_1
	CALL    LCD_Linea2
	CALL    MENSAJE_2
	CALL	Retardo_10s
	GOTO    START

MENSAJE_1
	MOVLW   'E'
	MOVWF   PORTB
	CALL    LCD_Envia
	MOVLW   'M'
	MOVWF   PORTB
	CALL    LCD_Envia
	MOVLW   'A'
	MOVWF   PORTB
	CALL    LCD_Envia
	MOVLW   'N'
	MOVWF   PORTB
	CALL    LCD_Envia
	MOVLW   'U'
	MOVWF   PORTB
	CALL    LCD_Envia
	MOVLW   'E'
	MOVWF   PORTB
	CALL    LCD_Envia
	MOVLW   'L'
	MOVWF   PORTB
	CALL    LCD_Envia
	MOVLW   ' '
	MOVWF   PORTB
	CALL    LCD_Envia
	MOVLW   'V'
	MOVWF   PORTB
	CALL    LCD_Envia
	MOVLW   'A'
	MOVWF   PORTB
	CALL    LCD_Envia
	MOVLW   'L'
	MOVWF   PORTB
	CALL    LCD_Envia
	MOVLW   'E'
	MOVWF   PORTB
	CALL    LCD_Envia
	MOVLW   'N'
	MOVWF   PORTB
	CALL    LCD_Envia
	MOVLW   'C'
	MOVWF   PORTB
	CALL    LCD_Envia
	MOVLW   'I'
	MOVWF   PORTB
	CALL    LCD_Envia
	MOVLW   'A'
	MOVWF   PORTB
	CALL    LCD_Envia
	RETURN
MENSAJE_2
	MOVLW   'I'
	MOVWF   PORTB
	CALL    LCD_Envia
	MOVLW   'N'
	MOVWF   PORTB
	CALL    LCD_Envia
	MOVLW   'G'
	MOVWF   PORTB
	CALL    LCD_Envia
	MOVLW   '.'
	MOVWF   PORTB
	CALL    LCD_Envia
	MOVLW   ' '
	MOVWF   PORTB
	CALL    LCD_Envia
	MOVLW   'C'
	MOVWF   PORTB
	CALL    LCD_Envia
	MOVLW   'O'
	MOVWF   PORTB
	CALL    LCD_Envia
	MOVLW   'M'
	MOVWF   PORTB
	CALL    LCD_Envia
	MOVLW   'P'
	MOVWF   PORTB
	CALL    LCD_Envia
	MOVLW   'U'
	MOVWF   PORTB
	CALL    LCD_Envia
	MOVLW   'T'
	MOVWF   PORTB
	CALL    LCD_Envia
	MOVLW   'A'
	MOVWF   PORTB
	CALL    LCD_Envia
	MOVLW   'C'
	MOVWF   PORTB
	CALL    LCD_Envia
	MOVLW   'I'
	MOVWF   PORTB
	CALL    LCD_Envia
	MOVLW   'O'
	MOVWF   PORTB
	CALL    LCD_Envia
	MOVLW   'N'
	MOVWF   PORTB
	CALL    LCD_Envia
	RETURN
	
	INCLUDE <LCD.inc>
	INCLUDE <RETARDOS.INC>
	END


