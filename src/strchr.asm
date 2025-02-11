;;
;; EPITECH PROJECT, 2025
;; MiniLibC
;; File description:
;; strchr
;;

global strchr

section .text

; incrementer:
;     inc rax             ; incrémentation de la return value (qui sert aussi
;                         ; d'itérateur)

; loop:
;     cmp [rdi + rax], [rsi]
;     jne incrementer
;     ret

strchr:
    mov rax, 0          ; initialisation de la return value à 0
    ret
