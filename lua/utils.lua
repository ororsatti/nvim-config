M = {}
function M.map(keycomb, action, description, mode)
	mode = mode or "n"
	vim.keymap.set(mode, keycomb, action, { desc = description })
end

function M.client_supports(client, method, bufnr)
	if not client then
		return false
	end

	if vim.fn.has("nvim-0.11") == 0 then
		return client:supports_method(method, bufnr)
	else
		return client.supports_method(method, { bufnr = bufnr })
	end
	return false
end

return M
