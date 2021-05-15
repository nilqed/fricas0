
(DEFPARAMETER |QueueAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |QueueAggregate;|)) 

(DEFPARAMETER |QueueAggregate;AL| 'NIL) 

(DEFUN |QueueAggregate| (|t#1|)
  (LET (#1=#:G379 (#2=#:G380 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |QueueAggregate;AL|)) (CDR #1#))
          (T
           (SETQ |QueueAggregate;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|QueueAggregate;| #2#)))
                            |QueueAggregate;AL|))
           #1#)))) 

(DEFUN |QueueAggregate;| (|t#1|)
  (SPROG ((#1=#:G378 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1|) (LIST |t#1|))
                              (COND (|QueueAggregate;CAT|)
                                    ('T
                                     (LETT |QueueAggregate;CAT|
                                           (|Join| (|BagAggregate| '|t#1|)
                                                   (|finiteAggregate|)
                                                   (|mkCategory|
                                                    '(((|enqueue!|
                                                        (|t#1| |t#1| $))
                                                       T)
                                                      ((|dequeue!| (|t#1| $))
                                                       T)
                                                      ((|rotate!| ($ $)) T)
                                                      ((|front| (|t#1| $)) T)
                                                      ((|back| (|t#1| $)) T))
                                                    NIL NIL NIL)))))))
           (SETELT #1# 0 (LIST '|QueueAggregate| |t#1|))))) 
