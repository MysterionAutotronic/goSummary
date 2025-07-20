#!/bin/sh
cd "$(dirname "$0")"

for file in *.md; do
    # Skip if no .md files are found
    [ -e "$file" ] || continue

    # Skip README
    if [ "$(basename "$file")" = "README.md" ]; then
        continue
    fi

    # Remove .md extension to form PDF file name
    base=$(basename "$file" .md)
    output="${base}.pdf"

    # Init pandoc options
    toc_option=""
    toc_depth_option=""

    # Read first two lines
    line1=$(sed -n '1p' "$file")
    line2=$(sed -n '2p' "$file")

    # Check for toc
    if echo "$line1" | grep -qE '^\s*<!--toc-->\s*$'; then
        toc_option="--toc"
    fi

    # Check for toc depth
    if echo "$line2" | grep -qE '^\s*<!--toc-depth=[0-9]+\s*-->\s*$'; then
        depth=$(echo "$line2" | sed -nE 's/^\s*<!--toc-depth=([0-9]+)\s*-->\s*$/\1/p')
        toc_depth_option="--toc-depth=$depth"
    fi

    # Run Pandoc with the dynamically determined options
    pandoc "$file" -o "$output" $toc_option $toc_depth_option --pdf-engine=pdflatex

    echo "Generated $output"
done