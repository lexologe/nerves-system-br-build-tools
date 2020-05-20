git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.1

# The following steps are for bash. If you’re using something else, do the
# equivalent for your shell.
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
source ~/.bashrc

asdf plugin-add erlang
asdf plugin-add elixir

# Note #1:
# If on Debian or Ubuntu, you'll want to install wx before running the next
# line: sudo apt install libwxgtk3.0-dev

# Note #2:
# It's possible to use different Erlang and Elixir versions with Nerves. The
# latest official Nerves systems are compatible with the versions below. In
# general, differences in patch releases are harmless. Nerves detects
# configurations that might not work at compile time.
asdf install erlang 22.3.2
asdf install elixir 1.10.2-otp-22
asdf global erlang 22.3.2
asdf global elixir 1.10.2-otp-22

mix local.hex --force
mix local.rebar --force

mix archive.install --force hex nerves_bootstrap
