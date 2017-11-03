
(DEFPARAMETER |FramedModule;CAT| 'NIL) 

(DECLAIM (NOTINLINE |FramedModule;|)) 

(DEFPARAMETER |FramedModule;AL| 'NIL) 

(DEFUN |FramedModule| (#1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |FramedModule;AL|)) (CDR #2#))
     (T
      (SETQ |FramedModule;AL|
              (|cons5| (CONS #3# (SETQ #2# (|FramedModule;| #1#)))
                       |FramedModule;AL|))
      #2#)))) 

(DEFUN |FramedModule;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|FramedModule;CAT|)
                                    ('T
                                     (LETT |FramedModule;CAT|
                                           (|Join| (|LeftModule| '|t#1|)
                                                   (|mkCategory|
                                                    '(((|basis| ((|Vector| $)))
                                                       T)
                                                      ((|rank|
                                                        ((|PositiveInteger|)))
                                                       T)
                                                      ((|coordinates|
                                                        ((|Vector| |t#1|) $))
                                                       T)
                                                      ((|coordinates|
                                                        ((|Matrix| |t#1|)
                                                         (|Vector| $)))
                                                       T)
                                                      ((|represents|
                                                        ($ (|Vector| |t#1|)))
                                                       T)
                                                      ((|convert|
                                                        ((|Vector| |t#1|) $))
                                                       T)
                                                      ((|convert|
                                                        ($ (|Vector| |t#1|)))
                                                       T))
                                                    '(((|Finite|)
                                                       (|has| |t#1|
                                                              (|Finite|))))
                                                    '((|Vector| |t#1|)
                                                      (|Matrix| |t#1|)
                                                      (|Vector| $)
                                                      (|PositiveInteger|))
                                                    NIL))
                                           . #2=(|FramedModule|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|FramedModule| (|devaluate| |t#1|)))))) 
