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
	use({
		"jwafle/llm.nvim", -- Replace with your actual GitHub username and repository name
		requires = { "nvim-lua/plenary.nvim" }, -- Ensure plenary.nvim is included
		config = function()
			local llm = require("llm")
			local system_prompt =
				"You should replace the code that you are sent, only following the comments. Do not talk at all. Only output valid code. Do not provide any backticks that surround the code. Never ever output backticks like this ```. Any comment that is asking you for something should be removed after you satisfy them. Other comments should left alone. Do not output backticks"
			local helpful_prompt = "You are a helpful assistant. What I have sent are my notes so far."
			local function ollama_replace()
				llm.invoke_llm_and_stream_into_editor({
					url = "http://localhost:11434/v1/chat/completions",
					model = "llama3.2:3b",
					system_prompt = system_prompt,
					replace = true,
				}, llm.make_openai_spec_curl_args, llm.handle_openai_spec_data)
			end

			local function ollama_help()
				llm.invoke_llm_and_stream_into_editor({
					url = "http://localhost:11434/v1/chat/completions",
					model = "llama3.2:3b",
					system_prompt = helpful_prompt,
					replace = false,
				}, llm.make_openai_spec_curl_args, llm.handle_openai_spec_data)
			end

			local function omini_replace()
				llm.invoke_llm_and_stream_into_editor({
					url = "https://api.openai.com/v1/chat/completions",
					model = "gpt-4o-mini",
					api_key_name = "OPENAI_API_KEY",
					system_prompt = system_prompt,
					replace = true,
				}, llm.make_openai_spec_curl_args, llm.handle_openai_spec_data)
			end

			local function omini_help()
				llm.invoke_llm_and_stream_into_editor({
					url = "https://api.openai.com/v1/chat/completions",
					model = "gpt-4o-mini",
					api_key_name = "OPENAI_API_KEY",
					system_prompt = helpful_prompt,
					replace = false,
				}, llm.make_openai_spec_curl_args, llm.handle_openai_spec_data)
			end

			vim.keymap.set({ "n", "v" }, "<leader>l", ollama_replace, { desc = "llm ollama_replace" })
			vim.keymap.set({ "n", "v" }, "<leader>L", ollama_help, { desc = "llm ollama_replace" })
			vim.keymap.set({ "n", "v" }, "<leader>g", omini_replace, { desc = "llm omini_replace" })
			vim.keymap.set({ "n", "v" }, "<leader>G", omini_help, { desc = "llm omini_replace" })
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
