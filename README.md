AHK (AutoHotKey) Tool
===

I use AHK for a number of keyboard shortcuts [most all] starting with CapsLock.  They span simple shortcuts like PageUp and arrows, all the way to a Macro recorder.  Take a look and dive in.  Good luck.


# This script in particular...
Mainly AHK captures keystrokes, and I didn’t want any inherent delay on any of my normal buttons (not that it’s actually noticeable) so most everything operates from CAPSLOCK.  Other keys that don’t get pressed often like the F* keys, are also captured.  So generally the shortcuts are either CAPSLOCK + something, or double tap a single key, or press two keys simultaneously.

## Here are some simple CAPSLOCK + shortcuts:
*	**CAPSLOCK + H, J, K, L, B, N, D, U** are left, down, up, right, home, end, page up, and page down.  These are VI-inspired.  With these your fingers really never move off the home row.
*	**CAPSLOCK + ARROW or NUMPAD** moves the window to that area of the monitor.  Diagonals work too if you want to move it to a corner.  Hit the arrow twice and it moves to the other monitor in the respective position.  This can also be done by CAPSLOCK + Middle Mouse button.  Just CAPSLOCK + click in the appropriate region of the current window and then the window will move to the respective region of the monitor.
*	**CAPSLOCK + M** moves the window to the next monitor
*	**CAPSLOCK + Q** will start an email if Outlook is open even in the background, otherwise it’ll open Outlook
*	**CAPSLOCK + Tab** will open/switch to Outlook and switch to the Inbox (and beep)
*	**CAPSLOCK + R** will reply to an email, if you hit R twice within 250ms, then it’ll Reply All
*	**CAPSLOCK + E** opens a new Chrome tab and puts the cursor in the search bar
*	**CAPSLOCK + SHIFT + C** copies the whole line (same for paste)
*	**CAPSLOCK + RCTRL** reloads AHK in case it gets jammed
*	**CAPSLOCK + RSHIFT** disables AHK until pressed again
*	**CAPSLOCK + [ or ]** generally switches tabs in Chrome, or Notepad++ or Linux terminals
*	**CAPSLOCK + ENTER** brings up the “Command Recall”.  You can save whatever text is currently on the clipboard using the instructions mentioned at the top, or recall past saves to either the clipboard to directly outputted.  This can be useful if VNC windows aren’t copying and pasting correctly.
*	**CAPSLOCK (tap then hold) + C** will copy the text to the second clipboard.  This is useful when you want to save something for later.  Also works for cut and paste.

## Here are some great double taps:
Press the button twice within 250ms
*	**F9** opens paint
*	**F10** opens calculator
*	**F11** play/pause song
*	**F12** next song
*	**F1** opens a specific directory (Predator in this case), I have a lot of these from F1 to F6, and then F1 + F2 opens a different directory for example
*	**F7** kicks off the macro recorder
*	**F8** ends the macro recorder, press CAPSLOCK + tilde to playback the macro

Of course there are a ton more, but these will get you 90% there if you decide to use it.  The code is pretty well documented as well so there’s plenty there to kick start your own commands.

See the Autohotkey.pdf for a map of all the shortcuts I have mapped.

About Me:
===
I am a typical engineer and a bit of a keyboard nerd.  AHK has been a big part of my toolset for quite awhile now and I'd like to share it with others who may share my dorkiness.
