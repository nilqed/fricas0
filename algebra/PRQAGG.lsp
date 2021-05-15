
(DEFPARAMETER |PriorityQueueAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |PriorityQueueAggregate;|)) 

(DEFPARAMETER |PriorityQueueAggregate;AL| 'NIL) 

(DEFUN |PriorityQueueAggregate| (|t#1|)
  (LET (#1=#:G379 (#2=#:G380 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |PriorityQueueAggregate;AL|)) (CDR #1#))
          (T
           (SETQ |PriorityQueueAggregate;AL|
                   (|cons5|
                    (CONS #2# (SETQ #1# (|PriorityQueueAggregate;| #2#)))
                    |PriorityQueueAggregate;AL|))
           #1#)))) 

(DEFUN |PriorityQueueAggregate;| (|t#1|)
  (SPROG ((#1=#:G378 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1|) (LIST |t#1|))
                              (COND (|PriorityQueueAggregate;CAT|)
                                    ('T
                                     (LETT |PriorityQueueAggregate;CAT|
                                           (|Join| (|BagAggregate| '|t#1|)
                                                   (|finiteAggregate|)
                                                   (|mkCategory|
                                                    '(((|max| (|t#1| $)) T)
                                                      ((|merge| ($ $ $)) T)
                                                      ((|merge!| ($ $ $)) T))
                                                    NIL NIL NIL)))))))
           (SETELT #1# 0 (LIST '|PriorityQueueAggregate| |t#1|))))) 
