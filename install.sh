NOT_INSTALLED="NOT_INSTALLED"

MISSING_PACKAGES=0
MISSING_PACKAGES_MESSAGE="Unable to locate ${MISSING_PACKAGES} required packages. The following packages are required for this process: ";

verify_package() {
  if [ -z $2 ]; then
    NOT_INSTALLED_MESSAGE="${NOT_INSTALLED_MESSAGE} ${1}"
    MISSING_PACKAGES=$((MISSING_PACKAGES+1))
  fi
}

verify_package "curl" $(command -v curl)
verify_package "ditto" $(command -v ditto)
verify_package "gpg" $(command -v gpg)
verify_package "hdiutil" $(command -v hdiutil)

if [ $MISSING_PACKAGES -ne 0 ]; then
  echo "$MISSING_PACKAGES_MESSAGE"
fi

# https://brew.sh/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle install --file "$(dirname $0)/Brewfile"

# copy config files over to $HOME
cp -r "$(dirname $0)/configs/." ~

# git configuration
source "$(dirname $0)/scripts/git_config.sh"

# https://ohmyz.sh/#install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
