
(DEFPARAMETER |BagAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |BagAggregate;|)) 

(DEFPARAMETER |BagAggregate;AL| 'NIL) 

(DEFUN |BagAggregate| (#1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |BagAggregate;AL|)) (CDR #2#))
     (T
      (SETQ |BagAggregate;AL|
              (|cons5| (CONS #3# (SETQ #2# (|BagAggregate;| #1#)))
                       |BagAggregate;AL|))
      #2#)))) 

(DEFUN |BagAggregate;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
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
                                                    NIL 'NIL NIL))
                                           . #2=(|BagAggregate|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|BagAggregate| (|devaluate| |t#1|)))))) 
