
(DEFPARAMETER |QueueAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |QueueAggregate;|)) 

(DEFPARAMETER |QueueAggregate;AL| 'NIL) 

(DEFUN |QueueAggregate| (#1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |QueueAggregate;AL|)) (CDR #2#))
     (T
      (SETQ |QueueAggregate;AL|
              (|cons5| (CONS #3# (SETQ #2# (|QueueAggregate;| #1#)))
                       |QueueAggregate;AL|))
      #2#)))) 

(DEFUN |QueueAggregate;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
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
                                                    NIL 'NIL NIL))
                                           . #2=(|QueueAggregate|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|QueueAggregate| (|devaluate| |t#1|)))))) 
