# 📋 copydirclip

**copydirclip** is a handy alias that copies the contents of a directory into your clipboard in a format easily digestible by LLMs (Language Learning Models).

## Features
- Copies top-level files by default.
- 🌲 **Recursive mode**: Includes a directory tree and full paths for nested files.
- 📂 **Glob filtering**: Copy specific file types.
- 📋 Outputs contents in a structured, LLM-friendly format.

## Installation

Run the following script to install:

```bash
./install.sh
```
make sure `install.sh` is executable (`chmod u+x install.sh`)

This will set up copydirclip as an alias in your shell.

## Usage

```bash
copydirclip [-r] [-g <glob_pattern>]
```

* `-r`: Copy recursively
* `-g`: Glob pattern for file filtering (e.g. `*.txt`)

## Example

* Copy all project documentation in markdown into clipboard

```bash
copydirclip -r -g "*.md"
```

## Uninstall

To remove the alias, edit your `~/.bashrc` or `~/.zshrc` and delete the `copydirclip` alias line.
