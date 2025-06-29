Input = {
    x=0,
    y=0,
    zd=false,
    xd=false,
    zp=false,
    xp=false,
}

function resetInput()
    Input.x=0
    Input.y=0
    Input.zd=false
    Input.xd=false
    Input.zp=false
    Input.xp=false
end

function updateInput()
    resetInput()
    
    if btn(⬆️) then
        Input.y -= 1
    end

    if btn(⬇️) then
        Input.y += 1
    end

    if btn(⬅️) then
        Input.x -= 1
    end

    if btn(➡️) then
        Input.x += 1
    end

    Input.zd = btn(🅾️)
    Input.xd = btn(❎)
    Input.zp = btnp(🅾️)
    Input.xp = btnp(❎)
end