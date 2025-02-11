;;
;; EPITECH PROJECT, 2025
;; MiniLibC
;; File description:
;; memset
;;

global memset

section .text

.LOOP:
    cmp rdx, r10            ; compare si on a tourné 3rd_param fois
    je .RETURN
    mov [rdi + r10], sil    ; initialise la valeur de l'adresse mémoire
                            ; correspondante à l'octet de droite de 2nd_param
    inc r10
    jmp .LOOP

.RETURN:
    ret                     ; return comme tel en sachant que rax est
                            ; initialisé à 1st_param

memset:
    ; 1st_param (rdi) : void *
    ; 2nd_param (rsi) : int
    ; 3rd_param (rdx) : size_t
    ; ret       (rax) : 1st_param

    mov rax, rdi            ; initialise la valeur de retour à 1st_param
    mov r10, 0              ; initialise un compteur à 0
    jmp .LOOP
