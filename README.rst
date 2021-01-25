The _PixelPerfect_ FreeType font setup
======================================

Pixel-perfect font rendering under Wayland and X.org.

Custom Fontconfig rules trying to cover all “web safe fonts” with aliases to
similar — ideally metrically-equivalent — high-quality typefaces released
under a free-software license.

Uses exquisitely-hinted fonts to enhance text rendering at small sizes
for most used “web safe” typefaces on low DPI devices, similarly to
Windows pre-ClearType font rendering.

Ideally, most web pages should look sane and keep their character even if
your browser doesn't load any external fonts at all.


How to install
--------------

Clone this repository and link its directory as ``~/.config/fontconfig/``.

Download latest released font packages and unpack them to
``~/.local/share/fonts/``.


.. image:: https://img.shields.io/badge/License-MIT-yellow.svg
  :target: https://opensource.org/licenses/MIT

.. image:: https://img.shields.io/github/issues/dumol/pixelperfect.svg
  :target: https://github.com/dumol/pixelperfect/issues
