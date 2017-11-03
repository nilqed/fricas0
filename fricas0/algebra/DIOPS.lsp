
(DEFPARAMETER |DictionaryOperations;CAT| 'NIL) 

(DECLAIM (NOTINLINE |DictionaryOperations;|)) 

(DEFPARAMETER |DictionaryOperations;AL| 'NIL) 

(DEFUN |DictionaryOperations| (#1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |DictionaryOperations;AL|))
      (CDR #2#))
     (T
      (SETQ |DictionaryOperations;AL|
              (|cons5| (CONS #3# (SETQ #2# (|DictionaryOperations;| #1#)))
                       |DictionaryOperations;AL|))
      #2#)))) 

(DEFUN |DictionaryOperations;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|DictionaryOperations;CAT|)
                                    ('T
                                     (LETT |DictionaryOperations;CAT|
                                           (|Join| (|BagAggregate| '|t#1|)
                                                   (|mkCategory|
                                                    '(((|dictionary| ($)) T)
                                                      ((|dictionary|
                                                        ($ (|List| |t#1|)))
                                                       T)
                                                      ((|remove!| ($ |t#1| $))
                                                       (AND
                                                        (|has| |t#1|
                                                               (|BasicType|))
                                                        (|has| $
                                                               (|finiteAggregate|))))
                                                      ((|remove!|
                                                        ($
                                                         (|Mapping| (|Boolean|)
                                                                    |t#1|)
                                                         $))
                                                       (|has| $
                                                              (|finiteAggregate|)))
                                                      ((|select!|
                                                        ($
                                                         (|Mapping| (|Boolean|)
                                                                    |t#1|)
                                                         $))
                                                       (|has| $
                                                              (|finiteAggregate|))))
                                                    NIL '((|List| |t#1|)) NIL))
                                           . #2=(|DictionaryOperations|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|DictionaryOperations| (|devaluate| |t#1|)))))) 
