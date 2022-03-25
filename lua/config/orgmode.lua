local status_ok, orgmode = pcall(require, "orgmode")
if not status_ok then
  return
end

-- Load custom tree-sitter grammar for org filetype
orgmode.setup_ts_grammar()

orgmode.setup {
  org_agenda_files = { "~/.local/share/org/**/*" },
  org_default_notes_file = "~/.local/share/org/refile.org",
  org_agenda_templates = {
    t = { description = "Task", template = "* TODO %?\n %u" },
    m = {
      description = "Meeting",
      template = "* MEETING %? :MEETING:\n  :LOGBOOK:\n  CLOCK: %U\n  :END:",
    },
    n = { description = "Note", template = "* NOTE %? :NOTE:\n %u" },
  },
}
