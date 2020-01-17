#/!bin/bash
# Check for homebrew, install if missing:
command -v brew >/dev/null 2>&1 || { echo >&2 "Installing Homebrew Now"; \
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }    

function brew_check_or_install () {
    #Check if brewed package is installed, install if missing.
    command -v $1 >/dev/null 2>&1 || { echo >&2 "Package $1 not found. Installing..."; \
    brew install $1;}
} 

pkgs=(
    fzf
    kubectx
    kubernetes-helm
    kubectl
    stern
    kustomize
)
for i in "${pkgs[@]}"; do
    # echo "$i"
    brew_check_or_install "$i"
done
