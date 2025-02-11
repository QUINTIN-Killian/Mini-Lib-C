;;
;; EPITECH PROJECT, 2025
;; MiniLibC
;; File description:
;; strlen
;;

global strlen

section .text

.INCREMENTER:
    inc rax                 ; incrémente l'itérateur (qui est aussi la return
                            ; value) de 1

.LOOP:
    mov r10b, [rdi + rax]   ; r10b = 1st_param[i (= rax)]
    cmp r10b, 0             ; vérifie si on est à la fin de la string
    jne .INCREMENTER        ; incrémente de 1
    ret                     ; return le contenu de rax

strlen:
    ; 1st_param (rdi) : const char *
    ; ret       (rax) : size_t

    mov rax, 0              ; initialisation de la return value à 0
                            ; + sert d'itérateur
    jmp .LOOP               ; rentre dans la loop
