#! /bin/sh -l

if [ -d "/github" ]; then
sudo chown -R build /github/workspace /github/home
fi

sudo pacman -Syu --noconfirm

for pkg in $INPUT_PACKAGES; do
    yay -S "$pkg" --noconfirm --needed --useask --gpgflags "--keyserver pgp.mit.edu" || exit $?
done

eval $INPUT_SCRIPTS || exit $?
