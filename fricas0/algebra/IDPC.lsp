
(DEFPARAMETER |IndexedDirectProductCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |IndexedDirectProductCategory;|)) 

(DEFPARAMETER |IndexedDirectProductCategory;AL| 'NIL) 

(DEFUN |IndexedDirectProductCategory| (&REST #1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluateList| #1#)
                       |IndexedDirectProductCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |IndexedDirectProductCategory;AL|
              (|cons5|
               (CONS #3#
                     (SETQ #2# (APPLY #'|IndexedDirectProductCategory;| #1#)))
               |IndexedDirectProductCategory;AL|))
      #2#)))) 

(DEFUN |IndexedDirectProductCategory;| (|t#1| |t#2|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                    (COND (|IndexedDirectProductCategory;CAT|)
                          ('T
                           (LETT |IndexedDirectProductCategory;CAT|
                                 (|Join| (|AbelianProductCategory| '|t#1|)
                                         (|mkCategory|
                                          '(((|map|
                                              ($ (|Mapping| |t#1| |t#1|) $))
                                             T)
                                            ((|monomial| ($ |t#1| |t#2|)) T)
                                            ((|monomial?| ((|Boolean|) $)) T)
                                            ((|leadingMonomial| ($ $)) T)
                                            ((|leadingCoefficient| (|t#1| $))
                                             T)
                                            ((|leadingSupport| (|t#2| $)) T)
                                            ((|reductum| ($ $)) T)
                                            ((|construct|
                                              ($
                                               (|List|
                                                (|Record| (|:| |k| |t#2|)
                                                          (|:| |c| |t#1|)))))
                                             T)
                                            ((|constructOrdered|
                                              ($
                                               (|List|
                                                (|Record| (|:| |k| |t#2|)
                                                          (|:| |c| |t#1|)))))
                                             T)
                                            ((|leadingTerm|
                                              ((|Record| (|:| |k| |t#2|)
                                                         (|:| |c| |t#1|))
                                               $))
                                             T)
                                            ((|listOfTerms|
                                              ((|List|
                                                (|Record| (|:| |k| |t#2|)
                                                          (|:| |c| |t#1|)))
                                               $))
                                             T)
                                            ((|numberOfMonomials|
                                              ((|NonNegativeInteger|) $))
                                             T))
                                          '(((|Comparable|)
                                             (|has| |t#1| (|Comparable|)))
                                            ((|OrderedAbelianMonoid|)
                                             (AND
                                              (|has| |t#1|
                                                     (|OrderedAbelianMonoid|))
                                              (|has| |t#2| (|OrderedSet|))))
                                            ((|OrderedAbelianMonoidSup|)
                                             (AND
                                              (|has| |t#1|
                                                     (|OrderedAbelianMonoidSup|))
                                              (|has| |t#2| (|OrderedSet|)))))
                                          '((|NonNegativeInteger|)
                                            (|List|
                                             (|Record| (|:| |k| |t#2|)
                                                       (|:| |c| |t#1|)))
                                            (|Boolean|))
                                          NIL))
                                 . #2=(|IndexedDirectProductCategory|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|IndexedDirectProductCategory| (|devaluate| |t#1|)
                         (|devaluate| |t#2|)))))) 
