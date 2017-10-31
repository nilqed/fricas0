
(DEFPARAMETER |SetAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |SetAggregate;|)) 

(DEFPARAMETER |SetAggregate;AL| 'NIL) 

(DEFUN |SetAggregate| (#1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |SetAggregate;AL|)) (CDR #2#))
     (T
      (SETQ |SetAggregate;AL|
              (|cons5| (CONS #3# (SETQ #2# (|SetAggregate;| #1#)))
                       |SetAggregate;AL|))
      #2#)))) 

(DEFUN |SetAggregate;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|SetAggregate;CAT|)
                                    ('T
                                     (LETT |SetAggregate;CAT|
                                           (|Join| (|SetCategory|)
                                                   (|Collection| '|t#1|)
                                                   (|PartialOrder|)
                                                   (|mkCategory|
                                                    '(((|brace| ($)) T)
                                                      ((|brace|
                                                        ($ (|List| |t#1|)))
                                                       T)
                                                      ((|set| ($)) T)
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
                                                    NIL
                                                    '((|Boolean|)
                                                      (|List| |t#1|))
                                                    NIL))
                                           . #2=(|SetAggregate|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|SetAggregate| (|devaluate| |t#1|)))))) 
