local options = {
  ensure_installed = {
    "lua",
    "bash",
    "python",
    "go",
    "gomod",
    "gosum",
    "yaml",
    "toml",
    "json",
    "sql",
    "markdown",
    "markdown_inline",
    "mermaid",
    "dockerfile",
    "vim",
    "vimdoc",
    "make",
    "html",
    "javascript",
    "rego",
  },

  indent = {
    enable = true,
    disable = {
      "python"
    },
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },
}

return options
