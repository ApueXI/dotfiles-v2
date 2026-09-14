return -- install with yarn or npm
{
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  -- build = "cd app && npm install",
  build = "cd app && npm install && git checkout yarn.lock",
  -- init = function()
  --   vim.g.mkdp_filetypes = { "markdown" }
  -- end,
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }

    -- ==========================================
    -- OPTION 1: Just open a specific browser
    -- ==========================================
    -- vim.g.mkdp_browser = "firefox"
    -- vim.g.mkdp_browser = "google-chrome"

    -- ==========================================
    -- OPTION 2: Open a new window / instance
    -- ==========================================
    -- We define a Vimscript function to pass the exact command flags,
    -- then tell the plugin to use this function to open the URL.
    vim.cmd([[
      function! OpenMarkdownPreviewInNewWindow(url)
        " Change 'google-chrome' and '--new-window' to match your browser of choice
        call jobstart(['chromium', '--new-window', a:url])
      endfunction
    ]])
    vim.g.mkdp_browserfunc = "OpenMarkdownPreviewInNewWindow"
  end,
  ft = { "markdown" },
}
