require('orgmode').setup_ts_grammar()

-- Treesitter configuration
require('nvim-treesitter.configs').setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop,
  -- highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    disable = {'org'}, -- without this, some org files run _really_ slow
    -- Required for spellcheck, some LaTex highlights and
    -- code block highlights that do not have ts grammar
    additional_vim_regex_highlighting = {'org'},
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_default_notes_file = '~/Documents/MyDocuments/Orgmode/orgmode/refile.org',
  org_todo_keywords = {'TODO(t)', 'NEXT(n)', "WAIT(w)", "HOLD(h)", '|', 'CNCL(c)', 'DONE(d)', 'MEET'},
  org_agenda_start_on_weekday = false,
  org_agenda_skip_scheduled_if_done = true,
  org_agenda_span = 'day',
  win_split_mode = 'vertical',
  org_agenda_templates = {
    b = {
      description = 'Bookmark - easy integration with the bookmark copier',
      template = '* %?\n  %T\n  %x',
      target = '~/Documents/MyDocuments/Orgmode/orgmode/bookmarks.org',
    },
    n = {
      description = 'Note - a quick note to refile/rewrite later',
      template = '* %?\n  %T',
      target = '~/Documents/MyDocuments/Orgmode/orgmode/refile.org',
    },
    t = {
      description = 'Task - similar to note, but something must be done',
      template = '* TODO %?\n  %T',
      target = '~/Documents/MyDocuments/Orgmode/orgmode/refile.org',
    },
    j = {
      description = 'Journal - similar to note, but more of a journal style, to it\'s own file',
      template = '* %<%Y-%m-%d %A %I:%M %p>\n  %U\n  %?',
      target = '~/Documents/MyDocuments/Orgmode/orgmode/journal.org',
    },
    s = {
      description = 'Schedule - a meeting, appointment, or task to be at a certain time',
      template = '* TODO %?\n  SCHEDULED: %T',
      target = '~/Documents/MyDocuments/Orgmode/orgmode/refile.org',
    },
    p = {
      description = 'Project - used, probably sparingly, to create a new top level project',
      template = '* %?\n  %u\n  :PROPERTIES: \n  :Summary: \n  :END:\n',
      target = '~/Documents/MyDocuments/Orgmode/orgmode/projects.org',
    },
    a = {
      description = 'Account - similar to a project, but usually useful when there is an external account to use',
      template = '* %?\n  %u\n  :PROPERTIES: \n  :Summary: \n  :END:\n* Account :ACCOUNT:\n   :PROPERTIES:\n   :http:\n   :mail:\n   :user:\n   :pass:\n   :END:',
      target = '~/Documents/MyDocuments/Orgmode/orgmode/refile.org',
    }
  },
})

require 'user.org.local-orgfiles'
