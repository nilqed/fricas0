
(DEFPARAMETER |IndexedDirectProductCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |IndexedDirectProductCategory;|)) 

(DEFPARAMETER |IndexedDirectProductCategory;AL| 'NIL) 

(DEFUN |IndexedDirectProductCategory| (|t#1| |t#2|)
  (LET (#1=#:G379 (#2=#:G380 (LIST (|devaluate| |t#1|) (|devaluate| |t#2|))))
    (COND
     ((SETQ #1# (|assoc| #2# |IndexedDirectProductCategory;AL|)) (CDR #1#))
     (T
      (SETQ |IndexedDirectProductCategory;AL|
              (|cons5|
               (CONS #2#
                     (SETQ #1# (APPLY #'|IndexedDirectProductCategory;| #2#)))
               |IndexedDirectProductCategory;AL|))
      #1#)))) 

(DEFUN |IndexedDirectProductCategory;| (|t#1| |t#2|)
  (SPROG ((#1=#:G378 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1| |t#2|) (LIST |t#1| |t#2|))
                              (COND (|IndexedDirectProductCategory;CAT|)
                                    ('T
                                     (LETT |IndexedDirectProductCategory;CAT|
                                           (|Join|
                                            (|AbelianProductCategory| '|t#1|)
                                            (|mkCategory|
                                             '(((|map|
                                                 ($ (|Mapping| |t#1| |t#1|) $))
                                                T)
                                               ((|monomial| ($ |t#1| |t#2|)) T)
                                               ((|monomial?| ((|Boolean|) $))
                                                T)
                                               ((|construct|
                                                 ($
                                                  (|List|
                                                   (|Record| (|:| |k| |t#2|)
                                                             (|:| |c|
                                                                  |t#1|)))))
                                                T)
                                               ((|listOfTerms|
                                                 ((|List|
                                                   (|Record| (|:| |k| |t#2|)
                                                             (|:| |c| |t#1|)))
                                                  $))
                                                T)
                                               ((|numberOfMonomials|
                                                 ((|NonNegativeInteger|) $))
                                                T)
                                               ((|leadingMonomial| ($ $))
                                                (|has| |t#2| (|Comparable|)))
                                               ((|leadingCoefficient|
                                                 (|t#1| $))
                                                (|has| |t#2| (|Comparable|)))
                                               ((|leadingSupport| (|t#2| $))
                                                (|has| |t#2| (|Comparable|)))
                                               ((|reductum| ($ $))
                                                (|has| |t#2| (|Comparable|)))
                                               ((|constructOrdered|
                                                 ($
                                                  (|List|
                                                   (|Record| (|:| |k| |t#2|)
                                                             (|:| |c|
                                                                  |t#1|)))))
                                                (|has| |t#2| (|Comparable|)))
                                               ((|leadingTerm|
                                                 ((|Record| (|:| |k| |t#2|)
                                                            (|:| |c| |t#1|))
                                                  $))
                                                (|has| |t#2| (|Comparable|))))
                                             '(((|Comparable|)
                                                (AND
                                                 (|has| |t#2| (|Comparable|))
                                                 (|has| |t#1| (|Comparable|))))
                                               ((|OrderedAbelianMonoid|)
                                                (AND
                                                 (|has| |t#1|
                                                        (|OrderedAbelianMonoid|))
                                                 (|has| |t#2| (|OrderedSet|))))
                                               ((|OrderedAbelianMonoidSup|)
                                                (AND
                                                 (|has| |t#1|
                                                        (|OrderedAbelianMonoidSup|))
                                                 (|has| |t#2|
                                                        (|OrderedSet|)))))
                                             NIL NIL)))))))
           (SETELT #1# 0 (LIST '|IndexedDirectProductCategory| |t#1| |t#2|))))) 
