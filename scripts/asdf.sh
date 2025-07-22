# lazydocker
asdf plugin add lazydocker https://github.com/comdotlinux/asdf-lazydocker.git
asdf install lazydocker latest
asdf set -u lazydocker latest

# tilt
asdf plugin add tilt
asdf install tilt latest
asdf set -u tilt latest

# ? weirdness around dotnet command
# dotnet
asdf plugin add dotnet https://github.com/hensou/asdf-dotnet.git
asdf install dotnet latest
asdf set -u dotnet latest

# go
asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
asdf install golang latest
asdf set -u golang latest

# node
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs lts
asdf set -u nodejs lts

# ruby
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby latest
asdf set -u ruby latest

# java
asdf plugin add java https://github.com/halcyon/asdf-java.git

LATEST_JAVA=$(asdf list all java openjdk | grep -E "openjdk-\d{2}$" | tail -1)

asdf install java "${LATEST_JAVA}"
asdf set -u java "${LATEST_JAVA}"

# python
asdf plugin add python

LATEST_PYTHON_V2=$(asdf list all python | grep -E "^2\.\d+\.\d+$" | tail -1)
LATEST_PYTHON=$(asdf list all python | grep -E "^\d+\.\d+\.\d+$" | tail -1)

asdf install python "${LATEST_PYTHON}"
asdf install python "${LATEST_PYTHON_V2}"
asdf set -u python "${LATEST_PYTHON}"
