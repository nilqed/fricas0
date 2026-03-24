
(SDEFUN |CHARPOL0;characteristicPolynomial;MSup;1|
        ((|m| (|Matrix| R)) (% (|SparseUnivariatePolynomial| R)))
        (SPADCALL |m| (QREFELT % 10))) 

(SDEFUN |CHARPOL0;characteristicPolynomial;MSup;2|
        ((|m| (|Matrix| R)) (% (|SparseUnivariatePolynomial| R)))
        (SPADCALL |m| (QREFELT % 13))) 

(SDEFUN |CHARPOL0;characteristicPolynomial;M2R;3|
        ((|m| (|Matrix| R)) (|x| (R)) (% (R)))
        (SPADCALL (SPADCALL |m| (QREFELT % 11)) |x| (QREFELT % 14))) 

(DECLAIM (NOTINLINE |CharacteristicPolynomial;|)) 

(DEFUN |CharacteristicPolynomial;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|CharacteristicPolynomial| DV$1))
          (LETT % (GETREFV 16))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|CharacteristicPolynomial|
                      (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (COND
           ((|HasCategory| |#1| '(|FiniteFieldCategory|))
            (QSETREFV % 11
                      (CONS
                       (|dispatchFunction|
                        |CHARPOL0;characteristicPolynomial;MSup;1|)
                       %)))
           ('T
            (QSETREFV % 11
                      (CONS
                       (|dispatchFunction|
                        |CHARPOL0;characteristicPolynomial;MSup;2|)
                       %))))
          %))) 

(DEFUN |CharacteristicPolynomial| (#1=#:G3)
  (SPROG NIL
         (PROG (#2=#:G4)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|CharacteristicPolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|CharacteristicPolynomial;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|CharacteristicPolynomial|)))))))))) 

(MAKEPROP '|CharacteristicPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|)
              (|SparseUnivariatePolynomial| 6) (|Matrix| 6)
              (|CharacteristicPolynomial2| 6) (0 . |char_pol|)
              (5 . |characteristicPolynomial|) (|CharacteristicPolynomial4| 6)
              (10 . |char_pol_via_berkovitz|) (15 . |elt|)
              |CHARPOL0;characteristicPolynomial;M2R;3|)
           '#(|characteristicPolynomial| 21) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|characteristicPolynomial|
                                 ((|SparseUnivariatePolynomial| |#1|)
                                  (|Matrix| |#1|)))
                                T)
                              '((|characteristicPolynomial|
                                 (|#1| (|Matrix| |#1|) |#1|))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 15
                                            '(1 9 7 8 10 1 0 7 8 11 1 12 7 8 13
                                              2 7 6 0 6 14 1 0 7 8 11 2 0 6 8 6
                                              15)))))
           '|lookupComplete|)) 
