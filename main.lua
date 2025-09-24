local symptoms = {
    "Apakah pasien demam?",
    "Apakah pasian mual hingga muntah?",
    "Apakah pasien merasa kembung?",
    "Apakah pasien sembelit?",
    "Apakah berat badan pasien menurun?",
    "Apakah pasien mengalami nyeri pada perut?",
    "Apakah pasien mengalami nyeri Epigastrium yang hilang setelah makan atau setelah pemberian antasid?",
    "Apakah lidah pasien terasa pahit?",
    "Apakah pasien nyeri, tidak enak di ulu hati atau perut kiri atas?",
    "Apakah pasien muntah darah?",
    "Apakah kotoran pasien berwarna hitam?",
    "Apakah pasien tidak ada nafsu makan dan ingin kurus?",
    "Apakah pasien merasa diare?",
    "Apakah pasien nyeri ketika perut ditekan?",
    "Apakah pasien nyeri perut hebat!?",
    "Apakah pasien nyeri perut melintang tembus sampai punggung disertai muntah?",
    "Apakah nafsu makan pasien menurun?",
    "Apakah nyeri perut pasien tidak bisa diatasi dengan analgesic brasant?",
    "Apakah perut pasien kejang?",
    "Apakah kotoran pasien cair?",
    "Apakah pasien merasa lemas?",
    "Apakah pasien merasa mulas?",
    "Apakah pasien bab berdarah?",
    "Apakah bab pasien berlendir?",
    "Apakah pasien sulit bab karena ada pembengkakan?",
    "Apakah bab pasien berdarah dan berwarna merah segar?",
    "Apakah pasien merasa nyeri pada anus?",
    "Apakah anus pasien benjol dan tidak bisa keluar?",
    "Apakah benjolan pada anus pasien keluar dan bisa masuk sendiri?",
    "Apakah benjolan pada anus pasien keluar dan secara manual harus secara manual dimasukan oleh tangan?",
    "Apakah pasien nyeri diperut di bagian kanan bawah?",
    "Apakah pasien bab lebih dari 3 kali dalam beberapa jam dan disertai muntah?"
};

local illnesses = {
    [1986]       = "Gastritis",
    [14393]      = "Kolotis Uselratif",
    [245774]     = "Pankreatitis Akut",
    [2151415859] = "Diare Akut atau Gastroentritis",
    [29360162]   = "Infeksi Saluran Bawah (Usus Besar)",
    [234881024]  = "Hemeroid Grade I",
    [369098752]  = "Hemeroid Grade II",
    [637534208]  = "Hemeroid Grade III",
    [1074790403] = "Usus Buntuk (Apendiks)"
}

function love.load()
    regularFont = love.graphics.newFont("assets/Jersey25-Regular.ttf", 32)
    idx = 1
end

local isEnterPressed = false
function love.keypressed(key, _, _)
    if key == "return" then
        isEnterPressed = true
    end
end

local isMouseClicked = false
function love.mousepressed(_, _, button, _, _)
    if button == 1 then
        isMouseClicked = true
    end
end

local bits = 0x0
function love.draw()
    love.graphics.setBackgroundColor(0.2, 0.2, 0.2)

    local x = love.graphics.getWidth() * 0.5
    local y = love.graphics.getHeight() * 0.5
    if idx > #symptoms then
        guiText("Pasien Terdiagnosa Penyakit:", regularFont, x, y, x)
        y = y + 80

        local text = illnesses[bits]
        if text then
            guiText(text, regularFont, x, y, x)
        else
            guiText("Penyakit Tak Dikenal!", regularFont, x, y, x)
        end

        return
    end

    guiText("Pertanyaan " .. idx, regularFont, x, y, x)
    y = y + 60

    local text = symptoms[idx]
    guiText(text, regularFont, x, y, x)
    y = y + 160

    if guiButton("Ya", regularFont, x - 130, y, 120) then
        bits = bit.bor(bits, bit.lshift(1, idx - 1))
        idx = idx + 1
    end

    if guiButton("Tidak", regularFont, x + 30, y, 120) then
        idx = idx + 1
    end

    isEnterPressed = false
    isMouseClicked = false
end

function guiText(text, font, x, y, width)
    love.graphics.setFont(font)
    love.graphics.setColor(1.0, 1.0, 1.0)

    local _, lines = font:getWrap(text, width)
    local textHeight = font:getHeight(text)
    for i, v in ipairs(lines) do
        local halfLineWidth = font:getWidth(v) * 0.5
        love.graphics.print(v, x - halfLineWidth, y + (i * textHeight))
    end
end

function guiButton(text, font, x, y, width)
    love.graphics.setFont(font)

    local hovered = false
    local cursorX, cursorY = love.mouse.getPosition()
    if cursorX > x and cursorX < (x + width) 
        and cursorY > y and cursorY < (y + 48) then
        hovered = true
    end

    local activated = hovered and (isMouseClicked or isEnterPressed)
    if acitvated then
        love.graphics.setColor(0.2, 0.2, 0.2)
    elseif hovered then
        love.graphics.setColor(0.7, 0.8, 0.7)
    else
        love.graphics.setColor(0.5, 0.5, 0.5)
    end

    love.graphics.rectangle("fill", x, y, width, 48)

    x = (x + width * 0.5) - font:getWidth(text) * 0.5
    y = (y + 24) - font:getHeight(text) * 0.5

    if activated then
        love.graphics.setColor(0.3, 0.3, 0.3)
    elseif hovered then
        love.graphics.setColor(1.0, 1.0, 1.0)
    else
        love.graphics.setColor(0.9, 0.9, 0.9)
    end
    love.graphics.print(text, x, y)

    return activated
end
