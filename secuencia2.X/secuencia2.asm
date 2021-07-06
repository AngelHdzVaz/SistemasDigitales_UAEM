  
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
; Empieza Programa
pregunta
	BTFSS   PORTA,0 ;pregunta por bita si es 1
	GOTO	sec0 ; si es falso ira a la combinacion 0, 00 o 10 PREGUNTA POR RA0 = 0 Y ES FALSO
	GOTO	sec1 ; si es verdadero ira a la combinacion 1, 01,11 PREGUNTA POR RA0 = 0 Y ES VERDADERO
	
	
sec0
	
	BTFSS	PORTA,1 ;pregunta por el segundo bit
	GOTO	RotaAutomatico ; 00 secuencia para ir al ser falsa btfss RA0 = 1
	GOTO	NombreS    ; 10 secuencia al ser verdadero la condicio btfss
	
	
sec1
	
	BTFSS	PORTA,1
	GOTO	Push ;01 secuencia al ser falso que sea 1 el RA1 = 1
	GOTO	NombreA   ;11 secuencia al ser verdadero que sea 1 en RA1
	

RotaAutomatico	;00
	BSF	    STATUS,C	    ;Se pone en 1 el Carry status, c = 1
	CLRF	    PORTB	    ;limpia el portb

RUT_1
	BTFSC	    PORTA,0 ;pregunta por bita si es 1
	GOTO	    pregunta  ;si no es RA0 = 0 ira a pregunta
	BTFSC	    PORTA,1 ;pregunta por bita si es 1
	GOTO	    pregunta ; si no es RA1 = 0 ira a pregunta
	RRF	    PORTB,W		    ;Se recorre a la derecha
	MOVWF	    PORTB		    ;Se carga alpuerto b
	CALL	    Retardo_100ms	    ;llama a subrutina
	BTFSS	    PORTB,0		    ;Pregunta si en el indice 0 esta en 1
	GOTO	    RUT_1		    ;si es falso que RA0=1 ira a RUT_1 que es rotamiento a la derecha
	GOTO	    RUT_2		    ;si es verdadero ira a RUT_2 y rotara a la derecha 
	
RUT_2
	BTFSC	    PORTA,0	    ;pregunta por RA0=0 si se cumple salatara la sig. instruccion
	GOTO	    pregunta	    ;si RA0=0 no se cumple ira a pregunta
	BTFSC	    PORTA,1	    ;pregunta por RA1=0 si se cumple saltara la siguiente ntruccion
	GOTO	    pregunta	    ;si RA0=0 no se cumple ira nuevamente a pregunta
	RLF	    PORTB,W	    ;rota el puerto b a la izquierda y guarda en w el dato
	MOVWF	    PORTB	    ;mueve el dato de w(acumulador) y lo manda al puerto b
	
	CALL	    Retardo_100ms   ;llama subrutina
	BTFSS	    PORTB,7	    ;pregunta si el RB7=1 si se cumple saltara la siguiente instruccion
	GOTO	    RUT_2	    ;si no se cumplio RB7=1 ira hacia RUT_2
	GOTO	    RUT_1	    ;ira a la RUT_1
	
	
Push		    ;01
	BSF	    STATUS,C	    ;coloca en 1 el carry status,c = 1
	CLRF	    PORTB	    ;borra el puerto b
	
	;aqui se repite la misma instruccion al entrar a cada ciclo el carry este al inicio de cada extremo
	;del puertob
RotaIzquierda1
	BSF	    STATUS,C	    ;coloca en 1 el carry status,c = 1
	CLRF	    PORTB	     ;borra el puerto b
RotaIzquierda
	BTFSS	    PORTA,0	    ;pregunta por bita si es 1
	GOTO	    sec0	    ; si es falso ira a la combinacion 0, 00 o 10
	BTFSC	    PORTA,1	    ;pregunta por bita si es 1
	GOTO	    pregunta	    ; si es falso ira a la combinacion 0, 00 o 10
	CLRF	    PORTA	    ;limpia el puertoA para evitar valores basura
	BTFSS	    PORTA,2	    ;pregunta si RA2=1 y si se cumple salatara la siguiente instruccion
	GOTO	    RotaDerecha	    ;al no cumplirse RA2=1 ira a rotar derecha
	RLF	    PORTB,W	    ;rota el puerto b y guarda el dato en w
	MOVWF	    PORTB	    ;mueve el dato en w al puerto b
	CALL	    Retardo_200ms   ;llama a un retardo
	BTFSS	    PORTB,7	    ;pregunta si RB7=1 si se cumple saltara la siguiente instruccion
	GOTO	    RotaIzquierda   ;ir a rotaizquierda
	GOTO	    RotaIzquierda1  ;ir a rota derecha
RotaDerecha1
	
	CLRF	    PORTB	    ;limpia puertb
	BSF	    PORTB,7	    ;coloca RB7=1  para comenzar a rotar
