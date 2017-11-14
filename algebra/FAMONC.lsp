
(DEFPARAMETER |FreeAbelianMonoidCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |FreeAbelianMonoidCategory;|)) 

(DEFPARAMETER |FreeAbelianMonoidCategory;AL| 'NIL) 

(DEFUN |FreeAbelianMonoidCategory| (&REST #1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluateList| #1#)
                       |FreeAbelianMonoidCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |FreeAbelianMonoidCategory;AL|
              (|cons5|
               (CONS #3# (SETQ #2# (APPLY #'|FreeAbelianMonoidCategory;| #1#)))
               |FreeAbelianMonoidCategory;AL|))
      #2#)))) 

(DEFUN |FreeAbelianMonoidCategory;| (|t#1| |t#2|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                    (COND (|FreeAbelianMonoidCategory;CAT|)
                          ('T
                           (LETT |FreeAbelianMonoidCategory;CAT|
                                 (|Join| (|CancellationAbelianMonoid|)
                                         (|RetractableTo| '|t#1|)
                                         (|mkCategory|
                                          '(((+ ($ |t#1| $)) T)
                                            ((* ($ |t#2| |t#1|)) T)
                                            ((|size|
                                              ((|NonNegativeInteger|) $))
                                             T)
                                            ((|terms|
                                              ((|List|
                                                (|Record| (|:| |gen| |t#1|)
                                                          (|:| |exp| |t#2|)))
                                               $))
                                             T)
                                            ((|nthCoef| (|t#2| $ (|Integer|)))
                                             T)
                                            ((|nthFactor|
                                              (|t#1| $ (|Integer|)))
                                             T)
                                            ((|coefficient| (|t#2| |t#1| $)) T)
                                            ((|mapCoef|
                                              ($ (|Mapping| |t#2| |t#2|) $))
                                             T)
                                            ((|mapGen|
                                              ($ (|Mapping| |t#1| |t#1|) $))
                                             T)
                                            ((|highCommonTerms| ($ $ $))
                                             (|has| |t#2|
                                                    (|OrderedAbelianMonoid|))))
                                          NIL
                                          '((|Integer|)
                                            (|List|
                                             (|Record| (|:| |gen| |t#1|)
                                                       (|:| |exp| |t#2|)))
                                            (|NonNegativeInteger|))
                                          NIL))
                                 . #2=(|FreeAbelianMonoidCategory|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|FreeAbelianMonoidCategory| (|devaluate| |t#1|)
                         (|devaluate| |t#2|)))))) 
