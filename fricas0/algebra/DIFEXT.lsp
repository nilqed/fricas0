
(DEFPARAMETER |DifferentialExtension;CAT| 'NIL) 

(DECLAIM (NOTINLINE |DifferentialExtension;|)) 

(DEFPARAMETER |DifferentialExtension;AL| 'NIL) 

(DEFUN |DifferentialExtension| (#1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |DifferentialExtension;AL|))
      (CDR #2#))
     (T
      (SETQ |DifferentialExtension;AL|
              (|cons5| (CONS #3# (SETQ #2# (|DifferentialExtension;| #1#)))
                       |DifferentialExtension;AL|))
      #2#)))) 

(DEFUN |DifferentialExtension;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|DifferentialExtension;CAT|)
                                    ('T
                                     (LETT |DifferentialExtension;CAT|
                                           (|Join| (|Ring|)
                                                   (|mkCategory|
                                                    '(((|differentiate|
                                                        ($ $
                                                         (|Mapping| |t#1|
                                                                    |t#1|)))
                                                       T)
                                                      ((|differentiate|
                                                        ($ $
                                                         (|Mapping| |t#1|
                                                                    |t#1|)
                                                         (|NonNegativeInteger|)))
                                                       T)
                                                      ((D
                                                        ($ $
                                                         (|Mapping| |t#1|
                                                                    |t#1|)))
                                                       T)
                                                      ((D
                                                        ($ $
                                                         (|Mapping| |t#1|
                                                                    |t#1|)
                                                         (|NonNegativeInteger|)))
                                                       T))
                                                    '(((|DifferentialRing|)
                                                       (|has| |t#1|
                                                              (|DifferentialRing|)))
                                                      ((|PartialDifferentialRing|
                                                        (|Symbol|))
                                                       (|has| |t#1|
                                                              (|PartialDifferentialRing|
                                                               (|Symbol|)))))
                                                    '((|NonNegativeInteger|))
                                                    NIL))
                                           . #2=(|DifferentialExtension|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|DifferentialExtension| (|devaluate| |t#1|)))))) 
