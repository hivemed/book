# book

## setup

clone with

```bash
curl https://raw.githubusercontent.com/hivemed/book/master/clone.sh | sh -s book
```

## dependencies

### pandoc

see [installation instructions](http://pandoc.org/installing)

## usage

to build epub, html and pdf formats in their respective subdirectories of the build folder run

```bash
make
```

to build only one of the targets, such as the html version run

```bash
make html
```

to build the html target and preview in browser (requires `google-chrome` executable in `$PATH`) run

```bash
make preview
```
