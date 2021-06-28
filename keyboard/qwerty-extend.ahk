; -------------------- QWERTY-Extend: Capslock Extend Layer --------------------
; ------------------------------ Dominic Palmer --------------------------------
; ------------------------------------------------------------------------------
; This script extends the stock QWERTY layout using an extension layer accessed
; via double shift.
;
; Also included are remaps for Windows virtual desktop shortcuts, a remap for
; right Alt (AltGr) to Control, and a remap of CapsLock to Escape. CapsLock
; functionality is retained via Shift + CapsLock.
; ------------------------------------------------------------------------------

; CapsLock to Escape
Shift & CapsLock::CapsLock
CapsLock::Esc

; Remap virtual desktop shortcuts
#u::#Tab
#o::^#d
#n::^#Left
#m::^#Right
#i::^#F4

; AltGr to Control
RAlt::Ctrl

; Double Shift to NumLock
LShift & RShift::NumLock
RShift & LShift::NumLock

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
    t::PgUp
	VKBA::Delete ; VBKA = semicolon
	g::XButton2 ; XButton2 = Mouse forward
	'::XButton1 ; XButton1 = Mouse back

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

    ; n and m to Alt-n, Alt-m for integration with editor shortcuts
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
    p::
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
