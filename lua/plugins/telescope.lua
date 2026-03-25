return {
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
	},
	{
		'nvim-telescope/telescope.nvim',
		branch = 'master',
		dependencies = { 'nvim-lua/plenary.nvim' },
		opts = {
			defaults = {
				border = true,
			},
		},
		config = function(_, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension("fzf")
		end,
	},
}
