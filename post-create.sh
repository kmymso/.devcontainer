#!/bin/sh
set -x

# Update apt and installed packages
sudo apt-get update
sudo apt-get upgrade -y

# Install mise
curl https://mise.run | sh
echo -e '\n# mise activation' >> ~/.bashrc
echo 'eval "$(~/.local/bin/mise activate bash)"' >> ~/.bashrc
echo -e '\n# mise PATH configuration' >> ~/.bash_profile
echo 'export PATH="$HOME/.local/share/mise/shims:$PATH"' >> ~/.bash_profile

# Enable mise
mise trust --all

# Change pnpm store location
# @see: https://github.com/pnpm/pnpm/issues/3952#issuecomment-1262136483
pnpm config set store-dir ~/pnpm
