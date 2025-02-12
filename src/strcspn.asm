;;
;; EPITECH PROJECT, 2025
;; MiniLibC
;; File description:
;; strcspn
;;

global strcspn

section .text

.RESET_CYCLE:
    mov rsi, r11        ; 2nd_param se met à pointer de nouveau sur son premier
                        ; caractère (le pointeur a été sauvegardé dans r11)
    inc rdi             ; incrémentation
    inc rax             ; incrémentation

.LOOP:
    mov r10b, [rdi]     ; récupère le caractère pointé par 1st_param
    cmp r10b, 0         ; vérifie si le caractère pointé par 1st_param est '\0'
    je .RETURN          ; sortie du programme
    mov r10b, [rsi]     ; récupère le caractère pointé par 2nd_param
    cmp r10b, 0         ; vérifie si on est à la fin de la string 2nd_param
    je .RESET_CYCLE     ; tous les caractères de 2nd_param ont été comparés
                        ; avec *1st_param -> on peut donc passer au caractère
                        ; de 1st_param suivant
    cmp r10b, [rdi]     ; vérifie s'il y a correspondance entre *2nd_param et
                        ; *1st_param
    je .RETURN          ; sortie du programme
    inc rsi             ; incrémentation de 2nd_param pour tester la
                        ; comparaison avec le caractère de recherche suivant
    jmp .LOOP

.RETURN:
    ret

strcspn:
    ; 1st_param (rdi) : const char *
    ; 2nd_param (rsi) : const char *
    ; ret       (rax) : size_t

    mov rax, 0          ; initialisation du compteur de caractères à 0
    mov r11, rsi        ; sauvegarde dans r11 du pointeur sur le premier
                        ; caractère de 2nd_param
    jmp .LOOP
