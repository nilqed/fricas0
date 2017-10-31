
(DEFPARAMETER |MonogenicAlgebra;CAT| 'NIL) 

(DECLAIM (NOTINLINE |MonogenicAlgebra;|)) 

(DEFPARAMETER |MonogenicAlgebra;AL| 'NIL) 

(DEFUN |MonogenicAlgebra| (&REST #1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |MonogenicAlgebra;AL|))
      (CDR #2#))
     (T
      (SETQ |MonogenicAlgebra;AL|
              (|cons5| (CONS #3# (SETQ #2# (APPLY #'|MonogenicAlgebra;| #1#)))
                       |MonogenicAlgebra;AL|))
      #2#)))) 

(DEFUN |MonogenicAlgebra;| (|t#1| |t#2|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                    (COND (|MonogenicAlgebra;CAT|)
                          ('T
                           (LETT |MonogenicAlgebra;CAT|
                                 (|Join| (|FramedAlgebra| '|t#1| '|t#2|)
                                         (|CommutativeRing|)
                                         (|ConvertibleTo| '|t#2|)
                                         (|FullyRetractableTo| '|t#1|)
                                         (|FullyLinearlyExplicitOver| '|t#1|)
                                         (|mkCategory|
                                          '(((|generator| ($)) T)
                                            ((|definingPolynomial| (|t#2|)) T)
                                            ((|reduce| ($ |t#2|)) T)
                                            ((|convert| ($ |t#2|)) T)
                                            ((|lift| (|t#2| $)) T)
                                            ((|reduce|
                                              ((|Union| $ "failed")
                                               (|Fraction| |t#2|)))
                                             (|has| |t#1| (|Field|)))
                                            ((|derivationCoordinates|
                                              ((|Matrix| |t#1|) (|Vector| $)
                                               (|Mapping| |t#1| |t#1|)))
                                             (|has| |t#1| (|Field|))))
                                          '(((|Finite|)
                                             (|has| |t#1| (|Finite|)))
                                            ((|Field|) (|has| |t#1| (|Field|)))
                                            ((|DifferentialExtension| |t#1|)
                                             (|has| |t#1| (|Field|)))
                                            ((|FiniteFieldCategory|)
                                             (|has| |t#1|
                                                    (|FiniteFieldCategory|))))
                                          '((|Matrix| |t#1|) (|Vector| $)
                                            (|Fraction| |t#2|))
                                          NIL))
                                 . #2=(|MonogenicAlgebra|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|MonogenicAlgebra| (|devaluate| |t#1|)
                         (|devaluate| |t#2|)))))) 
