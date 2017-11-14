
(DEFPARAMETER |RightModule;CAT| 'NIL) 

(DECLAIM (NOTINLINE |RightModule;|)) 

(DEFPARAMETER |RightModule;AL| 'NIL) 

(DEFUN |RightModule| (#1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |RightModule;AL|)) (CDR #2#))
     (T
      (SETQ |RightModule;AL|
              (|cons5| (CONS #3# (SETQ #2# (|RightModule;| #1#)))
                       |RightModule;AL|))
      #2#)))) 

(DEFUN |RightModule;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|RightModule;CAT|)
                                    ('T
                                     (LETT |RightModule;CAT|
                                           (|Join| (|AbelianSemiGroup|)
                                                   (|mkCategory|
                                                    '(((* ($ $ |t#1|)) T))
                                                    '(((|AbelianMonoid|)
                                                       (|has| |t#1|
                                                              (|AbelianMonoid|)))
                                                      ((|AbelianGroup|)
                                                       (|has| |t#1|
                                                              (|AbelianGroup|))))
                                                    'NIL NIL))
                                           . #2=(|RightModule|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|RightModule| (|devaluate| |t#1|)))))) 
