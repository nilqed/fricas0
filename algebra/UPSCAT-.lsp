
(SDEFUN |UPSCAT-;degree;SExpon;1| ((|f| S) ($ |Expon|))
        (SPADCALL |f| (QREFELT $ 9))) 

(SDEFUN |UPSCAT-;leadingCoefficient;SCoef;2| ((|f| S) ($ |Coef|))
        (SPADCALL |f| (SPADCALL |f| (QREFELT $ 9)) (QREFELT $ 11))) 

(SDEFUN |UPSCAT-;leadingMonomial;2S;3| ((|f| S) ($ S))
        (SPROG ((|ord| (|Expon|)))
               (SEQ
                (LETT |ord| (SPADCALL |f| (QREFELT $ 9))
                      |UPSCAT-;leadingMonomial;2S;3|)
                (EXIT
                 (SPADCALL (SPADCALL |f| |ord| (QREFELT $ 11)) |ord|
                           (QREFELT $ 13)))))) 

(SDEFUN |UPSCAT-;monomial;SLLS;4|
        ((|f| S) (|listVar| |List| (|SingletonAsOrderedSet|))
         (|listExpon| |List| |Expon|) ($ S))
        (COND
         ((OR (NULL |listVar|) (NULL (NULL (CDR |listVar|))))
          (|error| "monomial: variable list must have exactly one entry"))
         ((OR (NULL |listExpon|) (NULL (NULL (CDR |listExpon|))))
          (|error| "monomial: exponent list must have exactly one entry"))
         ('T
          (SPADCALL |f|
                    (SPADCALL (|spadConstant| $ 16) (|SPADfirst| |listExpon|)
                              (QREFELT $ 13))
                    (QREFELT $ 17))))) 

(SDEFUN |UPSCAT-;monomial;SSaosExponS;5|
        ((|f| S) (|v| |SingletonAsOrderedSet|) (|n| |Expon|) ($ S))
        (SPADCALL |f| (SPADCALL (|spadConstant| $ 16) |n| (QREFELT $ 13))
                  (QREFELT $ 17))) 

(SDEFUN |UPSCAT-;reductum;2S;6| ((|f| S) ($ S))
        (SPADCALL |f| (SPADCALL |f| (QREFELT $ 23)) (QREFELT $ 24))) 

(SDEFUN |UPSCAT-;variables;SL;7| ((|f| S) ($ |List| (|SingletonAsOrderedSet|)))
        (SPADCALL (SPADCALL (QREFELT $ 26)) (QREFELT $ 27))) 

(DECLAIM (NOTINLINE |UnivariatePowerSeriesCategory&;|)) 

(DEFUN |UnivariatePowerSeriesCategory&| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|UnivariatePowerSeriesCategory&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|UnivariatePowerSeriesCategory&| DV$1 DV$2 DV$3)
                . #1#)
          (LETT $ (GETREFV 29) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (|HasSignature| |#2|
                                                              (LIST '*
                                                                    (LIST
                                                                     (|devaluate|
                                                                      |#2|)
                                                                     (|devaluate|
                                                                      |#3|)
                                                                     (|devaluate|
                                                                      |#2|))))
                                              (|HasCategory| |#3|
                                                             '(|SemiGroup|))
                                              (|HasSignature| |#2|
                                                              (LIST '^
                                                                    (LIST
                                                                     (|devaluate|
                                                                      |#2|)
                                                                     (|devaluate|
                                                                      |#2|)
                                                                     (|devaluate|
                                                                      |#3|))))
                                              (|HasSignature| |#2|
                                                              (LIST '|coerce|
                                                                    (LIST
                                                                     (|devaluate|
                                                                      |#2|)
                                                                     '(|Symbol|))))))
                          . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|UnivariatePowerSeriesCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (0 . |order|) |UPSCAT-;degree;SExpon;1|
              (5 . |coefficient|) |UPSCAT-;leadingCoefficient;SCoef;2|
              (11 . |monomial|) |UPSCAT-;leadingMonomial;2S;3| (17 . |One|)
              (21 . |One|) (25 . *) (|List| 21) (|List| 8)
              |UPSCAT-;monomial;SLLS;4| (|SingletonAsOrderedSet|)
              |UPSCAT-;monomial;SSaosExponS;5| (31 . |leadingMonomial|)
              (36 . -) |UPSCAT-;reductum;2S;6| (42 . |create|) (46 . |list|)
              |UPSCAT-;variables;SL;7|)
           '#(|variables| 51 |reductum| 56 |monomial| 61 |leadingMonomial| 75
              |leadingCoefficient| 80 |degree| 85)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 28
                                                 '(1 6 8 0 9 2 6 7 0 8 11 2 6 0
                                                   7 8 13 0 6 0 15 0 7 0 16 2 6
                                                   0 0 0 17 1 6 0 0 23 2 6 0 0
                                                   0 24 0 21 0 26 1 18 0 21 27
                                                   1 0 18 0 28 1 0 0 0 25 3 0 0
                                                   0 18 19 20 3 0 0 0 21 8 22 1
                                                   0 0 0 14 1 0 7 0 12 1 0 8 0
                                                   10)))))
           '|lookupComplete|)) 
