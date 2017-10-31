
(DEFPARAMETER |CoDcpo;CAT| 'NIL) 

(DECLAIM (NOTINLINE |CoDcpo;|)) 

(DEFPARAMETER |CoDcpo;AL| 'NIL) 

(DEFUN |CoDcpo| (#1=#:G691)
  (LET (#2=#:G692)
    (COND ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |CoDcpo;AL|)) (CDR #2#))
          (T
           (SETQ |CoDcpo;AL|
                   (|cons5| (CONS #3# (SETQ #2# (|CoDcpo;| #1#))) |CoDcpo;AL|))
           #2#)))) 

(DEFUN |CoDcpo;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|CoDcpo;CAT|)
                                    ('T
                                     (LETT |CoDcpo;CAT|
                                           (|Join| (|Poset| '|t#1|)
                                                   (|mkCategory|
                                                    '(((|meet|
                                                        ((|NonNegativeInteger|)
                                                         $
                                                         (|NonNegativeInteger|)
                                                         (|NonNegativeInteger|)))
                                                       T))
                                                    NIL
                                                    '((|NonNegativeInteger|))
                                                    NIL))
                                           . #2=(|CoDcpo|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|CoDcpo| (|devaluate| |t#1|)))))) 
