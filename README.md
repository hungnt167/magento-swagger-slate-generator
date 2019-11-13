### Prerequisites

You're going to need:

 - **Linux or macOS** — Windows may work, but is unsupported.
 - **Ruby, version 2.3.3 or newer**
 - **Bundler, version 2.0.0 or newer** — If Ruby is already installed, but the `bundle` command doesn't work, just run `gem install bundler` in a terminal.
 - **Node Js, version 8.x or newer**
### Getting Set Up

1. Clone this repository :`git clone --recursive [link]`.
2. Open Terminal on repo folder 
3. Prepare a swagger json file (swagger.json), and move it to repo folder

#### Automation
```bash
#on MacOS
sh run.sh -e [whitelist end points] -l [code example languages]

#on Linux
. run.sh -e [whitelist end points] -l [code example languages]
```

#### Manually
1. Install js packages `npm i`
2. Generate md files from json file 
```shell
node node_modules/widdershins/widdershins.js swagger.json -o slate/source/index.html.md --language_tabs shell:Shell javascript:Javascript
```
##### Run
1. `cd slate`
2. Initialize and start Slate.
```bash
bundle install
bundle exec middleman server
```
You can now see the docs at http://localhost:4567. Whoa! That was fast!
##### Build static file
1. `cd slate`
```bash
bundle exec middleman build
```
