The PixelPerfect FreeType font setup
====================================

Pixel-perfect font rendering under Wayland and X.org.

Custom Fontconfig rules trying to cover all “web safe fonts” with aliases to
similar — ideally metrically-equivalent — high-quality typefaces released
under a free-software license.

Uses exquisitely-hinted fonts to enhance text rendering at small sizes
for most used “web safe” typefaces on low DPI devices, similarly to
Windows pre-ClearType font rendering.

Ideally, most web pages should look sane and keep their character even if
your browser doesn't load any external fonts at all. Reasons to avoid loading
external fonts, especially on mobile connections: security, privacy, bandwidth.
More at https://collinmbarrett.com/block-web-fonts/.

Here's a comparative screenshot taken on Debian 10 with default settings
and the PixelPerfect setup:

.. image:: https://github.com/dumol/PixelPerfect/raw/assets/Debian10.gif

This setup doesn't include any "color fonts". Emoji symbols, up to and including
those from Unicode 15.0, are supported through a regular "black emoji" font.
For coloured emoji, install an emoji font supported by your OS and apps.
There is currently no acceptable solution to cover all cases.


Installation
------------

**Automated**::

    curl -sL https://github.com/dumol/PixelPerfect/raw/assets/install.sh | sh -

**Manual**:

1. Download latest source package from **Releases** and link or copy/move
   its directory as ``~/.config/fontconfig``.
2. Download latest font packages from **Releases** and unpack them to
   ``~/.local/share/fonts/``.
3. Logout and login again.

To set GNOME fonts from command line (adjust the size of 10 if needed)::

    gsettings set org.gnome.desktop.interface font-name 'system-ui 10'
    gsettings set org.gnome.desktop.interface monospace-font-name 'monospace 10'

To have this setup working for Flatpak apps::

    flatpak override --user --filesystem=xdg-config/fontconfig:ro
    flatpak override --user --filesystem=xdg-data/fonts:ro

To have this setup working for a Snap package such as Firefox::

    ln -s ~/.local/share/fonts ~/snap/firefox/current/.local/share/fonts
    mv -v ~/snap/firefox/current/.config/fontconfig{,.orig}
    ln -s ~/.config/fontconfig ~/snap/firefox/current/.config/fontconfig
    fc-cache -f -r


Development
-----------

Install as instructed above, but replace the stable sources in ``~/.fontconfig``
with a link to a clone of this repo or your fork. FontConfig rules in master
branch are fully compatible with the latest released font packages.


.. image:: https://img.shields.io/badge/License-MIT-yellow.svg
  :target: https://opensource.org/licenses/MIT

.. image:: https://img.shields.io/github/issues/dumol/pixelperfect.svg
  :target: https://github.com/dumol/pixelperfect/issues
