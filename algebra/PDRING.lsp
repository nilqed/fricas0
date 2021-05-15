
(DEFPARAMETER |PartialDifferentialRing;CAT| 'NIL) 

(DECLAIM (NOTINLINE |PartialDifferentialRing;|)) 

(DEFPARAMETER |PartialDifferentialRing;AL| 'NIL) 

(DEFUN |PartialDifferentialRing| (|t#1|)
  (LET (#1=#:G379 (#2=#:G380 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |PartialDifferentialRing;AL|)) (CDR #1#))
          (T
           (SETQ |PartialDifferentialRing;AL|
                   (|cons5|
                    (CONS #2# (SETQ #1# (|PartialDifferentialRing;| #2#)))
                    |PartialDifferentialRing;AL|))
           #1#)))) 

(DEFUN |PartialDifferentialRing;| (|t#1|)
  (SPROG ((#1=#:G378 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1|) (LIST |t#1|))
                              (COND (|PartialDifferentialRing;CAT|)
                                    ('T
                                     (LETT |PartialDifferentialRing;CAT|
                                           (|Join| (|Ring|)
                                                   (|mkCategory|
                                                    '(((|differentiate|
                                                        ($ $ |t#1|))
                                                       T)
                                                      ((|differentiate|
                                                        ($ $ (|List| |t#1|)))
                                                       T)
                                                      ((|differentiate|
                                                        ($ $ |t#1|
                                                         (|NonNegativeInteger|)))
                                                       T)
                                                      ((|differentiate|
                                                        ($ $ (|List| |t#1|)
                                                         (|List|
                                                          (|NonNegativeInteger|))))
                                                       T)
                                                      ((D ($ $ |t#1|)) T)
                                                      ((D ($ $ (|List| |t#1|)))
                                                       T)
                                                      ((D
                                                        ($ $ |t#1|
                                                         (|NonNegativeInteger|)))
                                                       T)
                                                      ((D
                                                        ($ $ (|List| |t#1|)
                                                         (|List|
                                                          (|NonNegativeInteger|))))
                                                       T))
                                                    NIL NIL NIL)))))))
           (SETELT #1# 0 (LIST '|PartialDifferentialRing| |t#1|))))) 
