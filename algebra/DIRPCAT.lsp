
(DEFPARAMETER |DirectProductCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |DirectProductCategory;|)) 

(DEFPARAMETER |DirectProductCategory;AL| 'NIL) 

(DEFUN |DirectProductCategory| (|t#1| |t#2|)
  (LET (#1=#:G383 (#2=#:G384 (LIST (|devaluate| |t#1|) (|devaluate| |t#2|))))
    (COND ((SETQ #1# (|assoc| #2# |DirectProductCategory;AL|)) (CDR #1#))
          (T
           (SETQ |DirectProductCategory;AL|
                   (|cons5|
                    (CONS #2#
                          (SETQ #1# (APPLY #'|DirectProductCategory;| #2#)))
                    |DirectProductCategory;AL|))
           #1#)))) 

(DEFUN |DirectProductCategory;| (|t#1| |t#2|)
  (SPROG ((#1=#:G382 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1| |t#2|) (LIST |t#1| |t#2|))
                              (|sublisV|
                               (MAKE_PAIRS '(#2=#:G380 #3=#:G381)
                                           (LIST '(|Integer|)
                                                 '(|Vector| |t#2|)))
                               (COND (|DirectProductCategory;CAT|)
                                     ('T
                                      (LETT |DirectProductCategory;CAT|
                                            (|Join|
                                             (|IndexedAggregate| '#2# '|t#2|)
                                             (|CoercibleTo| '#3#)
                                             (|AbelianProductCategory| '|t#2|)
                                             (|finiteAggregate|)
                                             (|mkCategory|
                                              '(((|directProduct|
                                                  ($ (|Vector| |t#2|)))
                                                 T)
                                                ((|unitVector|
                                                  ($ (|PositiveInteger|)))
                                                 (AND (|has| |t#2| (|Monoid|))
                                                      (|has| |t#2|
                                                             (|AbelianMonoid|))))
                                                ((|dot| (|t#2| $ $))
                                                 (AND
                                                  (|has| |t#2|
                                                         (|AbelianMonoid|))
                                                  (|has| |t#2| (|SemiRng|))))
                                                ((* ($ |t#2| $))
                                                 (|has| |t#2| (|SemiGroup|)))
                                                ((* ($ $ |t#2|))
                                                 (|has| |t#2| (|SemiGroup|))))
                                              '(((|FullyRetractableTo| |t#2|)
                                                 (|has| |t#2| (|SetCategory|)))
                                                ((|DifferentialExtension|
                                                  |t#2|)
                                                 (|has| |t#2| (|Ring|)))
                                                ((|FullyLinearlyExplicitOver|
                                                  |t#2|)
                                                 (|has| |t#2| (|Ring|)))
                                                ((|SemiRng|)
                                                 (|has| |t#2| (|SemiRng|)))
                                                ((|BiModule| |t#2| |t#2|)
                                                 (|has| |t#2| (|SemiRng|)))
                                                ((|Monoid|)
                                                 (|has| |t#2| (|Monoid|)))
                                                ((|SemiGroup|)
                                                 (|has| |t#2| (|SemiGroup|)))
                                                ((|Finite|)
                                                 (|has| |t#2| (|Finite|)))
                                                ((|Algebra| |t#2|)
                                                 (|has| |t#2|
                                                        (|CommutativeRing|)))
                                                ((|CommutativeRing|)
                                                 (|has| |t#2|
                                                        (|CommutativeRing|)))
                                                ((|unitsKnown|)
                                                 (|has| |t#2| (|unitsKnown|)))
                                                ((|OrderedSet|)
                                                 (|has| |t#2| (|OrderedSet|)))
                                                ((|OrderedAbelianMonoid|)
                                                 (|has| |t#2|
                                                        (|OrderedAbelianMonoid|)))
                                                ((|OrderedAbelianMonoidSup|)
                                                 (|has| |t#2|
                                                        (|OrderedAbelianMonoidSup|)))
                                                ((|VectorSpace| |t#2|)
                                                 (|has| |t#2| (|Field|))))
                                              NIL NIL))))))))
           (SETELT #1# 0 (LIST '|DirectProductCategory| |t#1| |t#2|))))) 
