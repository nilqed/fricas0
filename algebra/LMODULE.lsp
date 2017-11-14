
(DEFPARAMETER |LeftModule;CAT| 'NIL) 

(DECLAIM (NOTINLINE |LeftModule;|)) 

(DEFPARAMETER |LeftModule;AL| 'NIL) 

(DEFUN |LeftModule| (#1=#:G691)
  (LET (#2=#:G692)
    (COND ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |LeftModule;AL|)) (CDR #2#))
          (T
           (SETQ |LeftModule;AL|
                   (|cons5| (CONS #3# (SETQ #2# (|LeftModule;| #1#)))
                            |LeftModule;AL|))
           #2#)))) 

(DEFUN |LeftModule;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|LeftModule;CAT|)
                                    ('T
                                     (LETT |LeftModule;CAT|
                                           (|Join| (|AbelianSemiGroup|)
                                                   (|mkCategory|
                                                    '(((* ($ |t#1| $)) T))
                                                    '(((|AbelianMonoid|)
                                                       (|has| |t#1|
                                                              (|AbelianMonoid|)))
                                                      ((|AbelianGroup|)
                                                       (|has| |t#1|
                                                              (|AbelianGroup|))))
                                                    'NIL NIL))
                                           . #2=(|LeftModule|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|LeftModule| (|devaluate| |t#1|)))))) 
