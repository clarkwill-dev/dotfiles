return {
  'linux-cultist/venv-selector.nvim',
  dependencies = {
    { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },
  },
  ft = 'python',
  keys = { { '<localleader>v', '<cmd>VenvSelect<cr>' } },
  opts = {
    options = {
      notify_user_for_activation = true,
      post_activate_hook = function() vim.cmd 'LspRestart' end,
    },
    search = {
      -- Project-local .venv (uv venv, python -m venv, etc.)
      local_venv = {
        command = "fd 'bin/python$' .venv --full-path --color never",
      },
      -- uv-managed pythons
      uv_pythons = {
        command = "fd 'bin/python$' /Users/willclark/.local/share/uv/python --full-path --color never",
        type = 'virtual',
      },
      -- conda base
      conda_base = {
        command = "fd '^python$' /opt/miniconda3/bin --max-depth 1 --color never",
        type = 'anaconda',
      },
      -- named conda envs
      conda_envs = {
        command = "fd 'bin/python$' /opt/miniconda3/envs --full-path --color never",
        type = 'anaconda',
      },
    },
  },
}
