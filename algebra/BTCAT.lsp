
(DEFPARAMETER |BinaryTreeCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |BinaryTreeCategory;|)) 

(DEFPARAMETER |BinaryTreeCategory;AL| 'NIL) 

(DEFUN |BinaryTreeCategory| (#1=#:G700)
  (LET (#2=#:G701)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |BinaryTreeCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |BinaryTreeCategory;AL|
              (|cons5| (CONS #3# (SETQ #2# (|BinaryTreeCategory;| #1#)))
                       |BinaryTreeCategory;AL|))
      #2#)))) 

(DEFUN |BinaryTreeCategory;| (|t#1|)
  (SPROG ((#1=#:G699 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|BinaryTreeCategory;CAT|)
                                    ('T
                                     (LETT |BinaryTreeCategory;CAT|
                                           (|Join|
                                            (|BinaryRecursiveAggregate| '|t#1|)
                                            (|shallowlyMutable|)
                                            (|finiteAggregate|)
                                            (|mkCategory|
                                             '(((|node| ($ $ |t#1| $)) T)) NIL
                                             'NIL NIL))
                                           . #2=(|BinaryTreeCategory|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|BinaryTreeCategory| (|devaluate| |t#1|)))))) 
