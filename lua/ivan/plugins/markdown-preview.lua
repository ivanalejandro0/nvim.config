return {
  "iamcco/markdown-preview.nvim",
  build = "cd app && yarn install",
  ft = "markdown",
  cmd = {
    'MarkdownPreview',
    'MarkdownPreviewStop',
    'MarkdownPreviewToggle',
  },
}
