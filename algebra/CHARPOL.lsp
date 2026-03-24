
(SDEFUN |CHARPOL;characteristicPolynomial;M2R;1|
        ((A (|Matrix| R)) (|v| (R)) (% (R)))
        (SPROG ((|up| (|SparseUnivariatePolynomial| R)))
               (SEQ (LETT |up| (SPADCALL A (QREFELT % 10)))
                    (EXIT (SPADCALL |up| |v| (QREFELT % 11)))))) 

(DECLAIM (NOTINLINE |CharacteristicPolynomialPackage;|)) 

(DEFUN |CharacteristicPolynomialPackage;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|CharacteristicPolynomialPackage| DV$1))
          (LETT % (GETREFV 13))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|CharacteristicPolynomialPackage|
                      (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |CharacteristicPolynomialPackage| (#1=#:G2)
  (SPROG NIL
         (PROG (#2=#:G3)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|CharacteristicPolynomialPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|CharacteristicPolynomialPackage;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|CharacteristicPolynomialPackage|)))))))))) 

(MAKEPROP '|CharacteristicPolynomialPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|)
              (|SparseUnivariatePolynomial| 6) (|Matrix| 6)
              (|CharacteristicPolynomial4| 6) (0 . |char_pol_via_berkovitz|)
              (5 . |elt|) |CHARPOL;characteristicPolynomial;M2R;1|)
           '#(|characteristicPolynomial| 11) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|characteristicPolynomial|
                                 (|#1| (|Matrix| |#1|) |#1|))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 12
                                            '(1 9 7 8 10 2 7 6 0 6 11 2 0 6 8 6
                                              12)))))
           '|lookupComplete|)) 
