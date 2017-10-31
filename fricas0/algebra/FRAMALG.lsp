
(DEFPARAMETER |FramedAlgebra;CAT| 'NIL) 

(DECLAIM (NOTINLINE |FramedAlgebra;|)) 

(DEFPARAMETER |FramedAlgebra;AL| 'NIL) 

(DEFUN |FramedAlgebra| (&REST #1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |FramedAlgebra;AL|))
      (CDR #2#))
     (T
      (SETQ |FramedAlgebra;AL|
              (|cons5| (CONS #3# (SETQ #2# (APPLY #'|FramedAlgebra;| #1#)))
                       |FramedAlgebra;AL|))
      #2#)))) 

(DEFUN |FramedAlgebra;| (|t#1| |t#2|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                    (COND (|FramedAlgebra;CAT|)
                          ('T
                           (LETT |FramedAlgebra;CAT|
                                 (|Join| (|FiniteRankAlgebra| '|t#1| '|t#2|)
                                         (|mkCategory|
                                          '(((|basis| ((|Vector| $))) T)
                                            ((|coordinates|
                                              ((|Vector| |t#1|) $))
                                             T)
                                            ((|coordinates|
                                              ((|Matrix| |t#1|) (|Vector| $)))
                                             T)
                                            ((|represents|
                                              ($ (|Vector| |t#1|)))
                                             T)
                                            ((|convert| ((|Vector| |t#1|) $))
                                             T)
                                            ((|convert| ($ (|Vector| |t#1|)))
                                             T)
                                            ((|traceMatrix| ((|Matrix| |t#1|)))
                                             T)
                                            ((|discriminant| (|t#1|)) T)
                                            ((|regularRepresentation|
                                              ((|Matrix| |t#1|) $))
                                             T))
                                          NIL
                                          '((|Matrix| |t#1|) (|Vector| |t#1|)
                                            (|Vector| $))
                                          NIL))
                                 . #2=(|FramedAlgebra|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|FramedAlgebra| (|devaluate| |t#1|)
                         (|devaluate| |t#2|)))))) 
