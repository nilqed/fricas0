
(DEFPARAMETER |LazyStreamAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |LazyStreamAggregate;|)) 

(DEFPARAMETER |LazyStreamAggregate;AL| 'NIL) 

(DEFUN |LazyStreamAggregate| (#1=#:G786)
  (LET (#2=#:G787)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |LazyStreamAggregate;AL|))
      (CDR #2#))
     (T
      (SETQ |LazyStreamAggregate;AL|
              (|cons5| (CONS #3# (SETQ #2# (|LazyStreamAggregate;| #1#)))
                       |LazyStreamAggregate;AL|))
      #2#)))) 

(DEFUN |LazyStreamAggregate;| (|t#1|)
  (SPROG ((#1=#:G785 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|LazyStreamAggregate;CAT|)
                                    ('T
                                     (LETT |LazyStreamAggregate;CAT|
                                           (|Join| (|StreamAggregate| '|t#1|)
                                                   (|mkCategory|
                                                    '(((|remove|
                                                        ($
                                                         (|Mapping| (|Boolean|)
                                                                    |t#1|)
                                                         $))
                                                       T)
                                                      ((|select|
                                                        ($
                                                         (|Mapping| (|Boolean|)
                                                                    |t#1|)
                                                         $))
                                                       T)
                                                      ((|explicitEntries?|
                                                        ((|Boolean|) $))
                                                       T)
                                                      ((|explicitlyEmpty?|
                                                        ((|Boolean|) $))
                                                       T)
                                                      ((|lazy?|
                                                        ((|Boolean|) $))
                                                       T)
                                                      ((|lazyEvaluate| ($ $))
                                                       T)
                                                      ((|frst| (|t#1| $)) T)
                                                      ((|rst| ($ $)) T)
                                                      ((|numberOfComputedEntries|
                                                        ((|NonNegativeInteger|)
                                                         $))
                                                       T)
                                                      ((|extend|
                                                        ($ $ (|Integer|)))
                                                       T)
                                                      ((|complete| ($ $)) T))
                                                    NIL
                                                    '((|Integer|)
                                                      (|NonNegativeInteger|)
                                                      (|Boolean|))
                                                    NIL))
                                           . #2=(|LazyStreamAggregate|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|LazyStreamAggregate| (|devaluate| |t#1|)))))) 
