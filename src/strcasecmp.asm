;;
;; EPITECH PROJECT, 2025
;; MiniLibC
;; File description:
;; strcasecmp
;;

global strcasecmp

section .text

.INCREMENTER:
    cmp r10b, 0                 ; vérifie si 1st_param pointe sur '\0' (en
                                ; arrivant à ce point, *1st_param ==
                                ; *2nd_param)
    je .RETURN                  ; return simple de rax (égal à 0)
    inc rdi
    inc rsi
    jmp .LOOP

.SET_BUFF:
    cmp r11b, 65                ; compare r11b avec la valeur ASCII de 'A'
    jl .RETURN                  ; si r11b < 'A', rien à faire -> retour à
                                ; l'instruction suivant l'appel call
    cmp r11b, 90                ; compare r11b avec la valeur ASCII de 'Z'
    jg .RETURN                  ; si r11b > 'Z', rien à faire -> retour à
                                ; l'instruction suivant l'appel call
    add r11b, 32                ; convertit la lettre majuscule en son
                                ; équivalent minuscule
    jmp .RETURN                 ; retour à l'instruction suivant l'appel call

.LOOP:
    mov r10, 0                  ; réinitialise r10
    mov r11, 0                  ; réinitialise r11 (sert de buffer pour
                                ; l'initialisation de r10)
    mov r11b, [rdi]             ; initialisation de l'octet de droite du
                                ; registre buffer à la valeur pointée par
                                ; 1st_param
    call .SET_BUFF              ; call crée un scope d'appel et sauvegarde en
                                ; haut de la pile (push) l'adresse mémoire de
                                ; la prochaine instruction à éxécuter (ici, la
                                ; ligne suivante) pour qu'un return dans ce
                                ; scope ramène ici et ne quitte pas le
                                ; programme (pop)
    mov r10b, r11b              ; initialisation de l'octet de droite de r10 à
                                ; l'octet de droite de r11 (qui est soit égal
                                ; au caractère pointé par 1st_param, soit égal
                                ; à son équivalent en minuscule)
    mov r11b, [rsi]             ; initialisation de l'octet de droite du
                                ; registre buffer à la valeur pointée par
                                ; 2nd_param
    call .SET_BUFF              ; call crée un scope d'appel et sauvegarde en
                                ; haut de la pile (push) l'adresse mémoire de
                                ; la prochaine instruction à éxécuter (ici, la
                                ; ligne suivante) pour qu'un return dans ce
                                ; scope ramène ici et ne quitte pas le
                                ; programme (pop)
    cmp r10b, r11b              ; compare les deux registres précédemment set
    je .INCREMENTER             ; cas où *1st_param == *2nd_param
    mov rax, r10                ; initialisation de la return value à la valeur
                                ; ascii du caractère pointé par 1st_param
    sub rax, r11                ; soustraction de la valeur de retour avec la
                                ; valeur ascii du caractère pointé par
                                ; 2nd_param

.RETURN:
    ret

strcasecmp:
    ; 1st_param (rdi) : const char *
    ; 2nd_param (rsi) : const char *
    ; ret       (rax) : int

    mov rax, 0                  ; initialisation de la return value à 0
    jmp .LOOP
