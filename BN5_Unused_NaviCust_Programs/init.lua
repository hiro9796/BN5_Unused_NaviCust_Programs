local exe5 = chaudloader.exedat.open("exe5.dat")
local exe5k = chaudloader.exedat.open("exe5k.dat")

function import_msg (mpak, addr, msg_file)
	old_msg = chaudloader.msg.unpack(mpak[addr])
	new_msg = chaudloader.msg.unpack(chaudloader.modfiles.read_file(msg_file))

	chaudloader.util.merge_msg(old_msg, new_msg)
	
	mpak[addr] = chaudloader.msg.pack(old_msg)
end

chaudloader.util.edit_mpak(exe5, "exe5/data/msg/message_eng", function(mpak)
	import_msg(mpak, 0x0879B858, "team_protoman/79B858.msg")
	import_msg(mpak, 0x087D6DE0, "team_protoman/7D6DE0.msg")
end)
chaudloader.util.edit_mpak(exe5k, "exe5k/data/msg/message_eng", function(mpak)
	import_msg(mpak, 0x0879CCF8, "team_colonel/79CCF8.msg")
	import_msg(mpak, 0x087D8280, "team_colonel/7D8280.msg")
end)
