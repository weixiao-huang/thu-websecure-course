
recho/recho:     file format elf32-i386


Disassembly of section .init:

080485f4 <_init>:
 80485f4:	53                   	push   %ebx
 80485f5:	83 ec 08             	sub    $0x8,%esp
 80485f8:	e8 23 02 00 00       	call   8048820 <__x86.get_pc_thunk.bx>
 80485fd:	81 c3 fb 1b 00 00    	add    $0x1bfb,%ebx
 8048603:	8b 83 fc ff ff ff    	mov    -0x4(%ebx),%eax
 8048609:	85 c0                	test   %eax,%eax
 804860b:	74 05                	je     8048612 <_init+0x1e>
 804860d:	e8 ee 00 00 00       	call   8048700 <__gmon_start__@plt>
 8048612:	83 c4 08             	add    $0x8,%esp
 8048615:	5b                   	pop    %ebx
 8048616:	c3                   	ret    

Disassembly of section .plt:

08048620 <.plt>:
 8048620:	ff 35 fc a1 04 08    	pushl  0x804a1fc
 8048626:	ff 25 00 a2 04 08    	jmp    *0x804a200
 804862c:	00 00                	add    %al,(%eax)
	...

08048630 <setsockopt@plt>:
 8048630:	ff 25 04 a2 04 08    	jmp    *0x804a204
 8048636:	68 00 00 00 00       	push   $0x0
 804863b:	e9 e0 ff ff ff       	jmp    8048620 <.plt>

08048640 <getpwnam@plt>:
 8048640:	ff 25 08 a2 04 08    	jmp    *0x804a208
 8048646:	68 08 00 00 00       	push   $0x8
 804864b:	e9 d0 ff ff ff       	jmp    8048620 <.plt>

08048650 <dup2@plt>:
 8048650:	ff 25 0c a2 04 08    	jmp    *0x804a20c
 8048656:	68 10 00 00 00       	push   $0x10
 804865b:	e9 c0 ff ff ff       	jmp    8048620 <.plt>

08048660 <_exit@plt>:
 8048660:	ff 25 10 a2 04 08    	jmp    *0x804a210
 8048666:	68 18 00 00 00       	push   $0x18
 804866b:	e9 b0 ff ff ff       	jmp    8048620 <.plt>

08048670 <signal@plt>:
 8048670:	ff 25 14 a2 04 08    	jmp    *0x804a214
 8048676:	68 20 00 00 00       	push   $0x20
 804867b:	e9 a0 ff ff ff       	jmp    8048620 <.plt>

08048680 <chdir@plt>:
 8048680:	ff 25 18 a2 04 08    	jmp    *0x804a218
 8048686:	68 28 00 00 00       	push   $0x28
 804868b:	e9 90 ff ff ff       	jmp    8048620 <.plt>

08048690 <alarm@plt>:
 8048690:	ff 25 1c a2 04 08    	jmp    *0x804a21c
 8048696:	68 30 00 00 00       	push   $0x30
 804869b:	e9 80 ff ff ff       	jmp    8048620 <.plt>

080486a0 <htons@plt>:
 80486a0:	ff 25 20 a2 04 08    	jmp    *0x804a220
 80486a6:	68 38 00 00 00       	push   $0x38
 80486ab:	e9 70 ff ff ff       	jmp    8048620 <.plt>

080486b0 <setgroups@plt>:
 80486b0:	ff 25 24 a2 04 08    	jmp    *0x804a224
 80486b6:	68 40 00 00 00       	push   $0x40
 80486bb:	e9 60 ff ff ff       	jmp    8048620 <.plt>

080486c0 <perror@plt>:
 80486c0:	ff 25 28 a2 04 08    	jmp    *0x804a228
 80486c6:	68 48 00 00 00       	push   $0x48
 80486cb:	e9 50 ff ff ff       	jmp    8048620 <.plt>

080486d0 <accept@plt>:
 80486d0:	ff 25 2c a2 04 08    	jmp    *0x804a22c
 80486d6:	68 50 00 00 00       	push   $0x50
 80486db:	e9 40 ff ff ff       	jmp    8048620 <.plt>

080486e0 <fwrite@plt>:
 80486e0:	ff 25 30 a2 04 08    	jmp    *0x804a230
 80486e6:	68 58 00 00 00       	push   $0x58
 80486eb:	e9 30 ff ff ff       	jmp    8048620 <.plt>

080486f0 <setgid@plt>:
 80486f0:	ff 25 34 a2 04 08    	jmp    *0x804a234
 80486f6:	68 60 00 00 00       	push   $0x60
 80486fb:	e9 20 ff ff ff       	jmp    8048620 <.plt>

08048700 <__gmon_start__@plt>:
 8048700:	ff 25 38 a2 04 08    	jmp    *0x804a238
 8048706:	68 68 00 00 00       	push   $0x68
 804870b:	e9 10 ff ff ff       	jmp    8048620 <.plt>

08048710 <strlen@plt>:
 8048710:	ff 25 3c a2 04 08    	jmp    *0x804a23c
 8048716:	68 70 00 00 00       	push   $0x70
 804871b:	e9 00 ff ff ff       	jmp    8048620 <.plt>

08048720 <__libc_start_main@plt>:
 8048720:	ff 25 40 a2 04 08    	jmp    *0x804a240
 8048726:	68 78 00 00 00       	push   $0x78
 804872b:	e9 f0 fe ff ff       	jmp    8048620 <.plt>

