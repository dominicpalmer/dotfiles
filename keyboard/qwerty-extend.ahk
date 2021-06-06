; -------------------- QWERTY-Extend: Capslock Extend Layer --------------------
; ------------------------------ Dominic Palmer --------------------------------
; ------------------------------------------------------------------------------
; This script extends the stock QWERTY layout using an extension layer accessed 
; via the capslock key. Capslock itself is remapped to numlock prior to the 
; extension layer being mapped, meaning the layer is bound to the numlock key 
; state on a system level, but controlled using the capslock key. The ability to 
; toggle capslock is retained via Shift+CapsLock.
; ------------------------------------------------------------------------------

; Remap capslock
RShift & CapsLock::CapsLock
LShift & CapsLock::CapsLock
CapsLock::NumLock

; Remap virtual desktop shortcuts
#u::#Tab
#o::^#d
#n::^#Left
#m::^#Right
#i::^#F4

; Extension layer entry
#If GetKeyState("NumLock", "T")
{
	; Navigation
	i::Up
	j::Left
	k::Down
	l::Right
	u::Home
	o::End
	y::PgUp
	h::PgDn
	]::Escape

	; Text editing shortcuts
	c::^c
	x::^x
	v::^v
	e::^z
	r::^y
	p::Delete

	; Modifier keys on the left hand of the home row
	a::Escape
	s::Alt
	d::LCtrl
	f::LShift

	; Remap n and m to use the Alt modifier for integration with editor shortcuts
	n::!n
	m::!m

	; Forward and back
	VKBA::XButton1
	'::XButton2

	; Unmapped keys
	`::Return
	1::Return
	2::Return
	3::Return
	4::Return
	5::Return
	6::Return
	7::Return
	8::Return
	9::Return
	0::Return
	-::Return
	=::Return
	g::Return
	#::Return
	q::Return
	w::Return
	t::Return
	y::Return
	/::Return
	\::Return
	z::Return
	b::Return
	,::Return
	.::Return
	¬::Return
	!::Return
	"::Return
	£::Return
	$::Return
	%::Return
	^::Return
	&::Return
	*::Return
	(::Return
	)::Return
	_::Return
	+::Return
	[::Return
	{::Return
	:::Return
	@::Return
	~::Return
	|::Return
	<::Return
	>::Return
	?::Return

	<+q::Return
	<+w::Return
	<+e::Return
	<+r::Return
	<+t::Return
	<+a::Return
	<+s::Return
	<+d::Return
	<+f::Return
	<+g::Return
	<+z::Return
	<+x::Return
	<+c::Return
	<+v::Return
	<+b::Return

	>+u::Return
	>+i::Return
	>+o::Return
	>+p::Return
	>+h::Return
	>+j::Return
	>+k::Return
	>+l::Return
	>+n::Return
	>+m::Return
}
