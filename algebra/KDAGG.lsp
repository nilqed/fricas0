
(DEFPARAMETER |KeyedDictionary;CAT| 'NIL) 

(DECLAIM (NOTINLINE |KeyedDictionary;|)) 

(DEFPARAMETER |KeyedDictionary;AL| 'NIL) 

(DEFUN |KeyedDictionary| (|t#1| |t#2|)
  (LET (#1=#:G382 (#2=#:G383 (LIST (|devaluate| |t#1|) (|devaluate| |t#2|))))
    (COND ((SETQ #1# (|assoc| #2# |KeyedDictionary;AL|)) (CDR #1#))
          (T
           (SETQ |KeyedDictionary;AL|
                   (|cons5|
                    (CONS #2# (SETQ #1# (APPLY #'|KeyedDictionary;| #2#)))
                    |KeyedDictionary;AL|))
           #1#)))) 

(DEFUN |KeyedDictionary;| (|t#1| |t#2|)
  (SPROG ((#1=#:G381 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1| |t#2|) (LIST |t#1| |t#2|))
                              (|sublisV|
                               (MAKE_PAIRS '(#2=#:G380)
                                           (LIST
                                            '(|Record| (|:| |key| |t#1|)
                                                       (|:| |entry| |t#2|))))
                               (COND (|KeyedDictionary;CAT|)
                                     ('T
                                      (LETT |KeyedDictionary;CAT|
                                            (|Join| (|Dictionary| '#2#)
                                                    (|mkCategory|
                                                     '(((|key?|
                                                         ((|Boolean|) |t#1| $))
                                                        T)
                                                       ((|keys|
                                                         ((|List| |t#1|) $))
                                                        T)
                                                       ((|remove!|
                                                         ((|Union| |t#2|
                                                                   "failed")
                                                          |t#1| $))
                                                        T)
                                                       ((|search|
                                                         ((|Union| |t#2|
                                                                   "failed")
                                                          |t#1| $))
                                                        T))
                                                     NIL NIL NIL))))))))
           (SETELT #1# 0 (LIST '|KeyedDictionary| |t#1| |t#2|))))) 
