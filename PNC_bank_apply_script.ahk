; Press Ctrl+Shift+T to start the script
#SingleInstance, force
^+t::
    ; Sleep, 1500
    ; Send, {Tab} 
    ; sleep, 400
    ; Send, {Enter}
    ; Sleep, 1500 
    ; Send, res
    ; Sleep, 1500
    ; Send, {Down}
    ; Sleep, 1500
    ; Send, {Enter}
    ; Sleep, 5500 
    ; Send, {Tab} 
    ; Sleep, 1500 
    ; Send, {Tab} 
    ; Sleep, 5500 
    ; Send, {Enter}
    ; ;end first page

    ; Sleep, 10000 ;this is the second page load time

sleep, 1000
    Send, {Tab}
    Sleep, 1500
    Send, {Enter} ; this opens How Did You Hear About Us?* 
    sleep,2000
    Send, {Up}
    sleep,450
    Send, {Up}
    sleep,450
    Send, {Up}
    sleep,650
    Send, {enter}
    sleep,650
    Send, {enter}
    sleep,750
    ;end how did you hear
    
    send, {tab}
    sleep,750
    send, {down}
    sleep,750
    send, {tab}
    sleep,750
    send, {tab}
    sleep,750
    send, Adam
    sleep,750
    send, {tab}
    sleep,750 
    send Muehlbauer
    sleep, 750
    send, {tab}
    sleep,750 
    send, {tab}
    sleep,750 
    send 1826 Middle St
    sleep,750 
    send, {tab}
    sleep,750 
    send, {tab}
    sleep,750 
    send, {tab}
    sleep,750
    send, {p}
    sleep,750 
    send, {tab}
    sleep,750 
    send, {tab}
    sleep,750 
    send, {tab}
    sleep,750 
    send, {tab}
    sleep,750 
    send, {tab}
    sleep,750 
    send, {tab}
    sleep,750 
    send, {tab}
    sleep,750 
    send, {Enter}
    sleep, 8000
    ;end second page

    Loop, 16
        {
            Send, +{Tab} ; + means Shift
            Sleep, 100 ; Optional: wait 100 ms between each Shift+Tab
        }
        send, {Enter}
        sleep, 15000
        ;end third page

        send {tab}
        sleep,750 
        send {enter}
        sleep,750 
        send {down}
        sleep,750 
        send {enter}
        sleep,750 
        send {tab}
        sleep,750
        send , n
        sleep,750
        send {tab}
        sleep,750 
        send , y ;are you 18
        sleep,750
        send {tab}
        sleep,750 
        send , y
        sleep, 750
        send {tab}
        sleep, 450
        send, n 
        sleep,750
        send {tab}
        sleep,750
        send n
        sleep,750
        send {tab}
        sleep,750
        send {tab}
        sleep,750
        send {tab}
        sleep,750
        send {tab}
        sleep,750
        send, n
        sleep,750
        send {tab}
        sleep,750
        send, n
        sleep,750
        send {tab}
        sleep,750
        send, n
        sleep,750
        send {tab}
        sleep,750
        send, n
        sleep,750
        send {tab}
        sleep,750
        send, n
        sleep,750
        send {tab}
        sleep,750
        send, n
        sleep,750
        send {tab}
        sleep,750
        send, n
        sleep,750
        send {tab}
        sleep,750
        send, y
        sleep,750
        send {tab}
        sleep,750
        send, y
        sleep,750
        send {tab}
        sleep,750
        send, This application was automated with autohotkey checkout my github https://github.com/The-Roofer to view how
        sleep,750
        send {tab}
        sleep,750
        send, $65,000
        sleep,750
        send {tab}
        sleep,750
        send {tab}
        sleep, 750
        send {enter}
        ;end 3rd page

        sleep,3000
        send {tab}
        sleep,400
        send n
        sleep, 400
        send {tab}
        sleep, 250
        send n
        sleep, 550
        send n
        sleep, 450
        send {tab}
        sleep, 450
        send i
        sleep, 750
        send i
        sleep, 450

        send {tab}
        sleep 250
        send {tab}
        sleep 250
        send {space}
        sleep 250
        send {tab}
        sleep 250
        send {tab}
        sleep 250
        send {enter}

        sleep, 4000
        send {tab}
        sleep, 450
        send {tab}
        sleep, 450
        send Adam Muehlbauer
        sleep, 450 
        send {tab}
        sleep, 450 
        send {tab}
        sleep, 450 
        send {tab}
        sleep, 450 
        send {enter}
        sleep, 450 
        send {enter}
        sleep, 450 
        send {tab}
        sleep, 450 
        send {tab}
        sleep, 450 
        send {tab}
        sleep, 450 
        send {tab}
        sleep, 450 
        send {tab}
        sleep, 450 
        send {space}
        sleep, 450 
        send {tab}
        sleep, 450 
        send {tab}
        sleep, 450 
        send {enter}

return