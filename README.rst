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


Development
-----------

Install as instructed above, but replace the stable sources in ``~/.fontconfig``
with a link to a clone of this repo or your fork. FontConfig rules in master
branch are fully compatible with the latest released font packages.


.. image:: https://img.shields.io/badge/License-MIT-yellow.svg
  :target: https://opensource.org/licenses/MIT

.. image:: https://img.shields.io/github/issues/dumol/pixelperfect.svg
  :target: https://github.com/dumol/pixelperfect/issues
