@references: user manual of armsim


.equ SWI_CheckBlue, 0x203 @check press Blue button
.equ SWI_DRAW_STRING, 0x204 @display a string on LCD
.equ SWI_DRAW_INT, 0x205 @display an int on LCD
.equ SWI_CLEAR_DISPLAY,0x206 @clear LCD
.equ SWI_DRAW_CHAR, 0x207 @display a char on LCD
.equ SWI_CLEAR_LINE, 0x208 @clear a line on LCD
.equ SWI_EXIT, 0x11 @terminate program
.equ BLUE_KEY_00, 0x01 @button(0)
.equ BLUE_KEY_01, 0x02 @button(1)
.equ BLUE_KEY_02, 0x04 @button(2)
.equ BLUE_KEY_03, 0x08 @button(3)
.equ BLUE_KEY_04, 0x10 @button(4)
.equ BLUE_KEY_05, 0x20 @button(5)
.equ BLUE_KEY_06, 0x40 @button(6)
.equ BLUE_KEY_07, 0x80 @button(7)
.equ BLUE_KEY_08, 1<<8 @button(8) 
.equ BLUE_KEY_09, 1<<9 @button(9)
.equ BLUE_KEY_10, 1<<10 @button(10)
.equ BLUE_KEY_11, 1<<11 @button(11)
.equ BLUE_KEY_12, 1<<12 @button(12)
.equ BLUE_KEY_13, 1<<13 @button(13)
.equ BLUE_KEY_14, 1<<14 @button(14)
.equ BLUE_KEY_15, 1<<15 @button(15)

@Clear the board, clear the LCD screen
swi SWI_CLEAR_DISPLAY
@draw a message to the lcd screen on line#1, column 4
mov r0,#4 @ column number
mov r1,#5 @ row number
ldr r2,=Welcome @ pointer to string
swi SWI_DRAW_STRING @ draw to the LCD screen
mov r5,#0
bl wait


@Clear the board, clear the LCD screen
swi SWI_CLEAR_DISPLAY 
 
mov r8,#10      

pressblue:

@Test the blue buttons 0-14 with prompting,  If >15, invalid.
@Draw a message to inform user to press a blue button

mov r0,#6 @ column number
mov r1,#0 @ row number
ldr r2,=PressBlue @ pointer to string
swi SWI_DRAW_STRING @ draw to the LCD screen
mov r0,#1 @ column number
mov r1,#1 @ row number
ldr r2,=directions1 @ pointer to string
swi SWI_DRAW_STRING @ draw to the LCD screen
mov r1,#2 @ row number
ldr r2,=directions2 @ pointer to string
swi SWI_DRAW_STRING @ draw to the LCD screen

mov r6,#0  @ operand's value

BLUELOOP:
@wait for user to press blue button
mov r0,#0
BB1:
swi SWI_CheckBlue @get button press into R0
cmp r0,#0
beq BB1 @ if zero, no button pressed
add r5,r5,#1   @column counter
mov r9,r6

cmp r0,#BLUE_KEY_15
beq FIFTEEN
cmp r0,#BLUE_KEY_14
beq FOURTEEN
cmp r0,#BLUE_KEY_13
beq THIRTEEN
cmp r0,#BLUE_KEY_12
beq TWELVE
cmp r0,#BLUE_KEY_11
beq ELEVEN
cmp r0,#BLUE_KEY_10
beq TEN
cmp r0,#BLUE_KEY_09
beq NINE
cmp r0,#BLUE_KEY_08
beq EIGHT
cmp r0,#BLUE_KEY_07
beq SEVEN
cmp r0,#BLUE_KEY_06
beq SIX
cmp r0,#BLUE_KEY_05
beq FIVE
cmp r0,#BLUE_KEY_04
beq FOUR
cmp r0,#BLUE_KEY_03
beq THREE
cmp r0,#BLUE_KEY_02
beq TWO
cmp r0,#BLUE_KEY_01
beq ONE
cmp r0,#BLUE_KEY_00
beq ZERO



ZERO:
mov r0,r5
mov r1,#4
mov r2,#0
swi SWI_DRAW_INT
MUL r6,r9,r8
add r6,r6,#0
b BLUELOOP


ONE:
mov r0,r5
mov r1,#4
mov r2,#1
swi SWI_DRAW_INT
MUL r6,r9,r8
add r6,r6,#1
b BLUELOOP

