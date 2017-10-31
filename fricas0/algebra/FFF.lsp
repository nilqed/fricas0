
(SDEFUN |FFF;createLowComplexityNormalBasis;PiU;1|
        ((|n| |PositiveInteger|)
         ($ |Union| (|SparseUnivariatePolynomial| GF)
          (|Vector|
           (|List|
            (|Record| (|:| |value| GF) (|:| |index| (|SingleInteger|)))))))
        (SPROG
         ((|u|
           (|Union|
            (|Vector|
             (|List|
              (|Record| (|:| |value| GF) (|:| |index| (|SingleInteger|)))))
            "failed")))
         (SEQ
          (LETT |u| (SPADCALL |n| (QREFELT $ 10))
                |FFF;createLowComplexityNormalBasis;PiU;1|)
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 0 (SPADCALL |n| (QREFELT $ 13))))
                 ('T (CONS 1 (QCDR |u|)))))))) 

(SDEFUN |FFF;createLowComplexityTable;PiU;2|
        ((|n| |PositiveInteger|)
         ($ |Union|
          (|Vector|
           (|List|
            #1=(|Record| (|:| |value| GF) (|:| |index| (|SingleInteger|)))))
          "failed"))
        (SPROG
         ((|l|
           (|List|
            (|Record| (|:| |value| GF) (|:| |index| (|SingleInteger|)))))
          (|term| #1#) (#2=#:G780 NIL) (|j| NIL)
          (|v| (|Vector| (|PrimeField| |p|))) (#3=#:G779 NIL) (|i| NIL)
          (|multtable|
           (|Vector|
            (|List|
             (|Record| (|:| |value| GF) (|:| |index| (|SingleInteger|))))))
          (|m| (|NonNegativeInteger|)) (|lvjh| (|Integer|)) (#4=#:G778 NIL)
          (#5=#:G777 NIL) (#6=#:G776 NIL) (#7=#:G775 NIL)
          (|help| (|PrimeField| |p1|)) (#8=#:G774 NIL) (#9=#:G773 NIL)
          (|lvj| (|Matrix| (|Integer|))) (#10=#:G772 NIL) (#11=#:G771 NIL)
          (|x| NIL) (|vec| (|Vector| (|Integer|))) (|vt| (|Integer|))
          (|jt| (|Integer|)) (|t| (|PrimeField| |p1|))
          (|pkn| (|PrimeField| |p1|)) (|p1| (|NonNegativeInteger|))
          (|multmat| (|Matrix| (|PrimeField| |p|))) (#12=#:G769 NIL)
          (|t1| (|PrimeField| (+ (* |k| |n|) (|One|))))
          (|k| (|NonNegativeInteger|)) (|a| (|Integer|)) (#13=#:G770 NIL)
          (|p| (|NonNegativeInteger|)) (|q| (|NonNegativeInteger|)))
         (SEQ
          (LETT |q| (SPADCALL (QREFELT $ 17))
                . #14=(|FFF;createLowComplexityTable;PiU;2|))
          (LETT |p| (SPADCALL (QREFELT $ 18)) . #14#) (LETT |k| 0 . #14#)
          (SEQ (LETT |i| 1 . #14#) (LETT #13# (- |n| 1) . #14#) G190
               (COND
                ((OR (|greater_SI| |i| #13#) (NULL (EQL |k| 0))) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (+ (* |i| |n|) 1) (QREFELT $ 23))
                   (COND
                    ((NULL (EQL |p| (+ (* |i| |n|) 1)))
                     (COND
                      ((SPADCALL
                        (SPADCALL |q|
                                  (|compiledLookupCheck| '|coerce|
                                                         (LIST '$
                                                               (LIST
                                                                '|Integer|))
                                                         (|PrimeField|
                                                          (+ (* |i| |n|)
                                                             (|One|)))))
                        (|compiledLookupCheck| '|primitive?|
                                               (LIST (LIST '|Boolean|) '$)
                                               (|PrimeField|
                                                (+ (* |i| |n|) (|One|)))))
                       (SEQ (LETT |a| 1 . #14#) (LETT |k| |i| . #14#)
                            (EXIT
                             (LETT |t1|
                                   (SPADCALL
                                    (SPADCALL |q|
                                              (|compiledLookupCheck| '|coerce|
                                                                     (LIST '$
                                                                           (LIST
                                                                            '|Integer|))
                                                                     (|PrimeField|
                                                                      (+
                                                                       (* |k|
                                                                          |n|)
                                                                       (|One|)))))
                                    |n|
                                    (|compiledLookupCheck| '^
                                                           (LIST '$ '$
                                                                 (LIST
                                                                  '|Integer|))
                                                           (|PrimeField|
                                                            (+ (* |k| |n|)
                                                               (|One|)))))
                                   . #14#))))
                      ('T
                       (SEQ
                        (EXIT
                         (COND
                          ((EQL
                            (GCD |n|
                                 (LETT |a|
                                       (SPADCALL
                                        (SPADCALL |q|
                                                  (|compiledLookupCheck|
                                                   '|coerce|
                                                   (LIST '$ (LIST '|Integer|))
                                                   (|PrimeField|
                                                    (+ (* |n| |i|) (|One|)))))
                                        (|compiledLookupCheck| '|discreteLog|
                                                               (LIST
                                                                (LIST
                                                                 '|NonNegativeInteger|)
                                                                '$)
                                                               (|PrimeField|
                                                                (+ (* |n| |i|)
                                                                   (|One|)))))
                                       . #14#))
                            1)
                           (PROGN
                            (LETT #12#
                                  (SEQ (LETT |k| |i| . #14#)
                                       (EXIT
                                        (LETT |t1|
                                              (SPADCALL
                                               (SPADCALL
                                                (|compiledLookupCheck|
                                                 '|primitiveElement| (LIST '$)
                                                 (|PrimeField|
                                                  (+ (* |k| |n|) (|One|)))))
                                               |n|
                                               (|compiledLookupCheck| '^
                                                                      (LIST '$
                                                                            '$
                                                                            (LIST
                                                                             '|Integer|))
                                                                      (|PrimeField|
                                                                       (+
                                                                        (* |k|
                                                                           |n|)
                                                                        (|One|)))))
                                              . #14#)))
                                  . #14#)
                            (GO #15=#:G730)))))
                        #15# (EXIT #12#))))))))))
               (LETT |i| (|inc_SI| |i|) . #14#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND ((EQL |k| 0) (CONS 1 "failed"))
                 (#16='T
                  (SEQ
                   (LETT |multmat|
                         (SPADCALL |n| |n|
                                   (|compiledLookupCheck| '|zero|
                                                          (LIST '$
                                                                (LIST
                                                                 '|NonNegativeInteger|)
                                                                (LIST
                                                                 '|NonNegativeInteger|))
                                                          (|Matrix|
                                                           (|PrimeField|
                                                            |p|))))
                         . #14#)
                   (LETT |p1| (+ (* |k| |n|) 1) . #14#)
                   (LETT |pkn|
                         (SPADCALL |q|
                                   (|compiledLookupCheck| '|coerce|
                                                          (LIST '$
                                                                (LIST
                                                                 '|Integer|))
                                                          (|PrimeField| |p1|)))
                         . #14#)
                   (LETT |t| |t1| . #14#)
                   (COND
                    ((ODDP |k|)
                     (SEQ (LETT |jt| (+ (QUOTIENT2 |n| 2) 1) . #14#)
                          (EXIT
                           (LETT |vt|
                                 (+
                                  (SPADCALL (QUOTIENT2 (- |k| |a|) 2) |k|
                                            (QREFELT $ 24))
                                  1)
                                 . #14#))))
                    (#16#
                     (SEQ (LETT |jt| 1 . #14#)
                          (EXIT (LETT |vt| (+ (QUOTIENT2 |k| 2) 1) . #14#)))))
                   (LETT |vec| (SPADCALL |p1| (QREFELT $ 26)) . #14#)
                   (SEQ (LETT |x| 1 . #14#) (LETT #11# |k| . #14#) G190
                        (COND ((|greater_SI| |x| #11#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |l| 1 . #14#) (LETT #10# |n| . #14#) G190
                               (COND ((|greater_SI| |l| #10#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SPADCALL |vec|
                                           (+
                                            (SPADCALL
                                             (SPADCALL |t| (- |x| 1)
                                                       (|compiledLookupCheck|
                                                        '^
                                                        (LIST '$ '$
                                                              (LIST
                                                               '|Integer|))
                                                        (|PrimeField| |p1|)))
                                             (SPADCALL |pkn| (- |l| 1)
                                                       (|compiledLookupCheck|
                                                        '^
                                                        (LIST '$ '$
                                                              (LIST
                                                               '|Integer|))
                                                        (|PrimeField| |p1|)))
                                             (|compiledLookupCheck| '*
                                                                    (LIST '$ '$
                                                                          '$)
                                                                    (|PrimeField|
                                                                     (+
                                                                      (* |k|
                                                                         |n|)
                                                                      (|One|)))))
                                            1)
                                           (SPADCALL |l| |p1| (QREFELT $ 24))
                                           (QREFELT $ 27))))
                               (LETT |l| (|inc_SI| |l|) . #14#) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |x| (|inc_SI| |x|) . #14#) (GO G190) G191
                        (EXIT NIL))
                   (LETT |lvj| (SPADCALL |k| |n| (QREFELT $ 29)) . #14#)
                   (SEQ (LETT |v| 1 . #14#) (LETT #9# |k| . #14#) G190
                        (COND ((|greater_SI| |v| #9#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |j| 1 . #14#) (LETT #8# |n| . #14#) G190
                               (COND ((|greater_SI| |j| #8#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((OR (SPADCALL |j| |jt| (QREFELT $ 30))
                                       (SPADCALL |v| |vt| (QREFELT $ 30)))
                                   (SEQ
                                    (LETT |help|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |t| (- |v| 1)
                                                      (|compiledLookupCheck| '^
                                                                             (LIST
                                                                              '$
                                                                              '$
                                                                              (LIST
                                                                               '|Integer|))
                                                                             (|PrimeField|
                                                                              |p1|)))
                                            (SPADCALL |pkn| (- |j| 1)
                                                      (|compiledLookupCheck| '^
                                                                             (LIST
                                                                              '$
                                                                              '$
                                                                              (LIST
                                                                               '|Integer|))
                                                                             (|PrimeField|
                                                                              |p1|)))
                                            (|compiledLookupCheck| '*
                                                                   (LIST '$ '$
                                                                         '$)
                                                                   (|PrimeField|
                                                                    (+
                                                                     (* |k|
                                                                        |n|)
                                                                     (|One|)))))
                                           (SPADCALL
                                            (|compiledLookupCheck| '|One|
                                                                   (LIST '$)
                                                                   (|PrimeField|
                                                                    (+
                                                                     (* |k|
                                                                        |n|)
                                                                     (|One|)))))
                                           (|compiledLookupCheck| '+
                                                                  (LIST '$ '$
                                                                        '$)
                                                                  (|PrimeField|
                                                                   (+
                                                                    (* |k| |n|)
                                                                    (|One|)))))
                                          . #14#)
                                    (EXIT
                                     (SPADCALL |lvj| |v| |j|
                                               (SPADCALL |vec| (+ |help| 1)
                                                         (QREFELT $ 31))
                                               (QREFELT $ 32))))))))
                               (LETT |j| (|inc_SI| |j|) . #14#) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |v| (|inc_SI| |v|) . #14#) (GO G190) G191
                        (EXIT NIL))
                   (SEQ (LETT |j| 1 . #14#) (LETT #7# |n| . #14#) G190
                        (COND ((|greater_SI| |j| #7#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL |j| |jt| (QREFELT $ 30))
                            (SEQ (LETT |v| 1 . #14#) (LETT #6# |k| . #14#) G190
                                 (COND ((|greater_SI| |v| #6#) (GO G191)))
                                 (SEQ
                                  (LETT |lvjh|
                                        (SPADCALL |lvj| |v| |j| (QREFELT $ 33))
                                        . #14#)
                                  (EXIT
                                   (SPADCALL |multmat| |j| |lvjh|
                                             (SPADCALL
                                              (SPADCALL |multmat| |j| |lvjh|
                                                        (|compiledLookupCheck|
                                                         '|elt|
                                                         (LIST
                                                          (LIST '|PrimeField|
                                                                |p|)
                                                          '$ (LIST '|Integer|)
                                                          (LIST '|Integer|))
                                                         (|Matrix|
                                                          (|PrimeField| |p|))))
                                              (SPADCALL
                                               (|compiledLookupCheck| '|One|
                                                                      (LIST '$)
                                                                      (|PrimeField|
                                                                       |p|)))
                                              (|compiledLookupCheck| '+
                                                                     (LIST '$
                                                                           '$
                                                                           '$)
                                                                     (|PrimeField|
                                                                      |p|)))
                                             (|compiledLookupCheck| '|setelt!|
                                                                    (LIST
                                                                     (LIST
                                                                      '|PrimeField|
                                                                      |p|)
                                                                     '$
                                                                     (LIST
                                                                      '|Integer|)
                                                                     (LIST
                                                                      '|Integer|)
                                                                     (LIST
                                                                      '|PrimeField|
                                                                      |p|))
                                                                    (|Matrix|
                                                                     (|PrimeField|
                                                                      |p|))))))
                                 (LETT |v| (|inc_SI| |v|) . #14#) (GO G190)
                                 G191 (EXIT NIL))))))
                        (LETT |j| (|inc_SI| |j|) . #14#) (GO G190) G191
                        (EXIT NIL))
                   (SEQ (LETT |i| 1 . #14#) (LETT #5# |n| . #14#) G190
                        (COND ((|greater_SI| |i| #5#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL |multmat| |jt| |i|
                                    (SPADCALL
                                     (SPADCALL (- |k|) |p| (QREFELT $ 24))
                                     (|compiledLookupCheck| '|coerce|
                                                            (LIST '$
                                                                  (LIST
                                                                   '|Integer|))
                                                            (|PrimeField|
                                                             |p|)))
                                    (|compiledLookupCheck| '|setelt!|
                                                           (LIST
                                                            (LIST '|PrimeField|
                                                                  |p|)
                                                            '$
                                                            (LIST '|Integer|)
                                                            (LIST '|Integer|)
                                                            (LIST '|PrimeField|
                                                                  |p|))
                                                           (|Matrix|
                                                            (|PrimeField|
                                                             |p|))))))
                        (LETT |i| (|inc_SI| |i|) . #14#) (GO G190) G191
                        (EXIT NIL))
                   (SEQ (LETT |v| 1 . #14#) (LETT #4# |k| . #14#) G190
                        (COND ((|greater_SI| |v| #4#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL |v| |vt| (QREFELT $ 30))
                            (SEQ
                             (LETT |lvjh|
                                   (SPADCALL |lvj| |v| |jt| (QREFELT $ 33))
                                   . #14#)
                             (EXIT
                              (SPADCALL |multmat| |jt| |lvjh|
                                        (SPADCALL
                                         (SPADCALL |multmat| |jt| |lvjh|
                                                   (|compiledLookupCheck|
                                                    '|elt|
                                                    (LIST
                                                     (LIST '|PrimeField| |p|)
                                                     '$ (LIST '|Integer|)
                                                     (LIST '|Integer|))
                                                    (|Matrix|
                                                     (|PrimeField| |p|))))
                                         (SPADCALL
                                          (|compiledLookupCheck| '|One|
                                                                 (LIST '$)
                                                                 (|PrimeField|
                                                                  |p|)))
                                         (|compiledLookupCheck| '+
                                                                (LIST '$ '$ '$)
                                                                (|PrimeField|
                                                                 |p|)))
                                        (|compiledLookupCheck| '|setelt!|
                                                               (LIST
                                                                (LIST
                                                                 '|PrimeField|
                                                                 |p|)
                                                                '$
                                                                (LIST
                                                                 '|Integer|)
                                                                (LIST
                                                                 '|Integer|)
                                                                (LIST
                                                                 '|PrimeField|
                                                                 |p|))
                                                               (|Matrix|
                                                                (|PrimeField|
                                                                 |p|))))))))))
                        (LETT |v| (|inc_SI| |v|) . #14#) (GO G190) G191
                        (EXIT NIL))
                   (LETT |m| (ANROWS |multmat|) . #14#)
                   (LETT |multtable| (MAKEARR1 |m| NIL) . #14#)
                   (SEQ (LETT |i| 1 . #14#) (LETT #3# |m| . #14#) G190
                        (COND ((|greater_SI| |i| #3#) (GO G191)))
                        (SEQ (LETT |l| NIL . #14#)
                             (LETT |v|
                                   (SPADCALL |multmat| |i|
                                             (|compiledLookupCheck| '|row|
                                                                    (LIST
                                                                     (LIST
                                                                      '|Vector|
                                                                      (LIST
                                                                       '|PrimeField|
                                                                       |p|))
                                                                     '$
                                                                     (LIST
                                                                      '|Integer|))
                                                                    (|Matrix|
                                                                     (|PrimeField|
                                                                      |p|))))
                                   . #14#)
                             (SEQ (LETT |j| 1 . #14#) (LETT #2# |m| . #14#)
                                  G190
                                  (COND ((|greater_SI| |j| #2#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL
                                       (SPADCALL |v| |j|
                                                 (|compiledLookupCheck| '|elt|
                                                                        (LIST
                                                                         (LIST
                                                                          '|PrimeField|
                                                                          |p|)
                                                                         '$
                                                                         (LIST
                                                                          '|Integer|))
                                                                        (|Vector|
                                                                         (|PrimeField|
                                                                          |p|))))
                                       (SPADCALL
                                        (|compiledLookupCheck| '|Zero|
                                                               (LIST '$)
                                                               (|PrimeField|
                                                                |p|)))
                                       (|compiledLookupCheck| '~=
                                                              (LIST
                                                               (LIST
                                                                '|Boolean|)
                                                               '$ '$)
                                                              (|PrimeField|
                                                               |p|)))
                                      (SEQ
                                       (LETT |term|
                                             (CONS
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |v| |j|
                                                           (|compiledLookupCheck|
                                                            '|elt|
                                                            (LIST
                                                             (LIST
                                                              '|PrimeField|
                                                              |p|)
                                                             '$
                                                             (LIST '|Integer|))
                                                            (|Vector|
                                                             (|PrimeField|
                                                              |p|))))
                                                 (|compiledLookupCheck| '-
                                                                        (LIST
                                                                         '$ '$)
                                                                        (|PrimeField|
                                                                         |p|)))
                                                (|compiledLookupCheck|
                                                 '|convert|
                                                 (LIST (LIST '|Integer|) '$)
                                                 (|PrimeField| |p|)))
                                               (QREFELT $ 34))
                                              (- |j| 2))
                                             . #14#)
                                       (EXIT
                                        (LETT |l| (CONS |term| |l|)
                                              . #14#)))))))
                                  (LETT |j| (|inc_SI| |j|) . #14#) (GO G190)
                                  G191 (EXIT NIL))
                             (EXIT
                              (QSETAREF1O |multtable| |i|
                                          (SPADCALL |l| (QREFELT $ 36)) 1)))
                        (LETT |i| (|inc_SI| |i|) . #14#) (GO G190) G191
                        (EXIT NIL))
                   (EXIT (CONS 0 |multtable|))))))))) 

(SDEFUN |FFF;sizeMultiplication;VNni;3|
        ((|m| |Vector|
          (|List| (|Record| (|:| |value| GF) (|:| |index| (|SingleInteger|)))))
         ($ |NonNegativeInteger|))
        (SPROG ((|s| (|NonNegativeInteger|)) (#1=#:G788 NIL) (|i| NIL))
               (SEQ (LETT |s| 0 . #2=(|FFF;sizeMultiplication;VNni;3|))
                    (SEQ (LETT |i| 1 . #2#) (LETT #1# (QVSIZE |m|) . #2#) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |s|
                                 (+ |s|
                                    (LENGTH (SPADCALL |m| |i| (QREFELT $ 38))))
                                 . #2#)))
                         (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT |s|)))) 

(SDEFUN |FFF;createMultiplicationTable;SupV;4|
        ((|f| |SparseUnivariatePolynomial| GF)
         ($ |Vector|
          (|List|
           #1=(|Record| (|:| |value| GF) (|:| |index| (|SingleInteger|))))))
        (SPROG
         ((|l|
           (|List|
            (|Record| (|:| |value| GF) (|:| |index| (|SingleInteger|)))))
          (|term| #1#) (#2=#:G815 NIL) (|j| NIL) (|v| (|Vector| GF))
          (#3=#:G814 NIL) (|i| NIL)
          (|multtable|
           (|Vector|
            (|List|
             (|Record| (|:| |value| GF) (|:| |index| (|SingleInteger|))))))
          (|mat| (|Matrix| GF)) (#4=#:G797 NIL)
          (|mat1| (|Union| (|Matrix| GF) #5="failed"))
          (|h| (|ModMonic| GF (|SparseUnivariatePolynomial| GF)))
          (|g| (|ModMonic| GF (|SparseUnivariatePolynomial| GF)))
          (#6=#:G813 NIL)
          (|qexp|
           #7=(|PrimitiveArray|
               (|ModMonic| GF (|SparseUnivariatePolynomial| GF))))
          (|w| (|ModMonic| GF (|SparseUnivariatePolynomial| GF)))
          (#8=#:G812 NIL) (|qpow| #7#)
          (|e| (|ModMonic| GF (|SparseUnivariatePolynomial| GF)))
          (|m1| (|Integer|)) (|m| (|PositiveInteger|))
          (|sizeGF| (|NonNegativeInteger|)))
         (SEQ
          (LETT |sizeGF| (SPADCALL (QREFELT $ 17))
                . #9=(|FFF;createMultiplicationTable;SupV;4|))
          (LETT |m| (SPADCALL |f| (QREFELT $ 40)) . #9#)
          (EXIT
           (COND
            ((EQL |m| 1)
             (VECTOR
              (LIST
               (CONS (SPADCALL (SPADCALL |f| 0 (QREFELT $ 43)) (QREFELT $ 44))
                     -1))))
            (#10='T
             (SEQ (LETT |m1| (- |m| 1) . #9#) (SPADCALL |f| (QREFELT $ 46))
                  (LETT |e|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 19) 1 (QREFELT $ 47))
                          (QREFELT $ 48))
                         |sizeGF| (QREFELT $ 49))
                        . #9#)
                  (LETT |w| (|spadConstant| $ 50) . #9#)
                  (LETT |qpow| (MAKEARR1 |m| (|spadConstant| $ 51)) . #9#)
                  (QSETAREF1 |qpow| 0 (|spadConstant| $ 50))
                  (SEQ (LETT |i| 1 . #9#) (LETT #8# |m1| . #9#) G190
                       (COND ((|greater_SI| |i| #8#) (GO G191)))
                       (SEQ
                        (EXIT
                         (QSETAREF1 |qpow| |i|
                                    (LETT |w| (SPADCALL |w| |e| (QREFELT $ 52))
                                          . #9#))))
                       (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191
                       (EXIT NIL))
                  (LETT |qexp| (MAKEARR1 |m| (|spadConstant| $ 51)) . #9#)
                  (QSETAREF1 |qexp| 0
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 19) 1 (QREFELT $ 47))
                              (QREFELT $ 48)))
                  (LETT |mat| (SPADCALL |m| |m| (QREFELT $ 54)) . #9#)
                  (QSETAREF2O |mat| 2 1 (|spadConstant| $ 19) 1 1)
                  (LETT |h| (QAREF1 |qpow| 1) . #9#) (QSETAREF1 |qexp| 1 |h|)
                  (SPADCALL |mat| 2 (SPADCALL |h| (QREFELT $ 56))
                            (QREFELT $ 57))
                  (SEQ (LETT |i| 2 . #9#) (LETT #6# |m1| . #9#) G190
                       (COND ((|greater_SI| |i| #6#) (GO G191)))
                       (SEQ (LETT |g| (|spadConstant| $ 51) . #9#)
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (SPADCALL |h| (|spadConstant| $ 51)
                                              (QREFELT $ 58)))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |g|
                                        (SPADCALL |g|
                                                  (SPADCALL
                                                   (SPADCALL |h|
                                                             (QREFELT $ 59))
                                                   (QAREF1 |qpow|
                                                           (SPADCALL |h|
                                                                     (QREFELT $
                                                                              60)))
                                                   (QREFELT $ 61))
                                                  (QREFELT $ 62))
                                        . #9#)
                                  (EXIT
                                   (LETT |h| (SPADCALL |h| (QREFELT $ 63))
                                         . #9#)))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (QSETAREF1 |qexp| |i| |g|)
                            (EXIT
                             (SPADCALL |mat| (+ |i| 1)
                                       (SPADCALL (LETT |h| |g| . #9#)
                                                 (QREFELT $ 56))
                                       (QREFELT $ 57))))
                       (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191
                       (EXIT NIL))
                  (LETT |mat1| (SPADCALL |mat| (QREFELT $ 65)) . #9#)
                  (EXIT
                   (COND
                    ((SPADCALL |mat1| (CONS 1 "failed") (QREFELT $ 67))
                     (|error|
                      "createMultiplicationTable: polynomial must be normal"))
                    (#10#
                     (SEQ
                      (LETT |mat|
                            (PROG2 (LETT #4# |mat1| . #9#)
                                (QCDR #4#)
                              (|check_union2| (QEQCAR #4# 0)
                                              (|Matrix| (QREFELT $ 6))
                                              (|Union| (|Matrix| (QREFELT $ 6))
                                                       #5#)
                                              #4#))
                            . #9#)
                      (LETT |multtable| (MAKEARR1 |m| NIL) . #9#)
                      (SEQ (LETT |i| 1 . #9#) (LETT #3# |m| . #9#) G190
                           (COND ((|greater_SI| |i| #3#) (GO G191)))
                           (SEQ (LETT |l| NIL . #9#)
                                (LETT |v|
                                      (SPADCALL |mat|
                                                (SPADCALL
                                                 (SPADCALL
                                                  (QAREF1 |qexp| (- |i| 1))
                                                  (QAREF1 |qexp| 0)
                                                  (QREFELT $ 52))
                                                 (QREFELT $ 56))
                                                (QREFELT $ 68))
                                      . #9#)
                                (SEQ (LETT |j| 1 . #9#)
                                     (LETT #2# (SPADCALL |m| (QREFELT $ 70))
                                           . #9#)
                                     G190
                                     (COND ((|greater_SI| |j| #2#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (COND
                                        ((SPADCALL
                                          (SPADCALL |v| |j| (QREFELT $ 71))
                                          (|spadConstant| $ 20) (QREFELT $ 72))
                                         (SEQ
                                          (LETT |term|
                                                (CONS
                                                 (SPADCALL |v| |j|
                                                           (QREFELT $ 71))
                                                 (|sub_SI| |j| 2))
                                                . #9#)
                                          (EXIT
                                           (LETT |l| (CONS |term| |l|)
                                                 . #9#)))))))
                                     (LETT |j| (|inc_SI| |j|) . #9#) (GO G190)
                                     G191 (EXIT NIL))
                                (EXIT
                                 (QSETAREF1O |multtable| |i|
                                             (SPADCALL |l| (QREFELT $ 36)) 1)))
                           (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT |multtable|)))))))))))) 

(SDEFUN |FFF;createZechTable;SupPa;5|
        ((|f| |SparseUnivariatePolynomial| GF)
         ($ |PrimitiveArray| (|SingleInteger|)))
        (SPROG
         ((|a|
           #1=(|SimpleAlgebraicExtension| GF (|SparseUnivariatePolynomial| GF)
                                          |f|))
          (#2=#:G832 NIL) (|i| NIL) (#3=#:G831 NIL) (#4=#:G830 NIL)
          (|primElement| #1#)
          (|helparr| #5=(|PrimitiveArray| (|SingleInteger|))) (|zechlog| #5#)
          (|qm1| (|SingleInteger|)) (|m| (|PositiveInteger|)) (#6=#:G816 NIL)
          (|sizeGF| (|NonNegativeInteger|)))
         (SEQ
          (LETT |sizeGF| (SPADCALL (QREFELT $ 17))
                . #7=(|FFF;createZechTable;SupPa;5|))
          (LETT |m|
                (PROG1 (LETT #6# (SPADCALL |f| (QREFELT $ 40)) . #7#)
                  (|check_subtype2| (> #6# 0) '(|PositiveInteger|)
                                    '(|NonNegativeInteger|) #6#))
                . #7#)
          (LETT |qm1| (- (SPADCALL |sizeGF| |m| (QREFELT $ 74)) 1) . #7#)
          (LETT |zechlog|
                (MAKEARR1
                 (QUOTIENT2 (+ (SPADCALL |sizeGF| |m| (QREFELT $ 74)) 1) 2) -1)
                . #7#)
          (LETT |helparr| (MAKEARR1 (EXPT |sizeGF| |m|) 0) . #7#)
          (LETT |primElement|
                (SPADCALL (SPADCALL (|spadConstant| $ 19) 1 (QREFELT $ 47))
                          (|compiledLookupCheck| '|reduce|
                                                 (LIST '$
                                                       (LIST
                                                        '|SparseUnivariatePolynomial|
                                                        (|devaluate|
                                                         (ELT $ 6))))
                                                 (|SimpleAlgebraicExtension|
                                                  (ELT $ 6)
                                                  (|SparseUnivariatePolynomial|
                                                   (ELT $ 6))
                                                  |f|)))
                . #7#)
          (LETT |a| |primElement| . #7#)
          (SEQ (LETT |i| 1 . #7#) (LETT #4# (|sub_SI| |qm1| 1) . #7#) G190
               (COND ((|greater_SI| |i| #4#) (GO G191)))
               (SEQ
                (QSETAREF1 |helparr|
                           (SPADCALL
                            (SPADCALL |a|
                                      (SPADCALL
                                       (|compiledLookupCheck| '|One| (LIST '$)
                                                              (|SimpleAlgebraicExtension|
                                                               (ELT $ 6)
                                                               (|SparseUnivariatePolynomial|
                                                                (ELT $ 6))
                                                               |f|)))
                                      (|compiledLookupCheck| '- (LIST '$ '$ '$)
                                                             (|SimpleAlgebraicExtension|
                                                              (ELT $ 6)
                                                              (|SparseUnivariatePolynomial|
                                                               (ELT $ 6))
                                                              |f|)))
                            (|compiledLookupCheck| '|lookup|
                                                   (LIST
                                                    (LIST '|PositiveInteger|)
                                                    '$)
                                                   (|SimpleAlgebraicExtension|
                                                    (ELT $ 6)
                                                    (|SparseUnivariatePolynomial|
                                                     (ELT $ 6))
                                                    |f|)))
                           (SPADCALL |i| (QREFELT $ 70)))
                (EXIT
                 (LETT |a|
                       (SPADCALL |a| |primElement|
                                 (|compiledLookupCheck| '* (LIST '$ '$ '$)
                                                        (|SimpleAlgebraicExtension|
                                                         (ELT $ 6)
                                                         (|SparseUnivariatePolynomial|
                                                          (ELT $ 6))
                                                         |f|)))
                       . #7#)))
               (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND
            ((EQL (SPADCALL (QREFELT $ 18)) 2)
             (SEQ (LETT |a| |primElement| . #7#)
                  (SEQ (LETT |i| 1 . #7#) (LETT #3# (|quo_SI| |qm1| 2) . #7#)
                       G190 (COND ((|greater_SI| |i| #3#) (GO G191)))
                       (SEQ
                        (QSETAREF1 |zechlog| |i|
                                   (QAREF1 |helparr|
                                           (SPADCALL |a|
                                                     (|compiledLookupCheck|
                                                      '|lookup|
                                                      (LIST
                                                       (LIST
                                                        '|PositiveInteger|)
                                                       '$)
                                                      (|SimpleAlgebraicExtension|
                                                       (ELT $ 6)
                                                       (|SparseUnivariatePolynomial|
                                                        (ELT $ 6))
                                                       |f|)))))
                        (EXIT
                         (LETT |a|
                               (SPADCALL |a| |primElement|
                                         (|compiledLookupCheck| '*
                                                                (LIST '$ '$ '$)
                                                                (|SimpleAlgebraicExtension|
                                                                 (ELT $ 6)
                                                                 (|SparseUnivariatePolynomial|
                                                                  (ELT $ 6))
                                                                 |f|)))
                               . #7#)))
                       (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT |zechlog|)))
            ('T
             (SEQ
              (LETT |a|
                    (SPADCALL
                     (|compiledLookupCheck| '|One| (LIST '$)
                                            (|SimpleAlgebraicExtension|
                                             (ELT $ 6)
                                             (|SparseUnivariatePolynomial|
                                              (ELT $ 6))
                                             |f|)))
                    . #7#)
              (SEQ (LETT |i| 0 . #7#)
                   (LETT #2# (|quo_SI| (|sub_SI| |qm1| 2) 2) . #7#) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (QSETAREF1 |zechlog| |i|
                               (QAREF1 |helparr|
                                       (SPADCALL |a|
                                                 (|compiledLookupCheck|
                                                  '|lookup|
                                                  (LIST
                                                   (LIST '|PositiveInteger|)
                                                   '$)
                                                  (|SimpleAlgebraicExtension|
                                                   (ELT $ 6)
                                                   (|SparseUnivariatePolynomial|
                                                    (ELT $ 6))
                                                   |f|)))))
                    (EXIT
                     (LETT |a|
                           (SPADCALL |a| |primElement|
                                     (|compiledLookupCheck| '* (LIST '$ '$ '$)
                                                            (|SimpleAlgebraicExtension|
                                                             (ELT $ 6)
                                                             (|SparseUnivariatePolynomial|
                                                              (ELT $ 6))
                                                             |f|)))
                           . #7#)))
                   (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
              (EXIT |zechlog|)))))))) 

(SDEFUN |FFF;createMultiplicationMatrix;VM;6|
        ((|m| |Vector|
          (|List| (|Record| (|:| |value| GF) (|:| |index| (|SingleInteger|)))))
         ($ |Matrix| GF))
        (SPROG
         ((#1=#:G840 NIL) (|t| NIL) (#2=#:G839 NIL) (|i| NIL)
          (|mat| (|Matrix| GF)) (|n| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n| (QVSIZE |m|) . #3=(|FFF;createMultiplicationMatrix;VM;6|))
          (LETT |mat| (SPADCALL |n| |n| (QREFELT $ 54)) . #3#)
          (SEQ (LETT |i| 1 . #3#) (LETT #2# |n| . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |t| NIL . #3#)
                      (LETT #1# (SPADCALL |m| |i| (QREFELT $ 38)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (QSETAREF2O |mat| |i| (|add_SI| (QCDR |t|) 2)
                                    (QCAR |t|) 1 1)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |mat|)))) 

(DECLAIM (NOTINLINE |FiniteFieldFunctions;|)) 

(DEFUN |FiniteFieldFunctions| (#1=#:G841)
  (SPROG NIL
         (PROG (#2=#:G842)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FiniteFieldFunctions|)
                                               '|domainEqualList|)
                    . #3=(|FiniteFieldFunctions|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|FiniteFieldFunctions;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FiniteFieldFunctions|)))))))))) 

(DEFUN |FiniteFieldFunctions;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteFieldFunctions|))
          (LETT |dv$| (LIST '|FiniteFieldFunctions| DV$1) . #1#)
          (LETT $ (GETREFV 78) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FiniteFieldFunctions| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|FiniteFieldFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|)
              (|Record| (|:| |value| 6) (|:| |index| 69))
              (|Union| 37 '"failed") (|PositiveInteger|)
              |FFF;createLowComplexityTable;PiU;2|
              (|SparseUnivariatePolynomial| 6)
              (|FiniteFieldPolynomialPackage| 6) (0 . |createNormalPoly|)
              (|Union| 11 37) |FFF;createLowComplexityNormalBasis;PiU;1|
              (|NonNegativeInteger|) (5 . |size|) (9 . |characteristic|)
              (13 . |One|) (17 . |Zero|) (|Boolean|) (|Integer|)
              (21 . |prime?|) (26 . |positiveRemainder|) (|Vector| 22)
              (32 . |zero|) (37 . |setelt!|) (|Matrix| 22) (44 . |zero|)
              (50 . ~=) (56 . |elt|) (62 . |setelt!|) (70 . |elt|)
              (77 . |coerce|) (|List| 7) (82 . |copy|) (|Vector| 35)
              (87 . |elt|) |FFF;sizeMultiplication;VNni;3| (93 . |degree|)
              (98 . |One|) (102 . |Zero|) (106 . |coefficient|) (112 . -)
              (|ModMonic| 6 11) (117 . |setPoly|) (122 . |monomial|)
              (128 . |reduce|) (133 . ^) (139 . |One|) (143 . |Zero|) (147 . *)
              (|Matrix| 6) (153 . |zero|) (|Vector| 6) (159 . |Vectorise|)
              (164 . |setColumn!|) (171 . ~=) (177 . |leadingCoefficient|)
              (182 . |degree|) (187 . *) (193 . +) (199 . |reductum|)
              (|Union| $ '#1="failed") (204 . |inverse|) (|Union| 53 '#1#)
              (209 . =) (215 . *) (|SingleInteger|) (221 . |coerce|)
              (226 . |elt|) (232 . ~=) |FFF;createMultiplicationTable;SupV;4|
              (238 . ^) (|PrimitiveArray| 69) |FFF;createZechTable;SupPa;5|
              |FFF;createMultiplicationMatrix;VM;6|)
           '#(|sizeMultiplication| 244 |createZechTable| 249
              |createMultiplicationTable| 254 |createMultiplicationMatrix| 259
              |createLowComplexityTable| 264 |createLowComplexityNormalBasis|
              269)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 77
                                                 '(1 12 11 9 13 0 6 16 17 0 6
                                                   16 18 0 6 0 19 0 6 0 20 1 22
                                                   21 0 23 2 22 0 0 0 24 1 25 0
                                                   16 26 3 25 22 0 22 22 27 2
                                                   28 0 16 16 29 2 22 21 0 0 30
                                                   2 25 22 0 22 31 4 28 22 0 22
                                                   22 22 32 3 28 22 0 22 22 33
                                                   1 6 0 22 34 1 35 0 0 36 2 37
                                                   35 0 22 38 1 11 16 0 40 0 11
                                                   0 41 0 11 0 42 2 11 6 0 16
                                                   43 1 6 0 0 44 1 45 11 11 46
                                                   2 11 0 6 16 47 1 45 0 11 48
                                                   2 45 0 0 16 49 0 45 0 50 0
                                                   45 0 51 2 45 0 0 0 52 2 53 0
                                                   16 16 54 1 45 55 0 56 3 53 0
                                                   0 22 55 57 2 45 21 0 0 58 1
                                                   45 6 0 59 1 45 16 0 60 2 45
                                                   0 6 0 61 2 45 0 0 0 62 1 45
                                                   0 0 63 1 53 64 0 65 2 66 21
                                                   0 0 67 2 53 55 0 55 68 1 69
                                                   0 22 70 2 55 6 0 22 71 2 6
                                                   21 0 0 72 2 16 0 0 9 74 1 0
                                                   16 37 39 1 0 75 11 76 1 0 37
                                                   11 73 1 0 53 37 77 1 0 8 9
                                                   10 1 0 14 9 15)))))
           '|lookupComplete|)) 
