
(SDEFUN |IRSN;aIdInverse| (($ |Void|))
        (SPROG
         ((#1=#:G811 NIL) (#2=#:G765 NIL) (#3=#:G742 NIL) (|i| NIL)
          (#4=#:G822 NIL) (|k| NIL) (#5=#:G730 NIL) (#6=#:G721 NIL) (|j| NIL)
          (#7=#:G821 NIL) (|l| NIL) (#8=#:G820 NIL)
          (|idperm| (|List| (|Integer|))) (#9=#:G818 NIL) (#10=#:G819 NIL))
         (SEQ
          (EXIT
           (SEQ (SETELT $ 13 (MAKE_MATRIX1 (QREFELT $ 7) (QREFELT $ 7) 0))
                (SEQ (LETT |k| 1 . #11=(|IRSN;aIdInverse|))
                     (LETT #10# (QREFELT $ 7) . #11#) G190
                     (COND ((|greater_SI| |k| #10#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL (QREFELT $ 13) |k| |k| 1 (QREFELT $ 16))))
                     (LETT |k| (|inc_SI| |k|) . #11#) (GO G190) G191
                     (EXIT NIL))
                (COND
                 ((< (QREFELT $ 10) 5)
                  (PROGN (LETT #9# (QREFELT $ 13) . #11#) (GO #12=#:G817))))
                (LETT |idperm| NIL . #11#)
                (SEQ (LETT |k| (QREFELT $ 10) . #11#) G190
                     (COND ((< |k| 1) (GO G191)))
                     (SEQ (EXIT (LETT |idperm| (CONS |k| |idperm|) . #11#)))
                     (LETT |k| (+ |k| -1) . #11#) (GO G190) G191 (EXIT NIL))
                (SEQ (LETT |k| 1 . #11#) (LETT #8# (- (QREFELT $ 7) 1) . #11#)
                     G190 (COND ((|greater_SI| |k| #8#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |l| (+ |k| 1) . #11#)
                            (LETT #7# (QREFELT $ 7) . #11#) G190
                            (COND ((> |l| #7#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL (QREFELT $ 13) |k| |l|
                                        (|IRSN;signum| |k| |l| |idperm| $)
                                        (QREFELT $ 16))))
                            (LETT |l| (+ |l| 1) . #11#) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |k| (|inc_SI| |k|) . #11#) (GO G190) G191
                     (EXIT NIL))
                (EXIT
                 (SEQ (LETT |j| (QREFELT $ 7) . #11#) G190
                      (COND ((< |j| 2) (GO G191)))
                      (SEQ
                       (SEQ (LETT |i| (- |j| 1) . #11#) G190
                            (COND ((< |i| 1) (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL (QREFELT $ 13)
                                        (PROG1 (LETT #6# |i| . #11#)
                                          (|check_subtype2| (>= #6# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #6#))
                                        |j|
                                        (-
                                         (SPADCALL (QREFELT $ 13)
                                                   (PROG1 (LETT #5# |i| . #11#)
                                                     (|check_subtype2|
                                                      (>= #5# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #5#))
                                                   |j| (QREFELT $ 17)))
                                        (QREFELT $ 16))))
                            (LETT |i| (+ |i| -1) . #11#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT
                        (SEQ (LETT |k| (+ |j| 1) . #11#)
                             (LETT #4# (QREFELT $ 7) . #11#) G190
                             (COND ((> |k| #4#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |i| (- |j| 1) . #11#) G190
                                    (COND ((< |i| 1) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SPADCALL (QREFELT $ 13)
                                                (PROG1 (LETT #3# |i| . #11#)
                                                  (|check_subtype2| (>= #3# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    '(|Integer|)
                                                                    #3#))
                                                |k|
                                                (+
                                                 (SPADCALL (QREFELT $ 13)
                                                           (PROG1
                                                               (LETT #2# |i|
                                                                     . #11#)
                                                             (|check_subtype2|
                                                              (>= #2# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #2#))
                                                           |k| (QREFELT $ 17))
                                                 (*
                                                  (SPADCALL (QREFELT $ 13)
                                                            (PROG1
                                                                (LETT #1# |i|
                                                                      . #11#)
                                                              (|check_subtype2|
                                                               (>= #1# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #1#))
                                                            |j| (QREFELT $ 17))
                                                  (SPADCALL (QREFELT $ 13) |j|
                                                            |k|
                                                            (QREFELT $ 17))))
                                                (QREFELT $ 16))))
                                    (LETT |i| (+ |i| -1) . #11#) (GO G190) G191
                                    (EXIT NIL))))
                             (LETT |k| (+ |k| 1) . #11#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |j| (+ |j| -1) . #11#) (GO G190) G191
                      (EXIT NIL)))))
          #12# (EXIT #9#)))) 

(SDEFUN |IRSN;alreadyComputed?| ((|lambda| |List| #1=(|Integer|)) ($ |Void|))
        (SPROG
         ((#2=#:G835 NIL) (#3=#:G833 NIL) (#4=#:G832 #1#) (#5=#:G834 #1#)
          (#6=#:G838 NIL) (#7=#:G690 NIL) (#8=#:G828 NIL) (#9=#:G827 NIL))
         (SEQ
          (COND
           ((NULL (SPADCALL |lambda| (QREFELT $ 6) (QREFELT $ 20)))
            (SEQ (SETELT $ 6 |lambda|)
                 (SETELT $ 9 (SPADCALL |lambda| (QREFELT $ 22)))
                 (SETELT $ 11
                         (PROG1
                             (LETT #9# (|SPADfirst| (QREFELT $ 9))
                                   . #10=(|IRSN;alreadyComputed?|))
                           (|check_subtype2| (>= #9# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #9#)))
                 (SETELT $ 12
                         (PROG1 (LETT #8# (|SPADfirst| |lambda|) . #10#)
                           (|check_subtype2| (>= #8# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #8#)))
                 (SETELT $ 10
                         (PROG1
                             (LETT #2#
                                   (PROGN
                                    (LETT #3# NIL . #10#)
                                    (SEQ (LETT #7# NIL . #10#)
                                         (LETT #6# |lambda| . #10#) G190
                                         (COND
                                          ((OR (ATOM #6#)
                                               (PROGN
                                                (LETT #7# (CAR #6#) . #10#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (PROGN
                                            (LETT #5# #7# . #10#)
                                            (COND
                                             (#3#
                                              (LETT #4# (+ #4# #5#) . #10#))
                                             ('T
                                              (PROGN
                                               (LETT #4# #5# . #10#)
                                               (LETT #3# 'T . #10#)))))))
                                         (LETT #6# (CDR #6#) . #10#) (GO G190)
                                         G191 (EXIT NIL))
                                    (COND (#3# #4#) ('T 0)))
                                   . #10#)
                           (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #2#)))
                 (SETELT $ 8 (SPADCALL |lambda| (QREFELT $ 25)))
                 (SETELT $ 7 (LENGTH (QREFELT $ 8)))
                 (EXIT (|IRSN;aIdInverse| $)))))))) 

(SDEFUN |IRSN;listPermutation|
        ((|pi| |Permutation| (|Integer|)) ($ |List| (|Integer|)))
        (SPROG ((|li| (|List| (|Integer|))) (|k| NIL))
               (SEQ (LETT |li| NIL . #1=(|IRSN;listPermutation|))
                    (SEQ (LETT |k| (QREFELT $ 10) . #1#) G190
                         (COND ((< |k| 1) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |li|
                                 (CONS (SPADCALL |pi| |k| (QREFELT $ 27)) |li|)
                                 . #1#)))
                         (LETT |k| (+ |k| -1) . #1#) (GO G190) G191 (EXIT NIL))
                    (EXIT |li|)))) 

(SDEFUN |IRSN;signum|
        ((|numberOfRowTableau| |NonNegativeInteger|)
         (|numberOfColumnTableau| |NonNegativeInteger|)
         (|pi| |List| (|Integer|)) ($ |Integer|))
        (SPROG
         ((|k| #1=(|NonNegativeInteger|)) (|l| #1#) (|end| #2=(|Boolean|))
          (|sign| (|Integer|)) (|z| #1#) (|swap| (|Integer|)) (|endk| #2#)
          (|ctrl| #2#) (|s| #1#) (|columntab| #3=(|Matrix| (|Integer|)))
          (|rowtab| #3#))
         (SEQ
          (LETT |rowtab|
                (SPADCALL
                 (SPADCALL (QREFELT $ 8) |numberOfRowTableau| (QREFELT $ 28))
                 (QREFELT $ 29))
                . #4=(|IRSN;signum|))
          (LETT |columntab|
                (SPADCALL
                 (SPADCALL (QREFELT $ 8) |numberOfColumnTableau|
                           (QREFELT $ 28))
                 (QREFELT $ 29))
                . #4#)
          (LETT |sign| 1 . #4#) (LETT |end| NIL . #4#) (LETT |k| 1 . #4#)
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((SPADCALL |k| (QREFELT $ 11) (QREFELT $ 31)) (NULL |end|))
                   ('T NIL)))
                 (GO G191)))
               (SEQ (LETT |l| 1 . #4#)
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND
                             ((SPADCALL |l|
                                        (SPADCALL (QREFELT $ 6) |k|
                                                  (QREFELT $ 32))
                                        (QREFELT $ 33))
                              (NULL |end|))
                             ('T NIL)))
                           (GO G191)))
                         (SEQ (LETT |z| |l| . #4#) (LETT |endk| NIL . #4#)
                              (SEQ G190
                                   (COND
                                    ((NULL
                                      (COND
                                       ((SPADCALL |z|
                                                  (SPADCALL (QREFELT $ 6) |k|
                                                            (QREFELT $ 32))
                                                  (QREFELT $ 33))
                                        (NULL |endk|))
                                       ('T NIL)))
                                     (GO G191)))
                                   (SEQ (LETT |s| |k| . #4#)
                                        (LETT |ctrl| 'T . #4#)
                                        (SEQ G190
                                             (COND ((NULL |ctrl|) (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (COND
                                                ((SPADCALL |s|
                                                           (SPADCALL
                                                            (QREFELT $ 9) |l|
                                                            (QREFELT $ 32))
                                                           (QREFELT $ 33))
                                                 (COND
                                                  ((EQL
                                                    (+ 1
                                                       (SPADCALL |rowtab| |k|
                                                                 |z|
                                                                 (QREFELT $
                                                                          17)))
                                                    (SPADCALL |pi|
                                                              (+ 1
                                                                 (SPADCALL
                                                                  |columntab|
                                                                  |s| |l|
                                                                  (QREFELT $
                                                                           17)))
                                                              (QREFELT $ 32)))
                                                   (LETT |ctrl| NIL . #4#))
                                                  ('T
                                                   (LETT |s| (+ |s| 1)
                                                         . #4#))))
                                                ('T (LETT |ctrl| NIL . #4#)))))
                                             NIL (GO G190) G191 (EXIT NIL))
                                        (LETT |endk|
                                              (SPADCALL |s|
                                                        (SPADCALL (QREFELT $ 9)
                                                                  |l|
                                                                  (QREFELT $
                                                                           32))
                                                        (QREFELT $ 33))
                                              . #4#)
                                        (EXIT
                                         (COND
                                          (|endk|
                                           (SEQ
                                            (COND
                                             ((< |k| |s|)
                                              (SEQ
                                               (LETT |sign| (- |sign|) . #4#)
                                               (LETT |swap|
                                                     (SPADCALL |columntab| |s|
                                                               |l|
                                                               (QREFELT $ 17))
                                                     . #4#)
                                               (SPADCALL |columntab| |s| |l|
                                                         (SPADCALL |columntab|
                                                                   |k| |l|
                                                                   (QREFELT $
                                                                            17))
                                                         (QREFELT $ 16))
                                               (EXIT
                                                (SPADCALL |columntab| |k| |l|
                                                          |swap|
                                                          (QREFELT $ 16))))))
                                            (EXIT
                                             (COND
                                              ((< |l| |z|)
                                               (SEQ
                                                (LETT |swap|
                                                      (SPADCALL |rowtab| |k|
                                                                |z|
                                                                (QREFELT $ 17))
                                                      . #4#)
                                                (SPADCALL |rowtab| |k| |z|
                                                          (SPADCALL |rowtab|
                                                                    |k| |l|
                                                                    (QREFELT $
                                                                             17))
                                                          (QREFELT $ 16))
                                                (EXIT
                                                 (SPADCALL |rowtab| |k| |l|
                                                           |swap|
                                                           (QREFELT $
                                                                    16)))))))))
                                          ('T (LETT |z| (+ |z| 1) . #4#)))))
                                   NIL (GO G190) G191 (EXIT NIL))
                              (COND
                               ((SPADCALL |z|
                                          (SPADCALL (QREFELT $ 6) |k|
                                                    (QREFELT $ 32))
                                          (QREFELT $ 34))
                                (SEQ (LETT |sign| 0 . #4#)
                                     (EXIT (LETT |end| 'T . #4#)))))
                              (EXIT (LETT |l| (+ |l| 1) . #4#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |k| (+ |k| 1) . #4#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |sign|)))) 

(SDEFUN |IRSN;sumPartition|
        ((|lambda| |List| (|Integer|)) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G870 NIL) (|prev| (|Integer|)) (|ok| (|Boolean|))
          (|sum| (|Integer|)) (#2=#:G873 NIL) (|x| NIL))
         (SEQ (LETT |ok| 'T . #3=(|IRSN;sumPartition|))
              (LETT |prev| (|SPADfirst| |lambda|) . #3#) (LETT |sum| 0 . #3#)
              (SEQ (LETT |x| NIL . #3#) (LETT #2# |lambda| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ (LETT |sum| (+ |sum| |x|) . #3#)
                        (LETT |ok| (COND (|ok| (>= |prev| |x|)) ('T NIL))
                              . #3#)
                        (EXIT (LETT |prev| |x| . #3#)))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (COND ((NULL |ok|) (|error| "No proper partition ")))
              (EXIT
               (PROG1 (LETT #1# |sum| . #3#)
                 (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                   '(|Integer|) #1#)))))) 

(SDEFUN |IRSN;testPermutation|
        ((|pi| |List| (|Integer|)) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G881 NIL) (#2=#:G885 NIL) (|i| NIL)
          (|test| (|Vector| (|Boolean|))) (#3=#:G878 NIL) (|ok| (|Boolean|))
          (#4=#:G884 NIL))
         (SEQ (LETT |ok| 'T . #5=(|IRSN;testPermutation|)) (SETELT $ 10 0)
              (SEQ (LETT |i| NIL . #5#) (LETT #4# |pi| . #5#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |i| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     ((SPADCALL |i| (QREFELT $ 10) (QREFELT $ 34))
                      (SETELT $ 10 |i|)))
                    (EXIT (COND ((< |i| 1) (LETT |ok| NIL . #5#)))))
                   (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
              (COND
               ((EQL (QREFELT $ 10) (LENGTH |pi|))
                (COND ((NULL |ok|) (|error| #6="No permutation of 1,2,..,n"))))
               ('T (|error| #6#)))
              (LETT |test|
                    (MAKEARR1
                     (PROG1 (LETT #3# (QREFELT $ 10) . #5#)
                       (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #3#))
                     NIL)
                    . #5#)
              (SEQ (LETT |i| NIL . #5#) (LETT #2# |pi| . #5#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #5#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |test| |i| 'T (QREFELT $ 36))))
                   (LETT #2# (CDR #2#) . #5#) (GO G190) G191 (EXIT NIL))
              (COND
               ((SPADCALL NIL |test| (QREFELT $ 37))
                (|error| "No permutation")))
              (EXIT
               (PROG1 (LETT #1# (QREFELT $ 10) . #5#)
                 (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                   '(|Integer|) #1#)))))) 

(SDEFUN |IRSN;dimensionOfIrreducibleRepresentation;LNni;7|
        ((|lambda| |List| (|Integer|)) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G888 NIL) (|dd| (|Integer|)) (#2=#:G892 NIL) (|j| NIL)
          (#3=#:G891 NIL) (|i| NIL) (|lambdaprime| (|List| (|Integer|)))
          (|nn| (|Integer|)))
         (SEQ
          (LETT |nn| (|IRSN;sumPartition| |lambda| $)
                . #4=(|IRSN;dimensionOfIrreducibleRepresentation;LNni;7|))
          (LETT |dd| 1 . #4#)
          (LETT |lambdaprime| (SPADCALL |lambda| (QREFELT $ 22)) . #4#)
          (SEQ (LETT |i| 1 . #4#)
               (LETT #3# (SPADCALL |lambdaprime| 1 (QREFELT $ 32)) . #4#) G190
               (COND ((|greater_SI| |i| #3#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #4#)
                      (LETT #2# (SPADCALL |lambda| |i| (QREFELT $ 32)) . #4#)
                      G190 (COND ((|greater_SI| |j| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT |dd|
                              (* |dd|
                                 (+
                                  (-
                                   (-
                                    (+ (SPADCALL |lambda| |i| (QREFELT $ 32))
                                       (SPADCALL |lambdaprime| |j|
                                                 (QREFELT $ 32)))
                                    |i|)
                                   |j|)
                                  1))
                              . #4#)))
                      (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (PROG1
               (LETT #1# (QUOTIENT2 (SPADCALL |nn| (QREFELT $ 39)) |dd|) . #4#)
             (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|) '(|Integer|)
                               #1#)))))) 

(SDEFUN |IRSN;irreducibleRepresentation;LPM;8|
        ((|lambda| |List| (|Integer|)) (|pi| |Permutation| (|Integer|))
         ($ |Matrix| (|Integer|)))
        (SPROG
         ((#1=#:G899 NIL) (|l| NIL) (#2=#:G898 NIL) (|k| NIL)
          (|aPi| (|Matrix| (|Integer|))) (|piList| (|List| (|Integer|)))
          (|nn| (|NonNegativeInteger|)))
         (SEQ
          (LETT |nn| (|IRSN;sumPartition| |lambda| $)
                . #3=(|IRSN;irreducibleRepresentation;LPM;8|))
          (|IRSN;alreadyComputed?| |lambda| $)
          (LETT |piList| (|IRSN;listPermutation| |pi| $) . #3#)
          (COND
           ((NULL (EQL |nn| (|IRSN;testPermutation| |piList| $)))
            (|error| "Partition and permutation are not consistent")))
          (LETT |aPi| (MAKE_MATRIX1 (QREFELT $ 7) (QREFELT $ 7) 0) . #3#)
          (SEQ (LETT |k| 1 . #3#) (LETT #2# (QREFELT $ 7) . #3#) G190
               (COND ((|greater_SI| |k| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |l| 1 . #3#) (LETT #1# (QREFELT $ 7) . #3#) G190
                      (COND ((|greater_SI| |l| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |aPi| |k| |l|
                                  (|IRSN;signum| |k| |l| |piList| $)
                                  (QREFELT $ 16))))
                      (LETT |l| (|inc_SI| |l|) . #3#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL (QREFELT $ 13) |aPi| (QREFELT $ 41)))))) 

(SDEFUN |IRSN;irreducibleRepresentation;LL;9|
        ((|lambda| |List| (|Integer|)) ($ |List| (|Matrix| (|Integer|))))
        (SPROG
         ((|listperm| (|List| (|Permutation| (|Integer|))))
          (|li| (|List| (|Integer|))) (|k| NIL))
         (SEQ
          (LETT |listperm| NIL . #1=(|IRSN;irreducibleRepresentation;LL;9|))
          (LETT |li| NIL . #1#) (|IRSN;sumPartition| |lambda| $)
          (|IRSN;alreadyComputed?| |lambda| $)
          (LETT |listperm|
                (COND
                 ((EQL (QREFELT $ 10) 1)
                  (CONS (|spadConstant| $ 43) |listperm|))
                 ((EQL (QREFELT $ 10) 2)
                  (CONS (SPADCALL (LIST 1 2) (QREFELT $ 44)) |listperm|))
                 ('T
                  (SEQ
                   (SEQ (LETT |k| (QREFELT $ 10) . #1#) G190
                        (COND ((< |k| 1) (GO G191)))
                        (SEQ (EXIT (LETT |li| (CONS |k| |li|) . #1#)))
                        (LETT |k| (+ |k| -1) . #1#) (GO G190) G191 (EXIT NIL))
                   (LETT |listperm|
                         (CONS (SPADCALL |li| (QREFELT $ 44)) |listperm|)
                         . #1#)
                   (EXIT
                    (CONS (SPADCALL (LIST 1 2) (QREFELT $ 44)) |listperm|)))))
                . #1#)
          (EXIT (SPADCALL |lambda| |listperm| (QREFELT $ 46)))))) 

(SDEFUN |IRSN;irreducibleRepresentation;LLL;10|
        ((|lambda| |List| (|Integer|))
         (|listperm| |List| (|Permutation| (|Integer|)))
         ($ |List| (|Matrix| (|Integer|))))
        (SPROG ((#1=#:G908 NIL) (|pi| NIL) (#2=#:G907 NIL))
               (SEQ (|IRSN;sumPartition| |lambda| $)
                    (|IRSN;alreadyComputed?| |lambda| $)
                    (EXIT
                     (PROGN
                      (LETT #2# NIL
                            . #3=(|IRSN;irreducibleRepresentation;LLL;10|))
                      (SEQ (LETT |pi| NIL . #3#) (LETT #1# |listperm| . #3#)
                           G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |pi| (CAR #1#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (SPADCALL |lambda| |pi| (QREFELT $ 42))
                                    #2#)
                                   . #3#)))
                           (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#)))))))) 

(DECLAIM (NOTINLINE |IrrRepSymNatPackage;|)) 

(DEFUN |IrrRepSymNatPackage| ()
  (SPROG NIL
         (PROG (#1=#:G910)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|IrrRepSymNatPackage|)
                    . #2=(|IrrRepSymNatPackage|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|IrrRepSymNatPackage|
                             (LIST
                              (CONS NIL (CONS 1 (|IrrRepSymNatPackage;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|IrrRepSymNatPackage|)))))))))) 

(DEFUN |IrrRepSymNatPackage;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|IrrRepSymNatPackage|) . #1=(|IrrRepSymNatPackage|))
          (LETT $ (GETREFV 48) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|IrrRepSymNatPackage| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6 NIL)
          (QSETREFV $ 7 0)
          (QSETREFV $ 8 NIL)
          (QSETREFV $ 9 NIL)
          (QSETREFV $ 10 0)
          (QSETREFV $ 11 0)
          (QSETREFV $ 12 0)
          (QSETREFV $ 13 (MAKE_MATRIX1 1 1 0))
          $))) 

(MAKEPROP '|IrrRepSymNatPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|oldlambda| '|flambda| '|younglist|
              '|lprime| '|n| '|rows| '|columns| '|aId| (|Integer|)
              (|Matrix| 14) (0 . |setelt!|) (8 . |elt|) (|Boolean|) (|List| 14)
              (15 . =) (|PartitionsAndPermutations|) (21 . |conjugate|)
              (|List| 15) (|SymmetricGroupCombinatoricFunctions|)
              (26 . |listYoungTableaus|) (|Permutation| 14) (31 . |eval|)
              (37 . |elt|) (43 . |copy|) (|NonNegativeInteger|) (48 . <=)
              (54 . |elt|) (60 . <=) (66 . >) (|Vector| 18) (72 . |setelt!|)
              (79 . |member?|) (|IntegerCombinatoricFunctions| 14)
              (85 . |factorial|)
              |IRSN;dimensionOfIrreducibleRepresentation;LNni;7| (90 . *)
              |IRSN;irreducibleRepresentation;LPM;8| (96 . |One|)
              (100 . |cycle|) (|List| 26)
              |IRSN;irreducibleRepresentation;LLL;10|
              |IRSN;irreducibleRepresentation;LL;9|)
           '#(|irreducibleRepresentation| 105
              |dimensionOfIrreducibleRepresentation| 122)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 47
                                                 '(4 15 14 0 14 14 14 16 3 15
                                                   14 0 14 14 17 2 19 18 0 0 20
                                                   1 21 19 19 22 1 24 23 19 25
                                                   2 26 14 0 14 27 2 23 15 0 14
                                                   28 1 15 0 0 29 2 30 18 0 0
                                                   31 2 19 14 0 14 32 2 14 18 0
                                                   0 33 2 14 18 0 0 34 3 35 18
                                                   0 14 18 36 2 35 18 18 0 37 1
                                                   38 14 14 39 2 15 0 0 0 41 0
                                                   26 0 43 1 26 0 19 44 2 0 15
                                                   19 26 42 2 0 23 19 45 46 1 0
                                                   23 19 47 1 0 30 19 40)))))
           '|lookupComplete|)) 

(MAKEPROP '|IrrRepSymNatPackage| 'NILADIC T) 
