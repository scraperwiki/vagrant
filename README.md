# ScraperWiki Vagrant Configuration

This helps you create a local Ubuntu Raring development environment which
(roughly, at the moment) matches the packages on our servers.

To get started, clone this repository and run:

```
vagrant up
```

The shut down the virtual machine:

```
vagrant suspend
```

To re-run the puppet manifest:

```
vagrant provision
```

This will (download) and install a minimal Ubuntu Raring base image and install
the ScraperWiki PPA.

# Packages

It currently installs libpoppler-glibc from our PPA and nothing else. This
should probably reflect all the packages installed in the base jail, but not
until we work out how we're going forward with that.