RotaDerecha
	BTFSS	    PORTA,0	    ;pregunta RA0=1 si se cumple saltara la siguiente instruccion
	GOTO	    sec0	    ;ir a sec0
	BTFSC	    PORTA,1	    ;pregunta RA1=0 si se cumple salatara la siguiente instruccion
	GOTO	    pregunta	    ;ir a pregunta
	CLRF	    PORTA	    ;limpia el puertoa
	BTFSC	    PORTA,2	    ;pregunta si RA2=0 si se cumple saltara la siguiente instruccion
	GOTO	    RotaIzquierda   ;ir a RotaIzquierda
	RRF	    PORTB,W		    ;Rota a la derecha el puertob y guarda el dato en w
	MOVWF	    PORTB		    ;mueve el dato al puertob
	CALL	    Retardo_200ms	    ;llama retardo
	BTFSS	    PORTB,0		    ;Pregunta si RB0=1 si se cumple salatara la siguiente instruccion
	GOTO	    RotaDerecha		    ;ir a RotaDerecha
	GOTO	    RotaDerecha1	    ;ir a RotaIzquierda
	
	
	
NombreS			    ;10
	
	MOVLW	    0x15	;mueve un 15 hexadecima que es 21 decimal
				;para correr toda la tabla de SANDRA
	MOVWF	    0X40	;mueve el 0x15 al registro 0x40
	MOVLW	    0X00	;mueve un 0 al acumulador
	MOVWF	    0X42	;mueve el 0 al registro 0x42
	CLRW
otra	
	CLRF	    PORTB	    ;limpia el puertob
	BTFSC	    PORTA,0	    ;pregunta si RA0=0 si se cumple saltara la siguiente instruccion
	GOTO	    sec1	    ;ir a sec1
	BTFSS	    PORTA,1	    ;pregunta si RA=1 si es verdadero saltara la siguiente intruccion
	GOTO	    RotaAutomatico  ;de no ser asi ir a rota automatico
	MOVF	    0X42,0	    ;mueve el registro 0x42 a w
	CALL	    SANDRA	    ;llama a la tabla
	MOVWF	    PORTB	    ;mueve w al acumulador
	CALL	    Retardo_200ms   ;llama subrutina
	CALL	    Retardo_200ms
	CLRW			    ;lmpia w
	INCF	    0X42,1	    ;incrementa el registro 0x42 de empezar en 0 ahora sera de 1 y asi sucesivamente
	DECFSZ	    0X40,1	    ;decrementa el registro 0x40 y pregunta si ya es 0 de ser verdad saltara la sig. intruccion
	GOTO	    otra	    ;ir a otra
	GOTO	    NombreS	    ;ir a NombreS
	
	;tabla
SANDRA
	ADDWF	    PCL,1
	RETLW	    b'01101101'	    ;s
	RETLW	    b'01110111'	    ;a
	RETLW	    b'01010100'	    ;n
	RETLW	    b'01011110'	    ;d
	RETLW	    b'01010000'	    ;r
	RETLW	    b'01110111'	    ;a
	RETLW	    b'01111100'	    ;b
	RETLW	    b'01010000'	    ;r
	RETLW	    b'00000110'	    ;i
	RETLW	    b'01101101'	    ;s
	RETLW	    b'01111001'	    ;e
	RETLW	    b'01010101'	    ;ñ
	RETLW	    b'00111111'	    ;o
	RETLW	    b'00011100'	    ;v
	RETLW	    b'01110111'	    ;a
	RETLW	    b'00111000'	    ;l
	RETLW	    b'01111001'	    ;e
	RETLW	    b'01010100'	    ;n
	RETLW	    b'00111001'	    ;c
	RETLW	    b'00000110'	    ;i
	RETLW	    b'01110111'	    ;a
	
	
NombreA			    ;11
	MOVLW	    0X15
	MOVWF	    0X30
	MOVLW	    0X00
	MOVWF	    0X32
	CLRW
otra2	
	CLRF	    PORTB
	BTFSS	    PORTA,0	    ;*1 primer bit es uno salta el goto
	GOTO	    sec0	    ;primer bit es diferene de 1 ira a sec0
	BTFSS	    PORTA,1	    ;11
	GOTO	    Push
	MOVF	    0X32,0
	CALL	    ANGEL
	MOVWF	    PORTB
	CALL	    Retardo_200ms
	CALL	    Retardo_200ms
	CLRW
	INCF	    0X32,1
	DECFSZ	    0X30,1
	GOTO	    otra2
	GOTO	    NombreA
ANGEL
	    
	ADDWF	    PCL,1	    ;Agrega el contador de programa lo obtenido en w(0x32)
	RETLW	    b'01110111'	    ;a
	RETLW	    b'01010100'	    ;n
	RETLW	    b'01101111'	    ;g
	RETLW	    b'01111001'	    ;e
	RETLW	    b'00111000'	    ;l
	RETLW	    b'01110110'	    ;h
	RETLW	    b'01111001'	    ;e
	RETLW	    b'01010000'	    ;r
	RETLW	    b'01010100'	    ;n
	RETLW	    b'01110111'	    ;a
	RETLW	    b'01010100'	    ;n
	RETLW	    b'01011110'	    ;d
	RETLW	    b'01111001'	    ;e
	RETLW	    b'01011011'	    ;z
	RETLW	    b'00011100'	    ;v
	RETLW	    b'01110111'	    ;a
	RETLW	    b'01011011'	    ;z
	RETLW	    b'01100111'	    ;q
	RETLW	    b'00111110'	    ;u
	RETLW	    b'01111001'	    ;e
	RETLW	    b'01011011'	    ;z

						    
INCLUDE    <RETARDOS.inc>					
    END    



