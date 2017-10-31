
(DEFPARAMETER |FramedNonAssociativeAlgebra;CAT| 'NIL) 

(DECLAIM (NOTINLINE |FramedNonAssociativeAlgebra;|)) 

(DEFPARAMETER |FramedNonAssociativeAlgebra;AL| 'NIL) 

(DEFUN |FramedNonAssociativeAlgebra| (#1=#:G696)
  (LET (#2=#:G697)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluate| #1#) |FramedNonAssociativeAlgebra;AL|))
      (CDR #2#))
     (T
      (SETQ |FramedNonAssociativeAlgebra;AL|
              (|cons5|
               (CONS #3# (SETQ #2# (|FramedNonAssociativeAlgebra;| #1#)))
               |FramedNonAssociativeAlgebra;AL|))
      #2#)))) 

(DEFUN |FramedNonAssociativeAlgebra;| (|t#1|)
  (SPROG ((#1=#:G695 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|FramedNonAssociativeAlgebra;CAT|)
                                    ('T
                                     (LETT |FramedNonAssociativeAlgebra;CAT|
                                           (|Join|
                                            (|FiniteRankNonAssociativeAlgebra|
                                             '|t#1|)
                                            (|mkCategory|
                                             '(((|basis| ((|Vector| $))) T)
                                               ((|coordinates|
                                                 ((|Vector| |t#1|) $))
                                                T)
                                               ((|coordinates|
                                                 ((|Matrix| |t#1|)
                                                  (|Vector| $)))
                                                T)
                                               ((|elt| (|t#1| $ (|Integer|)))
                                                T)
                                               ((|structuralConstants|
                                                 ((|Vector| (|Matrix| |t#1|))))
                                                T)
                                               ((|conditionsForIdempotents|
                                                 ((|List|
                                                   (|Polynomial| |t#1|))))
                                                T)
                                               ((|represents|
                                                 ($ (|Vector| |t#1|)))
                                                T)
                                               ((|convert|
                                                 ((|Vector| |t#1|) $))
                                                T)
                                               ((|convert|
                                                 ($ (|Vector| |t#1|)))
                                                T)
                                               ((|leftDiscriminant| (|t#1|)) T)
                                               ((|rightDiscriminant| (|t#1|))
                                                T)
                                               ((|leftTraceMatrix|
                                                 ((|Matrix| |t#1|)))
                                                T)
                                               ((|rightTraceMatrix|
                                                 ((|Matrix| |t#1|)))
                                                T)
                                               ((|leftRegularRepresentation|
                                                 ((|Matrix| |t#1|) $))
                                                T)
                                               ((|rightRegularRepresentation|
                                                 ((|Matrix| |t#1|) $))
                                                T)
                                               ((|leftRankPolynomial|
                                                 ((|SparseUnivariatePolynomial|
                                                   (|Polynomial| |t#1|))))
                                                (|has| |t#1| (|Field|)))
                                               ((|rightRankPolynomial|
                                                 ((|SparseUnivariatePolynomial|
                                                   (|Polynomial| |t#1|))))
                                                (|has| |t#1| (|Field|)))
                                               ((|apply|
                                                 ($ (|Matrix| |t#1|) $))
                                                T))
                                             NIL
                                             '((|Matrix| |t#1|)
                                               (|SparseUnivariatePolynomial|
                                                (|Polynomial| |t#1|))
                                               (|Vector| |t#1|)
                                               (|List| (|Polynomial| |t#1|))
                                               (|Vector| (|Matrix| |t#1|))
                                               (|Integer|) (|Vector| $))
                                             NIL))
                                           . #2=(|FramedNonAssociativeAlgebra|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|FramedNonAssociativeAlgebra| (|devaluate| |t#1|)))))) 
