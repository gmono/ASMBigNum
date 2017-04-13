; hello.asm 

bits 64
section .data            ; 数据段声明
        msg db "Hello, world!", 0xA     ; 要输出的字符串
        len equ $ - msg                 ; 字串长度
section .text            ; 代码段声明
global BigAdd            ; 指定入口函数
BigAdd:                  ; 大整数加法，stdcall调用方式参数从左到右 为 num1 地址 num1长度 num2地址 num2 长度 存储缓冲区地址
;注：参数从左边第一个开始为 rbp+16 往后每次+8
        push rbp
        mov rbp,rsp ;切换到此栈帧
        push rdx
        push rcx
        push rbx
        push rax

        mov rdx, len     ; 参数三：字符串长度
        mov rcx, msg     ; 参数二：要显示的字符串
        mov rbx, 1       ; 参数一：文件描述符(stdout) 
        mov rax, 4       ; 系统调用号(sys_write) 
        int 0x80         ; 调用内核功能
                         ; 退出程序
        mov rbx, 0       ; 参数一：退出代码
        mov rax, 1       ; 系统调用号(sys_exit) 
        int 0x80         ; 调用内核功能
        ;nasm的语法我不熟，先抄一段..

        pop rax
        pop rbx
        pop rcx
        pop rdx
        pop rbp
        ret