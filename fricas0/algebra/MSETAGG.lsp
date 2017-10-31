
(DEFPARAMETER |MultisetAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |MultisetAggregate;|)) 

(DEFPARAMETER |MultisetAggregate;AL| 'NIL) 

(DEFUN |MultisetAggregate| (#1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |MultisetAggregate;AL|))
      (CDR #2#))
     (T
      (SETQ |MultisetAggregate;AL|
              (|cons5| (CONS #3# (SETQ #2# (|MultisetAggregate;| #1#)))
                       |MultisetAggregate;AL|))
      #2#)))) 

(DEFUN |MultisetAggregate;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|MultisetAggregate;CAT|)
                                    ('T
                                     (LETT |MultisetAggregate;CAT|
                                           (|Join| (|MultiDictionary| '|t#1|)
                                                   (|SetAggregate| '|t#1|))
                                           . #2=(|MultisetAggregate|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|MultisetAggregate| (|devaluate| |t#1|)))))) 
