
(DECLAIM (NOTINLINE |LeftOreRing;|)) 

(DEFPARAMETER |LeftOreRing;AL| 'NIL) 

(DEFUN |LeftOreRing| ()
  (LET (#:G692)
    (COND (|LeftOreRing;AL|) (T (SETQ |LeftOreRing;AL| (|LeftOreRing;|)))))) 

(DEFUN |LeftOreRing;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|EntireRing|)
                           (|mkCategory|
                            '(((|lcmCoef|
                                ((|Record| (|:| |llcm_res| $) (|:| |coeff1| $)
                                           (|:| |coeff2| $))
                                 $ $))
                               T))
                            NIL 'NIL NIL))
                   |LeftOreRing|)
           (SETELT #1# 0 '(|LeftOreRing|))))) 

(MAKEPROP '|LeftOreRing| 'NILADIC T) 
