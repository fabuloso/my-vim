local M = {
  'mrcjkb/rustaceanvim',
   version = '^4', -- Recommended
   ft = { 'rust' },
}
M.config = function() 

	vim.keymap.set(
  "v", 
  "<leader>a", 
  function()
    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  end,
  { silent = true, buffer = bufnr }
)
vim.keymap.set(
  "n", 
  "<leader>a", 
  function()
    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  end,
  { silent = true, buffer = bufnr }
)

vim.keymap.set("n","<leader>k", function() vim.cmd.RustLsp('explainError') end, { silent = true, buffer = bufnr })

end


local format_sync_grp = vim.api.nvim_create_augroup("Format", {})
vim.api.nvim_create_autocmd("BufWritePre", { 
	pattern = "*.rs",
	callback = function()
		vim.lsp.buf.format({timeout_ms = 200})
	end,
	group = format_sync_grp,
})


return M
