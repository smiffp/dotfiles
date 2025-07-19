# dotnet
asdf plugin-add dotnet-core https://github.com/emersonsoares/asdf-dotnet-core.git
asdf install dotnet-core latest
asdf global dotnet-core latest

# node
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs lts
asdf global nodejs lts

# ruby
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby latest
asdf global ruby latest

#  java
asdf plugin add java https://github.com/halcyon/asdf-java.git

LATEST_JAVA=$(asdf list all java openjdk | grep -E "openjdk-\d{2}$" | tail -1)

asdf install java "${LATEST_JAVA}"
asdf global java "${LATEST_JAVA}"

# python
asdf plugin add python

LATEST_PYTHON_V2=$(asdf list all python | grep -E "^2\.\d+\.\d+$" | tail -1)
LATEST_PYTHON=$(asdf list all python | grep -E "^\d+\.\d+\.\d+$" | tail -1)

asdf install python "${LATEST_PYTHON}"
asdf install python "${LATEST_PYTHON_V2}"
asdf global python "${LATEST_PYTHON}"
