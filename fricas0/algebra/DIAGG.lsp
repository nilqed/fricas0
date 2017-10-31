
(DEFPARAMETER |Dictionary;CAT| 'NIL) 

(DECLAIM (NOTINLINE |Dictionary;|)) 

(DEFPARAMETER |Dictionary;AL| 'NIL) 

(DEFUN |Dictionary| (#1=#:G695)
  (LET (#2=#:G696)
    (COND ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |Dictionary;AL|)) (CDR #2#))
          (T
           (SETQ |Dictionary;AL|
                   (|cons5| (CONS #3# (SETQ #2# (|Dictionary;| #1#)))
                            |Dictionary;AL|))
           #2#)))) 

(DEFUN |Dictionary;| (|t#1|)
  (SPROG ((#1=#:G694 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|Dictionary;CAT|)
                                    ('T
                                     (LETT |Dictionary;CAT|
                                           (|Join|
                                            (|DictionaryOperations| '|t#1|))
                                           . #2=(|Dictionary|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|Dictionary| (|devaluate| |t#1|)))))) 
