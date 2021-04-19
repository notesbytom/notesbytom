# VIM Notes

# Modelines

Modelines are considered a security risk so they are always disabled for root and default-disabled for other users.
* https://vim.fandom.com/wiki/Modeline_magic

Modelines can be used in a **github gist** to set the **language** preference for **syntax highlighting**.

GitHub Linguist Overrides (for syntax highlighting language of a file)
* https://github.com/github/linguist/blob/master/docs/overrides.md

GitHub Linguist Languages List
* https://github.com/github/linguist/blob/master/lib/linguist/languages.yml

# Show Setting Values

Show values of VIM Setting Variables
* :set filetype?
* :set syntax?
* :set modeline?
* https://www.cs.swarthmore.edu/oldhelp/vim/variables.html
* :echo $VIMRUNTIME
  * $VIMRUNTIME/syntax/*.vim (language syntax definitions)
  * $VIMRUNTIME/filetype.vim (mapping file types)

