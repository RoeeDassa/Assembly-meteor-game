IDEAL
MODEL small
STACK 100h
p186
jumps
DATASEG
; --------------------------
x_coordinate dw 0 ;will get the value of x_begin
y_coordinate dw 0 ;will get the value of y_begin
color dw 15h ;the color of the spaceship (white)
color_meteor dw 4h ;the color of the meteor (red)
x_begin dw 155 ;x of where the spaceship starts
y_begin dw 170 ;y of where the spaceship starts
x_count db 30 ;how long the spaceship (x)
y_count db 5 ;how tall the spaceship is (y)
x_begin_meteor dw 150 ;where the meteor first appears (x)
y_begin_meteor dw 10 ;where the meteor first appears (y)
x_coordinate_meteor dw 0 ;will get the value of x_begin_meteor
y_coordinate_meteor dw 0 ;will get the value of y_begin_meteor 
x_count_meteor db 3 ;how long the meteor is (x)
y_count_meteor db 30 ;how tall the meteor is (y)
bx_saver dw 0
check db 0 ;will get the value of a color later
score db 0 ;the score the player gets from catching meteors
screen_choose db 0 ;the chararcter the player presses to choose the screen will go here
r_true db 0 ;the value of this variable will change if the meteor hits the spaceship
; --------------------------

mainScreen db '                                             ',10,13
  db '                                                      ',10,13
  db '                                                      ',10,13
  db '                                                      ',10,13
  db '                                                      ',10,13
  db '                                                      ',10,13
  db '                                                      ',10,13
  db '                                                      ',10,13
  db '                                                      ',10,13
  db '     welcome to...                                    ',10,13
  db '                __                                    ',10,13
  db '  _____   _____/  |_  ____  ___________  ______       ',10,13
  db ' /     \_/ __ \   __\/ __ \/  _ \_  __ \/  ___/       ',10,13
  db '|  | |  \  ___/|  | \  ___(  <_> )  | \/\___ \        ',10,13
  db '|__|_|  /\___  >__|  \___ >_____/|__|  /____  >  /\   ',10,13
  db '      \/     \/          \/                 \/  /  \  ',10,13
  db '                                                |  |  ',10,13
  db '   *press the space bar to play                 |  |  ',10,13
  db '   *press esc to quit                          / == \ ',10,13
  db '   *press i for instructions                   |/**\| ',10,13
  db '                                                 **   ',10,13
  db '               **MADE BY: ROEE DASSA**           **   ',10,13
  db '                                                      ',10,13
  db '                                                      ',10,13
  db '                                                      ',10,13
  db '                                                      ',10,13
  db '                                                      ',10,13
  db '                                                      ',10,13
  db '                                                      ',10,13,'$'
  
  
instructionsScreen db '                                            ',10,13
  db '                                                      ',10,13
  db '                                                      ',10,13
  db '                                                      ',10,13
  db '                                                      ',10,13
  db '                                                      ',10,13
  db '                                                      ',10,13
  db '                                                      ',10,13
  db '                                                      ',10,13
  db '  you play as a gray spaceship that has been tasked to',10,13
  db '  protect earth from a meteor strike.scientists predict about 30 meteors',10,13
  db '  will come in contact with the earth, you must try to destroy as many ',10,13
  db '  meteors as you can by moving around and "catching" them.',10,13
  db '                                                              ',10,13
  db '  if a single meteor manages to get past you, earth will get damaged',10,13
  db '  and the game will immediately end. good luck!',10,13
  db '                                                      ',10,13
  db '    movement:                                         ',10,13
  db '    Left -> press A                                   ',10,13
  db '    Right -> press D                                  ',10,13
  db '                                                      ',10,13
  db '  *press the space bar to play                      ',10,13
  db '  *press esc to quit                                      ',10,13
  db '                                                          ',10,13
  db '                                                      ',10,13
  db '                                                      ',10,13
  db '                                                      ',10,13
  db '                                                      ',10,13
  db '                                                      ',10,13
  db '                                                      ',10,13
  db '                                                      ',10,13,'$'
 