TWO:
mov r0,r5
mov r1,#4
mov r2,#2
swi SWI_DRAW_INT
MUL r6,r9,r8
add r6,r6,#2
b BLUELOOP

THREE:
mov r0,r5
mov r1,#4
mov r2,#3
swi SWI_DRAW_INT
MUL r6,r9,r8
add r6,r6,#3
b BLUELOOP

FOUR:
mov r0,r5
mov r1,#4
mov r2,#4
swi SWI_DRAW_INT
MUL r6,r9,r8
add r6,r6,#4
b BLUELOOP

FIVE:
mov r0,r5
mov r1,#4
mov r2,#5
swi SWI_DRAW_INT
MUL r6,r9,r8
add r6,r6,#5
b BLUELOOP

SIX:
mov r0,r5
mov r1,#4
mov r2,#6
swi SWI_DRAW_INT
MUL r6,r9,r8
add r6,r6,#6
b BLUELOOP

SEVEN:
mov r0,r5
mov r1,#4
mov r2,#7
swi SWI_DRAW_INT
MUL r6,r9,r8
add r6,r6,#7
b BLUELOOP

EIGHT:
mov r0,r5
mov r1,#4
mov r2,#8
swi SWI_DRAW_INT
MUL r6,r9,r8
add r6,r6,#8
b BLUELOOP

NINE:
mov r0,r5
mov r1,#4
mov r2,#9
swi SWI_DRAW_INT
MUL r6,r9,r8
add r6,r6,#9
b BLUELOOP

TEN:
mov r0,r5
mov r1,#4
mov r2,#'+'
swi SWI_DRAW_CHAR 
b operation

ELEVEN:
mov r0,r5
mov r1,#4
mov r2,#'-'
swi SWI_DRAW_CHAR
b operation

TWELVE:
mov r0,r5
mov r1,#4
mov r2,#'&'
swi SWI_DRAW_CHAR
b operation 

THIRTEEN:
mov r0,r5
mov r1,#4
mov r2,#'|'
swi SWI_DRAW_CHAR
b operation

FOURTEEN:
mov r0,r5
mov r1,#4
mov r2,#'='
swi SWI_DRAW_CHAR
b result


FIFTEEN:
mov r0,#6 @ column number
mov r1,#5 @ row number
ldr r2,=InvBlue @ pointer to string
swi SWI_DRAW_STRING @ draw to the LCD screen
swi SWI_EXIT

@Wait for 3 second
wait:
     mov r3,#0
     loop:
       cmp r3,#1<<20
       beq goto
       add r3,r3,#1
       b loop
 
goto:
mov pc,lr

operation:
    mov r4,r2  @ r4 stores the operand
    mov r7,r6  @ r7 stores operand1
    b pressblue

result:    @ r6 stores operand2
add r5,r5,#1

cmp r4,#'+'
beq res1
cmp r4,#'-'
beq res2
cmp r4,#'&'
beq res3
cmp r4,#'|'
beq res4
  
res1:
   add r3,r7,r6
   mov r0,r5
   mov r1,#4
   mov r2,r3
   swi SWI_DRAW_INT
   b end
res2:
   sub r3,r7,r6
   mov r0,r5
   mov r1,#4
   mov r2,r3
   swi SWI_DRAW_INT
   b end
res3:
   and r3,r7,r6
   mov r0,r5
   mov r1,#4
   mov r2,r3
   swi SWI_DRAW_INT
   b end
res4:
   orr r3,r7,r6
   mov r0,r5
   mov r1,#4
   mov r2,r3
   swi SWI_DRAW_INT
   b end      


end: 

mov r0,#2 @ column number
mov r1,#8 @ row number
ldr r2,=Bye @ pointer to string
swi SWI_DRAW_STRING @ draw to the LCD screen
swi SWI_EXIT



.data
Welcome: .asciz "WELCOME TO THE CALCULATOR........."
Bye: .asciz "BYE"


PressBlue: .asciz "Press a BLUE button" 
directions1: .asciz "(0-9 for numbers ,10 for +, 11 for - ,"
directions2: .asciz " 12 for & , 13 for | , 14 for = )"
InvBlue: .asciz "Invalid blue button "

.end

swi SWI_EXIT