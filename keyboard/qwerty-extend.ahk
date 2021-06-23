; -------------------- QWERTY-Extend: Capslock Extend Layer --------------------
; ------------------------------ Dominic Palmer --------------------------------
; ------------------------------------------------------------------------------
; This script extends the stock QWERTY layout using an extension layer accessed
; via the capslock key. Capslock itself is remapped to numlock prior to the
; extension layer being mapped, meaning the layer is bound to the numlock key
; state on a system level, but controlled using the capslock key. The ability to
; toggle capslock is retained via Shift+CapsLock.
;
; The script also includes remaps for Windows virtual desktop shortcuts, a remap
; for right Alt (AltGr) to Control, and a map of double shift to Escape.
; ------------------------------------------------------------------------------

; Remap capslock
Shift & CapsLock::CapsLock
CapsLock::NumLock

; Remap virtual desktop shortcuts
#u::#Tab
#o::^#d
#n::^#Left
#m::^#Right
#i::^#F4

; AltGr to Control
RAlt::Ctrl

; Double shift to Escape
LShift & RShift::Esc
RShift & LShift::Esc

; Extension layer entry
#if GetKeyState("NumLock", "T")
{
    ; Navigation
    i::Up
    j::Left
    k::Down
    l::Right
    u::Home
    o::End
	h::PgDn
    p::PgUp
    g::Escape
	VKBA::Delete
	t::XButton2 ; Mouse forward
	'::XButton1 ; Mouse back

    ; Text editing
	c::^c
	w::^x
    v::^v
    e::^z
    r::^y

    ; Modifier keys on the left hand of the home row
    s::Alt
    d::Ctrl
    f::Shift

    ; Remap n and m to Alt-n, Alt-m for integration with editor shortcuts
    n::!n
    m::!m

    ; Function keys
    1::F1
    2::F2
    3::F3
    4::F4
    5::F5
    6::F6
    7::F7
    8::F8
    9::F9
    0::F10
    -::F11
    =::F12

	; All other keys
	\::PrintScreen
	z::ScrollLock
	x::Pause

    ; Unmapped base layer keys from left to right, top to bottom
    `::

	q::
	y::
    [::
	]::

	a::
    #::

    b::
    ,::
    .::
	/::
        return
}
