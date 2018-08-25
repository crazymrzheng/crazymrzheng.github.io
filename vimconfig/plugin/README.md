# Plugin
---
## Ctags
- Download  
  - Official site: http://ctags.sourceforge.net/
  - VIM online: http://www.vim.org/scripts/script.php?script_id=610
- Command

  ```
  ctags -R *     //Create tags file  
  Ctrl + ]       //Jump forward  
  Ctrl + T  or  Ctrl + O   //Jump back
  ```

## Taglist
- Download: http://www.vim.org/scripts/script.php?script_id=273
- Note vim config  

  ```
  $ whereis ctags  
      
  //.vimrc
  let Tlist_Ctags_Cmd="/usr/bin/ctags"
  ```