08048730 <fprintf@plt>:
 8048730:	ff 25 44 a2 04 08    	jmp    *0x804a244
 8048736:	68 80 00 00 00       	push   $0x80
 804873b:	e9 e0 fe ff ff       	jmp    8048620 <.plt>

08048740 <bind@plt>:
 8048740:	ff 25 48 a2 04 08    	jmp    *0x804a248
 8048746:	68 88 00 00 00       	push   $0x88
 804874b:	e9 d0 fe ff ff       	jmp    8048620 <.plt>

08048750 <memset@plt>:
 8048750:	ff 25 4c a2 04 08    	jmp    *0x804a24c
 8048756:	68 90 00 00 00       	push   $0x90
 804875b:	e9 c0 fe ff ff       	jmp    8048620 <.plt>

08048760 <__errno_location@plt>:
 8048760:	ff 25 50 a2 04 08    	jmp    *0x804a250
 8048766:	68 98 00 00 00       	push   $0x98
 804876b:	e9 b0 fe ff ff       	jmp    8048620 <.plt>

08048770 <fork@plt>:
 8048770:	ff 25 54 a2 04 08    	jmp    *0x804a254
 8048776:	68 a0 00 00 00       	push   $0xa0
 804877b:	e9 a0 fe ff ff       	jmp    8048620 <.plt>

08048780 <htonl@plt>:
 8048780:	ff 25 58 a2 04 08    	jmp    *0x804a258
 8048786:	68 a8 00 00 00       	push   $0xa8
 804878b:	e9 90 fe ff ff       	jmp    8048620 <.plt>

08048790 <listen@plt>:
 8048790:	ff 25 5c a2 04 08    	jmp    *0x804a25c
 8048796:	68 b0 00 00 00       	push   $0xb0
 804879b:	e9 80 fe ff ff       	jmp    8048620 <.plt>

080487a0 <setuid@plt>:
 80487a0:	ff 25 60 a2 04 08    	jmp    *0x804a260
 80487a6:	68 b8 00 00 00       	push   $0xb8
 80487ab:	e9 70 fe ff ff       	jmp    8048620 <.plt>

080487b0 <socket@plt>:
 80487b0:	ff 25 64 a2 04 08    	jmp    *0x804a264
 80487b6:	68 c0 00 00 00       	push   $0xc0
 80487bb:	e9 60 fe ff ff       	jmp    8048620 <.plt>

080487c0 <recv@plt>:
 80487c0:	ff 25 68 a2 04 08    	jmp    *0x804a268
 80487c6:	68 c8 00 00 00       	push   $0xc8
 80487cb:	e9 50 fe ff ff       	jmp    8048620 <.plt>

080487d0 <close@plt>:
 80487d0:	ff 25 6c a2 04 08    	jmp    *0x804a26c
 80487d6:	68 d0 00 00 00       	push   $0xd0
 80487db:	e9 40 fe ff ff       	jmp    8048620 <.plt>

080487e0 <send@plt>:
 80487e0:	ff 25 70 a2 04 08    	jmp    *0x804a270
 80487e6:	68 d8 00 00 00       	push   $0xd8
 80487eb:	e9 30 fe ff ff       	jmp    8048620 <.plt>

Disassembly of section .text:

080487f0 <_start>:
 80487f0:	31 ed                	xor    %ebp,%ebp
 80487f2:	5e                   	pop    %esi
 80487f3:	89 e1                	mov    %esp,%ecx
 80487f5:	83 e4 f0             	and    $0xfffffff0,%esp
 80487f8:	50                   	push   %eax
 80487f9:	54                   	push   %esp
 80487fa:	52                   	push   %edx
 80487fb:	68 70 8e 04 08       	push   $0x8048e70
 8048800:	68 10 8e 04 08       	push   $0x8048e10
 8048805:	51                   	push   %ecx
 8048806:	56                   	push   %esi
 8048807:	68 4c 8b 04 08       	push   $0x8048b4c
 804880c:	e8 0f ff ff ff       	call   8048720 <__libc_start_main@plt>
 8048811:	f4                   	hlt    
 8048812:	66 90                	xchg   %ax,%ax
 8048814:	66 90                	xchg   %ax,%ax
 8048816:	66 90                	xchg   %ax,%ax
 8048818:	66 90                	xchg   %ax,%ax
 804881a:	66 90                	xchg   %ax,%ax
 804881c:	66 90                	xchg   %ax,%ax
 804881e:	66 90                	xchg   %ax,%ax

08048820 <__x86.get_pc_thunk.bx>:
 8048820:	8b 1c 24             	mov    (%esp),%ebx
 8048823:	c3                   	ret    
 8048824:	66 90                	xchg   %ax,%ax
 8048826:	66 90                	xchg   %ax,%ax
 8048828:	66 90                	xchg   %ax,%ax
 804882a:	66 90                	xchg   %ax,%ax
 804882c:	66 90                	xchg   %ax,%ax
 804882e:	66 90                	xchg   %ax,%ax

08048830 <deregister_tm_clones>:
 8048830:	b8 7f a2 04 08       	mov    $0x804a27f,%eax
 8048835:	2d 7c a2 04 08       	sub    $0x804a27c,%eax
 804883a:	83 f8 06             	cmp    $0x6,%eax
 804883d:	76 1a                	jbe    8048859 <deregister_tm_clones+0x29>
 804883f:	b8 00 00 00 00       	mov    $0x0,%eax
 8048844:	85 c0                	test   %eax,%eax
 8048846:	74 11                	je     8048859 <deregister_tm_clones+0x29>
 8048848:	55                   	push   %ebp
 8048849:	89 e5                	mov    %esp,%ebp
 804884b:	83 ec 14             	sub    $0x14,%esp
 804884e:	68 7c a2 04 08       	push   $0x804a27c
 8048853:	ff d0                	call   *%eax
 8048855:	83 c4 10             	add    $0x10,%esp
 8048858:	c9                   	leave  
 8048859:	f3 c3                	repz ret 
 804885b:	90                   	nop
 804885c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

