do
-- Will leave the group if be added
local function run(msg, matches)
local bot_id = our_id 
local receiver = get_receiver(msg)
    if matches[1] == 'left' and is_sudo(msg) then
send_large_msg(receiver, "🔄Bye everybody Hope to see you soon \nContact me in @The_erf_Bot", ok_cb, false)
       chat_del_user("chat#id"..msg.to.id, 'user#id'..bot_id, ok_cb, false)
	   leave_channel(receiver, ok_cb, false)
    elseif msg.service and msg.action.type == "chat_add_user" and msg.action.user.id == tonumber(bot_id) and not is_friend(msg) then
       send_large_msg(receiver, "🔀If you want me to join your group \nSend me your group Link in @The_erf_Bot", ok_cb, false)
       chat_del_user(receiver, 'user#id'..bot_id, ok_cb, false)
	   leave_channel(receiver, ok_cb, false)
    end
end
 
return {
  usage = {
    '!left : leave th group'
  },
  patterns = {
    "^[#!/](left)$",
    "^!!tgservice (.+)$",
  },
  run = run
}
end
