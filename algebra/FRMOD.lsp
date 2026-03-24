
(DEFPARAMETER |FramedModule;CAT| 'NIL) 

(DECLAIM (NOTINLINE |FramedModule;|)) 

(DEFPARAMETER |FramedModule;AL| 'NIL) 

(DEFUN |FramedModule| (|t#1|)
  (LET (#1=#:G1 (#2=#:G2 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |FramedModule;AL|)) (CDR #1#))
          (T
           (SETQ |FramedModule;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|FramedModule;| #2#)))
                            |FramedModule;AL|))
           #1#)))) 

(DEFUN |FramedModule;| (|t#1|)
  (SPROG ((#1=#:G0 NIL))
         (PROG1
             (LETT #1#
                   (|subst_in_cat| '(|t#1|) (LIST |t#1|)
                                   (COND (|FramedModule;CAT|)
                                         ('T
                                          (LETT |FramedModule;CAT|
                                                (|Join| (|LeftModule| '|t#1|)
                                                        (|mkCategory|
                                                         '(((|basis|
                                                             ((|Vector| %)))
                                                            T)
                                                           ((|rank|
                                                             ((|PositiveInteger|)))
                                                            T)
                                                           ((|coordinates|
                                                             ((|Vector| |t#1|)
                                                              %))
                                                            T)
                                                           ((|coordinates|
                                                             ((|Matrix| |t#1|)
                                                              (|Vector| %)))
                                                            T)
                                                           ((|represents|
                                                             (%
                                                              (|Vector|
                                                               |t#1|)))
                                                            T)
                                                           ((|convert|
                                                             ((|Vector| |t#1|)
                                                              %))
                                                            T)
                                                           ((|convert|
                                                             (%
                                                              (|Vector|
                                                               |t#1|)))
                                                            T))
                                                         '(((|Finite|)
                                                            (|has| |t#1|
                                                                   (|Finite|)))
                                                           ((|Hashable|)
                                                            (|has| |t#1|
                                                                   (|Hashable|))))
                                                         NIL NIL)))))))
           (SETELT #1# 0 (LIST '|FramedModule| |t#1|))))) 
