if [ -z $1 ]; then
  echo "Email is required"
  exit 1;
fi

EMAIL=$1

# update git config
git config --global user.email "${EMAIL}"

# generate ssh key. -N "" = no passphrase; -f "" = filename
ssh-keygen -t rsa -b 4096 -C "${EMAIL}"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github

# generate gpg key
gpg --full-generate-key

SIGNING_KEY=$(gpg --list-secret-keys --keyid-format=long "${EMAIL}" | cut -d "/" -f 2 | head -c 16)
git config --global user.signingkey "${SIGNING_KEY}"
