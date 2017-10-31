
(SDEFUN |SHP;subresultantSequenceBegin|
        ((|p1| . #1=(|UnivariatePolynomial| |x| R)) (|p2| . #1#)
         ($ |List| (|UnivariatePolynomial| |x| R)))
        (SPROG
         ((|LSubr| (|List| (|UnivariatePolynomial| |x| R))) (#2=#:G720 NIL)
          (|lc2| (R)) (|lc1| (R)) (|Pr| (|UnivariatePolynomial| |x| R))
          (|n| (|NonNegativeInteger|)) (#3=#:G716 NIL))
         (SEQ
          (LETT |n|
                (PROG1
                    (LETT #3#
                          (-
                           (- (SPADCALL |p1| (QREFELT $ 10))
                              (SPADCALL |p2| (QREFELT $ 10)))
                           1)
                          . #4=(|SHP;subresultantSequenceBegin|))
                  (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #3#))
                . #4#)
          (LETT |Pr| (SPADCALL |p1| |p2| (QREFELT $ 12)) . #4#)
          (EXIT
           (COND ((EQL |n| 0) (LIST |p1| |p2| |Pr|))
                 (#5='T
                  (SEQ (LETT |lc1| (SPADCALL |p1| (QREFELT $ 15)) . #4#)
                       (LETT |lc2| (SPADCALL |p2| (QREFELT $ 15)) . #4#)
                       (EXIT
                        (COND
                         ((EQL |n| 1)
                          (LIST |p1| |p2|
                                (SPADCALL (SPADCALL |lc1| |lc2| (QREFELT $ 17))
                                          |p2| (QREFELT $ 18))
                                (SPADCALL (SPADCALL |lc1| |Pr| (QREFELT $ 18))
                                          (QREFELT $ 19))))
                         (#5#
                          (SEQ
                           (LETT |LSubr|
                                 (SPADCALL (LIST |p1| |p2|)
                                           (SPADCALL
                                            (PROG1 (LETT #2# (- |n| 1) . #4#)
                                              (|check_subtype2| (>= #2# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #2#))
                                            (|spadConstant| $ 14)
                                            (QREFELT $ 21))
                                           (QREFELT $ 22))
                                 . #4#)
                           (EXIT
                            (SPADCALL |LSubr|
                                      (LIST
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |lc1| |lc2| (QREFELT $ 17))
                                         |n| (QREFELT $ 23))
                                        |p2| (QREFELT $ 18))
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |lc1| (QREFELT $ 24)) |n|
                                         (QREFELT $ 23))
                                        |Pr| (QREFELT $ 18)))
                                      (QREFELT $ 22)))))))))))))) 

(SDEFUN |SHP;subresultantSequenceNext|
        ((|LcsI| |List| (|UnivariatePolynomial| |x| R))
         ($ |List| (|UnivariatePolynomial| |x| R)))
        (SPROG
         ((|LSub| (|List| (|UnivariatePolynomial| |x| R))) (#1=#:G735 NIL)
          (|pr2| (|UnivariatePolynomial| |x| R)) (#2=#:G733 NIL)
          (|pr1| (|UnivariatePolynomial| |x| R))
          (|Pr| (|UnivariatePolynomial| |x| R)) (|c1| (R))
          (|n| (|NonNegativeInteger|)) (#3=#:G731 NIL)
          (|p1| (|UnivariatePolynomial| |x| R))
          (|p2| (|UnivariatePolynomial| |x| R)))
         (SEQ
          (LETT |p2| (SPADCALL |LcsI| (QREFELT $ 25))
                . #4=(|SHP;subresultantSequenceNext|))
          (LETT |p1| (SPADCALL (REVERSE |LcsI|) (QREFELT $ 26)) . #4#)
          (LETT |n|
                (PROG1
                    (LETT #3#
                          (-
                           (- (SPADCALL |p1| (QREFELT $ 10))
                              (SPADCALL |p2| (QREFELT $ 10)))
                           1)
                          . #4#)
                  (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #3#))
                . #4#)
          (LETT |c1| (SPADCALL |p1| (QREFELT $ 15)) . #4#)
          (LETT |Pr| (SPADCALL |p1| |p2| (QREFELT $ 12)) . #4#)
          (EXIT
           (COND
            ((EQL |n| 0)
             (SPADCALL |LcsI|
                       (LIST
                        (PROG2
                            (LETT #2#
                                  (SPADCALL |Pr|
                                            (SPADCALL |c1| 2 (QREFELT $ 28))
                                            (QREFELT $ 30))
                                  . #4#)
                            (QCDR #2#)
                          (|check_union2| (QEQCAR #2# 0)
                                          (|UnivariatePolynomial| (QREFELT $ 7)
                                                                  (QREFELT $
                                                                           6))
                                          (|Union|
                                           (|UnivariatePolynomial|
                                            (QREFELT $ 7) (QREFELT $ 6))
                                           #5="failed")
                                          #2#)))
                       (QREFELT $ 22)))
            ('T
             (SEQ
              (LETT |pr1|
                    (PROG2
                        (LETT #2#
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (SPADCALL |p2| (QREFELT $ 15)) |n|
                                          (QREFELT $ 23))
                                |p2| (QREFELT $ 18))
                               (SPADCALL |c1| |n| (QREFELT $ 23))
                               (QREFELT $ 30))
                              . #4#)
                        (QCDR #2#)
                      (|check_union2| (QEQCAR #2# 0)
                                      (|UnivariatePolynomial| (QREFELT $ 7)
                                                              (QREFELT $ 6))
                                      (|Union|
                                       (|UnivariatePolynomial| (QREFELT $ 7)
                                                               (QREFELT $ 6))
                                       #5#)
                                      #2#))
                    . #4#)
              (LETT |pr2|
                    (PROG2
                        (LETT #2#
                              (SPADCALL |Pr|
                                        (SPADCALL
                                         (SPADCALL |c1| (QREFELT $ 24))
                                         (+ |n| 2) (QREFELT $ 23))
                                        (QREFELT $ 30))
                              . #4#)
                        (QCDR #2#)
                      (|check_union2| (QEQCAR #2# 0)
                                      (|UnivariatePolynomial| (QREFELT $ 7)
                                                              (QREFELT $ 6))
                                      (|Union|
                                       (|UnivariatePolynomial| (QREFELT $ 7)
                                                               (QREFELT $ 6))
                                       #5#)
                                      #2#))
                    . #4#)
              (LETT |LSub|
                    (SPADCALL
                     (SPADCALL
                      (PROG1 (LETT #1# (- |n| 1) . #4#)
                        (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #1#))
                      (|spadConstant| $ 14) (QREFELT $ 21))
                     (LIST |pr1| |pr2|) (QREFELT $ 22))
                    . #4#)
              (EXIT (SPADCALL |LcsI| |LSub| (QREFELT $ 22)))))))))) 

(SDEFUN |SHP;subresultantSequenceInner|
        ((|p1| . #1=(|UnivariatePolynomial| |x| R)) (|p2| . #1#)
         ($ |List| (|UnivariatePolynomial| |x| R)))
        (SPROG
         ((|Lin| (|List| (|UnivariatePolynomial| |x| R))) (#2=#:G755 NIL)
          (|j| NIL) (|indf| (|NonNegativeInteger|)))
         (SEQ
          (LETT |Lin| (|SHP;subresultantSequenceBegin| |p1| |p2| $)
                . #3=(|SHP;subresultantSequenceInner|))
          (LETT |indf|
                (COND
                 ((SPADCALL (SPADCALL |Lin| '|last| (QREFELT $ 32))
                            (|spadConstant| $ 14) (QREFELT $ 34))
                  (SPADCALL (SPADCALL |Lin| '|last| (QREFELT $ 32))
                            (QREFELT $ 10)))
                 ('T 0))
                . #3#)
          (SEQ G190
               (COND ((NULL (SPADCALL |indf| 0 (QREFELT $ 35))) (GO G191)))
               (SEQ (LETT |Lin| (|SHP;subresultantSequenceNext| |Lin| $) . #3#)
                    (EXIT
                     (LETT |indf|
                           (COND
                            ((SPADCALL (SPADCALL |Lin| '|last| (QREFELT $ 32))
                                       (|spadConstant| $ 14) (QREFELT $ 34))
                             (SPADCALL (SPADCALL |Lin| '|last| (QREFELT $ 32))
                                       (QREFELT $ 10)))
                            ('T 0))
                           . #3#)))
               NIL (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |j| (LENGTH |Lin|) . #3#)
               (LETT #2# (SPADCALL |p1| (QREFELT $ 10)) . #3#) G190
               (COND ((> |j| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |Lin|
                       (SPADCALL |Lin| (LIST (|spadConstant| $ 14))
                                 (QREFELT $ 22))
                       . #3#)))
               (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |Lin|)))) 

(SDEFUN |SHP;subresultantSequence;2UpL;4|
        ((|p1| |UnivariatePolynomial| |x| R)
         (|p2| |UnivariatePolynomial| |x| R)
         ($ |List| (|UnivariatePolynomial| |x| R)))
        (SPROG
         ((|List2| (|List| (|UnivariatePolynomial| |x| R)))
          (|Pr1| (|UnivariatePolynomial| |x| R)) (#1=#:G764 NIL)
          (#2=#:G762 NIL) (|Pr0| (|UnivariatePolynomial| |x| R))
          (#3=#:G771 NIL) (|j| NIL) (|c1| (R))
          (|List1| (|List| (|UnivariatePolynomial| |x| R))) (|n| (|Integer|)))
         (SEQ
          (LETT |n|
                (-
                 (- (SPADCALL |p1| (QREFELT $ 10))
                    (SPADCALL |p2| (QREFELT $ 10)))
                 1)
                . #4=(|SHP;subresultantSequence;2UpL;4|))
          (EXIT
           (COND
            ((< |n| 0)
             (|error| "subresultantSequence : degree(p1) <= degree(p2)"))
            ('T
             (SEQ
              (LETT |List1| (|SHP;subresultantSequenceInner| |p1| |p2| $)
                    . #4#)
              (LETT |List2| (LIST |p1| |p2|) . #4#)
              (LETT |c1| (SPADCALL |p1| (QREFELT $ 15)) . #4#)
              (SEQ (LETT |j| 3 . #4#) (LETT #3# (LENGTH |List1|) . #4#) G190
                   (COND ((> |j| #3#) (GO G191)))
                   (SEQ
                    (LETT |Pr0| (SPADCALL |List1| |j| (QREFELT $ 37)) . #4#)
                    (LETT |Pr1|
                          (PROG2
                              (LETT #1#
                                    (SPADCALL |Pr0|
                                              (SPADCALL |c1|
                                                        (PROG1
                                                            (LETT #2# |n|
                                                                  . #4#)
                                                          (|check_subtype2|
                                                           (>= #2# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #2#))
                                                        (QREFELT $ 23))
                                              (QREFELT $ 30))
                                    . #4#)
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0)
                                            (|UnivariatePolynomial|
                                             (QREFELT $ 7) (QREFELT $ 6))
                                            (|Union|
                                             (|UnivariatePolynomial|
                                              (QREFELT $ 7) (QREFELT $ 6))
                                             "failed")
                                            #1#))
                          . #4#)
                    (EXIT
                     (LETT |List2|
                           (SPADCALL |List2| (LIST |Pr1|) (QREFELT $ 22))
                           . #4#)))
                   (LETT |j| (+ |j| 1) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT |List2|)))))))) 

(SDEFUN |SHP;delta| ((|int1| |NonNegativeInteger|) ($ R))
        (SPROG ((#1=#:G773 NIL))
               (SPADCALL (SPADCALL (|spadConstant| $ 11) (QREFELT $ 24))
                         (PROG2
                             (LETT #1#
                                   (SPADCALL (* |int1| (+ |int1| 1)) 2
                                             (QREFELT $ 39))
                                   |SHP;delta|)
                             (QCDR #1#)
                           (|check_union2| (QEQCAR #1# 0)
                                           (|NonNegativeInteger|)
                                           (|Union| (|NonNegativeInteger|)
                                                    "failed")
                                           #1#))
                         (QREFELT $ 23)))) 

(SDEFUN |SHP;polsth1|
        ((|p1| |UnivariatePolynomial| |x| R) (|p| |NonNegativeInteger|)
         (|p2| |UnivariatePolynomial| |x| R) (|q| |NonNegativeInteger|)
         (|c1| R) ($ |List| (|UnivariatePolynomial| |x| R)))
        (SPROG
         ((|List2| (|List| (|UnivariatePolynomial| |x| R)))
          (|Pr6| #1=(|UnivariatePolynomial| |x| R)) (#2=#:G1053 NIL)
          (#3=#:G1052 NIL) (#4=#:G1058 NIL) (|j| NIL)
          (|List1| (|List| (|UnivariatePolynomial| |x| R)))
          (|Listf| (|List| #1#)) (#5=#:G1026 NIL) (|Pr5| #1#) (#6=#:G1025 NIL)
          (#7=#:G1023 NIL) (|Pr4| #1#) (#8=#:G830 NIL) (|Pr3| #1#)
          (#9=#:G804 NIL) (|r| (|NonNegativeInteger|)) (|c2| (R))
          (|Pr2| (|UnivariatePolynomial| |x| R)) (#10=#:G777 NIL)
          (|Pr1| (|UnivariatePolynomial| |x| R)) (|sc1| (R)))
         (SEQ
          (LETT |sc1| (SPADCALL (SPADCALL |c1| (QREFELT $ 40)) (QREFELT $ 41))
                . #11=(|SHP;polsth1|))
          (LETT |Pr1|
                (SPADCALL
                 (SPADCALL (SPADCALL |p1| (QREFELT $ 42)) |p2| (QREFELT $ 43))
                 |p1| (QREFELT $ 12))
                . #11#)
          (LETT |Pr2|
                (PROG2
                    (LETT #10#
                          (SPADCALL |Pr1| (SPADCALL |c1| |q| (QREFELT $ 23))
                                    (QREFELT $ 30))
                          . #11#)
                    (QCDR #10#)
                  (|check_union2| (QEQCAR #10# 0)
                                  (|UnivariatePolynomial| (QREFELT $ 7)
                                                          (QREFELT $ 6))
                                  (|Union|
                                   (|UnivariatePolynomial| (QREFELT $ 7)
                                                           (QREFELT $ 6))
                                   "failed")
                                  #10#))
                . #11#)
          (LETT |c2| (SPADCALL |Pr2| (QREFELT $ 15)) . #11#)
          (LETT |r| (SPADCALL |Pr2| (QREFELT $ 10)) . #11#)
          (LETT |Pr3|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL |sc1|
                            (PROG1 (LETT #9# (- (- |p| |r|) 1) . #11#)
                              (|check_subtype2| (>= #9# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #9#))
                            (QREFELT $ 23))
                  0 (QREFELT $ 44))
                 |p1| (QREFELT $ 43))
                . #11#)
          (LETT |Pr4|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL |sc1|
                            (PROG1 (LETT #8# (- (- |p| |r|) 1) . #11#)
                              (|check_subtype2| (>= #8# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #8#))
                            (QREFELT $ 23))
                  0 (QREFELT $ 44))
                 |Pr2| (QREFELT $ 43))
                . #11#)
          (LETT |Listf| (LIST |Pr3| |Pr4|) . #11#)
          (COND
           ((< |r| (- |p| 1))
            (SEQ
             (LETT |Pr5|
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (|SHP;delta|
                       (PROG1 (LETT #7# (- (- |p| |r|) 1) . #11#)
                         (|check_subtype2| (>= #7# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #7#))
                       $)
                      (SPADCALL |c2|
                                (PROG1 (LETT #6# (- (- |p| |r|) 1) . #11#)
                                  (|check_subtype2| (>= #6# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #6#))
                                (QREFELT $ 23))
                      (QREFELT $ 17))
                     0 (QREFELT $ 44))
                    |Pr2| (QREFELT $ 43))
                   . #11#)
             (LETT |Listf|
                   (SPADCALL |Listf|
                             (SPADCALL
                              (PROG1 (LETT #5# (- (- |p| |r|) 2) . #11#)
                                (|check_subtype2| (>= #5# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #5#))
                              (|spadConstant| $ 14) (QREFELT $ 21))
                             (QREFELT $ 22))
                   . #11#)
             (EXIT
              (LETT |Listf| (SPADCALL |Listf| (LIST |Pr5|) (QREFELT $ 22))
                    . #11#)))))
          (LETT |List1|
                (COND
                 ((SPADCALL |Pr1| (|spadConstant| $ 14) (QREFELT $ 45))
                  |Listf|)
                 ('T (SPADCALL |p1| |Pr2| (QREFELT $ 38))))
                . #11#)
          (LETT |List2| NIL . #11#)
          (SEQ (LETT |j| 0 . #11#) (LETT #4# (- |r| 1) . #11#) G190
               (COND ((|greater_SI| |j| #4#) (GO G191)))
               (SEQ
                (LETT |Pr6|
                      (SPADCALL
                       (SPADCALL
                        (|SHP;delta|
                         (PROG1 (LETT #3# (- (- |p| |j|) 1) . #11#)
                           (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #3#))
                         $)
                        0 (QREFELT $ 44))
                       (SPADCALL |List1|
                                 (PROG1 (LETT #2# (+ (- |p| |j|) 1) . #11#)
                                   (|check_subtype2| (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #2#))
                                 (QREFELT $ 37))
                       (QREFELT $ 43))
                      . #11#)
                (EXIT
                 (LETT |List2| (SPADCALL (LIST |Pr6|) |List2| (QREFELT $ 22))
                       . #11#)))
               (LETT |j| (|inc_SI| |j|) . #11#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |Listf| |List2| (QREFELT $ 22)))))) 

(SDEFUN |SHP;polsth2|
        ((|p1| |UnivariatePolynomial| |x| R) (|p| |NonNegativeInteger|)
         (|p2| |UnivariatePolynomial| |x| R) (|q| |NonNegativeInteger|)
         (|c1| R) ($ |List| (|UnivariatePolynomial| |x| R)))
        (SPROG
         ((|List2| (|List| (|UnivariatePolynomial| |x| R)))
          (|Pr5| (|UnivariatePolynomial| |x| R)) (#1=#:G1085 NIL)
          (|Pr4| #2=(|UnivariatePolynomial| |x| R)) (#3=#:G1083 NIL)
          (#4=#:G1082 NIL) (#5=#:G1091 NIL) (|j| NIL)
          (|List1| (|List| (|UnivariatePolynomial| |x| R)))
          (|Listf| (|List| #2#)) (|Pr3| #2#) (|Pr2| #2#) (|Pr1| #2#)
          (|sc1| (R)))
         (SEQ
          (LETT |sc1| (SPADCALL (SPADCALL |c1| (QREFELT $ 40)) (QREFELT $ 41))
                . #6=(|SHP;polsth2|))
          (LETT |Pr1|
                (SPADCALL (SPADCALL |sc1| 0 (QREFELT $ 44)) |p1|
                          (QREFELT $ 43))
                . #6#)
          (LETT |Pr2|
                (SPADCALL (SPADCALL |p1| (QREFELT $ 42)) |p2| (QREFELT $ 43))
                . #6#)
          (LETT |Pr3|
                (SPADCALL (SPADCALL |sc1| 0 (QREFELT $ 44)) |Pr2|
                          (QREFELT $ 43))
                . #6#)
          (LETT |Listf| (LIST |Pr1| |Pr3|) . #6#)
          (LETT |List1| (SPADCALL |p1| |Pr2| (QREFELT $ 38)) . #6#)
          (LETT |List2| NIL . #6#)
          (SEQ (LETT |j| 0 . #6#) (LETT #5# (- |p| 2) . #6#) G190
               (COND ((|greater_SI| |j| #5#) (GO G191)))
               (SEQ
                (LETT |Pr4|
                      (SPADCALL
                       (SPADCALL
                        (|SHP;delta|
                         (PROG1 (LETT #4# (- (- |p| |j|) 1) . #6#)
                           (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #4#))
                         $)
                        0 (QREFELT $ 44))
                       (SPADCALL |List1|
                                 (PROG1 (LETT #3# (+ (- |p| |j|) 1) . #6#)
                                   (|check_subtype2| (>= #3# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #3#))
                                 (QREFELT $ 37))
                       (QREFELT $ 43))
                      . #6#)
                (LETT |Pr5|
                      (PROG2
                          (LETT #1# (SPADCALL |Pr4| |c1| (QREFELT $ 30)) . #6#)
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 0)
                                        (|UnivariatePolynomial| (QREFELT $ 7)
                                                                (QREFELT $ 6))
                                        (|Union|
                                         (|UnivariatePolynomial| (QREFELT $ 7)
                                                                 (QREFELT $ 6))
                                         "failed")
                                        #1#))
                      . #6#)
                (EXIT
                 (LETT |List2| (SPADCALL (LIST |Pr5|) |List2| (QREFELT $ 22))
                       . #6#)))
               (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |Listf| |List2| (QREFELT $ 22)))))) 

(SDEFUN |SHP;polsth3|
        ((|p1| |UnivariatePolynomial| |x| R) (|p| |NonNegativeInteger|)
         (|p2| |UnivariatePolynomial| |x| R) (|q| |NonNegativeInteger|)
         (|c1| R) ($ |List| (|UnivariatePolynomial| |x| R)))
        (SPROG
         ((|List2| (|List| (|UnivariatePolynomial| |x| R)))
          (|Pr3| (|UnivariatePolynomial| |x| R)) (#1=#:G1121 NIL)
          (|Pr2| #2=(|UnivariatePolynomial| |x| R)) (#3=#:G1119 NIL)
          (#4=#:G1118 NIL) (#5=#:G1127 NIL) (#6=#:G1094 NIL) (|j| NIL)
          (|List1| (|List| (|UnivariatePolynomial| |x| R)))
          (|Listf| (|List| #2#)) (|Pr1| #2#) (|v| (|NonNegativeInteger|))
          (|q1| (|NonNegativeInteger|)) (#7=#:G1092 NIL) (|sc1| (R)))
         (SEQ
          (LETT |sc1| (SPADCALL (SPADCALL |c1| (QREFELT $ 40)) (QREFELT $ 41))
                . #8=(|SHP;polsth3|))
          (LETT |q1|
                (PROG1 (LETT #7# (- |q| 1) . #8#)
                  (|check_subtype2| (>= #7# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #7#))
                . #8#)
          (LETT |v| (+ |p| |q1|) . #8#)
          (LETT |Pr1|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (|SHP;delta| |q1| $)
                            (SPADCALL |sc1| (+ |q| 1) (QREFELT $ 23))
                            (QREFELT $ 17))
                  0 (QREFELT $ 44))
                 |p1| (QREFELT $ 43))
                . #8#)
          (LETT |Listf| (LIST |Pr1|) . #8#)
          (LETT |List1|
                (SPADCALL
                 (SPADCALL (SPADCALL |p1| (QREFELT $ 42)) |p2| (QREFELT $ 43))
                 |p1| (QREFELT $ 38))
                . #8#)
          (LETT |List2| NIL . #8#)
          (SEQ (LETT |j| 0 . #8#)
               (LETT #5#
                     (PROG1 (LETT #6# (- |p| 1) . #8#)
                       (|check_subtype2| (>= #6# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #6#))
                     . #8#)
               G190 (COND ((|greater_SI| |j| #5#) (GO G191)))
               (SEQ
                (LETT |Pr2|
                      (SPADCALL
                       (SPADCALL
                        (|SHP;delta|
                         (PROG1 (LETT #4# (- |v| |j|) . #8#)
                           (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #4#))
                         $)
                        0 (QREFELT $ 44))
                       (SPADCALL |List1|
                                 (PROG1 (LETT #3# (+ (- |v| |j|) 1) . #8#)
                                   (|check_subtype2| (>= #3# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #3#))
                                 (QREFELT $ 37))
                       (QREFELT $ 43))
                      . #8#)
                (LETT |Pr3|
                      (PROG2
                          (LETT #1# (SPADCALL |Pr2| |c1| (QREFELT $ 30)) . #8#)
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 0)
                                        (|UnivariatePolynomial| (QREFELT $ 7)
                                                                (QREFELT $ 6))
                                        (|Union|
                                         (|UnivariatePolynomial| (QREFELT $ 7)
                                                                 (QREFELT $ 6))
                                         "failed")
                                        #1#))
                      . #8#)
                (EXIT
                 (LETT |List2| (SPADCALL (LIST |Pr3|) |List2| (QREFELT $ 22))
                       . #8#)))
               (LETT |j| (|inc_SI| |j|) . #8#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |Listf| |List2| (QREFELT $ 22)))))) 

(SDEFUN |SHP;SturmHabichtSequence;2UpL;9|
        ((|p1| |UnivariatePolynomial| |x| R)
         (|p2| |UnivariatePolynomial| |x| R)
         ($ |List| (|UnivariatePolynomial| |x| R)))
        (SPROG ((|c1| (R)) (|q| #1=(|NonNegativeInteger|)) (|p| #1#))
               (SEQ
                (LETT |p| (SPADCALL |p1| (QREFELT $ 10))
                      . #2=(|SHP;SturmHabichtSequence;2UpL;9|))
                (LETT |q| (SPADCALL |p2| (QREFELT $ 10)) . #2#)
                (LETT |c1| (SPADCALL |p1| (QREFELT $ 15)) . #2#)
                (COND
                 ((OR (SPADCALL |c1| (|spadConstant| $ 11) (QREFELT $ 46))
                      (EQL |q| 1))
                  (EXIT (|SHP;polsth1| |p1| |p| |p2| |q| |c1| $))))
                (EXIT
                 (COND ((EQL |q| 0) (|SHP;polsth2| |p1| |p| |p2| |q| |c1| $))
                       ('T (|SHP;polsth3| |p1| |p| |p2| |q| |c1| $))))))) 

(SDEFUN |SHP;SturmHabichtCoefficients;2UpL;10|
        ((|p1| |UnivariatePolynomial| |x| R)
         (|p2| |UnivariatePolynomial| |x| R) ($ |List| R))
        (SPROG
         ((#1=#:G1130 NIL) (#2=#:G1135 NIL) (|p| NIL) (#3=#:G1136 NIL)
          (|j| NIL) (#4=#:G1134 NIL) (|qp| (|NonNegativeInteger|))
          (|List1| (|List| (|UnivariatePolynomial| |x| R))))
         (SEQ
          (LETT |List1| (SPADCALL |p1| |p2| (QREFELT $ 47))
                . #5=(|SHP;SturmHabichtCoefficients;2UpL;10|))
          (LETT |qp| (LENGTH |List1|) . #5#)
          (EXIT
           (PROGN
            (LETT #4# NIL . #5#)
            (SEQ (LETT |j| 1 . #5#) (LETT #3# |qp| . #5#) (LETT |p| NIL . #5#)
                 (LETT #2# |List1| . #5#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#) . #5#) NIL)
                       (|greater_SI| |j| #3#))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #4#
                         (CONS
                          (SPADCALL |p|
                                    (PROG1 (LETT #1# (- |qp| |j|) . #5#)
                                      (|check_subtype2| (>= #1# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #1#))
                                    (QREFELT $ 48))
                          #4#)
                         . #5#)))
                 (LETT #2# (PROG1 (CDR #2#) (LETT |j| (|inc_SI| |j|) . #5#))
                       . #5#)
                 (GO G190) G191 (EXIT (NREVERSE #4#)))))))) 

(SDEFUN |SHP;variation| ((|Lsig| |List| R) ($ |Integer|))
        (SPROG ((|List1| (|List| R)) (|sig1| (R)) (|elt2| (R)) (|elt1| (R)))
               (SEQ
                (COND ((SPADCALL |Lsig| 1 (QREFELT $ 51)) 0)
                      (#1='T
                       (SEQ
                        (LETT |elt1| (|SPADfirst| |Lsig|)
                              . #2=(|SHP;variation|))
                        (LETT |elt2| (SPADCALL |Lsig| 2 (QREFELT $ 52)) . #2#)
                        (LETT |sig1|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL |elt1| |elt2| (QREFELT $ 17))
                                (QREFELT $ 40))
                               (QREFELT $ 41))
                              . #2#)
                        (LETT |List1| (CDR |Lsig|) . #2#)
                        (EXIT
                         (COND
                          ((SPADCALL |sig1| (|spadConstant| $ 11)
                                     (QREFELT $ 46))
                           (|SHP;variation| |List1| $))
                          (#1# (+ 1 (|SHP;variation| |List1| $))))))))))) 

(SDEFUN |SHP;permanence| ((|Lsig| |List| R) ($ |Integer|))
        (SPROG ((|List1| (|List| R)) (|sig1| (R)) (|elt2| (R)) (|elt1| (R)))
               (SEQ
                (COND ((SPADCALL |Lsig| 1 (QREFELT $ 51)) 0)
                      (#1='T
                       (SEQ
                        (LETT |elt1| (|SPADfirst| |Lsig|)
                              . #2=(|SHP;permanence|))
                        (LETT |elt2| (SPADCALL |Lsig| 2 (QREFELT $ 52)) . #2#)
                        (LETT |sig1|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL |elt1| |elt2| (QREFELT $ 17))
                                (QREFELT $ 40))
                               (QREFELT $ 41))
                              . #2#)
                        (LETT |List1| (CDR |Lsig|) . #2#)
                        (EXIT
                         (COND
                          ((SPADCALL |sig1|
                                     (SPADCALL (|spadConstant| $ 11)
                                               (QREFELT $ 24))
                                     (QREFELT $ 46))
                           (|SHP;permanence| |List1| $))
                          (#1# (+ 1 (|SHP;permanence| |List1| $))))))))))) 

(SDEFUN |SHP;qzeros| ((|Lsig| |List| R) ($ |List| R))
        (SEQ (LETT |Lsig| (REVERSE |Lsig|) . #1=(|SHP;qzeros|))
             (SEQ G190
                  (COND
                   ((NULL
                     (SPADCALL (|SPADfirst| |Lsig|) (|spadConstant| $ 13)
                               (QREFELT $ 46)))
                    (GO G191)))
                  (SEQ (EXIT (LETT |Lsig| (CDR |Lsig|) . #1#))) NIL (GO G190)
                  G191 (EXIT NIL))
             (EXIT (NREVERSE |Lsig|)))) 

(SDEFUN |SHP;epsil|
        ((|int1| |NonNegativeInteger|) (|elt1| R) (|elt2| R) ($ |Integer|))
        (SPROG
         ((|ct4| (|Integer|)) (|ct3| (|NonNegativeInteger|)) (#1=#:G1147 NIL)
          (|ct2| #2=(|Integer|)) (|ct1| #2#))
         (SEQ
          (COND ((OR (EQL |int1| 0) (ODDP |int1|)) 0)
                ('T
                 (SEQ
                  (LETT |ct1|
                        (COND
                         ((SPADCALL |elt1| (|spadConstant| $ 13)
                                    (QREFELT $ 53))
                          1)
                         (#3='T -1))
                        . #4=(|SHP;epsil|))
                  (LETT |ct2|
                        (COND
                         ((SPADCALL |elt2| (|spadConstant| $ 13)
                                    (QREFELT $ 53))
                          1)
                         (#3# -1))
                        . #4#)
                  (LETT |ct3|
                        (PROG2
                            (LETT #1# (SPADCALL |int1| 2 (QREFELT $ 39)) . #4#)
                            (QCDR #1#)
                          (|check_union2| (QEQCAR #1# 0) (|NonNegativeInteger|)
                                          (|Union| (|NonNegativeInteger|)
                                                   "failed")
                                          #1#))
                        . #4#)
                  (LETT |ct4| (* |ct1| |ct2|) . #4#)
                  (EXIT (* (EXPT -1 |ct3|) |ct4|)))))))) 

(SDEFUN |SHP;numbnce| ((|Lsig| |List| R) ($ |NonNegativeInteger|))
        (COND
         ((OR (NULL |Lsig|)
              (SPADCALL (|SPADfirst| |Lsig|) (|spadConstant| $ 13)
                        (QREFELT $ 46)))
          0)
         ('T (+ 1 (|SHP;numbnce| (CDR |Lsig|) $))))) 

(SDEFUN |SHP;numbce| ((|Lsig| |List| R) ($ |NonNegativeInteger|))
        (COND
         ((OR (NULL |Lsig|)
              (SPADCALL (|SPADfirst| |Lsig|) (|spadConstant| $ 13)
                        (QREFELT $ 54)))
          0)
         ('T (+ 1 (|SHP;numbce| (CDR |Lsig|) $))))) 

(SDEFUN |SHP;wfunctaux| ((|Lsig| . #1=(|List| R)) ($ |Integer|))
        (SPROG
         ((|ind4| (|Integer|)) (|ind3| (|Integer|)) (|ind2| (|Integer|))
          (|List1| #1#) (#2=#:G1162 NIL) (|j| NIL)
          (|cont2| (|NonNegativeInteger|)) (|List2| (|List| R))
          (#3=#:G1161 NIL) (|cont1| (|NonNegativeInteger|)))
         (SEQ
          (COND ((NULL |Lsig|) 0)
                ('T
                 (SEQ (LETT |List2| NIL . #4=(|SHP;wfunctaux|))
                      (LETT |List1| |Lsig| . #4#)
                      (LETT |cont1| (|SHP;numbnce| |List1| $) . #4#)
                      (SEQ (LETT |j| 1 . #4#) (LETT #3# |cont1| . #4#) G190
                           (COND ((|greater_SI| |j| #3#) (GO G191)))
                           (SEQ
                            (LETT |List2|
                                  (SPADCALL |List2|
                                            (LIST (|SPADfirst| |List1|))
                                            (QREFELT $ 55))
                                  . #4#)
                            (EXIT (LETT |List1| (CDR |List1|) . #4#)))
                           (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                           (EXIT NIL))
                      (LETT |ind2| 0 . #4#)
                      (LETT |cont2| (|SHP;numbce| |List1| $) . #4#)
                      (SEQ (LETT |j| 1 . #4#) (LETT #2# |cont2| . #4#) G190
                           (COND ((|greater_SI| |j| #2#) (GO G191)))
                           (SEQ (EXIT (LETT |List1| (CDR |List1|) . #4#)))
                           (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                           (EXIT NIL))
                      (COND
                       ((SPADCALL |cont2| 0 (QREFELT $ 56))
                        (LETT |ind2|
                              (|SHP;epsil| |cont2|
                               (SPADCALL |List2| (QREFELT $ 57))
                               (|SPADfirst| |List1|) $)
                              . #4#)))
                      (LETT |ind3|
                            (- (|SHP;permanence| |List2| $)
                               (|SHP;variation| |List2| $))
                            . #4#)
                      (LETT |ind4| (+ |ind2| |ind3|) . #4#)
                      (EXIT (+ |ind4| (|SHP;wfunctaux| |List1| $))))))))) 

(SDEFUN |SHP;wfunct| ((|Lsig| |List| R) ($ |Integer|))
        (SPROG ((|List1| (|List| R)))
               (SEQ (LETT |List1| (|SHP;qzeros| |Lsig| $) |SHP;wfunct|)
                    (EXIT (|SHP;wfunctaux| |List1| $))))) 

(SDEFUN |SHP;SturmHabicht;2UpI;19|
        ((|p1| |UnivariatePolynomial| |x| R)
         (|p2| |UnivariatePolynomial| |x| R) ($ |Integer|))
        (SPROG
         ((#1=#:G1170 NIL) (|p| NIL) (#2=#:G1169 NIL)
          (|List1| (|List| (|UnivariatePolynomial| |x| R))))
         (SEQ
          (COND
           ((OR (SPADCALL |p2| (|spadConstant| $ 14) (QREFELT $ 45))
                (EQL (SPADCALL |p1| (QREFELT $ 10)) 0))
            0)
           ('T
            (SEQ
             (LETT |List1| (SPADCALL |p1| |p2| (QREFELT $ 47))
                   . #3=(|SHP;SturmHabicht;2UpI;19|))
             (EXIT
              (|SHP;wfunct|
               (PROGN
                (LETT #2# NIL . #3#)
                (SEQ (LETT |p| NIL . #3#) (LETT #1# |List1| . #3#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2# (CONS (SPADCALL |p| (QREFELT $ 15)) #2#)
                             . #3#)))
                     (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                     (EXIT (NREVERSE #2#))))
               $)))))))) 

(SDEFUN |SHP;countRealRoots;UpI;20|
        ((|p1| |UnivariatePolynomial| |x| R) ($ |Integer|))
        (SPADCALL |p1| (|spadConstant| $ 16) (QREFELT $ 58))) 

(SDEFUN |SHP;SturmHabichtMultiple;2UpI;21|
        ((|p1| |UnivariatePolynomial| |x| R)
         (|p2| |UnivariatePolynomial| |x| R) ($ |Integer|))
        (SPROG
         ((#1=#:G1204 NIL) (|f| NIL) (#2=#:G1203 NIL)
          (|sqfr|
           (|List|
            (|Record| (|:| |flg| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |fctr| (|UnivariatePolynomial| |x| R))
                      (|:| |xpnt| (|Integer|)))))
          (SH (|List| (|UnivariatePolynomial| |x| R))) (|ans| (|Integer|))
          (#3=#:G1172 NIL) (#4=#:G1201 NIL) (|p| NIL) (#5=#:G1202 NIL)
          (|j| NIL) (#6=#:G1200 NIL) (|qp| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((OR (SPADCALL |p2| (|spadConstant| $ 14) (QREFELT $ 45))
                (EQL (SPADCALL |p1| (QREFELT $ 10)) 0))
            0)
           ('T
            (SEQ
             (LETT SH (SPADCALL |p1| |p2| (QREFELT $ 47))
                   . #7=(|SHP;SturmHabichtMultiple;2UpI;21|))
             (LETT |qp| (LENGTH SH) . #7#)
             (LETT |ans|
                   (|SHP;wfunct|
                    (PROGN
                     (LETT #6# NIL . #7#)
                     (SEQ (LETT |j| 1 . #7#) (LETT #5# |qp| . #7#)
                          (LETT |p| NIL . #7#) (LETT #4# SH . #7#) G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |p| (CAR #4#) . #7#) NIL)
                                (|greater_SI| |j| #5#))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #6#
                                  (CONS
                                   (SPADCALL |p|
                                             (PROG1
                                                 (LETT #3# (- |qp| |j|) . #7#)
                                               (|check_subtype2| (>= #3# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #3#))
                                             (QREFELT $ 48))
                                   #6#)
                                  . #7#)))
                          (LETT #4#
                                (PROG1 (CDR #4#)
                                  (LETT |j| (|inc_SI| |j|) . #7#))
                                . #7#)
                          (GO G190) G191 (EXIT (NREVERSE #6#))))
                    $)
                   . #7#)
             (LETT SH (REVERSE SH) . #7#)
             (SEQ G190
                  (COND
                   ((NULL
                     (SPADCALL (|SPADfirst| SH) (|spadConstant| $ 14)
                               (QREFELT $ 45)))
                    (GO G191)))
                  (SEQ (EXIT (LETT SH (CDR SH) . #7#))) NIL (GO G190) G191
                  (EXIT NIL))
             (EXIT
              (COND ((EQL (SPADCALL (|SPADfirst| SH) (QREFELT $ 10)) 0) |ans|)
                    ((QEQCAR
                      (SPADCALL (SPADCALL |p1| (QREFELT $ 42)) (|SPADfirst| SH)
                                (QREFELT $ 60))
                      0)
                     (+ |ans| (SPADCALL (|SPADfirst| SH) |p2| (QREFELT $ 61))))
                    ('T
                     (SEQ
                      (LETT |sqfr|
                            (SPADCALL (SPADCALL |p1| (QREFELT $ 63))
                                      (QREFELT $ 68))
                            . #7#)
                      (COND
                       ((EQL (LENGTH |sqfr|) 1)
                        (COND
                         ((EQL (QVELT (|SPADfirst| |sqfr|) 2) 1)
                          (EXIT |ans|)))))
                      (EXIT
                       (SPADCALL (ELT $ 69)
                                 (PROGN
                                  (LETT #2# NIL . #7#)
                                  (SEQ (LETT |f| NIL . #7#)
                                       (LETT #1# |sqfr| . #7#) G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN
                                              (LETT |f| (CAR #1#) . #7#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS
                                                (* (QVELT |f| 2)
                                                   (SPADCALL (QVELT |f| 1) |p2|
                                                             (QREFELT $ 58)))
                                                #2#)
                                               . #7#)))
                                       (LETT #1# (CDR #1#) . #7#) (GO G190)
                                       G191 (EXIT (NREVERSE #2#))))
                                 (QREFELT $ 72))))))))))))) 

(SDEFUN |SHP;countRealRootsMultiple;UpI;22|
        ((|p1| |UnivariatePolynomial| |x| R) ($ |Integer|))
        (SPADCALL |p1| (|spadConstant| $ 16) (QREFELT $ 61))) 

(DECLAIM (NOTINLINE |SturmHabichtPackage;|)) 

(DEFUN |SturmHabichtPackage| (&REST #1=#:G1206)
  (SPROG NIL
         (PROG (#2=#:G1207)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SturmHabichtPackage|)
                                               '|domainEqualList|)
                    . #3=(|SturmHabichtPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SturmHabichtPackage;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|SturmHabichtPackage|)))))))))) 

(DEFUN |SturmHabichtPackage;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|SturmHabichtPackage|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|SturmHabichtPackage| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 74) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|SturmHabichtPackage|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 61
                       (CONS
                        (|dispatchFunction| |SHP;SturmHabichtMultiple;2UpI;21|)
                        $))
             (QSETREFV $ 73
                       (CONS
                        (|dispatchFunction|
                         |SHP;countRealRootsMultiple;UpI;22|)
                        $)))))
          $))) 

(MAKEPROP '|SturmHabichtPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|NonNegativeInteger|) (|UnivariatePolynomial| 7 6)
              (0 . |degree|) (5 . |One|) (9 . |pseudoRemainder|) (15 . |Zero|)
              (19 . |Zero|) (23 . |leadingCoefficient|) (28 . |One|) (32 . *)
              (38 . *) (44 . -) (|List| 9) (49 . |new|) (55 . |append|)
              (61 . ^) (67 . -) (72 . |last|) (77 . |second|)
              (|PositiveInteger|) (82 . ^) (|Union| $ '"failed") (88 . |exquo|)
              '"last" (94 . |elt|) (|Boolean|) (100 . ~=) (106 . ~=)
              (|Integer|) (112 . |elt|) |SHP;subresultantSequence;2UpL;4|
              (118 . |exquo|) (124 . |sign|) (129 . |coerce|)
              (134 . |differentiate|) (139 . *) (145 . |monomial|) (151 . =)
              (157 . =) |SHP;SturmHabichtSequence;2UpL;9| (163 . |coefficient|)
              (|List| 6) |SHP;SturmHabichtCoefficients;2UpL;10| (169 . |size?|)
              (175 . |elt|) (181 . >) (187 . ~=) (193 . |append|) (199 . >)
              (205 . |last|) |SHP;SturmHabicht;2UpI;19|
              |SHP;countRealRoots;UpI;20| (210 . |exquo|)
              (216 . |SturmHabichtMultiple|) (|Factored| $)
              (222 . |squareFree|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 64) (|:| |fctr| 9) (|:| |xpnt| 36))
              (|List| 65) (|Factored| 9) (227 . |factorList|) (232 . +)
              (|Mapping| 36 36 36) (|List| 36) (238 . |reduce|)
              (244 . |countRealRootsMultiple|))
           '#(|subresultantSequence| 249 |countRealRootsMultiple| 255
              |countRealRoots| 260 |SturmHabichtSequence| 265
              |SturmHabichtMultiple| 271 |SturmHabichtCoefficients| 277
              |SturmHabicht| 283)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 73
                                                 '(1 9 8 0 10 0 6 0 11 2 9 0 0
                                                   0 12 0 6 0 13 0 9 0 14 1 9 6
                                                   0 15 0 9 0 16 2 6 0 0 0 17 2
                                                   9 0 6 0 18 1 9 0 0 19 2 20 0
                                                   8 9 21 2 20 0 0 0 22 2 6 0 0
                                                   8 23 1 6 0 0 24 1 20 9 0 25
                                                   1 20 9 0 26 2 6 0 0 27 28 2
                                                   9 29 0 6 30 2 20 9 0 31 32 2
                                                   9 33 0 0 34 2 8 33 0 0 35 2
                                                   20 9 0 36 37 2 8 29 0 0 39 1
                                                   6 36 0 40 1 6 0 36 41 1 9 0
                                                   0 42 2 9 0 0 0 43 2 9 0 6 8
                                                   44 2 9 33 0 0 45 2 6 33 0 0
                                                   46 2 9 6 0 8 48 2 49 33 0 8
                                                   51 2 49 6 0 36 52 2 6 33 0 0
                                                   53 2 6 33 0 0 54 2 49 0 0 0
                                                   55 2 8 33 0 0 56 1 49 6 0 57
                                                   2 9 29 0 0 60 2 0 36 9 9 61
                                                   1 9 62 0 63 1 67 66 0 68 2
                                                   36 0 0 0 69 2 71 36 70 0 72
                                                   1 0 36 9 73 2 0 20 9 9 38 1
                                                   1 36 9 73 1 0 36 9 59 2 0 20
                                                   9 9 47 2 1 36 9 9 61 2 0 49
                                                   9 9 50 2 0 36 9 9 58)))))
           '|lookupComplete|)) 
