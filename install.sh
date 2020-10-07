ASDF_BRANCH=v0.7.8
ERLANG_OTP_VERSION=23.0.3
ELIXIR_OTP_VERSION=1.10.4-otp-23

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch ${ASDF_BRANCH}

# The following steps are for bash. If you’re using something else, do the
# equivalent for your shell.
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
source ~/.bashrc

# Note #1:
# If on Debian or Ubuntu, you'll want to install wx before running the next
# line: sudo apt install libwxgtk3.0-dev

# Note #2:
# It's possible to use different Erlang and Elixir versions with Nerves. The
# latest official Nerves systems are compatible with the versions below. In
# general, differences in patch releases are harmless. Nerves detects
# configurations that might not work at compile time.

asdf plugin-add erlang
asdf install erlang ${ERLANG_OTP_VERSION}
asdf global erlang ${ERLANG_OTP_VERSION}

asdf plugin-add elixir
asdf install elixir ${ELIXIR_OTP_VERSION}
asdf global elixir ${ELIXIR_OTP_VERSION}

mix local.hex --force
mix local.rebar --force

mix archive.install --force hex nerves_bootstrap
