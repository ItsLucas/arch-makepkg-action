#! /bin/sh -l

if [ -d "/github" ]; then
sudo chown -R build /github/workspace /github/home
fi

sudo pacman -Syu --noconfirm
sudo makepkg -si --skippgpcheck
for pkg in $INPUT_PACKAGES; do
    yay -S "$pkg" --noconfirm --needed --nopgpfetch --useask --gpgflags "--keyserver keyserver.ubuntu.com" || exit $?
done

eval $INPUT_SCRIPTS || exit $?
