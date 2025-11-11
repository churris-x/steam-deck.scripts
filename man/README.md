# Fran's custom manual pages
A collection of man pages for the various aliases and functions I use

## How to use
1. Add this folder to your `$MANPATH` variable, on your `.bash_aliases_HOST`
```bash
prepend_to_path MANPATH $HOME/.scripts/man
```
2. Show all man pages belonging to this manual:
```bash
man -M ~/.scripts/man -k .
# or
llias
```
3. Read the manual page for my aliases or functions
```bash
man fran-aliases
man fran-functions
```
4. Read the manual page for a specific command:
```bash
man gbump
```

## Create roff manual pages from markdown
1. `brew install pandoc`
2. Create a `./man1/COMMAND.md` file
> Pandoc is very specific with the way it translates markdown to roff.  
> Use the following conventions to make sure the man page generates correctly:
>   
>   - Add header metadata with YAML section markers:
>   ```bash
>     ---
>     title: NAME                        # Page name
>     section: 1                         # Manual section, usually 1
>     date: yyyy-mm-dd                   # Date of last revision, i.e. a makeshift version control
>     footer: ~/.scripts                 # Source: the name and version of the manual project
>     header: Frans Fun Functions        # Manual name
>     ---
>   ```
>   - Headings should be in ALL CAPS
>   - Backticks help escape markdown syntax, especially useful against `<>` being parsed as html tags
> 
> There is a template.md file that should help you get started
> 
3. Convert it to a roff man page with:
```bash
pandoc -s COMMAND.md --output COMMAND.1
```
> [!WARNING] 
> The -s, or --standalone flag ensures the title, section and author headers outputs to the file

I created some helper aliases for this exact purpose, which are located in `bash/bash_aliases_faraday` at the moment.

The main alias to use is `mangen`, which will look inside `~/.scripts/man/man1`, find any `.md` files, and convert them to the roff format.

It will also automatically update the date for all modified pages, following the manual page convention.

## Links
- [Linux man-pages(7)](https://linux.die.net/man/7/man-pages)