08048860 <register_tm_clones>:
 8048860:	b8 7c a2 04 08       	mov    $0x804a27c,%eax
 8048865:	2d 7c a2 04 08       	sub    $0x804a27c,%eax
 804886a:	c1 f8 02             	sar    $0x2,%eax
 804886d:	89 c2                	mov    %eax,%edx
 804886f:	c1 ea 1f             	shr    $0x1f,%edx
 8048872:	01 d0                	add    %edx,%eax
 8048874:	d1 f8                	sar    %eax
 8048876:	74 1b                	je     8048893 <register_tm_clones+0x33>
 8048878:	ba 00 00 00 00       	mov    $0x0,%edx
 804887d:	85 d2                	test   %edx,%edx
 804887f:	74 12                	je     8048893 <register_tm_clones+0x33>
 8048881:	55                   	push   %ebp
 8048882:	89 e5                	mov    %esp,%ebp
 8048884:	83 ec 10             	sub    $0x10,%esp
 8048887:	50                   	push   %eax
 8048888:	68 7c a2 04 08       	push   $0x804a27c
 804888d:	ff d2                	call   *%edx
 804888f:	83 c4 10             	add    $0x10,%esp
 8048892:	c9                   	leave  
 8048893:	f3 c3                	repz ret 
 8048895:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080488a0 <__do_global_dtors_aux>:
 80488a0:	80 3d 84 a2 04 08 00 	cmpb   $0x0,0x804a284
 80488a7:	75 13                	jne    80488bc <__do_global_dtors_aux+0x1c>
 80488a9:	55                   	push   %ebp
 80488aa:	89 e5                	mov    %esp,%ebp
 80488ac:	83 ec 08             	sub    $0x8,%esp
 80488af:	e8 7c ff ff ff       	call   8048830 <deregister_tm_clones>
 80488b4:	c6 05 84 a2 04 08 01 	movb   $0x1,0x804a284
 80488bb:	c9                   	leave  
 80488bc:	f3 c3                	repz ret 
 80488be:	66 90                	xchg   %ax,%ax

080488c0 <frame_dummy>:
 80488c0:	b8 08 a1 04 08       	mov    $0x804a108,%eax
 80488c5:	8b 10                	mov    (%eax),%edx
 80488c7:	85 d2                	test   %edx,%edx
 80488c9:	75 05                	jne    80488d0 <frame_dummy+0x10>
 80488cb:	eb 93                	jmp    8048860 <register_tm_clones>
 80488cd:	8d 76 00             	lea    0x0(%esi),%esi
 80488d0:	ba 00 00 00 00       	mov    $0x0,%edx
 80488d5:	85 d2                	test   %edx,%edx
 80488d7:	74 f2                	je     80488cb <frame_dummy+0xb>
 80488d9:	55                   	push   %ebp
 80488da:	89 e5                	mov    %esp,%ebp
 80488dc:	83 ec 14             	sub    $0x14,%esp
 80488df:	50                   	push   %eax
 80488e0:	ff d2                	call   *%edx
 80488e2:	83 c4 10             	add    $0x10,%esp
 80488e5:	c9                   	leave  
 80488e6:	e9 75 ff ff ff       	jmp    8048860 <register_tm_clones>

