;;
;; EPITECH PROJECT, 2025
;; MiniLibC
;; File description:
;; strrchr
;;

global strrchr

section .text

.RESET_BUFFER:
    mov r11, rax            ; actualise la valeur du buffer r11

.END_STR_CHECKER:
    cmp r10b, 0             ; vérifie si le caractère actuel est '\0'
    je .RETURN

.INCREMENTER:
    inc rax                 ; incrémentation du pointeur pour passer au
                            ; caractère suivant

.LOOP:
    mov r10b, [rax]         ; récupère le caractère sur lequel pointe rax
    cmp r10b, sil           ; vérifie si le caractère récupéré est égal à
                            ; 2nd_param
    je .RESET_BUFFER        ; actualise le pointeur vers la dernière occurence
                            ; du caractère à rechercher
    jmp .END_STR_CHECKER    ; vérifie si la fin de la string est atteinte

.RETURN:
    mov rax, r11            ; initialise la valeur de retour au pointeur stocké
                            ; dans le buffer r11
    ret

strrchr:
    ; 1st_param (rdi) : const char *
    ; 2nd_param (rsi) : char
    ; ret       (rax) : char *

    mov r11, 0              ; initialise un registre buffer à NULL (ici, r11)
    mov rax, rdi            ; initialisation de la return value au pointeur sur
                            ; le premier caractère de 1st_param
    jmp .LOOP               ; jump vers la boucle principale
