
(DEFPARAMETER |NormalizedTriangularSetCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |NormalizedTriangularSetCategory;|)) 

(DEFPARAMETER |NormalizedTriangularSetCategory;AL| 'NIL) 

(DEFUN |NormalizedTriangularSetCategory| (|t#1| |t#2| |t#3| |t#4|)
  (LET (#1=#:G379
        (#2=#:G380
         (LIST (|devaluate| |t#1|) (|devaluate| |t#2|) (|devaluate| |t#3|)
               (|devaluate| |t#4|))))
    (COND
     ((SETQ #1# (|assoc| #2# |NormalizedTriangularSetCategory;AL|)) (CDR #1#))
     (T
      (SETQ |NormalizedTriangularSetCategory;AL|
              (|cons5|
               (CONS #2#
                     (SETQ #1#
                             (APPLY #'|NormalizedTriangularSetCategory;| #2#)))
               |NormalizedTriangularSetCategory;AL|))
      #1#)))) 

(DEFUN |NormalizedTriangularSetCategory;| (|t#1| |t#2| |t#3| |t#4|)
  (SPROG ((#1=#:G378 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (MAKE_PAIRS '(|t#1| |t#2| |t#3| |t#4|)
                                (LIST |t#1| |t#2| |t#3| |t#4|))
                    (COND (|NormalizedTriangularSetCategory;CAT|)
                          ('T
                           (LETT |NormalizedTriangularSetCategory;CAT|
                                 (|Join|
                                  (|RegularTriangularSetCategory| '|t#1| '|t#2|
                                                                  '|t#3|
                                                                  '|t#4|)))))))
           (SETELT #1# 0
                   (LIST '|NormalizedTriangularSetCategory| |t#1| |t#2| |t#3|
                         |t#4|))))) 
