
(DEFPARAMETER |IndexedAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |IndexedAggregate;|)) 

(DEFPARAMETER |IndexedAggregate;AL| 'NIL) 

(DEFUN |IndexedAggregate| (&REST #1=#:G694)
  (LET (#2=#:G695)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |IndexedAggregate;AL|))
      (CDR #2#))
     (T
      (SETQ |IndexedAggregate;AL|
              (|cons5| (CONS #3# (SETQ #2# (APPLY #'|IndexedAggregate;| #1#)))
                       |IndexedAggregate;AL|))
      #2#)))) 

(DEFUN |IndexedAggregate;| (|t#1| |t#2|)
  (SPROG ((#1=#:G693 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                    (COND (|IndexedAggregate;CAT|)
                          ('T
                           (LETT |IndexedAggregate;CAT|
                                 (|Join| (|HomogeneousAggregate| '|t#2|)
                                         (|EltableAggregate| '|t#1| '|t#2|)
                                         (|mkCategory|
                                          '(((|entries| ((|List| |t#2|) $)) T)
                                            ((|index?| ((|Boolean|) |t#1| $))
                                             T)
                                            ((|indices| ((|List| |t#1|) $)) T)
                                            ((|entry?| ((|Boolean|) |t#2| $))
                                             (AND (|has| $ (|finiteAggregate|))
                                                  (|has| |t#2| (|BasicType|))))
                                            ((|maxIndex| (|t#1| $))
                                             (|has| |t#1| (|OrderedSet|)))
                                            ((|minIndex| (|t#1| $))
                                             (|has| |t#1| (|OrderedSet|)))
                                            ((|first| (|t#2| $))
                                             (|has| |t#1| (|OrderedSet|)))
                                            ((|fill!| ($ $ |t#2|))
                                             (|has| $ (|shallowlyMutable|)))
                                            ((|swap!| ((|Void|) $ |t#1| |t#1|))
                                             (|has| $ (|shallowlyMutable|))))
                                          NIL
                                          '((|Void|) (|Boolean|) (|List| |t#1|)
                                            (|List| |t#2|))
                                          NIL))
                                 . #2=(|IndexedAggregate|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|IndexedAggregate| (|devaluate| |t#1|)
                         (|devaluate| |t#2|)))))) 
