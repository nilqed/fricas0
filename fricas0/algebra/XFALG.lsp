
(DEFPARAMETER |XFreeAlgebra;CAT| 'NIL) 

(DECLAIM (NOTINLINE |XFreeAlgebra;|)) 

(DEFPARAMETER |XFreeAlgebra;AL| 'NIL) 

(DEFUN |XFreeAlgebra| (&REST #1=#:G692)
  (LET (#2=#:G693)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |XFreeAlgebra;AL|))
      (CDR #2#))
     (T
      (SETQ |XFreeAlgebra;AL|
              (|cons5| (CONS #3# (SETQ #2# (APPLY #'|XFreeAlgebra;| #1#)))
                       |XFreeAlgebra;AL|))
      #2#)))) 

(DEFUN |XFreeAlgebra;| (|t#1| |t#2|)
  (SPROG ((#1=#:G691 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                    (|sublisV| (PAIR '(#2=#:G690) (LIST '(|FreeMonoid| |t#1|)))
                               (COND (|XFreeAlgebra;CAT|)
                                     ('T
                                      (LETT |XFreeAlgebra;CAT|
                                            (|Join| (|Ring|)
                                                    (|XAlgebra| '|t#2|)
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
                                                     '((|List| |t#1|)
                                                       (|NonNegativeInteger|)
                                                       (|Boolean|)
                                                       (|FreeMonoid| |t#1|))
                                                     NIL))
                                            . #3=(|XFreeAlgebra|))))))
                   . #3#)
           (SETELT #1# 0
                   (LIST '|XFreeAlgebra| (|devaluate| |t#1|)
                         (|devaluate| |t#2|)))))) 
