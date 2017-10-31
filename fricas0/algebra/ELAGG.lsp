
(DEFPARAMETER |ExtensibleLinearAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |ExtensibleLinearAggregate;|)) 

(DEFPARAMETER |ExtensibleLinearAggregate;AL| 'NIL) 

(DEFUN |ExtensibleLinearAggregate| (#1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |ExtensibleLinearAggregate;AL|))
      (CDR #2#))
     (T
      (SETQ |ExtensibleLinearAggregate;AL|
              (|cons5| (CONS #3# (SETQ #2# (|ExtensibleLinearAggregate;| #1#)))
                       |ExtensibleLinearAggregate;AL|))
      #2#)))) 

(DEFUN |ExtensibleLinearAggregate;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|ExtensibleLinearAggregate;CAT|)
                                    ('T
                                     (LETT |ExtensibleLinearAggregate;CAT|
                                           (|Join| (|LinearAggregate| '|t#1|)
                                                   (|shallowlyMutable|)
                                                   (|mkCategory|
                                                    '(((|concat!| ($ $ |t#1|))
                                                       T)
                                                      ((|concat!| ($ $ $)) T)
                                                      ((|delete!|
                                                        ($ $ (|Integer|)))
                                                       T)
                                                      ((|delete!|
                                                        ($ $
                                                         (|UniversalSegment|
                                                          (|Integer|))))
                                                       T)
                                                      ((|remove!|
                                                        ($
                                                         (|Mapping| (|Boolean|)
                                                                    |t#1|)
                                                         $))
                                                       T)
                                                      ((|insert!|
                                                        ($ |t#1| $
                                                         (|Integer|)))
                                                       T)
                                                      ((|insert!|
                                                        ($ $ $ (|Integer|)))
                                                       T)
                                                      ((|merge!|
                                                        ($
                                                         (|Mapping| (|Boolean|)
                                                                    |t#1|
                                                                    |t#1|)
                                                         $ $))
                                                       T)
                                                      ((|select!|
                                                        ($
                                                         (|Mapping| (|Boolean|)
                                                                    |t#1|)
                                                         $))
                                                       T)
                                                      ((|remove!| ($ |t#1| $))
                                                       (|has| |t#1|
                                                              (|BasicType|)))
                                                      ((|removeDuplicates!|
                                                        ($ $))
                                                       (|has| |t#1|
                                                              (|BasicType|)))
                                                      ((|merge!| ($ $ $))
                                                       (|has| |t#1|
                                                              (|OrderedSet|))))
                                                    NIL
                                                    '((|Integer|)
                                                      (|UniversalSegment|
                                                       (|Integer|)))
                                                    NIL))
                                           . #2=(|ExtensibleLinearAggregate|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|ExtensibleLinearAggregate| (|devaluate| |t#1|)))))) 
