
(DEFPARAMETER |MultisetAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |MultisetAggregate;|)) 

(DEFPARAMETER |MultisetAggregate;AL| 'NIL) 

(DEFUN |MultisetAggregate| (|t#1|)
  (LET (#1=#:G379 (#2=#:G380 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |MultisetAggregate;AL|)) (CDR #1#))
          (T
           (SETQ |MultisetAggregate;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|MultisetAggregate;| #2#)))
                            |MultisetAggregate;AL|))
           #1#)))) 

(DEFUN |MultisetAggregate;| (|t#1|)
  (SPROG ((#1=#:G378 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1|) (LIST |t#1|))
                              (COND (|MultisetAggregate;CAT|)
                                    ('T
                                     (LETT |MultisetAggregate;CAT|
                                           (|Join| (|MultiDictionary| '|t#1|)
                                                   (|SetAggregate|
                                                    '|t#1|)))))))
           (SETELT #1# 0 (LIST '|MultisetAggregate| |t#1|))))) 
