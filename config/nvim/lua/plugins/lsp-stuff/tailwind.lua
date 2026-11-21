return {
  -- exclude a filetype from the default_config
  filetypes_exclude = { "markdown" },
  -- add additional filetypes to the default_config
  filetypes_include = {},
  -- to fully override the default_config, change the below
  -- filetypes = {}

  -- additional settings for the server, e.g:
  -- tailwindCSS = { includeLanguages = { someLang = "html" } }
  -- can be addeded to the settings table and will be merged with
  -- this defaults for Phoenix projects
  settings = {
    tailwindCSS = {
      -- Delete this if shit goes wrong
      validate = false,
      classAttributes = { "class", "className" },
      --

      includeLanguages = {
        elixir = "html-eex",
        eelixir = "html-eex",
        heex = "html-eex",
      },
    },
    lint = {
      -- cssConflict = "warning",
      invalidApply = "ignore", -- ignores @apply warnings
    },
  },
}
