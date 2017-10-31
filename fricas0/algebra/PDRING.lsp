
(DEFPARAMETER |PartialDifferentialRing;CAT| 'NIL) 

(DECLAIM (NOTINLINE |PartialDifferentialRing;|)) 

(DEFPARAMETER |PartialDifferentialRing;AL| 'NIL) 

(DEFUN |PartialDifferentialRing| (#1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |PartialDifferentialRing;AL|))
      (CDR #2#))
     (T
      (SETQ |PartialDifferentialRing;AL|
              (|cons5| (CONS #3# (SETQ #2# (|PartialDifferentialRing;| #1#)))
                       |PartialDifferentialRing;AL|))
      #2#)))) 

(DEFUN |PartialDifferentialRing;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
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
                                                    NIL
                                                    '((|List| |t#1|)
                                                      (|List|
                                                       (|NonNegativeInteger|))
                                                      (|NonNegativeInteger|))
                                                    NIL))
                                           . #2=(|PartialDifferentialRing|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|PartialDifferentialRing| (|devaluate| |t#1|)))))) 
