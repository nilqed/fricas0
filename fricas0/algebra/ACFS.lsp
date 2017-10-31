
(DEFPARAMETER |AlgebraicallyClosedFunctionSpace;CAT| 'NIL) 

(DECLAIM (NOTINLINE |AlgebraicallyClosedFunctionSpace;|)) 

(DEFPARAMETER |AlgebraicallyClosedFunctionSpace;AL| 'NIL) 

(DEFUN |AlgebraicallyClosedFunctionSpace| (#1=#:G703)
  (LET (#2=#:G704)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluate| #1#)
                       |AlgebraicallyClosedFunctionSpace;AL|))
      (CDR #2#))
     (T
      (SETQ |AlgebraicallyClosedFunctionSpace;AL|
              (|cons5|
               (CONS #3# (SETQ #2# (|AlgebraicallyClosedFunctionSpace;| #1#)))
               |AlgebraicallyClosedFunctionSpace;AL|))
      #2#)))) 

(DEFUN |AlgebraicallyClosedFunctionSpace;| (|t#1|)
  (SPROG ((#1=#:G702 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|AlgebraicallyClosedFunctionSpace;CAT|)
                                    ('T
                                     (LETT
                                      |AlgebraicallyClosedFunctionSpace;CAT|
                                      (|Join| (|AlgebraicallyClosedField|)
                                              (|FunctionSpace| '|t#1|)
                                              (|mkCategory|
                                               '(((|rootOf| ($ $)) T)
                                                 ((|rootsOf| ((|List| $) $)) T)
                                                 ((|rootOf| ($ $ (|Symbol|)))
                                                  T)
                                                 ((|rootsOf|
                                                   ((|List| $) $ (|Symbol|)))
                                                  T)
                                                 ((|zeroOf| ($ $)) T)
                                                 ((|zerosOf| ((|List| $) $)) T)
                                                 ((|zeroOf| ($ $ (|Symbol|)))
                                                  T)
                                                 ((|zerosOf|
                                                   ((|List| $) $ (|Symbol|)))
                                                  T)
                                                 ((|rootSum|
                                                   ($ $
                                                    (|SparseUnivariatePolynomial|
                                                     $)
                                                    (|Symbol|)))
                                                  T))
                                               NIL
                                               '((|SparseUnivariatePolynomial|
                                                  $)
                                                 (|Symbol|) (|List| $))
                                               NIL))
                                      . #2=(|AlgebraicallyClosedFunctionSpace|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|AlgebraicallyClosedFunctionSpace|
                         (|devaluate| |t#1|)))))) 
