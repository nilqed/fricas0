
(DEFPARAMETER |FiniteSetAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |FiniteSetAggregate;|)) 

(DEFPARAMETER |FiniteSetAggregate;AL| 'NIL) 

(DEFUN |FiniteSetAggregate| (#1=#:G698)
  (LET (#2=#:G699)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |FiniteSetAggregate;AL|))
      (CDR #2#))
     (T
      (SETQ |FiniteSetAggregate;AL|
              (|cons5| (CONS #3# (SETQ #2# (|FiniteSetAggregate;| #1#)))
                       |FiniteSetAggregate;AL|))
      #2#)))) 

(DEFUN |FiniteSetAggregate;| (|t#1|)
  (SPROG ((#1=#:G697 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|FiniteSetAggregate;CAT|)
                                    ('T
                                     (LETT |FiniteSetAggregate;CAT|
                                           (|Join| (|Dictionary| '|t#1|)
                                                   (|SetAggregate| '|t#1|)
                                                   (|finiteAggregate|)
                                                   (|mkCategory|
                                                    '(((|cardinality|
                                                        ((|NonNegativeInteger|)
                                                         $))
                                                       T)
                                                      ((|complement| ($ $))
                                                       (|has| |t#1|
                                                              (|Finite|)))
                                                      ((|universe| ($))
                                                       (|has| |t#1|
                                                              (|Finite|)))
                                                      ((|max| (|t#1| $))
                                                       (|has| |t#1|
                                                              (|OrderedSet|)))
                                                      ((|min| (|t#1| $))
                                                       (|has| |t#1|
                                                              (|OrderedSet|))))
                                                    '(((|Finite|)
                                                       (|has| |t#1|
                                                              (|Finite|)))
                                                      ((|Comparable|)
                                                       (|has| |t#1|
                                                              (|Comparable|))))
                                                    '((|NonNegativeInteger|))
                                                    NIL))
                                           . #2=(|FiniteSetAggregate|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|FiniteSetAggregate| (|devaluate| |t#1|)))))) 
