# Liderbukh
### A program to create beautiful lead sheets using Python, Lilypond, and LaTeX, with templates and a collection of Yiddish folksongs

## Dependencies:
### Python 3
#### Modules:
* pyratemp
* yaml
* click
* mistune

### Lilypond and lilypond-book
### XeLaTeX
#### Packages:
* multicol
* verse
* fontspec
* graphicx
* polyglossia

### Font: Drugulin CLM
* [Link to the font on GitHub](https://github.com/derpayatz/fonts/tree/master/Fonts/Hebrew%20Letters%20only/Culmus%20Project%20(GPL%20and%20GPL%2BFE)/Maxim%20Iorsh%20(GPL)/Basic%20Fonts/Drugulin "Drugulin CLM on GitHub")

## Usage
```
$ chmod +x liderbukh.py
$ ./liderbukh.py --help
Usage: liderbukh.py [OPTIONS]

Options:
  -s, --settings-file PATH  Settings file. Default: settings.yaml
  -d, --debug               Turn debug mode on
  -n, --no-write            Generate song data but don't write any files
  --help                    Show this message and exit.
```
