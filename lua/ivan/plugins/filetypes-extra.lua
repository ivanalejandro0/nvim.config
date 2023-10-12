-- Add extra filetypes support
return {
  { 'ekalinin/Dockerfile.vim', ft = { "Dockerfile", "dockerfile" }},
  'MaxMEllon/vim-jsx-pretty',
  'pangloss/vim-javascript',
  'HerringtonDarkholme/yats.vim',
  { 'peterhoeg/vim-qml', ft = "qml" },
  { 'posva/vim-vue', ft="vue" },
  'stephpy/vim-yaml',
  'cespare/vim-toml',
  'jparise/vim-graphql',
  -- watch out: https://github.com/sheerun/vim-polyglot/issues/236

  -- Styled-components: syntax highlighting for CSS in JS template strings.
  -- Unmaintained, see github repo
  -- { 'styled-components/vim-styled-components', branch = 'main' },
}