080488eb <drop_privs>:
 80488eb:	55                   	push   %ebp
 80488ec:	89 e5                	mov    %esp,%ebp
 80488ee:	83 ec 18             	sub    $0x18,%esp
 80488f1:	83 ec 0c             	sub    $0xc,%esp
 80488f4:	ff 75 08             	pushl  0x8(%ebp)
 80488f7:	e8 44 fd ff ff       	call   8048640 <getpwnam@plt>
 80488fc:	83 c4 10             	add    $0x10,%esp
 80488ff:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048902:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048906:	75 23                	jne    804892b <drop_privs+0x40>
 8048908:	a1 80 a2 04 08       	mov    0x804a280,%eax
 804890d:	83 ec 04             	sub    $0x4,%esp
 8048910:	ff 75 08             	pushl  0x8(%ebp)
 8048913:	68 92 8e 04 08       	push   $0x8048e92
 8048918:	50                   	push   %eax
 8048919:	e8 12 fe ff ff       	call   8048730 <fprintf@plt>
 804891e:	83 c4 10             	add    $0x10,%esp
 8048921:	b8 01 00 00 00       	mov    $0x1,%eax
 8048926:	e9 b9 00 00 00       	jmp    80489e4 <drop_privs+0xf9>
 804892b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804892e:	8b 40 14             	mov    0x14(%eax),%eax
 8048931:	83 ec 0c             	sub    $0xc,%esp
 8048934:	50                   	push   %eax
 8048935:	e8 46 fd ff ff       	call   8048680 <chdir@plt>
 804893a:	83 c4 10             	add    $0x10,%esp
 804893d:	85 c0                	test   %eax,%eax
 804893f:	74 1a                	je     804895b <drop_privs+0x70>
 8048941:	83 ec 0c             	sub    $0xc,%esp
 8048944:	68 a5 8e 04 08       	push   $0x8048ea5
 8048949:	e8 72 fd ff ff       	call   80486c0 <perror@plt>
 804894e:	83 c4 10             	add    $0x10,%esp
 8048951:	b8 01 00 00 00       	mov    $0x1,%eax
 8048956:	e9 89 00 00 00       	jmp    80489e4 <drop_privs+0xf9>
 804895b:	83 ec 08             	sub    $0x8,%esp
 804895e:	6a 00                	push   $0x0
 8048960:	6a 00                	push   $0x0
 8048962:	e8 49 fd ff ff       	call   80486b0 <setgroups@plt>
 8048967:	83 c4 10             	add    $0x10,%esp
 804896a:	85 c0                	test   %eax,%eax
 804896c:	74 17                	je     8048985 <drop_privs+0x9a>
 804896e:	83 ec 0c             	sub    $0xc,%esp
 8048971:	68 ab 8e 04 08       	push   $0x8048eab
 8048976:	e8 45 fd ff ff       	call   80486c0 <perror@plt>
 804897b:	83 c4 10             	add    $0x10,%esp
 804897e:	b8 01 00 00 00       	mov    $0x1,%eax
 8048983:	eb 5f                	jmp    80489e4 <drop_privs+0xf9>
 8048985:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048988:	8b 40 0c             	mov    0xc(%eax),%eax
 804898b:	83 ec 0c             	sub    $0xc,%esp
 804898e:	50                   	push   %eax
 804898f:	e8 5c fd ff ff       	call   80486f0 <setgid@plt>
 8048994:	83 c4 10             	add    $0x10,%esp
 8048997:	85 c0                	test   %eax,%eax
 8048999:	74 17                	je     80489b2 <drop_privs+0xc7>
 804899b:	83 ec 0c             	sub    $0xc,%esp
 804899e:	68 b5 8e 04 08       	push   $0x8048eb5
 80489a3:	e8 18 fd ff ff       	call   80486c0 <perror@plt>
 80489a8:	83 c4 10             	add    $0x10,%esp
 80489ab:	b8 01 00 00 00       	mov    $0x1,%eax
 80489b0:	eb 32                	jmp    80489e4 <drop_privs+0xf9>
 80489b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80489b5:	8b 40 08             	mov    0x8(%eax),%eax
 80489b8:	83 ec 0c             	sub    $0xc,%esp
 80489bb:	50                   	push   %eax
 80489bc:	e8 df fd ff ff       	call   80487a0 <setuid@plt>
 80489c1:	83 c4 10             	add    $0x10,%esp
 80489c4:	85 c0                	test   %eax,%eax
 80489c6:	74 17                	je     80489df <drop_privs+0xf4>
 80489c8:	83 ec 0c             	sub    $0xc,%esp
 80489cb:	68 bc 8e 04 08       	push   $0x8048ebc
 80489d0:	e8 eb fc ff ff       	call   80486c0 <perror@plt>
 80489d5:	83 c4 10             	add    $0x10,%esp
 80489d8:	b8 01 00 00 00       	mov    $0x1,%eax
 80489dd:	eb 05                	jmp    80489e4 <drop_privs+0xf9>
 80489df:	b8 00 00 00 00       	mov    $0x0,%eax
 80489e4:	c9                   	leave  
 80489e5:	c3                   	ret    

080489e6 <recv_line>:
 80489e6:	55                   	push   %ebp
 80489e7:	89 e5                	mov    %esp,%ebp
 80489e9:	83 ec 18             	sub    $0x18,%esp
 80489ec:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 80489f3:	8b 55 08             	mov    0x8(%ebp),%edx
 80489f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80489f9:	01 c2                	add    %eax,%edx
 80489fb:	a1 88 a2 04 08       	mov    0x804a288,%eax
 8048a00:	6a 00                	push   $0x0
 8048a02:	6a 01                	push   $0x1
 8048a04:	52                   	push   %edx
 8048a05:	50                   	push   %eax
 8048a06:	e8 b5 fd ff ff       	call   80487c0 <recv@plt>
 8048a0b:	83 c4 10             	add    $0x10,%esp
 8048a0e:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048a11:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 8048a15:	75 21                	jne    8048a38 <recv_line+0x52>
 8048a17:	e8 44 fd ff ff       	call   8048760 <__errno_location@plt>
 8048a1c:	8b 00                	mov    (%eax),%eax
 8048a1e:	83 f8 0b             	cmp    $0xb,%eax
 8048a21:	74 0c                	je     8048a2f <recv_line+0x49>
 8048a23:	e8 38 fd ff ff       	call   8048760 <__errno_location@plt>
 8048a28:	8b 00                	mov    (%eax),%eax
 8048a2a:	83 f8 04             	cmp    $0x4,%eax
 8048a2d:	75 02                	jne    8048a31 <recv_line+0x4b>
 8048a2f:	eb 29                	jmp    8048a5a <recv_line+0x74>
 8048a31:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8048a36:	eb 27                	jmp    8048a5f <recv_line+0x79>
 8048a38:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8048a3c:	75 02                	jne    8048a40 <recv_line+0x5a>
 8048a3e:	eb 1c                	jmp    8048a5c <recv_line+0x76>
 8048a40:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048a43:	01 45 f4             	add    %eax,-0xc(%ebp)
 8048a46:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048a49:	8d 50 ff             	lea    -0x1(%eax),%edx
 8048a4c:	8b 45 08             	mov    0x8(%ebp),%eax
 8048a4f:	01 d0                	add    %edx,%eax
 8048a51:	0f b6 00             	movzbl (%eax),%eax
 8048a54:	3c 0a                	cmp    $0xa,%al
 8048a56:	75 02                	jne    8048a5a <recv_line+0x74>
 8048a58:	eb 02                	jmp    8048a5c <recv_line+0x76>
 8048a5a:	eb 97                	jmp    80489f3 <recv_line+0xd>
 8048a5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048a5f:	c9                   	leave  
 8048a60:	c3                   	ret    

