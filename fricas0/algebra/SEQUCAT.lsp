
(DEFPARAMETER |SequenceCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |SequenceCategory;|)) 

(DEFPARAMETER |SequenceCategory;AL| 'NIL) 

(DEFUN |SequenceCategory| (#1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |SequenceCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |SequenceCategory;AL|
              (|cons5| (CONS #3# (SETQ #2# (|SequenceCategory;| #1#)))
                       |SequenceCategory;AL|))
      #2#)))) 

(DEFUN |SequenceCategory;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|SequenceCategory;CAT|)
                                    ('T
                                     (LETT |SequenceCategory;CAT|
                                           (|Join|
                                            (|LazyStreamAggregate| '|t#1|)
                                            (|Module| '|t#1|)
                                            (|mkCategory|
                                             '(((|elt| (|t#1| $ (|Integer|)))
                                                T)
                                               ((|apply|
                                                 (|t#1| $ (|Partition|)))
                                                T)
                                               ((|cons| ($ |t#1| $)) T)
                                               ((|coerce| ($ (|Stream| |t#1|)))
                                                T)
                                               ((|sequence|
                                                 ($ (|Stream| |t#1|)))
                                                T)
                                               ((|stream| ((|Stream| |t#1|) $))
                                                T)
                                               ((|first|
                                                 ($ $ (|NonNegativeInteger|)))
                                                T)
                                               ((|firstn|
                                                 ((|List| |t#1|) $
                                                  (|NonNegativeInteger|)))
                                                T)
                                               ((|dilate| ($ |t#1| $)) T)
                                               ((|sequence|
                                                 ($ (|Mapping| |t#1| |t#1|)
                                                  |t#1|))
                                                T))
                                             NIL
                                             '((|List| |t#1|)
                                               (|NonNegativeInteger|)
                                               (|Stream| |t#1|) (|Partition|)
                                               (|Integer|))
                                             NIL))
                                           . #2=(|SequenceCategory|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|SequenceCategory| (|devaluate| |t#1|)))))) 
