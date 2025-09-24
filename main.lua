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
    "Gastritis",
    "Kolotis Uselratif",
    "Pankreatitis Akut",
    "Diare Akut atau Gastroentritis",
    "Infeksi Saluran Bawah (Usus Besar)",
    "Hemeroid Grade I",
    "Hemeroid Grade II",
    "Hemeroid Grade III",
    "Usus Buntuk (Apendiks)"
}

function love.load()
    regularFont = love.graphics.newFont("assets/Jersey25-Regular.ttf", 32)
    idx = 1
end

function love.update(dt)
    idx = idx + dt
end

function love.draw()
    love.graphics.setBackgroundColor(0.2, 0.2, 0.2)

    local halfWidth = love.graphics.getWidth() * 0.5
    local halfHeight = love.graphics.getHeight() * 0.5

    local text = symptoms[math.floor(idx) % #symptoms]
    drawText(text, regularFont, halfWidth, halfHeight, halfWidth)
end

function drawText(text, font, x, y, width)
    love.graphics.setFont(font)

    local _, lines = font:getWrap(text, width)
    local textHeight = font:getHeight(text)
    for i, v in ipairs(lines) do
        local halfLineWidth = font:getWidth(v) * 0.5
        love.graphics.print(v, x - halfLineWidth, y + (i * textHeight))
    end
end
