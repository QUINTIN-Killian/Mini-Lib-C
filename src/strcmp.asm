;;
;; EPITECH PROJECT, 2025
;; MiniLibC
;; File description:
;; strcmp
;;

global strcmp

section .text

.INCREMENTER:
    cmp r10b, 0                 ; vérifie si 1st_param pointe sur '\0' (en
                                ; arrivant à ce point, *1st_param ==
                                ; *2nd_param)
    je .RETURN_EQUAL            ; return simple de rax (égal à 0)
    inc rdi
    inc rsi

.LOOP:
    mov r10b, [rdi]             ; initialisation du registre r10 à la valeur
                                ; pointée par 1st_param
    mov r11b, [rsi]             ; initialisation du registre r11 à la valeur
                                ; pointée par 2nd_param
    cmp r10b, r11b              ; compare les deux registres précédemment set
    je .INCREMENTER             ; cas où *1st_param == *2nd_param
    jl .RETURN_LOWER            ; cas où *1st_param < *2nd_param
    jg .RETURN_GREATER          ; cas où *1st_param > *2nd_param

.RETURN_LOWER:
    mov rax, -1
    ret

.RETURN_GREATER:
    mov rax, 1
    ret

.RETURN_EQUAL:
    ret

strcmp:
    ; 1st_param (rdi) : const char *
    ; 2nd_param (rsi) : const char *
    ; ret       (rax) : int

    mov rax, 0                  ; initialisation de la return value à 0
    mov r10, 0
    mov r11, 0
    jmp .LOOP
