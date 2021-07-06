;****************LIBRERIA LCD.INC********

val1 equ 0x30
val2 equ 0x31        

LCD_Inicializa
        bcf PORTD,0      ; RS=0 MODO INSTRUCCION
        movlw 0x01         ; El comando 0x01 limpia la pantalla en el LCD
        movwf PORTB
        call LCD_Comando     ; Se da de alta el comando
        movlw 0x0C       ; Selecciona la primera línea
        movwf PORTB
        call LCD_Comando     ; Se da de alta el comando
        movlw 0x3C       ; Se configura el cursor
        movwf PORTB
        call LCD_Comando     ; Se da de alta el comando
        bsf PORTD, 0     ; Rs=1 MODO DATO
        return
;Subrutina para enviar comandos
LCD_Comando
        bsf PORTD,1        ; Pone la ENABLE en 1
        call DELAY      ; Tiempo de espera
        bcf PORTD, 1    ; ENABLE=0    
        call DELAY
        return     
;Subrutina para enviar un dato
LCD_Envia
        bsf PORTD,0     ; RS=1 MODO DATO
        call LCD_Comando    ; Se da de alta el comando
        return
;Configuración Lineal 2 LCD
LCD_Linea2
        bcf PORTD, 0    ; RS=0 MODO INSTRUCCION
        movlw 0xc0        ; Selecciona linea 2 pantalla en el LCD
        movwf PORTB
        call LCD_Comando    ; Se da de alta el comando
        return
; Subrutina de retardo
DELAY           
        movlw .200
        movwf val2 
ciclo
        movlw .200
        movwf val1
ciclo2
        decfsz val1,1
        goto ciclo2
        decfsz val2,1
        goto ciclo
        return



