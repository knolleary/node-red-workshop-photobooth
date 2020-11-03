#!/bin/sh

ENABLE_PDF_EXPORT=1 mkdocs gh-deploy --config-file "${GITHUB_WORKSPACE}/mkdocs.yml" --force