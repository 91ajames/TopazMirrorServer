# Topaz Offline Download Server

A local mirror for **Topaz Photo AI**, **Topaz Gigapixel AI**, and related AI model files.

This project allows you to install and restore Topaz AI models from a local server instead of downloading them from the Internet each time. It is intended for offline installations, system rebuilds, custom Windows images, and long-term software preservation.

---

## Features

* Offline AI model installation
* Local mirror using a simple HTTP server
* Supports multiple Topaz products and versions
* Preserves models that may no longer be distributed
* Eliminates repeated downloads after system reinstalls

---

## Why?

Even when the correct AI model files are already present, Topaz installers and applications may still attempt to contact Topaz's servers before continuing.

This project recreates the expected download structure locally, allowing the software to retrieve model files from your own server whenever possible.

---

## Repository Statistics

* **AI model files:** 325
* **Approximate size:** 78.9 GB

---

## Intended Uses

* Offline installation
* Windows deployment (OOBE/Sysprep)
* Virtual machines
* Local backup server
* Software preservation
* Archival of legacy Topaz releases

---

## Goal

Preserve the availability of Topaz AI models for future installations, even if official download sources change or become unavailable.


![github-small](https://github.com/91ajames/Topaz-Offline-Mirror-Server/blob/main/Topaz%20Model%20Downloader.png)

![github-small](https://raw.githubusercontent.com/91ajames/Topaz-Offline-Mirror-Server/refs/heads/main/TopazMirrorServer.png)
