
(DEFPARAMETER |DirectProductCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |DirectProductCategory;|)) 

(DEFPARAMETER |DirectProductCategory;AL| 'NIL) 

(DEFUN |DirectProductCategory| (&REST #1=#:G697)
  (LET (#2=#:G698)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |DirectProductCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |DirectProductCategory;AL|
              (|cons5|
               (CONS #3# (SETQ #2# (APPLY #'|DirectProductCategory;| #1#)))
               |DirectProductCategory;AL|))
      #2#)))) 

(DEFUN |DirectProductCategory;| (|t#1| |t#2|)
  (SPROG ((#1=#:G696 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                    (|sublisV|
                     (PAIR '(#2=#:G694 #3=#:G695)
                           (LIST '(|Integer|) '(|Vector| |t#2|)))
                     (COND (|DirectProductCategory;CAT|)
                           ('T
                            (LETT |DirectProductCategory;CAT|
                                  (|Join| (|IndexedAggregate| '#2# '|t#2|)
                                          (|CoercibleTo| '#3#)
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
                                               (|has| |t#2| (|AbelianMonoid|))
                                               (|has| |t#2| (|SemiRng|))))
                                             ((* ($ |t#2| $))
                                              (|has| |t#2| (|SemiGroup|)))
                                             ((* ($ $ |t#2|))
                                              (|has| |t#2| (|SemiGroup|))))
                                           '(((|FullyRetractableTo| |t#2|)
                                              (|has| |t#2| (|SetCategory|)))
                                             ((|DifferentialExtension| |t#2|)
                                              (|has| |t#2| (|Ring|)))
                                             ((|FullyLinearlyExplicitOver|
                                               |t#2|)
                                              (|has| |t#2| (|Ring|)))
                                             ((|SemiRng|)
                                              (|has| |t#2| (|SemiRng|)))
                                             ((|BiModule| |t#2| |t#2|)
                                              (|has| |t#2| (|SemiRng|)))
                                             ((|AbelianMonoid|)
                                              (|has| |t#2| (|AbelianMonoid|)))
                                             ((|CancellationAbelianMonoid|)
                                              (|has| |t#2|
                                                     (|CancellationAbelianMonoid|)))
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
                                             ((|OrderedRing|)
                                              (|has| |t#2| (|OrderedRing|)))
                                             ((|OrderedAbelianMonoidSup|)
                                              (|has| |t#2|
                                                     (|OrderedAbelianMonoidSup|)))
                                             ((|VectorSpace| |t#2|)
                                              (|has| |t#2| (|Field|))))
                                           '((|PositiveInteger|)
                                             (|Vector| |t#2|))
                                           NIL))
                                  . #4=(|DirectProductCategory|))))))
                   . #4#)
           (SETELT #1# 0
                   (LIST '|DirectProductCategory| (|devaluate| |t#1|)
                         (|devaluate| |t#2|)))))) 
