# Set nvim as my default editor
set -Ux VISUAL nvim
set -Ux EDITOR nvim

# Set lang to UTF-8
set -Ux LANGUAGE en_US.UTF-8
set -Ux LC_ALL en_US.UTF-8
set -Ux LANG en_US.UTF-8
set -Ux LC_TYPE en_US.UTF-8

# n node version manager
set -Ux N_PREFIX $HOME/.n
fish_add_path $N_PREFIX
