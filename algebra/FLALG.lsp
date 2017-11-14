
(DEFPARAMETER |FreeLieAlgebra;CAT| 'NIL) 

(DECLAIM (NOTINLINE |FreeLieAlgebra;|)) 

(DEFPARAMETER |FreeLieAlgebra;AL| 'NIL) 

(DEFUN |FreeLieAlgebra| (&REST #1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |FreeLieAlgebra;AL|))
      (CDR #2#))
     (T
      (SETQ |FreeLieAlgebra;AL|
              (|cons5| (CONS #3# (SETQ #2# (APPLY #'|FreeLieAlgebra;| #1#)))
                       |FreeLieAlgebra;AL|))
      #2#)))) 

(DEFUN |FreeLieAlgebra;| (|t#1| |t#2|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                    (COND (|FreeLieAlgebra;CAT|)
                          ('T
                           (LETT |FreeLieAlgebra;CAT|
                                 (|Join| (|LieAlgebra| '|t#2|)
                                         (|mkCategory|
                                          '(((|coef|
                                              (|t#2|
                                               (|XRecursivePolynomial| |t#1|
                                                                       |t#2|)
                                               $))
                                             T)
                                            ((|coerce| ($ |t#1|)) T)
                                            ((|coerce|
                                              ((|XDistributedPolynomial| |t#1|
                                                                         |t#2|)
                                               $))
                                             T)
                                            ((|coerce|
                                              ((|XRecursivePolynomial| |t#1|
                                                                       |t#2|)
                                               $))
                                             T)
                                            ((|degree|
                                              ((|NonNegativeInteger|) $))
                                             T)
                                            ((|lquo|
                                              ((|XRecursivePolynomial| |t#1|
                                                                       |t#2|)
                                               (|XRecursivePolynomial| |t#1|
                                                                       |t#2|)
                                               $))
                                             T)
                                            ((|rquo|
                                              ((|XRecursivePolynomial| |t#1|
                                                                       |t#2|)
                                               (|XRecursivePolynomial| |t#1|
                                                                       |t#2|)
                                               $))
                                             T)
                                            ((|LiePoly|
                                              ($ (|LyndonWord| |t#1|)))
                                             T)
                                            ((|mirror| ($ $)) T)
                                            ((|trunc|
                                              ($ $ (|NonNegativeInteger|)))
                                             T)
                                            ((|varList| ((|List| |t#1|) $)) T)
                                            ((|eval| ($ $ |t#1| $)) T)
                                            ((|eval|
                                              ($ $ (|List| |t#1|) (|List| $)))
                                             T))
                                          NIL
                                          '((|List| |t#1|) (|List| $)
                                            (|NonNegativeInteger|)
                                            (|LyndonWord| |t#1|)
                                            (|XRecursivePolynomial| |t#1|
                                                                    |t#2|)
                                            (|XDistributedPolynomial| |t#1|
                                                                      |t#2|))
                                          NIL))
                                 . #2=(|FreeLieAlgebra|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|FreeLieAlgebra| (|devaluate| |t#1|)
                         (|devaluate| |t#2|)))))) 
