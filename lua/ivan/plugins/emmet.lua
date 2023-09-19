return {
  'mattn/emmet-vim',
  init = function()
    -- change the default emmet key to avoid overriding the vim <c-y> movement
    vim.g.user_emmet_leader_key = "<leader>e"
  end
}
