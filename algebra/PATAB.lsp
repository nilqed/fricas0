
(DECLAIM (NOTINLINE |Patternable;|)) 

(DEFPARAMETER |Patternable;AL| 'NIL) 

(DEFUN |Patternable| (|t#1|)
  (LET (#1=#:G379 (#2=#:G380 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |Patternable;AL|)) (CDR #1#))
          (T
           (SETQ |Patternable;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|Patternable;| #2#)))
                            |Patternable;AL|))
           #1#)))) 

(DEFUN |Patternable;| (|t#1|)
  (SPROG ((#1=#:G378 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1|) (LIST |t#1|))
                              (|Join|
                               (|mkCategory| NIL
                                             '(((|ConvertibleTo|
                                                 (|Pattern| (|Integer|)))
                                                (|has| |t#1|
                                                       (|ConvertibleTo|
                                                        (|Pattern|
                                                         (|Integer|)))))
                                               ((|ConvertibleTo|
                                                 (|Pattern| (|Float|)))
                                                (|has| |t#1|
                                                       (|ConvertibleTo|
                                                        (|Pattern|
                                                         (|Float|))))))
                                             NIL NIL))))
           (SETELT #1# 0 (LIST '|Patternable| |t#1|))))) 
