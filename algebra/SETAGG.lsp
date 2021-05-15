
(DEFPARAMETER |SetAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |SetAggregate;|)) 

(DEFPARAMETER |SetAggregate;AL| 'NIL) 

(DEFUN |SetAggregate| (|t#1|)
  (LET (#1=#:G379 (#2=#:G380 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |SetAggregate;AL|)) (CDR #1#))
          (T
           (SETQ |SetAggregate;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|SetAggregate;| #2#)))
                            |SetAggregate;AL|))
           #1#)))) 

(DEFUN |SetAggregate;| (|t#1|)
  (SPROG ((#1=#:G378 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1|) (LIST |t#1|))
                              (COND (|SetAggregate;CAT|)
                                    ('T
                                     (LETT |SetAggregate;CAT|
                                           (|Join| (|SetCategory|)
                                                   (|Collection| '|t#1|)
                                                   (|PartialOrder|)
                                                   (|mkCategory|
                                                    '(((|set| ($)) T)
                                                      ((|set|
                                                        ($ (|List| |t#1|)))
                                                       T)
                                                      ((|intersect| ($ $ $)) T)
                                                      ((|difference| ($ $ $))
                                                       T)
                                                      ((|difference|
                                                        ($ $ |t#1|))
                                                       T)
                                                      ((|symmetricDifference|
                                                        ($ $ $))
                                                       T)
                                                      ((|subset?|
                                                        ((|Boolean|) $ $))
                                                       T)
                                                      ((|union| ($ $ $)) T)
                                                      ((|union| ($ $ |t#1|)) T)
                                                      ((|union| ($ |t#1| $))
                                                       T))
                                                    NIL NIL NIL)))))))
           (SETELT #1# 0 (LIST '|SetAggregate| |t#1|))))) 
