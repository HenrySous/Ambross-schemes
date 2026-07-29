# Caelestia Community Schemas

A community-driven collection of color schemes for the **Caelestia** ecosystem.

This repository provides carefully crafted themes following a consistent structure, making it easy to install, customize, and create your own variants.

## Included Themes

Each color family includes multiple variants:

- 🌞 Light
- 🌗 Default
- 🌙 Dark
- ⚫ Monochrome
- ♿ High Contrast

Example:

```text
Purple/
├── Default/
├── Dark/
├── Light/
├── Monochrome/
└── HighContrast/

Magenta/
├── Default/
├── Dark/
├── Light/
├── Monochrome/
└── HighContrast/
```

---

# Installation

Locate your Caelestia installation.

Usually the schemas are stored in:

```bash
/usr/lib/python3.14/site-packages/caelestia/data/schemes/
```

> Your Python version may differ.

---

## Install a Theme

Copy the desired theme folder into the `schemes` directory.

Example:

```bash
sudo cp -r Purple /usr/lib/python3.14/site-packages/caelestia/data/schemes/
```

or

```bash
sudo cp -r Magenta /usr/lib/python3.14/site-packages/caelestia/data/schemes/
```

The final structure should look like:

```text
schemes/
├── Purple/
│   ├── Default/
│   ├── Dark/
│   ├── Light/
│   ├── Monochrome/
│   └── HighContrast/
│
└── Magenta/
    ├── Default/
    ├── Dark/
    ├── Light/
    ├── Monochrome/
    └── HighContrast/
```

---

# Applying a Theme

Open the Caelestia settings and select the desired color scheme.

Or use the CLI if supported by your installation.

---

# Creating Your Own Theme

Creating a new theme is easy.

Create a new folder inside `schemes`.

Example:

```text
Emerald/
└── Default/
    ├── dark.txt
    ├── light.txt
    ├── default.txt
    ├── monochrome.txt
    └── high-contrast.txt
```

Each file represents a different variant of the same color palette.

---

# Repository Structure

```text
.
├── Purple/
├── Magenta/
├── Blue/
├── Green/
├── Orange/
├── Red/
└── ...
```

Each folder is a **color family**.

Inside each family you'll find the available variants.

---

# Contributing

Contributions are welcome!

When submitting a new theme:

- Keep the folder structure consistent.
- Use only 6-digit hexadecimal colors (RGB).
- Keep naming consistent with existing themes.
- Test the theme before opening a Pull Request.

---

# License

This repository follows the same license as the original Caelestia project unless otherwise specified.
