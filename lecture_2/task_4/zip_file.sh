#!/bin/bash

find source_dir -name '*.html' -print0 | xargs -0 zip -j htmls.zip
zip -sf htmls.zip

