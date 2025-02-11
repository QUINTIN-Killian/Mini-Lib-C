;;
;; EPITECH PROJECT, 2025
;; MiniLibC
;; File description:
;; memcpy
;;

global memcpy

section .text

.LOOP:
    cmp rdx, r10                    ; compare si on a tourné 3rd_param fois
    je .RETURN
    mov r11, [rsi + r10]            ; r11 = 2nd_param[r10]
    mov [rdi + r10], r11b           ; 1st_param[r10] = r11b
    inc r10
    jmp .LOOP

.RETURN:
    ret                             ; return comme tel en sachant que rax est
                                    ; initialisé à 1st_param

memcpy:
    ; 1st_param (rdi) : void *
    ; 2nd_param (rsi) : const void *
    ; 3rd_param (rdx) : size_t
    ; ret       (rax) : 1st_param

    mov rax, rdi                    ; initialise la valeur de retour à
                                    ; 1st_param
    mov r10, 0                      ; initialise un compteur à 0
    jmp .LOOP
