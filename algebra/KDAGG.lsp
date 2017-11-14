
(DEFPARAMETER |KeyedDictionary;CAT| 'NIL) 

(DECLAIM (NOTINLINE |KeyedDictionary;|)) 

(DEFPARAMETER |KeyedDictionary;AL| 'NIL) 

(DEFUN |KeyedDictionary| (&REST #1=#:G694)
  (LET (#2=#:G695)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |KeyedDictionary;AL|))
      (CDR #2#))
     (T
      (SETQ |KeyedDictionary;AL|
              (|cons5| (CONS #3# (SETQ #2# (APPLY #'|KeyedDictionary;| #1#)))
                       |KeyedDictionary;AL|))
      #2#)))) 

(DEFUN |KeyedDictionary;| (|t#1| |t#2|)
  (SPROG ((#1=#:G693 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                    (|sublisV|
                     (PAIR '(#2=#:G692)
                           (LIST
                            '(|Record| (|:| |key| |t#1|) (|:| |entry| |t#2|))))
                     (COND (|KeyedDictionary;CAT|)
                           ('T
                            (LETT |KeyedDictionary;CAT|
                                  (|Join| (|Dictionary| '#2#)
                                          (|mkCategory|
                                           '(((|key?| ((|Boolean|) |t#1| $)) T)
                                             ((|keys| ((|List| |t#1|) $)) T)
                                             ((|remove!|
                                               ((|Union| |t#2| "failed") |t#1|
                                                $))
                                              T)
                                             ((|search|
                                               ((|Union| |t#2| "failed") |t#1|
                                                $))
                                              T))
                                           NIL '((|List| |t#1|) (|Boolean|))
                                           NIL))
                                  . #3=(|KeyedDictionary|))))))
                   . #3#)
           (SETELT #1# 0
                   (LIST '|KeyedDictionary| (|devaluate| |t#1|)
                         (|devaluate| |t#2|)))))) 
