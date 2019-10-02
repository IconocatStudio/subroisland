#!/bin/bash
google-chrome http://0.0.0.0:8000/index.html &
python -m http.server
