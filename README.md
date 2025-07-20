# summary
Template repository for markdown summaries

## Installation
- requires WSL2 on Windows
- run install script when you don't have pandoc and latex installed
- best used in vscode (cSpell extension and ruler)

## Usage
1. Create a markdown file in the **root** folder
2. Run generatePDF script to automatically compile all .md files in the root folder

NOTE: normal lines wrap over normally, but code blocks can cause overflow (thereby obey to the ruler for code blocks)

## TOC
The first two lines of the markdown file control the optional **TOC**
1. `<!--toc-->` <- generate a **TOC**
2. `<!--toc-depth=x-->`, where `x` controls the **depth** to which headings are indexed