# content

all content is under content, each dir will be added to the menu automatically, if a _index.LANG.md exists

under i18n are translations which are not inside the content

# Get hugo

Download hugo from github into beta dir

https://github.com/gohugoio/hugo/releases/tag/v0.91.2

# build

hugo.exe --minify

rsync -az public/ xxx:~/www/logi/

# local test

hugo.exe server