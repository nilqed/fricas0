
(DEFPARAMETER |PermutationCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |PermutationCategory;|)) 

(DEFPARAMETER |PermutationCategory;AL| 'NIL) 

(DEFUN |PermutationCategory| (#1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |PermutationCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |PermutationCategory;AL|
              (|cons5| (CONS #3# (SETQ #2# (|PermutationCategory;| #1#)))
                       |PermutationCategory;AL|))
      #2#)))) 

(DEFUN |PermutationCategory;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|PermutationCategory;CAT|)
                                    ('T
                                     (LETT |PermutationCategory;CAT|
                                           (|Join| (|Group|)
                                                   (|mkCategory|
                                                    '(((|cycle|
                                                        ($ (|List| |t#1|)))
                                                       T)
                                                      ((|cycles|
                                                        ($
                                                         (|List|
                                                          (|List| |t#1|))))
                                                       T)
                                                      ((|eval| (|t#1| $ |t#1|))
                                                       T)
                                                      ((|elt| (|t#1| $ |t#1|))
                                                       T)
                                                      ((|orbit|
                                                        ((|Set| |t#1|) $
                                                         |t#1|))
                                                       T)
                                                      ((< ((|Boolean|) $ $))
                                                       T))
                                                    '(((|OrderedSet|)
                                                       (|has| |t#1|
                                                              (|OrderedSet|)))
                                                      ((|OrderedSet|)
                                                       (|has| |t#1|
                                                              (|Finite|))))
                                                    '((|Boolean|) (|Set| |t#1|)
                                                      (|List| (|List| |t#1|))
                                                      (|List| |t#1|))
                                                    NIL))
                                           . #2=(|PermutationCategory|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|PermutationCategory| (|devaluate| |t#1|)))))) 
