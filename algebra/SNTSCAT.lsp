
(DEFPARAMETER |SquareFreeNormalizedTriangularSetCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |SquareFreeNormalizedTriangularSetCategory;|)) 

(DEFPARAMETER |SquareFreeNormalizedTriangularSetCategory;AL| 'NIL) 

(DEFUN |SquareFreeNormalizedTriangularSetCategory| (&REST #1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluateList| #1#)
                       |SquareFreeNormalizedTriangularSetCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |SquareFreeNormalizedTriangularSetCategory;AL|
              (|cons5|
               (CONS #3#
                     (SETQ #2#
                             (APPLY
                              #'|SquareFreeNormalizedTriangularSetCategory;|
                              #1#)))
               |SquareFreeNormalizedTriangularSetCategory;AL|))
      #2#)))) 

(DEFUN |SquareFreeNormalizedTriangularSetCategory;| (|t#1| |t#2| |t#3| |t#4|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2| |t#3| |t#4|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)
                                (|devaluate| |t#3|) (|devaluate| |t#4|)))
                    (COND (|SquareFreeNormalizedTriangularSetCategory;CAT|)
                          ('T
                           (LETT
                            |SquareFreeNormalizedTriangularSetCategory;CAT|
                            (|Join|
                             (|SquareFreeRegularTriangularSetCategory| '|t#1|
                                                                       '|t#2|
                                                                       '|t#3|
                                                                       '|t#4|)
                             (|NormalizedTriangularSetCategory| '|t#1| '|t#2|
                                                                '|t#3| '|t#4|))
                            . #2=(|SquareFreeNormalizedTriangularSetCategory|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|SquareFreeNormalizedTriangularSetCategory|
                         (|devaluate| |t#1|) (|devaluate| |t#2|)
                         (|devaluate| |t#3|) (|devaluate| |t#4|)))))) 
