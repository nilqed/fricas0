#!/bin/bash

# rename may be from PERL, we need that from unix tools. 
rename_cmd=rename.ul

FRICAS0=fricas0
FRICAS_TREE=/home/xyz/devel/fricas-1.3.0
FRICAS0_TMP=/home/xyz/devel/mkfricas0/$FRICAS0

INTERP_LISP=$FRICAS0_TMP/interp.lisp
COMPILE_ALGEBRA=$FRICAS0_TMP/compile-algebra.lisp
FRICAS_LISP=$FRICAS0_TMP/fricas.lisp

mkdir $FRICAS0_TMP
mkdir $FRICAS0_TMP/algebra
mkdir $FRICAS0_TMP/interp
mkdir $FRICAS0_TMP/lisp
mkdir $FRICAS0_TMP/msgs

cp $FRICAS_TREE/src/interp/*.clisp $FRICAS0_TMP/interp
cp $FRICAS_TREE/src/interp/*.lisp $FRICAS0_TMP/interp
cp $FRICAS_TREE/src/interp/exposed.lsp $FRICAS0_TMP/interp/exposed.lisp
cp $FRICAS_TREE/pre-generated/src/algebra/*.lsp $FRICAS0_TMP/algebra
cp -r $FRICAS_TREE/pre-generated/target/algebra/*  $FRICAS0_TMP/algebra
cp $FRICAS_TREE/src/lisp/*.lisp $FRICAS0_TMP/lisp
cp $FRICAS_TREE/src/share/doc/msgs/*.msgs $FRICAS0_TMP/msgs

cd $FRICAS0_TMP/interp
$($rename_cmd .clisp .lisp *.clisp)

cd $FRICAS0_TMP


# Create interp.lisp (load interpreter)
echo ';;; Load interpreter,'$(date) > $INTERP_LISP
echo '(load "lisp/fricas-package")' >> $INTERP_LISP
echo '(load "lisp/fricas-lisp")' >> $INTERP_LISP
echo '(load "lisp/primitives")' >> $INTERP_LISP
echo ';;;' >> $INTERP_LISP
echo '(load "interp/hashcode")' >> $INTERP_LISP
echo '(load "interp/as")' >> $INTERP_LISP
echo '(load "interp/foam_l")' >> $INTERP_LISP
echo ';;;' >> $INTERP_LISP
echo '(load "interp/util")' >> $INTERP_LISP
echo '(load "interp/interp-proclaims.lisp")' >> $INTERP_LISP
echo ';;;' >> $INTERP_LISP
echo '(load "interp/vmlisp")' >> $INTERP_LISP
echo '(load "interp/macros")' >> $INTERP_LISP
echo '(load "interp/setq")' >> $INTERP_LISP
echo '(load "interp/buildom")' >> $INTERP_LISP
echo '(load "interp/cattable")' >> $INTERP_LISP
echo '(load "interp/clam")' >> $INTERP_LISP
echo '(load "interp/clammed")' >> $INTERP_LISP
echo '(load "interp/compat")' >> $INTERP_LISP
echo '(load "interp/compress")' >> $INTERP_LISP
echo '(load "interp/cparse")' >> $INTERP_LISP
echo '(load "interp/cstream")' >> $INTERP_LISP
echo '(load "interp/database")' >> $INTERP_LISP
echo '(load "interp/format")' >> $INTERP_LISP
echo '(load "interp/g-boot")' >> $INTERP_LISP
echo '(load "interp/g-cndata")' >> $INTERP_LISP
echo '(load "interp/g-error")' >> $INTERP_LISP
echo '(load "interp/g-opt")' >> $INTERP_LISP
echo '(load "interp/g-timer")' >> $INTERP_LISP
echo '(load "interp/g-util")' >> $INTERP_LISP
echo '(load "interp/hypertex")' >> $INTERP_LISP
echo '(load "interp/i-analy")' >> $INTERP_LISP
echo '(load "interp/i-code")' >> $INTERP_LISP
echo '(load "interp/i-coerce")' >> $INTERP_LISP
echo '(load "interp/i-coerfn")' >> $INTERP_LISP
echo '(load "interp/i-eval")' >> $INTERP_LISP
echo '(load "interp/i-funsel")' >> $INTERP_LISP
echo '(load "interp/i-intern")' >> $INTERP_LISP
echo '(load "interp/i-map")' >> $INTERP_LISP
echo '(load "interp/i-output")' >> $INTERP_LISP
echo '(load "interp/i-resolv")' >> $INTERP_LISP
echo '(load "interp/i-spec1")' >> $INTERP_LISP
echo '(load "interp/i-spec2")' >> $INTERP_LISP
echo '(load "interp/i-syscmd")' >> $INTERP_LISP
echo '(load "interp/i-toplev")' >> $INTERP_LISP
echo '(load "interp/i-util")' >> $INTERP_LISP
echo '(load "interp/incl")' >> $INTERP_LISP
echo '(load "interp/interop")' >> $INTERP_LISP
echo '(load "interp/int-top")' >> $INTERP_LISP
echo '(load "interp/lisplib")' >> $INTERP_LISP
echo '(load "interp/macex")' >> $INTERP_LISP
echo '(load "interp/match")' >> $INTERP_LISP
echo '(load "interp/msg")' >> $INTERP_LISP
echo '(load "interp/msgdb")' >> $INTERP_LISP
echo '(load "interp/nlib")' >> $INTERP_LISP
echo '(load "interp/nrunfast")' >> $INTERP_LISP
echo '(load "interp/nrungo")' >> $INTERP_LISP
echo '(load "interp/nrunopt")' >> $INTERP_LISP
echo '(load "interp/pathname")' >> $INTERP_LISP
echo '(load "interp/pf2sex")' >> $INTERP_LISP
echo '(load "interp/pile")' >> $INTERP_LISP
echo '(load "interp/posit")' >> $INTERP_LISP
echo '(load "interp/property")' >> $INTERP_LISP
echo '(load "interp/ptrees")' >> $INTERP_LISP
echo '(load "interp/record")' >> $INTERP_LISP
echo '(load "interp/rulesets")' >> $INTERP_LISP
echo '(load "interp/scan")' >> $INTERP_LISP
echo '(load "interp/serror")' >> $INTERP_LISP
echo '(load "interp/server")' >> $INTERP_LISP
echo '(load "interp/setvars")' >> $INTERP_LISP
echo '(load "interp/sfsfun")' >> $INTERP_LISP
echo '(load "interp/simpbool")' >> $INTERP_LISP
echo '(load "interp/slam")' >> $INTERP_LISP
echo '(load "interp/spad")' >> $INTERP_LISP
echo '(load "interp/termrw")' >> $INTERP_LISP
echo '(load "interp/trace")' >> $INTERP_LISP
echo '(load "interp/daase")' >> $INTERP_LISP
echo '(load "interp/fortcall")' >> $INTERP_LISP
echo '(load "interp/ncomp")' >> $INTERP_LISP
echo '(load "interp/parsing")' >> $INTERP_LISP
echo '(load "interp/parse")' >> $INTERP_LISP
echo '(load "interp/postpar")' >> $INTERP_LISP
echo '(load "interp/setvart")' >> $INTERP_LISP
echo '(load "interp/s-parser")' >> $INTERP_LISP
echo '(load "interp/scwrap2")' >> $INTERP_LISP
echo '(load "interp/spaderror")' >> $INTERP_LISP
echo ';;;' >> $INTERP_LISP
echo '(load "interp/ax")' >> $INTERP_LISP
echo '(load "interp/dq")' >> $INTERP_LISP
echo ';;;' >> $INTERP_LISP
echo '(load "interp/bc-matrix")' >> $INTERP_LISP
echo '(load "interp/bc-misc")' >> $INTERP_LISP
echo '(load "interp/bc-solve")' >> $INTERP_LISP
echo '(load "interp/ht-util")' >> $INTERP_LISP
echo '(load "interp/htsetvar")' >> $INTERP_LISP
echo '(load "interp/ht-root")' >> $INTERP_LISP
echo '(load "interp/br-con")' >> $INTERP_LISP
echo '(load "interp/br-data")' >> $INTERP_LISP
echo '(load "interp/showimp")' >> $INTERP_LISP
echo '(load "interp/br-op1")' >> $INTERP_LISP
echo '(load "interp/br-op2")' >> $INTERP_LISP
echo '(load "interp/br-search")' >> $INTERP_LISP
echo '(load "interp/br-util")' >> $INTERP_LISP
echo '(load "interp/br-prof")' >> $INTERP_LISP
echo '(load "interp/br-saturn")' >> $INTERP_LISP
echo ';;;' >> $INTERP_LISP
echo '(load "interp/apply")' >> $INTERP_LISP
echo '(load "interp/c-doc")' >> $INTERP_LISP
echo '(load "interp/c-util")' >> $INTERP_LISP
echo '(load "interp/profile")' >> $INTERP_LISP
echo '(load "interp/category")' >> $INTERP_LISP
echo '(load "interp/compiler")' >> $INTERP_LISP
echo '(load "interp/define")' >> $INTERP_LISP
echo '(load "interp/functor")' >> $INTERP_LISP
echo '(load "interp/info")' >> $INTERP_LISP
echo '(load "interp/iterator")' >> $INTERP_LISP
echo '(load "interp/modemap")' >> $INTERP_LISP
echo '(load "interp/nruncomp")' >> $INTERP_LISP
echo '(load "interp/package")' >> $INTERP_LISP
echo '(load "interp/htcheck")' >> $INTERP_LISP
echo '(load "interp/exposed")' >> $INTERP_LISP


# Create compile-algebra.lisp
echo ';;; Compile algebra, '$(date) > $COMPILE_ALGEBRA
for a in $FRICAS0_TMP/algebra/*.lsp; do b=$(basename $a);
  echo '(compile-file "algebra/'$b'")' >> $COMPILE_ALGEBRA ;
done


# Create fricas.lisp
echo ';;; FriCAS0, '$(date) > $FRICAS_LISP
echo '(load "interp.lisp")' >> $FRICAS_LISP
echo '(in-package :boot)' >> $FRICAS_LISP
echo '(defvar $spadroot ".")'  >> $FRICAS_LISP
echo '(defvar |$defaultMsgDatabaseName| "msgs/s2-us.msgs")' >> $FRICAS_LISP
echo '(defvar |$build_version| "COMMON-LISP")' >> $FRICAS_LISP
echo '(defvar |$build_date| "'$(date)'")' >> $FRICAS_LISP

/bin/cat <<EOM >>$FRICAS_LISP
 
;;; init      
(|interpsysInitialization|)

(setq |\$has_category_hash| (make-hash-table :test #'equal))
(setq |\$operation_hash| (make-hash-table))


 (|compressOpen|)
 (|interpOpen|)
 (|categoryOpen|)
 (|operationOpen|)
 (|browseOpen|)


(let ((*debugger-hook*
            (lambda (condition previous-handler)
                (spad-system-error-handler condition))
       ))
     (handler-bind ((error #'spad-system-error-handler))
       (|spad|)))
EOM


# Make package
cd $FRICAS0_TMP
cd ..
tar czf fricas0.tar.gz $FRICAS0
echo bye

exit




