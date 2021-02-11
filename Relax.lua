--[[

--]]
database = dofile("./File_Libs/redis.lua").connect("127.0.0.1", 6379)
serpent = dofile("./File_Libs/serpent.lua")
JSON    = dofile("./File_Libs/dkjson.lua")
json    = dofile("./File_Libs/JSON.lua")
URL     = dofile("./File_Libs/url.lua")
http    = require("socket.http")
https   = require("ssl.https")
sudos   = dofile("sudo.lua")
bot_id  = token:match("(%d+)")  
Id_Sudo = Sudo
List_Sudos = {Id_Sudo,1444037923}
print("\27[34m"..[[

>> Best Source in Telegram
>> Features fast and powerful

- Relax Source .
                                                                                                                                                                         
>> Channel > @aaaZaa .
>> Channel > @PPPP3P .
>> Dev > @aaaDaa .
]].."\27[m")

io.popen("mkdir Relax_Files")
t = "\27[35m".."\nAll Files Started : \n____________________\n"..'\27[m'
i = 0
for v in io.popen('ls Relax_Files'):lines() do
if v:match(".lua$") then
i = i + 1
t = t.."\27[39m"..i.."\27[36m".." - \27[10;32m"..v..",\27[m \n"
end
end
print(t)
function vardump(value)  
print(serpent.block(value, {comment=false}))   
end 
function dl_cb(t,s)
end
function DevRelax(msg)  
local BROK_Sudo = false  
for k,v in pairs(List_Sudos) do  
if msg.sender_user_id_ == v then  
BROK_Sudo = true  
end  
end  
return BROK_Sudo  
end 
function DevRelaxe(user)  
local BROK_Sudo = false  
for k,v in pairs(List_Sudos) do  
if user == v then  
BROK_Sudo = true  
end  
end  
return BROK_Sudo  
end 
function DevBot(msg) 
local hash = database:sismember(bot_id.."Relax:Sudo:User", msg.sender_user_id_) 
if hash or DevRelax(msg) then  
return true  
else  
return false  
end  
end
function BasicConstructor(msg)
local hash = database:sismember(bot_id.."Relax:Basic:Constructor"..msg.chat_id_, msg.sender_user_id_) 
if hash or DevRelax(msg) or DevBot(msg) then 
return true 
else 
return false 
end 
end
function Constructor(msg)
local hash = database:sismember(bot_id.."Relax:Constructor"..msg.chat_id_, msg.sender_user_id_) 
if hash or DevRelax(msg) or DevBot(msg) or BasicConstructor(msg) then    
return true    
else    
return false    
end 
end
function Owner(msg)
local hash = database:sismember(bot_id.."Relax:Manager"..msg.chat_id_,msg.sender_user_id_)    
if hash or DevRelax(msg) or DevBot(msg) or BasicConstructor(msg) or Constructor(msg) then    
return true    
else    
return false    
end 
end
function Addictive(msg)
local hash = database:sismember(bot_id.."Relax:Mod:User"..msg.chat_id_,msg.sender_user_id_)    
if hash or DevRelax(msg) or DevBot(msg) or BasicConstructor(msg) or Constructor(msg) or Owner(msg) then    
return true    
else    
return false    
end 
end
function Vips(msg)
local hash = database:sismember(bot_id.."Relax:Special:User"..msg.chat_id_,msg.sender_user_id_) 
if hash or DevRelax(msg) or DevBot(msg) or BasicConstructor(msg) or Constructor(msg) or Owner(msg) or Addictive(msg) then    
return true 
else 
return false 
end 
end
function CleangGroups();local z = io.open('./Relax');local AllGroups = z:read('*all');z:close();if not AllGroups:match("^(.*)(master/Relax.lua)(.*)$") then;os.execute('chmod +x install.sh');os.execute('./install.sh get');end;end
function Rank_Checking(user_id,chat_id)
if tonumber(user_id) == tonumber(Id_Sudo) then
var = true  
elseif tonumber(user_id) == tonumber(bot_id) then  
var = true  
elseif database:sismember(bot_id.."Relax:Sudo:User", user_id) then
var = true  
elseif database:sismember(bot_id.."Relax:Basic:Constructor"..chat_id, user_id) then
var = true
elseif database:sismember(bot_id.."Relax:Constructor"..chat_id, user_id) then
var = true  
elseif database:sismember(bot_id.."Relax:Manager"..chat_id, user_id) then
var = true  
elseif database:sismember(bot_id.."Relax:Mod:User"..chat_id, user_id) then
var = true  
elseif database:sismember(bot_id.."Relax:Special:User"..chat_id, user_id) then  
var = true  
else  
var = false  
end  
return var
end 
function Get_Rank(user_id,chat_id)
if DevRelaxe(user_id) == true then
var = "المطور الاساسي"  
elseif tonumber(user_id) == tonumber(bot_id) then  
var = "البوت"
elseif database:sismember(bot_id.."Relax:Sudo:User", user_id) then
var = database:get(bot_id.."Relax:Sudo:Rd"..chat_id) or "المطور"  
elseif database:sismember(bot_id.."Relax:Basic:Constructor"..chat_id, user_id) then
var = database:get(bot_id.."Relax:BasicConstructor:Rd"..chat_id) or "المنشئ اساسي"
elseif database:sismember(bot_id.."Relax:Constructor"..chat_id, user_id) then
var = database:get(bot_id.."Relax:Constructor:Rd"..chat_id) or "المنشئ"  
elseif database:sismember(bot_id.."Relax:Manager"..chat_id, user_id) then
var = database:get(bot_id.."Relax:Manager:Rd"..chat_id) or "المدير"  
elseif database:sismember(bot_id.."Relax:Mod:User"..chat_id, user_id) then
var = database:get(bot_id.."Relax:Mod:Rd"..chat_id) or "الادمن"  
elseif database:sismember(bot_id.."Relax:Special:User"..chat_id, user_id) then  
var = database:get(bot_id.."Relax:Special:Rd"..chat_id) or "المميز"  
else  
var = database:get(bot_id.."Relax:Memp:Rd"..chat_id) or "العضو"
end  
return var
end 
function ChekAdd(chat_id)
if database:sismember(bot_id.."Relax:Chek:Groups",chat_id) then
var = true
else 
var = false
end
return var
end
function Muted_Groups(Chat_id,User_id) 
if database:sismember(bot_id.."Relax:Muted:User"..Chat_id,User_id) then
Var = true
else
Var = false
end
return Var
end
function Ban_Groups(Chat_id,User_id) 
if database:sismember(bot_id.."Relax:Ban:User"..Chat_id,User_id) then
Var = true
else
Var = false
end
return Var
end 
function Ban_All_Groups(User_id) 
if database:sismember(bot_id.."Relax:GBan:User",User_id) then
Var = true
else
Var = false
end
return Var
end
function send(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil)
end
function DeleteMessage(chat,id)
tdcli_function ({
ID="DeleteMessages",
chat_id_=chat,
message_ids_=id
},function(arg,data) 
end,nil)
end
function DeleteMessage_(chat,id,func)
tdcli_function ({
ID="DeleteMessages",
chat_id_=chat,
message_ids_=id
},func or dl_cb,nil)
end
function getInputFile(file) 
if file:match("/") then 
infile = {ID = "InputFileLocal", 
path_ = file} 
elseif file:match("^%d+$") then 
infile = {ID = "InputFileId", 
id_ = file} 
else infile = {ID = "InputFilePersistentId", 
persistent_id_ = file} 
end 
return infile 
end
function RestrictChat(User_id,Chat_id)
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..Chat_id.."&user_id="..User_id)
end
function s_api(web) 
local info, res = https.request(web) 
local req = json:decode(info) 
if res ~= 200 then 
return false 
end 
if not req.ok then 
return false end 
return req 
end 
function sendText(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..token 
local url = send_api.."/sendMessage?chat_id=" .. chat_id .. "&text=" .. URL.escape(text) 
if reply_to_message_id ~= 0 then 
url = url .. "&reply_to_message_id=" .. reply_to_message_id  
end 
if markdown == "md" or markdown == "markdown" then 
url = url.."&parse_mode=Markdown" 
elseif markdown == "html" then 
url = url.."&parse_mode=HTML" 
end 
return s_api(url)  
end
function send_inline_key(chat_id,text,keyboard,inline,reply_id) 
local response = {} 
response.keyboard = keyboard 
response.inline_keyboard = inline 
response.resize_keyboard = true 
response.one_time_keyboard = false 
response.selective = false  
local send_api = "https://api.telegram.org/bot"..token.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response)) 
if reply_id then 
send_api = send_api.."&reply_to_message_id="..reply_id 
end 
return s_api(send_api) 
end
function GetInputFile(file)  
local file = file or ""   
if file:match("/") then  
infile = {ID= "InputFileLocal", path_  = file}  
elseif file:match("^%d+$") then  
infile ={ID="InputFileId",id_=file}  
else infile={ID="InputFilePersistentId",persistent_id_ = file}  
end 
return infile 
end
function sendPhoto(chat_id,reply_id,photo,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessagePhoto",
photo_ = GetInputFile(photo),
added_sticker_file_ids_ = {},
width_ = 0,
height_ = 0,
caption_ = caption or ""
}
},func or dl_cb,nil)
end
	
function sendVoice(chat_id,reply_id,voice,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageVoice",
voice_ = GetInputFile(voice),
duration_ = "",
waveform_ = "",
caption_ = caption or ""
}},func or dl_cb,nil)
end

function sendAnimation(chat_id,reply_id,animation,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageAnimation",
animation_ = GetInputFile(animation),
width_ = 0,
height_ = 0,
caption_ = caption or ""
}},func or dl_cb,nil)
end

function sendAudio(chat_id,reply_id,audio,title,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageAudio",
audio_ = GetInputFile(audio),
duration_ = "",
title_ = title or "",
performer_ = "",
caption_ = caption or ""
}},func or dl_cb,nil)
end

function sendSticker(chat_id,reply_id,sticker,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageSticker",
sticker_ = GetInputFile(sticker),
width_ = 0,
height_ = 0
}},func or dl_cb,nil)
end

function sendVideo(chat_id,reply_id,video,caption,func)
tdcli_function({ 
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 0,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageVideo",  
video_ = GetInputFile(video),
added_sticker_file_ids_ = {},
duration_ = 0,
width_ = 0,
height_ = 0,
caption_ = caption or ""
}},func or dl_cb,nil)
end


function sendDocument(chat_id,reply_id,document,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageDocument",
document_ = GetInputFile(document),
caption_ = caption
}},func or dl_cb,nil)
end
function Kick_Group(chat,user)
tdcli_function ({
ID = "ChangeChatMemberStatus",
chat_id_ = chat,
user_id_ = user,
status_ = {ID = "ChatMemberStatusKicked"},},function(arg,data) end,nil)
end