lossScreen db '                                                 ',10,13
  db '                                                          ',10,13
  db '                                                          ',10,13
  db '                                                          ',10,13
  db '                                                          ',10,13
  db '                                                          ',10,13
  db '                                                          ',10,13
  db '   _________    _____   ____     _______  __ ___________  ',10,13
  db '  / ___\__  \  /     \_/ __ \   /  _ \  \/ // __ \_  __ \ ',10,13
  db ' / /_/  > __ \|  Y Y  \  ___/  (  <_> )   /\  ___/|  | \/ ',10,13
  db ' \___  (____  /__|_|  /\___  >  \____/ \_/  \___  >__|    ',10,13
  db '/_____/     \/      \/     \/                   \/        ',10,13
  db '                                                          ',10,13
  db '  the earth was destroyed...                              ',10,13
  db '                                                          ',10,13
  db '  *press the space bar to play again                      ',10,13
  db '  *press esc to quit                                      ',10,13
  db '  *press i for instructions                               ',10,13
  db '                                                          ',10,13,'$'
  
winScreen db '                                       ',10,13
  db '                                               ',10,13
  db '                                               ',10,13
  db '                                               ',10,13
  db '                                               ',10,13
  db '                                               ',10,13
  db '                               __              ',10,13
  db ' ___.__. ____  __ __  __  _  _|__| ____        ',10,13
  db '<   |  |/  _ \|  |  \ \ \/ \/ /  |/    \       ',10,13
  db ' \___  (  <_> )  |  /  \     /|  |   |  \      ',10,13
  db ' / ____|\____/|____/    \/\_/ |__|___|  /      ',10,13
  db ' \/                                   \/       ',10,13
  db '                                               ',10,13
  db ' you managed to save the earth                 ',10,13
  db ' from most of the damage!    +    *       +    ',10,13
  db '                         .        .    |       ',10,13
  db ' *press the space  *  .-.,="``"=.    - o -     ',10,13
  db ' bar to play again    *=/_       \     |       ',10,13
  db ' *press esc to quit     |  *=._   |   *        ',10,13
  db ' *press i for       *   \     `=./`,        .  ',10,13
  db ' instructions        .   *=.__.=* `=*    *     ',10,13
  db '                                     +         ',10,13
  db '                                               ',10,13,'$'
  
perfectWinScreen db '                                ',10,13
  db '                                               ',10,13
  db '                                               ',10,13
  db '                                               ',10,13
  db '                                               ',10,13
  db '                                               ',10,13
  db '                                               ',10,13
  db '                                               ',10,13
  db '                                               ',10,13
  db '                                               ',10,13
  db '                                               ',10,13
  db '                                               ',10,13
  db '                                               ',10,13
  db '                                               ',10,13
  db '                                               ',10,13
  db '                      _____              __    ',10,13
  db '______   ____________/ ____\____   _____/  |_  ',10,13
  db '\____ \_/ __ \_  __ \   __\/ __ \_/ ___\   __\ ',10,13
  db '|  |_> >  ___/|  | \/|  | \  ___/\  \___|  |   ',10,13
  db '|   __/ \___  >__|   |__|  \___  >\___  >__|   ',10,13
  db '|__|        \/                 \/     \/       ',10,13
  db '                                               ',10,13
  db ' you caught all the meteors                    ',10,13
  db ' and saved earth completely!                   ',10,13
  db ' now you can go back home to your family!      ',10,13
  db '                                               ',10,13
  db '                                      /\                ',10,13
  db ' *press the space bar               _/  \_              ',10,13
  db ' to play again                    ./======\.            ',10,13
  db ' *press esc to quit               ;:.  _   ;            ',10,13
  db ' *press i for                     |:. (_)  |            ',10,13
  db ' instructions                     |:.  _   |            ',10,13
  db '                                  |:. (_)  |            ',10,13
  db '                                  ;:.      ;            ',10,13
  db '                                .  \:.    / `.          ',10,13
  db '                               / .-  :._. `-. \         ',10,13
  db '                               |/    /||\    \|         ',10,13
  db '                             _..--"""````"""--.._       ',10,13
  db '                       _.--``                    ``--._ ',10,13
  db '                      -                                -',10,13,'$'
  
; --------------------------
CODESEG

proc printString
	  pusha
	  mov ah, 9h
	  int 21h ;interrupt that displays a string 
	  popa
	  ret
endp printString

proc readChr
      pusha
; waits for character
      mov ah, 0h
      int 16h
      mov [screen_choose], al ;puts the character the user inputed into screen_choose
      popa
      ret
endp readChr

proc drawPixel ;draws a white pixel
	pusha
	xor bh, bh ;resets bh
	mov cx, [x_coordinate]
	mov dx, [y_coordinate]
	mov ax, [color]
	mov ah, 0ch
	int 10h
	popa
	ret
endp drawPixel

