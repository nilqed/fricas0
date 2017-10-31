
(DEFPARAMETER |JetBundleFunctionCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |JetBundleFunctionCategory;|)) 

(DEFPARAMETER |JetBundleFunctionCategory;AL| 'NIL) 

(DEFUN |JetBundleFunctionCategory| (#1=#:G746)
  (LET (#2=#:G747)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |JetBundleFunctionCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |JetBundleFunctionCategory;AL|
              (|cons5| (CONS #3# (SETQ #2# (|JetBundleFunctionCategory;| #1#)))
                       |JetBundleFunctionCategory;AL|))
      #2#)))) 

(DEFUN |JetBundleFunctionCategory;| (|t#1|)
  (SPROG ((#1=#:G745 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (|sublisV| (PAIR '(#2=#:G744) (LIST '(|Symbol|)))
                                         (COND
                                          (|JetBundleFunctionCategory;CAT|)
                                          ('T
                                           (LETT
                                            |JetBundleFunctionCategory;CAT|
                                            (|Join|
                                             (|PartialDifferentialRing| '#2#)
                                             (|GcdDomain|)
                                             (|RetractableTo| '|t#1|)
                                             (|mkCategory|
                                              '(((X ($ (|PositiveInteger|))) T)
                                                ((U ($ (|PositiveInteger|))) T)
                                                ((P
                                                  ($ (|PositiveInteger|)
                                                   (|List|
                                                    (|NonNegativeInteger|))))
                                                 T)
                                                ((X ($)) T) ((U ($)) T)
                                                ((P
                                                  ($
                                                   (|List|
                                                    (|NonNegativeInteger|))))
                                                 T)
                                                ((P
                                                  ($ (|PositiveInteger|)
                                                   (|NonNegativeInteger|)))
                                                 T)
                                                ((P ($ (|NonNegativeInteger|)))
                                                 T)
                                                ((|setNotation|
                                                  ((|Void|) (|Symbol|)))
                                                 T)
                                                ((|getNotation| ((|Symbol|)))
                                                 T)
                                                ((|numIndVar|
                                                  ((|PositiveInteger|)))
                                                 T)
                                                ((|numDepVar|
                                                  ((|PositiveInteger|)))
                                                 T)
                                                ((|coerce| ($ |t#1|)) T)
                                                ((|jetVariables|
                                                  ((|List| |t#1|) $))
                                                 T)
                                                ((|const?| ((|Boolean|) $)) T)
                                                ((|order|
                                                  ((|NonNegativeInteger|) $))
                                                 T)
                                                ((|class|
                                                  ((|NonNegativeInteger|) $))
                                                 T)
                                                ((|numerator| ($ $)) T)
                                                ((|denominator| ($ $)) T)
                                                ((|jacobiMatrix|
                                                  ((|SparseEchelonMatrix| |t#1|
                                                                          $)
                                                   (|List| $)))
                                                 T)
                                                ((|jacobiMatrix|
                                                  ((|SparseEchelonMatrix| |t#1|
                                                                          $)
                                                   (|List| $)
                                                   (|List| (|List| |t#1|))))
                                                 T)
                                                ((|extractSymbol|
                                                  ((|SparseEchelonMatrix| |t#1|
                                                                          $)
                                                   (|SparseEchelonMatrix| |t#1|
                                                                          $)))
                                                 T)
                                                ((|symbol|
                                                  ((|SparseEchelonMatrix| |t#1|
                                                                          $)
                                                   (|List| $)))
                                                 T)
                                                ((|differentiate| ($ $ |t#1|))
                                                 T)
                                                ((|formalDiff|
                                                  ($ $ (|PositiveInteger|)))
                                                 T)
                                                ((|formalDiff|
                                                  ($ $
                                                   (|List|
                                                    (|NonNegativeInteger|))))
                                                 T)
                                                ((|formalDiff|
                                                  ((|List| $) (|List| $)
                                                   (|PositiveInteger|)))
                                                 T)
                                                ((|formalDiff2|
                                                  ((|Record| (|:| |DPhi| $)
                                                             (|:| |JVars|
                                                                  (|List|
                                                                   |t#1|)))
                                                   $ (|PositiveInteger|)
                                                   (|SparseEchelonMatrix| |t#1|
                                                                          $)))
                                                 T)
                                                ((|formalDiff2|
                                                  ((|Record|
                                                    (|:| |DSys| (|List| $))
                                                    (|:| |JVars|
                                                         (|List|
                                                          (|List| |t#1|))))
                                                   (|List| $)
                                                   (|PositiveInteger|)
                                                   (|SparseEchelonMatrix| |t#1|
                                                                          $)))
                                                 T)
                                                ((|dimension|
                                                  ((|NonNegativeInteger|)
                                                   (|List| $)
                                                   (|SparseEchelonMatrix| |t#1|
                                                                          $)
                                                   (|NonNegativeInteger|)))
                                                 T)
                                                ((|orderDim|
                                                  ((|NonNegativeInteger|)
                                                   (|List| $)
                                                   (|SparseEchelonMatrix| |t#1|
                                                                          $)
                                                   (|NonNegativeInteger|)))
                                                 T)
                                                ((|freeOf?|
                                                  ((|Boolean|) $ |t#1|))
                                                 T)
                                                ((|subst| ($ $ |t#1| $)) T)
                                                ((|leadingDer| (|t#1| $)) T)
                                                ((|sortLD|
                                                  ((|List| $) (|List| $)))
                                                 T)
                                                ((|solveFor|
                                                  ((|Union| $ "failed") $
                                                   |t#1|))
                                                 T)
                                                ((|dSubst| ($ $ |t#1| $)) T)
                                                ((|simplify|
                                                  ((|Record|
                                                    (|:| |Sys| (|List| $))
                                                    (|:| JM
                                                         (|SparseEchelonMatrix|
                                                          |t#1| $))
                                                    (|:| |Depend|
                                                         (|Union| #3="failed"
                                                                  (|List|
                                                                   (|List|
                                                                    (|NonNegativeInteger|))))))
                                                   (|List| $)
                                                   (|SparseEchelonMatrix| |t#1|
                                                                          $)))
                                                 T)
                                                ((|simpOne| ($ $)) T)
                                                ((|simpMod|
                                                  ((|List| $) (|List| $)
                                                   (|List| $)))
                                                 T)
                                                ((|simpMod|
                                                  ((|Record|
                                                    (|:| |Sys| (|List| $))
                                                    (|:| JM
                                                         (|SparseEchelonMatrix|
                                                          |t#1| $))
                                                    (|:| |Depend|
                                                         (|Union| #3#
                                                                  (|List|
                                                                   (|List|
                                                                    (|NonNegativeInteger|))))))
                                                   (|List| $)
                                                   (|SparseEchelonMatrix| |t#1|
                                                                          $)
                                                   (|List| $)))
                                                 T)
                                                ((|reduceMod|
                                                  ((|List| $) (|List| $)
                                                   (|List| $)))
                                                 T)
                                                ((|autoReduce|
                                                  ((|List| $) (|List| $)))
                                                 T))
                                              NIL
                                              '((|List| $)
                                                (|SparseEchelonMatrix| |t#1| $)
                                                (|Boolean|)
                                                (|NonNegativeInteger|)
                                                (|PositiveInteger|)
                                                (|List| (|NonNegativeInteger|))
                                                (|List| (|List| |t#1|))
                                                (|List| |t#1|) (|Symbol|)
                                                (|Void|))
                                              NIL))
                                            . #4=(|JetBundleFunctionCategory|))))))
                   . #4#)
           (SETELT #1# 0
                   (LIST '|JetBundleFunctionCategory| (|devaluate| |t#1|)))))) 
