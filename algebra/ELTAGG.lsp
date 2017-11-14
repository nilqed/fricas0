
(DEFPARAMETER |EltableAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |EltableAggregate;|)) 

(DEFPARAMETER |EltableAggregate;AL| 'NIL) 

(DEFUN |EltableAggregate| (&REST #1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |EltableAggregate;AL|))
      (CDR #2#))
     (T
      (SETQ |EltableAggregate;AL|
              (|cons5| (CONS #3# (SETQ #2# (APPLY #'|EltableAggregate;| #1#)))
                       |EltableAggregate;AL|))
      #2#)))) 

(DEFUN |EltableAggregate;| (|t#1| |t#2|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                    (COND (|EltableAggregate;CAT|)
                          ('T
                           (LETT |EltableAggregate;CAT|
                                 (|Join| (|Eltable| '|t#1| '|t#2|)
                                         (|mkCategory|
                                          '(((|elt| (|t#2| $ |t#1| |t#2|)) T)
                                            ((|qelt| (|t#2| $ |t#1|)) T)
                                            ((|setelt!| (|t#2| $ |t#1| |t#2|))
                                             (|has| $ (|shallowlyMutable|)))
                                            ((|qsetelt!| (|t#2| $ |t#1| |t#2|))
                                             (|has| $ (|shallowlyMutable|))))
                                          NIL 'NIL NIL))
                                 . #2=(|EltableAggregate|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|EltableAggregate| (|devaluate| |t#1|)
                         (|devaluate| |t#2|)))))) 
