return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d", "biome" },
			typescript = { "eslint_d", "biome" },
			javascriptreact = { "eslint_d", "biome" },
			typescriptreact = { "eslint_d", "biome" },
			svelte = { "eslint_d", "biome" },
			python = { "pylint" },
			bash = { "bash" },
			deno = { "deno" },
			go = { "golangcilint" },
			lua = { "luac" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
