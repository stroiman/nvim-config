local ok, autoSession = pcall(require, "auto-session")

if ok then
  local sessionLens = require('auto-session.session-lens')
  autoSession.setup {
    log_level = "error",
    auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
    -- session_lens = {
    --
    -- }
  }

  vim.keymap.set('n', '<leader>fs', sessionLens.search_session, {
    noremap = true,
  })
end

