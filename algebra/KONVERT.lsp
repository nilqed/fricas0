
(DECLAIM (NOTINLINE |ConvertibleTo;|)) 

(DEFPARAMETER |ConvertibleTo;AL| 'NIL) 

(DEFUN |ConvertibleTo| (#1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |ConvertibleTo;AL|)) (CDR #2#))
     (T
      (SETQ |ConvertibleTo;AL|
              (|cons5| (CONS #3# (SETQ #2# (|ConvertibleTo;| #1#)))
                       |ConvertibleTo;AL|))
      #2#)))) 

(DEFUN |ConvertibleTo;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (|Join|
                               (|mkCategory| '(((|convert| (|t#1| $)) T)) NIL
                                             'NIL NIL)))
                   |ConvertibleTo|)
           (SETELT #1# 0 (LIST '|ConvertibleTo| (|devaluate| |t#1|)))))) 
