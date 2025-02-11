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
    mov r10b, [rax]         ; récupère le caractère sur lequel pointe rax
    cmp r10b, 0             ; vérifie si le caractère récupéré est '\0'
    je .NULL_RETURN
    cmp r10b, sil           ; vérifie si le caractère récupéré est égal à
                            ; 2nd_param
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
