
(DEFPARAMETER |DequeueAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |DequeueAggregate;|)) 

(DEFPARAMETER |DequeueAggregate;AL| 'NIL) 

(DEFUN |DequeueAggregate| (#1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |DequeueAggregate;AL|))
      (CDR #2#))
     (T
      (SETQ |DequeueAggregate;AL|
              (|cons5| (CONS #3# (SETQ #2# (|DequeueAggregate;| #1#)))
                       |DequeueAggregate;AL|))
      #2#)))) 

(DEFUN |DequeueAggregate;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|DequeueAggregate;CAT|)
                                    ('T
                                     (LETT |DequeueAggregate;CAT|
                                           (|Join| (|StackAggregate| '|t#1|)
                                                   (|QueueAggregate| '|t#1|)
                                                   (|mkCategory|
                                                    '(((|bottom| (|t#1| $)) T)
                                                      ((|insertTop!|
                                                        (|t#1| |t#1| $))
                                                       T)
                                                      ((|insertBottom!|
                                                        (|t#1| |t#1| $))
                                                       T)
                                                      ((|extractTop!|
                                                        (|t#1| $))
                                                       T)
                                                      ((|extractBottom!|
                                                        (|t#1| $))
                                                       T)
                                                      ((|reverse!| ($ $)) T))
                                                    NIL 'NIL NIL))
                                           . #2=(|DequeueAggregate|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|DequeueAggregate| (|devaluate| |t#1|)))))) 
