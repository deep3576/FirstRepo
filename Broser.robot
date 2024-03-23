*** Settings ***
Library     Browser



*** Test Cases ***
TC1
    Set Browser Timeout    120s
    FOR     ${i}    IN RANGE    0   20
        Open Browser     https://youtu.be/FMwlxdMOgQE    chromium   headless=true
        click   //*[@id="movie_player"]/div[30]/div[2]/div[2]/button[4]
        click   "Quality"
        click   "144p"
        sleep   7
        ${StateofSkip}=    Get Element States    //*[@id="skip-button:5"]/span/button
        log to console   ${StateofSkip}[0]
        IF  '${StateofSkip}[0]'=='visible'
            ${button}     Get Element By Role    button    name=Skip
            click   ${button}
        ELSE
            Keyboard key    Press   Space
            Keyboard key    Press   f

        END
        Log to Console  ${i}
    END
    @{List}=    Get Browser ids
    sleep   604s
    close browser   ALL

