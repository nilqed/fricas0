
(DEFPARAMETER |RecursiveAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |RecursiveAggregate;|)) 

(DEFPARAMETER |RecursiveAggregate;AL| 'NIL) 

(DEFUN |RecursiveAggregate| (#1=#:G693)
  (LET (#2=#:G694)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |RecursiveAggregate;AL|))
      (CDR #2#))
     (T
      (SETQ |RecursiveAggregate;AL|
              (|cons5| (CONS #3# (SETQ #2# (|RecursiveAggregate;| #1#)))
                       |RecursiveAggregate;AL|))
      #2#)))) 

(DEFUN |RecursiveAggregate;| (|t#1|)
  (SPROG ((#1=#:G692 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|RecursiveAggregate;CAT|)
                                    ('T
                                     (LETT |RecursiveAggregate;CAT|
                                           (|Join|
                                            (|HomogeneousAggregate| '|t#1|)
                                            (|mkCategory|
                                             '(((|children| ((|List| $) $)) T)
                                               ((|nodes| ((|List| $) $)) T)
                                               ((|leaf?| ((|Boolean|) $)) T)
                                               ((|value| (|t#1| $)) T)
                                               ((|elt| (|t#1| $ "value")) T)
                                               ((|cyclic?| ((|Boolean|) $)) T)
                                               ((|leaves| ((|List| |t#1|) $))
                                                T)
                                               ((|distance| ((|Integer|) $ $))
                                                T)
                                               ((|child?| ((|Boolean|) $ $))
                                                (|has| |t#1| (|BasicType|)))
                                               ((|node?| ((|Boolean|) $ $))
                                                (|has| |t#1| (|BasicType|)))
                                               ((|setchildren!|
                                                 ($ $ (|List| $)))
                                                (|has| $ (|shallowlyMutable|)))
                                               ((|setelt!|
                                                 (|t#1| $ "value" |t#1|))
                                                (|has| $ (|shallowlyMutable|)))
                                               ((|setvalue!| (|t#1| $ |t#1|))
                                                (|has| $
                                                       (|shallowlyMutable|))))
                                             NIL
                                             '((|List| $) (|Boolean|)
                                               (|Integer|) (|List| |t#1|))
                                             NIL))
                                           . #2=(|RecursiveAggregate|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|RecursiveAggregate| (|devaluate| |t#1|)))))) 
