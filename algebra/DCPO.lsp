
(DEFPARAMETER |Dcpo;CAT| 'NIL) 

(DECLAIM (NOTINLINE |Dcpo;|)) 

(DEFPARAMETER |Dcpo;AL| 'NIL) 

(DEFUN |Dcpo| (|t#1|)
  (LET (#1=#:G379 (#2=#:G380 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |Dcpo;AL|)) (CDR #1#))
          (T
           (SETQ |Dcpo;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|Dcpo;| #2#))) |Dcpo;AL|))
           #1#)))) 

(DEFUN |Dcpo;| (|t#1|)
  (SPROG ((#1=#:G378 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1|) (LIST |t#1|))
                              (COND (|Dcpo;CAT|)
                                    ('T
                                     (LETT |Dcpo;CAT|
                                           (|Join| (|Poset| '|t#1|)
                                                   (|mkCategory|
                                                    '(((|join|
                                                        ((|NonNegativeInteger|)
                                                         $
                                                         (|NonNegativeInteger|)
                                                         (|NonNegativeInteger|)))
                                                       T))
                                                    NIL NIL NIL)))))))
           (SETELT #1# 0 (LIST '|Dcpo| |t#1|))))) 
