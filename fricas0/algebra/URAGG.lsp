
(DEFPARAMETER |UnaryRecursiveAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |UnaryRecursiveAggregate;|)) 

(DEFPARAMETER |UnaryRecursiveAggregate;AL| 'NIL) 

(DEFUN |UnaryRecursiveAggregate| (#1=#:G735)
  (LET (#2=#:G736)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |UnaryRecursiveAggregate;AL|))
      (CDR #2#))
     (T
      (SETQ |UnaryRecursiveAggregate;AL|
              (|cons5| (CONS #3# (SETQ #2# (|UnaryRecursiveAggregate;| #1#)))
                       |UnaryRecursiveAggregate;AL|))
      #2#)))) 

(DEFUN |UnaryRecursiveAggregate;| (|t#1|)
  (SPROG ((#1=#:G734 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|UnaryRecursiveAggregate;CAT|)
                                    ('T
                                     (LETT |UnaryRecursiveAggregate;CAT|
                                           (|Join|
                                            (|RecursiveAggregate| '|t#1|)
                                            (|mkCategory|
                                             '(((|concat| ($ $ $)) T)
                                               ((|concat| ($ |t#1| $)) T)
                                               ((|first| (|t#1| $)) T)
                                               ((|elt| (|t#1| $ "first")) T)
                                               ((|first|
                                                 ($ $ (|NonNegativeInteger|)))
                                                T)
                                               ((|rest| ($ $)) T)
                                               ((|elt| ($ $ "rest")) T)
                                               ((|rest|
                                                 ($ $ (|NonNegativeInteger|)))
                                                T)
                                               ((|last| (|t#1| $)) T)
                                               ((|elt| (|t#1| $ "last")) T)
                                               ((|last|
                                                 ($ $ (|NonNegativeInteger|)))
                                                T)
                                               ((|tail| ($ $)) T)
                                               ((|second| (|t#1| $)) T)
                                               ((|third| (|t#1| $)) T)
                                               ((|cycleEntry| ($ $)) T)
                                               ((|cycleLength|
                                                 ((|NonNegativeInteger|) $))
                                                T)
                                               ((|cycleTail| ($ $)) T)
                                               ((|concat!| ($ $ $))
                                                (|has| $ (|shallowlyMutable|)))
                                               ((|concat!| ($ $ |t#1|))
                                                (|has| $ (|shallowlyMutable|)))
                                               ((|cycleSplit!| ($ $))
                                                (|has| $ (|shallowlyMutable|)))
                                               ((|setfirst!| (|t#1| $ |t#1|))
                                                (|has| $ (|shallowlyMutable|)))
                                               ((|qsetfirst!| (|t#1| $ |t#1|))
                                                (|has| $ (|shallowlyMutable|)))
                                               ((|setelt!|
                                                 (|t#1| $ "first" |t#1|))
                                                (|has| $ (|shallowlyMutable|)))
                                               ((|setrest!| ($ $ $))
                                                (|has| $ (|shallowlyMutable|)))
                                               ((|qsetrest!| ($ $ $))
                                                (|has| $ (|shallowlyMutable|)))
                                               ((|setelt!| ($ $ "rest" $))
                                                (|has| $ (|shallowlyMutable|)))
                                               ((|setlast!| (|t#1| $ |t#1|))
                                                (|has| $ (|shallowlyMutable|)))
                                               ((|setelt!|
                                                 (|t#1| $ "last" |t#1|))
                                                (|has| $ (|shallowlyMutable|)))
                                               ((|split!|
                                                 ($ $ (|NonNegativeInteger|)))
                                                (|has| $
                                                       (|shallowlyMutable|))))
                                             NIL '((|NonNegativeInteger|))
                                             NIL))
                                           . #2=(|UnaryRecursiveAggregate|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|UnaryRecursiveAggregate| (|devaluate| |t#1|)))))) 
