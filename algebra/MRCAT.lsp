
(DEFPARAMETER |MonoidRingCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |MonoidRingCategory;|)) 

(DEFPARAMETER |MonoidRingCategory;AL| 'NIL) 

(DEFUN |MonoidRingCategory| (&REST #1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |MonoidRingCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |MonoidRingCategory;AL|
              (|cons5|
               (CONS #3# (SETQ #2# (APPLY #'|MonoidRingCategory;| #1#)))
               |MonoidRingCategory;AL|))
      #2#)))) 

(DEFUN |MonoidRingCategory;| (|t#1| |t#2|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                    (COND (|MonoidRingCategory;CAT|)
                          ('T
                           (LETT |MonoidRingCategory;CAT|
                                 (|Join| (|Ring|) (|RetractableTo| '|t#2|)
                                         (|RetractableTo| '|t#1|)
                                         (|mkCategory|
                                          '(((|monomial| ($ |t#1| |t#2|)) T)
                                            ((|coefficient| (|t#1| $ |t#2|)) T)
                                            ((|coerce|
                                              ($
                                               (|List|
                                                (|Record| (|:| |k| |t#2|)
                                                          (|:| |c| |t#1|)))))
                                             T)
                                            ((|terms|
                                              ((|List|
                                                (|Record| (|:| |k| |t#2|)
                                                          (|:| |c| |t#1|)))
                                               $))
                                             T)
                                            ((|map|
                                              ($ (|Mapping| |t#1| |t#1|) $))
                                             T)
                                            ((|monomial?| ((|Boolean|) $)) T)
                                            ((|coefficients|
                                              ((|List| |t#1|) $))
                                             T)
                                            ((|monomials| ((|List| $) $)) T)
                                            ((|numberOfMonomials|
                                              ((|NonNegativeInteger|) $))
                                             T))
                                          '(((|CharacteristicZero|)
                                             (|has| |t#1|
                                                    (|CharacteristicZero|)))
                                            ((|CharacteristicNonZero|)
                                             (|has| |t#1|
                                                    (|CharacteristicNonZero|)))
                                            ((|Algebra| |t#1|)
                                             (|has| |t#1| (|CommutativeRing|)))
                                            ((|CommutativeRing|)
                                             (AND
                                              (|has| |t#2| (|CommutativeStar|))
                                              (|has| |t#1|
                                                     (|CommutativeRing|))))
                                            ((|Finite|)
                                             (AND (|has| |t#2| (|Finite|))
                                                  (|has| |t#1| (|Finite|))))
                                            ((|FreeModuleCategory| |t#1| |t#2|)
                                             (|has| |t#2| (|Comparable|))))
                                          '((|NonNegativeInteger|) (|List| $)
                                            (|List| |t#1|) (|Boolean|)
                                            (|List|
                                             (|Record| (|:| |k| |t#2|)
                                                       (|:| |c| |t#1|))))
                                          NIL))
                                 . #2=(|MonoidRingCategory|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|MonoidRingCategory| (|devaluate| |t#1|)
                         (|devaluate| |t#2|)))))) 
