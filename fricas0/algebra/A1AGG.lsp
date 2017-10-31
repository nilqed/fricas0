
(DEFPARAMETER |OneDimensionalArrayAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |OneDimensionalArrayAggregate;|)) 

(DEFPARAMETER |OneDimensionalArrayAggregate;AL| 'NIL) 

(DEFUN |OneDimensionalArrayAggregate| (#1=#:G722)
  (LET (#2=#:G723)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluate| #1#) |OneDimensionalArrayAggregate;AL|))
      (CDR #2#))
     (T
      (SETQ |OneDimensionalArrayAggregate;AL|
              (|cons5|
               (CONS #3# (SETQ #2# (|OneDimensionalArrayAggregate;| #1#)))
               |OneDimensionalArrayAggregate;AL|))
      #2#)))) 

(DEFUN |OneDimensionalArrayAggregate;| (|t#1|)
  (SPROG ((#1=#:G721 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|OneDimensionalArrayAggregate;CAT|)
                                    ('T
                                     (LETT |OneDimensionalArrayAggregate;CAT|
                                           (|Join|
                                            (|FiniteLinearAggregate| '|t#1|)
                                            (|shallowlyMutable|))
                                           . #2=(|OneDimensionalArrayAggregate|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|OneDimensionalArrayAggregate|
                         (|devaluate| |t#1|)))))) 
