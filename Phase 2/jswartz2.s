

 // Section .crt0 is always placed from address 0
	.section .crt0, "ax"

_start:
	.global _start

 /*
 	Assembly Abstraction assignment

 	Start here
 */

addi x21, x0, 0x2 //0x00200A93
//000000000010 00000 000 10101 0010011
//imm[11:0] rs1 000 rd 0010011
slli x21, x21, 12 //0x00CA9A93
//0000000 01100 10101 001 10101 0010011
//x21 holds value of 0x2000
//0000000 shamt rs1 001 rd 0010011 
addi x18, x0, 'j' //0x06A00913
//000001101010 00000 000 10010 0010011
//initialize x18 is the letter/max
//imm[11:0] rs1 000 rd 0010011
addi x19, x0, 0x0 //0x00000993
//000000000000 00000 000 10011 0010011
//initialize x19 is i
//imm[11:0] rs1 000 rd 0010011
addi x20, x0, 0x0 //0x00000A13
//000000000000 00000 000 10100 0010011
//initialize x20 is result
//imm[11:0] rs1 000 rd 0010011

loop:
bge x19, x18, end //0x0129DA63
//0000000 10010 10011 101 10100 1100011 
//if i is greater than or equal to the letter, end the loop. 
//imm[12|10:5] rs2 rs1 101 imm[4:1|11] 1100011 
//the immediate is 10100 (20)
add x20, x20, x19 //0x013A0A33
//0000000 10011 10100 000 10100 0110011 
//add i to result
//0000000 rs2 rs1 000 rd 0110011 
add x20, x20, x18 //0x012A0A33
//0000000 10010 10100 000 10100 0110011 
//add letter to result
//0000000 rs2 rs1 000 rd 0110011 
addi x19, x19, 0x1 //0x00198993
//000000000001 10011 000 10011 0010011
//increment i. 
//imm[11:0] rs1 000 rd 0010011
jal x0, loop //0xFF1FF06F
//1 1111111000 1 11111111 00000 1101111
//go to the top of the loop again.
//imm[20|10:1|11|19:12] rd 1101111
//immediate = 0xFFFFFFF0 (-16)


end:
sw x20, 0x4(x21) //0x014AA223
//0000000 10100 10101 010 00100 0100011
//store result in 0x2004
//imm[11:5] rs2 rs1 010 imm[4:0] 0100011 
sw x18, 0(x21) //0x012AA023
//0000000 10010 10101 010 00000 0100011 
//store value of j at adress 0x2000
//imm[11:5] rs2 rs1 010 imm[4:0] 0100011 
sw x19, 0x8(x21) //0x013AA423
//0000000 10011 10101 010 01000 0100011 
//store i value in 0x2008
//imm[11:5] rs2 rs1 010 imm[4:0] 0100011 
/*
 	Add your assembly code above this line
*/
	nop
	nop
	nop
	halt
	nop
	nop
	nop

//The assembly portion took me about an hour to implement. It was difficult to debug. 
//Converting each assembly instruction to machine code took me about half an hour. I would imagine it would be very difficult to debug.