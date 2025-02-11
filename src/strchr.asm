;;
;; EPITECH PROJECT, 2025
;; MiniLibC
;; File description:
;; strchr
;;

global strchr

section .text

.INCREMENTER:
    inc rax                 ; incrémentation du pointeur pour passer au
                            ; caractère suivant

.LOOP:
    cmp al, 0               ; vérifie que le registre 8 bits est égal à la fin
    je .NULL_RETURN
    cmp [rax], sil          ; vérifie si le caractère actuel est égal à
                            ; 2nd_param (en déréférençant)
    jne .INCREMENTER        ; si non, incrémente
    ret                     ; si le jmp n'est pas appelé, c'est que le
                            ; caractère est trouvé

.NULL_RETURN:
    mov rax, 0              ; initialise la valeur de retour à NULL
    ret

strchr:
    mov rax, rdi            ; initialisation de la return value au pointeur sur
                            ; le premier caractère de 1st_param
    jmp .LOOP               ; jump vers la boucle principale
