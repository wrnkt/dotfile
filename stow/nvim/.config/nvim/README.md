# LazyVim

## Getting Started

This currently works with nvim v0.10.2 (see
[releases](https://github.com/neovim/neovim/releases)). Not sure beyond that.

After installing the right neovim version:

```sh
# Back up default / old config
mv ~/.config/nvim{,.bak}

# Recommended to backup neovim's installed data, cache, etc
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

# Clone the new config
git clone --depth=1 git@github.com:wrnkt/lazyvim.git ~/.config/nvim

# Run neovim
nvim
```

### Font Installation

If you care, you also need a patched system font to show LSP icons, hints, and
other stuff in the terminal. You can pull
[this repo](https://github.com/ryanoasis/nerd-fonts) of patched fonts down and
use the `./install.sh` script to install them. Or you can patch a font of your
choice with the new glyphs. I just use the already patched Iosevka.

```sh
# Get the font repo
git clone --depth=1 https://github.com/ryanoasis/nerd-fonts ./nerd-fonts
cd ./nerd-fonts

# Install font by name
./install.sh Iosevka

# Rebuild font caches
fc-cache -fv

# Check the font is loaded
fc-list | grep -i iosevka
```

Then set it as your terminal's font.

### C++ Integration / LSP

The [CMake](https://www.lazyvim.org/extras/lang/cmake) and
[Clangd](https://www.lazyvim.org/extras/lang/clangd) extras you probably want to
use should be active already (see `~/.config/nvim/lua/config/lazy.lua` line 22
and line 30).

You’ll need to update `~/.config/nvim/lua/plugins/lsp.lua` with C++ specific
config though. It should look something like this:

```lua
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      clangd = {
        cmd = { "clangd" },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_dir = require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
      },
    },
  },
}
```

When in a C++ project you may need to generate a `compile_commands.json` with
CMake for the LSP to work properly if the project root doesn’t have a `.git/`
directory.

```sh
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -B build
```

You also might need to install `clangd` if you don’t have it. You can install it
in nvim by running the command `:Mason` and picking `clangd`. Or you can just
install with dnf, apt or whatever. As long as it’s on the PATH it should work.