08048a61 <sendlen>:
 8048a61:	55                   	push   %ebp
 8048a62:	89 e5                	mov    %esp,%ebp
 8048a64:	83 ec 18             	sub    $0x18,%esp
 8048a67:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048a6e:	eb 52                	jmp    8048ac2 <sendlen+0x61>
 8048a70:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048a73:	2b 45 f4             	sub    -0xc(%ebp),%eax
 8048a76:	89 c2                	mov    %eax,%edx
 8048a78:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8048a7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048a7e:	01 c1                	add    %eax,%ecx
 8048a80:	a1 88 a2 04 08       	mov    0x804a288,%eax
 8048a85:	6a 00                	push   $0x0
 8048a87:	52                   	push   %edx
 8048a88:	51                   	push   %ecx
 8048a89:	50                   	push   %eax
 8048a8a:	e8 51 fd ff ff       	call   80487e0 <send@plt>
 8048a8f:	83 c4 10             	add    $0x10,%esp
 8048a92:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048a95:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 8048a99:	75 21                	jne    8048abc <sendlen+0x5b>
 8048a9b:	e8 c0 fc ff ff       	call   8048760 <__errno_location@plt>
 8048aa0:	8b 00                	mov    (%eax),%eax
 8048aa2:	83 f8 0b             	cmp    $0xb,%eax
 8048aa5:	74 0c                	je     8048ab3 <sendlen+0x52>
 8048aa7:	e8 b4 fc ff ff       	call   8048760 <__errno_location@plt>
 8048aac:	8b 00                	mov    (%eax),%eax
 8048aae:	83 f8 04             	cmp    $0x4,%eax
 8048ab1:	75 02                	jne    8048ab5 <sendlen+0x54>
 8048ab3:	eb 0d                	jmp    8048ac2 <sendlen+0x61>
 8048ab5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8048aba:	eb 11                	jmp    8048acd <sendlen+0x6c>
 8048abc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048abf:	01 45 f4             	add    %eax,-0xc(%ebp)
 8048ac2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048ac5:	3b 45 0c             	cmp    0xc(%ebp),%eax
 8048ac8:	72 a6                	jb     8048a70 <sendlen+0xf>
 8048aca:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048acd:	c9                   	leave  
 8048ace:	c3                   	ret    

08048acf <sendstr>:
 8048acf:	55                   	push   %ebp
 8048ad0:	89 e5                	mov    %esp,%ebp
 8048ad2:	83 ec 08             	sub    $0x8,%esp
 8048ad5:	83 ec 0c             	sub    $0xc,%esp
 8048ad8:	ff 75 08             	pushl  0x8(%ebp)
 8048adb:	e8 30 fc ff ff       	call   8048710 <strlen@plt>
 8048ae0:	83 c4 10             	add    $0x10,%esp
 8048ae3:	83 ec 08             	sub    $0x8,%esp
 8048ae6:	50                   	push   %eax
 8048ae7:	ff 75 08             	pushl  0x8(%ebp)
 8048aea:	e8 72 ff ff ff       	call   8048a61 <sendlen>
 8048aef:	83 c4 10             	add    $0x10,%esp
 8048af2:	c9                   	leave  
 8048af3:	c3                   	ret    

08048af4 <handle>:
 8048af4:	55                   	push   %ebp
 8048af5:	89 e5                	mov    %esp,%ebp
 8048af7:	81 ec 08 01 00 00    	sub    $0x108,%esp
 8048afd:	83 ec 04             	sub    $0x4,%esp
 8048b00:	68 00 01 00 00       	push   $0x100
 8048b05:	6a 00                	push   $0x0
 8048b07:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
 8048b0d:	50                   	push   %eax
 8048b0e:	e8 3d fc ff ff       	call   8048750 <memset@plt>
 8048b13:	83 c4 10             	add    $0x10,%esp
 8048b16:	83 ec 0c             	sub    $0xc,%esp
 8048b19:	68 c4 8e 04 08       	push   $0x8048ec4
 8048b1e:	e8 ac ff ff ff       	call   8048acf <sendstr>
 8048b23:	83 c4 10             	add    $0x10,%esp
 8048b26:	83 ec 0c             	sub    $0xc,%esp
 8048b29:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
 8048b2f:	50                   	push   %eax
 8048b30:	e8 b1 fe ff ff       	call   80489e6 <recv_line>
 8048b35:	83 c4 10             	add    $0x10,%esp
 8048b38:	83 ec 0c             	sub    $0xc,%esp
 8048b3b:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
 8048b41:	50                   	push   %eax
 8048b42:	e8 88 ff ff ff       	call   8048acf <sendstr>
 8048b47:	83 c4 10             	add    $0x10,%esp
 8048b4a:	c9                   	leave  
 8048b4b:	c3                   	ret    

