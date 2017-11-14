
(DEFPARAMETER |LinearAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |LinearAggregate;|)) 

(DEFPARAMETER |LinearAggregate;AL| 'NIL) 

(DEFUN |LinearAggregate| (#1=#:G697)
  (LET (#2=#:G698)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |LinearAggregate;AL|)) (CDR #2#))
     (T
      (SETQ |LinearAggregate;AL|
              (|cons5| (CONS #3# (SETQ #2# (|LinearAggregate;| #1#)))
                       |LinearAggregate;AL|))
      #2#)))) 

(DEFUN |LinearAggregate;| (|t#1|)
  (SPROG ((#1=#:G696 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (|sublisV|
                               (PAIR '(#2=#:G694 #3=#:G695)
                                     (LIST '(|Integer|)
                                           '(|UniversalSegment| (|Integer|))))
                               (COND (|LinearAggregate;CAT|)
                                     ('T
                                      (LETT |LinearAggregate;CAT|
                                            (|Join|
                                             (|IndexedAggregate| '#2# '|t#1|)
                                             (|Collection| '|t#1|)
                                             (|Eltable| '#3# '$)
                                             (|mkCategory|
                                              '(((|new|
                                                  ($ (|NonNegativeInteger|)
                                                   |t#1|))
                                                 T)
                                                ((|concat| ($ $ |t#1|)) T)
                                                ((|concat| ($ |t#1| $)) T)
                                                ((|concat| ($ $ $)) T)
                                                ((|concat| ($ (|List| $))) T)
                                                ((|map|
                                                  ($
                                                   (|Mapping| |t#1| |t#1|
                                                              |t#1|)
                                                   $ $))
                                                 T)
                                                ((|delete| ($ $ (|Integer|)))
                                                 T)
                                                ((|delete|
                                                  ($ $
                                                   (|UniversalSegment|
                                                    (|Integer|))))
                                                 T)
                                                ((|first|
                                                  ($ $ (|NonNegativeInteger|)))
                                                 T)
                                                ((|insert|
                                                  ($ |t#1| $ (|Integer|)))
                                                 T)
                                                ((|insert| ($ $ $ (|Integer|)))
                                                 T)
                                                ((|setelt!|
                                                  (|t#1| $
                                                   (|UniversalSegment|
                                                    (|Integer|))
                                                   |t#1|))
                                                 (|has| $
                                                        (|shallowlyMutable|)))
                                                ((|merge|
                                                  ($
                                                   (|Mapping| (|Boolean|) |t#1|
                                                              |t#1|)
                                                   $ $))
                                                 (|has| $ (|finiteAggregate|)))
                                                ((|reverse| ($ $))
                                                 (|has| $ (|finiteAggregate|)))
                                                ((|sort|
                                                  ($
                                                   (|Mapping| (|Boolean|) |t#1|
                                                              |t#1|)
                                                   $))
                                                 (|has| $ (|finiteAggregate|)))
                                                ((|sorted?|
                                                  ((|Boolean|)
                                                   (|Mapping| (|Boolean|) |t#1|
                                                              |t#1|)
                                                   $))
                                                 (|has| $ (|finiteAggregate|)))
                                                ((|position|
                                                  ((|Integer|)
                                                   (|Mapping| (|Boolean|)
                                                              |t#1|)
                                                   $))
                                                 (|has| $ (|finiteAggregate|)))
                                                ((|position|
                                                  ((|Integer|) |t#1| $))
                                                 (AND
                                                  (|has| |t#1| (|BasicType|))
                                                  (|has| $
                                                         (|finiteAggregate|))))
                                                ((|position|
                                                  ((|Integer|) |t#1| $
                                                   (|Integer|)))
                                                 (AND
                                                  (|has| |t#1| (|BasicType|))
                                                  (|has| $
                                                         (|finiteAggregate|))))
                                                ((|leftTrim| ($ $ |t#1|))
                                                 (AND
                                                  (|has| |t#1| (|BasicType|))
                                                  (|has| $
                                                         (|finiteAggregate|))))
                                                ((|rightTrim| ($ $ |t#1|))
                                                 (AND
                                                  (|has| |t#1| (|BasicType|))
                                                  (|has| $
                                                         (|finiteAggregate|))))
                                                ((|trim| ($ $ |t#1|))
                                                 (AND
                                                  (|has| |t#1| (|BasicType|))
                                                  (|has| $
                                                         (|finiteAggregate|))))
                                                ((|merge| ($ $ $))
                                                 (AND
                                                  (|has| |t#1| (|OrderedSet|))
                                                  (|has| $
                                                         (|finiteAggregate|))))
                                                ((|sort| ($ $))
                                                 (AND
                                                  (|has| |t#1| (|OrderedSet|))
                                                  (|has| $
                                                         (|finiteAggregate|))))
                                                ((|sorted?| ((|Boolean|) $))
                                                 (AND
                                                  (|has| |t#1| (|OrderedSet|))
                                                  (|has| $
                                                         (|finiteAggregate|))))
                                                ((|copyInto!|
                                                  ($ $ $ (|Integer|)))
                                                 (AND
                                                  (|has| $
                                                         (|shallowlyMutable|))
                                                  (|has| $
                                                         (|finiteAggregate|))))
                                                ((|reverse!| ($ $))
                                                 (AND
                                                  (|has| $
                                                         (|shallowlyMutable|))
                                                  (|has| $
                                                         (|finiteAggregate|))))
                                                ((|sort!|
                                                  ($
                                                   (|Mapping| (|Boolean|) |t#1|
                                                              |t#1|)
                                                   $))
                                                 (AND
                                                  (|has| $
                                                         (|shallowlyMutable|))
                                                  (|has| $
                                                         (|finiteAggregate|))))
                                                ((|sort!| ($ $))
                                                 (AND
                                                  (|has| |t#1| (|OrderedSet|))
                                                  (|has| $
                                                         (|shallowlyMutable|))
                                                  (|has| $
                                                         (|finiteAggregate|)))))
                                              '(((|Comparable|)
                                                 (AND
                                                  (|has| |t#1| (|Comparable|))
                                                  (|has| $
                                                         (|finiteAggregate|))))
                                                ((|OrderedSet|)
                                                 (AND
                                                  (|has| |t#1| (|OrderedSet|))
                                                  (|has| $
                                                         (|finiteAggregate|)))))
                                              '((|Integer|) (|Boolean|)
                                                (|UniversalSegment|
                                                 (|Integer|))
                                                (|NonNegativeInteger|)
                                                (|List| $))
                                              NIL))
                                            . #4=(|LinearAggregate|))))))
                   . #4#)
           (SETELT #1# 0 (LIST '|LinearAggregate| (|devaluate| |t#1|)))))) 
