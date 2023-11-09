/*
 * regression_.s
 * Author: Jason Swartz
 * Date: 9/26/22
 */

 // Section .crt0 is always placed from address 0
	.section .crt0, "ax"

_start:
	.global _start

 /*
 	Immediate (i-type) ALU operations
     ■ addi 
     ■ slti
     ■ sltiu
     ■ xori
     ■ ori
     ■ andi
 */ 
    addi x4, x0, (-1 & 0xfff) //set x4 to -1 for future tests
    nop
    nop
    nop
    addi x5, x0, (-2 & 0xfff) //set x5 to -2 for future tests
    nop
    nop
    nop
 	addi x2, x0, 2				// load 2 into register x2
 	nop
 	nop
 	nop
 	addi x2, x2, (-1 & 0xfff)	// add -1 to x2 (why & 0xfff?)
 	nop					// x2 = 2
 	nop
 	nop

    
 	slti x3, x2, 2				// compare 1 to 2, less than so x3 = 1
 	nop					// x2 = 1
 	nop
 	nop
 	slti x3, x2, 1				// compare 1 to 1, not less than, so x3 = 0
 	nop					// x3 = 1
 	nop
 	nop 
 	slti x3, x4, 1             //compare -1 to 1, less than so x3 = 1
 	nop					// x3 = 0
    nop
    nop
    slti x3, x2, -1            //compare 1 to -1, not less than so x3 = 0
 	nop					// x3 = 1
    nop
    nop
    slti x3, x5, -1           //compare -2 to -1, less than so x3 = 1
 	nop					// x3 = 0
    nop
    nop
    slti x3, x5, -3            //compare -2 to -3, not less than so x3 = 0
 	nop					// x3 = 1
    nop
    nop



    sltiu x3, x0, 1           //compare 0 to 1, less than so x3 = 1
 	nop					// x3 = 0
    nop
    nop
    sltiu x3, x2, 0           //compare 1 to 0, not less than so x3 = 0
 	nop					// x3 = 1
    nop
    nop
    sltiu x3, x2, 1           //compare 1 to 1, not less than so x3 = 0
 	nop					// x3 = 0
    nop
    nop
    sltiu x3, x4, 0           //compare 0xFFFFFFFF to 0, not less than so x3 = 0
 	nop					// x3 = 0
    nop
    nop
    sltiu x3, x0, -1           //compare 0 to 0xFFFFFFFF, less than so x3 = 1
 	nop					// x3 = 0
    nop
    nop


    xori x3, x0, -1           //Compute 0 ^ 0xFFFFFFFF, x3 = -1
 	nop					// x3 = 1
    nop
    nop
    xori x3, x0, 0           //Compute 0 ^ 0, x3 = 0
 	nop					// x3 = -1
    nop
    nop
    xori x3, x4, -1          //Compute -1 ^ -1, x3 = 0
 	nop					// x3 = 0
    nop
    nop

    ori x3, x0, -1          //Compute 0 | 0xFFFFFFFF, x3 = -1
 	nop					// x3 = 0
    nop
    nop
    ori x3, x0, 0          //Compute 0 | 0, x3 = 0
 	nop					// x3 = -1
    nop
    nop
    ori x3, x4, -1          //Compute 0xFFFFFFFF | 0xFFFFFFFF, x3 = -1
 	nop					// x3 = 0
    nop
    nop

    andi x3, x0, 0          //Compute 0 & 0, x3 = 0
 	nop					// x3 = -1
    nop
    nop
    andi x3, x4, -1          //Compute 0xFFFFFFFF & 0xFFFFFFFF, x3 = -1
 	nop					// x3 = 0
    nop
    nop
    andi x3, x0, -1          //Compute 0 & 0xFFFFFFFF, x3 = 0 FAILS ON THIS TEST
 	nop					// x3 = -1
    nop
    nop


    nop
 	nop                 // x3 = 0
 	nop
 	nop
  	//halt
 	nop
 	nop
 	nop
 	nop




















 /*
 	Immediate (r-type) ALU operations
 */
    //add, sub, sll, slt, sltu, xor, srl, sra, or, and
    //x2 = 1, x4 = -1, x5 = -2,
    add x3, x4, x4           //set x3 to -1 + -1, x3 = -2
	nop
	nop
	nop
    add x3, x2, x2           //set x3 to 1 + 1, x3 = 2
    nop                 //x3 = -2
    nop
    nop
    add x3, x2, x5          //set x3 to 1 + (-2), x3 = -1
    nop                 //x3 = 2
    nop 
    nop
    add x3, x0, x0          //set x3 to 0 + 0, x3 = 0
    nop                 //x3 = -1
    nop 
    nop 

    sub x3, x2, x4          //set x3 to 1 - (-1), x3 = 2
    nop                 //x3 = 0
    nop
    nop
    sub x3, x4, x4          //set x3 to -1 - (-1), x3 = 0
    nop                 //x3 = 2
    nop
    nop
    sub x3, x2, x0          //set x3 to 1 - 0, x3 = 1
    nop                 //x3 = 0
    nop
    nop
    sub x3, x0, x0          //set x3 to 0 - 0, x3 = 0  //CHECK
    nop                 //x3 = 1
    nop
    nop
    



    sll x3, x4, x0          //shift x4 left by 0 bits, x3 = 0xFFFFFFFF
    nop                 //x3 = 0
    nop
    nop
    sll x3, x4, x2          //shift x4 left by 1 bit, x3 = 0xFFFFFFFE
    nop                 //x3 = -1
    nop
    nop




    slt x3, x0, x2				// compare 0 to 1, less than so x3 = 1
 	nop					// x3 = 0xFFFFFFFE
 	nop
 	nop
 	slt x3, x2, x2				// compare 1 to 1, not less than, so x3 = 0
 	nop					// x3 = 1
 	nop
 	nop 
 	slt x3, x4, x2             //compare -1 to 1, less than so x3 = 1 //FAILS ON THIS TEST
 	nop					// x3 = 0
    nop
    nop
    slt x3, x4, x2             //compare 1 to -1, not less than so x3 = 0
 	nop					// x3 = 1
    nop
    nop
    slt x3, x5, x4           //compare -2 to -1, less than so x3 = 1
 	nop					// x3 = 0
    nop
    nop
    slt x3, x4, x5           //compare -1 to -2, not less than so x3 = 0
 	nop					// x3 = 1
    nop
    nop


    sltu x3, x0, x2           //compare 0 to 1, less than so x3 = 1
 	nop					// x3 = 0
    nop
    nop
    sltu x3, x2, x0           //compare 1 to 0, not less than so x3 = 0
 	nop					// x3 = 1
    nop
    nop
    sltu x3, x2, x2           //compare 1 to 1, not less than so x3 = 0
 	nop					// x3 = 0
    nop
    nop
    sltu x3, x4, x0           //compare 0xFFFFFFFF to 0, not less than so x3 = 0
 	nop					// x3 = 0
    nop
    nop
    sltu x3, x0, x4           //compare 0 to 0xFFFFFFFF, less than so x3 = 1
 	nop					// x3 = 0
    nop
    nop

    xor x3, x0, x4           //Compute 0 ^ 0xFFFFFFFF, x3 = -1
    nop                 // x3 = 1
    nop
    nop
    xor x3, x0, x0           //Compute 0 ^ 0, x3 = 0
    nop                 // x3 = -1
    nop
    nop
    xor x3, x4, x4          //Compute -1 ^ -1, x3 = 0
    nop                 // x3 = 0
    nop
    nop

    or x3, x0, x4          //Compute 0 | 0xFFFFFFFF, x3 = -1
    nop                 // x3 = 0
    nop
    nop
    or x3, x0, x0          //Compute 0 | 0, x3 = 0
    nop                 // x3 = -1
    nop
    nop
    or x3, x4, x4          //Compute 0xFFFFFFFF | 0xFFFFFFFF, x3 = -1
    nop                 // x3 = 0
    nop
    nop

    and x3, x0, x0          //Compute 0 & 0, x3 = 0
    nop                 // x3 = -1
    nop
    nop
    and x3, x4, x4          //Compute 0xFFFFFFFF & 0xFFFFFFFF, x3 = -1
    nop                 // x3 = 0
    nop
    nop
    and x3, x0, x4          //Compute 0 & 0xFFFFFFFF, x3 = 0
    nop                 // x3 = -1
    nop
    nop 

    //srl
    srl x3, x4, x2          //logical shift 0xFFFFFFFF right by 1, x3 = 0x7FFFFFFF
    nop                 // x3 = 0
    nop
    nop
    srl x3, x2, x2          //logical shift 0x00000001 right by 1, x3 = 0x00000000
    nop                 // x3 = 0x7FFFFFFF
    nop
    nop

    //sra
    addi x6, x0, 0xF00      //load 0xFFFFFF00 into x6
    nop                 // x3 = 0xFFFFFFFF
    nop
    nop
    sra x3, x6, x2          //logical shift 0xFFFFFF00 right by 1, x3 = 0x7FFFFF80
    nop                 // x6 = 0xFFFFFF00
    nop
    nop
    sra x3, x2, x2          //logical shift 0x00000001 right by 1, x3 = 0x00000000
    nop                 // x3 = 0x7FFFFFF8
    nop
    nop

    nop                 // x3 = 0x00000000
    nop
    nop
	nop
 	//halt
 	nop
 	nop
 	nop
 	nop



























 /*
 	Immediate (r-type immediate) ALU operations
 */
    //slli
    slli x3, x4, 1          //shift 0xFFFFFFFF left by 1, x3 = 0xFFFFFFFe
    nop     
    nop
    nop
    slli x3, x4, 0          //shift 0xFFFFFFFF left by 0, x3 = 0xFFFFFFFF
    nop                 //x3 = 0xFFFFFFF8
    nop
    nop
    
    //srli
    srli x3, x4, 1          //logical shift 0xFFFFFFFF right by 1, x3 = 0x7FFFFFFF
    nop                 // x3 = 0
    nop
    nop
    srli x3, x2, 1          //logical shift 0x00000001 right by 1, x3 = 0x00000000
    nop                 // x3 = 0x7FFFFFFF
    nop
    nop

    //srai
    srai x3, x6, 1          //logical shift 0xFFFFFF00 right by 1, x3 = 0x7FFFFF80
    nop                 // x3 = 0x00000000
    nop
    nop
    srai x3, x2, 1          //logical shift 0x00000001 right by 1, x3 = 0x00000000
    nop                 // x3 = 0x7FFFFFF8
    nop
    nop




	nop
	nop
	nop
	nop
 	//halt
 	nop
 	nop
 	nop
 	nop


























 /*
 	Data hazard detection and forwarding test sequences
 */
 	addi x2, x0, 1			// load x2 register with 1
 	addi x3, x0, 2			// load x3 register with 2
 	addi x4, x0, 3			// load x4 register with 3
 	addi x5, x0, -1			// load x5 register with -1
    nop
    nop                 //x2 = 1
    nop                 //x3 = 2
    nop                 //x4 = 3
    nop                 //x5 = -1

    //data hazard
    addi x3, x0, 2         //x3 = 2 + 2
    addi x4, x3, 0         //x4 = 2 + 0
    nop
    nop
    nop
    nop                 //x3 = 4
    nop                 //x4 = 2

    //control hazard
    beq x2, x4, 0xF00DF00D
    addi x3, x0, 2         //x3 = 0 + 2
    nop
    nop
    nop
    nop                 
    nop                 //x2 = 4

    //structural hazard
    addi x4, x0, 3          //x4 = 0 + 3
    lb x5, 0(x4)            
    nop 
	nop
	nop
	nop                 //x4 = 3
	nop
  	halt
 	nop
 	nop
 	nop
 	nop
 /*
 	Branch (b-type) operations
 */

	nop
	nop
	nop
	nop
	beq x0, x0, PASS
