return {
	"linux-cultist/venv-selector.nvim",
	branch = "regexp",
	dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
	opts = {
		auto_refresh = true,
		search_workspace = true,
		dap_enabled = true,
		name = { { "venv", ".venv" } },
	},
	event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
	keys = {
		{ "<leader>vs", "<cmd>VenvSelect<cr>" },
		{ "<leader>vc", "<cmd>VenvSelectCached<cr>" },
	},
	config = function()
		require("venv-selector").setup()
	end,
}
