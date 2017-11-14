
(DEFPARAMETER |TableAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |TableAggregate;|)) 

(DEFPARAMETER |TableAggregate;AL| 'NIL) 

(DEFUN |TableAggregate| (&REST #1=#:G698)
  (LET (#2=#:G699)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |TableAggregate;AL|))
      (CDR #2#))
     (T
      (SETQ |TableAggregate;AL|
              (|cons5| (CONS #3# (SETQ #2# (APPLY #'|TableAggregate;| #1#)))
                       |TableAggregate;AL|))
      #2#)))) 

(DEFUN |TableAggregate;| (|t#1| |t#2|)
  (SPROG ((#1=#:G697 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                    (COND (|TableAggregate;CAT|)
                          ('T
                           (LETT |TableAggregate;CAT|
                                 (|Join| (|KeyedDictionary| '|t#1| '|t#2|)
                                         (|IndexedAggregate| '|t#1| '|t#2|)
                                         (|mkCategory|
                                          '(((|setelt!| (|t#2| $ |t#1| |t#2|))
                                             T)
                                            ((|table| ($)) T)
                                            ((|table|
                                              ($
                                               (|List|
                                                (|Record| (|:| |key| |t#1|)
                                                          (|:| |entry|
                                                               |t#2|)))))
                                             T)
                                            ((|map|
                                              ($ (|Mapping| |t#2| |t#2| |t#2|)
                                               $ $))
                                             T))
                                          NIL
                                          '((|List|
                                             (|Record| (|:| |key| |t#1|)
                                                       (|:| |entry| |t#2|))))
                                          NIL))
                                 . #2=(|TableAggregate|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|TableAggregate| (|devaluate| |t#1|)
                         (|devaluate| |t#2|)))))) 
