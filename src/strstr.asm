;;
;; EPITECH PROJECT, 2025
;; MiniLibC
;; File description:
;; strstr
;;

global strstr

section .text

.SET_RAX:
    mov rax, rdi            ; la return value est initialisée au pointeur sur
                            ; le début de la correspondance avec 2nd_param
    ret

.INCREMENTER:
    inc r11

.CHECK_STR:
    mov r10b, [rsi + r11]   ; extraction du caractère actuellement pointé par
                            ; 2nd_param
    cmp r10b, 0             ; vérifie si on est pas arrivé à la fin de
                            ; 2nd_param
    je .SET_RAX
    mov r10b, [rdi + r11]   ; extraction du caractère actuellement pointé par
                            ; 1st_param
    cmp r10b, 0             ; vérifie si on est pas arrivé à la fin de
                            ; 1st_param
    je .RETURN
    cmp r10b, [rsi + r11]   ; comparaison entre 1st_param[r11] et
                            ; 2nd_param[r11] en sachant que 1st_param
                            ; s'incrémente et n'est plus forcément au début de
                            ; la string
    je .INCREMENTER
    ret

.LOOP:
    mov r11, 0              ; r11 sert d'itérateur et est initialisé à 0
    call .CHECK_STR
    cmp rax, 0              ; vérifie si une correspondance a été trouvée et
                            ; que la return value est set à un pointeur vers
                            ; cette correspondance
    jne .RETURN             ; sortie de programme avec un résultat
    mov r10b, [rdi]         ; range le caractère pointé par 1st_param dans r10b
    cmp r10b, 0             ; check si r10b est égal à '\0'
    je .RETURN              ; sortie de programme sans résultat
    inc rdi                 ; incrémentation
    jmp .LOOP

.RETURN:
    ret

strstr:
    ; 1st_param (rdi) : const char *
    ; 2nd_param (rsi) : const char *
    ; ret       (rax) : char *

    mov rax, 0              ; initialisation de la return value à un pointeur
                            ; NULL
    jmp .LOOP