08048b4c <main>:
 8048b4c:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 8048b50:	83 e4 f0             	and    $0xfffffff0,%esp
 8048b53:	ff 71 fc             	pushl  -0x4(%ecx)
 8048b56:	55                   	push   %ebp
 8048b57:	89 e5                	mov    %esp,%ebp
 8048b59:	51                   	push   %ecx
 8048b5a:	83 ec 24             	sub    $0x24,%esp
 8048b5d:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
 8048b64:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 8048b6b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 8048b72:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 8048b79:	83 ec 08             	sub    $0x8,%esp
 8048b7c:	6a 01                	push   $0x1
 8048b7e:	6a 11                	push   $0x11
 8048b80:	e8 eb fa ff ff       	call   8048670 <signal@plt>
 8048b85:	83 c4 10             	add    $0x10,%esp
 8048b88:	83 f8 ff             	cmp    $0xffffffff,%eax
 8048b8b:	75 21                	jne    8048bae <main+0x62>
 8048b8d:	a1 80 a2 04 08       	mov    0x804a280,%eax
 8048b92:	50                   	push   %eax
 8048b93:	6a 1e                	push   $0x1e
 8048b95:	6a 01                	push   $0x1
 8048b97:	68 e8 8e 04 08       	push   $0x8048ee8
 8048b9c:	e8 3f fb ff ff       	call   80486e0 <fwrite@plt>
 8048ba1:	83 c4 10             	add    $0x10,%esp
 8048ba4:	b8 01 00 00 00       	mov    $0x1,%eax
 8048ba9:	e9 57 02 00 00       	jmp    8048e05 <main+0x2b9>
 8048bae:	83 ec 04             	sub    $0x4,%esp
 8048bb1:	6a 06                	push   $0x6
 8048bb3:	6a 01                	push   $0x1
 8048bb5:	6a 02                	push   $0x2
 8048bb7:	e8 f4 fb ff ff       	call   80487b0 <socket@plt>
 8048bbc:	83 c4 10             	add    $0x10,%esp
 8048bbf:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048bc2:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 8048bc6:	75 1a                	jne    8048be2 <main+0x96>
 8048bc8:	83 ec 0c             	sub    $0xc,%esp
 8048bcb:	68 07 8f 04 08       	push   $0x8048f07
 8048bd0:	e8 eb fa ff ff       	call   80486c0 <perror@plt>
 8048bd5:	83 c4 10             	add    $0x10,%esp
 8048bd8:	b8 01 00 00 00       	mov    $0x1,%eax
 8048bdd:	e9 23 02 00 00       	jmp    8048e05 <main+0x2b9>
 8048be2:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
 8048be9:	83 ec 0c             	sub    $0xc,%esp
 8048bec:	6a 04                	push   $0x4
 8048bee:	8d 45 e8             	lea    -0x18(%ebp),%eax
 8048bf1:	50                   	push   %eax
 8048bf2:	6a 02                	push   $0x2
 8048bf4:	6a 01                	push   $0x1
 8048bf6:	ff 75 f0             	pushl  -0x10(%ebp)
 8048bf9:	e8 32 fa ff ff       	call   8048630 <setsockopt@plt>
 8048bfe:	83 c4 20             	add    $0x20,%esp
 8048c01:	85 c0                	test   %eax,%eax
 8048c03:	74 1a                	je     8048c1f <main+0xd3>
 8048c05:	83 ec 0c             	sub    $0xc,%esp
 8048c08:	68 0e 8f 04 08       	push   $0x8048f0e
 8048c0d:	e8 ae fa ff ff       	call   80486c0 <perror@plt>
 8048c12:	83 c4 10             	add    $0x10,%esp
 8048c15:	b8 01 00 00 00       	mov    $0x1,%eax
 8048c1a:	e9 e6 01 00 00       	jmp    8048e05 <main+0x2b9>
 8048c1f:	66 c7 45 d8 02 00    	movw   $0x2,-0x28(%ebp)
 8048c25:	83 ec 0c             	sub    $0xc,%esp
 8048c28:	6a 00                	push   $0x0
 8048c2a:	e8 51 fb ff ff       	call   8048780 <htonl@plt>
 8048c2f:	83 c4 10             	add    $0x10,%esp
 8048c32:	89 45 dc             	mov    %eax,-0x24(%ebp)
 8048c35:	b8 d2 04 00 00       	mov    $0x4d2,%eax
 8048c3a:	0f b7 c0             	movzwl %ax,%eax
 8048c3d:	83 ec 0c             	sub    $0xc,%esp
 8048c40:	50                   	push   %eax
 8048c41:	e8 5a fa ff ff       	call   80486a0 <htons@plt>
 8048c46:	83 c4 10             	add    $0x10,%esp
 8048c49:	66 89 45 da          	mov    %ax,-0x26(%ebp)
 8048c4d:	83 ec 04             	sub    $0x4,%esp
 8048c50:	6a 10                	push   $0x10
 8048c52:	8d 45 d8             	lea    -0x28(%ebp),%eax
 8048c55:	50                   	push   %eax
 8048c56:	ff 75 f0             	pushl  -0x10(%ebp)
 8048c59:	e8 e2 fa ff ff       	call   8048740 <bind@plt>
 8048c5e:	83 c4 10             	add    $0x10,%esp
 8048c61:	85 c0                	test   %eax,%eax
 8048c63:	74 1a                	je     8048c7f <main+0x133>
 8048c65:	83 ec 0c             	sub    $0xc,%esp
 8048c68:	68 19 8f 04 08       	push   $0x8048f19
 8048c6d:	e8 4e fa ff ff       	call   80486c0 <perror@plt>
 8048c72:	83 c4 10             	add    $0x10,%esp
 8048c75:	b8 01 00 00 00       	mov    $0x1,%eax
 8048c7a:	e9 86 01 00 00       	jmp    8048e05 <main+0x2b9>
 8048c7f:	83 ec 08             	sub    $0x8,%esp
 8048c82:	6a 14                	push   $0x14
 8048c84:	ff 75 f0             	pushl  -0x10(%ebp)
 8048c87:	e8 04 fb ff ff       	call   8048790 <listen@plt>
 8048c8c:	83 c4 10             	add    $0x10,%esp
 8048c8f:	85 c0                	test   %eax,%eax
 8048c91:	74 1a                	je     8048cad <main+0x161>
 8048c93:	83 ec 0c             	sub    $0xc,%esp
 8048c96:	68 1e 8f 04 08       	push   $0x8048f1e
 8048c9b:	e8 20 fa ff ff       	call   80486c0 <perror@plt>
 8048ca0:	83 c4 10             	add    $0x10,%esp
 8048ca3:	b8 01 00 00 00       	mov    $0x1,%eax
 8048ca8:	e9 58 01 00 00       	jmp    8048e05 <main+0x2b9>
 8048cad:	83 ec 04             	sub    $0x4,%esp
 8048cb0:	6a 00                	push   $0x0
 8048cb2:	6a 00                	push   $0x0
 8048cb4:	ff 75 f0             	pushl  -0x10(%ebp)
 8048cb7:	e8 14 fa ff ff       	call   80486d0 <accept@plt>
 8048cbc:	83 c4 10             	add    $0x10,%esp
 8048cbf:	a3 88 a2 04 08       	mov    %eax,0x804a288
 8048cc4:	a1 88 a2 04 08       	mov    0x804a288,%eax
 8048cc9:	83 f8 ff             	cmp    $0xffffffff,%eax
 8048ccc:	75 15                	jne    8048ce3 <main+0x197>
 8048cce:	83 ec 0c             	sub    $0xc,%esp
 8048cd1:	68 25 8f 04 08       	push   $0x8048f25
 8048cd6:	e8 e5 f9 ff ff       	call   80486c0 <perror@plt>
 8048cdb:	83 c4 10             	add    $0x10,%esp
 8048cde:	e9 1d 01 00 00       	jmp    8048e00 <main+0x2b4>
 8048ce3:	e8 88 fa ff ff       	call   8048770 <fork@plt>
 8048ce8:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8048ceb:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
 8048cef:	75 26                	jne    8048d17 <main+0x1cb>
 8048cf1:	83 ec 0c             	sub    $0xc,%esp
 8048cf4:	68 2c 8f 04 08       	push   $0x8048f2c
 8048cf9:	e8 c2 f9 ff ff       	call   80486c0 <perror@plt>
 8048cfe:	83 c4 10             	add    $0x10,%esp
 8048d01:	a1 88 a2 04 08       	mov    0x804a288,%eax
 8048d06:	83 ec 0c             	sub    $0xc,%esp
 8048d09:	50                   	push   %eax
 8048d0a:	e8 c1 fa ff ff       	call   80487d0 <close@plt>
 8048d0f:	83 c4 10             	add    $0x10,%esp
 8048d12:	e9 e9 00 00 00       	jmp    8048e00 <main+0x2b4>
 8048d17:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 8048d1b:	0f 85 ce 00 00 00    	jne    8048def <main+0x2a3>
 8048d21:	83 ec 0c             	sub    $0xc,%esp
 8048d24:	6a 0f                	push   $0xf
 8048d26:	e8 65 f9 ff ff       	call   8048690 <alarm@plt>
 8048d2b:	83 c4 10             	add    $0x10,%esp
 8048d2e:	83 ec 0c             	sub    $0xc,%esp
 8048d31:	ff 75 f0             	pushl  -0x10(%ebp)
 8048d34:	e8 97 fa ff ff       	call   80487d0 <close@plt>
 8048d39:	83 c4 10             	add    $0x10,%esp
 8048d3c:	83 ec 0c             	sub    $0xc,%esp
 8048d3f:	68 31 8f 04 08       	push   $0x8048f31
 8048d44:	e8 a2 fb ff ff       	call   80488eb <drop_privs>
 8048d49:	83 c4 10             	add    $0x10,%esp
 8048d4c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048d4f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048d53:	75 7e                	jne    8048dd3 <main+0x287>
 8048d55:	a1 88 a2 04 08       	mov    0x804a288,%eax
 8048d5a:	83 ec 08             	sub    $0x8,%esp
 8048d5d:	6a 00                	push   $0x0
 8048d5f:	50                   	push   %eax
 8048d60:	e8 eb f8 ff ff       	call   8048650 <dup2@plt>
 8048d65:	83 c4 10             	add    $0x10,%esp
 8048d68:	83 f8 ff             	cmp    $0xffffffff,%eax
 8048d6b:	75 23                	jne    8048d90 <main+0x244>
 8048d6d:	83 ec 0c             	sub    $0xc,%esp
 8048d70:	68 37 8f 04 08       	push   $0x8048f37
 8048d75:	e8 46 f9 ff ff       	call   80486c0 <perror@plt>
 8048d7a:	83 c4 10             	add    $0x10,%esp
 8048d7d:	a1 88 a2 04 08       	mov    0x804a288,%eax
 8048d82:	83 ec 0c             	sub    $0xc,%esp
 8048d85:	50                   	push   %eax
 8048d86:	e8 45 fa ff ff       	call   80487d0 <close@plt>
 8048d8b:	83 c4 10             	add    $0x10,%esp
 8048d8e:	eb 70                	jmp    8048e00 <main+0x2b4>
 8048d90:	a1 88 a2 04 08       	mov    0x804a288,%eax
 8048d95:	83 ec 08             	sub    $0x8,%esp
 8048d98:	6a 01                	push   $0x1
 8048d9a:	50                   	push   %eax
 8048d9b:	e8 b0 f8 ff ff       	call   8048650 <dup2@plt>
 8048da0:	83 c4 10             	add    $0x10,%esp
 8048da3:	83 f8 ff             	cmp    $0xffffffff,%eax
 8048da6:	75 23                	jne    8048dcb <main+0x27f>
 8048da8:	83 ec 0c             	sub    $0xc,%esp
 8048dab:	68 37 8f 04 08       	push   $0x8048f37
 8048db0:	e8 0b f9 ff ff       	call   80486c0 <perror@plt>
 8048db5:	83 c4 10             	add    $0x10,%esp
 8048db8:	a1 88 a2 04 08       	mov    0x804a288,%eax
 8048dbd:	83 ec 0c             	sub    $0xc,%esp
 8048dc0:	50                   	push   %eax
 8048dc1:	e8 0a fa ff ff       	call   80487d0 <close@plt>
 8048dc6:	83 c4 10             	add    $0x10,%esp
 8048dc9:	eb 35                	jmp    8048e00 <main+0x2b4>
 8048dcb:	e8 24 fd ff ff       	call   8048af4 <handle>
 8048dd0:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048dd3:	a1 88 a2 04 08       	mov    0x804a288,%eax
 8048dd8:	83 ec 0c             	sub    $0xc,%esp
 8048ddb:	50                   	push   %eax
 8048ddc:	e8 ef f9 ff ff       	call   80487d0 <close@plt>
 8048de1:	83 c4 10             	add    $0x10,%esp
 8048de4:	83 ec 0c             	sub    $0xc,%esp
 8048de7:	ff 75 f4             	pushl  -0xc(%ebp)
 8048dea:	e8 71 f8 ff ff       	call   8048660 <_exit@plt>
 8048def:	a1 88 a2 04 08       	mov    0x804a288,%eax
 8048df4:	83 ec 0c             	sub    $0xc,%esp
 8048df7:	50                   	push   %eax
 8048df8:	e8 d3 f9 ff ff       	call   80487d0 <close@plt>
 8048dfd:	83 c4 10             	add    $0x10,%esp
 8048e00:	e9 a8 fe ff ff       	jmp    8048cad <main+0x161>
 8048e05:	8b 4d fc             	mov    -0x4(%ebp),%ecx
 8048e08:	c9                   	leave  
 8048e09:	8d 61 fc             	lea    -0x4(%ecx),%esp
 8048e0c:	c3                   	ret    
 8048e0d:	66 90                	xchg   %ax,%ax
 8048e0f:	90                   	nop

