;;
;; EPITECH PROJECT, 2025
;; MiniLibC
;; File description:
;; strlen
;;

global strlen

section .text

incrementer:
    inc rax                 ; incrémente l'itérateur (qui est aussi la return
                            ; value) de 1

loop:
    mov r10b, [rdi + rax]   ; r10 = 1st param [i (= rax)]
    cmp r10b, 0             ; vérifie si on est à la fin de la string
    jne incrementer         ; incrémente de 1
    ret                     ; return le contenu de rax

strlen:
    mov rax, 0              ; initialisation de la return value à 0
                            ; + sert d'itérateur
    jmp loop                ; rentre dans la loop
