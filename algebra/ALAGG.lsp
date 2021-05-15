
(DEFPARAMETER |AssociationListAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |AssociationListAggregate;|)) 

(DEFPARAMETER |AssociationListAggregate;AL| 'NIL) 

(DEFUN |AssociationListAggregate| (|t#1| |t#2|)
  (LET (#1=#:G382 (#2=#:G383 (LIST (|devaluate| |t#1|) (|devaluate| |t#2|))))
    (COND ((SETQ #1# (|assoc| #2# |AssociationListAggregate;AL|)) (CDR #1#))
          (T
           (SETQ |AssociationListAggregate;AL|
                   (|cons5|
                    (CONS #2#
                          (SETQ #1# (APPLY #'|AssociationListAggregate;| #2#)))
                    |AssociationListAggregate;AL|))
           #1#)))) 

(DEFUN |AssociationListAggregate;| (|t#1| |t#2|)
  (SPROG ((#1=#:G381 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1| |t#2|) (LIST |t#1| |t#2|))
                              (|sublisV|
                               (MAKE_PAIRS '(#2=#:G380)
                                           (LIST
                                            '(|Record| (|:| |key| |t#1|)
                                                       (|:| |entry| |t#2|))))
                               (COND (|AssociationListAggregate;CAT|)
                                     ('T
                                      (LETT |AssociationListAggregate;CAT|
                                            (|Join|
                                             (|TableAggregate| '|t#1| '|t#2|)
                                             (|ListAggregate| '#2#)
                                             (|mkCategory|
                                              '(((|assoc|
                                                  ((|Union|
                                                    (|Record| (|:| |key| |t#1|)
                                                              (|:| |entry|
                                                                   |t#2|))
                                                    "failed")
                                                   |t#1| $))
                                                 T))
                                              NIL NIL NIL))))))))
           (SETELT #1# 0 (LIST '|AssociationListAggregate| |t#1| |t#2|))))) 
