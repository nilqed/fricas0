
(DEFPARAMETER |BagAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |BagAggregate;|)) 

(DEFPARAMETER |BagAggregate;AL| 'NIL) 

(DEFUN |BagAggregate| (|t#1|)
  (LET (#1=#:G379 (#2=#:G380 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |BagAggregate;AL|)) (CDR #1#))
          (T
           (SETQ |BagAggregate;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|BagAggregate;| #2#)))
                            |BagAggregate;AL|))
           #1#)))) 

(DEFUN |BagAggregate;| (|t#1|)
  (SPROG ((#1=#:G378 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1|) (LIST |t#1|))
                              (COND (|BagAggregate;CAT|)
                                    ('T
                                     (LETT |BagAggregate;CAT|
                                           (|Join| (|Collection| '|t#1|)
                                                   (|shallowlyMutable|)
                                                   (|mkCategory|
                                                    '(((|extract!| (|t#1| $))
                                                       T)
                                                      ((|insert!| ($ |t#1| $))
                                                       T)
                                                      ((|inspect| (|t#1| $))
                                                       T))
                                                    NIL NIL NIL)))))))
           (SETELT #1# 0 (LIST '|BagAggregate| |t#1|))))) 