proc drawPixelMeteor ;draws a red pixel
	pusha
	xor bh, bh
	mov cx, [x_coordinate_meteor]
	mov dx, [y_coordinate_meteor]
	mov ax, [color_meteor]
	mov ah, 0ch
	int 10h
	popa
	ret
endp drawPixelMeteor

proc delay
	mov al, 0
	mov ah, 86h
	mov cx, 1
	mov dx, 1
	int 15h
	ret
endp delay

Proc drawRectangle
; Draw square at x_begin, y_begin position, size 30*5
	mov [x_count], 30 ;how long the spaceship will be
	mov [y_count], 5 ;how tall the spaceship will be
	mov ax, [x_begin]
	mov [x_coordinate], ax
	mov ax,[y_begin]
	mov [y_coordinate], ax
line_loop:
; Print one dot on screen
	call checkColor
	cmp [check], 4h ;checks if the color red is touching the meteor
	je R_check
	call drawPixel
	inc [x_coordinate] ;makes the rectangle bigger by one x
	dec [x_count] ;decreases the amount of pixels needed to draw
	call checkColor
	cmp [check], 4h ;checks if the color red is touching the meteor
	je R_check
	cmp [x_count], 0 ;checks if the amount of pixels needed is 0
	jne line_loop
	mov ax, [x_begin] ;reset line counters
	mov [x_coordinate], ax
	mov [x_count],30 ;reset column counters
	inc [y_coordinate] ;makes another row of the rectangle
	call checkColor
	cmp [check], 4h ;checks if the color red is touching the meteor
	je R_check
	dec [y_count] ;decreases the amount of pixels needed to draw
	cmp [y_count], 0 ;;checks if the amount of pixels needed is 0
	jne line_loop
	jmp End_rectangle
R_check:
	inc [r_true] ;adds 1 to the variable r_true
	ret
End_rectangle:
endp drawRectangle

Proc drawMeteor
; Draw square at x_begin, y_begin position, size 3*30
	mov [x_count_meteor], 3 ;how long the meteor will be
	mov [y_count_meteor], 30 ;how tall the meteor will be
	mov ax, [x_begin_meteor]
	mov [x_coordinate_meteor], ax
	mov ax,[y_begin_meteor]
	mov [y_coordinate_meteor], ax
line_loop_2:
; Print one dot on screen
	call drawPixelMeteor
	inc [x_coordinate_meteor] ;makes the meteor bigger by one x
	dec [x_count_meteor] ;the number of times the pixel should be drawn (counts down)
	cmp [x_count_meteor], 0 ;chekcs if the amount of pixels needed to draw is 0
	jne line_loop_2
	mov ax, [x_begin_meteor] ;reset line counters
	mov [x_coordinate_meteor], ax
	mov [x_count_meteor],3 ;reset column counters
	inc [y_coordinate_meteor] ;makes the another row of the meteor
	dec [y_count_meteor] ;decreases the amount of pixels needed to draw
	cmp [y_count_meteor], 0 ;checks if the amount of pixels needed to draw is 0
	jne line_loop_2
	ret
endp drawMeteor

proc rightKeyPress
	mov [color], 0 ;makes the color black
	call DrawRectangle
	add [x_begin], 4 ;how much the spaceship moves each right key press (how fast it moves)
	mov [color], 15h ;makes the color white again
	call DrawRectangle
	ret
endp rightKeyPress

proc leftKeyPress
	mov [color], 0 ;makes the color black
	call DrawRectangle
	sub [x_begin], 4 ;how much the spaceship moves each left key press (how fast it moves)
	mov [color], 15h ;makes the color white again
	call DrawRectangle
	ret
endp leftKeyPress

proc random
	pusha
	mov bx, [bx_saver]
;put segment number in register es
	mov ax, 40h
	mov es, ax
;move random number to ax
	mov ax, [es:6Ch]
	xor ax,[bx]
	add [bx_saver],ax
	xor ah, ah
	mov [x_begin_meteor], ax
	popa
	ret
endp random

proc CheckColor
; get color of pixel and puts it in [check]
	mov bh, 0h
	mov cx, [x_coordinate]
	mov dx, [y_coordinate]
	mov ah, 0dh
	int 10h
	mov [check], al ; save color of pixel
	ret
endp checkColor

;---------------------------
start:
	mov ax, @data
	mov ds, ax

StartScreen:
	mov dx, offset mainScreen ;puts the main game screen
	call printString
	call readChr
	cmp [screen_choose],32 ;if space bar
	je my_game
	cmp [screen_choose], 105 ;if i
	je instruct
	cmp [screen_choose],27 ;if Esc
	je TheEnd
	jmp StartScreen

