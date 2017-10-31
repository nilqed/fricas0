
(DEFPARAMETER |DifferentialVariableCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |DifferentialVariableCategory;|)) 

(DEFPARAMETER |DifferentialVariableCategory;AL| 'NIL) 

(DEFUN |DifferentialVariableCategory| (#1=#:G696)
  (LET (#2=#:G697)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluate| #1#) |DifferentialVariableCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |DifferentialVariableCategory;AL|
              (|cons5|
               (CONS #3# (SETQ #2# (|DifferentialVariableCategory;| #1#)))
               |DifferentialVariableCategory;AL|))
      #2#)))) 

(DEFUN |DifferentialVariableCategory;| (|t#1|)
  (SPROG ((#1=#:G695 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|DifferentialVariableCategory;CAT|)
                                    ('T
                                     (LETT |DifferentialVariableCategory;CAT|
                                           (|Join| (|OrderedSet|)
                                                   (|RetractableTo| '|t#1|)
                                                   (|mkCategory|
                                                    '(((|makeVariable|
                                                        ($ |t#1|
                                                         (|NonNegativeInteger|)))
                                                       T)
                                                      ((|order|
                                                        ((|NonNegativeInteger|)
                                                         $))
                                                       T)
                                                      ((|variable| (|t#1| $))
                                                       T)
                                                      ((|weight|
                                                        ((|NonNegativeInteger|)
                                                         $))
                                                       T)
                                                      ((|differentiate| ($ $))
                                                       T)
                                                      ((|differentiate|
                                                        ($ $
                                                         (|NonNegativeInteger|)))
                                                       T)
                                                      ((|coerce| ($ |t#1|)) T))
                                                    NIL
                                                    '((|NonNegativeInteger|))
                                                    NIL))
                                           . #2=(|DifferentialVariableCategory|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|DifferentialVariableCategory|
                         (|devaluate| |t#1|)))))) 
