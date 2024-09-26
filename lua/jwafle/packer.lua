-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use("datsfilipe/vesper.nvim")
	use({ "rose-pine/neovim", as = "rose-pine" })
	use("leoluz/nvim-dap-go")
	use("mfussenegger/nvim-dap")
	use("nvim-neotest/nvim-nio")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } })
	use("nvim-tree/nvim-web-devicons")
	use({
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	})

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("nvim-treesitter/playground")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")
	use("jiangmiao/auto-pairs")
	use({ "mhartington/formatter.nvim" })
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})
	use("ThePrimeagen/vim-be-good")
	use({ "kevinhwang91/nvim-bqf", ft = "qf" })
	use({
		"junegunn/fzf",
		run = function()
			vim.fn["fzf#install"]()
		end,
	})
	-- init.lua

	-- Initialize packer.nvim
	use({
		"jwafle/llm.nvim", -- Replace with your actual GitHub username and repository name
		requires = { "nvim-lua/plenary.nvim" }, -- Ensure plenary.nvim is included
		config = function()
			require("llm").setup({
				models = {
					ollama_llama_32 = {
						model_name = "llama3.2", -- Replace with your specific Ollama model name
						url = "http://localhost:11434/api/generate",
						max_tokens = 150,
						temperature = 0.7,
						suffix = "", -- Optional: Add any suffix if needed
						options = {
							-- Add any additional Ollama-specific parameters here
							-- Example:
							-- seed = 42,
							-- stop = {"\n", "user:"},
						},
					},
					-- Add more Ollama models as needed
				},
				default_model = "ollama_llama_32",
				prompt = "Please assist me with the following code:",
				model_shortcuts = {
					["<leader>lg"] = "ollama_llama_32",
					-- Define more shortcuts as needed
				},
			})
		end,
	})

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			--- Uncomment the two plugins below if you want to manage the language servers from neovim
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			{ "neovim/nvim-lspconfig" },
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
	})
end)