my_game:

;reseting all the variables
	mov [score], 0
	mov [r_true], 0
	mov [x_begin_meteor], 150
	mov [y_begin_meteor], 10
	

; Enter Graphic mod
	mov ax, 13h
	int 10h
	
;draws a rectangle
	call drawRectangle
	
;draws the meteor
	call drawMeteor

WaitForKeyPress:
	mov [r_true], 0 ;resets r_true
	cmp [score], 30 ;chekcs if you reach a score of 30
	je Perfect             
	cmp [y_begin_meteor], 170 ;checks if the meteor reaches the bottom of the screen
	jae WinScreenChecker
	call drawRectangle
	cmp [r_true], 0 ;checks if the value of r_true has changed (if the meteor hit the spaceship)
	jne R ;jumps to R if the meteor hit the spaceship 
	mov ah,1 ;waits for character
    int 16h
    jz NoKeyPress
    mov ah,0 ; Read key pressed
    int 16h
    cmp ah,1h ; checks if you press esc
    je TheEnd
    cmp ah, 20h ;checks if you pressed D
    je Right
    cmp ah, 01eh ;checks if you pressed A
    je Left
    jmp WaitForKeyPress

Right:
    call RightKeyPress
    jmp WaitForKeyPress

Left:
    call LeftKeyPress
    jmp WaitForKeyPress
	
NoKeyPress:
	mov [color_meteor], 0h ;makes the color of the meteor black
	call drawMeteor ;draws the meteor
	add [y_begin_meteor], 4 ;the speed of the falling meteor (adds to the y of the meteor so it goes down by 4)
	mov [color_meteor], 4h ;makes the color of the meteor red
	call drawMeteor ;draws the meteor
	
	call delay
	
	jmp WaitForKeyPress
	
R:
	inc [score] ;adds to the score the player everytime they catch a meteor
	mov [color_meteor],0 ;makes the meteor black
    call drawMeteor ;draws the meteor
    mov [color_meteor], 4h ;makes the color of the meteor red
    call Random ;makes the value of x_begin_meteor somewhere between 0-255
    add [x_begin_meteor],32 ;so the meteor spawns within my desired range
    mov [y_begin_meteor],10 ;makes the meteor go back to the top
    call drawMeteor ;draws the meteor
    jmp WaitForKeyPress
	
WinScreenChecker:
	cmp [score], 15 
	jbe Loss ;if the score is less or equal to 15 jump to Loss
	cmp [score], 30
	jb Win ;if the score is less than 30 and more than 15 jump to Win
	jmp Perfect ;if the score is 30 jump to Perfect
	
Instruct:
	mov ax, 2 ;return to text mode
	int 10h
	mov dx, offset instructionsScreen
	call printString ;prints the instruction screen
	call readChr ;reads a character from the user
	cmp [screen_choose],32 ; if space bar
	je my_game
	cmp [screen_choose], 27 ; if Esc
	je TheEnd
	jmp Instruct
	
Win:
	mov ax, 2 ;return to text mode
	int 10h
	mov dx, offset winScreen
	call printString ;prints the winScreen
	call readChr ;reads a character from the user
	cmp [screen_choose],32 ; if space bar
	je my_game
	cmp [screen_choose], 105 ;if i
	je instruct
	cmp [screen_choose], 27 ; if Esc
	je TheEnd
	jmp Win
	
Loss:
	mov ax, 2 ;return to text mode
	int 10h
	mov dx, offset lossScreen
	call printString ;prints the lossScreen
	call readChr ;reads a character from the user
	cmp [screen_choose],32 ; if space bar
	je my_game
	cmp [screen_choose], 105 ;if i
	je instruct
	cmp [screen_choose], 27 ; if Esc
	je TheEnd
	jmp Loss
	
Perfect:
	mov ax, 2 ;return to text mode
	int 10h
	mov dx, offset perfectWinScreen
	call printString ;prints the perfectWinScreen
	call readChr ;reads a character from the user
	cmp [screen_choose],32 ; if space bar
	je my_game
	cmp [screen_choose], 105 ;if i
	je instruct
	cmp [screen_choose], 27 ; if Esc
	je TheEnd
	jmp Perfect

TheEnd:
;Return text mod
	mov ax, 2
	int 10h
; --------------------------
exit:
mov ax, 4c00h
int 21h
END start