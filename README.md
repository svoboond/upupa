## Upupa
Personal dotfiles and system maintenance.

### Install
1. project setup
   - `echo "$(whoami) ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$(whoami)`
   - `sudo pacman -S --needed git ansible rsync`
   - `mkdir ~/svoboond/github && cd ~/svoboond/github && git clone https://github.com/svoboond/upupa.git && cd upupa`
2. install packages
   - `make install`
3. system settings
   - enable verbose boot
     - `sudo nvim /etc/default/grub`
       - remove `quiet` from `GRUB_CMDLINE_LINUX_DEFAULT`
     - `sudo grub-mkconfig -o /boot/grub/grub.cfg`
4. Git
   - `git config --global core.excludesfile ~/.gitignore_global`
   - `git config --global core.autocrlf input`
5. vault
   - mount vault
   - `VAULT_PATH=<vault_path> make vault2host`
   - from vault
     - `sudo cp -rp Pictures/* ~/Pictures && sudo chown -R $(whoami):$(whoami) ~/Pictures`
   - follow sub `README.md` files
6. Gnome settings
   - Settings
     - -> Keyboard -> Input Sources - Add Input Source
     - -> Mouse & Touchpad -> Mouse -> Pointer Speed
     - -> Accessibility -> Seeing -> Reduce Animations 
   - Tweaks
     - -> Keyboard -> Additional Layout options -> Caps Lock Behaviour -> Make Caps Lock an additional Esc, but Shift + Caps Lock is the regular Caps Lock
     - -> Appearance -> Background -> Default Image
   - Dock
     - Firefox, Kitty, Thunderbird, Webcord
7. Firefox
   - login
   - sync
     - Bookmarks
     - Add-ons
     - Passwords
     - Settings
   - make default
   - set default search engine
     - SearXNG
   - show bookmarks toolbar
     - https://support.mozilla.org/en-US/kb/bookmarks-toolbar-display-favorite-websites
8. NVIDIA
   - check installed drivers
     - `inxi -G`
   - https://wiki.archlinux.org/title/NVIDIA
   - Wayland
     - `sudo pacman -S nvidia`
     - `sudo pacman -S nvidia-prime`
     - add kernel parameter
       - https://wiki.archlinux.org/title/NVIDIA#DRM_kernel_mode_setting
     - make sure the following line is commented in `/etc/gdm/custom.conf`
       - `#WaylandEnable=false`
     - https://wiki.archlinux.org/title/GDM#Wayland_and_the_proprietary_NVIDIA_driver
       - `ln -s /dev/null /etc/udev/rules.d/61-gdm.rules`

### Upgrade
- `make upgrade`

### Vault
- host2vault
  - `VAULT_PATH=<vault_path> make host2vault`
- vault2host
  - `VAULT_PATH=<vault_path> make vault2host`
