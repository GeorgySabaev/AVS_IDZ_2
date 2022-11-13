	.file	"program.c"
	.intel_syntax noprefix
	.text
	.globl	myreadfile
	.type	myreadfile, @function
myreadfile:
.LFB6:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	rax, QWORD PTR -24[rbp]
	mov	edx, 2
	mov	esi, 0
	mov	rdi, rax
	call	fseek@PLT
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	ftell@PLT
	add	rax, 1
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	edx, 0
	mov	esi, 0
	mov	rdi, rax
	call	fseek@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	lea	rsi, -1[rax]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rdx
	mov	rdx, rsi
	mov	esi, 1
	mov	rdi, rax
	call	fread@PLT
	mov	rax, QWORD PTR -16[rbp]
	lea	rdx, -1[rax]
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	mov	rax, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	myreadfile, .-myreadfile
	.section	.rodata
.LC0:
	.string	"bcdfghjklmnprstvwxyz"
.LC1:
	.string	"%d"
	.text
	.globl	mywritefile
	.type	mywritefile, @function
mywritefile:
.LFB7:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	QWORD PTR -40[rbp], rdi
	lea	rax, .LC0[rip]
	mov	QWORD PTR -8[rbp], rax
	mov	QWORD PTR -16[rbp], 0
	mov	rax, QWORD PTR -40[rbp]
	movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR -25[rbp], al
	jmp	.L4
.L11:
	mov	DWORD PTR -24[rbp], 0
	mov	DWORD PTR -20[rbp], 0
	jmp	.L5
.L8:
	mov	eax, DWORD PTR -20[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	BYTE PTR -25[rbp], al
	jne	.L6
	mov	DWORD PTR -24[rbp], 1
	jmp	.L7
.L6:
	add	DWORD PTR -20[rbp], 1
.L5:
	cmp	DWORD PTR -20[rbp], 19
	jle	.L8
.L7:
	cmp	DWORD PTR -24[rbp], 0
	je	.L9
	movsx	eax, BYTE PTR -25[rbp]
	mov	esi, eax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	jmp	.L10
.L9:
	movsx	eax, BYTE PTR -25[rbp]
	mov	edi, eax
	call	putchar@PLT
.L10:
	add	QWORD PTR -16[rbp], 1
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR -25[rbp], al
.L4:
	cmp	BYTE PTR -25[rbp], 0
	jne	.L11
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	mywritefile, .-mywritefile
	.section	.rodata
.LC2:
	.string	"r"
.LC3:
	.string	"no such file"
.LC4:
	.string	"add path as argument"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi
	mov	QWORD PTR -32[rbp], rsi
	cmp	DWORD PTR -20[rbp], 2
	jne	.L13
	mov	rax, QWORD PTR -32[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC2[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -8[rbp], rax
	cmp	QWORD PTR -8[rbp], 0
	jne	.L14
	lea	rax, .LC3[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 1
	jmp	.L15
.L14:
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	myreadfile
	mov	rdi, rax
	call	mywritefile
	mov	eax, 0
	jmp	.L15
.L13:
	lea	rax, .LC4[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
.L15:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
