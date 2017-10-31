
(DEFPARAMETER |MultiDictionary;CAT| 'NIL) 

(DECLAIM (NOTINLINE |MultiDictionary;|)) 

(DEFPARAMETER |MultiDictionary;AL| 'NIL) 

(DEFUN |MultiDictionary| (#1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |MultiDictionary;AL|)) (CDR #2#))
     (T
      (SETQ |MultiDictionary;AL|
              (|cons5| (CONS #3# (SETQ #2# (|MultiDictionary;| #1#)))
                       |MultiDictionary;AL|))
      #2#)))) 

(DEFUN |MultiDictionary;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|MultiDictionary;CAT|)
                                    ('T
                                     (LETT |MultiDictionary;CAT|
                                           (|Join|
                                            (|DictionaryOperations| '|t#1|)
                                            (|mkCategory|
                                             '(((|insert!|
                                                 ($ |t#1| $
                                                  (|NonNegativeInteger|)))
                                                T)
                                               ((|removeDuplicates!| ($ $)) T)
                                               ((|duplicates|
                                                 ((|List|
                                                   (|Record|
                                                    (|:| |entry| |t#1|)
                                                    (|:| |count|
                                                         (|NonNegativeInteger|))))
                                                  $))
                                                T))
                                             NIL
                                             '((|List|
                                                (|Record| (|:| |entry| |t#1|)
                                                          (|:| |count|
                                                               (|NonNegativeInteger|))))
                                               (|NonNegativeInteger|))
                                             NIL))
                                           . #2=(|MultiDictionary|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|MultiDictionary| (|devaluate| |t#1|)))))) 
