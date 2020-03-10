#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


<#F20::
    ;Process, Close, C:\Program Files\Common Files\microsoft shared\ink\tabtip.exe
    ;sleep 1000
    ;Run, C:\Program files\Common Files\microsoft shared\ink\tabtip.exe
    ToggleTouchKeyboard()
    {
    ; Translated to AHK from https://stackoverflow.com/a/39385492
        Shell_TrayWnd := FindWindowEx( 0, 0, "Shell_TrayWnd")
        TrayNotifyWnd := FindWindowEx( Shell_TrayWnd, 0, "TrayNotifyWnd")
        TIPBand := FindWindowEx( TrayNotifyWnd, 0, "TIPBand")
        if (!TIPBand or ErrorLevel)
        {
            MsgBox % "Could not get TIPBand. ErrorLevel: " ErrorLevel
        }
        else
        {
            PostMessage, 0x201, 1, 65537, , ahk_id %TIPBand%
            PostMessage, 0x202, 1, 65537, , ahk_id %TIPBand%
        }
    }

    FindWindowEx( hwnd_parent, hwnd_child, str_class, p_title=0 )
    {
    if ( p_title = 0 )
        type_title = UInt
    else
        type_title = Str
    return, DllCall( "FindWindowEx"
                    , UInt, hwnd_parent
                    , UInt, hwnd_child
                    , Str, str_class
                    , type_title, p_title )
    }