
(DEFPARAMETER |VectorCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |VectorCategory;|)) 

(DEFPARAMETER |VectorCategory;AL| 'NIL) 

(DEFUN |VectorCategory| (#1=#:G696)
  (LET (#2=#:G697)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |VectorCategory;AL|)) (CDR #2#))
     (T
      (SETQ |VectorCategory;AL|
              (|cons5| (CONS #3# (SETQ #2# (|VectorCategory;| #1#)))
                       |VectorCategory;AL|))
      #2#)))) 

(DEFUN |VectorCategory;| (|t#1|)
  (SPROG ((#1=#:G695 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|VectorCategory;CAT|)
                                    ('T
                                     (LETT |VectorCategory;CAT|
                                           (|Join|
                                            (|OneDimensionalArrayAggregate|
                                             '|t#1|)
                                            (|mkCategory|
                                             '(((+ ($ $ $))
                                                (|has| |t#1|
                                                       (|AbelianSemiGroup|)))
                                               ((|zero|
                                                 ($ (|NonNegativeInteger|)))
                                                (|has| |t#1|
                                                       (|AbelianMonoid|)))
                                               ((|zero?| ((|Boolean|) $))
                                                (|has| |t#1|
                                                       (|AbelianMonoid|)))
                                               ((- ($ $))
                                                (|has| |t#1| (|AbelianGroup|)))
                                               ((- ($ $ $))
                                                (|has| |t#1| (|AbelianGroup|)))
                                               ((* ($ (|Integer|) $))
                                                (|has| |t#1| (|AbelianGroup|)))
                                               ((* ($ |t#1| $))
                                                (|has| |t#1| (|SemiGroup|)))
                                               ((* ($ $ |t#1|))
                                                (|has| |t#1| (|SemiGroup|)))
                                               ((|dot| (|t#1| $ $))
                                                (AND (|has| |t#1| (|SemiRng|))
                                                     (|has| |t#1|
                                                            (|AbelianMonoid|))))
                                               ((|outerProduct|
                                                 ((|Matrix| |t#1|) $ $))
                                                (|has| |t#1| (|Ring|)))
                                               ((|cross| ($ $ $))
                                                (|has| |t#1| (|Ring|)))
                                               ((|length| (|t#1| $))
                                                (AND (|has| |t#1| (|Ring|))
                                                     (|has| |t#1|
                                                            (|RadicalCategory|)))))
                                             NIL
                                             '((|Matrix| |t#1|) (|Integer|)
                                               (|Boolean|)
                                               (|NonNegativeInteger|))
                                             NIL))
                                           . #2=(|VectorCategory|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|VectorCategory| (|devaluate| |t#1|)))))) 
