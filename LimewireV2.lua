Repo = "https://github.com/AstoriaCC/LimewireCC/raw/master/"
Filename = "Default"
Extension = ".dfpwm"
Download = Repo..Filename..Extension
tape = peripheral.find("tape_drive")
term.setBackgroundColor(colors.lime)
term.clear()
term.setCursorPos(1,1)
term.setTextColor(colors.white)
print("Limewire Version 2")
if tape == nil then
print("No Drive")
else
print("Which Operation would you like to use?")
print("1:Download a file(Case Sensitive)")
print("2:Download list of available files")
print("3:List available files")
print("Enter:Exit Limewire")
local op = read()
if op == "1" then
print("Please enter filename you would like to download")
write("File:")
Filename = read()
FName = Filename..Extension
url = Repo..FName
local response = http.get(url, nil, true) -- THIS IS IMPORTANT
print("Downloading")
tape.seek(-tape.getPosition()) --Rewind to start
tape.write(response.readAll())
response.close()
tape.seek(-tape.getPosition())
tape.setLabel(Filename)
print("Music Written")
sleep(3)
shell.run("Limewire")
end
if op == "2" then
shell.run("rm", "OP.txt")
shell.run("wget", Repo.."OP.txt")
print("List Downloaded")
sleep(3)
shell.run("Limewire")
end
if op == "3" then
local list = fs.open("OP.txt", "r")
textutils.pagedPrint(list.readAll())
sleep(3)
shell.run("Limewire")
end
term.setBackgroundColor(colors.black)
term.setCursorPos(1,1)
term.clear()
end