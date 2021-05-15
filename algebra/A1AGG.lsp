
(DEFPARAMETER |OneDimensionalArrayAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |OneDimensionalArrayAggregate;|)) 

(DEFPARAMETER |OneDimensionalArrayAggregate;AL| 'NIL) 

(DEFUN |OneDimensionalArrayAggregate| (|t#1|)
  (LET (#1=#:G410 (#2=#:G411 (|devaluate| |t#1|)))
    (COND
     ((SETQ #1# (|assoc| #2# |OneDimensionalArrayAggregate;AL|)) (CDR #1#))
     (T
      (SETQ |OneDimensionalArrayAggregate;AL|
              (|cons5|
               (CONS #2# (SETQ #1# (|OneDimensionalArrayAggregate;| #2#)))
               |OneDimensionalArrayAggregate;AL|))
      #1#)))) 

(DEFUN |OneDimensionalArrayAggregate;| (|t#1|)
  (SPROG ((#1=#:G409 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1|) (LIST |t#1|))
                              (COND (|OneDimensionalArrayAggregate;CAT|)
                                    ('T
                                     (LETT |OneDimensionalArrayAggregate;CAT|
                                           (|Join|
                                            (|FiniteLinearAggregate| '|t#1|)
                                            (|shallowlyMutable|)))))))
           (SETELT #1# 0 (LIST '|OneDimensionalArrayAggregate| |t#1|))))) 
