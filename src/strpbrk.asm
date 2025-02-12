;;
;; EPITECH PROJECT, 2025
;; MiniLibC
;; File description:
;; strpbrk
;;

global strpbrk

section .text

.SET_RAX:
    mov rax, rdi        ; rax est maintenant égal au pointeur 1st_param
    ret

.CHECK_CHAR:
    mov r10b, [rsi]     ; extraction du caractère pointé par 2nd_param
    cmp r10b, 0         ; vérifie si on est arrivé à la fin de la chaîne de
                        ; caractères à rechercher
    je .RETURN          ; si oui, return
    mov r10b, [rdi]     ; si non, le caractère pointé par 1st_param est extrait
    cmp r10b, [rsi]     ; comparaison entre le caractère pointé par 2nd_param
                        ; et le caractère pointé par 1st_param
    je .SET_RAX         ; si correspondance, initialisation de la return value
                        ; à l'adresse mémoire du caractère pointé par 1st_param
    inc rsi             ; incrémentation
    jmp .CHECK_CHAR

.LOOP:
    mov r10b, [rdi]     ; extraction du caractère pointé par 1st_param
    cmp r10b, 0         ; vérification que le caractère en question n'est pas
                        ; '\0'
    je .RETURN          ; si oui, sortie de programme
    call .CHECK_CHAR    ; si non, appel d'une fonction chargée d'itérer sur
                        ; tous les caractères de 2nd_param à la recherche d'une
                        ; correspondance avec *1st_param
    cmp rax, 0          ; vérification qu'rax est toujours NULL
    jne .RETURN         ; si ce n'est plus le cas, return
    mov rsi, r11        ; sinon, réinitialisation du pointeur rsi à sa valeur
                        ; d'origine stockée dans r11
    inc rdi             ; incrémentation
    jmp .LOOP

.RETURN:
    ret

strpbrk:
    ; 1st_param (rdi) : const char *
    ; 2nd_param (rsi) : const char *
    ; ret       (rax) : char *

    mov rax, 0          ; initialisation à NULL de la return value
    mov r11, rsi        ; sauvegarde du pointeur 2nd_param pour le
                        ; réinitialiser après les itérations
    jmp .LOOP
