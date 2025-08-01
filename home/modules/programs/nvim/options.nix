{
  programs.nvf.settings.vim = {
    enableLuaLoader = true;
    additionalRuntimePaths = [
      ./after
    ];
    extraLuaFiles = [
      (builtins.path {
        path = ./globals.lua;
      })
      (builtins.path {
        path = ./helpers.lua;
      })
      (builtins.path {
        path = ./set_colorscheme.lua;
      })
      (builtins.path {
        path = ./lsp.lua;
      })
    ];

    clipboard = {
      enable = true;
      registers = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    globals = {
      mapleader = " ";
      editorconfig = true;
      loaded_netrw = 1;
      loaded_netrwPlugin = 1;
    };

    options = {
      number = true;
      relativenumber = true;
      ignorecase = true;
      smartcase = true;
      incsearch = true;
      hlsearch = true;
      tabstop = 8;
      shiftwidth = 8;
      softtabstop = 8;
      expandtab = false;
      autoindent = true;
      smartindent = true;
      splitbelow = true;
      splitright = true;
      wrap = false;
      termguicolors = true;
      cursorline = true;
      colorcolumn = "80";
      showmode = false;
      showtabline = 0;
      signcolumn = "no";
      undofile = true;
      swapfile = false;
      backup = false;
      writebackup = false;
      scrolloff = 8;
      sidescrolloff = 10;
      pumheight = 8;
      cmdheight = 1;
      updatetime = 50;
      mouse = "";
      guicursor = "";
      completeopt = "menuone,noselect";
      fileformat = "unix";
      fileformats = "unix,dos";
      conceallevel = 0;
      foldcolumn = "0";
      foldenable = false;
      foldlevel = 99;
      foldlevelstart = 99;
      foldmethod = "indent";
      autochdir = false;
      fillchars = "eob:~,fold: ,foldopen:,foldsep: ,foldclose:,vert:▏,lastline:▏";
      smoothscroll = true;
    };
  };
}
