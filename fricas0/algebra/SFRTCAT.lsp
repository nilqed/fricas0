
(DEFPARAMETER |SquareFreeRegularTriangularSetCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |SquareFreeRegularTriangularSetCategory;|)) 

(DEFPARAMETER |SquareFreeRegularTriangularSetCategory;AL| 'NIL) 

(DEFUN |SquareFreeRegularTriangularSetCategory| (&REST #1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluateList| #1#)
                       |SquareFreeRegularTriangularSetCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |SquareFreeRegularTriangularSetCategory;AL|
              (|cons5|
               (CONS #3#
                     (SETQ #2#
                             (APPLY #'|SquareFreeRegularTriangularSetCategory;|
                                    #1#)))
               |SquareFreeRegularTriangularSetCategory;AL|))
      #2#)))) 

(DEFUN |SquareFreeRegularTriangularSetCategory;| (|t#1| |t#2| |t#3| |t#4|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2| |t#3| |t#4|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)
                                (|devaluate| |t#3|) (|devaluate| |t#4|)))
                    (COND (|SquareFreeRegularTriangularSetCategory;CAT|)
                          ('T
                           (LETT |SquareFreeRegularTriangularSetCategory;CAT|
                                 (|Join|
                                  (|RegularTriangularSetCategory| '|t#1| '|t#2|
                                                                  '|t#3|
                                                                  '|t#4|))
                                 . #2=(|SquareFreeRegularTriangularSetCategory|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|SquareFreeRegularTriangularSetCategory|
                         (|devaluate| |t#1|) (|devaluate| |t#2|)
                         (|devaluate| |t#3|) (|devaluate| |t#4|)))))) 
