
(DEFPARAMETER |EltableAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |EltableAggregate;|)) 

(DEFPARAMETER |EltableAggregate;AL| 'NIL) 

(DEFUN |EltableAggregate| (|t#1| |t#2|)
  (LET (#1=#:G379 (#2=#:G380 (LIST (|devaluate| |t#1|) (|devaluate| |t#2|))))
    (COND ((SETQ #1# (|assoc| #2# |EltableAggregate;AL|)) (CDR #1#))
          (T
           (SETQ |EltableAggregate;AL|
                   (|cons5|
                    (CONS #2# (SETQ #1# (APPLY #'|EltableAggregate;| #2#)))
                    |EltableAggregate;AL|))
           #1#)))) 

(DEFUN |EltableAggregate;| (|t#1| |t#2|)
  (SPROG ((#1=#:G378 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1| |t#2|) (LIST |t#1| |t#2|))
                              (COND (|EltableAggregate;CAT|)
                                    ('T
                                     (LETT |EltableAggregate;CAT|
                                           (|Join| (|Eltable| '|t#1| '|t#2|)
                                                   (|mkCategory|
                                                    '(((|elt|
                                                        (|t#2| $ |t#1| |t#2|))
                                                       T)
                                                      ((|qelt| (|t#2| $ |t#1|))
                                                       T)
                                                      ((|setelt!|
                                                        (|t#2| $ |t#1| |t#2|))
                                                       (|has| $
                                                              (|shallowlyMutable|)))
                                                      ((|qsetelt!|
                                                        (|t#2| $ |t#1| |t#2|))
                                                       (|has| $
                                                              (|shallowlyMutable|))))
                                                    NIL NIL NIL)))))))
           (SETELT #1# 0 (LIST '|EltableAggregate| |t#1| |t#2|))))) 
