
(DEFPARAMETER |RecursiveAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |RecursiveAggregate;|)) 

(DEFPARAMETER |RecursiveAggregate;AL| 'NIL) 

(DEFUN |RecursiveAggregate| (|t#1|)
  (LET (#1=#:G384 (#2=#:G385 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |RecursiveAggregate;AL|)) (CDR #1#))
          (T
           (SETQ |RecursiveAggregate;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|RecursiveAggregate;| #2#)))
                            |RecursiveAggregate;AL|))
           #1#)))) 

(DEFUN |RecursiveAggregate;| (|t#1|)
  (SPROG ((#1=#:G383 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1|) (LIST |t#1|))
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
                                             NIL NIL NIL)))))))
           (SETELT #1# 0 (LIST '|RecursiveAggregate| |t#1|))))) 
