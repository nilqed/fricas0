
(DEFPARAMETER |OrderedMultisetAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |OrderedMultisetAggregate;|)) 

(DEFPARAMETER |OrderedMultisetAggregate;AL| 'NIL) 

(DEFUN |OrderedMultisetAggregate| (#1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |OrderedMultisetAggregate;AL|))
      (CDR #2#))
     (T
      (SETQ |OrderedMultisetAggregate;AL|
              (|cons5| (CONS #3# (SETQ #2# (|OrderedMultisetAggregate;| #1#)))
                       |OrderedMultisetAggregate;AL|))
      #2#)))) 

(DEFUN |OrderedMultisetAggregate;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|OrderedMultisetAggregate;CAT|)
                                    ('T
                                     (LETT |OrderedMultisetAggregate;CAT|
                                           (|Join| (|MultisetAggregate| '|t#1|)
                                                   (|PriorityQueueAggregate|
                                                    '|t#1|)
                                                   (|mkCategory|
                                                    '(((|min| (|t#1| $)) T))
                                                    NIL 'NIL NIL))
                                           . #2=(|OrderedMultisetAggregate|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|OrderedMultisetAggregate| (|devaluate| |t#1|)))))) 
