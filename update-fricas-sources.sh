tar xvf fricas-1.3.8-full.tar.bz2 -C /tmp
export FRICAS_FULL_DIR=/tmp/fricas-1.3.8
rm -rf ./algebra/
cp -r $FRICAS_FULL_DIR/pre-generated/src/algebra/ ./
cp -r $FRICAS_FULL_DIR/pre-generated/target/algebra/* algebra/
cp $FRICAS_FULL_DIR/src/lisp/*.lisp lisp/
## configure and build in $FRICAS_FULL_DIR
rm interp/*.lisp
cp $FRICAS_FULL_DIR/src/interp/*lisp interp/
cp $FRICAS_FULL_DIR/src/interp/exposed.lsp interp/exposed.lisp
rename clisp lisp interp/*.clisp

rm lisp/compile-algebra.lisp lisp/compile-interp.lisp
for f in algebra/*.lsp; do echo "(compile-file \"$f\")" >> lisp/compile-algebra.lisp ; done
sed -i 's|.*PATTERN.lsp.*|#-:ABCL(compile-file "algebra/PATTERN.lsp")|' lisp/compile-algebra.lisp
sed -i 's|.*POLYVEC.lsp.*|#-:ABCL(compile-file "algebra/POLYVEC.lsp")|' lisp/compile-algebra.lisp
for f in interp/*.lisp; do echo "(compile-file \"$f\")" >> lisp/compile-interp.lisp ; done
