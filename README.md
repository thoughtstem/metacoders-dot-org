metacoders.org
============

# Install

```
git clone git@github.com:thoughtstem/metacoders-dot-org.git
cd metacoders-dot-org
raco pkg install metacoders-dot-org-site/
racket main.rkt
```

That writes the compiled site to `out/`.  To see it:

```
cd out/
raco website-preview
```

# Deploy

Use `./deploy.sh` to deploy the `out` folder to `gh-pages` branch -- which makes the changes live at `metacoders.org` (currently changes are live at: `https://thoughtstem.github.io/metacoders-dot-org/` until `metacoders.org` is setup).



# Develop

If you want to just make content and new pages, simply work in `metacoders-dot-org-site`.  If you need to work on the lib, install it as a linked package:

```
raco pkg update --link metacoders-dot-org-lib
```

Then, make changes in `metacoders-dot-org-lib`.

# Image Guidelines
- Know difference between JPG, PNG, GIF, and SVG: use appropriately:
  - JPG is best for photos/screenshots
  - SVG is best for simple line drawings
  - GIF is can be good for simple images too
  - PNG is a last resort (highest quality, but also largest size)
- Re-size and compress (lossy compression when possible) images to reduce file size but without reducing quality too much. You can use Photoshop's "Save for Web" feature.
  - Jumbotron images should be 2000 pixels wide
  - Other images should be no larger than 600 pixels (or whatever the max size the image is in your browser)
