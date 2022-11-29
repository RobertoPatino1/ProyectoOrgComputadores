name "Sopa de letras"
.model small
.data
seleccionCategoria db ?
msgInicio db '-----Bienvenido al juego: Sopa de letras----- $'
msgSeleccion1 db 'Selecciona el numero de una categoria para generar la sopa de letras: $'
msgSeleccion2 db '1. Equipos clasificados al mundial de futbol 2022 $'
msgSeleccion3 db '2. Disciplinas deportivas $'
msgSeleccion4 db 'Ingresa una opcion: $'

msgErrorCategoria db 'Ha ingresado una opcion no valida, por favor intente ingresar una opcion nuevamente. '

salto DB 13,10,"$" ;INSTRUCCION DE SALTO DE LINEA
msgContinuar db 'Deseas continuar jugando? (1=Si/0=No) $'


;TODO:
;Agregar variables para otros mensajes y captura de datos ingresados por el usuario


.code
.start
mov cx,0000h



iniciarJuego:
    ;Mensaje de inicio
    mov ah,09h
    lea dx,msgInicio
    int 21h
    ;Salto de linea        
    lea dx, salto        
    int 21h
    int 21h
    ;Mensaje de seleccion 1
    lea dx,msgSeleccion1
    int 21h
    ;Salto de linea        
    lea dx, salto        
    int 21h
    int 21h            
    ;Mensaje de seleccion 2
    lea dx,msgSeleccion2
    int 21h
    ;Salto de linea        
    lea dx, salto        
    int 21h            
    ;Mensaje de seleccion 3
    lea dx,msgSeleccion3
    int 21h 
    ;Salto de linea        
    lea dx, salto        
    int 21h 
    int 21h    
    jmp ingresoCategoria


ingresoCategoria:   ;Rutina que permite al usuario seleccionar una categoria para generar la sopa de letras
    ;Mensaje de seleccion 4
    lea dx,msgSeleccion4
    int 21h
    ;Capturando datos ingresados por el usuario
    mov ah, 01h         ;funcion para captura de dato
    int 21h             ;interrupcion para captura de dato (ASCCI), se almacena en al
    sub al, 30h         ;convertir codigo ASCII capturado al valor ingresado por el usuario
    mov seleccionCategoria, al
    ;Salto de linea
    mov ah,09h        
    lea dx, salto        
    int 21h    
    jmp validarIngresoCategoria
    
    

validarIngresoCategoria:    ;Rutina que valida que el numero ingresado para la categoria sea valido
    cmp seleccionCategoria,1
    jz iniciarCategoriaMundial  ;Se selecciono Equipos de Futbol
    
    cmp seleccionCategoria,2
    jz iniciarCategoriaDeportes ;Se selecciono Deportes
    
    jnz ingresoCategoriaErroneo ;Se ingreso una opcion no valida
    
      
ingresoCategoriaErroneo:    ;Rutina para manejar un ingreso de categoria invalido
    ;Mensaje de inicio
    mov ah,09h
    lea dx,msgErrorCategoria
    int 21h
    ;Salto de linea        
    lea dx, salto        
    int 21h
    int 21h
    jmp ingresoCategoria    ;Volvemos a pedir ingreso
    
    
generarNumeroAleatorio: 
    mov ah,0h   ;Genera una interrupcion para obtener la hora del sistema
    int 1ah     ;Se almacenan el total de tictacs del reloj en dx
    mov ax,dx
    mov dx,0
    mov bx,2
    div bx
    cmp ah,0
    ;TODO: FINALIZAR Y AGG VALIDACIONES 
    

    
iniciarCategoriaMundial:



iniciarCategoriaDeportes:
