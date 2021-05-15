
(DEFPARAMETER |XFreeAlgebra;CAT| 'NIL) 

(DECLAIM (NOTINLINE |XFreeAlgebra;|)) 

(DEFPARAMETER |XFreeAlgebra;AL| 'NIL) 

(DEFUN |XFreeAlgebra| (|t#1| |t#2|)
  (LET (#1=#:G380 (#2=#:G381 (LIST (|devaluate| |t#1|) (|devaluate| |t#2|))))
    (COND ((SETQ #1# (|assoc| #2# |XFreeAlgebra;AL|)) (CDR #1#))
          (T
           (SETQ |XFreeAlgebra;AL|
                   (|cons5| (CONS #2# (SETQ #1# (APPLY #'|XFreeAlgebra;| #2#)))
                            |XFreeAlgebra;AL|))
           #1#)))) 

(DEFUN |XFreeAlgebra;| (|t#1| |t#2|)
  (SPROG ((#1=#:G379 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1| |t#2|) (LIST |t#1| |t#2|))
                              (|sublisV|
                               (MAKE_PAIRS '(#2=#:G378)
                                           (LIST '(|FreeMonoid| |t#1|)))
                               (COND (|XFreeAlgebra;CAT|)
                                     ('T
                                      (LETT |XFreeAlgebra;CAT|
                                            (|Join| (|XAlgebra| '|t#2|)
                                                    (|RetractableTo| '#2#)
                                                    (|mkCategory|
                                                     '(((* ($ |t#1| $)) T)
                                                       ((* ($ $ |t#2|)) T)
                                                       ((|mindeg|
                                                         ((|FreeMonoid| |t#1|)
                                                          $))
                                                        T)
                                                       ((|mindegTerm|
                                                         ((|Record|
                                                           (|:| |k|
                                                                (|FreeMonoid|
                                                                 |t#1|))
                                                           (|:| |c| |t#2|))
                                                          $))
                                                        T)
                                                       ((|coef|
                                                         (|t#2| $
                                                          (|FreeMonoid|
                                                           |t#1|)))
                                                        T)
                                                       ((|coef| (|t#2| $ $)) T)
                                                       ((|lquo| ($ $ |t#1|)) T)
                                                       ((|lquo|
                                                         ($ $
                                                          (|FreeMonoid|
                                                           |t#1|)))
                                                        T)
                                                       ((|lquo| ($ $ $)) T)
                                                       ((|rquo| ($ $ |t#1|)) T)
                                                       ((|rquo|
                                                         ($ $
                                                          (|FreeMonoid|
                                                           |t#1|)))
                                                        T)
                                                       ((|rquo| ($ $ $)) T)
                                                       ((|monom|
                                                         ($
                                                          (|FreeMonoid| |t#1|)
                                                          |t#2|))
                                                        T)
                                                       ((|monomial?|
                                                         ((|Boolean|) $))
                                                        T)
                                                       ((|mirror| ($ $)) T)
                                                       ((|coerce| ($ |t#1|)) T)
                                                       ((|constant?|
                                                         ((|Boolean|) $))
                                                        T)
                                                       ((|constant| (|t#2| $))
                                                        T)
                                                       ((|quasiRegular?|
                                                         ((|Boolean|) $))
                                                        T)
                                                       ((|quasiRegular| ($ $))
                                                        T)
                                                       ((|sh| ($ $ $))
                                                        (|has| |t#2|
                                                               (|CommutativeRing|)))
                                                       ((|sh|
                                                         ($ $
                                                          (|NonNegativeInteger|)))
                                                        (|has| |t#2|
                                                               (|CommutativeRing|)))
                                                       ((|map|
                                                         ($
                                                          (|Mapping| |t#2|
                                                                     |t#2|)
                                                          $))
                                                        T)
                                                       ((|varList|
                                                         ((|List| |t#1|) $))
                                                        T))
                                                     '(((|noZeroDivisors|)
                                                        (|has| |t#2|
                                                               (|noZeroDivisors|))))
                                                     NIL NIL))))))))
           (SETELT #1# 0 (LIST '|XFreeAlgebra| |t#1| |t#2|))))) 
