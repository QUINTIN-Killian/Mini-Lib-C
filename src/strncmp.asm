;;
;; EPITECH PROJECT, 2025
;; MiniLibC
;; File description:
;; strncmp
;;

global strncmp

section .text

.INCREMENTER:
    cmp r10b, 0                 ; vérifie si 1st_param pointe sur '\0' (en
                                ; arrivant à ce point, *1st_param ==
                                ; *2nd_param)
    je .RETURN                  ; return simple de rax (égal à 0)
    inc rdi                     ; incrémentation
    inc rsi                     ; incrémentation

.LOOP:
    cmp rdx, 0                  ; vérifie si les 3rd_param premiers caractères
                                ; ont tous été explorés
    je .RETURN                  ; return simple de rax (égal à 0)
    dec rdx                     ; décrémentation
    mov r10b, [rdi]             ; initialisation du registre r10b à la valeur
                                ; pointée par 1st_param
    mov r11b, [rsi]             ; initialisation du registre r11b à la valeur
                                ; pointée par 2nd_param
    cmp r10b, r11b              ; compare les deux registres précédemment set
    je .INCREMENTER             ; cas où *1st_param == *2nd_param
    mov rax, r10                ; initialisation de la return value à la valeur
                                ; ascii du caractère pointé par 1st_param
    sub rax, r11                ; soustraction de la valeur de retour avec la
                                ; valeur ascii du caractère pointé par
                                ; 2nd_param
    ret

.RETURN:
    ret

strncmp:
    ; 1st_param (rdi) : const char *
    ; 2nd_param (rsi) : const char *
    ; 3rd_param (rdx) : size_t
    ; ret       (rax) : int

    mov rax, 0                  ; initialisation de la return value à 0
    mov r10, 0                  ; réinitialise r10
    mov r11, 0                  ; réinitialise r11
    jmp .LOOP