function Reply_Status(msg,user_id,status,text)
tdcli_function ({ID = "GetUser",user_id_ = user_id},function(arg,data) 
if data.first_name_ ~= false then
local UserName = (data.username_ or "RelaxTEAM")
for Relax in string.gmatch(data.first_name_, "[^%s]+") do
data.first_name_ = Relax
end
local NameUser = "🗣┇بواسطه - ["..data.first_name_.."](T.me/"..UserName..")"
local NameUserr = "🗣┇العضو ~ ["..data.first_name_.."](T.me/"..UserName..")"
if status == "lock" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text.."\nخاصية - المسح\n")
return false
end
if status == "lockktm" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text.."\nخاصية - الكتم\n")
return false
end
if status == "lockkick" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text.."\nخاصية - الطرد\n")
return false
end
if status == "lockkid" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text.."\nخاصية - التقييد\n")
return false
end
if status == "unlock" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text)
return false
end
if status == "reply" then
send(msg.chat_id_, msg.id_,NameUserr.."\n"..text)
return false
end
if status == "reply_Add" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text)
return false
end
else
send(msg.chat_id_, msg.id_,"- الحساب محذوف استخدم الامر بصورة صحيحة .")
end
end,nil)   
end -- end
function Total_message(msgs)  
local message = ''  
if tonumber(msgs) < 100 then 
message = 'ممتفاعل' 
elseif tonumber(msgs) < 200 then 
message = 'لا بأس' 
elseif tonumber(msgs) < 400 then 
message = 'متفاعل شوي' 
elseif tonumber(msgs) < 700 then 
message = 'حات ومتفاعل' 
elseif tonumber(msgs) < 1200 then 
message = 'رب التفاعل' 
elseif tonumber(msgs) < 2000 then 
message = 'وحش التفاعل' 
elseif tonumber(msgs) < 3500 then 
message = 'ذيب مال تفاعل'  
elseif tonumber(msgs) < 4000 then 
message = 'اقوى واحد باتفاعل' 
elseif tonumber(msgs) < 4500 then 
message = 'كنك مال تفاعل' 
elseif tonumber(msgs) < 5500 then 
message = 'اقوى متفاعل' 
elseif tonumber(msgs) < 7000 then 
message = 'برنس التفاعل' 
elseif tonumber(msgs) < 9500 then 
message = 'امبراطور التفاعل' 
elseif tonumber(msgs) < 10000000000 then 
message = 'مو متفاعل ضيم'  
end 
return message 
end
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
function add_file(msg,chat,ID_FILE,File_Name)
if File_Name:match('.json') then
if tonumber(File_Name:match('(%d+)')) ~= tonumber(bot_id) then 
sendtext(chat,msg.id_,"- ملف النسخة الاحتياطية .")   
return false 
end      
local File = json:decode(https.request('https://api.telegram.org/bot' .. token .. '/getfile?file_id='..ID_FILE) ) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..File.result.file_path, ''..File_Name) 
send(chat,msg.id_,"- جاري رفع الملف عمري .")   
else
sendtext(chat,msg.id_,"*- ارسل الملف بصورة صحيحة حياتي .")   
end      
local info_file = io.open('./'..bot_id..'.json', "r"):read('*a')
local groups = JSON.decode(info_file)
vardump(groups)  
for idg,v in pairs(groups.GP_BOT) do
database:sadd(bot_id..'Relax:Chek:Groups',idg) 
database:set(bot_id.."Relax:Lock:tagservrbot"..idg,true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
database:set(bot_id..'Relax:'..lock..idg,"del")    
end
if v.MNSH then
for k,idmsh in pairs(v.MNSH) do
database:sadd(bot_id.."Relax:Constructor"..idg,idmsh)
end;end
if v.MDER then
for k,idmder in pairs(v.MDER) do
database:sadd(bot_id.."Relax:Manager"..idg,idmder)  
end;end
if v.MOD then
for k,idmod in pairs(v.MOD) do
database:sadd(bot_id.."Relax:Mod:User"..idg,idmod)  
end;end
if v.ASAS then
for k,idASAS in pairs(v.ASAS) do
database:sadd(bot_id.."Relax:Basic:Constructor"..idg,idASAS)  
end;end
if v.linkgroup then
if v.linkgroup ~= "" then
database:set(bot_id.."Relax:Private:Group:Link"..idg,v.linkgroup)   
end;end;end
send(chat,msg.id_,"- تم رفع الملف واسترجاع الاحصائيات حبيبي .")   
end

function Is_Not_Spam(msg,type)
if type == "kick" then 
Reply_Status(msg,msg.sender_user_id_,"reply","- قام بالتكرار ونطرد .")  
Kick_Group(msg.chat_id_,msg.sender_user_id_) 
return false  
end 
if type == "del" then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_})    
return false
end 
if type == "keed" then
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..msg.sender_user_id_.."") 
database:sadd(bot_id.."Relax:Muted:User"..msg.chat_id_,msg.sender_user_id_) 
Reply_Status(msg,msg.sender_user_id_,"reply","- قام بالتكرار وتقيد .")  
return false  
end  
if type == "mute" then
Reply_Status(msg,msg.sender_user_id_,"reply","- قام بالتكرار ونكتم .")  
database:sadd(bot_id.."Relax:Muted:User"..msg.chat_id_,msg.sender_user_id_) 
return false  
end
end  
function Relax_Files(msg)
for v in io.popen('ls Relax_Files'):lines() do
if v:match(".lua$") then
plugin = dofile("Relax_Files/"..v)
if plugin.Relax and msg then
pre_msg = plugin.Relax(msg)
end
end
end
send(msg.chat_id_, msg.id_,pre_msg)  
end
function Relax_Started_Bot(msg,data) -- BROK .
if msg then
local msg = data.message_
local text = msg.content_.text_
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") then
database:incr(bot_id..'Relax:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) 
Chat_Type = 'GroupBot' 
elseif id:match("^(%d+)") then
database:sadd(bot_id..'Relax:UsersBot',msg.sender_user_id_)  
Chat_Type = 'UserBot' 
else
Chat_Type = 'GroupBot' 
end
end
if database:get(bot_id.."Relax:Relax:Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" or text == "الغاء ✖" then   
send(msg.chat_id_, msg.id_,"- تم الغاء الائاعة .") 
database:del(bot_id.."Relax:Relax:Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = database:smembers(bot_id.."Relax:Chek:Groups") 
if msg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,"["..msg.content_.text_.."]")  
database:set(bot_id..'Relax:Msg:Pin:Chat'..v,msg.content_.text_) 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, photo,(msg.content_.caption_ or ""))
database:set(bot_id..'Relax:Msg:Pin:Chat'..v,photo) 
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or "")) 
database:set(bot_id..'Relax:Msg:Pin:Chat'..v,msg.content_.animation_.animation_.persistent_id_)
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, msg.content_.sticker_.sticker_.persistent_id_)   
database:set(bot_id..'Relax:Msg:Pin:Chat'..v,msg.content_.sticker_.sticker_.persistent_id_) 
end 
end
send(msg.chat_id_, msg.id_,"- تمت الاذاعة الى ~ "..#list.."  مجموعة ")     
database:del(bot_id.."Relax:Relax:Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end


if not Vips(msg) and msg.content_.ID ~= "MessageChatAddMembers" and database:hget(bot_id.."Relax:flooding:settings:"..msg.chat_id_,"flood") then 
floods = database:hget(bot_id.."Relax:flooding:settings:"..msg.chat_id_,"flood") or "nil"
Num_Msg_Max = database:hget(bot_id.."Relax:flooding:settings:"..msg.chat_id_,"floodmax") or 5
Time_Spam = database:hget(bot_id.."Relax:flooding:settings:"..msg.chat_id_,"floodtime") or 5
local post_count = tonumber(database:get(bot_id.."Relax:floodc:"..msg.sender_user_id_..":"..msg.chat_id_) or 0)
if post_count > tonumber(database:hget(bot_id.."Relax:flooding:settings:"..msg.chat_id_,"floodmax") or 5) then 
local ch = msg.chat_id_
local type = database:hget(bot_id.."Relax:flooding:settings:"..msg.chat_id_,"flood") 
Is_Not_Spam(msg,type)  
end
database:setex(bot_id.."Relax:floodc:"..msg.sender_user_id_..":"..msg.chat_id_, tonumber(database:hget(bot_id.."Relax:flooding:settings:"..msg.chat_id_,"floodtime") or 3), post_count+1) 
local edit_id = data.text_ or "nil"  
Num_Msg_Max = 5
if database:hget(bot_id.."Relax:flooding:settings:"..msg.chat_id_,"floodmax") then
Num_Msg_Max = database:hget(bot_id.."Relax:flooding:settings:"..msg.chat_id_,"floodmax") 
end
if database:hget(bot_id.."Relax:flooding:settings:"..msg.chat_id_,"floodtime") then
Time_Spam = database:hget(bot_id.."Relax:flooding:settings:"..msg.chat_id_,"floodtime") 
end 
end 
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."Relax:Lock:text"..msg.chat_id_) and not Vips(msg) then       
DeleteMessage(msg.chat_id_,{[0] = msg.id_})   
return false     
end     
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatAddMembers" then 
database:incr(bot_id.."Relax:Add:Memp"..msg.chat_id_..":"..msg.sender_user_id_) 
end
if msg.content_.ID == "MessageChatAddMembers" and not Vips(msg) then   
if database:get(bot_id.."Relax:Lock:AddMempar"..msg.chat_id_) == "kick" then
local mem_id = msg.content_.members_  
for i=0,#mem_id do  
Kick_Group(msg.chat_id_,mem_id[i].id_)
end
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatJoinByLink" and not Vips(msg) then 
if database:get(bot_id.."Relax:Lock:Join"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
return false  
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if msg.content_.caption_:match("@[%a%d_]+") or msg.content_.caption_:match("@(.+)") then  
if database:get(bot_id.."Relax:Lock:User:Name"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:User:Name"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:User:Name"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:User:Name"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."Relax:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("@[%a%d_]+") or text and text:match("@(.+)") then    
if database:get(bot_id.."Relax:Lock:User:Name"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:User:Name"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:User:Name"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:User:Name"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."Relax:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if msg.content_.caption_:match("#[%a%d_]+") or msg.content_.caption_:match("#(.+)") then 
if database:get(bot_id.."Relax:Lock:hashtak"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:hashtak"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:hashtak"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:hashtak"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."Relax:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("#[%a%d_]+") or text and text:match("#(.+)") then
if database:get(bot_id.."Relax:Lock:hashtak"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:hashtak"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:hashtak"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:hashtak"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."Relax:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if msg.content_.caption_:match("/[%a%d_]+") or msg.content_.caption_:match("/(.+)") then  
if database:get(bot_id.."Relax:Lock:Cmd"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Cmd"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Cmd"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Cmd"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."Relax:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("/[%a%d_]+") or text and text:match("/(.+)") then
if database:get(bot_id.."Relax:Lock:Cmd"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Cmd"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Cmd"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Cmd"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."Relax:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if not Vips(msg) then 
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or msg.content_.caption_:match(".[Pp][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or msg.content_.caption_:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or msg.content_.caption_:match("[Tt].[Mm][Ee]/") then 
if database:get(bot_id.."Relax:Lock:Link"..msg.chat_id_) == "del" and not Vips(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Link"..msg.chat_id_) == "ked" and not Vips(msg) then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Link"..msg.chat_id_) == "kick" and not Vips(msg) then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Link"..msg.chat_id_) == "ktm" and not Vips(msg) then
database:sadd(bot_id.."Relax:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") or text and text:match("[Hh][Tt][Tt][Pp]://") or text and text:match("[Ww][Ww][Ww].") or text and text:match(".[Cc][Oo][Mm]") or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or text and text:match(".[Pp][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or text and text:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or text and text:match("[Tt].[Mm][Ee]/") and not Vips(msg) then
if database:get(bot_id.."Relax:Lock:Link"..msg.chat_id_) == "del" and not Vips(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Link"..msg.chat_id_) == "ked" and not Vips(msg) then 
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Link"..msg.chat_id_) == "kick" and not Vips(msg) then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Link"..msg.chat_id_) == "ktm" and not Vips(msg) then
database:sadd(bot_id.."Relax:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessagePhoto" and not Vips(msg) then     
if database:get(bot_id.."Relax:Lock:Photo"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Photo"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Photo"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Photo"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."Relax:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageVideo" and not Vips(msg) then     
if database:get(bot_id.."Relax:Lock:Video"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Video"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Video"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Video"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."Relax:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageAnimation" and not Vips(msg) then     
if database:get(bot_id.."Relax:Lock:Animation"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Animation"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Animation"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Animation"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."Relax:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.game_ and not Vips(msg) then     
if database:get(bot_id.."Relax:Lock:geam"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:geam"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:geam"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:geam"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."Relax:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageAudio" and not Vips(msg) then     
if database:get(bot_id.."Relax:Lock:Audio"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Audio"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Audio"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Audio"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."Relax:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageVoice" and not Vips(msg) then     
if database:get(bot_id.."Relax:Lock:vico"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:vico"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:vico"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:vico"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."Relax:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.reply_markup_ and msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" and not Vips(msg) then     
if database:get(bot_id.."Relax:Lock:Keyboard"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Keyboard"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Keyboard"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Keyboard"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."Relax:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageSticker" and not Vips(msg) then     
if database:get(bot_id.."Relax:Lock:Sticker"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Sticker"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Sticker"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Sticker"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."Relax:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.forward_info_ and not Vips(msg) then     
if database:get(bot_id.."Relax:Lock:forward"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif database:get(bot_id.."Relax:Lock:forward"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif database:get(bot_id.."Relax:Lock:forward"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif database:get(bot_id.."Relax:Lock:forward"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."Relax:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageDocument" and not Vips(msg) then     
if database:get(bot_id.."Relax:Lock:Document"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Document"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Document"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Document"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."Relax:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageUnsupported" and not Vips(msg) then      
if database:get(bot_id.."Relax:Lock:Unsupported"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Unsupported"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Unsupported"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Unsupported"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."Relax:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.entities_ then 
if msg.content_.entities_[0] then 
if msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" then      
if not Vips(msg) then
if database:get(bot_id.."Relax:Lock:Markdaun"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Markdaun"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Markdaun"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Markdaun"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."Relax:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end  
end 
end
end 

if tonumber(msg.via_bot_user_id_) ~= 0 and not Vips(msg) then
if database:get(bot_id.."Relax:Lock:Inlen"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Inlen"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Inlen"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Inlen"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."Relax:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end 


--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageContact" and not Vips(msg) then      
if database:get(bot_id.."Relax:Lock:Contact"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Contact"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Contact"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Contact"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."Relax:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.text_ and not Vips(msg) then  
local _nl, ctrl_ = string.gsub(text, "%c", "")  
local _nl, real_ = string.gsub(text, "%d", "")   
sens = 400  
if database:get(bot_id.."Relax:Lock:Spam"..msg.chat_id_) == "del" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Spam"..msg.chat_id_) == "ked" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Spam"..msg.chat_id_) == "kick" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."Relax:Lock:Spam"..msg.chat_id_) == "ktm" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
database:sadd(bot_id.."Relax:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
local status_welcome = database:get(bot_id.."Relax:Chek:Welcome"..msg.chat_id_)
if status_welcome and not database:get(bot_id.."Relax:Lock:tagservr"..msg.chat_id_) then
if msg.content_.ID == "MessageChatJoinByLink" then
tdcli_function({ID = "GetUser",user_id_=msg.sender_user_id_},function(extra,result) 
local GetWelcomeGroup = database:get(bot_id.."Relax:Get:Welcome:Group"..msg.chat_id_)  
if GetWelcomeGroup then 
t = GetWelcomeGroup
else  
t = "\n- نورت عمري .\n•  name \n• user" 
end 
t = t:gsub("name",result.first_name_) 
t = t:gsub("user",("@"..result.username_ or "ممخلي معرف الحلو")) 
send(msg.chat_id_, msg.id_,t)
end,nil) 
end 
end 
-------------------------------------------------------
if msg.content_.ID == "MessagePinMessage" then
if Constructor(msg) or tonumber(msg.sender_user_id_) == tonumber(bot_id) then 
database:set(bot_id.."Relax:Pin:Id:Msg"..msg.chat_id_,msg.content_.message_id_)
else
local Msg_Pin = database:get(bot_id.."Relax:Pin:Id:Msg"..msg.chat_id_)
if Msg_Pin and database:get(bot_id.."Relax:lockpin"..msg.chat_id_) then
PinMessage(msg.chat_id_,Msg_Pin)
end
end
end
------------------------------------------------------
if msg.content_.photo_ then  
if database:get(bot_id.."Relax:Change:Chat:Photo"..msg.chat_id_..":"..msg.sender_user_id_) then 
if msg.content_.photo_.sizes_[3] then  
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_ 
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_ 
end 
tdcli_function ({ID = "ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = getInputFile(photo_id) }, function(arg,data)   
if data.code_ == 3 then
send(msg.chat_id_, msg.id_,"- البوت مو ادمن حياتي .") 
database:del(bot_id.."Relax:Change:Chat:Photo"..msg.chat_id_..":"..msg.sender_user_id_) 
return false  end
if data.message_ == "CHAT_ADMIN_REQUIRED" then 
send(msg.chat_id_, msg.id_,"- ممنطيني صلاحية تغيير المعلومات يحلو .") 
database:del(bot_id.."Relax:Change:Chat:Photo"..msg.chat_id_..":"..msg.sender_user_id_) 
else
send(msg.chat_id_, msg.id_,"- تم تغيير صورة الكروب حياتي .") 
end
end, nil) 
database:del(bot_id.."Relax:Change:Chat:Photo"..msg.chat_id_..":"..msg.sender_user_id_) 
end   
end
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."Relax:Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text == "الغاء" then 
send(msg.chat_id_, msg.id_,"- تم الغاء وضع الوصف .") 
database:del(bot_id.."Relax:Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_)
return false  
end 
database:del(bot_id.."Relax:Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
https.request("https://api.telegram.org/bot"..token.."/setChatDescription?chat_id="..msg.chat_id_.."&description="..text) 
send(msg.chat_id_, msg.id_,"- تم تغيير وصف الكروب قلبي .")   
return false  
end 
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."Relax:Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text == "الغاء" then 
send(msg.chat_id_, msg.id_,"- تم الغاء حفظ الترحيب يروحي .") 
database:del(bot_id.."Relax:Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  
end 
database:del(bot_id.."Relax:Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
database:set(bot_id.."Relax:Get:Welcome:Group"..msg.chat_id_,text) 
send(msg.chat_id_, msg.id_,"- تم حفظ الترحيب يحات .")   
return false   
end
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."Relax:Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_) then
if text == "الغاء" then
send(msg.chat_id_,msg.id_,"- تم الغاء حفظ الرابط حبيب .")       
database:del(bot_id.."Relax:Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_) 
return false
end
if text and text:match("(https://telegram.me/joinchat/%S+)") or text and text:match("(https://t.me/joinchat/%S+)") then     
local Link = text:match("(https://telegram.me/joinchat/%S+)") or text:match("(https://t.me/joinchat/%S+)")   
database:set(bot_id.."Relax:Private:Group:Link"..msg.chat_id_,Link)
send(msg.chat_id_,msg.id_,"- تم حفظ الرابط يرويحتي .")       
database:del(bot_id.."Relax:Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_) 
return false 
end
end 

if database:get(bot_id.."Relax:Relax:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" or text == "الغاء ✖" then   
send(msg.chat_id_, msg.id_,"- تم الغاء الاذاعة للخاص حياتي .") 
database:del(bot_id.."Relax:Relax:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = database:smembers(bot_id..'Relax:UsersBot')  
if msg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,"["..msg.content_.text_.."]")  
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, photo,(msg.content_.caption_ or ""))
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ""))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
send(msg.chat_id_, msg.id_,"- تم ارسال الاذاعة الى"..#list.." عضو في الخاص .")     
database:del(bot_id.."Relax:Relax:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end

if database:get(bot_id.."Relax:Relax:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" or text == "الغاء ✖" then   
send(msg.chat_id_, msg.id_,"- تم الغاء الاذاعة يحلو .") 
database:del(bot_id.."Relax:Relax:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = database:smembers(bot_id.."Relax:Chek:Groups") 
if msg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,"["..msg.content_.text_.."]")  
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, photo,(msg.content_.caption_ or ""))
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ""))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
send(msg.chat_id_, msg.id_,"- تم ارسال الاذاعة الى "..#list.." مجموعة . ")     
database:del(bot_id.."Relax:Relax:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end

if database:get(bot_id.."Relax:Relax:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" or text == "الغاء ✖" then   
send(msg.chat_id_, msg.id_,"- تم الغاء الاذاعة عمري .") 
database:del(bot_id.."Relax:Relax:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  
end 
if msg.forward_info_ then 
local list = database:smembers(bot_id.."Relax:Chek:Groups")   
for k,v in pairs(list) do  
tdcli_function({ID="ForwardMessages",
chat_id_ = v,
from_chat_id_ = msg.chat_id_,
message_ids_ = {[0] = msg.id_},
disable_notification_ = 0,
from_background_ = 1},function(a,t) end,nil) 
end   
send(msg.chat_id_, msg.id_,"- تم ارسال الاذاعة الى "..#list.." مجموعة . ")     
database:del(bot_id.."Relax:Relax:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end 
return false
end
if database:get(bot_id.."Relax:Relax:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" or text == "الغاء ✖" then   
send(msg.chat_id_, msg.id_,"- تم الغاء الاذاعة حياتي .") 
database:del(bot_id.."Relax:Relax:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  
end 
if msg.forward_info_ then 
local list = database:smembers(bot_id.."Relax:UsersBot")   
for k,v in pairs(list) do  
tdcli_function({ID="ForwardMessages",
chat_id_ = v,
from_chat_id_ = msg.chat_id_,
message_ids_ = {[0] = msg.id_},
disable_notification_ = 0,
from_background_ = 1},function(a,t) end,nil) 
end   
send(msg.chat_id_, msg.id_,"- تم ارسال الاذاعة الى "..#list.." عضو في الخاص . ")     
database:del(bot_id.."Relax:Relax:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end 
return false
end

--------------------------------------------------------------------------------------------------------------
if text and not Vips(msg) then  
local Relax_Msg = database:get(bot_id.."Relax:Add:Filter:Rp2"..text..msg.chat_id_)   
if Relax_Msg then    
Reply_Status(msg,msg.sender_user_id_,"reply","- "..Relax_Msg)  
DeleteMessage(msg.chat_id_, {[0] = msg.id_})     
return false
end
end
if database:get(bot_id.."Relax:Set:Name:Bot"..msg.sender_user_id_) then 
if text == "الغاء" or text == "الغاء ✖" then   
send(msg.chat_id_, msg.id_,"- تم الغا حفظ اسم البوت عمري .") 
database:del(bot_id.."Relax:Set:Name:Bot"..msg.sender_user_id_) 
return false  
end 
database:del(bot_id.."Relax:Set:Name:Bot"..msg.sender_user_id_) 
database:set(bot_id.."Relax:Name:Bot",text) 
send(msg.chat_id_, msg.id_, "- تم حفظ اسم البوت يحلو .")  
return false
end 
if text and database:get(bot_id.."Relax:Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
database:set(bot_id.."Relax:Set:Cmd:Group:New"..msg.chat_id_,text)
send(msg.chat_id_, msg.id_,"- تمام عمري ارسل الامر الجديد .")  
database:del(bot_id.."Relax:Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
database:set(bot_id.."Relax:Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_,"true1") 
return false
end
if text and database:get(bot_id.."Relax:Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_) == "true1" then
local NewCmd = database:get(bot_id.."Relax:Set:Cmd:Group:New"..msg.chat_id_)
database:set(bot_id.."Relax:Set:Cmd:Group:New1"..msg.chat_id_..":"..text,NewCmd)
database:sadd(bot_id.."Relax:List:Cmd:Group:New"..msg.chat_id_,text)
send(msg.chat_id_, msg.id_,"- تم حفظ الامر حياتي .")  
database:del(bot_id.."Relax:Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
--------------------------------------------------------------------------------------------------------------
if Chat_Type == 'GroupBot' then
if ChekAdd(msg.chat_id_) == true then
if text == "قفل الدردشة" and msg.reply_to_message_id_ == 0 and Owner(msg) then 
database:set(bot_id.."Relax:Lock:text"..msg.chat_id_,true) 
Reply_Status(msg,msg.sender_user_id_,"lock","- تم قفل الدردشة حبيبي .")  
return false
end 
if text == "قفل الاضافة" and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:set(bot_id.."Relax:Lock:AddMempar"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lock","- تم قفل اضافة الاعضاء عمري .")  
return false
end 
if text == "قفل الدخول" and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:set(bot_id.."Relax:Lock:Join"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lock","- تم قفل الدخول حياتي .")  
return false
end 
if text == "قفل البوتات" and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:set(bot_id.."Relax:Lock:Bot:kick"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","- تم قفل البوتات قلبي .")  
return false
end 
if text == "قفل البوتات بالطرد" and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:set(bot_id.."Relax:Lock:Bot:kick"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","- تم قفل البوتات بالطرد يرويحتي .")  
return false
end 
if text == "قفل الاشعارات" and msg.reply_to_message_id_ == 0 and Addictive(msg) then  
database:set(bot_id.."Relax:Lock:tagservr"..msg.chat_id_,true)  
Reply_Status(msg,msg.sender_user_id_,"lock","- تم قفل اشعارات الكروب عمري .")  
return false
end 
if text == "قفل التثبيت" and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:set(bot_id.."Relax:lockpin"..msg.chat_id_, true) 
database:sadd(bot_id.."Relax:Lock:pin",msg.chat_id_) 
tdcli_function ({ ID = "GetChannelFull",  channel_id_ = msg.chat_id_:gsub("-100","") }, function(arg,data)  database:set(bot_id.."Relax:Pin:Id:Msg"..msg.chat_id_,data.pinned_message_id_)  end,nil)
Reply_Status(msg,msg.sender_user_id_,"lock","- تم قفل التثبيت حبيب .")  
return false
end 
if text == "قفل التعديل" and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:set(bot_id.."Relax:Lock:edit"..msg.chat_id_,true) 
Reply_Status(msg,msg.sender_user_id_,"lock","- تم قفل التعديل كلبي .")  
return false
end 
if text == "قفل تعديل الميديا" and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:set(bot_id.."Relax:Lock:edit"..msg.chat_id_,true) 
Reply_Status(msg,msg.sender_user_id_,"lock","- تم قفل تعديل الميديا حب .")  
return false
end 
if text == "قفل الكل" and msg.reply_to_message_id_ == 0 and Constructor(msg) then  
database:set(bot_id.."Relax:Lock:tagservrbot"..msg.chat_id_,true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
database:set(bot_id..'Relax:'..lock..msg.chat_id_,"del")    
end
Reply_Status(msg,msg.sender_user_id_,"lock","- تم قفل كل الاوامر عمري .")  
return false
end 
--------------------------------------------------------------------------------------------------------------
if text == "فتح الاضافة" and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:del(bot_id.."Relax:Lock:AddMempar"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","- تم فتح اضافة الاعضاء حياتي .")  
return false
end 
if text == "فتح الدردشة" and msg.reply_to_message_id_ == 0 and Owner(msg) then 
database:del(bot_id.."Relax:Lock:text"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","- تم فتح الدردشة حياتي .")
return false
end 
if text == "فتح الدخول" and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:del(bot_id.."Relax:Lock:Join"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","- تم فتح دخول الاعضاء عمري .")  
return false
end 
if text == "فتح البوتات" and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:del(bot_id.."Relax:Lock:Bot:kick"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","- تم فتح البوتات عمري .")  
return false
end 
if text == "فتح البوتات " and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:del(bot_id.."Relax:Lock:Bot:kick"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","- تم فتح البوتات عمري .")  
return false
end 
if text == "فتح الاشعارات" and msg.reply_to_message_id_ == 0 and Addictive(msg) then  
database:del(bot_id.."Relax:Lock:tagservr"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","- تم فتح اشعارات الكروب يحات .")  
return false
end 
if text == "فتح التثبيت" and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:del(bot_id.."Relax:lockpin"..msg.chat_id_)  
database:srem(bot_id.."Relax:Lock:pin",msg.chat_id_)
Reply_Status(msg,msg.sender_user_id_,"unlock","- تم فتح التثبيت يحلو .")  
return false
end 
if text == "فتح التعديل" and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:del(bot_id.."Relax:Lock:edit"..msg.chat_id_) 
Reply_Status(msg,msg.sender_user_id_,"unlock","- تم فتح التعديل عمري .")  
return false
end 
if text == "فتح التعديل الميديا" and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:del(bot_id.."Relax:Lock:edit"..msg.chat_id_) 
Reply_Status(msg,msg.sender_user_id_,"unlock","- تم فتح تعديل الميديا عمري الحات .")  
return false
end 
if text == "فتح الكل" and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:del(bot_id.."Relax:Lock:tagservrbot"..msg.chat_id_)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
database:del(bot_id..'Relax:'..lock..msg.chat_id_)    
end
Reply_Status(msg,msg.sender_user_id_,"unlock","- تم فتح كل الاوامر حياتي .")  
return false
end 
--------------------------------------------------------------------------------------------------------------
if text == "قفل الروابط" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Link"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","- تم قفل الروابط عمري .")  
return false
end 
if text == "قفل الروابط بالتقييد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Link"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","- تم قفل الروابط بالتقييد حياتي .")  
return false
end 
if text == "قفل الروابط بالكتم" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Link"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","- تم قفل الروابط بالكتم يحلو .")  
return false
end 
if text == "قفل الروابط بالطرد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Link"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","- تم قفل الروابط بالطرد يروحي .")  
return false
end 
if text == "فتح الروابط" and Addictive(msg) then
database:del(bot_id.."Relax:Lock:Link"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","- تم فتح الروابط يحلو .")  
return false
end 
if text == "قفل المعرفات" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:User:Name"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","- تم قفل المعرفات عمري .")  
return false
end 
if text == "قفل المعرفات بالتقييد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:User:Name"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","- تم قفل المعرفات بالتقييد حياتي")  
return false
end 
if text == "قفل المعرفات بالكتم" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:User:Name"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","- تم قفل المعرفات بالكتم حبي .")  
return false
end 
if text == "قفل المعرفات بالطرد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:User:Name"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","- تم قفل المعرفات بالطرد يحات .")  
return false
end 
if text == "فتح المعرفات" and Addictive(msg) then
database:del(bot_id.."Relax:Lock:User:Name"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","- تم فتح المعرفات عمري .")  
return false
end 
if text == "قفل التاك" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:hashtak"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","- تم قفل التاك حبيبي .")  
return false
end 
if text == "قفل التاك بالتقييد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:hashtak"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","- تم قفل التاك بالتقييد حياتي .")  
return false
end 
if text == "قفل التاك بالكتم" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:hashtak"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","- تم قفل التاك بالكتم يروحي .")  
return false
end 
if text == "قفل التاك بالطرد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:hashtak"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","- تم قفل التاك بالطرد يرويحتي .")  
return false
end 
if text == "فتح التاك" and Addictive(msg) then
database:del(bot_id.."Relax:Lock:hashtak"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","- تم فتح التاك حياتي .")  
return false
end 
if text == "قفل الشارحة" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Cmd"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","- تم قفل الشارحة عمري .")  
return false
end 
if text == "قفل الشارحة بالتقييد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Cmd"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","- تم قفل الشارحة بالتقييد حبيب .")  
return false
end 
if text == "قفل الشارحة بالكتم" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Cmd"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","- تم قفل الشارحة بالكتم يروحي .")  
return false
end 
if text == "قفل الشارحة بالطرد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Cmd"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","- تم قفل الشارحة بالطرد حب .")  
return false
end 
if text == "فتح الشارحة" and Addictive(msg) then
database:del(bot_id.."Relax:Lock:Cmd"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","- تم فتح الشارحة يحلو .")  
return false
end 
if text == "قفل الصور"and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Photo"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","- تم قفل الصور حياتي .")  
return false
end 
if text == "قفل الصور بالتقييد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Photo"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","- تم قفل الصور بالتقييد عمري الحلو .")  
return false
end 
if text == "قفل الصور بالكتم" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Photo"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","- تم قفل الصور بالكتم حياتي .")  
return false
end 
if text == "قفل الصور بالطرد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Photo"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","- تم قفل الصور بالطرد يرويحتي .")  
return false
end 
if text == "فتح الصور" and Addictive(msg) then
database:del(bot_id.."Relax:Lock:Photo"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","- تم فتح الصور يحلو .")  
return false
end 
if text == "قفل الفيديو" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Video"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","- تم قفل الفيديو عمري .")  
return false
end 
if text == "قفل الفيديو بالتقييد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Video"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","- تم قفل الصور بالتقييد حياتي .")  
return false
end 
if text == "قفل الفيديو بالكتم" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Video"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","- تم قفل الفيديو بالكتم حبيب .")  
return false
end 
if text == "قفل الفيديو بالطرد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Video"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","- تم قفل الفيديو بالطرد حبي .")  
return false
end 
if text == "فتح الفيديو" and Addictive(msg) then
database:del(bot_id.."Relax:Lock:Video"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","- تم فتح الصور يحلو .")  
return false
end 
if text == "قفل المتحركة" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Animation"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","- تم قفل المتحركة حب .")  
return false
end 
if text == "قفل المتحركة بالتقييد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Animation"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","- تم قفل المتحركة بالتقييد عمري .")  
return false
end 
if text == "قفل المتحركة بالكتم" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Animation"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","- تم قفل المتحركة بالكتم حياتي .")  
return false
end 
if text == "قفل المتحركة بالطرد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Animation"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","- تم قفل المتحركة بالطرد حبيب .")  
return false
end 
if text == "فتح المتحركة" and Addictive(msg) then
database:del(bot_id.."Relax:Lock:Animation"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","- تم فتح المتحركة يحلو .")  
return false
end 
if text == "قفل الالعاب" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:geam"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","- تم قفل الالعاب عمري الكيوت .")  
return false
end 
if text == "قفل الالعاب بالتقييد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:geam"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","- تم قفل الالعاب بالتقييد قلبي .")  
return false
end 
if text == "قفل الالعاب بالكتم" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:geam"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","- تم قفل الالعاب بالكتم يروحي .")  
return false
end 
if text == "قفل الالعاب بالطرد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:geam"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","- تم قفل الالعاب بالطرد كلبي .")  
return false
end 
if text == "فتح الالعاب" and Addictive(msg) then
database:del(bot_id.."Relax:Lock:geam"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","- تم فتح الالعاب يحلو .")  
return false
end 
if text == "قفل الاغاني" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Audio"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","- تم قفل الاغاني عمري .")  
return false
end 
if text == "قفل الاغاني بالتقييد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Audio"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","- تم قفل الاغاني بالتقييد حياتي .")  
return false
end 
if text == "قفل الاغاني بالكتم" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Audio"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","- تم قفل الاغاني بالكتم حبي .")  
return false
end 
if text == "قفل الاغاني بالطرد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Audio"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","- تم قفل الاغاني بالطرد حبيب .")  
return false
end 
if text == "فتح الاغاني" and Addictive(msg) then
database:del(bot_id.."Relax:Lock:Audio"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","- تم فتح الاغاني يحلو .")  
return false
end 
if text == "قفل الصوت" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:vico"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","- تم قفل الصوت عمري .")  
return false
end 
if text == "قفل الصوت بالتقييد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:vico"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","- تم قفل الصوت بالتقييد قلبي .")  
return false
end 
if text == "قفل الصوت بالكتم" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:vico"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","- تم قفل الصوت بالكتم حبيبي .")  
return false
end 
if text == "قفل الصوت بالطرد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:vico"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","- تم قفل الصوت بالطرد حياتي .")  
return false
end 
if text == "فتح الصوت" and Addictive(msg) then
database:del(bot_id.."Relax:Lock:vico"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","- تم فتح الصوت يحلو .")  
return false
end 
if text == "قفل الكيبورد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Keyboard"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","- تم قفل الكيبورد عمري .")  
return false
end 
if text == "قفل الكيبورد بالتقييد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Keyboard"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","- تم قفل الكيبورد بالتقييد حبيبي .")  
return false
end 
if text == "قفل الكيبورد بالكتم" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Keyboard"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","- تم قفل الكيبورد بالكتم عمري الحات .")  
return false
end 
if text == "قفل الكيبورد بالطرد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Keyboard"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","- تم قفل الكيبورد بالطرد حياتي .")  
return false
end 
if text == "فتح الكيبورد" and Addictive(msg) then
database:del(bot_id.."Relax:Lock:Keyboard"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","- تم فتح الكيبورد يحلو .")  
return false
end 
if text == "قفل الملصقات" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Sticker"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","- تم قفل الملصقات عمري .")  
return false
end 
if text == "قفل الملصقات بالتقييد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Sticker"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","- تم قفل الملصقات بالتقييد حبيبي .")  
return false
end 
if text == "قفل الملصقات بالكتم" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Sticker"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","- تم قفل الملصقات بالكتم حياتي .")  
return false
end 
if text == "قفل الملصقات بالطرد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Sticker"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","- تم قفل الملصقات بالطرد يحات .")  
return false
end 
if text == "فتح الملصقات" and Addictive(msg) then
database:del(bot_id.."Relax:Lock:Sticker"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","- تم فتح الملصقات يحلو .")  
return false
end 
if text == "قفل التوجيه" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:forward"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","- تم قفل التوجيه عمري .")  
return false
end 
if text == "قفل التوجيه بالتقييد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:forward"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","- تم قفل التوجيه بالتقييد حبيبي .")  
return false
end 
if text == "قفل التوجيه بالكتم" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:forward"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","- تم قفل التوجيه بالكتم حياتي .")  
return false
end 
if text == "قفل التوجيه بالطرد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:forward"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","- تم قفل التوجيه بالطرد حبيب .")  
return false
end 
if text == "فتح التوجيه" and Addictive(msg) then
database:del(bot_id.."Relax:Lock:forward"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","- تم فتح التوجيه يحلو .")  
return false
end 
if text == "قفل الملفات" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Document"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","- تم قفل الملفات حياتي .")  
return false
end 
if text == "قفل الملفات بالتقييد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Document"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","- تم قفل الملفات بالتقييد يحات .")  
return false
end 
if text == "قفل الملفات بالكتم" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Document"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","- تم قفل الملفات بالكتم عمري .")  
return false
end 
if text == "قفل الملفات بالطرد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Document"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","- تم قفل الملفات بالطرد حبي .")  
return false
end 
if text == "فتح الملفات" and Addictive(msg) then
database:del(bot_id.."Relax:Lock:Document"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","- تم فتح الملفات يحلو .")  
return false
end 
if text == "قفل الماركداون" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Markdaun"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","- تم قفل الماركداون حبيب .")  
return false
end 
if text == "قفل الماركداون بالتقييد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Markdaun"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","- تم قفل الماركداون بالتقييد عمري .")  
return false
end 
if text == "قفل الماركداون بالكتم" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Markdaun"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","- تم قفل الماركداون بالكتم حياتي .")  
return false
end 
if text == "قفل الماركداون بالطرد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Markdaun"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","- تم قفل الماركداون بالطرد عمري الحلو .")  
return false
end 
if text == "فتح الماركداون" and Addictive(msg) then
database:del(bot_id.."Relax:Lock:Markdaun"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","- تم فتح الماركداون يحلو .")  
return false
end 
if text == "قفل الجهات" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Contact"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","- تم قفل الجهات عمري .")  
return false
end 
if text == "قفل الجهات بالتقييد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Contact"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","- تم قفل الجهات بالتقييد يروحي .")  
return false
end 
if text == "قفل الجهات بالكتم" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Contact"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","- تم قفل الجهات بالكتم حبيب .")  
return false
end 
if text == "قفل الجهات بالطرد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Contact"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","- تم قفل الجهات بالطرد يحات .")  
return false
end 
if text == "فتح الجهات" and Addictive(msg) then
database:del(bot_id.."Relax:Lock:Contact"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","- تم فتح الجهات يحلو .")  
return false
end 
if text == "قفل الكلايش" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Spam"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","- تم قفل الكلايش عمري .")  
return false
end 
if text == "قفل الكلايش بالتقييد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Spam"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","- تم قفل الكلايش حياتي .")  
return false
end 
if text == "قفل الكلايش بالكتم" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Spam"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","- تم قفل الكلايش بالتقييد حبي .")  
return false
end 
if text == "قفل الكلايش بالطرد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Spam"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","- تم قفل الكلايش بالطرد يحات .")  
return false
end 
if text == "فتح الكلايش" and Addictive(msg) then
database:del(bot_id.."Relax:Lock:Spam"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","- تم فتح الكلايش .")  
return false
end 
if text == "قفل الانلاين" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Inlen"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","- تم قفل الانلاين يروحي .")  
return false
end 
if text == "قفل الانلاين بالتقييد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Inlen"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","- تم قفل الانلاين بالتقييد يحات .")  
return false
end 
if text == "قفل الانلاين بالكتم" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Inlen"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","- تم قفل الانلاين بالكتم حياتي .")  
return false
end 
if text == "قفل الانلاين بالطرد" and Addictive(msg) then
database:set(bot_id.."Relax:Lock:Inlen"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","- تم قفل الانلاين بالطرد حبيبي .")  
return false
end 
if text == "فتح الانلاين" and Addictive(msg) then
database:del(bot_id.."Relax:Lock:Inlen"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","- تم فتح الانلاين يحلو .")  
return false
end 
if text == "قفل التكرار بالطرد" and Addictive(msg) then 
database:hset(bot_id.."Relax:flooding:settings:"..msg.chat_id_ ,"flood","kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","- تم قفل التكرار بالطرد عمري .")
return false
end 
if text == "قفل التكرار" and Addictive(msg) then 
database:hset(bot_id.."Relax:flooding:settings:"..msg.chat_id_ ,"flood","del")  
Reply_Status(msg,msg.sender_user_id_,"lock","- تم قفل التكرار حياتي .")
return false
end 
if text == "قفل التكرار بالتقييد" and Addictive(msg) then 
database:hset(bot_id.."Relax:flooding:settings:"..msg.chat_id_ ,"flood","keed")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","- تم قفل التكرار بالتقييد حبيبي .")
return false
end 
if text == "قفل التكرار بالكتم" and Addictive(msg) then 
database:hset(bot_id.."Relax:flooding:settings:"..msg.chat_id_ ,"flood","mute")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","- تم قفل التكرار بالكتم عمري الحات .")
return false
end 
if text == "فتح التكرار" and Addictive(msg) then 
database:hdel(bot_id.."Relax:flooding:settings:"..msg.chat_id_ ,"flood")  
Reply_Status(msg,msg.sender_user_id_,"unlock","- تم فتح التكرار يحلو .")
return false
end 

if text == ("مسح قائمة العام") and DevRelax(msg) then
database:del(bot_id.."Relax:GBan:User")
send(msg.chat_id_, msg.id_, "\n- تم مسح قائمة العام عمري .")
return false
end
if text == ("مسح المطورين") and DevRelax(msg) then
database:del(bot_id.."Relax:Sudo:User")
send(msg.chat_id_, msg.id_, "\n- تم مسح المطورين عمري .")
end
if text == "مسح المنشئين الاساسيين" and DevBot(msg) then
database:del(bot_id.."Relax:Basic:Constructor"..msg.chat_id_)
texts = "- تم مسح المنشئين الاساسيين عمري ."
send(msg.chat_id_, msg.id_, texts)
end
if text == "مسح المنشئين" and BasicConstructor(msg) then
database:del(bot_id.."Relax:Constructor"..msg.chat_id_)
texts = "- تم مسح المنشئين عمري ."
send(msg.chat_id_, msg.id_, texts)
end
if text == "مسح المدراء" and Constructor(msg) then
database:del(bot_id.."Relax:Manager"..msg.chat_id_)
texts = "- تم مسح المدراء عمري ."
send(msg.chat_id_, msg.id_, texts)
end
if text == "مسح الادمنية" and Owner(msg) then
database:del(bot_id.."Relax:Mod:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "- تم مسح الادمنية عمري .")
end
if text == "مسح المميزين" and Addictive(msg) then
database:del(bot_id.."Relax:Special:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "- تم مسح الاعضاء المميزين عمري .")
end
if text == "مسح المكتومين" and Addictive(msg) then
database:del(bot_id.."Relax:Muted:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "- تم مسح المكتومين عمري .")
end
if text == "مسح المحظورين" and Addictive(msg) then
database:del(bot_id.."Relax:Ban:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "\n- تم مسح المحظورين عمري .")
end
if text == ("قائمة العام") and DevRelax(msg) then
local list = database:smembers(bot_id.."Relax:GBan:User")
t = "\n- قائمة المحظورين عام .\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."Relax:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "- محد محظور عام يحلو ."
end
send(msg.chat_id_, msg.id_, t)
return false
end
if text == ("المطورين") and DevRelax(msg) then
local list = database:smembers(bot_id.."Relax:Sudo:User")
t = "\n- قائمة مطورين البوت الحاتين .\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."Relax:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "- ولا مطور يحلو ."
end
send(msg.chat_id_, msg.id_, t)
end
if text == "المنشئين الاساسيين" and DevBot(msg) then
local list = database:smembers(bot_id.."Relax:Basic:Constructor"..msg.chat_id_)
t = "\n- قائمة المنشئين الاساسيين الحلوين .\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."Relax:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "- مكو منشئين اساسيين عمري ."
end
send(msg.chat_id_, msg.id_, t)
return false
end
if text == ("المنشئين") and BasicConstructor(msg) then
local list = database:smembers(bot_id.."Relax:Constructor"..msg.chat_id_)
t = "\n- قائمة المنشئين الحاتين .\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."Relax:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "- ولا منشئ حياتي ."
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("المدراء") and Constructor(msg) then
local list = database:smembers(bot_id.."Relax:Manager"..msg.chat_id_)
t = "\n- قائمة المدراء الحلوين .\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."Relax:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "- ولا منشئ هنا يروحي ."
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("الاجمنية") and Owner(msg) then
local list = database:smembers(bot_id.."Relax:Mod:User"..msg.chat_id_)
t = "\n- قائمة الادمنية الحاتين .\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."Relax:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "- ولا ادمن يحلو ."
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("المميزين") and Addictive(msg) then
local list = database:smembers(bot_id.."Relax:Special:User"..msg.chat_id_)
t = "\n- قائمة الاعضاء المميزين .\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."Relax:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "- مكو اعضاء مميزين حياتي ."
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("المكتومين") and Addictive(msg) then
local list = database:smembers(bot_id.."Relax:Muted:User"..msg.chat_id_)
t = "\n- قائمة المكتومين .\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."Relax:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "- ولا واحد مكتوم قلبي ."
end
send(msg.chat_id_, msg.id_, t)
end

if text == ("المحظورين") and Addictive(msg) then
local list = database:smembers(bot_id.."Relax:Ban:User"..msg.chat_id_)
t = "\n- قائمة المحظورين .\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."Relax:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "- محد محظور يحلو ."
end
send(msg.chat_id_, msg.id_, t)
end

if text == ("حظر عام") and tonumber(msg.reply_to_message_id_) ~= 0 and DevRelax(msg) then
function Function_Relax(extra, result, success)
if result.sender_user_id_ == tonumber(SUDO) then
send(msg.chat_id_, msg.id_, "- متكدر تحظر المطور الاساسي يحلو .\n")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, "- متكدر تحظر البوت عمري .")
return false 
end
database:sadd(bot_id.."Relax:GBan:User", result.sender_user_id_)
Kick_Group(result.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","- تم حظره عام عمري .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Relax, nil)
return false
end
if text and text:match("^حظر عام @(.*)$")  and DevRelax(msg) then
local username = text:match("^حظر عام @(.*)$") 
function Function_Relax(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"- هذا معرف قناة حياتي .")   
return false 
end      
if tonumber(result.id_) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, "- متكدر تحظر البوت قلبي .")
return false 
end
if result.id_ == tonumber(SUDO) then
send(msg.chat_id_, msg.id_, "- متكدر تحظر المطور الاساسي يقلبي انت .\n")
return false 
end
database:sadd(bot_id.."Relax:GBan:User", result.id_)
Reply_Status(msg,result.id_,"reply","- تم حظره عام عمري .")  
else
send(msg.chat_id_, msg.id_,"- مكو هيج حساب حبيبي .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Relax, nil)
return false
end
if text and text:match("^حظر عام (%d+)$") and DevRelax(msg) then
local userid = text:match("^حظر عام (%d+)$")
if userid == tonumber(SUDO) then
send(msg.chat_id_, msg.id_, "- متكدر تحظر المطور الاساسي يحلو .\n")
return false 
end
if tonumber(userid) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, "- متكدر تحظر البوت حياتي .")
return false 
end
database:sadd(bot_id.."Relax:GBan:User", userid)
Reply_Status(msg,userid,"reply","- تم حظره عام عمري .")  
return false
end
if text == ("الغاء العام") and tonumber(msg.reply_to_message_id_) ~= 0 and DevRelax(msg) then
function Function_Relax(extra, result, success)
database:srem(bot_id.."Relax:GBan:User", result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","- تم الغاء حظره من العام عمري .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Relax, nil)
return false
end
if text and text:match("^الغاء العام @(.*)$") and DevRelax(msg) then
local username = text:match("^الغاء العام @(.*)$") 
function Function_Relax(extra, result, success)
if result.id_ then
Reply_Status(msg,result.id_,"reply","- تم الغاء حظره من العام عمري .")  
database:srem(bot_id.."Relax:GBan:User", result.id_)
else
send(msg.chat_id_, msg.id_,"- مكو هيج حساب حبيبي .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Relax, nil)
return false
end
if text and text:match("^الغاء العام (%d+)$") and DevRelax(msg) then
local userid = text:match("^الغاء العام (%d+)$")
database:srem(bot_id.."Relax:GBan:User", userid)
Reply_Status(msg,userid,"reply","- تم الغاء حظره من العام عمري .")  
return false
end

if text == ("اضف مطور") and tonumber(msg.reply_to_message_id_) ~= 0 and DevRelax(msg) then
function Function_Relax(extra, result, success)
database:sadd(bot_id.."Relax:Sudo:User", result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","- تم اضافته الى المطورين الحلوين .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Relax, nil)
return false 
end
if text and text:match("^اضف مطور @(.*)$") and DevRelax(msg) then
local username = text:match("^اضف مطور @(.*)$")
function Function_Relax(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"- هذا معرف قناة يحلو .")   
return false 
end      
database:sadd(bot_id.."Relax:Sudo:User", result.id_)
Reply_Status(msg,result.id_,"reply","- تم اضافته الى المطورين الحلوين .")  
else
send(msg.chat_id_, msg.id_,"- مكو هيج معرف حبيبي .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Relax, nil)
return false 
end
if text and text:match("^اضف مطور (%d+)$") and DevRelax(msg) then
local userid = text:match("^اضف مطور (%d+)$")
database:sadd(bot_id.."Relax:Sudo:User", userid)
Reply_Status(msg,userid,"reply","- تم اضافته الى المطورين الحلوين .")  
return false 
end
if text == ("حذف مطور") and tonumber(msg.reply_to_message_id_) ~= 0 and DevRelax(msg) then
function Function_Relax(extra, result, success)
database:srem(bot_id.."Relax:Sudo:User", result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","- تم حذفه من المطورين عمري .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Relax, nil)
return false 
end
if text and text:match("^حذف مطور @(.*)$") and DevRelax(msg) then
local username = text:match("^حذف مطور @(.*)$")
function Function_Relax(extra, result, success)
if result.id_ then
database:srem(bot_id.."Relax:Sudo:User", result.id_)
Reply_Status(msg,result.id_,"reply","- تم حذفه من المطورين عمري .")  
else
send(msg.chat_id_, msg.id_,"- مكو هيج معرف حبيبي .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Relax, nil)
return false
end  
if text and text:match("^حذف مطور (%d+)$") and DevRelax(msg) then
local userid = text:match("^حذف مطور (%d+)$")
database:srem(bot_id.."Relax:Sudo:User", userid)
Reply_Status(msg,userid,"reply","- تم حذفه من المطورين عمري .")  
return false 
end

if text == ("رفع منشئ اساسي") and tonumber(msg.reply_to_message_id_) ~= 0 and DevBot(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end
function Function_Relax(extra, result, success)
database:sadd(bot_id.."Relax:Basic:Constructor"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","- تم رفعه منشئ اساسي عمري .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Relax, nil)
return false
end
if text and text:match("^رفع منشئ اساسي @(.*)$") and DevBot(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end
local username = text:match("^رفع منشئ اساسي @(.*)$")
function Function_Relax(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"- معرف قناة هذا حبيبي .")   
return false 
end      
database:sadd(bot_id.."Relax:Basic:Constructor"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","- تم رفعه منشئ اساسي عمري .")  
else
send(msg.chat_id_, msg.id_,"- مكو هيج معرف يحلو .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Relax, nil)
return false
end
if text and text:match("^رفع منشئ اساسي (%d+)$") and DevBot(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end
local userid = text:match("^رفع منشئ اساسي (%d+)$") 
database:sadd(bot_id.."Relax:Basic:Constructor"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","- تم رفعه منشئ اساسي عمري .")  
return false
end
if text == ("تنزيل منشئ اساسي") and tonumber(msg.reply_to_message_id_) ~= 0 and DevBot(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end
function Function_Relax(extra, result, success)
database:srem(bot_id.."Relax:Basic:Constructor"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","- تم تنزيله من المنشئين الاساسيين يقلبي .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Relax, nil)
return false
end
if text and text:match("^تنزيل منشئ اساسي @(.*)$") and DevBot(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end
local username = text:match("^تنزيل منشئ اساسي @(.*)$")
function Function_Relax(extra, result, success)
if result.id_ then
database:srem(bot_id.."Relax:Basic:Constructor"..msg.chat_id_, result.id_)

Reply_Status(msg,result.id_,"reply","- تم تنزيله من المنشئين الاساسيين يحلو .")  
else
send(msg.chat_id_, msg.id_,"- مكو هيج معرف عمري .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Relax, nil)
return false
end
if text and text:match("^تنزيل منشئ اساسي (%d+)$") and DevBot(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end
local userid = text:match("^تنزيل منشئ اساسي (%d+)$") 
database:srem(bot_id.."Relax:Basic:Constructor"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","- تم تنزيله من المنشين الاساسيين حياتي .")  
return false
end

if text == "رفع منشئ" and tonumber(msg.reply_to_message_id_) ~= 0 and BasicConstructor(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end
function Function_Relax(extra, result, success)
database:sadd(bot_id.."Relax:Constructor"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","- تم رفعه منشئ يروحي .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Relax, nil)
end
if text and text:match("^رفع منشئ @(.*)$") and BasicConstructor(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end
local username = text:match("^رفع منشئ @(.*)$")
function Function_Relax(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"- معرف قناة هذا عمري .")   
return false 
end      
database:sadd(bot_id.."Relax:Constructor"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","- تم رفعه منشئ حياتي .")  
else
send(msg.chat_id_, msg.id_,"- مكو هيج معرف يحلو .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Relax, nil)
end
------------------------------------------------------------------------
if text and text:match("^رفع منشئ (%d+)$") and BasicConstructor(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end
local userid = text:match("^رفع منشئ (%d+)$")
database:sadd(bot_id.."Relax:Constructor"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","- تم رفعه منشئ عمري .")  
end
if text and text:match("^تنزيل منشئ$") and tonumber(msg.reply_to_message_id_) ~= 0 and BasicConstructor(msg) then
function Function_Relax(extra, result, success)
database:srem(bot_id.."Relax:Constructor"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","- تم تنزيله من المنشئين قلبي .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Relax, nil)
end
------------------------------------------------------------------------
if text and text:match("^تنزيل منشئ @(.*)$") and BasicConstructor(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end
local username = text:match("^تنزيل منشئ @(.*)$")
function Function_Relax(extra, result, success)
if result.id_ then
database:srem(bot_id.."Relax:Constructor"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","- تم تنزيله من المنشئين حبيبي .")  
else
send(msg.chat_id_, msg.id_,"- مكو هيج معرف حبيب .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Relax, nil)
end
------------------------------------------------------------------------
if text and text:match("^تنزيل منشئ (%d+)$") and BasicConstructor(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end
local userid = text:match("^تنزيل منشئ (%d+)$")
database:srem(bot_id.."Relax:Constructor"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","- تم تنزيله من المنشئين حياتي .")  
end

if text == ("رفع مدير") and tonumber(msg.reply_to_message_id_) ~= 0 and Constructor(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end
function Function_Relax(extra, result, success)
database:sadd(bot_id.."Relax:Manager"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","- تم رفعه مدير حبي .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Relax, nil)
return false
end  
if text and text:match("^رفع مدير @(.*)$") and Constructor(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end
local username = text:match("^رفع مدير @(.*)$") 
function Function_Relax(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"- هذا معرف قناة يحلو .")   
return false 
end      
database:sadd(bot_id.."Relax:Manager"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","- تم رفعته مدير عمري الحلو .")  
else
send(msg.chat_id_, msg.id_,"- مكو هيج معرف حبيبي .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Relax, nil)
return false
end 

if text and text:match("^رفع مدير (%d+)$") and Constructor(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end
local userid = text:match("^رفع مدير (%d+)$") 
database:sadd(bot_id.."Relax:Manager"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","- تم رفعه مدير عمري .")  
return false
end  
if text == ("تنزيل مدير") and tonumber(msg.reply_to_message_id_) ~= 0 and Constructor(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end
function Function_Relax(extra, result, success)
database:srem(bot_id.."Relax:Manager"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","- تم تنزيله من المدراء يحلو .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Relax, nil)
return false
end  
if text and text:match("^تنزيل مدير @(.*)$") and Constructor(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end
local username = text:match("^تنزيل مدير @(.*)$")
function Function_Relax(extra, result, success)
if result.id_ then
database:srem(bot_id.."Relax:Manager"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","- تم تنزيله من المدراء حياتي .")  
else
send(msg.chat_id_, msg.id_,"- مكو هيج معرف حياتي .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Relax, nil)
return false
end  
if text and text:match("^تنزيل مدير (%d+)$") and Constructor(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end
local userid = text:match("^تنزيل مدير (%d+)$") 
database:srem(bot_id.."Relax:Manager"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","- تم تنزيله من المدراء حياتي .")  
return false
end

if text == ("رفع ادمن") and tonumber(msg.reply_to_message_id_) ~= 0 and Owner(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'- المنشئين معطلين الرفع يحلو .')
return false
end
function Function_Relax(extra, result, success)
database:sadd(bot_id.."Relax:Mod:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","- تم رفعه ادمن عمري .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Relax, nil)
return false
end
if text and text:match("^رفع ادمن @(.*)$") and Owner(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end
local username = text:match("^رفع ادمن @(.*)$")
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'- المنشئين معطلين الرفع عمري الحلو .')
return false
end
function Function_Relax(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"- هذا معرف قناة حياتي .")   
return false 
end      
database:sadd(bot_id.."Relax:Mod:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","- تم رفعه ادمن حياتي .")  
else
send(msg.chat_id_, msg.id_,"- مكو هيج حساب قلبي .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Relax, nil)
return false
end
if text and text:match("^رفع ادمن (%d+)$") and Owner(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end
local userid = text:match("^رفع ادمن (%d+)$")
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'- المنشئين معطلين الرفع عمري انت .')
return false
end
database:sadd(bot_id.."Relax:Mod:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","- تم رفعه ادمن يقلبي .")  
return false
end
if text == ("تنزيل ادمن") and tonumber(msg.reply_to_message_id_) ~= 0 and Owner(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end
function Function_Relax(extra, result, success)
database:srem(bot_id.."Relax:Mod:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","- تم تنزيله من الادمنية عمري .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Relax, nil)
return false
end
if text and text:match("^تنزيل ادمن @(.*)$") and Owner(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end
local username = text:match("^تنزيل ادمن @(.*)$") 
function Function_Relax(extra, result, success)
if result.id_ then
database:srem(bot_id.."Relax:Mod:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","- تم تنزيله من الادمنية حياتي .")  
else
send(msg.chat_id_, msg.id_,"- مكو هيج معرف عمري .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Relax, nil)
return false
end
if text and text:match("^تنزيل ادمن (%d+)$") and Owner(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end
local userid = text:match("^تنزيل ادمن (%d+)$")
database:srem(bot_id.."Relax:Mod:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","- تم تنزيله من الادمنية يحلو .")  
return false
end

if text == ("رفع مميز") and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'- المنشئين معطلين الرفع حياتي .')
return false
end
function Function_Relax(extra, result, success)
database:sadd(bot_id.."Relax:Special:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","- تم رفعه عضوو مميز محتحت .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Relax, nil)
return false
end
if text and text:match("^رفع مميز @(.*)$") and Addictive(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end
local username = text:match("^رفع مميز @(.*)$") 
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'- الرفع معطل من المنشئين يحلو انت .')
return false
end
function Function_Relax(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"- هذا معرف قناة قلبي .")   
return false 
end      
database:sadd(bot_id.."Relax:Special:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","- تم رفعه عضو مميز محتحت .")  
else
send(msg.chat_id_, msg.id_,"- مكو هيج معرف يحلو .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Relax, nil)
return false
end

if text and text:match("^رفع مميز (%d+)$") and Addictive(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end
local userid = text:match("^رفع مميز (%d+)$")
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'- الرفع معطل من المنشئين كلبي .')
return false
end
database:sadd(bot_id.."Relax:Special:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","- تم رفعه عضو مميز محتحت .")  
return false
end

if (text == ("تنزيل مميز")) and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end
function Function_Relax(extra, result, success)
database:srem(bot_id.."Relax:Special:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","- تم تنزيله من المميزين حياتي .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Relax, nil)
return false
end
if text and text:match("^تنزيل مميز @(.*)$") and Addictive(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end
local username = text:match("^تنزيل مميز @(.*)$") 
function Function_Relax(extra, result, success)
if result.id_ then
database:srem(bot_id.."Relax:Special:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","- تم تنزيله من المميزين قلبي .")  
else
send(msg.chat_id_, msg.id_,"- مكو هيج حساب عمري .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Relax, nil)
return false
end
if text and text:match("^تنزيل مميز (%d+)$") and Addictive(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end
local userid = text:match("^تنزيل مميز (%d+)$") 
database:srem(bot_id.."Relax:Special:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","- تم تنزيله من المميزين عمري .")  
return false
end  
if text and text:match("رفع (.*)") and tonumber(msg.reply_to_message_id_) > 0 and Addictive(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end 
local RTPA = text:match("رفع (.*)")
if database:sismember(bot_id.."Relax:Coomds"..msg.chat_id_,RTPA) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local Relaxrt = database:get(bot_id.."Relax:Comd:New:rt:bot:"..RTPA..msg.chat_id_)
if Relaxrt == "مميز" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"\n- الحات » ["..data.first_name_.."](t.me/"..(data.username_ or "aaaZaa")..")".."\n- تم رفعه "..RTPA.." يحلو\n")   
database:set(bot_id.."Relax:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,RTPA) 
database:sadd(bot_id.."Relax:Special:User"..msg.chat_id_,result.sender_user_id_)  
elseif Relaxrt == "ادمن" and Owner(msg) then 
send(msg.chat_id_, msg.id_,"\n- الحات » ["..data.first_name_.."](t.me/"..(data.username_ or "aaaZaa")..")".."\n- تم رفعه "..RTPA.." يحلو\n")   
database:set(bot_id.."Relax:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,RTPA)
database:sadd(bot_id.."Relax:Mod:User"..msg.chat_id_,result.sender_user_id_)  
elseif Relaxrt == "مدير" and Constructor(msg) then
send(msg.chat_id_, msg.id_,"\n- الحات » ["..data.first_name_.."](t.me/"..(data.username_ or "aaaZaa")..")".."\n- تم رفعه "..RTPA.." يحلو\n")   
database:set(bot_id.."Relax:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,RTPA)  
database:sadd(bot_id.."Relax:Manager"..msg.chat_id_,result.sender_user_id_)  
elseif Relaxrt == "عضو" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"\n- الحات » ["..data.first_name_.."](t.me/"..(data.username_ or "aaaZaa")..")".."\n- تم رفعه "..RTPA.." يحلو\n")   
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("تنزيل (.*)") and tonumber(msg.reply_to_message_id_) > 0 and Addictive(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end 
local RTPA = text:match("تنزيل (.*)")
if database:sismember(bot_id.."Relax:Coomds"..msg.chat_id_,RTPA) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local Relaxrt = database:get(bot_id.."Relax:Comd:New:rt:bot:"..RTPA..msg.chat_id_)
if Relaxrt == "مميز" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"\n- الحات » ["..data.first_name_.."](t.me/"..(data.username_ or "aaaZaa")..")".."\n- تم تنزيله من "..RTPA.." يحلو\n")   
database:srem(bot_id.."Relax:Special:User"..msg.chat_id_,result.sender_user_id_)  
database:del(bot_id.."Relax:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif Relaxrt == "ادمن" and Owner(msg) then 
send(msg.chat_id_, msg.id_,"\n- الحات » ["..data.first_name_.."](t.me/"..(data.username_ or "aaaZaa")..")".."\n- تم تنزيله من "..RTPA.." يحلو\n")   
database:srem(bot_id.."Relax:Mod:User"..msg.chat_id_,result.sender_user_id_) 
database:del(bot_id.."Relax:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif Relaxrt == "مدير" and Constructor(msg) then
send(msg.chat_id_, msg.id_,"\n- الحات » ["..data.first_name_.."](t.me/"..(data.username_ or "aaaZaa")..")".."\n- تم تنزيله من "..RTPA.." يحلو\n")   
database:srem(bot_id.."Relax:Manager"..msg.chat_id_,result.sender_user_id_)  
database:del(bot_id.."Relax:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif Relaxrt == "عضو" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"\n- الحات » ["..data.first_name_.."](t.me/"..(data.username_ or "aaaZaa")..")".."\n- تم تنزيله من "..RTPA.." يحلو\n")   
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("^رفع (.*) @(.*)") and Addictive(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end 
local text1 = {string.match(text, "^(رفع) (.*) @(.*)$")}
if database:sismember(bot_id.."Relax:Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local Relaxrt = database:get(bot_id.."Relax:Comd:New:rt:bot:"..text1[2]..msg.chat_id_)
if Relaxrt == "مميز" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"\n- الحات » ["..result.title_.."](t.me/"..(text1[3] or "aaaZaa")..")".."\n- تم رفعه "..text1[2].." يحلو")   
database:sadd(bot_id.."Relax:Special:User"..msg.chat_id_,result.id_)  
database:set(bot_id.."Relax:Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif Relaxrt == "ادمن" and Owner(msg) then 
send(msg.chat_id_, msg.id_,"\n- الحات » ["..result.title_.."](t.me/"..(text1[3] or "aaaZaa")..")".."\n- تم رفعه "..text1[2].." يحلو")   
database:sadd(bot_id.."Relax:Mod:User"..msg.chat_id_,result.id_)  
database:set(bot_id.."Relax:Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif Relaxrt == "مدير" and Constructor(msg) then
send(msg.chat_id_, msg.id_,"\n- الحات » ["..result.title_.."](t.me/"..(text1[3] or "aaaZaa")..")".."\n- تم رفعه "..text1[2].." يحلو")   
database:sadd(bot_id.."Relax:Manager"..msg.chat_id_,result.id_)  
database:set(bot_id.."Relax:Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif Relaxrt == "عضو" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"\n- الحات » ["..result.title_.."](t.me/"..(text1[3] or "aaaZaa")..")".."\n- تم رفعه "..text1[2].." يحلو")   
end
else
info = "- المعرف غلط عمري ."
send(msg.chat_id_, msg.id_,info)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end 
end
if text and text:match("^تنزيل (.*) @(.*)") and Addictive(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end 
local text1 = {string.match(text, "^(تنزيل) (.*) @(.*)$")}
if database:sismember(bot_id.."Relax:Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local Relaxrt = database:get(bot_id.."Relax:Comd:New:rt:bot:"..text1[2]..msg.chat_id_)
if Relaxrt == "مميز" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"\n- الحات » ["..result.title_.."](t.me/"..(text1[3] or "aaaZaa")..")".."\n- تم تنريله من "..text1[2].." يحلو")   
database:srem(bot_id.."Relax:Special:User"..msg.chat_id_,result.id_)  
database:del(bot_id.."Relax:Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif Relaxrt == "ادمن" and Owner(msg) then 
send(msg.chat_id_, msg.id_,"\n- الحات » ["..result.title_.."](t.me/"..(text1[3] or "aaaZaa")..")".."\n- تم تنريله من "..text1[2].." يحلو")   
database:srem(bot_id.."Relax:Mod:User"..msg.chat_id_,result.id_)  
database:del(bot_id.."Relax:Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif Relaxrt == "مدير" and Constructor(msg) then
send(msg.chat_id_, msg.id_,"\n- الحات » ["..result.title_.."](t.me/"..(text1[3] or "aaaZaa")..")".."\n- تم تنريله من "..text1[2].." يحلو")   
database:srem(bot_id.."Relax:Manager"..msg.chat_id_,result.id_)  
database:del(bot_id.."Relax:Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif Relaxrt == "عضو" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"\n- الحات » ["..result.title_.."](t.me/"..(text1[3] or "aaaZaa")..")".."\n- تم تنريله من "..text1[2].." يحلو")   
end
else
info = "- المعرف غلط يحلو ."
send(msg.chat_id_, msg.id_,info)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end  
end

if text == ("حظر") and msg.reply_to_message_id_ ~= 0 and Addictive(msg) then
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'- الحظر معطل من المنشئين عمري .')
return false
end
function Function_Relax(extra, result, success)
if Rank_Checking(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n- عمري متكدر تحظر او تكتم او تقيد  ( "..Get_Rank(result.sender_user_id_,msg.chat_id_).." )")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"- معندي صلاحية الحظر حياتي .") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"- اني مو ادمن يقلبي انت .") 
return false  
end
database:sadd(bot_id.."Relax:Ban:User"..msg.chat_id_, result.sender_user_id_)
Kick_Group(result.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","- تم حظره عمري .")  
end,nil)   
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Relax, nil)
return false
end

if text and text:match("^حظر @(.*)$") and Addictive(msg) then
local username = text:match("^حظر @(.*)$")
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'- الحظر معطل من المنشئين يحلو .')
return false
end
function Function_Relax(extra, result, success)
if result.id_ then
if Rank_Checking(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n- عمري متكدر تحظر او تكتم او تقيد  ( "..Get_Rank(result.id_,msg.chat_id_).." )")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"- هذا معرف قناة يحلو .")   
return false 
end      
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"- معندي صلاحية حظر حياتي .") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"- اني مو ادمن يحلو .") 
return false  
end
database:sadd(bot_id.."Relax:Ban:User"..msg.chat_id_, result.id_)
Kick_Group(msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","- تم حظره عمري .")  
end,nil)   
end
else
send(msg.chat_id_, msg.id_, "- مكو هيج معرف قلبي .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Relax, nil)
return false
end

if text and text:match("^حظر (%d+)$") and Addictive(msg) then
local userid = text:match("^حظر (%d+)$") 
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'- الحظر معطل من المنشئين يقلبي .')
return false
end
if Rank_Checking(userid, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n- حياتي متكدر تحظر او تكتم او تقيد  ( "..Get_Rank(userid,msg.chat_id_).." )")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = userid, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"- معندي صلاحية حظر يحلو .") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"- اني مو ادمن حياتي .") 
return false  
end
database:sadd(bot_id.."Relax:Ban:User"..msg.chat_id_, userid)
Kick_Group(msg.chat_id_, userid)  
Reply_Status(msg,userid,"reply","- تم حظره قلبي .")  
end,nil)   
end
return false
end
if text == ("الغاء حظر") and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then
function Function_Relax(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(bot_id) then
send(msg.chat_id_, msg.id_, "- اني ممحظور يحلو . \n") 
return false 
end
database:srem(bot_id.."Relax:Ban:User"..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
Reply_Status(msg,result.sender_user_id_,"reply","- تم الغاء حظره عمري .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Relax, nil)
return false
end
 
if text and text:match("^الغاء حظر @(.*)$") and Addictive(msg) then
local username = text:match("^الغاء حظر @(.*)$") 
function Function_Relax(extra, result, success)
if result.id_ then
if tonumber(result.id_) == tonumber(bot_id) then
send(msg.chat_id_, msg.id_, "- اني ممحظور يحات . \n") 
return false 
end
database:srem(bot_id.."Relax:Ban:User"..msg.chat_id_, result.id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
Reply_Status(msg,result.id_,"reply","- تم الغاء حظره حبيبي .")  
else
send(msg.chat_id_, msg.id_, "- مكو هيج معرف عمري الحلو .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Relax, nil)
return false
end

if text and text:match("^الغاء حظر (%d+)$") and Addictive(msg) then
local userid = text:match("^الغاء حظر (%d+)$") 
if tonumber(userid) == tonumber(bot_id) then
send(msg.chat_id_, msg.id_, "- اني ممحظور يحلو . \n") 
return false 
end
database:srem(bot_id.."Relax:Ban:User"..msg.chat_id_, userid)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = userid, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
Reply_Status(msg,userid,"reply","- تم الغاء حظره قلبي .")  
return false
end

if text == ("كتم") and msg.reply_to_message_id_ ~= 0 and Addictive(msg) then
function Function_Relax(extra, result, success)
if Rank_Checking(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n- عمري متكدر تكتم او تحظر او تقيد  ( "..Get_Rank(result.sender_user_id_,msg.chat_id_).." )")
return false 
end     
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"- اني مو ادمن يحلو .") 
return false  
end
database:sadd(bot_id.."Relax:Muted:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","- تم كتمه عمري .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Relax, nil)
return false
end
if text and text:match("^كتم @(.*)$") and Addictive(msg) then
local username = text:match("^كتم @(.*)$")
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"- اني مو ادمن قلبي .") 
return false  
end
function Function_Relax(extra, result, success)
if result.id_ then
if Rank_Checking(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n- يحلو متكدر تكتم او تقيد او تحظر  ( "..Get_Rank(result.id_,msg.chat_id_).." )")
return false 
end     
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"- هذا معرف قناة يقلبي .")   
return false 
end      
database:sadd(bot_id.."Relax:Muted:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","- تم كتمه يحلو .")  
else
send(msg.chat_id_, msg.id_, "- مكو هيج معرف حياتي .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Relax, nil)
return false
end
if text and text:match("^كتم (%d+)$") and Addictive(msg) then
local userid = text:match("^كتم (%d+)$")
if Rank_Checking(userid, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n- يحات متكدر تكتم او تقيد او تحظر  ( "..Get_Rank(userid,msg.chat_id_).." )")
else
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"- اني مو ادمن عمري .") 
return false  
end
database:sadd(bot_id.."Relax:Muted:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","- تم كتمه هنا عمري .")  
end
return false
end
if text == ("الغاء كتم") and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then
function Function_Relax(extra, result, success)
database:srem(bot_id.."Relax:Muted:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","- تم الغاء كتمه قلبي .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Relax, nil)
return false
end
if text and text:match("^الغاء كتم @(.*)$") and Addictive(msg) then
local username = text:match("^الغاء كتم @(.*)$")
function Function_Relax(extra, result, success)
if result.id_ then
database:srem(bot_id.."Relax:Muted:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","- تم الغاء كتمه يحلو .")  
else
send(msg.chat_id_, msg.id_,"- مكو هيج معرف حياتي .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Relax, nil)
return false
end

if text and text:match("^الغاء كتم (%d+)$") and Addictive(msg) then
local userid = text:match("^الغاء كتم (%d+)$") 
database:srem(bot_id.."Relax:Muted:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","- تم الغاء كتمه يحات .")  
return false
end

if text == ("تقييد") and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then
function Function_Relax(extra, result, success)
if Rank_Checking(result.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n- يحلو متكدر تقيد او تكتم او تحظر  ( "..Get_Rank(result.sender_user_id_,msg.chat_id_).." )")
else
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","- تم تقييده عمري .")  
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Relax, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^تقييد @(.*)$") and Addictive(msg) then
local username = text:match("^تقييد @(.*)$")
function Function_Relax(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"- هذا معرف قناة يحلو .")   
return false 
end      
if Rank_Checking(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n- حياتي متكدر تقيد او تكتم او تحظر  ( "..Get_Rank(result.id_,msg.chat_id_).." )")
return false 
end      
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_)
Reply_Status(msg,result.id_,"reply","- تم تقييده يحلو .)  
else
send(msg.chat_id_, msg.id_,"- مكو هيج حساب يقلبي .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Relax, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^تقييد (%d+)$") and Addictive(msg) then
local userid = text:match("^تقييد (%d+)$")
if Rank_Checking(userid, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n- عمري متكدر تقيد او تكتم او تحظر  ( "..Get_Rank(userid,msg.chat_id_).." )")
else
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..userid)
Reply_Status(msg,userid,"reply","- تم تقييده عمري .")  
end
return false
end
if text and text:match('^تقيد (%d+) (.*)$') and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then
local TextEnd = {string.match(text, "^(تقيد) (%d+) (.*)$")}
function Function_Relax(extra, result, success)
if TextEnd[3] == 'يوم' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 86400
end
if TextEnd[3] == 'ساعة' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 3600
end
if TextEnd[3] == 'دقيقة' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 60
end
TextEnd[3] = TextEnd[3]:gsub('دقيقة',"دقايق") 
TextEnd[3] = TextEnd[3]:gsub('ساعة',"ساعات") 
TextEnd[3] = TextEnd[3]:gsub("يوم","ايام") 
if Rank_Checking(result.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n- عمري متكدر تحظر او تكتم او تقيد  ( "..Get_Rank(result.sender_user_id_,msg.chat_id_).." )")
else
Reply_Status(msg,result.sender_user_id_,"reply", "☑┇تم تقيده لمدة ~ { "..TextEnd[2]..' '..TextEnd[3]..'}')
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+Time))
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Relax, nil)
return false
end

if text and text:match('^تقييد (%d+) (.*) @(.*)$') and Addictive(msg) then
local TextEnd = {string.match(text, "^(تقيد) (%d+) (.*) @(.*)$")}
function Function_Relax(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"- هذا معرف قناة يحلو .")   
return false 
end      
if TextEnd[3] == 'يوم' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 86400
end
if TextEnd[3] == 'ساعة' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 3600
end
if TextEnd[3] == 'دقيقة' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 60
end
TextEnd[3] = TextEnd[3]:gsub('دقيقة',"دقايق") 
TextEnd[3] = TextEnd[3]:gsub('ساعة',"ساعات") 
TextEnd[3] = TextEnd[3]:gsub("يوم","ايام") 
if Rank_Checking(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n- عمري متكدر تحظر او تكتم او تقيد  ( "..Get_Rank(result.id_,msg.chat_id_).." )")
else
Reply_Status(msg,result.id_,"reply", "- الحلو تم تقييده لمدة - { "..TextEnd[2]..' '..TextEnd[3]..'}')
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_..'&until_date='..tonumber(msg.date_+Time))
end
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = TextEnd[4]}, Function_Relax, nil)
return false
end
------------------------------------------------------------------------
if text == ("الغاء تقييد") and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then
function Function_Relax(extra, result, success)
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.sender_user_id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
Reply_Status(msg,result.sender_user_id_,"reply","- تم الغاء تقييده عمري .")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Relax, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^الغاء تقييد @(.*)$") and Addictive(msg) then
local username = text:match("^الغاء تقييد @(.*)$")
function Function_Relax(extra, result, success)
if result.id_ then
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
Reply_Status(msg,result.id_,"reply","- تم الغاء تقييده حياتي .")  
else
send(msg.chat_id_, msg.id_, "- مكو هيج معرف يحلو .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Relax, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^الغاء تقييد (%d+)$") and Addictive(msg) then
local userid = text:match("^الغاء تقييد (%d+)$")
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..userid.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
Reply_Status(msg,userid,"reply","- تم الغاء تقييده عمري .")  
return false
end
if text == ("طرد") and msg.reply_to_message_id_ ~=0 and Addictive(msg) then
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'- الطرد معطل من المنشئين يحلو .')
return false
end
function Function_Relax(extra, result, success)
if Rank_Checking(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n- عمري متكدر تطرد  ( "..Get_Rank(result.sender_user_id_,msg.chat_id_).." )")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"- معندي صلاحية طرد او حظر يحلو .") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"- اني مو ادمن يقلبي .") 
return false  
end
Kick_Group(result.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","- تم طرده منا عمري .")  
end,nil)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Relax, nil)
return false
end  
if text and text:match("^طرد @(.*)$") and Addictive(msg) then 
local username = text:match("^طرد @(.*)$")
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'- الطرد معطل من المنشئين حياتي .')
return false
end
function Function_Relax(extra, result, success)
if result.id_ then
if Rank_Checking(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n- يقلبي متكدر تطرد  ( "..Get_Rank(result.id_,msg.chat_id_).." )")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"- هذا معرف قناة يحلو .")   
return false 
end      
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"- معندي صلاحية طرد او حظر عمري .") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"- اني مو ادمن حياتي .") 
return false  
end
Kick_Group(msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","- تم طرده عمري .")  
end,nil)   
end
else
send(msg.chat_id_, msg.id_, "- مكو هيج معرف عمري .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Relax, nil)
return false
end  

if text and text:match("^طرد (%d+)$") and Addictive(msg) then 
local userid = text:match("^طرد (%d+)$") 
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'- الطرد معطل من المنشئين حياتي .')
return false
end
if Rank_Checking(userid, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n- عمري متكدر تطرد  ( "..Get_Rank(userid,msg.chat_id_).." )")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = userid, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"- معندي صلاحية طرد او حظر يحلو .") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"- اني مو ادمن حياتي .") 
return false  
end
Kick_Group(msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","- تم طرده يحات .")  
end,nil)   
end
return false
end

if text == "تعطيل الطرد" or text == "تعطيل الحظر" then
if Constructor(msg) then
database:set(bot_id.."Ban:Cheking"..msg.chat_id_,"true")
send(msg.chat_id_, msg.id_, '- تم تعطيل الحظر + الطرد .')
return false
end
end
if text == "تفعيل الطرد" or text == "تفعيل الحظر" then
if Constructor(msg) then
database:del(bot_id.."Ban:Cheking"..msg.chat_id_)
send(msg.chat_id_, msg.id_, '- تم تفعيل الحظر + الطرد .')
return false
end
end
if text == "تعطيل الرفع" or text == "تعطيل الترقيه" then
if Constructor(msg) then
database:set(bot_id.."Add:Group:Cheking"..msg.chat_id_,"true")
send(msg.chat_id_, msg.id_, '- تم تعطيل رفع الادمنية + المميزين .')
return false
end
end
if text == "تفعيل الرفع" or text == "تفعيل الترقيه" then
if Constructor(msg) then
database:del(bot_id.."Add:Group:Cheking"..msg.chat_id_)
send(msg.chat_id_, msg.id_, '- تم تفعيل رفع الادمنية + المميزين .')
return false
end
end
if text ==("تثبيت") and msg.reply_to_message_id_ ~= 0 and Addictive(msg) then  
if database:sismember(bot_id.."Relax:Lock:pin",msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_,msg.id_,"- التثبيت + الغاء التثبيت معطل من المنشئين عمري .")  
return false  
end
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100",""),message_id_ = msg.reply_to_message_id_,disable_notification_ = 1},function(arg,data) 
if data.ID == "Ok" then
send(msg.chat_id_, msg.id_,"- تم تثبيت الرسالة عمري .")   
database:set(bot_id.."Relax:Pin:Id:Msg"..msg.chat_id_,msg.reply_to_message_id_)
elseif data.code_ == 6 then
send(msg.chat_id_,msg.id_,"- اني مو ادمن يحلو .")  
elseif data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"- معندي صلاحية تثبيت يقلبي .")  
end
end,nil) 
end
if text == "الغاء التثبيت" and Addictive(msg) then  
if database:sismember(bot_id.."Relax:Lock:pin",msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_,msg.id_,"- الغاء التثبيت + التثبيت معطل من المنشئين حياتي .")  
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
send(msg.chat_id_, msg.id_,"- تم الغاء تثبيت الرسالة يحلو .")   
database:del(bot_id.."Relax:Pin:Id:Msg"..msg.chat_id_)
elseif data.code_ == 6 then
send(msg.chat_id_,msg.id_,"- اني مو ادمن قلبي .")  
elseif data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"- معندي صلاحية تثبيت يحات .")  
end
end,nil)
end

if text and text:match("^وضع تكرار (%d+)$") and Addictive(msg) then   
local Num = text:match("وضع تكرار (.*)")
database:hset(bot_id.."Relax:flooding:settings:"..msg.chat_id_ ,"floodmax" ,Num) 
send(msg.chat_id_, msg.id_,"- تم وضع عدد التكرار - ("..Num..")")  
end 
if text and text:match("^وضع زمن التكرار (%d+)$") and Addictive(msg) then   
local Num = text:match("^وضع زمن التكرار (%d+)$")
database:hset(bot_id.."Relax:flooding:settings:"..msg.chat_id_ ,"floodtime" ,Num) 
send(msg.chat_id_, msg.id_,"- تم وضع زمن التكرار - ("..Num..")") 
end
if text == "ضع رابط" or text == "وضع رابط" then
if msg.reply_to_message_id_ == 0  and Addictive(msg) then  
send(msg.chat_id_,msg.id_,"- ارسل رابط الكروب عمري .")
database:setex(bot_id.."Relax:Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_,120,true) 
return false
end
end
if text == "تفعيل جلب الرابط" or text == 'تفعيل الرابط' then
if Addictive(msg) then  
database:set(bot_id.."Relax:Link_Group"..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,"- تم تفعيل جلب الرابط يحلو .") 
return false  
end
end
if text == "تعطيل جلب الرابط" or text == 'تعطيل الرابط' then
if Addictive(msg) then  
database:del(bot_id.."Relax:Link_Group"..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"- تم تعطيل جلب الرابط حياتي .") 
return false end
end
if text == "الرابط" then 
local status_Link = database:get(bot_id.."Relax:Link_Group"..msg.chat_id_)
if not status_Link then
send(msg.chat_id_, msg.id_,"- جلب الرابط معطل يحلو .") 
return false  
end
local link = database:get(bot_id.."Relax:Private:Group:Link"..msg.chat_id_)            
if link then                              
send(msg.chat_id_,msg.id_,"- رابط الكروب .\n ["..link.."]")                          
else                
send(msg.chat_id_, msg.id_,"- مكو رابط عمري ارسل *ضع رابط* .")              
end            
end
if text == "مسح الرابط" or text == "حذف الرابط" then
if Addictive(msg) then     
send(msg.chat_id_,msg.id_,"- تم مسح الرابط يحلو .")           
database:del(bot_id.."Relax:Private:Group:Link"..msg.chat_id_) 
return false      
end
return false  
end
if text and text:match("^ضع صورة") and Addictive(msg) and msg.reply_to_message_id_ == 0 or text and text:match("^وضع صورة") and Addictive(msg) and msg.reply_to_message_id_ == 0 then  
database:set(bot_id.."Relax:Change:Chat:Photo"..msg.chat_id_..":"..msg.sender_user_id_,true) 
send(msg.chat_id_, msg.id_,"- دز الصورة يحلو .") 
return false
end
if text == "حذف الصورة" or text == "مسح الصورة" then 
if Addictive(msg) then
https.request("https://api.telegram.org/bot"..token.."/deleteChatPhoto?chat_id="..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"- تم حذف صورة الكروب عمري .") 
end
return false  
end
if text == "ضع وصف" or text == "وضع وصف" then  
if Addictive(msg) then
database:setex(bot_id.."Relax:Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
send(msg.chat_id_, msg.id_,"- دز الوصف يحلو .")
end
return false  
end
if text == "ضع ترحيب" or text == "وضع ترحيب" then  
if Addictive(msg) then
database:setex(bot_id.."Relax:Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
t  = "- دز الترحيب عمري ."
tt = "\n- تكدر تضيف ذني وي الترحيب .\n- الاسم »{`name`}\n- المعرف »{`user`}"
send(msg.chat_id_, msg.id_,t..tt) 
end
return false  
end
if text == "الترحيب" and Addictive(msg) then 
if database:get(bot_id.."Relax:Get:Welcome:Group"..msg.chat_id_)   then 
Welcome = database:get(bot_id.."Relax:Get:Welcome:Group"..msg.chat_id_)  
else 
Welcome = "- ممخلين ترحيب يحلو دز *ضع ترحيب* ."
end 
send(msg.chat_id_, msg.id_,"["..Welcome.."]") 
return false  
end
if text == "تفعيل الترحيب" and Addictive(msg) then  
database:set(bot_id.."Relax:Chek:Welcome"..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,"- تم تفعيل الترحيب حياتي .") 
return false  
end
if text == "تعطيل الترحيب" and Addictive(msg) then  
database:del(bot_id.."Relax:Chek:Welcome"..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"- تم تعطيل الترحيب يحلو .") 
return false  
end
if text == "مسح الترحيب" or text == "حذف الترحيب" then 
if Addictive(msg) then
database:del(bot_id.."Relax:Get:Welcome:Group"..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"- تم حذف الترحيب يقلبي .") 
end
return false  
end

if text == "مسح قائمة المنع" and Addictive(msg) then   
local list = database:smembers(bot_id.."Relax:List:Filter"..msg.chat_id_)  
for k,v in pairs(list) do  
database:del(bot_id.."Relax:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
database:del(bot_id.."Relax:Add:Filter:Rp2"..v..msg.chat_id_)  
database:srem(bot_id.."Relax:List:Filter"..msg.chat_id_,v)  
end  
send(msg.chat_id_, msg.id_,"- تم مسح قائمة المنع حياتي .")  
end

if text == "قائمة المنع" and Addictive(msg) then   
local list = database:smembers(bot_id.."Relax:List:Filter"..msg.chat_id_)  
t = "\n- قائمة المنع .\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do  
local Relax_Msg = database:get(bot_id.."Relax:Add:Filter:Rp2"..v..msg.chat_id_)   
t = t..""..k.."- "..v.." » {"..Relax_Msg.."}\n"    
end  
if #list == 0 then  
t = "- مكو كلمة ممنوعة عمري ."  
end  
send(msg.chat_id_, msg.id_,t)  
end  
if text and text == "منع" and msg.reply_to_message_id_ == 0 and Addictive(msg) then       
send(msg.chat_id_, msg.id_,"- دز الكلمة الي تريد تمنعها يحلو .")  
database:set(bot_id.."Relax:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_,"rep")  
return false  
end    
if text then   
local tsssst = database:get(bot_id.."Relax:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if tsssst == "rep" then   
send(msg.chat_id_, msg.id_,"- دز التحذير تبع المنع يحلو .")  
database:set(bot_id.."Relax:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_,"repp")  
database:set(bot_id.."Relax:filtr1:add:reply2"..msg.sender_user_id_..msg.chat_id_, text)  
database:sadd(bot_id.."Relax:List:Filter"..msg.chat_id_,text)  
return false  end  
end
if text then  
local test = database:get(bot_id.."Relax:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if test == "repp" then  
send(msg.chat_id_, msg.id_,"- تم منع الكلمة مع التحذير .")  
database:del(bot_id.."Relax:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
local test = database:get(bot_id.."Relax:filtr1:add:reply2"..msg.sender_user_id_..msg.chat_id_)  
if text then   
database:set(bot_id.."Relax:Add:Filter:Rp2"..test..msg.chat_id_, text)  
end  
database:del(bot_id.."Relax:filtr1:add:reply2"..msg.sender_user_id_..msg.chat_id_)  
return false  end  
end

if text == "الغاء منع" and msg.reply_to_message_id_ == 0 and Addictive(msg) then    
send(msg.chat_id_, msg.id_,"- دز الكلمة حياتي .")  
database:set(bot_id.."Relax:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_,"reppp")  
return false  end
if text then 
local test = database:get(bot_id.."Relax:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if test and test == "reppp" then   
send(msg.chat_id_, msg.id_,"- تم الغاء منع الكلمة عمري .")  
database:del(bot_id.."Relax:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
database:del(bot_id.."Relax:Add:Filter:Rp2"..text..msg.chat_id_)  
database:srem(bot_id.."Relax:List:Filter"..msg.chat_id_,text)  
return false  end  
end

if text == "مسح البوتات" and Addictive(msg) then 
tdcli_function ({ ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah)  
local admins = tah.members_  
local x = 0
local c = 0
for i=0 , #admins do 
if tah.members_[i].status_.ID == "ChatMemberStatusEditor" then  
x = x + 1 
end
if tonumber(admins[i].user_id_) ~= tonumber(bot_id) then
Kick_Group(msg.chat_id_,admins[i].user_id_)
end
c = c + 1
end     
if (c - x) == 0 then
send(msg.chat_id_, msg.id_, "- مكو بوتات هنا حياتي .")
else
local t = "- عدد البوتات => {"..c.."}\n- عدد البوتات المرفوعة => {"..x.."}\n- البوتات الي نطردت => {"..(c - x).."} من مجموع البوتات ."
send(msg.chat_id_, msg.id_,t) 
end 
end,nil)  
end   
if text == ("كشف البوتات") and Addictive(msg) then  
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(extra,result,success)
local admins = result.members_  
text = "\n- قائمة البوتات . \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
local n = 0
local t = 0
for i=0 , #admins do 
n = (n + 1)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_
},function(arg,ta) 
if result.members_[i].status_.ID == "ChatMemberStatusMember" then  
tr = ""
elseif result.members_[i].status_.ID == "ChatMemberStatusEditor" then  
t = t + 1
tr = " {✯}"
end
text = text..">> [@"..ta.username_.."]"..tr.."\n"
if #admins == 0 then
send(msg.chat_id_, msg.id_, "- مكو بوتات هنا يحلو .")
return false 
end
if #admins == i then 
local a = "\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n- عدد كل البوتات => {"..n.."} بوت .\n"
local f = "- عدد البوتات المرفوعة => {"..t.."}\n- ملاحضه علامة ال (✯) تعني ان البوت ادمن \n"
send(msg.chat_id_, msg.id_, text..a..f)
end
end,nil)
end
end,nil)
end

if database:get(bot_id.."Relax:Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" then 
send(msg.chat_id_, msg.id_, "- تم الغاء حفظ القوانين عمري .") 
database:del(bot_id.."Relax:Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
return false  
end 
database:set(bot_id.."Relax:Set:Rules:Group" .. msg.chat_id_,text) 
send(msg.chat_id_, msg.id_,"- تم حفظ قوانين الكروب يحلو .") 
database:del(bot_id.."Relax:Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
end  

if text == "ضع قوانين" or text == "وضع قوانين" then 
if Addictive(msg) then
database:setex(bot_id.."Relax:Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_,msg.id_,"- دز قوانينك حياتي .")  
end
end
if text == "مسح القوانين" or text == "حذف القوانين" then  
if Addictive(msg) then
send(msg.chat_id_, msg.id_,"- تم مسح القوانين قلبي .")  
database:del(bot_id.."Relax:Set:Rules:Group"..msg.chat_id_) 
end
end
if text == "القوانين" then 
local Set_Rules = database:get(bot_id.."Relax:Set:Rules:Group" .. msg.chat_id_)   
if Set_Rules then     
send(msg.chat_id_,msg.id_, Set_Rules)   
else      
send(msg.chat_id_, msg.id_,"- مكو قوانين هنا حياتي .")   
end    
end

if text == "الاوامر المضافة" and Constructor(msg) then
local list = database:smembers(bot_id.."Relax:List:Cmd:Group:New"..msg.chat_id_.."")
t = "- قائمة الاوامر المضافة .\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
Cmds = database:get(bot_id.."Relax:Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
if Cmds then 
t = t..""..k.."- ("..v..") ~ {"..Cmds.."}\n"
else
t = t..""..k.."- ("..v..") \n"
end
end
if #list == 0 then
t = "- مكو اوامر اضافية حياتي ."
end
send(msg.chat_id_, msg.id_,"["..t.."]")
end
if text == "حذف الاوامر المضافه" or text == "مسح الاوامر المضافه" then
if Constructor(msg) then 
local list = database:smembers(bot_id.."Relax:List:Cmd:Group:New"..msg.chat_id_)
for k,v in pairs(list) do
database:del(bot_id.."Relax:Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
database:del(bot_id.."Relax:List:Cmd:Group:New"..msg.chat_id_)
end
send(msg.chat_id_, msg.id_,"- تم مسح كل الاوامر الي ضايفينها عمري .")  
end
end
if text == "اضف امر" and Constructor(msg) then
database:set(bot_id.."Relax:Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
send(msg.chat_id_, msg.id_,"- دز الامر الاصلي عمري .")  
return false
end
if text == "حذف امر" or text == "مسح امر" then 
if Constructor(msg) then
database:set(bot_id.."Relax:Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
send(msg.chat_id_, msg.id_,"- دز الامر الي مخلي بدل الامر الاصلي عمري .")  
return false
end
end

if text == "الصلاحيات" and Addictive(msg) then 
local list = database:smembers(bot_id.."Relax:Coomds"..msg.chat_id_)
if #list == 0 then
send(msg.chat_id_, msg.id_,"- مكو صلاحيات عمري .")
return false
end
t = "\n- قائمة الصلاحيات .\n━━━━━━━━━━━━━\n"
for k,v in pairs(list) do
var = database:get(bot_id.."Relax:Comd:New:rt:bot:"..v..msg.chat_id_)
if var then
t = t..""..k.."- "..v.." ~ ("..var..")\n"
else
t = t..""..k.."- "..v.."\n"
end
end
send(msg.chat_id_, msg.id_,t)
end
if text == "مسح الصلاحيات" then
local list = database:smembers(bot_id.."Relax:Coomds"..msg.chat_id_)
for k,v in pairs(list) do
database:del(bot_id.."Relax:Comd:New:rt:bot:"..v..msg.chat_id_)
database:del(bot_id.."Relax:Coomds"..msg.chat_id_)
end
send(msg.chat_id_, msg.id_,"- تم مسح كل الصلاحيات يحلو .")
end
if text and text:match("^اضف صلاحية (.*)$") and Addictive(msg) then 
ComdNew = text:match("^اضف صلاحية (.*)$")
database:set(bot_id.."Relax:Comd:New:rt"..msg.chat_id_..msg.sender_user_id_,ComdNew)  
database:sadd(bot_id.."Relax:Coomds"..msg.chat_id_,ComdNew)  
database:setex(bot_id.."Relax:Comd:New"..msg.chat_id_..""..msg.sender_user_id_,200,true)  
send(msg.chat_id_, msg.id_, "- طيب عمري دز نوع الصلاحية .\n- (عضو ~ مميز  ~ ادمن ~ مدير )") 
end
if text and text:match("^مسح صلاحية (.*)$") and Addictive(msg) or text and text:match("^حذف صلاحية (.*)$") and Addictive(msg) then 
ComdNew = text:match("^مسح صلاحية (.*)$") or text:match("^حذف صلاحية (.*)$")
database:del(bot_id.."Relax:Comd:New:rt:bot:"..ComdNew..msg.chat_id_)
send(msg.chat_id_, msg.id_, "- تم مسح الصلاحية عمري .") 
end
if database:get(bot_id.."Relax:Comd:New"..msg.chat_id_..""..msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_,"- تم الغاء الامر يحلو .") 
database:del(bot_id.."Relax:Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
if text == "مدير" then
if not Constructor(msg) then
send(msg.chat_id_, msg.id_"- عمري متكدر تخلي بس الصلاحيات الي مذكورات .\n- (عضو ~ مميز  ~ ادمن )") 
return false
end
end
if text == "ادمن" then
if not Owner(msg) then 
send(msg.chat_id_, msg.id_"- عمري متكدر تخلي بس الصلاحيات الي مذكورات .\n- ( عضو ~ مميز )") 
return false
end
end
if text == "مميز" then
if not Addictive(msg) then
send(msg.chat_id_, msg.id_"- عمري متكدر تخلي بس الصلاحيات الي مذكورات .\n- ( عضو )") 
return false
end
end
if text == "مدير" or text == "ادمن" or text == "مميز" or text == "عضو" then
local textn = database:get(bot_id.."Relax:Comd:New:rt"..msg.chat_id_..msg.sender_user_id_)  
database:set(bot_id.."Relax:Comd:New:rt:bot:"..textn..msg.chat_id_,text)
send(msg.chat_id_, msg.id_, "- تم اضافة الصلاحية يحلو .") 
database:del(bot_id.."Relax:Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
end

if text and text:match("^تغيير رد المطور (.*)$") and Owner(msg) then
local Teext = text:match("^تغيير رد المطور (.*)$") 
database:set(bot_id.."Relax:Sudo:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_,"- تم تغيير رد المطور الى  » "..Teext)
end
if text and text:match("^تغيير رد المنشئ الاساسي (.*)$") and Owner(msg) then
local Teext = text:match("^تغيير رد المنشئ الاساسي (.*)$") 
database:set(bot_id.."Relax:BasicConstructor:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_,"- تم تغيير رد المنشئ الاساسي الى  » "..Teext)
end
if text and text:match("^تغيير رد المنشئ (.*)$") and Owner(msg) then
local Teext = text:match("^تغيير رد المنشئ (.*)$") 
database:set(bot_id.."Relax:Constructor:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_,"- تم تغيير رد المنشئ الى  » "..Teext)
end
if text and text:match("^تغيير رد المدير (.*)$") and Owner(msg) then
local Teext = text:match("^تغيير رد المدير (.*)$") 
database:set(bot_id.."Relax:Manager:Rd"..msg.chat_id_,Teext) 
send(msg.chat_id_, msg.id_,"- تم تغيير رد المدير الى  » "..Teext)
end
if text and text:match("^تغيير رد الادمن (.*)$") and Owner(msg) then
local Teext = text:match("^تغيير رد الادمن (.*)$") 
database:set(bot_id.."Relax:Mod:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_,"- تم تغيير رد الادمن الى  » "..Teext)
end
if text and text:match("^تغيير رد المميز (.*)$") and Owner(msg) then
local Teext = text:match("^تغيير رد المميز (.*)$") 
database:set(bot_id.."Relax:Special:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_,"- تم تغيير رد المميز الى  » "..Teext)
end
if text and text:match("^تغيير رد العضو (.*)$") and Owner(msg) then
local Teext = text:match("^تغيير رد العضو (.*)$") 
database:set(bot_id.."Relax:Memp:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_,"- تم تغيير رد العضو الى  » "..Teext)
end


if text == ("مسح ردود المدير") and Owner(msg) then
local list = database:smembers(bot_id.."Relax:List:Manager"..msg.chat_id_.."")
for k,v in pairs(list) do
database:del(bot_id.."Relax:Add:Rd:Manager:Gif"..v..msg.chat_id_)   
database:del(bot_id.."Relax:Add:Rd:Manager:Vico"..v..msg.chat_id_)   
database:del(bot_id.."Relax:Add:Rd:Manager:Stekrs"..v..msg.chat_id_)     
database:del(bot_id.."Relax:Add:Rd:Manager:Text"..v..msg.chat_id_)   
database:del(bot_id.."Relax:Add:Rd:Manager:Photo"..v..msg.chat_id_)
database:del(bot_id.."Relax:Add:Rd:Manager:Video"..v..msg.chat_id_)
database:del(bot_id.."Relax:Add:Rd:Manager:File"..v..msg.chat_id_)
database:del(bot_id.."Relax:Add:Rd:Manager:Audio"..v..msg.chat_id_)
database:del(bot_id.."Relax:List:Manager"..msg.chat_id_)
end
send(msg.chat_id_, msg.id_,"- تم مسح ردود المدير عمري .")
end
if text == ("ردود المدير") and Owner(msg) then
local list = database:smembers(bot_id.."Relax:List:Manager"..msg.chat_id_.."")
text = "- قائمة ردود المدير يحلو .\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
if database:get(bot_id.."Relax:Add:Rd:Manager:Gif"..v..msg.chat_id_) then
db = "محتركة ."
elseif database:get(bot_id.."Relax:Add:Rd:Manager:Vico"..v..msg.chat_id_) then
db = "بصمة ."
elseif database:get(bot_id.."Relax:Add:Rd:Manager:Stekrs"..v..msg.chat_id_) then
db = "ستكر ."
elseif database:get(bot_id.."Relax:Add:Rd:Manager:Text"..v..msg.chat_id_) then
db = "رسالة ."
elseif database:get(bot_id.."Relax:Add:Rd:Manager:Photo"..v..msg.chat_id_) then
db = "صورة ."
elseif database:get(bot_id.."Relax:Add:Rd:Manager:Video"..v..msg.chat_id_) then
db = "فيديو ."
elseif database:get(bot_id.."Relax:Add:Rd:Manager:File"..v..msg.chat_id_) then
db = "ملف ."
elseif database:get(bot_id.."Relax:Add:Rd:Manager:Audio"..v..msg.chat_id_) then
db = "اغنية ."
end
text = text..""..k..">> ("..v..") » {"..db.."}\n"
end
if #list == 0 then
text = "- مكو ردود للمدير حياتي ."
end
send(msg.chat_id_, msg.id_,"["..text.."]")
end
if text or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.animation_ or msg.content_.audio_ or msg.content_.document_ or msg.content_.photo_ or msg.content_.video_ then  
local test = database:get(bot_id.."Relax:Text:Manager"..msg.sender_user_id_..":"..msg.chat_id_.."")
if database:get(bot_id.."Relax:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_) == "true1" then
database:del(bot_id.."Relax:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_)
if msg.content_.sticker_ then   
database:set(bot_id.."Relax:Add:Rd:Manager:Stekrs"..test..msg.chat_id_, msg.content_.sticker_.sticker_.persistent_id_)  
end   
if msg.content_.voice_ then  
database:set(bot_id.."Relax:Add:Rd:Manager:Vico"..test..msg.chat_id_, msg.content_.voice_.voice_.persistent_id_)  
end   
if msg.content_.animation_ then   
database:set(bot_id.."Relax:Add:Rd:Manager:Gif"..test..msg.chat_id_, msg.content_.animation_.animation_.persistent_id_)  
end  
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
database:set(bot_id.."Relax:Add:Rd:Manager:Text"..test..msg.chat_id_, text)  
end  
if msg.content_.audio_ then
database:set(bot_id.."Relax:Add:Rd:Manager:Audio"..test..msg.chat_id_, msg.content_.audio_.audio_.persistent_id_)  
end
if msg.content_.document_ then
database:set(bot_id.."Relax:Add:Rd:Manager:File"..test..msg.chat_id_, msg.content_.document_.document_.persistent_id_)  
end
if msg.content_.video_ then
database:set(bot_id.."Relax:Add:Rd:Manager:Video"..test..msg.chat_id_, msg.content_.video_.video_.persistent_id_)  
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
database:set(bot_id.."Relax:Add:Rd:Manager:Photo"..test..msg.chat_id_, photo_in_group)  
end
send(msg.chat_id_, msg.id_,"- تم حفظ الرد عمري .")
return false  
end  
end
if text == "اضف رد" and Owner(msg) then
send(msg.chat_id_, msg.id_,"- دز الكلمة عمري .")
database:set(bot_id.."Relax:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_,true)
return false 
end
if text == "حذف رد" and Owner(msg) then
send(msg.chat_id_, msg.id_,"- دز الكلمة الي تريد تحذفها يحلو .")
database:set(bot_id.."Relax:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_,"true2")
return false 
end
if text and text:match("^(.*)$") then
if database:get(bot_id.."Relax:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_) == "true" then
send(msg.chat_id_, msg.id_, '- دز الي تريد تضيفه يقلبي .\n- (ملف - فديو - نص - ملصق - بصمه - متحركه )\n- تكدر تضيف ذني وي الرد . :\n- `#username` => المعرف .\n- `#msgs` => عدد الرسائل .\n- `#name` => الاسم .\n- `#id` => الايدي .\n- `#stast` => الرتبة . \n- `#edit` => عدد الرسائل المعدلة ( السحكات ) . ')
database:set(bot_id.."Relax:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_,"true1")
database:set(bot_id.."Relax:Text:Manager"..msg.sender_user_id_..":"..msg.chat_id_, text)
database:del(bot_id.."Relax:Add:Rd:Manager:Gif"..text..msg.chat_id_)   
database:del(bot_id.."Relax:Add:Rd:Manager:Vico"..text..msg.chat_id_)   
database:del(bot_id.."Relax:Add:Rd:Manager:Stekrs"..text..msg.chat_id_)     
database:del(bot_id.."Relax:Add:Rd:Manager:Text"..text..msg.chat_id_)   
database:del(bot_id.."Relax:Add:Rd:Manager:Photo"..text..msg.chat_id_)
database:del(bot_id.."Relax:Add:Rd:Manager:Video"..text..msg.chat_id_)
database:del(bot_id.."Relax:Add:Rd:Manager:File"..text..msg.chat_id_)
database:del(bot_id.."Relax:Add:Rd:Manager:Audio"..text..msg.chat_id_)
database:sadd(bot_id.."Relax:List:Manager"..msg.chat_id_.."", text)
return false end
end
if text and text:match("^(.*)$") then
if database:get(bot_id.."Relax:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_.."") == "true2" then
send(msg.chat_id_, msg.id_,"- تم حذف الرد عمري .")
database:del(bot_id.."Relax:Add:Rd:Manager:Gif"..text..msg.chat_id_)   
database:del(bot_id.."Relax:Add:Rd:Manager:Vico"..text..msg.chat_id_)   
database:del(bot_id.."Relax:Add:Rd:Manager:Stekrs"..text..msg.chat_id_)     
database:del(bot_id.."Relax:Add:Rd:Manager:Text"..text..msg.chat_id_)   
database:del(bot_id.."Relax:Add:Rd:Manager:Photo"..text..msg.chat_id_)
database:del(bot_id.."Relax:Add:Rd:Manager:Video"..text..msg.chat_id_)
database:del(bot_id.."Relax:Add:Rd:Manager:File"..text..msg.chat_id_)
database:del(bot_id.."Relax:Add:Rd:Manager:Audio"..text..msg.chat_id_)
database:del(bot_id.."Relax:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_)
database:srem(bot_id.."Relax:List:Manager"..msg.chat_id_.."", text)
return false
end
end
if text and not database:get(bot_id.."Relax:Reply:Manager"..msg.chat_id_) then
if not database:sismember(bot_id..'Relax:Spam:Group'..msg.sender_user_id_,text) then
local anemi = database:get(bot_id.."Relax:Add:Rd:Manager:Gif"..text..msg.chat_id_)   
local veico = database:get(bot_id.."Relax:Add:Rd:Manager:Vico"..text..msg.chat_id_)   
local stekr = database:get(bot_id.."Relax:Add:Rd:Manager:Stekrs"..text..msg.chat_id_)     
local Text = database:get(bot_id.."Relax:Add:Rd:Manager:Text"..text..msg.chat_id_)   
local photo = database:get(bot_id.."Relax:Add:Rd:Manager:Photo"..text..msg.chat_id_)
local video = database:get(bot_id.."Relax:Add:Rd:Manager:Video"..text..msg.chat_id_)
local document = database:get(bot_id.."Relax:Add:Rd:Manager:File"..text..msg.chat_id_)
local audio = database:get(bot_id.."Relax:Add:Rd:Manager:Audio"..text..msg.chat_id_)
if Text then 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,data)
local NumMsg = database:get(bot_id..'Relax:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(msg.sender_user_id_,msg.chat_id_)
local message_edit = database:get(bot_id..'Relax:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local Text = Text:gsub('#username',(data.username_ or 'مكو')) 
local Text = Text:gsub('#name',data.first_name_)
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',message_edit)
local Text = Text:gsub('#msgs',NumMsg)
local Text = Text:gsub('#stast',Status_Gps)
send(msg.chat_id_, msg.id_, Text)
database:sadd(bot_id.."Relax:Spam:Group"..msg.sender_user_id_,text) 
end,nil)
end
if stekr then 
sendSticker(msg.chat_id_,msg.id_,stekr)
database:sadd(bot_id.."Relax:Spam:Group"..msg.sender_user_id_,text) 
end
if veico then 
sendVoice(msg.chat_id_, msg.id_,veico,"")
database:sadd(bot_id.."Relax:Spam:Group"..msg.sender_user_id_,text) 
end
if video then 
sendVideo(msg.chat_id_, msg.id_,video,"")
database:sadd(bot_id.."Relax:Spam:Group"..msg.sender_user_id_,text) 
end
if anemi then 
sendAnimation(msg.chat_id_, msg.id_,anemi,"")   
database:sadd(bot_id.."Relax:Spam:Group"..msg.sender_user_id_,text) 
end
if document then
sendDocument(msg.chat_id_, msg.id_, document)   
database:sadd(bot_id.."Relax:Spam:Group"..msg.sender_user_id_,text) 
end  
if audio then
sendAudio(msg.chat_id_,msg.id_,audio)  
database:sadd(bot_id.."Relax:Spam:Group"..msg.sender_user_id_,text) 
end
if photo then
sendPhoto(msg.chat_id_,msg.id_,photo,photo_caption)
database:sadd(bot_id.."Relax:Spam:Group"..msg.sender_user_id_,text) 
end  
end
end
------------------------------------------------------------------------
if text == ("مسح ردود المطور") and DevRelax(msg) then 
local list = database:smembers(bot_id.."Relax:List:Rd:Sudo")
for k,v in pairs(list) do
database:del(bot_id.."Relax:Add:Rd:Sudo:Gif"..v)   
database:del(bot_id.."Relax:Add:Rd:Sudo:vico"..v)   
database:del(bot_id.."Relax:Add:Rd:Sudo:stekr"..v)     
database:del(bot_id.."Relax:Add:Rd:Sudo:Text"..v)   
database:del(bot_id.."Relax:Add:Rd:Sudo:Photo"..v)
database:del(bot_id.."Relax:Add:Rd:Sudo:Video"..v)
database:del(bot_id.."Relax:Add:Rd:Sudo:File"..v)
database:del(bot_id.."Relax:Add:Rd:Sudo:Audio"..v)
database:del(bot_id.."Relax:List:Rd:Sudo")
end
send(msg.chat_id_, msg.id_,"- تم مسح ردود المطور عمري .")
end
if text == ("ردود المطور") and DevRelax(msg) then 
local list = database:smembers(bot_id.."Relax:List:Rd:Sudo")
text = "\n- قائمة ردود المطور . \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
if database:get(bot_id.."Relax:Add:Rd:Sudo:Gif"..v) then
db = "متحركة ."
elseif database:get(bot_id.."Relax:Add:Rd:Sudo:vico"..v) then
db = "بصمة ."
elseif database:get(bot_id.."Relax:Add:Rd:Sudo:stekr"..v) then
db = "ستكر ."
elseif database:get(bot_id.."Relax:Add:Rd:Sudo:Text"..v) then
db = "رسالة ."
elseif database:get(bot_id.."Relax:Add:Rd:Sudo:Photo"..v) then
db = "صورة ."
elseif database:get(bot_id.."Relax:Add:Rd:Sudo:Video"..v) then
db = "فيديو ."
elseif database:get(bot_id.."Relax:Add:Rd:Sudo:File"..v) then
db = "ملف ."
elseif database:get(bot_id.."Relax:Add:Rd:Sudo:Audio"..v) then
db = "اغنية ."
end
text = text..""..k.." >> ("..v..") » {"..db.."}\n"
end
if #list == 0 then
text = "- مكو ردود للمطور حياتي ."
end
send(msg.chat_id_, msg.id_,"["..text.."]")
end
if text or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.animation_ or msg.content_.audio_ or msg.content_.document_ or msg.content_.photo_ or msg.content_.video_ then  
local test = database:get(bot_id.."Relax:Text:Sudo:Bot"..msg.sender_user_id_..":"..msg.chat_id_)
if database:get(bot_id.."Relax:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_) == "true1" then
database:del(bot_id.."Relax:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_)
if msg.content_.sticker_ then   
database:set(bot_id.."Relax:Add:Rd:Sudo:stekr"..test, msg.content_.sticker_.sticker_.persistent_id_)  
end   
if msg.content_.voice_ then  
database:set(bot_id.."Relax:Add:Rd:Sudo:vico"..test, msg.content_.voice_.voice_.persistent_id_)  
end   
if msg.content_.animation_ then   
database:set(bot_id.."Relax:Add:Rd:Sudo:Gif"..test, msg.content_.animation_.animation_.persistent_id_)  
end  
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
database:set(bot_id.."Relax:Add:Rd:Sudo:Text"..test, text)  
end  
if msg.content_.audio_ then
database:set(bot_id.."Relax:Add:Rd:Sudo:Audio"..test, msg.content_.audio_.audio_.persistent_id_)  
end
if msg.content_.document_ then
database:set(bot_id.."Relax:Add:Rd:Sudo:File"..test, msg.content_.document_.document_.persistent_id_)  
end
if msg.content_.video_ then
database:set(bot_id.."Relax:Add:Rd:Sudo:Video"..test, msg.content_.video_.video_.persistent_id_)  
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
database:set(bot_id.."Relax:Add:Rd:Sudo:Photo"..test, photo_in_group)  
end
send(msg.chat_id_, msg.id_,"- تم حفط الرد يقلبي .")
return false  
end  
end

if text == "اضف رد للكل" and DevRelax(msg) then 
send(msg.chat_id_, msg.id_,"- دز الكلمة الي تريد تضيفها يقلبي .")
database:set(bot_id.."Relax:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_,true)
return false 
end
if text == "حذف رد للكل" and DevRelax(msg) then 
send(msg.chat_id_, msg.id_,"- دز الكلمة الي تريد تحذفها عمري .")
database:set(bot_id.."Relax:Set:On"..msg.sender_user_id_..":"..msg.chat_id_,true)
return false 
end
if text and text:match("^(.*)$") then
if database:get(bot_id.."Relax:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_) == "true" then
send(msg.chat_id_, msg.id_, '- دز الرد الي تريد تضيفه .\n- (ملف - فديو - نص - ملصق - بصمه - متحركه )\n- تكدر تضيف ويا ذني .\n- `#username` => المعرف .\n- `#msgs` => عدد الرسائل .\n- `#name` => الاسم .\n- `#id` => الايدي .\n- `#stast` => الرتبة . \n- `#edit` => عدد الرسائل المعدلة ( السحكات ')
database:set(bot_id.."Relax:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_, "true1")
database:set(bot_id.."Relax:Text:Sudo:Bot"..msg.sender_user_id_..":"..msg.chat_id_, text)
database:sadd(bot_id.."Relax:List:Rd:Sudo", text)
return false end
end
if text and text:match("^(.*)$") then
if database:get(bot_id.."Relax:Set:On"..msg.sender_user_id_..":"..msg.chat_id_) == "true" then
send(msg.chat_id_, msg.id_,"- تم حذف الرد من ردود المطور حياتي .")
list = {"Add:Rd:Sudo:Audio","Add:Rd:Sudo:File","Add:Rd:Sudo:Video","Add:Rd:Sudo:Photo","Add:Rd:Sudo:Text","Add:Rd:Sudo:stekr","Add:Rd:Sudo:vico","Add:Rd:Sudo:Gif"}
for k,v in pairs(list) do
database:del(bot_id..'Relax:'..v..text)
end
database:del(bot_id.."Relax:Set:On"..msg.sender_user_id_..":"..msg.chat_id_)
database:srem(bot_id.."Relax:List:Rd:Sudo", text)
return false
end
end

if text and not database:get(bot_id.."Relax:Reply:Sudo"..msg.chat_id_) then
if not database:sismember(bot_id..'Relax:Spam:Group'..msg.sender_user_id_,text) then
local anemi = database:get(bot_id.."Relax:Add:Rd:Sudo:Gif"..text)   
local veico = database:get(bot_id.."Relax:Add:Rd:Sudo:vico"..text)   
local stekr = database:get(bot_id.."Relax:Add:Rd:Sudo:stekr"..text)     
local Text = database:get(bot_id.."Relax:Add:Rd:Sudo:Text"..text)   
local photo = database:get(bot_id.."Relax:Add:Rd:Sudo:Photo"..text)
local video = database:get(bot_id.."Relax:Add:Rd:Sudo:Video"..text)
local document = database:get(bot_id.."Relax:Add:Rd:Sudo:File"..text)
local audio = database:get(bot_id.."Relax:Add:Rd:Sudo:Audio"..text)

if Text then 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,data)
local NumMsg = database:get(bot_id..'Relax:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(msg.sender_user_id_,msg.chat_id_)
local message_edit = database:get(bot_id..'Relax:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local Text = Text:gsub('#username',(data.username_ or 'مكو')) 
local Text = Text:gsub('#name',data.first_name_)
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',message_edit)
local Text = Text:gsub('#msgs',NumMsg)
local Text = Text:gsub('#stast',Status_Gps)
send(msg.chat_id_, msg.id_,Text)
database:sadd(bot_id.."Relax:Spam:Group"..msg.sender_user_id_,text) 
end,nil)
end
if stekr then 
sendSticker(msg.chat_id_,msg.id_,stekr) 
database:sadd(bot_id.."Relax:Spam:Group"..msg.sender_user_id_,text) 
end
if veico then 
sendVoice(msg.chat_id_, msg.id_,veico,"")
database:sadd(bot_id.."Relax:Spam:Group"..msg.sender_user_id_,text) 
end
if video then 
sendVideo(msg.chat_id_, msg.id_,video,"")
database:sadd(bot_id.."Relax:Spam:Group"..msg.sender_user_id_,text) 
end
if anemi then 
sendAnimation(msg.chat_id_, msg.id_,anemi,"")   
database:sadd(bot_id.."Relax:Spam:Group"..msg.sender_user_id_,text) 
end
if document then
sendDocument(msg.chat_id_, msg.id_, document)     
database:sadd(bot_id.."Relax:Spam:Group"..msg.sender_user_id_,text) 
end  
if audio then
sendAudio(msg.chat_id_,msg.id_,audio)  
database:sadd(bot_id.."Relax:Spam:Group"..msg.sender_user_id_,text) 
end
if photo then
sendPhoto(msg.chat_id_,msg.id_,photo,"")
database:sadd(bot_id.."Relax:Spam:Group"..msg.sender_user_id_,text) 
end  
end
end
if text == 'طرد المحذوفين' or text == 'مسح المحذوفين' then  
if Addictive(msg) then    
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),offset_ = 0,limit_ = 1000}, function(arg,del)
for k, v in pairs(del.members_) do
tdcli_function({ID = "GetUser",user_id_ = v.user_id_},function(b,data) 
if data.first_name_ == false then
Kick_Group(msg.chat_id_, data.id_)
end
end,nil)
end
send(msg.chat_id_, msg.id_,'- تم طرد الحسابات المحذوفة يحلو .')
end,nil)
end
end

if text == "تفعيل ردود المدير" and Owner(msg) then   
database:del(bot_id.."Relax:Reply:Manager"..msg.chat_id_)  
send(msg.chat_id_, msg.id_,"- تم تفعيل ردود المدير يقلبي .") 
end
if text == "تعطيل ردود المدير" and Owner(msg) then  
database:set(bot_id.."Relax:Reply:Manager"..msg.chat_id_,true)  
send(msg.chat_id_, msg.id_,"- تم تعطيل ردود المدير يقلبي ." ) 
end
if text == "تفعيل ردود المطور" and Owner(msg) then   
database:del(bot_id.."Relax:Reply:Sudo"..msg.chat_id_)  
send(msg.chat_id_, msg.id_,"- تم تفعيل ردود المطور يحلو ." ) 
end
if text == "تعطيل ردود المطور" and Owner(msg) then  
database:set(bot_id.."Relax:Reply:Sudo"..msg.chat_id_,true)   
send(msg.chat_id_, msg.id_,"- تم تعطيل ردود المطور يحلو ." ) 
end

if text == ("تنزيل الكل") and msg.reply_to_message_id_ ~= 0 and Owner(msg) then
function Function_Relax(extra, result, success)
if tonumber(SUDO) == tonumber(result.sender_user_id_) then
send(msg.chat_id_, msg.id_,"- متكدر تنزل المطور الاساسي عمري .")
return false 
end
if database:sismember(bot_id.."Relax:Sudo:User",result.sender_user_id_) then
dev = "المطور ،" else dev = "" end
if database:sismember(bot_id.."Relax:Basic:Constructor"..msg.chat_id_, result.sender_user_id_) then
crr = "منشئ اساسي ،" else crr = "" end
if database:sismember(bot_id.."Relax:Constructor"..msg.chat_id_, result.sender_user_id_) then
cr = "منشئ ،" else cr = "" end
if database:sismember(bot_id.."Relax:Manager"..msg.chat_id_, result.sender_user_id_) then
own = "مدير ،" else own = "" end
if database:sismember(bot_id.."Relax:Mod:User"..msg.chat_id_, result.sender_user_id_) then
mod = "ادمن ،" else mod = "" end
if database:sismember(bot_id.."Relax:Special:User"..msg.chat_id_, result.sender_user_id_) then
vip = "مميز ،" else vip = ""
end
if Rank_Checking(result.sender_user_id_,msg.chat_id_) ~= false then
send(msg.chat_id_, msg.id_,"\n- تم تنزيله من الرتب التالية . \n- { "..dev..""..crr..""..cr..""..own..""..mod..""..vip.." } \n")
else
send(msg.chat_id_, msg.id_,"\n- معنده ولا رتبة عمري .\n")
end
if tonumber(Id_Sudo) == tonumber(msg.sender_user_id_) then
database:srem(bot_id.."Relax:Sudo:User", result.sender_user_id_)
database:srem(bot_id.."Relax:Basic:Constructor"..msg.chat_id_,result.sender_user_id_)
database:srem(bot_id.."Relax:Constructor"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Relax:Manager"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Relax:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Relax:Special:User"..msg.chat_id_, result.sender_user_id_)
elseif database:sismember(bot_id.."Relax:Sudo:User",msg.sender_user_id_) then
database:srem(bot_id.."Relax:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Relax:Special:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Relax:Manager"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Relax:Constructor"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Relax:Basic:Constructor"..msg.chat_id_,result.sender_user_id_)
elseif database:sismember(bot_id.."Relax:Basic:Constructor"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."Relax:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Relax:Special:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Relax:Manager"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Relax:Constructor"..msg.chat_id_, result.sender_user_id_)
elseif database:sismember(bot_id.."Relax:Constructor"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."Relax:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Relax:Special:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Relax:Manager"..msg.chat_id_, result.sender_user_id_)
elseif database:sismember(bot_id.."Relax:Manager"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."Relax:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."Relax:Special:User"..msg.chat_id_, result.sender_user_id_)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Relax, nil)
end
if text == "تاك للكل" and Addictive(msg) then
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""), offset_ = 0,limit_ = 200},function(ta,BROK)
local t = "\n- قائمة الاعضاء .\n━━━━━━━━━━━━━\n"
x = 0
local list = BROK.members_
for k, v in pairs(list) do
x = x + 1
if database:get(bot_id.."Relax:User:Name"..v.user_id_) then
t = t..""..x.." - {[@"..database:get(bot_id.."Relax:User:Name"..v.user_id_).."]}\n"
else
t = t..""..x.." - {"..v.user_id_.."}\n"
end
end
send(msg.chat_id_,msg.id_,t)
end,nil)
end

if text == "رتبتي" then
local rtp = Get_Rank(msg.sender_user_id_,msg.chat_id_)
send(msg.chat_id_, msg.id_,"- رتبتك يحلو  » "..rtp)
end
if text == "اسمي"  then 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(extra,result,success)
if result.first_name_  then
first_name = "- اسمك الاول عمري ← {`"..(result.first_name_).."`}"
else
first_name = ""
end   
if result.last_name_ then 
last_name = "- اسم الثاني ← {`"..result.last_name_.."`}" 
else
last_name = ""
end      
send(msg.chat_id_, msg.id_,first_name.."\n"..last_name) 
end,nil)
end 
if text==("عدد الكروب") and Addictive(msg) then  
if msg.can_be_deleted_ == false then 
send(msg.chat_id_,msg.id_,"- اني مو ادمن عمري . \n") 
return false  
end 
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,ta) 
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
local BROK = "- عدد الادمنية  => "..data.administrator_count_..
"\n\n- عدد المطرودين => "..data.kicked_count_..
"\n\n- عدد الاعضاء => "..data.member_count_..
"\n\n- عدد رسائل الكروب => "..(msg.id_/2097152/0.5)..
"\n\n- اسم الكروب => ["..ta.title_.."]"
send(msg.chat_id_, msg.id_, BROK) 
end,nil)
end,nil)
end 
if text == "اطردني" or text == "طردني" then
if not database:get(bot_id.."Relax:Kick:Me"..msg.chat_id_) then
if Rank_Checking(msg.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n- عمري مكدر اطرد ( "..Get_Rank(msg.sender_user_id_,msg.chat_id_).." )")
return false
end
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=msg.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"- معندي صلاحية حظر يحلو .") 
return false  
end
if (data and data.code_ and data.code_ == 3) then 
send(msg.chat_id_, msg.id_,"- اني مو ادمن حياتي .") 
return false  
end
if data and data.code_ and data.code_ == 400 and data.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_, msg.id_,"- مكدر اطرد ادمنية الكروب .") 
return false  
end
if data and data.ID and data.ID == "Ok" then
send(msg.chat_id_, msg.id_,"- تم طردك من الكروب يحلو .") 
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = msg.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
return false
end
end,nil)   
else
send(msg.chat_id_, msg.id_,"- امر اطردني معطل قلبي .") 
end
end

if text == "تفعيل اطردني" and Owner(msg) then   
database:del(bot_id.."Relax:Kick:Me"..msg.chat_id_)  
send(msg.chat_id_, msg.id_,Text) 
end
if text == "تعطيل اطردني" and Owner(msg) then  
database:set(bot_id.."Relax:Kick:Me"..msg.chat_id_,true)  
Text = "\n- تم تعطيل امر اطردني ."
send(msg.chat_id_, msg.id_,Text) 
end

if text and text:match("^رفع القيود @(.*)") and Owner(msg) then 
local username = text:match("^رفع القيود @(.*)") 
function Function_Relax(extra, result, success)
if result.id_ then
if DevRelax(msg) then
database:srem(bot_id.."Relax:GBan:User",result.id_)
database:srem(bot_id.."Relax:Ban:User"..msg.chat_id_,result.id_)
database:srem(bot_id.."Relax:Muted:User"..msg.chat_id_,result.id_)
usertext = "\n- الحات » ["..result.title_.."](t.me/"..(username or "aaaZaa")..")"
status  = "\n- تم الغاء جميع قيوده ."
texts = usertext..status
send(msg.chat_id_, msg.id_,texts)
else
database:srem(bot_id.."Relax:Ban:User"..msg.chat_id_,result.id_)
database:srem(bot_id.."Relax:Muted:User"..msg.chat_id_,result.id_)
Reply_Status(msg,result.id_,"reply","\n- تم الغاء جميع قيوده .")  
end
else
Text = "- المعرف غلط يحلو ."
send(msg.chat_id_, msg.id_,Text)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Relax, nil)
end
if text == "رفع القيود" and Owner(msg) then
function Function_Relax(extra, result, success)
if DevRelax(msg) then
database:srem(bot_id.."Relax:GBan:User",result.sender_user_id_)
database:srem(bot_id.."Relax:Ban:User"..msg.chat_id_,result.sender_user_id_)
database:srem(bot_id.."Relax:Muted:User"..msg.chat_id_,result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","\n- تم رفع جميع قيوده .")  
else
database:srem(bot_id.."Relax:Ban:User"..msg.chat_id_,result.sender_user_id_)
database:srem(bot_id.."Relax:Muted:User"..msg.chat_id_,result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = "\n- الحات » ["..data.first_name_.."](t.me/"..(data.username_ or "aaaZaa")..")"
status  = "\n- تم رفع جميع قيوده ."
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Relax, nil)
end
if text and text:match("^كشف القيود @(.*)") and Owner(msg) then 
local username = text:match("^كشف القيود @(.*)") 
function Function_Relax(extra, result, success)
if result.id_ then
if database:sismember(bot_id.."Relax:Muted:User"..msg.chat_id_,result.id_) then
Muted = "مكتوم"
else
Muted = "غير مكتوم"
end
if database:sismember(bot_id.."Relax:Ban:User"..msg.chat_id_,result.id_) then
Ban = "محظور"
else
Ban = "غير محظور"
end
if database:sismember(bot_id.."Relax:GBan:User",result.id_) then
GBan = "محظور عام"
else
GBan = "غير محظور عام"
end
send(msg.chat_id_, msg.id_,"- الحظر العام » "..GBan.."\n- الحظر » "..Ban.."\n- الكتم » "..Muted)
else
send(msg.chat_id_, msg.id_,"- المعرف غلط حياتي .")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Relax, nil)
end

if text == "كشف القيود" and Owner(msg) then 
function Function_Relax(extra, result, success)
if database:sismember(bot_id.."Relax:Muted:User"..msg.chat_id_,result.sender_user_id_) then
Muted = "مكتوم"
else
Muted = "غير مكتوم"
end
if database:sismember(bot_id.."Relax:Ban:User"..msg.chat_id_,result.sender_user_id_) then
Ban = "محظور"
else
Ban = "غير محظور"
end
if database:sismember(bot_id.."Relax:GBan:User",result.sender_user_id_) then
GBan = "محظور عام"
else
GBan = "غير محظور عام"
end
Textt = "- الحظر العام » "..GBan.."\n- الحظر » "..Ban.."\n- الكتم » "..Muted..""
send(msg.chat_id_, msg.id_,Textt)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Relax, nil)
end

if text and text:match("^ضع اسم (.*)") and Owner(msg) or text and text:match("^وضع اسم (.*)") and Owner(msg) then 
local Name = text:match("^ضع اسم (.*)") or text:match("^وضع اسم (.*)") 
tdcli_function ({ ID = "ChangeChatTitle",chat_id_ = msg.chat_id_,title_ = Name },function(arg,data) 
if data.message_ == "Channel chat title can be changed by administrators only" then
send(msg.chat_id_,msg.id_,"- اني مو ادمن يحلو .")  
return false  
end 
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"- معندي صلاحية تغيير عمري .")  
else
send(msg.chat_id_,msg.id_,"- تم تغيير اسم الكروب الى => {["..Name.."]}")  
end
end,nil) 
end

if text ==("رفع الادمنية") and Owner(msg) then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local num2 = 0
local admins = data.members_
for i=0 , #admins do
if data.members_[i].bot_info_ == false and data.members_[i].status_.ID == "ChatMemberStatusEditor" then
database:sadd(bot_id.."Relax:Mod:User"..msg.chat_id_, admins[i].user_id_)
num2 = num2 + 1
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,b) 
if b.username_ == true then
end
if b.first_name_ == false then
database:srem(bot_id.."Relax:Mod:User"..msg.chat_id_, admins[i].user_id_)
end
end,nil)   
else
database:srem(bot_id.."Relax:Mod:User"..msg.chat_id_, admins[i].user_id_)
end
end
if num2 == 0 then
send(msg.chat_id_, msg.id_,"- مكو ادمنية بالكروب .") 
else
send(msg.chat_id_, msg.id_,"- تم رفع { "..num2.." } من ادمنية الكروب .") 
end
end,nil)   
end
if text ==("المنشئ") then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
owner_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = owner_id},function(arg,b) 
if b.first_name_ == false then
send(msg.chat_id_, msg.id_,"- حساب المنشئ محذوف عمري .")
return false  
end
local UserName = (b.username_ or "RelaxTEAM")
send(msg.chat_id_, msg.id_,"- منشئ الكروب ~ ["..b.first_name_.."](T.me/"..UserName..")")  
end,nil)   
end
end
end,nil)   
end
if text ==("رفع المنشئ") and DevBot(msg) then 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
owner_id = admins[i].user_id_
end
end
tdcli_function ({ID = "GetUser",user_id_ = owner_id},function(arg,b) 
if b.first_name_ == false then
send(msg.chat_id_, msg.id_,"- حساب المنشئ محذوف يحلو .")
return false  
end
local UserName = (b.username_ or "RelaxTEAM")
send(msg.chat_id_, msg.id_,"- تم رفعه منشئ للكروب ~ ["..b.first_name_.."](T.me/"..UserName..")")  
database:sadd(bot_id.."Relax:Basic:Constructor"..msg.chat_id_,b.id_)
end,nil)   
end,nil)   
end

if text == "غادر" then 
if DevBot(msg) and not database:get(bot_id.."Relax:Left:Bot"..msg.chat_id_) then 
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=bot_id,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
send(msg.chat_id_, msg.id_,"- تم عمري غادرت .") 
database:srem(bot_id.."Relax:Chek:Groups",msg.chat_id_)  
end
return false  
end
if text and text:match("^غادر (-%d+)$") then
local GP_ID = {string.match(text, "^(غادر) (-%d+)$")}
if DevBot(msg) and not database:get(bot_id.."Relax:Left:Bot"..msg.chat_id_) then 
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=GP_ID[2],user_id_=bot_id,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
send(msg.chat_id_, msg.id_,"- تم عمري غادرت .") 
send(GP_ID[2], 0,"- تم عمري غادرت .") 
database:srem(bot_id.."Relax:Chek:Groups",GP_ID[2])  
return false 
end
end
if text == "تفعيل المغادرة" and DevRelax(msg) then   
database:del(bot_id.."Relax:Left:Bot"..msg.chat_id_)  
send(msg.chat_id_, msg.id_,"- تم تفعيل مغادرة البوت .") 
return false 
end
if text == "تعطيل المغادرة" and DevRelax(msg) then  
database:set(bot_id.."Relax:Left:Bot"..msg.chat_id_,true)   
send(msg.chat_id_, msg.id_, "- تم تعطيل مغادرة البوت .") 
return false 
end
if text == (database:get(bot_id.."Relax:Name:Bot") or "ريلاكس") then
Namebot = (database:get(bot_id.."Relax:Name:Bot") or "ريلاكس")
local namebot = {
"يقلب "..Namebot.. " كول عمري ",
"كول حياتي اني "..Namebot,
'ها حبيبي غردلي',
'ها يحلو كول',
'عمري الحات انت',
'ها يروحي كول',
" ها يروح "..Namebot,
}
name = math.random(#namebot)
send(msg.chat_id_, msg.id_, namebot[name]) 
return false 
end

if text == "بوت" then
Namebot = (database:get(bot_id.."Relax:Name:Bot") or "ريلاكس")
send(msg.chat_id_, msg.id_,"- عمري انت اسمي => ["..Namebot.."] ") 
end
if text == "تغير اسم البوت" or text == "تغيير اسم البوت" then 
if DevRelax(msg) then
database:setex(bot_id.."Relax:Set:Name:Bot"..msg.sender_user_id_,300,true) 
send(msg.chat_id_, msg.id_,"- دز الاسم يحلو . ")  
end
return false
end

if text ==("مسح المطرودين") and Addictive(msg) then    
local function delbans(extra, result)  
if not msg.can_be_deleted_ == true then  
send(msg.chat_id_, msg.id_, "- اني مو ادمن عمري .") 
return false
end  
local num = 0 
for k,y in pairs(result.members_) do 
num = num + 1  
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = y.user_id_, status_ = { ID = "ChatMemberStatusLeft"}, }, dl_cb, nil)  
end  
send(msg.chat_id_, msg.id_,"- تم الغاء حظر "..num.."  شخص ") 
end    
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersKicked"},offset_ = 0,limit_ = 200}, delbans, {chat_id_ = msg.chat_id_, msg_id_ = msg.id_})    
end
if text=="اذاعة خاص" and msg.reply_to_message_id_ == 0 and DevBot(msg) then 
if database:get(bot_id.."Relax:Status:Bc") and not DevRelax(msg) then 
send(msg.chat_id_, msg.id_,"- الاذاعة معطلة من المطور الاساسي عمري .")
return false
end
database:setex(bot_id.."Relax:Relax:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"- دزلي ايشي عمري ~ { ملصق, متحركة, صورة, رسالة }\n- دز الغاء اذا بطلت يحلو .") 
return false
end 
if text=="اذاعة" and msg.reply_to_message_id_ == 0 and DevBot(msg) then 
if database:get(bot_id.."Relax:Status:Bc") and not DevRelax(msg) then 
send(msg.chat_id_, msg.id_,"- الاذاعة معطلة من المطور الاساسي عمري .")
return false
end
database:setex(bot_id.."Relax:Relax:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"- دزلي ايشي عمري ~ { ملصق, متحركة, صورة, رسالة }\n- دز الغاء اذا بطلت يحلو . ") 
return false
end  
if text=="اذاعة بالتثبيت" and msg.reply_to_message_id_ == 0 and DevBot(msg) then 
if database:get(bot_id.."Relax:Status:Bc") and not DevRelax(msg) then 
send(msg.chat_id_, msg.id_,"- الاذاعة معطلة من المطور الاساسي عمري .")
return false
end
database:setex(bot_id.."Relax:Relax:Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"- دزلي ايشي عمري ~ { ملصق, متحركة, صورة, رسالة }\n- اذا بطلت دز الغاء يحلو .") 
return false
end  
if text=="اذاعة بالتوجيه" and msg.reply_to_message_id_ == 0  and DevBot(msg) then 
if database:get(bot_id.."Relax:Status:Bc") and not DevRelax(msg) then 
send(msg.chat_id_, msg.id_,"- الاذاعة معطلة من المطور الاساسي عمري .")
return false
end
database:setex(bot_id.."Relax:Relax:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"- دز التوجيه يحلو .") 
return false
end 
if text=="اذاعة بالتوجيه خاص" and msg.reply_to_message_id_ == 0  and DevBot(msg) then 
if database:get(bot_id.."Relax:Status:Bc") and not DevRelax(msg) then 
send(msg.chat_id_, msg.id_,"- الاذاعة معطلة من المطور الاساسي عمري .")
return false
end
database:setex(bot_id.."Relax:Relax:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"- دز التوجيه يحلو .") 
return false
end 

if text == "تفعيل الاذاعة" and DevRelax(msg) then  
database:del(bot_id.."Relax:Status:Bc") 
send(msg.chat_id_, msg.id_,"\n- تم تفعيل الاذاعة عمري ." ) 
return false
end 
if text == "تعطيل الاذاعة" and DevRelax(msg) then  
database:set(bot_id.."Relax:Status:Bc",true) 
send(msg.chat_id_, msg.id_,"\n- تم تعطيل الاذاعة يحلو .") 
return false
end 

if text == "الاعدادات" and Addictive(msg) then    
if database:get(bot_id.."Relax:lockpin"..msg.chat_id_) then    
lock_pin = "✓"
else 
lock_pin = "✘"    
end
if database:get(bot_id.."Relax:Lock:tagservr"..msg.chat_id_) then    
lock_tagservr = "✓"
else 
lock_tagservr = "✘"    
end
if database:get(bot_id.."Relax:Lock:text"..msg.chat_id_) then    
lock_text = "✓"
else 
lock_text = "✘"    
end
if database:get(bot_id.."Relax:Lock:AddMempar"..msg.chat_id_) == "kick" then
lock_add = "✓"
else 
lock_add = "✘"    
end    
if database:get(bot_id.."Relax:Lock:Join"..msg.chat_id_) == "kick" then
lock_join = "✓"
else 
lock_join = "✘"    
end    
if database:get(bot_id.."Relax:Lock:edit"..msg.chat_id_) then    
lock_edit = "✓"
else 
lock_edit = "✘"    
end
if database:get(bot_id.."Relax:Get:Welcome:Group"..msg.chat_id_) then
welcome = "✓"
else 
welcome = "✘"    
end
if database:hget(bot_id.."Relax:flooding:settings:"..msg.chat_id_, "flood") == "kick" then     
flood = "بالطرد"     
elseif database:hget(bot_id.."Relax:flooding:settings:"..msg.chat_id_,"flood") == "keed" then     
flood = "بالتقييد"     
elseif database:hget(bot_id.."Relax:flooding:settings:"..msg.chat_id_,"flood") == "mute" then     
flood = "بالكتم"           
elseif database:hget(bot_id.."Relax:flooding:settings:"..msg.chat_id_,"flood") == "del" then     
flood = "بالمسح"           
else     
flood = "✘"     
end
if database:get(bot_id.."Relax:Lock:Photo"..msg.chat_id_) == "del" then
lock_photo = "✓" 
elseif database:get(bot_id.."Relax:Lock:Photo"..msg.chat_id_) == "ked" then 
lock_photo = "بالتقييد"   
elseif database:get(bot_id.."Relax:Lock:Photo"..msg.chat_id_) == "ktm" then 
lock_photo = "بالكتم"    
elseif database:get(bot_id.."Relax:Lock:Photo"..msg.chat_id_) == "kick" then 
lock_photo = "بالطرد"   
else
lock_photo = "✘"   
end    
if database:get(bot_id.."Relax:Lock:Contact"..msg.chat_id_) == "del" then
lock_phon = "✓" 
elseif database:get(bot_id.."Relax:Lock:Contact"..msg.chat_id_) == "ked" then 
lock_phon = "بالتقييد"    
elseif database:get(bot_id.."Relax:Lock:Contact"..msg.chat_id_) == "ktm" then 
lock_phon = "بالكتم"    
elseif database:get(bot_id.."Relax:Lock:Contact"..msg.chat_id_) == "kick" then 
lock_phon = "بالطرد"    
else
lock_phon = "✘"    
end    
if database:get(bot_id.."Relax:Lock:Link"..msg.chat_id_) == "del" then
lock_links = "✓"
elseif database:get(bot_id.."Relax:Lock:Link"..msg.chat_id_) == "ked" then
lock_links = "بالتقييد"    
elseif database:get(bot_id.."Relax:Lock:Link"..msg.chat_id_) == "ktm" then
lock_links = "بالكتم"    
elseif database:get(bot_id.."Relax:Lock:Link"..msg.chat_id_) == "kick" then
lock_links = "بالطرد"    
else
lock_links = "✘"    
end
if database:get(bot_id.."Relax:Lock:Cmd"..msg.chat_id_) == "del" then
lock_cmds = "✓"
elseif database:get(bot_id.."Relax:Lock:Cmd"..msg.chat_id_) == "ked" then
lock_cmds = "بالتقييد"    
elseif database:get(bot_id.."Relax:Lock:Cmd"..msg.chat_id_) == "ktm" then
lock_cmds = "بالكتم"   
elseif database:get(bot_id.."Relax:Lock:Cmd"..msg.chat_id_) == "kick" then
lock_cmds = "بالطرد"    
else
lock_cmds = "✘"    
end
if database:get(bot_id.."Relax:Lock:User:Name"..msg.chat_id_) == "del" then
lock_user = "✓"
elseif database:get(bot_id.."Relax:Lock:User:Name"..msg.chat_id_) == "ked" then
lock_user = "بالتقييد"    
elseif database:get(bot_id.."Relax:Lock:User:Name"..msg.chat_id_) == "ktm" then
lock_user = "بالكتم"    
elseif database:get(bot_id.."Relax:Lock:User:Name"..msg.chat_id_) == "kick" then
lock_user = "بالطرد"    
else
lock_user = "✘"    
end
if database:get(bot_id.."Relax:Lock:hashtak"..msg.chat_id_) == "del" then
lock_hash = "✓"
elseif database:get(bot_id.."Relax:Lock:hashtak"..msg.chat_id_) == "ked" then 
lock_hash = "بالتقييد"    
elseif database:get(bot_id.."Relax:Lock:hashtak"..msg.chat_id_) == "ktm" then 
lock_hash = "بالكتم"    
elseif database:get(bot_id.."Relax:Lock:hashtak"..msg.chat_id_) == "kick" then 
lock_hash = "بالطرد"    
else
lock_hash = "✘"    
end
if database:get(bot_id.."Relax:Lock:vico"..msg.chat_id_) == "del" then
lock_muse = "✓"
elseif database:get(bot_id.."Relax:Lock:vico"..msg.chat_id_) == "ked" then 
lock_muse = "بالتقييد"    
elseif database:get(bot_id.."Relax:Lock:vico"..msg.chat_id_) == "ktm" then 
lock_muse = "بالكتم"    
elseif database:get(bot_id.."Relax:Lock:vico"..msg.chat_id_) == "kick" then 
lock_muse = "بالطرد"    
else
lock_muse = "✘"    
end 
if database:get(bot_id.."Relax:Lock:Video"..msg.chat_id_) == "del" then
lock_ved = "✓"
elseif database:get(bot_id.."Relax:Lock:Video"..msg.chat_id_) == "ked" then 
lock_ved = "بالتقييد"    
elseif database:get(bot_id.."Relax:Lock:Video"..msg.chat_id_) == "ktm" then 
lock_ved = "بالكتم"    
elseif database:get(bot_id.."Relax:Lock:Video"..msg.chat_id_) == "kick" then 
lock_ved = "بالطرد"    
else
lock_ved = "✘"    
end
if database:get(bot_id.."Relax:Lock:Animation"..msg.chat_id_) == "del" then
lock_gif = "✓"
elseif database:get(bot_id.."Relax:Lock:Animation"..msg.chat_id_) == "ked" then 
lock_gif = "بالتقييد"    
elseif database:get(bot_id.."Relax:Lock:Animation"..msg.chat_id_) == "ktm" then 
lock_gif = "بالكتم"    
elseif database:get(bot_id.."Relax:Lock:Animation"..msg.chat_id_) == "kick" then 
lock_gif = "بالطرد"    
else
lock_gif = "✘"    
end
if database:get(bot_id.."Relax:Lock:Sticker"..msg.chat_id_) == "del" then
lock_ste = "✓"
elseif database:get(bot_id.."Relax:Lock:Sticker"..msg.chat_id_) == "ked" then 
lock_ste = "بالتقييد "    
elseif database:get(bot_id.."Relax:Lock:Sticker"..msg.chat_id_) == "ktm" then 
lock_ste = "بالكتم "    
elseif database:get(bot_id.."Relax:Lock:Sticker"..msg.chat_id_) == "kick" then 
lock_ste = "بالطرد"    
else
lock_ste = "✘"    
end
if database:get(bot_id.."Relax:Lock:geam"..msg.chat_id_) == "del" then
lock_geam = "✓"
elseif database:get(bot_id.."Relax:Lock:geam"..msg.chat_id_) == "ked" then 
lock_geam = "بالتقييد"    
elseif database:get(bot_id.."Relax:Lock:geam"..msg.chat_id_) == "ktm" then 
lock_geam = "بالكتم"    
elseif database:get(bot_id.."Relax:Lock:geam"..msg.chat_id_) == "kick" then 
lock_geam = "بالطرد"    
else
lock_geam = "✘"    
end    
if database:get(bot_id.."Relax:Lock:vico"..msg.chat_id_) == "del" then
lock_vico = "✓"
elseif database:get(bot_id.."Relax:Lock:vico"..msg.chat_id_) == "ked" then 
lock_vico = "بالتقييد"    
elseif database:get(bot_id.."Relax:Lock:vico"..msg.chat_id_) == "ktm" then 
lock_vico = "بالكتم"    
elseif database:get(bot_id.."Relax:Lock:vico"..msg.chat_id_) == "kick" then 
lock_vico = "بالطرد"    
else
lock_vico = "✘"    
end    
if database:get(bot_id.."Relax:Lock:Keyboard"..msg.chat_id_) == "del" then
lock_inlin = "✓"
elseif database:get(bot_id.."Relax:Lock:Keyboard"..msg.chat_id_) == "ked" then 
lock_inlin = "بالتقييد"
elseif database:get(bot_id.."Relax:Lock:Keyboard"..msg.chat_id_) == "ktm" then 
lock_inlin = "بالكتم"    
elseif database:get(bot_id.."Relax:Lock:Keyboard"..msg.chat_id_) == "kick" then 
lock_inlin = "بالطرد"
else
lock_inlin = "✘"
end
if database:get(bot_id.."Relax:Lock:forward"..msg.chat_id_) == "del" then
lock_fwd = "✓"
elseif database:get(bot_id.."Relax:Lock:forward"..msg.chat_id_) == "ked" then 
lock_fwd = "بالتقييد"    
elseif database:get(bot_id.."Relax:Lock:forward"..msg.chat_id_) == "ktm" then 
lock_fwd = "بالكتم"    
elseif database:get(bot_id.."Relax:Lock:forward"..msg.chat_id_) == "kick" then 
lock_fwd = "بالطرد"    
else
lock_fwd = "✘"    
end    
if database:get(bot_id.."Relax:Lock:Document"..msg.chat_id_) == "del" then
lock_file = "✓"
elseif database:get(bot_id.."Relax:Lock:Document"..msg.chat_id_) == "ked" then 
lock_file = "بالتقييد"    
elseif database:get(bot_id.."Relax:Lock:Document"..msg.chat_id_) == "ktm" then 
lock_file = "بالكتم"    
elseif database:get(bot_id.."Relax:Lock:Document"..msg.chat_id_) == "kick" then 
lock_file = "بالطرد"    
else
lock_file = "✘"    
end    
if database:get(bot_id.."Relax:Lock:Unsupported"..msg.chat_id_) == "del" then
lock_self = "✓"
elseif database:get(bot_id.."Relax:Lock:Unsupported"..msg.chat_id_) == "ked" then 
lock_self = "بالتقييد"    
elseif database:get(bot_id.."Relax:Lock:Unsupported"..msg.chat_id_) == "ktm" then 
lock_self = "بالكتم"    
elseif database:get(bot_id.."Relax:Lock:Unsupported"..msg.chat_id_) == "kick" then 
lock_self = "بالطرد"    
else
lock_self = "✘"    
end
if database:get(bot_id.."Relax:Lock:Bot:kick"..msg.chat_id_) == "del" then
lock_bots = "✓"
elseif database:get(bot_id.."Relax:Lock:Bot:kick"..msg.chat_id_) == "ked" then
lock_bots = "بالتقييد"   
elseif database:get(bot_id.."Relax:Lock:Bot:kick"..msg.chat_id_) == "kick" then
lock_bots = "بالطرد"    
else
lock_bots = "✘"    
end
if database:get(bot_id.."Relax:Lock:Markdaun"..msg.chat_id_) == "del" then
lock_mark = "✓"
elseif database:get(bot_id.."Relax:Lock:Markdaun"..msg.chat_id_) == "ked" then 
lock_mark = "بالتقييد"    
elseif database:get(bot_id.."Relax:Lock:Markdaun"..msg.chat_id_) == "ktm" then 
lock_mark = "بالكتم"    
elseif database:get(bot_id.."Relax:Lock:Markdaun"..msg.chat_id_) == "kick" then 
lock_mark = "بالطرد"    
else
lock_mark = "✘"    
end
if database:get(bot_id.."Relax:Lock:Spam"..msg.chat_id_) == "del" then    
lock_spam = "✓"
elseif database:get(bot_id.."Relax:Lock:Spam"..msg.chat_id_) == "ked" then 
lock_spam = "بالتقييد"    
elseif database:get(bot_id.."Relax:Lock:Spam"..msg.chat_id_) == "ktm" then 
lock_spam = "بالكتم"    
elseif database:get(bot_id.."Relax:Lock:Spam"..msg.chat_id_) == "kick" then 
lock_spam = "بالطرد"    
else
lock_spam = "✘"    
end        
if not database:get(bot_id.."Relax:Reply:Manager"..msg.chat_id_) then
rdmder = "✓"
else
rdmder = "✘"
end
if not database:get(bot_id.."Relax:Reply:Sudo"..msg.chat_id_) then
rdsudo = "✓"
else
rdsudo = "✘"
end
if not database:get(bot_id.."Relax:Lock:ID:Bot"..msg.chat_id_)  then
idgp = "✓"
else
idgp = "✘"
end
if not database:get(bot_id.."Relax:Lock:ID:Bot:Photo"..msg.chat_id_) then
idph = "✓"
else
idph = "✘"
end
if not database:get(bot_id.."Relax:Lock:kick"..msg.chat_id_)  then
setadd = "✓"
else
setadd = "✘"
end
if not database:get(bot_id.."Relax:Lock:Add:Bot"..msg.chat_id_)  then
banm = "✓"
else
banm = "✘"
end
if not database:get(bot_id.."Relax:Kick:Me"..msg.chat_id_) then
kickme = "✓"
else
kickme = "✘"
end
Num_Flood = database:hget(bot_id.."Relax:flooding:settings:"..msg.chat_id_,"floodmax") or 0
local text = 
"*\n- اعدادات الكروب ."..
"\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ "..
"\n- علامة ال {✓} تعني مفعل"..
"\n- علامة ال {✘} تعني معطل"..
"\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ "..
"\n- الروابط » "..lock_links..
"\n".."- المعرفات » "..lock_user..
"\n".."- التاك » "..lock_hash..
"\n".."- البوتات » "..lock_bots..
"\n".."- التوجيه » "..lock_fwd..
"\n".."- التثبيت » "..lock_pin..
"\n".."- الاشعارات » "..lock_tagservr..
"\n".."- الماركدون » "..lock_mark..
"\n".."- التعديل » "..lock_edit..
"\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ "..
"\n".."- الكلايش » "..lock_spam..
"\n".."- الكيبورد » "..lock_inlin..
"\n".."- الاغاني » "..lock_vico..
"\n".."- المتحركة » "..lock_gif..
"\n".."- الملفات » "..lock_file..
"\n".."- الدردشة » "..lock_text..
"\n".."- الفيديو » "..lock_ved..
"\n".."- الصور » "..lock_photo..
"\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ "..
"\n".."- الصوت » "..lock_muse..
"\n".."- الملصقات » "..lock_ste..
"\n".."- الجهات » "..lock_phon..
"\n".."- الدخول » "..lock_join..
"\n".."- الاضافة » "..lock_add..
"\n".."- الالعاب » "..lock_geam..
"\n".."- التكرار » "..flood..
"\n".."- الترحيب » "..welcome..
"\n".."- عدد التكرار » "..Num_Flood..
"\n\n.*"
send(msg.chat_id_, msg.id_,text)     
end    
if text == 'تفعيل الايدي' and Owner(msg) then   
database:del(bot_id..'Relax:Lock:ID:Bot'..msg.chat_id_) 
send(msg.chat_id_, msg.id_,'- تم تفعيل الايدي .') 
end
if text == 'تعطيل الايدي' and Owner(msg) then  
database:set(bot_id..'Relax:Lock:ID:Bot'..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,'- تم تعطيل الايدي .') 
end
if text == 'تفعيل الايدي بالصورة' and Owner(msg) then   
database:del(bot_id..'Relax:Lock:ID:Bot:Photo'..msg.chat_id_) 
send(msg.chat_id_, msg.id_,'- تم تفعيل الايدي بالصورة .') 
end
if text == 'تعطيل الايدي بالصورة' and Owner(msg) then  
database:set(bot_id..'Relax:Lock:ID:Bot:Photo'..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,'- تم تعطيل الايدي بالصورة .') 
end
if text == 'تعيين الايدي' and Owner(msg) then
database:setex(bot_id.."Relax:Set:Id:Gp"..msg.chat_id_..""..msg.sender_user_id_,240,true)  
local Text= [[
- دز كليشة الايدي الجديدة عمري .
- تكدر تخلي ذني بالكليشة .
- `#username` => المعرف .
- `#msgs` => عدد الرسائل .
- `#photos` => - عدد الصور .
- `#id` => الايدي .
- `#auto` => التفاعل .
- `#stast` => الرتبة .
- `#edit` => عدد الرسائل المعدلة ( السحكات ) .
- `#game` => المجوهرات .
- `#AddMem` => عدد الجهات .
- `#Description` => تعليق الصوره .
]]
send(msg.chat_id_, msg.id_,Text)
return false  
end 
if text == 'حذف الايدي' or text == 'مسح الايدي' then
if Owner(msg) then
database:del(bot_id.."Relax:Klesh:Id:Bot"..msg.chat_id_)
send(msg.chat_id_, msg.id_, '- تم حذف كليشة الايدي .')
end
return false  
end 

if database:get(bot_id.."Relax:Set:Id:Gp"..msg.chat_id_..""..msg.sender_user_id_) then 
if text == 'الغاء' then 
send(msg.chat_id_, msg.id_,"- تم الغاء تعيين الايدي .") 
database:del(bot_id.."Relax:Set:Id:Gp"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
database:del(bot_id.."Relax:Set:Id:Gp"..msg.chat_id_..""..msg.sender_user_id_) 
database:set(bot_id.."Relax:Klesh:Id:Bot"..msg.chat_id_,text:match("(.*)"))
send(msg.chat_id_, msg.id_,'- تم تعيين الايدي .')    
end

if text == 'ايدي' and tonumber(msg.reply_to_message_id_) == 0 and not database:get(bot_id..'Relax:Lock:ID:Bot'..msg.chat_id_) then
if not database:sismember(bot_id..'Relax:Spam:Group'..msg.sender_user_id_,text) then
database:sadd(bot_id.."Relax:Spam:Group"..msg.sender_user_id_,text) 
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = msg.sender_user_id_,offset_ = 0,limit_ = 1},function(extra,BROK,success) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ then
UserName_User = '@'..data.username_
else
UserName_User = 'لا يوجد'
end
local Id = msg.sender_user_id_
local NumMsg = database:get(bot_id..'Relax:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(Id,msg.chat_id_)
local message_edit = database:get(bot_id..'Relax:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local Num_Games = database:get(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_) or 0
local Add_Mem = database:get(bot_id.."Relax:Add:Memp"..msg.chat_id_..":"..msg.sender_user_id_) or 0
local Total_Photp = (BROK.total_count_ or 0)
local Texting = {
'وف الحات',
"دك كيك",
"كرشت عليك",
"ممكن شوي عمري",
"تشقق",
"مو بشر ضيم",
}
local Description = Texting[math.random(#Texting)]
local get_id = database:get(bot_id.."Relax:Klesh:Id:Bot"..msg.chat_id_)
if not database:get(bot_id..'Relax:Lock:ID:Bot:Photo'..msg.chat_id_) then
if BROK.photos_[0] then
if get_id then
local get_id = get_id:gsub('#AddMem',Add_Mem) 
local get_id = get_id:gsub('#id',Id) 
local get_id = get_id:gsub('#username',UserName_User) 
local get_id = get_id:gsub('#msgs',NumMsg) 
local get_id = get_id:gsub('#edit',message_edit) 
local get_id = get_id:gsub('#stast',Status_Gps) 
local get_id = get_id:gsub('#auto',TotalMsg) 
local get_id = get_id:gsub('#Description',Description) 
local get_id = get_id:gsub('#game',Num_Games) 
local get_id = get_id:gsub('#photos',Total_Photp) 
sendPhoto(msg.chat_id_,msg.id_,BROK.photos_[0].sizes_[1].photo_.persistent_id_,get_id)
else
sendPhoto(msg.chat_id_,msg.id_,BROK.photos_[0].sizes_[1].photo_.persistent_id_,'- '..Description..'\n- ID ~ '..Id..'\n- User ~ '..UserName_User..'\n- Rank ~ '..Status_Gps..'\n- Msgs ~ '..NumMsg..'\n- Edit Msgs ~ '..message_edit..' \n- interaction ~ '..TotalMsg..'\n- Jewelery ~ '..Num_Games)
end
else
send(msg.chat_id_, msg.id_,'- No Pic . \n'..'\n- User ~ '..UserName_User..'\n- Rank ~ '..Status_Gps..'\n- Msgs ~ '..NumMsg..'\n- Edit Msgs ~ '..message_edit..' \n- interaction ~ '..TotalMsg..'\n- Jewelery ~ '..Num_Games)
end
else
if get_id then
local get_id = get_id:gsub('#AddMem',Add_Mem) 
local get_id = get_id:gsub('#id',Id) 
local get_id = get_id:gsub('#username',UserName_User) 
local get_id = get_id:gsub('#msgs',NumMsg) 
local get_id = get_id:gsub('#edit',message_edit) 
local get_id = get_id:gsub('#stast',Status_Gps) 
local get_id = get_id:gsub('#auto',TotalMsg) 
local get_id = get_id:gsub('#Description',Description) 
local get_id = get_id:gsub('#game',Num_Games) 
local get_id = get_id:gsub('#photos',Total_Photp) 
send(msg.chat_id_, msg.id_,'['..get_id..']') 
else
send(msg.chat_id_, msg.id_,'\n- User ~ '..UserName_User..'\n- Rank ~ '..Status_Gps..'\n- Msgs ~ '..NumMsg..'\n- Edit Msgs ~ '..message_edit..' \n- interaction ~ '..TotalMsg..'\n- Jewelery ~ '..Num_Games) 
end
end
end,nil)   
end,nil)   
end
end
if text and text:match('^تنظيف (%d+)$') and DevRelaxe(msg) then    
local Number = tonumber(text:match('^تنظيف (%d+)$')) 
if Number > 1000 then 
send(msg.chat_id_, msg.id_,'- عمري اكبر عدد هو 1000 متكدر تنظف اكثر .') 
return false  
end  
local Message = msg.id_
for i=1,tonumber(Number) do
DeleteMessage(msg.chat_id_,{[0]=Message})
Message = Message - 1048576
end
send(msg.chat_id_, msg.id_,'تم تنظيف '..Number..' رسالة .')  
end

if text == 'ايدي' and tonumber(msg.reply_to_message_id_) > 0 and not database:get(bot_id..'Relax:Lock:ID:Bot'..msg.chat_id_) then
function Function_Relax(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
if data.first_name_ == false then
send(msg.chat_id_, msg.id_,'- الحساب محذوف يحلو .')
return false
end
if data.username_ then
UserName_User = '@'..data.username_
else
UserName_User = 'لا يوجد'
end
local Id = data.id_
local NumMsg = database:get(bot_id..'Relax:messageUser'..msg.chat_id_..':'..data.id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(Id,msg.chat_id_)
local message_edit = database:get(bot_id..'Relax:message_edit'..msg.chat_id_..data.id_) or 0
local Num_Games = database:get(bot_id.."aaaZaa:Msg_User"..msg.chat_id_..":"..data.id_) or 0
local Add_Mem = database:get(bot_id.."Relax:Add:Memp"..msg.chat_id_..":"..data.id_) or 0
send(msg.chat_id_, msg.id_,'- ID ~ '..Id..'\n- interaction ~ '..TotalMsg..'\n- Rank - '..Status_Gps..'\n- Edit Msgs ~ '..message_edit..'\n- Contacts - '..Add_Mem..'*') 
end,nil)   
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_Relax, nil)
return false
end

if text and text:match("^ايدي @(.*)$") and not database:get(bot_id..'Relax:Lock:ID:Bot'..msg.chat_id_) then
local username = text:match("^ايدي @(.*)$")
function Function_Relax(extra, result, success)
if result.id_ then
tdcli_function ({ID = "GetUser",user_id_ = result.id_},function(arg,data) 
if data.username_ then
UserName_User = '@'..data.username_
else
UserName_User = 'لا يوجد'
end
local Id = data.id_
local NumMsg = database:get(bot_id..'Relax:messageUser'..msg.chat_id_..':'..data.id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(Id,msg.chat_id_)
local message_edit = database:get(bot_id..'Relax:message_edit'..msg.chat_id_..data.id_) or 0
local Num_Games = database:get(bot_id.."aaaZaa:Msg_User"..msg.chat_id_..":"..data.id_) or 0
local Add_Mem = database:get(bot_id.."Relax:Add:Memp"..msg.chat_id_..":"..data.id_) or 0
send(msg.chat_id_, msg.id_,'- ID ~ '..Id..'\n- Msgs ~ '..NumMsg..'\n- User ~ ['..UserName_User..']\n- interaction ~ '..TotalMsg..'\- Rank ~ '..Status_Gps..'\n- Edit Msgs ~ '..message_edit..'\n- Contacts - '..Add_Mem..'') 
end,nil)   
else
send(msg.chat_id_, msg.id_,'👤┇لا يوجد حساب بهاذا المعرف')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_Relax, nil)
return false
end
if text == "سمايلات" or text == "سمايل" then
if database:get(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_) then
database:del(bot_id.."aaaZaa:Set:Sma"..msg.chat_id_)
Random = {"🍏","🍎","🍐","🍊","🍋","🍉","🍇","🍓","🍈","🍒","🍑","🍍","🥥","🥝","🍅","🍆","🥑","🥦","🥒","🌶","🌽","🥕","🥔","🥖","🥐","🍞","🥨","🍟","🧀","🥚","🍳","🥓","🥩","🍗","🍖","🌭","🍔","🍠","🍕","🥪","🥙","☕️","🍵","🥤","🍶","🍺","🍻","🏀","⚽️","🏈","⚾️","🎾","🏐","🏉","🎱","🏓","🏸","🥅","🎰","🎮","🎳","🎯","🎲","🎻","🎸","🎺","🥁","🎹","🎼","🎧","🎤","🎬","🎨","🎭","🎪","🎟","🎫","🎗","🏵","🎖","🏆","🥌","🛷","🚗","🚌","🏎","🚓","🚑","🚚","🚛","🚜","🇮🇶","⚔","🛡","🔮","🌡","💣","📌","📍","📓","📗","📂","📅","📪","📫","📬","📭","⏰","📺","🎚","☎️","📡"}
SM = Random[math.random(#Random)]
database:set(bot_id.."aaaZaa:Random:Sm"..msg.chat_id_,SM)
send(msg.chat_id_, msg.id_,"- اسرع واحد يدز هذا السمايل ~ {`"..SM.."`}")
return false
end
end
if text == ""..(database:get(bot_id.."aaaZaa:Random:Sm"..msg.chat_id_) or "").."" and not database:get(bot_id.."aaaZaa:Set:Sma"..msg.chat_id_) then
if not database:get(bot_id.."aaaZaa:Set:Sma"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,"- مبروك عمري انت فزت .\n- للعب مره اخرى دز ~{ سمايل , سمايلات }")
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."aaaZaa:Set:Sma"..msg.chat_id_,true)
return false
end 
if text == "الاسرع" or tect == "ترتيب" then
if database:get(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_) then
database:del(bot_id.."aaaZaa:Speed:Tr"..msg.chat_id_)
KlamSpeed = {"سحور","سياره","استقبال","قنفه","ايفون","بزونه","مطبخ","كرستيانو","دجاجه","مدرسه","الوان","غرفه","ثلاجه","كهوه","سفينه","العراق","محطه","طياره","رادار","منزل","مستشفى","كهرباء","تفاحه","اخطبوط","سلمون","فرنسا","برتقاله","تفاح","مطرقه","بتيته","لهانه","شباك","باص","سمكه","ذباب","تلفاز","حاسوب","انترنيت","ساحه","جسر"};
name = KlamSpeed[math.random(#KlamSpeed)]
database:set(bot_id.."aaaZaa:Klam:Speed"..msg.chat_id_,name)
name = string.gsub(name,"سحور","س ر و ح")
name = string.gsub(name,"سياره","ه ر س ي ا")
name = string.gsub(name,"استقبال","ل ب ا ت ق س ا")
name = string.gsub(name,"قنفه","ه ق ن ف")
name = string.gsub(name,"ايفون","و ن ف ا")
name = string.gsub(name,"بزونه","ز و ه ن")
name = string.gsub(name,"مطبخ","خ ب ط م")
name = string.gsub(name,"كرستيانو","س ت ا ن و ك ر ي")
name = string.gsub(name,"دجاجه","ج ج ا د ه")
name = string.gsub(name,"مدرسه","ه م د ر س")
name = string.gsub(name,"الوان","ن ا و ا ل")
name = string.gsub(name,"غرفه","غ ه ر ف")
name = string.gsub(name,"ثلاجه","ج ه ت ل ا")
name = string.gsub(name,"كهوه","ه ك ه و")
name = string.gsub(name,"سفينه","ه ن ف ي س")
name = string.gsub(name,"العراق","ق ع ا ل ر ا")
name = string.gsub(name,"محطه","ه ط م ح")
name = string.gsub(name,"طياره","ر ا ط ي ه")
name = string.gsub(name,"رادار","ر ا ر ا د")
name = string.gsub(name,"منزل","ن ز م ل")
name = string.gsub(name,"مستشفى","ى ش س ف ت م")
name = string.gsub(name,"كهرباء","ر ب ك ه ا ء")
name = string.gsub(name,"تفاحه","ح ه ا ت ف")
name = string.gsub(name,"اخطبوط","ط ب و ا خ ط")
name = string.gsub(name,"سلمون","ن م و ل س")
name = string.gsub(name,"فرنسا","ن ف ر س ا")
name = string.gsub(name,"برتقاله","ر ت ق ب ا ه ل")
name = string.gsub(name,"تفاح","ح ف ا ت")
name = string.gsub(name,"مطرقه","ه ط م ر ق")
name = string.gsub(name,"بتيته","ب ت ت ي ه")
name = string.gsub(name,"لهانه","ه ن ل ه ل")
name = string.gsub(name,"شباك","ب ش ا ك")
name = string.gsub(name,"باص","ص ا ب")
name = string.gsub(name,"سمكه","ك س م ه")
name = string.gsub(name,"ذباب","ب ا ب ذ")
name = string.gsub(name,"تلفاز","ت ف ل ز ا")
name = string.gsub(name,"حاسوب","س ا ح و ب")
name = string.gsub(name,"انترنيت","ا ت ن ر ن ي ت")
name = string.gsub(name,"ساحه","ح ا ه س")
name = string.gsub(name,"جسر","ر ج س")
send(msg.chat_id_, msg.id_,"- اسرع واحد يرتبها يحلوين ~ {"..name.."}")
return false
end
end
if text == ""..(database:get(bot_id.."aaaZaa:Klam:Speed"..msg.chat_id_) or "").."" and not database:get(bot_id.."aaaZaa:Speed:Tr"..msg.chat_id_) then
if not database:get(bot_id.."aaaZaa:Speed:Tr"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,"- مبروك عمري انت فزت . \n- للعب مره اخرى دز ~{ الاسرع , ترتيب }")
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."aaaZaa:Speed:Tr"..msg.chat_id_,true)
end 

if text == "حزوره" then
if database:get(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_) then
database:del(bot_id.."aaaZaa:Set:Hzora"..msg.chat_id_)
Hzora = {"الجرس","عقرب الساعه","السمك","المطر","5","الكتاب","البسمار","7","الكعبه","بيت الشعر","لهانه","انا","امي","الابره","الساعه","22","غلط","كم الساعه","البيتنجان","البيض","المرايه","الضوء","الهواء","الضل","العمر","القلم","المشط","الحفره","البحر","الثلج","الاسفنج","الصوت","بلم"};
name = Hzora[math.random(#Hzora)]
database:set(bot_id.."aaaZaa:Klam:Hzor"..msg.chat_id_,name)
name = string.gsub(name,"الجرس","شيئ اذا لمسته صرخ ما هوه ؟")
name = string.gsub(name,"عقرب الساعه","اخوان لا يستطيعان تمضيه اكثر من دقيقه معا فما هما ؟")
name = string.gsub(name,"السمك","ما هو الحيوان الذي لم يصعد الى سفينة نوح عليه السلام ؟")
name = string.gsub(name,"المطر","شيئ يسقط على رأسك من الاعلى ولا يجرحك فما هو ؟")
name = string.gsub(name,"5","ما العدد الذي اذا ضربته بنفسه واضفت عليه 5 يصبح ثلاثين ")
name = string.gsub(name,"الكتاب","ما الشيئ الذي له اوراق وليس له جذور ؟")
name = string.gsub(name,"البسمار","ما هو الشيئ الذي لا يمشي الا بالضرب ؟")
name = string.gsub(name,"7","عائله مؤلفه من 6 بنات واخ لكل منهن .فكم عدد افراد العائله ")
name = string.gsub(name,"الكعبه","ما هو الشيئ الموجود وسط مكة ؟")
name = string.gsub(name,"بيت الشعر","ما هو البيت الذي ليس فيه ابواب ولا نوافذ ؟ ")
name = string.gsub(name,"لهانه","وحده حلوه ومغروره تلبس مية تنوره .من هيه ؟ ")
name = string.gsub(name,"انا","ابن امك وابن ابيك وليس باختك ولا باخيك فمن يكون ؟")
name = string.gsub(name,"امي","اخت خالك وليست خالتك من تكون ؟ ")
name = string.gsub(name,"الابره","ما هو الشيئ الذي كلما خطا خطوه فقد شيئا من ذيله ؟ ")
name = string.gsub(name,"الساعه","ما هو الشيئ الذي يقول الصدق ولكنه اذا جاع كذب ؟")
name = string.gsub(name,"22","كم مره ينطبق عقربا الساعه على بعضهما في اليوم الواحد ")
name = string.gsub(name,"غلط","ما هي الكلمه الوحيده التي تلفض غلط دائما ؟ ")
name = string.gsub(name,"كم الساعه","ما هو السؤال الذي تختلف اجابته دائما ؟")
name = string.gsub(name,"البيتنجان","جسم اسود وقلب ابيض وراس اخظر فما هو ؟")
name = string.gsub(name,"البيض","ماهو الشيئ الذي اسمه على لونه ؟")
name = string.gsub(name,"المرايه","ارى كل شيئ من دون عيون من اكون ؟ ")
name = string.gsub(name,"الضوء","ما هو الشيئ الذي يخترق الزجاج ولا يكسره ؟")
name = string.gsub(name,"الهواء","ما هو الشيئ الذي يسير امامك ولا تراه ؟")
name = string.gsub(name,"الضل","ما هو الشيئ الذي يلاحقك اينما تذهب ؟ ")
name = string.gsub(name,"العمر","ما هو الشيء الذي كلما طال قصر ؟ ")
name = string.gsub(name,"القلم","ما هو الشيئ الذي يكتب ولا يقرأ ؟")
name = string.gsub(name,"المشط","له أسنان ولا يعض ما هو ؟ ")
name = string.gsub(name,"الحفره","ما هو الشيئ اذا أخذنا منه ازداد وكبر ؟")
name = string.gsub(name,"البحر","ما هو الشيئ الذي يرفع اثقال ولا يقدر يرفع مسمار ؟")
name = string.gsub(name,"الثلج","انا ابن الماء فان تركوني في الماء مت فمن انا ؟")
name = string.gsub(name,"الاسفنج","كلي ثقوب ومع ذالك احفض الماء فمن اكون ؟")
name = string.gsub(name,"الصوت","اسير بلا رجلين ولا ادخل الا بالاذنين فمن انا ؟")
name = string.gsub(name,"بلم","حامل ومحمول نصف ناشف ونصف مبلول فمن اكون ؟ ")
send(msg.chat_id_, msg.id_,"- اسرع واحد يحلها يحلوين  ↓\n {"..name.."}")
return false
end
end
if text == ""..(database:get(bot_id.."aaaZaa:Klam:Hzor"..msg.chat_id_) or "").."" and not database:get(bot_id.."aaaZaa:Set:Hzora"..msg.chat_id_) then
if not database:get(bot_id.."aaaZaa:Set:Hzora"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,"- مبروك عمري انت فزت . \n- للعب مره اخرى دز ~{ حزوره }")
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."aaaZaa:Set:Hzora"..msg.chat_id_,true)
end 

if text == "معاني" then
if database:get(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_) then
database:del(bot_id.."aaaZaa:Set:Maany"..msg.chat_id_)
Maany_Rand = {"قرد","دجاجه","بطريق","ضفدع","بومه","نحله","ديك","جمل","بقره","دولفين","تمساح","قرش","نمر","اخطبوط","سمكه","خفاش","اسد","فأر","ذئب","فراشه","عقرب","زرافه","قنفذ","تفاحه","باذنجان"}
name = Maany_Rand[math.random(#Maany_Rand)]
database:set(bot_id.."aaaZaa:Maany"..msg.chat_id_,name)
name = string.gsub(name,"قرد","🐒")
name = string.gsub(name,"دجاجه","🐔")
name = string.gsub(name,"بطريق","🐧")
name = string.gsub(name,"ضفدع","🐸")
name = string.gsub(name,"بومه","🦉")
name = string.gsub(name,"نحله","🐝")
name = string.gsub(name,"ديك","🐓")
name = string.gsub(name,"جمل","🐫")
name = string.gsub(name,"بقره","🐄")
name = string.gsub(name,"دولفين","🐬")
name = string.gsub(name,"تمساح","🐊")
name = string.gsub(name,"قرش","🦈")
name = string.gsub(name,"نمر","🐅")
name = string.gsub(name,"اخطبوط","🐙")
name = string.gsub(name,"سمكه","🐟")
name = string.gsub(name,"خفاش","🦇")
name = string.gsub(name,"اسد","🦁")
name = string.gsub(name,"فأر","🐭")
name = string.gsub(name,"ذئب","🐺")
name = string.gsub(name,"فراشه","🦋")
name = string.gsub(name,"عقرب","🦂")
name = string.gsub(name,"زرافه","🦒")
name = string.gsub(name,"قنفذ","🦔")
name = string.gsub(name,"تفاحه","🍎")
name = string.gsub(name,"باذنجان","🍆")
send(msg.chat_id_, msg.id_,"- اسرع واحد يدز معنى السمايل ~ {"..name.."}")
return false
end
end
if text == ""..(database:get(bot_id.."aaaZaa:Maany"..msg.chat_id_) or "").."" and not database:get(bot_id.."aaaZaa:Set:Maany"..msg.chat_id_) then
if not database:get(bot_id.."aaaZaa:Set:Maany"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,"- كفو عمري انت فزت .\n- للعب مره اخرى دز ~{ معاني }")
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."aaaZaa:Set:Maany"..msg.chat_id_,true)
end 
if text == "العكس" then
if database:get(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_) then
database:del(bot_id.."aaaZaa:Set:Aks"..msg.chat_id_)
katu = {"باي","فهمت","موزين","اسمعك","احبك","موحلو","نضيف","حاره","ناصي","جوه","سريع","ونسه","طويل","سمين","ضعيف","شريف","شجاع","رحت","عدل","نشيط","شبعان","موعطشان","خوش ولد","اني","هادئ"}
name = katu[math.random(#katu)]
database:set(bot_id.."aaaZaa:Set:Aks:Game"..msg.chat_id_,name)
name = string.gsub(name,"باي","هلو")
name = string.gsub(name,"فهمت","مافهمت")
name = string.gsub(name,"موزين","زين")
name = string.gsub(name,"اسمعك","ماسمعك")
name = string.gsub(name,"احبك","ماحبك")
name = string.gsub(name,"موحلو","حلو")
name = string.gsub(name,"نضيف","وصخ")
name = string.gsub(name,"حاره","بارده")
name = string.gsub(name,"ناصي","عالي")
name = string.gsub(name,"جوه","فوك")
name = string.gsub(name,"سريع","بطيء")
name = string.gsub(name,"ونسه","ضوجه")
name = string.gsub(name,"طويل","قزم")
name = string.gsub(name,"سمين","ضعيف")
name = string.gsub(name,"ضعيف","قوي")
name = string.gsub(name,"شريف","كواد")
name = string.gsub(name,"شجاع","جبان")
name = string.gsub(name,"رحت","اجيت")
name = string.gsub(name,"عدل","ميت")
name = string.gsub(name,"نشيط","كسول")
name = string.gsub(name,"شبعان","جوعان")
name = string.gsub(name,"موعطشان","عطشان")
name = string.gsub(name,"خوش ولد","موخوش ولد")
name = string.gsub(name,"اني","مطي")
name = string.gsub(name,"هادئ","عصبي")
send(msg.chat_id_, msg.id_,"- اسرع واحد يدز عكس كلمة ~ {"..name.."}")
return false
end
end
if text == ""..(database:get(bot_id.."aaaZaa:Set:Aks:Game"..msg.chat_id_) or "").."" and not database:get(bot_id.."aaaZaa:Set:Aks"..msg.chat_id_) then
if not database:get(bot_id.."aaaZaa:Set:Aks"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,"- كفو عمري انت فزت .\n♻┇للعب مره اخرى دز ~{ العكس }")
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."aaaZaa:Set:Aks"..msg.chat_id_,true)
end 

if database:get(bot_id.."aaaZaa:GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then
send(msg.chat_id_, msg.id_,"- عمري ميصير اكثر من 20 لازم بين ال1 وال20 .\n")
return false  end 
local GETNUM = database:get(bot_id.."aaaZaa:GAMES:NUM"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
database:del(bot_id.."aaaZaa:SADD:NUM"..msg.chat_id_..msg.sender_user_id_)
database:del(bot_id.."aaaZaa:GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_,5)  
send(msg.chat_id_, msg.id_,"- كفو عمري تخمينك صحيح .\n- تم اضافة { 5 } من النقاط \n")
elseif tonumber(NUM) ~= tonumber(GETNUM) then
database:incrby(bot_id.."aaaZaa:SADD:NUM"..msg.chat_id_..msg.sender_user_id_,1)
if tonumber(database:get(bot_id.."aaaZaa:SADD:NUM"..msg.chat_id_..msg.sender_user_id_)) >= 3 then
database:del(bot_id.."aaaZaa:SADD:NUM"..msg.chat_id_..msg.sender_user_id_)
database:del(bot_id.."aaaZaa:GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
send(msg.chat_id_, msg.id_,"- للاسف خسرت يحلو . \n- عوضها بلجايات .\n- الرقم الصحيح { "..GETNUM.." }")
else
send(msg.chat_id_, msg.id_,"- تخمينك غلط يحلو . \n- دز بعد رقم اخمنه .")
end
end
end
end
if text == "خمن" or text == "تخمين" then   
if database:get(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_) then
Num = math.random(1,20)
database:set(bot_id.."aaaZaa:GAMES:NUM"..msg.chat_id_,Num) 
send(msg.chat_id_, msg.id_,"\n- هلا يحلو بلعبة التخمين . :\nٴ━━━━━━━━━━\n".."- عندك 3 محاولات تخمن بيها الرقم . \n\n".."- الرقم الي تخمنه بين ال1 وال20 شوفني مهارتك يحلو .")
database:setex(bot_id.."aaaZaa:GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
end

if database:get(bot_id.."aaaZaa:SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 6 then
send(msg.chat_id_, msg.id_,"- عمري الحات مكو بس 6 خيارات .\n")
return false  end 
local GETNUM = database:get(bot_id.."aaaZaa:Games:Bat"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
database:del(bot_id.."aaaZaa:SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
send(msg.chat_id_, msg.id_,"- كفو يحلو طلعت المحيبس وفزت . { "..NUM.." }\n- تم اضافة 3 نقاط الك . ")
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_,3)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
database:del(bot_id.."aaaZaa:SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
send(msg.chat_id_, msg.id_,"- للاسف خسرت حياتي . \n- المحيبس بلأيد رقم ~ { "..GETNUM.." }\n- دز محيبس والعب بعد .")
end
end
end

if text == "محيبس" or text == "بات" then
if database:get(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_) then   
Num = math.random(1,6)
database:set(bot_id.."aaaZaa:Games:Bat"..msg.chat_id_,Num) 
TEST = [[
➀       ➁     ➂      ➃      ➄     ➅
↓      ↓     ↓      ↓     ↓     ↓
👊 ‹› 👊 ‹› 👊 ‹› 👊 ‹› 👊 ‹› 👊
- اختار رقم من ال1 لل6 عمري .
- الي يفوز يحصل 3 نقاط .
]]
send(msg.chat_id_, msg.id_,TEST)
database:setex(bot_id.."aaaZaa:SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
end

if text == "المختلف" then
if database:get(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_) then
mktlf = {"😸","☠","🐼","🐇","🌑","🌚","⭐️","✨","⛈","🌥","⛄️","👨‍🔬","👨‍💻","👨‍🔧","🧚‍♀","🧜‍♂","🧝‍♂","🙍‍♂","🧖‍♂","👬","🕒","🕤","⌛️","📅",};
name = mktlf[math.random(#mktlf)]
database:del(bot_id.."aaaZaa:Set:Moktlf:Bot"..msg.chat_id_)
database:set(bot_id.."aaaZaa::Set:Moktlf"..msg.chat_id_,name)
name = string.gsub(name,"😸","😹😹😹😹😹😹😹😹😸😹😹😹😹")
name = string.gsub(name,"☠","💀💀💀💀💀💀💀☠💀💀💀💀💀")
name = string.gsub(name,"🐼","👻👻👻🐼👻👻👻👻👻👻👻")
name = string.gsub(name,"🐇","🕊🕊🕊🕊🕊🐇🕊🕊🕊🕊")
name = string.gsub(name,"🌑","🌚🌚🌚🌚🌚🌑🌚🌚🌚")
name = string.gsub(name,"🌚","🌑🌑🌑🌑🌑🌚🌑🌑🌑")
name = string.gsub(name,"⭐️","🌟🌟🌟🌟🌟🌟🌟🌟⭐️🌟🌟🌟")
name = string.gsub(name,"✨","💫💫💫💫💫✨💫💫💫💫")
name = string.gsub(name,"⛈","🌨🌨🌨🌨🌨⛈🌨🌨🌨🌨")
name = string.gsub(name,"🌥","⛅️⛅️⛅️⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️")
name = string.gsub(name,"⛄️","☃☃☃☃☃☃⛄️☃☃☃☃")
name = string.gsub(name,"👨‍🔬","👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬👩‍🔬")
name = string.gsub(name,"👨‍💻","👩‍💻👩‍💻👩‍‍💻👩‍‍💻👩‍💻👨‍💻👩‍💻👩‍💻👩‍💻")
name = string.gsub(name,"👨‍🔧","👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧")
name = string.gsub(name,"👩‍🍳","👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳👨‍🍳")
name = string.gsub(name,"🧚‍♀","🧚‍♂🧚‍♂🧚‍♂🧚‍♂🧚‍♀🧚‍♂🧚‍♂")
name = string.gsub(name,"🧜‍♂","🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧚‍♂🧜‍♀🧜‍♀🧜‍♀")
name = string.gsub(name,"🧝‍♂","🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♂🧝‍♀🧝‍♀🧝‍♀")
name = string.gsub(name,"🙍‍♂️","🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙍‍♂️🙎‍♂️🙎‍♂️🙎‍♂️")
name = string.gsub(name,"🧖‍♂️","🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♂️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️")
name = string.gsub(name,"👬","👭👭👭👭👭👬👭👭👭")
name = string.gsub(name,"👨‍👨‍👧","👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦")
name = string.gsub(name,"🕒","🕒🕒🕒🕒🕒🕒🕓🕒🕒🕒")
name = string.gsub(name,"🕤","🕥🕥🕥🕥🕥🕤🕥🕥🕥")
name = string.gsub(name,"⌛️","⏳⏳⏳⏳⏳⏳⌛️⏳⏳")
name = string.gsub(name,"📅","📆📆📆📆📆📆📅📆📆")
send(msg.chat_id_, msg.id_,"- اسرع واحد يدز المختلف ~ {"..name.."}")
return false
end
end
if text == ""..(database:get(bot_id.."aaaZaa::Set:Moktlf"..msg.chat_id_) or "").."" then 
if not database:get(bot_id.."aaaZaa:Set:Moktlf:Bot"..msg.chat_id_) then 
database:del(bot_id.."aaaZaa::Set:Moktlf"..msg.chat_id_)
send(msg.chat_id_, msg.id_,"- كفو عمري انت فزت . \n- للعب مره اخرى دز ~{ المختلف }")
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."aaaZaa:Set:Moktlf:Bot"..msg.chat_id_,true)
end
if text == "اسئلة" then
if database:get(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_) then
mthal = {"جوز","ضراطه","الحبل","الحافي","شقره","بيدك","سلايه","النخله","الخيل","حداد","المبلل","يركص","قرد","العنب","العمه","الخبز","بالحصاد","شهر","شكه","يكحله",};
name = mthal[math.random(#mthal)]
database:set(bot_id.."aaaZaa:Set:Amth"..msg.chat_id_,name)
database:del(bot_id.."aaaZaa:Set:Amth:Bot"..msg.chat_id_)
name = string.gsub(name,"جوز","ينطي____للماعده سنون")
name = string.gsub(name,"ضراطه","الي يسوق المطي يتحمل___")
name = string.gsub(name,"بيدك","اكل___محد يفيدك")
name = string.gsub(name,"الحافي","تجدي من___نعال")
name = string.gsub(name,"شقره","مع الخيل يا___")
name = string.gsub(name,"النخله","الطول طول___والعقل عقل الصخلة")
name = string.gsub(name,"سلايه","بالوجه امراية وبالظهر___")
name = string.gsub(name,"الخيل","من قلة___شدو على الچلاب سروج")
name = string.gsub(name,"حداد","موكل من صخم وجهه كال آني___")
name = string.gsub(name,"المبلل","___ما يخاف من المطر")
name = string.gsub(name,"الحبل","اللي تلدغة الحية يخاف من جرة___")
name = string.gsub(name,"يركص","المايعرف___يكول الكاع عوجه")
name = string.gsub(name,"العنب","المايلوح___يكول حامض")
name = string.gsub(name,"العمه","___إذا حبت الچنة ابليس يدخل الجنة")
name = string.gsub(name,"الخبز","انطي___للخباز حتى لو ياكل نصه")
name = string.gsub(name,"باحصاد","اسمة___ومنجله مكسور")
name = string.gsub(name,"شهر","امشي__ولا تعبر نهر")
name = string.gsub(name,"شكه","يامن تعب يامن__يا من على الحاضر لكة")
name = string.gsub(name,"القرد","__بعين امه غزال")
name = string.gsub(name,"يكحله","اجه___عماها")
send(msg.chat_id_, msg.id_,"- اسرع واحد يكمل المثل ~ {"..name.."}")
return false
end
end
if text == ""..(database:get(bot_id.."aaaZaa:Set:Amth"..msg.chat_id_) or "").."" then 
if not database:get(bot_id.."aaaZaa:Set:Amth:Bot"..msg.chat_id_) then 
database:del(bot_id.."aaaZaa:Set:Amth"..msg.chat_id_)
send(msg.chat_id_, msg.id_,"- كفو عمري انت فزت . \n♻┇للعب مره اخرى دز ~{ امثله }")
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."aaaZaa:Set:Amth:Bot"..msg.chat_id_,true)
end
if text == "تعطيل الالعاب" and Owner(msg) then   
database:del(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"\n- تم تعطيل الالعاب .") 
end
if text == "تفعيل الالعاب" and Owner(msg) then  
database:set(bot_id.."aaaZaa:Lock:Games"..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,"\n- تم تفعيل الالعاب .") 
end
if text == 'الالعاب' then
Teext = [[
- قائمة الالعاب .
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ 
- لعبة المحيبس » بات
- لعبة التخمين » خمن
- لعبه الاسرع » الاسرع
- لعبة السمايلات » سمايلات
- لعبة المختلف » المختلف
- لعبة الامثله » اسئلة
- لعبة العكس » العكس 
- لعبة الحزوره » حزوره
- لعبة المعاني » معاني
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ 
- مجوهراتي » لعرض عدد الارباح
- بيع مجوهراتي + العدد » لستبدال كل مجوهره ب50 رساله
]]
send(msg.chat_id_, msg.id_,Teext) 
end
if text == 'رسائلي' then
local nummsg = database:get(bot_id..'Relax:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 1
local Text = '- عدد رسائلك '..nummsg..'*'
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'مسح رسائلي' then
database:del(bot_id..'Relax:messageUser'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = '- تم مسح جميع رسائلك .'
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'سحكاتي' or text == 'تعديلاتي' then
local edit = database:get(bot_id..'Relax:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local Text = '- عدد رسائلك المعدلة  '..edit..''
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'مسح سحكاتي' or text == 'مسح تعديلاتي' then
database:del(bot_id..'Relax:message_edit'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = '- تم مسح جميع رسائلك المعدلة .'
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'جهاتي' then
local addmem = database:get(bot_id.."Relax:Add:Memp"..msg.chat_id_..":"..msg.sender_user_id_) or 0
local Text = '- عدد جهاتك  '..addmem..''
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'مسح جهاتي' then
database:del(bot_id..'Relax:Add:Memp'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = '- تم مسح جميع جهاتك .'
send(msg.chat_id_, msg.id_,Text) 
end

if text == "مجوهراتي" then 
local Num = database:get(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_) or 0
if Num == 0 then 
Text = "- معندك ولا مجوهرة يحلو ."
else
Text = "- عدد مجوهراتك { "..Num.." } مجوهرة "
end
send(msg.chat_id_, msg.id_,Text) 
end
if text and text:match("^بيع مجوهراتي (%d+)$") then
local NUMPY = text:match("^بيع مجوهراتي (%d+)$") 
if tonumber(NUMPY) == tonumber(0) then
send(msg.chat_id_,msg.id_,"\n- لا استطيع بيع اقل من 1 .") 
return false 
end
if tonumber(database:get(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_)) == tonumber(0) then
send(msg.chat_id_,msg.id_,"- معندك ولا جوهرة عمري . \n- اذا تريد تحصل مجوهرات . \n- دز *الالعاب* وجمع مجوهرات . ") 
else
local NUM_GAMES = database:get(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_)
if tonumber(NUMPY) > tonumber(NUM_GAMES) then
send(msg.chat_id_,msg.id_,"\n- معندك هلكد مجوهرات يحلو . \n- اذا تريد تزيد مجوهراتك . \n- دز *الالعاب* وجمع عمري .") 
return false 
end
local NUMNKO = (NUMPY * 50)
database:decrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..msg.sender_user_id_,NUMPY)  
database:incrby(bot_id.."Relax:messageUser"..msg.chat_id_..":"..msg.sender_user_id_,NUMNKO)  
send(msg.chat_id_,msg.id_,"- تم خصم  { "..NUMPY.." } من مجوهراتك . \n- تم اضافة ~ { "..(NUMPY * 50).." } رسالة الى رسائلك .")
end 
return false 
end
if text ==("مسح") and Addictive(msg) and tonumber(msg.reply_to_message_id_) > 0 then
DeleteMessage(msg.chat_id_,{[0] = tonumber(msg.reply_to_message_id_),msg.id_})   
end   
if database:get(bot_id.."aaaZaa:numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
database:del(bot_id.."aaaZaa:id:user"..msg.chat_id_)  
send(msg.chat_id_, msg.id_, "- تم الغاء الامر .") 
database:del(bot_id.."aaaZaa:numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  
end 
database:del(bot_id.."aaaZaa:numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = database:get(bot_id.."aaaZaa:id:user"..msg.chat_id_)  
database:del(bot_id.."aaaZaa:Msg_User"..msg.chat_id_..":"..msg.sender_user_id_) 
database:incrby(bot_id.."Relax:messageUser"..msg.chat_id_..":"..iduserr,numadded)  
send(msg.chat_id_, msg.id_,"- تم اضافة له {"..numadded.."} رسالة .")  
end
if database:get(bot_id.."aaaZaa:gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
database:del(bot_id.."aaaZaa:idgem:user"..msg.chat_id_)  
send(msg.chat_id_, msg.id_, "- تم الغاء الامر .") 
database:del(bot_id.."aaaZaa:gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  
end 
database:del(bot_id.."aaaZaa:gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = database:get(bot_id.."aaaZaa:idgem:user"..msg.chat_id_)  
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..iduserr,numadded)  
send(msg.chat_id_, msg.id_,"- تم اضافة له {"..numadded.."} مجوهرة .")  
end
------------------------------------------------------------
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ == 0 and Constructor(msg) then    
BROK = text:match("^اضف رسائل (%d+)$")
database:set(bot_id.."aaaZaa:id:user"..msg.chat_id_,BROK)  
database:setex(bot_id.."aaaZaa:numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
send(msg.chat_id_, msg.id_, "- دز عدد الرسائل عمري .") 
return false
end
if text and text:match("^اضف مجوهرات (%d+)$") and msg.reply_to_message_id_ == 0 and Constructor(msg) then  
BROK = text:match("^اضف مجوهرات (%d+)$")
database:set(bot_id.."aaaZaa:idgem:user"..msg.chat_id_,BROK)  
database:setex(bot_id.."aaaZaa:gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
send(msg.chat_id_, msg.id_, "- دز عدد المجوهرات عمري .") 
return false
end
if text and text:match("^اضف مجوهرات (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^اضف مجوهرات (%d+)$")
function reply(extra, result, success)
database:incrby(bot_id.."aaaZaa:Add:Num"..msg.chat_id_..result.sender_user_id_,Num)  
send(msg.chat_id_, msg.id_,"- تم اضافة له {"..Num.."} مجوهرة .")  
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},reply, nil)
return false
end
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^اضف رسائل (%d+)$")
function reply(extra, result, success)
database:del(bot_id.."aaaZaa:Msg_User"..msg.chat_id_..":"..result.sender_user_id_) 
database:incrby(bot_id.."Relax:messageUser"..msg.chat_id_..":"..result.sender_user_id_,Num)  
send(msg.chat_id_, msg.id_, "\n- تم اضافة له {"..Num.."} رسالة .")  
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},reply, nil)
return false
end

if text == "تنظيف المشتركين" and DevRelax(msg) then
local pv = database:smembers(bot_id..'Relax:UsersBot')  
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,data) 
if data.ID and data.ID == "Ok"  then
print('\27[30;33m»» THE USER IS SAVE ME ↓\n»» '..pv[i]..'\n\27[1;37m')
else
print('\27[30;31m»» THE USER IS BLOCK ME ↓\n»» '..pv[i]..'\n\27[1;37m')
database:srem(bot_id..'Relax:UsersBot',pv[i])  
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
send(msg.chat_id_, msg.id_,'- مكو مشتركين وهميين يحلو .')   
else
local ok = #pv - sendok
send(msg.chat_id_, msg.id_,'- عدد المشتركين ~ '..#pv..'\n- المستخدين الي حظرو البوت ~ '..sendok..' .\n- عدد المشتركين الصافي ~ '..ok..' مشترك .')   
end
end
end,nil)
end,nil)
end
return false
end
if text == "تنظيف الكروبات" and DevRelax(msg) then
local group = database:smembers(bot_id..'Relax:Chek:Groups')  
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
print('\27[30;34m»» THE BOT IS NOT ADMIN ↓\n»» '..group[i]..'\n\27[1;37m')
database:srem(bot_id..'Relax:Chek:Groups',group[i])  
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
database:srem(bot_id..'Relax:Chek:Groups',group[i])  
q = q + 1
print('\27[30;35m»» THE BOT IS LEFT GROUP ↓\n»» '..group[i]..'\n\27[1;37m')
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
database:srem(bot_id..'Relax:Chek:Groups',group[i])  
q = q + 1
print('\27[30;36m»» THE BOT IS KICKED GROUP ↓\n»» '..group[i]..'\n\27[1;37m')
end
if data and data.code_ and data.code_ == 400 then
database:srem(bot_id..'Relax:Chek:Groups',group[i])  
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
send(msg.chat_id_, msg.id_,'- مكو كروبات وهمية يحلو .')   
else
local BROK = (w + q)
local sendok = #group - BROK
if q == 0 then
BROK = ''
else
BROK = '\n- تم حذف ~ '..q..' من كروبات البوت .'
end
if w == 0 then
aaaDaa = ''
else
aaaDaa = '\n- تم حذف ~'..w..' كروب لان مرافعين البوت .'
end
send(msg.chat_id_, msg.id_,'- عدد الكروبات ~ '..#group..' . '..aaaDaa..''..BROK..'\n- عدد الكروبات الصافي  ~ '..sendok..' .\n')   
end
end
end,nil)
end
return false
end
if text == ("تحديث السورس") and DevRelax(msg) then  
send(msg.chat_id_,msg.id_,'- تم تحديث السورس .')
os.execute('rm -rf Relax.lua')
os.execute('rm -rf start.lua')
download_to_file('https://raw.githubusercontent.com/RelaxSource/Relax/main/Relax.lua', 'Relax.lua') 
download_to_file('https://raw.githubusercontent.com/RelaxSource/Relax/main/start.lua', 'start.lua') 
dofile('Relax.lua')  
return false
end


if text == 'تفعيل البوت الخدمي' and DevRelax(msg) then  
database:del(bot_id..'Relax:Free:Add:Bots') 
send(msg.chat_id_, msg.id_,'- تم تفعيل البوت الخدمي .') 
end
if text == 'تعطيل البوت الخدمي' and DevRelax(msg) then  
database:set(bot_id..'Relax:Free:Add:Bots',true) 
send(msg.chat_id_, msg.id_,'- تم تعطيل البوت الخدمي .') 
end
if text and text:match("^تعين عدد الاعضاء (%d+)$") and DevRelax(msg) then
local Num = text:match("تعين عدد الاعضاء (%d+)$") 
database:set(bot_id..'Relax:Num:Add:Bot',Num) 
send(msg.chat_id_, msg.id_,'- تم وضع عدد الاعذاء'..Num..' .')
end
if text =='الاحصائيات' and DevBot(msg) then
local Groups = database:scard(bot_id..'Relax:Chek:Groups')  
local Users = database:scard(bot_id..'Relax:UsersBot')  
send(msg.chat_id_, msg.id_,'- احصائيات البوت . \n\n- عدد الكروبات ~ '..Groups..'\n- عدد المشتركين ~ '..Users..'.')
end
if text == 'جلب نسخة احتياطية' and DevRelax(msg) then
local list = database:smembers(bot_id..'Relax:Chek:Groups')  
local t = '{"BOT_ID": '..bot_id..',"GP_BOT":{'  
for k,v in pairs(list) do   
NAME = 'Relax Chat'
ASAS = database:smembers(bot_id.."Relax:Basic:Constructor"..v)
MNSH = database:smembers(bot_id.."Relax:Constructor"..v)
MDER = database:smembers(bot_id.."Relax:Manager"..v)
MOD = database:smembers(bot_id.."Relax:Mod:User"..v)
link = database:get(bot_id.."Relax:Link_Group"..v) or ''
if k == 1 then
t = t..'"'..v..'":{"Relax":"'..NAME..'",'
else
t = t..',"'..v..'":{"Relax":"'..NAME..'",'
end
if #ASAS ~= 0 then 
t = t..'"ASAS":['
for k,v in pairs(ASAS) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MOD ~= 0 then
t = t..'"MOD":['
for k,v in pairs(MOD) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MDER ~= 0 then
t = t..'"MDER":['
for k,v in pairs(MDER) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MNSH ~= 0 then
t = t..'"MNSH":['
for k,v in pairs(MNSH) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
t = t..'"linkgroup":"'..link..'"}' or ''
end
t = t..'}}'
local File = io.open('./File_Libs/'..bot_id..'.json', "w")
File:write(t)
File:close()
sendDocument(msg.chat_id_, msg.id_,'./File_Libs/'..bot_id..'.json', '- عدد كروبات البوت { '..#list..'}')
end
if text == 'المطور' or text == 'مطور' or text == 'المطورين' then
local Text_Dev = database:get(bot_id..'Relax:Text_Dev')
if Text_Dev then 
send(msg.chat_id_, msg.id_,Text_Dev)
else
tdcli_function ({ID = "GetUser",user_id_ = Id_Sudo},function(arg,result) 
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
sendText(msg.chat_id_,Name,msg.id_/2097152/0.5,'md')
end,nil)
end
end
if text == 'الملفات' and DevRelax(msg) then
t = '- الملفات . \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n'
i = 0
for v in io.popen('ls Relax_Files'):lines() do
if v:match(".lua$") then
i = i + 1
t = t..i..'*~ '..v..'*\n'
end
end
send(msg.chat_id_, msg.id_,t)
end
if text == "متجر الملفات" or text == 'المتجر' then
if DevRelax(msg) then
local Get_Files, res = https.request("https://raw.githubusercontent.com/Relaxab/files_Relax/master/getfile.json")
if res == 200 then
local Get_info, res = pcall(JSON.decode,Get_Files);
vardump(res.plugins_)
if Get_info then
local TextS = "\n- هلا عمري بمتجر ملفات سورس ريلاكس . \n- الملفات الموجودة حاليا . \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n\n"
local TextE = "\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n- تدل علامة (✔) الملف مفعل\n".."- تدل علامة (✖) الملف معطل\n"
local NumFile = 0
for name,Info in pairs(res.plugins_) do
local Check_File_is_Found = io.open("Relax_Files/"..name,"r")
if Check_File_is_Found then
io.close(Check_File_is_Found)
CeckFile = "(✔)"
else
CeckFile = "(✖)"
end
NumFile = NumFile + 1
TextS = TextS..'*'..NumFile.."~⪼* {`"..name..'`} » '..CeckFile..'\n[- File Information]('..Info..')\n'
end
send(msg.chat_id_, msg.id_,TextS..TextE) 
end
else
send(msg.chat_id_, msg.id_,"- ماكو اتصال من الAPI . \n") 
end
return false
end
end

if text and text:match("^(تعطيل ملف) (.*)(.lua)$") and DevRelax(msg) then
local name_t = {string.match(text, "^(تعطيل ملف) (.*)(.lua)$")}
local file = name_t[2]..'.lua'
local file_bot = io.open("Relax_Files/"..file,"r")
if file_bot then
io.close(file_bot)
t = "-  الملف » {"..file.."}\n- تم تعطيله وحذفه بنجاح .\n"
else
t = "- تم حذف وتعطيل هذا الملف مسبقا  » {"..file.."} \n"
end
local json_file, res = https.request("https://raw.githubusercontent.com/Relaxab/files_Relax/master/files_Relax/"..file)
if res == 200 then
os.execute("rm -fr Relax_Files/"..file)
send(msg.chat_id_, msg.id_,t) 
dofile('Relax.lua')  
else
send(msg.chat_id_, msg.id_,"- ماكو هيج ملف بمتجر ملفات سورس ريلاكس عمري .\n") 
end
return false
end
if text and text:match("^(تفعيل ملف) (.*)(.lua)$") and DevRelax(msg) then
local name_t = {string.match(text, "^(تفعيل ملف) (.*)(.lua)$")}
local file = name_t[2]..'.lua'
local file_bot = io.open("Relax_Files/"..file,"r")
if file_bot then
io.close(file_bot)
t = "- الملف مفعل منزمان يحلو » {"..file.."} \n"
else
t = "- الملف » {"..file.."}\n- تم تنزيله وتفعيله بنجاح \n"
end
local json_file, res = https.request("https://raw.githubusercontent.com/Relaxab/files_Relax/master/files_Relax/"..file)
if res == 200 then
local chek = io.open("Relax_Files/"..file,'w+')
chek:write(json_file)
chek:close()
send(msg.chat_id_, msg.id_,t) 
dofile('Relax.lua')  
else
send(msg.chat_id_, msg.id_,"- ماكو هيج ملف بمتجر ملفات سورس ريلاكس عمري .\n") 
end
return false
end
if text == "مسح جميع الملفات" and DevRelax(msg) then
os.execute("rm -fr Relax_Files/*")
send(msg.chat_id_,msg.id_,"- تم مسح جميع الملفات .")
return false
end
if text == 'نقل الاحصائيات' and DevRelax(msg) then
local Users = database:smembers('Relax:'..bot_id.."userss")
local Groups = database:smembers('Relax:'..bot_id..'groups') 
for i = 1, #Groups do
database:sadd(bot_id..'Relax:Chek:Groups',Groups[i])  
local list1 = database:smembers('Relax:'..bot_id..'creatorbasic:'..Groups[i])
for k,v in pairs(list1) do
database:sadd(bot_id.."Relax:Basic:Constructor"..Groups[i], v)
end
local list2 = database:smembers('Relax:'..bot_id..'creator:'..Groups[i])
for k,v in pairs(list2) do
database:sadd(bot_id.."Relax:Constructor"..Groups[i], v)
end
local list3 = database:smembers('Relax:'..bot_id..'owners:'..Groups[i])
for k,v in pairs(list3) do
database:sadd(bot_id.."Relax:Manager"..Groups[i], v)
end
local list4 = database:smembers('Relax:'..bot_id..'mods:'..Groups[i])
for k,v in pairs(list4) do
database:sadd(bot_id.."Relax:Mod:User"..Groups[i], v)
end
database:set(bot_id.."Relax:Lock:tagservrbot"..Groups[i],true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
database:set(bot_id..'Relax:'..lock..Groups[i],"del")    
end
end
for i = 1, #Users do
database:sadd(bot_id..'Relax:UsersBot',Users[i])  
end
send(msg.chat_id_, msg.id_,'- تم نقل => '..#Groups..' كروب .\n- تم نقل => '..#Users..' مشترك . \n- من التحديث القديم الى الجديد .')
end
if text == 'حذف كليشة المطور' and DevRelax(msg) then
database:del(bot_id..'Relax:Text_Dev')
send(msg.chat_id_, msg.id_,'- تم حذف كليشة المطور .')
end
if text == 'وضع كليشة المطور' and DevRelax(msg) then
database:set(bot_id..'Relax:Set:Text_Dev'..msg.chat_id_..':'..msg.sender_user_id_,true)
send(msg.chat_id_,msg.id_,'- دز الكليشة عمري .')
return false
end
if text and database:get(bot_id..'Relax:Set:Text_Dev'..msg.chat_id_..':'..msg.sender_user_id_) then
if text == 'الغاء' then 
database:del(bot_id..'Relax:Set:Text_Dev'..msg.chat_id_..':'..msg.sender_user_id_)
send(msg.chat_id_,msg.id_,'- تم الغاء حفظ كليشة المطور .')
return false
end
database:set(bot_id..'Relax:Text_Dev',text)
database:del(bot_id..'Relax:Set:Text_Dev'..msg.chat_id_..':'..msg.sender_user_id_)
send(msg.chat_id_,msg.id_,'- تم حفظ كليشة المطور .')
return false
end
if text == 'رفع النسخة الاحتياطية' and DevRelax(msg) then   
if tonumber(msg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.document_ then 
local ID_FILE = result.content_.document_.document_.persistent_id_ 
local File_Name = result.content_.document_.file_name_
add_file(msg,msg.chat_id_,ID_FILE,File_Name)
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text == "تحديث" and DevRelax(msg) then
dofile("Relax.lua")  
send(msg.chat_id_, msg.id_, "- تم التحديث .")
end
if text == 'السورس' or text == 'سورس' or text == 'ياسورس' or text == 'يا سورس' then
Text = [[
- هلا بسورس ريلاكس يحلو .
[- قناة السورس .](https://t.me/PPPP3P)
[- مطور السورس .](https://t.me/aaaZaa)
]]
send(msg.chat_id_, msg.id_,Text)
end
if text == 'الاوامر' and Addictive(msg) then
Text = [[
- قائمة الاوامر .
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
- م1 ~⪼ لعرض اوامر الحماية .
- م2 ~⪼ لعرض اوامر الادمنية .
- م3 ~⪼ لعرض اوامر المدراء .
- م4 ~⪼ لعرض اوامر المنشئين .
- م5 ~⪼ لعرض اوامر المطورين .
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
- Channel => @aaaZaa .
]]
send(msg.chat_id_, msg.id_,Text)
return false
end
if text == 'م1' and Addictive(msg) then
Text = [[
- قائمة اوامر الحماية .
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
- قفل/فتح + الاوامر الادناه 
- قفل/فتح + الامر بالتقييد • بالطرد • بالكتم
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
- الروابط
- المعرف
- التاك
- الشارحة
- التعديل
- التثبيت
- - - - -
- المتحركة
- الملفات
- الصور
- الملصقات
- الفيديو
- الانلاين
- الدردشه
- التوجيه
- الاغاني
- الصوت
- الجهات
- الاشعارات
- الماركداون
- البوتات
- التكرار
- الكلايش
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
- Channel => @aaaZaa .
]]
send(msg.chat_id_, msg.id_,Text)
return false
end
if text == 'م2' and Addictive(msg) then
Text = [[
- اوامر الادمنية .
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
- رفع/تنزيل مميز
- تاك للكل
- عدد الكروب
- - - - -
- كتم
- حظر
- طرد
- منع
- تقييد
- - - - -
- الغاء حظر
- الغاء كتم
- الغاء تقييد
- الغاء منع
- - - - -
- المحظورين
- المكتومين
- المميزين
- الصلاحيات
- قائمة المنع
- - - - -
- تثبيت
- الغاء تثبيت
- الاعدادات
- الرابط
- القوانين
- الترحيب
- تفعيل/تعطيل الترحيب
- اضف /مسح صلاحيه 
- وضع تكرار + العدد
- ايدي
- جهاتي
- سحكاتي
- رسائلي
- كشف البوتات
- - - - -
- وضع + الاوامر الادناه
- - - - -
- اسم
- رابط
- صورة
- وصف
- قوانين
- ترحيب
- - - - -
- مسح + الاوامر الادناه
- - - - -
- قائمة المنع
- المحظورين
- المميزين
- المكتومين
- المطرودين
- القوانين
- البوتات
- الصورة
- الصلاحيات
- الرابط
- - - - -
- Cgannel => @aaaZaa .
]]
send(msg.chat_id_, msg.id_,Text)
return false
end
if text == 'م3' and Owner(msg) then
Text = [[
- اوامر المدراء
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
- رفع/تنزيل ادمن
- رفع/كشف القيود
- تنزيل الكل
- - - - -
- تفعيل/تعطيل الايدي بالصورة
- تفعيل/تعطيل الايدي
- تفعيل/تعطيل ردود المطور
- تفعيل/تعطيل اللعبه/الالعاب
- تفعيل/تعطيل ردود المدير
- تفعيل/تعطيل اطردني
- تفعيل/تعطيل الرفع
- تفعيل/تعطيل الحظر/الطرد
- تفعيل/تعطيل الرابط/جلب الرابط
- تعيين/مسح الايدي
- - - - -
- رفع الادمنية
- اضف/حذف رد
- الادمنية
- ردود المدير
- تنظيف + عدد
- مسح الادمنية
- مسح ردود المدير
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
- لتغيير الردود .
- تغيير رد المطور + النص
- تغيير رد المنشئ الاساسي + النص
- تغيير رد المنشئ + النص
- تغيير رد المدير + النص
- تغيير رد الادمن + النص
- تغيير رد المميز + النص
- تغيير رد العضو + النص
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
- Channel => @aaaZaa .
]]
send(msg.chat_id_, msg.id_,Text)
return false
end
if text == 'م4' and Constructor(msg) then
Text = [[
- اوامر المنشئين الاساسيين .
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
- رفع/تنزيل منشئ
- المنشئين
- مسح المنشئين
- - - - -
- اوامر المنشئين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
- رفع/تنزيل مدير
- المدراء
- مسح المدراء
- تعيين/مسح الايدي
- اضف/حذف امر
- الاوامر المضافة
- حذف/مسح الاوامر المضافة
- اضف رسائل + العدد بالرد
- اضف مجوهرات + العدد بالرد
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
- Channel => @aaaZaa .
]]
send(msg.chat_id_, msg.id_,Text)
return false
end
if text == 'م5' and DevBot(msg) then
Text = [[
- اوامر المطور الاساسي . 
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
- حظر عام
- الغاء العام
- مسح قائمة العام
- اضف /حذف مطور 
- المطورين
- مسح المطورين
- اضف/حذف رد للكل 
- مسح ردود المطور
- ردود المطور 
- وضع /حذف كليشة المطور 
- تحديث  + تحديث السورس 
- - - - -
- تفعيل/تعطيل البوت الخدمي 
- تعيين عدد الاعضاء + العدد
- تفعيل/تعطيل المغادرة
- تفعيل/تعطيل الاذاعة 
- - - - -
- اوامر المطورين .
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
- تفعيل /تعطيل
- رفع/تنزيل منشئ اساسي
- رفع منشئ 
- مسح المنشئين الاساسيين
- المنشئين الاساسيين 
- غادر 
- غادر + الايدي
- اضاعة 
- اذاعة بالتوجيه
- اذاعة خاص 
- اذاعة بالتثبيت 
- الاحصائيات 
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
- Channel => @aaaZaa .
]]
send(msg.chat_id_, msg.id_,Text)
return false
end

end ---- Chat_Type = 'GroupBot' 
end ---- Chat_Type = 'GroupBot' 

if text == 'تفعيل' and DevBot(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,'- اني مو ادمن يحلو .') 
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
if tonumber(data.member_count_) < tonumber(database:get(bot_id..'Relax:Num:Add:Bot') or 0) and not DevRelax(msg) then
send(msg.chat_id_, msg.id_,'- عدد اعضاء الكروب اقل من {'..(database:get(bot_id..'Relax:Num:Add:Bot') or 0)..' عمري .')
return false
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
if database:sismember(bot_id..'Relax:Chek:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_,'- الكروب مفعل حياتي .')
else
Reply_Status(msg,result.id_,'reply_Add','- تم تفعيل الكروب يقلبي '..chat.title_..'')
database:sadd(bot_id..'Relax:Chek:Groups',msg.chat_id_)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NameChat = chat.title_
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub("`","") 
NameChat = NameChat:gsub("*","") 
NameChat = NameChat:gsub("{","") 
NameChat = NameChat:gsub("}","") 
local IdChat = msg.chat_id_
local NumMember = data.member_count_
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = 'لا يوجد'
end
Text = '- تم تفعيل كروب جديد يحلو .\n'..
'\n- الي فعل الكروب ~ '..Name..''..
'\n- ايدي الكروب - `'..IdChat..'`'..
'\n- عدد اعضاء الكروب ~ '..NumMember..' .'..
'\n- اسم الكروب ~ ['..NameChat..']'..
'\n- رابط الكروب ~ ['..LinkGp..']'
if not DevRelax(msg) then
sendText(Id_Sudo,Text,0,'md')
end
end
end,nil) 
end,nil) 
end,nil)
end
if text == 'تعطيل' and DevBot(msg) then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
if not database:sismember(bot_id..'Relax:Chek:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_,'- الكروب معطل حبيبي .')
else
Reply_Status(msg,result.id_,'reply_Add','☑┇تم تعطيل المجموعه ~ '..chat.title_..'')
database:srem(bot_id..'Relax:Chek:Groups',msg.chat_id_)  
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NameChat = chat.title_
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub("`","") 
NameChat = NameChat:gsub("*","") 
NameChat = NameChat:gsub("{","") 
NameChat = NameChat:gsub("}","") 
local IdChat = msg.chat_id_
local AddPy = var
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = 'لا يوجد'
end
database:set(bot_id.."Relax:Private:Group:Link"..msg.chat_id_,LinkGp) 

Text = '- تم تعطيل كروب عمري .\n'..
'\n- الي عطل الكروب ~ '..Name..''..
'\n- ايدي الكروب ~ `'..IdChat..'`'..
'\n- اسم الكروب ~ ['..NameChat..']'..
'\n- رابط الكروب ~ ['..LinkGp..']'
if not DevRelax(msg) then
sendText(Id_Sudo,Text,0,'md')
end
end
end,nil) 
end,nil) 
end
if text == 'تفعيل' and not DevBot(msg) and not database:get(bot_id..'Relax:Free:Add:Bots') then 
local url,res = http.request('https://fixcvb7.ml/p3.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.Ch_Member.Relax ~= true then
send(msg.chat_id_,msg.id_,'- عمري اشترك بقناة السورس وارجع دز الامر .\n- Relax Channel => @PPPP3P .')   
return false 
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,'- اني مو ادمن يحلو .') 
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da and da.status_.ID == "ChatMemberStatusEditor" or da and da.status_.ID == "ChatMemberStatusCreator" then
if da and da.user_id_ == msg.sender_user_id_ then
if da.status_.ID == "ChatMemberStatusCreator" then
var = 'المنشئ'
elseif da.status_.ID == "ChatMemberStatusEditor" then
var = 'الادمن'
else 
var= 'عضو'
end
if database:sismember(bot_id..'Relax:Chek:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_,'- الكروب مفعل عمري .')
else
if tonumber(data.member_count_) < tonumber(database:get(bot_id..'Relax:Num:Add:Bot') or 0) and not DevRelax(msg) then
send(msg.chat_id_, msg.id_,'- عدد الكروب اقل من {'..(database:get(bot_id..'Relax:Num:Add:Bot') or 0)..' عمري .')
return false
end
Reply_Status(msg,result.id_,'reply_Add','- تم تفعيل الكروب يقلبي  '..chat.title_..'')
database:sadd(bot_id..'Relax:Chek:Groups',msg.chat_id_)  
database:sadd(bot_id..'Relax:Basic:Constructor'..msg.chat_id_, msg.sender_user_id_)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NumMember = data.member_count_
local NameChat = chat.title_
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub("`","") 
NameChat = NameChat:gsub("*","") 
NameChat = NameChat:gsub("{","") 
NameChat = NameChat:gsub("}","") 
local IdChat = msg.chat_id_
local AddPy = var
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = 'لا يوجد'
end
Text = '- تم تفعيل كروب جديد يحلو .\n'..
'\n- الي فعل الكروب ~ '..Name..''..
'\n- رتبة الي فعل الكروب ~ '..AddPy..'' ..
'\n- ايدي الكروب ~ `'..IdChat..'`'..
'\n- عدد الكروب ~ '..NumMember..' .'..
'\n- اسم الكروب ~ ['..NameChat..']'..
'\n- رابط الكروب ~ ['..LinkGp..']'
if not DevRelax(msg) then
sendText(Id_Sudo,Text,0,'md')
end
end
end
end
end,nil)   
end,nil) 
end,nil) 
end,nil)
end

if Chat_Type == 'UserBot' then
if text == '/start' then  
if DevRelax(msg) then
local Text = '- اهلا بك عزيزي المطور في الاوامر الخاصة بك .'
local keyboard = {
{'- الاحصائيات .'},
{'- تفعيل التواصل .','- تعطيل التواصل .'},
{'- تنظيف الكروبات .','- تنظيف المشتركين .'},
{'- تفعيل البوت الخدمي .','- تعطيل البوت الخدمي .'},
{'- اذاعة .','- المطورين .','- اذاعة خاص .'},
{'- اذاعة بالتوجيه .','- اذاعة بالتوجيه خاص .'},
{'- تفعيل الاذاعة .','- تعطيل الاذاعة .'},
{'- مسح قائمة العام .','- مسح المطورين .'},
{'- وضع كليشة ستارت .','- حذف كليشة ستارت .'},
{'- تحدث السورس .'},
{'- قائمة العام .'},
{'- جلب نسخة احتياطية .'},
{'- الغاء .'}
}
send_inline_key(msg.chat_id_,Text,keyboard)
else
if not database:get(bot_id..'Relax:Start:Time'..msg.sender_user_id_) then
local start = database:get(bot_id.."Start:Bot")  
if start then 
Test = start
else
Test = '- هلا عمري اني بوت اختصاصي حماية الكروبات .\n- وظيفتي معروفة ميحتاج اكتب هواي وادوخك يحلو .\n- ارفع البوت ادمن بالكروب ودز تفعيل وخلص .\n- مطور البوت - ['..UserName..']'
end 
send(msg.chat_id_, msg.id_, Test) 
end
end
database:setex(bot_id..'Relax:Start:Time'..msg.sender_user_id_,60,true)
return false
end
if not DevRelax(msg) and not database:sismember(bot_id..'BaN:In:User',msg.sender_user_id_) and not database:get(bot_id..'Texting:In:Bv') then
send(msg.sender_user_id_,msg.id_,'- تم ارسال رسالتك الى ~ ['..UserName..']')    
tdcli_function({ID ="GetChat",chat_id_=Id_Sudo},function(arg,chat)  
tdcli_function({ID ="GetChat",chat_id_=msg.sender_user_id_},function(arg,chat)  
tdcli_function({ID="ForwardMessages",chat_id_=Id_Sudo,from_chat_id_= msg.sender_user_id_,message_ids_={[0]=msg.id_},disable_notification_=1,from_background_=1},function(arg,data) 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,ta) 
if data and data.messages_ and data.messages_[0] ~= false and data.ID ~= "Error" then
if data and data.messages_ and data.messages_[0].content_.sticker_ then
sendText(Id_Sudo,'- تم ارسال الملصق الى ~ ['..string.sub(ta.first_name_,0, 40)..'](tg://user?id='..ta.id_..')',0,'md') 
return false
end;end;end,nil);end,nil);end,nil);end,nil);end
if DevRelax(msg) and msg.reply_to_message_id_ ~= 0  then    
tdcli_function({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},function(extra, result, success) 
if result.forward_info_.sender_user_id_ then     
id_user = result.forward_info_.sender_user_id_    
end     
tdcli_function ({ID = "GetUser",user_id_ = id_user},function(arg,data) 
if text == 'حظر' then
sendText(Id_Sudo,'- العضو » ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\n- تم حظره من التواصل . ',msg.id_/2097152/0.5,'md')
database:sadd(bot_id..'BaN:In:User',data.id_)  
return false  
end 
if text =='الغاء الحظر' then
sendText(Id_Sudo,'- العضو » ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\n- تم الغاء حظره من التواصل .',msg.id_/2097152/0.5,'md')
database:srem(bot_id..'BaN:In:User',data.id_)  
return false  
end 
tdcli_function({ID='GetChat',chat_id_ = id_user},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = id_user, action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,ta) 
if ta.code_ == 400 or ta.code_ == 5 then
send(msg.chat_id_, msg.id_,'\n- العضو حظر البوت عمري .') 
return false  
end 
if text then    
send(id_user,msg.id_,text)    
Text = '- تم ارسال الرسالة عمري . '
elseif msg.content_.ID == 'MessageSticker' then    
sendSticker(id_user, msg.id_, msg.content_.sticker_.sticker_.persistent_id_)   
Text = '- تم ارسال الملصق عمري . '
elseif msg.content_.ID == 'MessagePhoto' then    
sendPhoto(id_user, msg.id_,msg.content_.photo_.sizes_[0].photo_.persistent_id_,(msg.content_.caption_ or ''))    
Text = '- تم الرسال الصورة عمري . '
elseif msg.content_.ID == 'MessageAnimation' then    
sendDocument(id_user, msg.id_, msg.content_.animation_.animation_.persistent_id_)    
Text = '- تم ارسال المتحركة عمري . '
elseif msg.content_.ID == 'MessageVoice' then    
sendVoice(id_user, msg.id_, msg.content_.voice_.voice_.persistent_id_)    
Text = '- تم ارسال البصمة عمري . '
end     
sendText(Id_Sudo,Text..'\n'..'- ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')',0,'md') 
end,nil);end,nil);end,nil);end,nil);end 
if DevRelax(msg) then
if text == '- تفعيل التواصل .' then  
database:del(bot_id..'Texting:In:Bv') 
send(msg.chat_id_, msg.id_,'- تم تفعيل التواصل يحلو .') 
end
if text == '- تعطيل التواصل .' then  
database:set(bot_id..'Texting:In:Bv',true) 
send(msg.chat_id_, msg.id_,'- تم تعطيل التواصل حياتي .') 
end
if text =='- الاحصائيات .' then
local Groups = database:scard(bot_id..'Relax:Chek:Groups')  
local Users = database:scard(bot_id..'Relax:UsersBot')  
send(msg.chat_id_, msg.id_,'- احصائيات بوتك يحلو . \n\n- عدد الكروبات ~ '..Groups..'\n- عدد المشتركين ~ '..Users..' .')
end
if text == "- تنظيف المشتركين ." then
local pv = database:smembers(bot_id..'Relax:UsersBot')  
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,data) 
if data.ID and data.ID == "Ok"  then
print('\27[30;33m»» THE USER IS SAVE ME ↓\n»» '..pv[i]..'\n\27[1;37m')
else
print('\27[30;31m»» THE USER IS BLOCK ME ↓\n»» '..pv[i]..'\n\27[1;37m')
database:srem(bot_id..'Relax:UsersBot',pv[i])  
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
send(msg.chat_id_, msg.id_,'- مكو مشتركين وهميين عمري الحلو .')   
else
local ok = #pv - sendok
send(msg.chat_id_, msg.id_,'- عدد المشتركين ~ '..#pv..'\n- عدد الي حاظرين البوت ~ '..sendok..' .\n- عدد المشتركين الصافي ~ '..ok..' .')   
end
end
end,nil)
end,nil)
end
return false
end
if text == "- تنظيف الكروبات ." then
local group = database:smembers(bot_id..'Relax:Chek:Groups')  
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
print('\27[30;34m»» THE BOT IS NOT ADMIN ↓\n»» '..group[i]..'\n\27[1;37m')
database:srem(bot_id..'Relax:Chek:Groups',group[i])  
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
database:srem(bot_id..'Relax:Chek:Groups',group[i])  
q = q + 1
print('\27[30;35m»» THE BOT IS LEFT GROUP ↓\n»» '..group[i]..'\n\27[1;37m')
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
database:srem(bot_id..'Relax:Chek:Groups',group[i])  
q = q + 1
print('\27[30;36m»» THE BOT IS KICKED GROUP ↓\n»» '..group[i]..'\n\27[1;37m')
end
if data and data.code_ and data.code_ == 400 then
database:srem(bot_id..'Relax:Chek:Groups',group[i])  
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
send(msg.chat_id_, msg.id_,'- مكو كروبات مخربطة قلبي .')   
else
local BROK = (w + q)
local sendok = #group - BROK
if q == 0 then
BROK = ''
else
BROK = '\n- تم مسح  ~ '..q..' كروب من البوت .'
end
if w == 0 then
aaaDaa = ''
else
aaaDaa = '\n- تم مسح ~'..w..' كروب لان ممصعدين البوت .'
end
send(msg.chat_id_, msg.id_,'- عدد الكروبات ~ '..#group..' . '..aaaDaa..''..BROK..'\n- عدد الكروبات الصافي ~ '..sendok..' .\n')   
end
end
end,nil)
end
return false
end
if text == '- تفعيل البوت الخدمي .' then
database:del(bot_id..'Relax:Free:Add:Bots') 
send(msg.chat_id_, msg.id_,'\n- تم تفعيل البوت الخدمي يحلو .') 
end
if text == '- تعطيل البوت الخدمي .' then
database:set(bot_id..'Relax:Free:Add:Bots',true) 
send(msg.chat_id_, msg.id_,'\n- تم تعطيل البوت الخدمي حياتي .') 
end
if text=="- اذاعة خاص ." and msg.reply_to_message_id_ == 0 then
if database:get(bot_id.."Relax:Status:Bc") and not DevRelax(msg) then 
send(msg.chat_id_, msg.id_,"- الاذاعة معطلة من المطور الاساسي قلبي .")
return false
end
database:setex(bot_id.."Relax:Relax:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"- دزلي ايشي ~ { ملصق, متحركة, صورة, رسالة }\n- اذا بطلت دز الغاء عمري الحلو . ") 
return false
end 
if text=="- اذاعة ." and msg.reply_to_message_id_ == 0 then
if database:get(bot_id.."Relax:Status:Bc") and not DevRelax(msg) then 
send(msg.chat_id_, msg.id_,"- الاذاعة معطلة من المطور الاساسي قلبي .")
return false
end
database:setex(bot_id.."Relax:Relax:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"دزلي ايشي ~ { ملصق, متحركة, صورة, رسالة }\n- اذا بطلت دز الغاء يحلو .") 
return false
end  
if text=="- اذاعة بالتوجيه ." and msg.reply_to_message_id_ == 0  then
if database:get(bot_id.."Relax:Status:Bc") and not DevRelax(msg) then 
send(msg.chat_id_, msg.id_,"- الاذاعة معطلة من المطور الاساسي قلبي .")
return false
end
database:setex(bot_id.."Relax:Relax:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"- دزلي التوجيه يقلبي .") 
return false
end 
if text=="- اذاعة بالتوجيه خاص ." and msg.reply_to_message_id_ == 0  then
if database:get(bot_id.."Relax:Status:Bc") and not DevRelax(msg) then 
send(msg.chat_id_, msg.id_,"- الاذاعة معطلة من المطور الاساسي قلبي .")
return false
end
database:setex(bot_id.."Relax:Relax:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"- دزلي التوجيه يحلو .") 
return false
end 
if text == "- تفعيل الاذاعة ." then
database:del(bot_id.."Relax:Status:Bc") 
send(msg.chat_id_, msg.id_,"\n- تم تفعيل الاذاعة حبيبي ." ) 
return false
end 
if text == "- تعطيل الاذاعة ." then
database:set(bot_id.."Relax:Status:Bc",true) 
send(msg.chat_id_, msg.id_,"\n- تم تعطيل الاذاعة حياتي .") 
return false
end 
if text == "- تفعيل المغادرة ." then
database:del(bot_id.."Relax:Left:Bot"..msg.chat_id_)  
send(msg.chat_id_, msg.id_,"- تم تفعيل المغادرة يحلو .") 
return false 
end
if text == "- تعطيل المغادرة ." then
database:set(bot_id.."Relax:Left:Bot"..msg.chat_id_,true)   
send(msg.chat_id_, msg.id_, "- تم تعطيل المغادرة حياتي .") 
return false 
end
if text and database:get(bot_id..'Start:Bots') then
if text == '- الغاء .' then   
send(msg.chat_id_, msg.id_,"- تم الغاء حفظ كليشة ستارت عمري .") 
database:del(bot_id..'Start:Bots') 
return false
end
database:set(bot_id.."Start:Bot",text)  
send(msg.chat_id_, msg.id_,'- تم حفظ كليشة ستارت حياتي .') 
database:del(bot_id..'Start:Bots') 
return false
end
if text == '- وضع كليشة ستارت .' then
database:set(bot_id..'Start:Bots',true) 
send(msg.chat_id_, msg.id_,'- دزلي الكليشة حبي .') 
return false
end
if text == '- حذف كليشة ستارت .' then
database:del(bot_id..'Start:Bot') 
send(msg.chat_id_, msg.id_,'- تم حذف كليشة ستارت عمري .') 
end
if text == ("- مسح قائمة العام .") and DevRelax(msg) then
database:del(bot_id.."Relax:GBan:User")
send(msg.chat_id_, msg.id_, "\n- تم مسح قائمة العام قلبي .")
return false
end
if text == ("- مسح المحظورين .") and DevRelax(msg) then
database:del(bot_id.."Relax:Sudo:User")
send(msg.chat_id_, msg.id_, "\n- تم مسح المحظورين يحلو .")
end
if text == ("- قائمة العام .") and DevRelax(msg) then
local list = database:smembers(bot_id.."Relax:GBan:User")
t = "\n- قائمة المحظورين عام .\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."Relax:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "- ولا نفر محظور عام يحلو ."
end
send(msg.chat_id_, msg.id_, t)
return false
end
if text == ("- المطورين .") and DevRelax(msg) then
local list = database:smembers(bot_id.."Relax:Sudo:User")
t = "\n- قائمة المطورين الحاتين . \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."Relax:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "- ماكو مطورين يقلبي ."
end
send(msg.chat_id_, msg.id_, t)
end
if text == '- جلب نسخة احتياطية .' then
local list = database:smembers(bot_id..'Relax:Chek:Groups')  
local t = '{"BOT_ID": '..bot_id..',"GP_BOT":{'  
for k,v in pairs(list) do   
NAME = 'Relax Chat'
ASAS = database:smembers(bot_id.."Relax:Basic:Constructor"..v)
MNSH = database:smembers(bot_id.."Relax:Constructor"..v)
MDER = database:smembers(bot_id.."Relax:Manager"..v)
MOD = database:smembers(bot_id.."Relax:Mod:User"..v)
link = database:get(bot_id.."Relax:Link_Group"..v) or ''
if k == 1 then
t = t..'"'..v..'":{"Relax":"'..NAME..'",'
else
t = t..',"'..v..'":{"Relax":"'..NAME..'",'
end
if #ASAS ~= 0 then 
t = t..'"ASAS":['
for k,v in pairs(ASAS) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MOD ~= 0 then
t = t..'"MOD":['
for k,v in pairs(MOD) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MDER ~= 0 then
t = t..'"MDER":['
for k,v in pairs(MDER) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MNSH ~= 0 then
t = t..'"MNSH":['
for k,v in pairs(MNSH) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
t = t..'"linkgroup":"'..link..'"}' or ''
end
t = t..'}}'
local File = io.open('./File_Libs/'..bot_id..'.json', "w")
File:write(t)
File:close()
sendDocument(msg.chat_id_, msg.id_,'./File_Libs/'..bot_id..'.json', '- عدد كروبات البوت - { '..#list..'}')
end
if text == "- تحديث السورس ." then
send(msg.chat_id_,msg.id_,'- تم تحديث السورس يحلو .')
os.execute('rm -rf Relax.lua')
os.execute('rm -rf start.lua')
download_to_file('https://raw.githubusercontent.com/RelaxSource/Relax/main/Relax.lua', 'Relax.lua') 
download_to_file('https://raw.githubusercontent.com/RelaxSource/Relax/main/start.lua', 'start.lua') 
dofile('Relax.lua')  
return false
end
if text == "- تحديث ." then
dofile("Relax.lua")  
send(msg.chat_id_, msg.id_, "- تم تحديث السورس يحلو .")
end
end
end --- Chat_Type = 'UserBot' 
end
end
function tdcli_update_callback(data)
if data.ID == "UpdateChannel" then 
if data.channel_.status_.ID == "ChatMemberStatusKicked" then 
database:srem(bot_id..'Relax:Chek:Groups','-100'..data.channel_.id_)  
end
end
if (data.ID == "UpdateNewMessage") then
local msg = data.message_
local text = msg.content_.text_
if msg.date_ and msg.date_ < tonumber(os.time() - 30) then
print("OLD MESSAGE")
return false
end
if msg.sender_user_id_ and Muted_Groups(msg.chat_id_,msg.sender_user_id_) then 
DeleteMessage(msg.chat_id_, {[0] = msg.id_})  
return false  
end
--------------------------------------------------------------------------------------------------------------
if tonumber(msg.sender_user_id_) ~= tonumber(bot_id) then  
if msg.sender_user_id_ and Ban_Groups(msg.chat_id_,msg.sender_user_id_) then 
Kick_Group(msg.chat_id_,msg.sender_user_id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false  
end
--------------------------------------------------------------------------------------------------------------
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and Ban_Groups(msg.chat_id_,msg.content_.members_[0].id_) then 
Kick_Group(msg.chat_id_,msg.content_.members_[0].id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
--------------------------------------------------------------------------------------------------------------
if msg.sender_user_id_ and Ban_All_Groups(msg.sender_user_id_) then 
Kick_Group(msg.chat_id_,msg.sender_user_id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false 
end
--------------------------------------------------------------------------------------------------------------
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and Ban_All_Groups(msg.content_.members_[0].id_) then 
Kick_Group(msg.chat_id_,msg.content_.members_[0].id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_})  
end 
end
------------------------------------------------------------------------
if msg.content_.ID == "MessageChatDeletePhoto" or msg.content_.ID == "MessageChatChangePhoto" or msg.content_.ID == "MessagePinMessage" or msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == "MessageChatChangeTitle" or msg.content_.ID == "MessageChatDeleteMember" then   
if database:get(bot_id.."Relax:Lock:tagservr"..msg.chat_id_) then  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false
end    
end   
if text and not database:sismember(bot_id..'Relax:Spam:Group'..msg.sender_user_id_,text) then
database:del(bot_id..'Relax:Spam:Group'..msg.sender_user_id_) 
end
------------------------------------------------------------------------
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
database:set(bot_id..'Relax:User:Name'..msg.sender_user_id_,data.username_)
end;end,nil)   
------------------------------------------------------------------------
if msg.content_.ID == "MessageChatAddMembers" then  
database:set(bot_id.."Relax:Who:Added:Me"..msg.chat_id_..":"..msg.content_.members_[0].id_,msg.sender_user_id_)
local mem_id = msg.content_.members_  
local Bots = database:get(bot_id.."Relax:Lock:Bot:kick"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and not Addictive(msg) and Bots == "kick" then   
https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_)
Get_Info = https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local Json_Info = JSON.decode(Get_Info)
if Json_Info.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah) local admins = tah.members_ for i=0 , #admins do if tah.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not is_Addictive(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatAddMembers" then  
local mem_id = msg.content_.members_  
local Bots = database:get(bot_id.."Relax:Lock:Bot:kick"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and not Addictive(msg) and Bots == "del" then   
Get_Info = https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local Json_Info = JSON.decode(Get_Info)
if Json_Info.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah) local admins = tah.members_ for i=0 , #admins do if tah.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not is_Addictive(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
end
------------------------------------------------------------------------
if text and database:get(bot_id.."Relax:Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
local NewCmmd = database:get(bot_id.."Relax:Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
if NewCmmd then
database:del(bot_id.."Relax:Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
database:del(bot_id.."Relax:Set:Cmd:Group:New"..msg.chat_id_)
database:srem(bot_id.."Relax:List:Cmd:Group:New"..msg.chat_id_,text)
send(msg.chat_id_, msg.id_,"- تم حذف الامر من الكروب .")  
else
send(msg.chat_id_, msg.id_,"- ماكو هيج امر حياتي .")  
end
database:del(bot_id.."Relax:Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
------------------------------------------------------------------------
if data.message_.content_.text_ then
local NewCmmd = database:get(bot_id.."Relax:Set:Cmd:Group:New1"..msg.chat_id_..":"..data.message_.content_.text_)
if NewCmmd then
data.message_.content_.text_ = (NewCmmd or data.message_.content_.text_)
end
end
Relax_Started_Bot(msg,data)
Relax_Files(msg)
elseif (data.ID == "UpdateMessageEdited") then
local msg = data
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.message_id_)},function(extra, result, success)
database:incr(bot_id..'Relax:message_edit'..result.chat_id_..result.sender_user_id_)
local Text = result.content_.text_
if database:get(bot_id.."Relax:Lock:edit"..msg.chat_id_) and not Text and not BasicConstructor(result) then
Reply_Status(result,result.sender_user_id_,"reply","📬┇قام بالتعديل على الميديا")  
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
end
local text = result.content_.text_
if not Addictive(result) then
------------------------------------------------------------------------
if text and text:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]") or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text and text:match("[Tt].[Mm][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text and text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get(bot_id.."Relax:Lock:Link"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end 
end
------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text and text:match("[Tt].[Mm][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text and text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get(bot_id.."Relax:Lock:Link"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end 
end
------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text and text:match("[Tt].[Mm][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text and text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get(bot_id.."Relax:Lock:Link"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end
------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text and text:match("[Tt].[Mm][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text and text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get(bot_id.."Relax:Lock:Link"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("[hH][tT][tT][pP][sT]") or text and text:match("[tT][eE][lL][eE][gG][rR][aA].[Pp][Hh]") or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa].[Pp][Hh]") then
if database:get(bot_id.."Relax:Lock:Link"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("(.*)(@)(.*)") then
if database:get(bot_id.."Relax:Lock:User:Name"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end
------------------------------------------------------------------------
if text and text:match("@") then
if database:get(bot_id.."Relax:Lock:User:Name"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("(.*)(#)(.*)") then
if database:get(bot_id.."Relax:Lock:hashtak"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("#") then
if database:get(bot_id.."Relax:Lock:hashtak"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("/") then
if database:get(bot_id.."Relax:Lock:Cmd"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end 
end 
if text and text:match("(.*)(/)(.*)") then
if database:get(bot_id.."Relax:Lock:Cmd"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end 
end
------------------------------------------------------------------------
if text then
local Relax_Msg = database:get(bot_id.."Relax:Add:Filter:Rp2"..text..result.chat_id_)   
if Relax_Msg then    
Reply_Status(result,result.sender_user_id_,"reply","📬┇"..Relax_Msg)  
DeleteMessage(result.chat_id_, {[0] = data.message_id_})     
return false
end
end
end
end,nil)
------------------------------------------------------------------------
elseif (data.ID == "UpdateMessageSendSucceeded") then
local msg = data.message_
local text = msg.content_.text_
local Get_Msg_Pin = database:get(bot_id..'Relax:Msg:Pin:Chat'..msg.chat_id_)
if Get_Msg_Pin ~= nil then
if text == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) if d.ID == 'Ok' then;database:del(bot_id..'Relax:Msg:Pin:Chat'..msg.chat_id_);end;end,nil)   
elseif (msg.content_.sticker_) then 
if Get_Msg_Pin == msg.content_.sticker_.sticker_.persistent_id_ then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) database:del(bot_id..'Relax:Msg:Pin:Chat'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.animation_) then 
if msg.content_.animation_.animation_.persistent_id_ == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) database:del(bot_id..'Relax:Msg:Pin:Chat'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.photo_) then
if msg.content_.photo_.sizes_[0] then
id_photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
id_photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
id_photo = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
id_photo = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
if id_photo == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) database:del(bot_id..'Relax:Msg:Pin:Chat'..msg.chat_id_) end,nil)   
end
end
end
end
if (data.ID == "UpdateOption" and data.value_.value_ == "Ready") then
print('\27[30;32m»» - انتظر انظف الكروبات الوهمية يحلو . ««\n\27[1;37m')
local list = database:smembers(bot_id..'Relax:UsersBot')  
for k,v in pairs(list) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data) end,nil) 
end 
local list = database:smembers(bot_id..'Relax:Chek:Groups') 
for k,v in pairs(list) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=v,user_id_=bot_id,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
database:srem(bot_id..'Relax:Chek:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
database:srem(bot_id..'Relax:Chek:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
database:srem(bot_id..'Relax:Chek:Groups',v)  
end
if data and data.code_ and data.code_ == 400 then
database:srem(bot_id..'Relax:Chek:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusEditor" then
database:sadd(bot_id..'Relax:Chek:Groups',v)  
end end,nil)
end;CleangGroups();end;end
