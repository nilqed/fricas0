
(DEFPARAMETER |NormalizedTriangularSetCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |NormalizedTriangularSetCategory;|)) 

(DEFPARAMETER |NormalizedTriangularSetCategory;AL| 'NIL) 

(DEFUN |NormalizedTriangularSetCategory| (&REST #1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluateList| #1#)
                       |NormalizedTriangularSetCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |NormalizedTriangularSetCategory;AL|
              (|cons5|
               (CONS #3#
                     (SETQ #2#
                             (APPLY #'|NormalizedTriangularSetCategory;| #1#)))
               |NormalizedTriangularSetCategory;AL|))
      #2#)))) 

(DEFUN |NormalizedTriangularSetCategory;| (|t#1| |t#2| |t#3| |t#4|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2| |t#3| |t#4|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)
                                (|devaluate| |t#3|) (|devaluate| |t#4|)))
                    (COND (|NormalizedTriangularSetCategory;CAT|)
                          ('T
                           (LETT |NormalizedTriangularSetCategory;CAT|
                                 (|Join|
                                  (|RegularTriangularSetCategory| '|t#1| '|t#2|
                                                                  '|t#3|
                                                                  '|t#4|))
                                 . #2=(|NormalizedTriangularSetCategory|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|NormalizedTriangularSetCategory| (|devaluate| |t#1|)
                         (|devaluate| |t#2|) (|devaluate| |t#3|)
                         (|devaluate| |t#4|)))))) 