BRANCH_FAIL:
	nop
	nop
	nop
	nop
	halt		// Branch test has failed, time to debug
	nop
	nop
	nop
	nop
PASS:
	nop
	nop
	nop
  	halt
 	nop
 	nop
 	nop
 	nop
 /*
 	jump instruction operations
 */
	nop
	nop
	nop
	nop
  	halt
 	nop
 	nop
 	nop
 	nop
 /*
 	Store (s-type)  operations
 */
 	// Loading test data into registers for Store / Load tests
 	addi x20, x0, 0x765
 	slli x20, x20, 12
 	ori	x20, x20, 0x432
 	slli x20, x20, 8
 	ori x20, x20, 0x10				// x20 = 0x76543210
 	xori x21, x20, 0xfff			// x21 = 0x89abcdef
 	// Load register x10 with base DATA memory location
 	addi x10, x0, (DATA >> 12)		// Assume DATA memory address less than 24-bits
 	slli x10, x10, 12				// Move the upper 12-bits to locations 12..23
 	ori x10, x10, (DATA & 0xfff)	// OR in the lower 12-bits to create all 24-bits
 	// Load register x11 with base DATA_MINU location
 	addi x11, x0, (DATA_MINUS >> 12)	// Assume DATA memory address less than 24-bits
 	slli x11, x11, 12					// Move the upper 12-bits to locations 12..23
 	ori x11, x11, (DATA_MINUS & 0xfff)	// OR in the lower 12-bits to create all 24-bits
 	// start of Store Instruction test
	nop
	nop
	nop
	nop
  	halt
  	nop
  	beq x0, x0, LOAD_TEST
  	nop
  	nop
 /*
 	Data Memory Space for regression test
 	- There are 8 NOP locations which are available
 		to be overwritten for test
 	- Accessing the first data location by 0 offset of x10 => 0(x10)
 	- Accessing the 1st byte in data space is 1 offset of x10 => 1(x10)
 	- Accessing the 2nd half-word in data space is 2 offset of x10 => 2(x10)
 	- Accessing the 2nd word in data space is 4 offset of x10 => 4(x10)
 */
DATA:
 	nop
 	nop
 	nop
 	nop
 	nop
 	nop
 	nop
 	nop
 DATA_MINUS:

 /*
 	Load (l-type)  operations
 */
LOAD_TEST:
	nop
	nop
	nop
	nop
  	halt
 	nop
 	nop
 	nop
 	nop
 LOAD_FAIL:							// Using branch statements, if load does not
 	nop								// return result expected, branch to LOAD_FAIL label
 	nop
 	nop
 	halt
 	nop
 	nop
 	nop
 	nop


