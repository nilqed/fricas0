
(DEFPARAMETER |LinearlyExplicitOver;CAT| 'NIL) 

(DECLAIM (NOTINLINE |LinearlyExplicitOver;|)) 

(DEFPARAMETER |LinearlyExplicitOver;AL| 'NIL) 

(DEFUN |LinearlyExplicitOver| (#1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |LinearlyExplicitOver;AL|))
      (CDR #2#))
     (T
      (SETQ |LinearlyExplicitOver;AL|
              (|cons5| (CONS #3# (SETQ #2# (|LinearlyExplicitOver;| #1#)))
                       |LinearlyExplicitOver;AL|))
      #2#)))) 

(DEFUN |LinearlyExplicitOver;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|LinearlyExplicitOver;CAT|)
                                    ('T
                                     (LETT |LinearlyExplicitOver;CAT|
                                           (|Join| (|Ring|)
                                                   (|mkCategory|
                                                    '(((|reducedSystem|
                                                        ((|Matrix| |t#1|)
                                                         (|Matrix| $)))
                                                       T)
                                                      ((|reducedSystem|
                                                        ((|Record|
                                                          (|:| |mat|
                                                               (|Matrix|
                                                                |t#1|))
                                                          (|:| |vec|
                                                               (|Vector|
                                                                |t#1|)))
                                                         (|Matrix| $)
                                                         (|Vector| $)))
                                                       T))
                                                    NIL
                                                    '((|Matrix| $) (|Vector| $)
                                                      (|Matrix| |t#1|))
                                                    NIL))
                                           . #2=(|LinearlyExplicitOver|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|LinearlyExplicitOver| (|devaluate| |t#1|)))))) 
