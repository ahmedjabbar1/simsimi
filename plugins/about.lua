local about = {}

local bot = require('bot')
local bindings = require('bindings')

about.command = ''
about.doc = ''

about.triggers = {
	''
}

function about:action(msg)

	-- Filthy hack, but here is where we'll stop forwarded messages from hitting
	-- other plugins.
	if msg.forward_from then return end

	--local output = self.config.about_text .. ''
		local output = self.config.ver_text .. '\n V '..bot.version..' By W3thiq Al-Qajar 🙊\n'

	if (msg.new_chat_participant and msg.new_chat_participant.id == self.info.id)
		or msg.text_lower:match('^/about')
		or msg.text_lower:match('^/about@'..self.info.username:lower())
	or msg.text_lower:match('^/about') then
		bindings.sendMessage(self, msg.chat.id, output ,true,msg.message_id,false)
		return
	end

	return true

end

return about
