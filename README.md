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

Use `./deploy.sh` to deploy the `out` folder to `gh-pages` branch -- which makes the changes live at `metacoders.org`.


# Develop

If you want to just make content and new pages, simply work in `metacoders-dot-org-site`.  If you need to work on the lib, install it as a linked package:

```
raco pkg update --link metacoders-dot-org-lib
```

Then, make changes in `metacoders-dot-org-lib`.



