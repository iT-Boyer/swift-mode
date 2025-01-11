#!/bin/sh

# Run tests.  Used in Makefile.

./scripts/invoke_eldev.sh emacs --version || exit 1
./scripts/invoke_eldev.sh compile --set=all || exit 1
./scripts/invoke_eldev.sh emacs --batch -q \
  --eval "(add-to-list 'load-path \"$(readlink -f .)\")" \
  --eval "(add-to-list 'load-path \"$(readlink -f .)/test\")" \
  --eval "(setq debug-on-error t)" \
  --eval "(setq max-lisp-eval-depth 1600)" \
  -l test/swift-mode-test.el \
  -f swift-mode:run-test
