
(DEFPARAMETER |StackAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |StackAggregate;|)) 

(DEFPARAMETER |StackAggregate;AL| 'NIL) 

(DEFUN |StackAggregate| (#1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |StackAggregate;AL|)) (CDR #2#))
     (T
      (SETQ |StackAggregate;AL|
              (|cons5| (CONS #3# (SETQ #2# (|StackAggregate;| #1#)))
                       |StackAggregate;AL|))
      #2#)))) 

(DEFUN |StackAggregate;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|StackAggregate;CAT|)
                                    ('T
                                     (LETT |StackAggregate;CAT|
                                           (|Join| (|BagAggregate| '|t#1|)
                                                   (|finiteAggregate|)
                                                   (|mkCategory|
                                                    '(((|push!|
                                                        (|t#1| |t#1| $))
                                                       T)
                                                      ((|pop!| (|t#1| $)) T)
                                                      ((|top| (|t#1| $)) T))
                                                    NIL 'NIL NIL))
                                           . #2=(|StackAggregate|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|StackAggregate| (|devaluate| |t#1|)))))) 
