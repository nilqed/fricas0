
(DECLAIM (NOTINLINE |ModularAlgebraicGcdOperations;|)) 

(DEFPARAMETER |ModularAlgebraicGcdOperations;AL| 'NIL) 

(DEFUN |ModularAlgebraicGcdOperations| (&REST #1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluateList| #1#)
                       |ModularAlgebraicGcdOperations;AL|))
      (CDR #2#))
     (T
      (SETQ |ModularAlgebraicGcdOperations;AL|
              (|cons5|
               (CONS #3#
                     (SETQ #2# (APPLY #'|ModularAlgebraicGcdOperations;| #1#)))
               |ModularAlgebraicGcdOperations;AL|))
      #2#)))) 

(DEFUN |ModularAlgebraicGcdOperations;| (|t#1| |t#2| |t#3|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2| |t#3|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)
                                (|devaluate| |t#3|)))
                    (|Join|
                     (|mkCategory|
                      '(((|pseudoRem| (|t#2| |t#2| |t#2| |t#3|)) T)
                        ((|canonicalIfCan|
                          ((|Union| |t#2| "failed") |t#2| |t#3|))
                         T)
                        ((|pack_modulus|
                          ((|Union| |t#3| "failed") (|List| |t#1|)
                           (|List| (|Symbol|)) (|Integer|)))
                         T)
                        ((|MPtoMPT|
                          ((|Union| |t#2| "failed") |t#1| (|Symbol|)
                           (|List| (|Symbol|)) |t#3|))
                         T)
                        ((|zero?| ((|Boolean|) |t#2|)) T)
                        ((|degree| ((|Integer|) |t#2|)) T)
                        ((|pack_exps|
                          ((|SortedExponentVector|) (|Integer|) (|Integer|)
                           |t#3|))
                         T)
                        ((|repack1|
                          ((|Void|) |t#2| (|U32Vector|) (|Integer|) |t#3|))
                         T))
                      NIL
                      '((|Void|) (|U32Vector|) (|Integer|)
                        (|SortedExponentVector|) (|Boolean|) (|Symbol|)
                        (|List| (|Symbol|)) (|List| |t#1|))
                      NIL)))
                   |ModularAlgebraicGcdOperations|)
           (SETELT #1# 0
                   (LIST '|ModularAlgebraicGcdOperations| (|devaluate| |t#1|)
                         (|devaluate| |t#2|) (|devaluate| |t#3|)))))) 