08048e10 <__libc_csu_init>:
 8048e10:	55                   	push   %ebp
 8048e11:	57                   	push   %edi
 8048e12:	31 ff                	xor    %edi,%edi
 8048e14:	56                   	push   %esi
 8048e15:	53                   	push   %ebx
 8048e16:	e8 05 fa ff ff       	call   8048820 <__x86.get_pc_thunk.bx>
 8048e1b:	81 c3 dd 13 00 00    	add    $0x13dd,%ebx
 8048e21:	83 ec 0c             	sub    $0xc,%esp
 8048e24:	8b 6c 24 20          	mov    0x20(%esp),%ebp
 8048e28:	8d b3 0c ff ff ff    	lea    -0xf4(%ebx),%esi
 8048e2e:	e8 c1 f7 ff ff       	call   80485f4 <_init>
 8048e33:	8d 83 08 ff ff ff    	lea    -0xf8(%ebx),%eax
 8048e39:	29 c6                	sub    %eax,%esi
 8048e3b:	c1 fe 02             	sar    $0x2,%esi
 8048e3e:	85 f6                	test   %esi,%esi
 8048e40:	74 23                	je     8048e65 <__libc_csu_init+0x55>
 8048e42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048e48:	83 ec 04             	sub    $0x4,%esp
 8048e4b:	ff 74 24 2c          	pushl  0x2c(%esp)
 8048e4f:	ff 74 24 2c          	pushl  0x2c(%esp)
 8048e53:	55                   	push   %ebp
 8048e54:	ff 94 bb 08 ff ff ff 	call   *-0xf8(%ebx,%edi,4)
 8048e5b:	83 c7 01             	add    $0x1,%edi
 8048e5e:	83 c4 10             	add    $0x10,%esp
 8048e61:	39 f7                	cmp    %esi,%edi
 8048e63:	75 e3                	jne    8048e48 <__libc_csu_init+0x38>
 8048e65:	83 c4 0c             	add    $0xc,%esp
 8048e68:	5b                   	pop    %ebx
 8048e69:	5e                   	pop    %esi
 8048e6a:	5f                   	pop    %edi
 8048e6b:	5d                   	pop    %ebp
 8048e6c:	c3                   	ret    
 8048e6d:	8d 76 00             	lea    0x0(%esi),%esi

08048e70 <__libc_csu_fini>:
 8048e70:	f3 c3                	repz ret 

Disassembly of section .fini:

08048e74 <_fini>:
 8048e74:	53                   	push   %ebx
 8048e75:	83 ec 08             	sub    $0x8,%esp
 8048e78:	e8 a3 f9 ff ff       	call   8048820 <__x86.get_pc_thunk.bx>
 8048e7d:	81 c3 7b 13 00 00    	add    $0x137b,%ebx
 8048e83:	83 c4 08             	add    $0x8,%esp
 8048e86:	5b                   	pop    %ebx
 8048e87:	c3                   	ret    
