
(DECLAIM (NOTINLINE |PrincipalIdealDomain;|)) 

(DEFPARAMETER |PrincipalIdealDomain;AL| 'NIL) 

(DEFUN |PrincipalIdealDomain| ()
  (LET (#:G692)
    (COND (|PrincipalIdealDomain;AL|)
          (T (SETQ |PrincipalIdealDomain;AL| (|PrincipalIdealDomain;|)))))) 

(DEFUN |PrincipalIdealDomain;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|GcdDomain|)
                           (|mkCategory|
                            '(((|principalIdeal|
                                ((|Record| (|:| |coef| (|List| $))
                                           (|:| |generator| $))
                                 (|List| $)))
                               T)
                              ((|expressIdealMember|
                                ((|Union| (|List| $) "failed") (|List| $) $))
                               T))
                            NIL '((|List| $)) NIL))
                   |PrincipalIdealDomain|)
           (SETELT #1# 0 '(|PrincipalIdealDomain|))))) 

(MAKEPROP '|PrincipalIdealDomain| 'NILADIC T) 
