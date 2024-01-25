local M={}
--1 indexed
M.get_line = function(lnum)
	return vim.api.nvim_buf_get_lines(0, lnum-1, lnum, false)[1]
end
M.dispos2charpos= function(lnum, dnum)
	local str=M.get_line(lnum)
	local endc=vim.fn.strdisplaywidth(str)
	local index=nil
	for i=1, endc, 1 do
		local curr_dl=vim.fn.strdisplaywidth(str:sub(1,i))
		if curr_dl >= dnum then
			index=i
			break
		end
	end
	return index
end
M.charpos2dispos= function(lnum, cnum)
	local str=vim.api.nvim_buf_get_lines(0, lnum, lnum+1, nil)[1]
	if str == nil then
		return -1
	end
	local dl=vim.fn.strdisplaywidth(string.sub(str, 0, cnum))
	return dl
end
return M
