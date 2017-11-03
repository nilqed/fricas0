
(SDEFUN |SHP;delta| ((|int1| |NonNegativeInteger|) ($ R))
        (SPROG ((#1=#:G716 NIL))
               (SPADCALL (SPADCALL (|spadConstant| $ 8) (QREFELT $ 10))
                         (PROG2
                             (LETT #1#
                                   (SPADCALL (* |int1| (+ |int1| 1)) 2
                                             (QREFELT $ 13))
                                   |SHP;delta|)
                             (QCDR #1#)
                           (|check_union2| (QEQCAR #1# 0)
                                           (|NonNegativeInteger|)
                                           (|Union| (|NonNegativeInteger|)
                                                    "failed")
                                           #1#))
                         (QREFELT $ 14)))) 

(SDEFUN |SHP;polsth1|
        ((|p1| UP) (|p| |NonNegativeInteger|) (|p2| UP)
         (|q| |NonNegativeInteger|) (|c1| R) ($ |List| UP))
        (SPROG
         ((|List2| (|List| UP)) (|Pr6| (UP)) (#1=#:G818 NIL) (#2=#:G831 NIL)
          (|j| NIL) (|List1| (|List| UP)) (|Listf| (|List| UP)) (#3=#:G803 NIL)
          (|Pr5| (UP)) (#4=#:G802 NIL) (#5=#:G800 NIL) (|Pr4| (UP))
          (#6=#:G753 NIL) (|Pr3| (UP)) (#7=#:G739 NIL)
          (|r| (|NonNegativeInteger|)) (|c2| (R)) (|Pr2| (UP)) (#8=#:G724 NIL)
          (|Pr1| (UP)) (|sc1| (R)))
         (SEQ
          (LETT |sc1| (SPADCALL (SPADCALL |c1| (QREFELT $ 16)) (QREFELT $ 17))
                . #9=(|SHP;polsth1|))
          (LETT |Pr1|
                (SPADCALL
                 (SPADCALL (SPADCALL |p1| (QREFELT $ 18)) |p2| (QREFELT $ 19))
                 |p1| (QREFELT $ 20))
                . #9#)
          (LETT |Pr2|
                (PROG2
                    (LETT #8#
                          (SPADCALL |Pr1| (SPADCALL |c1| |q| (QREFELT $ 14))
                                    (QREFELT $ 21))
                          . #9#)
                    (QCDR #8#)
                  (|check_union2| (QEQCAR #8# 0) (QREFELT $ 7)
                                  (|Union| (QREFELT $ 7) "failed") #8#))
                . #9#)
          (LETT |c2| (SPADCALL |Pr2| (QREFELT $ 22)) . #9#)
          (LETT |r| (SPADCALL |Pr2| (QREFELT $ 23)) . #9#)
          (LETT |Pr3|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL |sc1|
                            (PROG1 (LETT #7# (- (- |p| |r|) 1) . #9#)
                              (|check_subtype2| (>= #7# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #7#))
                            (QREFELT $ 14))
                  0 (QREFELT $ 25))
                 |p1| (QREFELT $ 19))
                . #9#)
          (LETT |Pr4|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL |sc1|
                            (PROG1 (LETT #6# (- (- |p| |r|) 1) . #9#)
                              (|check_subtype2| (>= #6# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #6#))
                            (QREFELT $ 14))
                  0 (QREFELT $ 25))
                 |Pr2| (QREFELT $ 19))
                . #9#)
          (LETT |Listf| (LIST |Pr3| |Pr4|) . #9#)
          (COND
           ((< |r| (- |p| 1))
            (SEQ
             (LETT |Pr5|
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (|SHP;delta|
                       (PROG1 (LETT #5# (- (- |p| |r|) 1) . #9#)
                         (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #5#))
                       $)
                      (SPADCALL |c2|
                                (PROG1 (LETT #4# (- (- |p| |r|) 1) . #9#)
                                  (|check_subtype2| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #4#))
                                (QREFELT $ 14))
                      (QREFELT $ 26))
                     0 (QREFELT $ 25))
                    |Pr2| (QREFELT $ 19))
                   . #9#)
             (LETT |Listf|
                   (SPADCALL |Listf|
                             (SPADCALL
                              (PROG1 (LETT #3# (- (- |p| |r|) 2) . #9#)
                                (|check_subtype2| (>= #3# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #3#))
                              (|spadConstant| $ 27) (QREFELT $ 29))
                             (QREFELT $ 30))
                   . #9#)
             (EXIT
              (LETT |Listf| (SPADCALL |Listf| (LIST |Pr5|) (QREFELT $ 30))
                    . #9#)))))
          (LETT |List1|
                (COND
                 ((SPADCALL |Pr1| (|spadConstant| $ 27) (QREFELT $ 32))
                  |Listf|)
                 ('T
                  (SPADCALL (SPADCALL |p1| |Pr2| (QREFELT $ 35))
                            (QREFELT $ 36))))
                . #9#)
          (LETT |List2| NIL . #9#)
          (SEQ (LETT |j| 0 . #9#) (LETT #2# (- |r| 1) . #9#) G190
               (COND ((|greater_SI| |j| #2#) (GO G191)))
               (SEQ
                (LETT |Pr6|
                      (SPADCALL
                       (SPADCALL
                        (|SHP;delta|
                         (PROG1 (LETT #1# (- (- |p| |j|) 1) . #9#)
                           (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #1#))
                         $)
                        0 (QREFELT $ 25))
                       (SPADCALL |List1| (+ |j| 1) (QREFELT $ 37))
                       (QREFELT $ 19))
                      . #9#)
                (EXIT
                 (LETT |List2| (SPADCALL (LIST |Pr6|) |List2| (QREFELT $ 30))
                       . #9#)))
               (LETT |j| (|inc_SI| |j|) . #9#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |Listf| |List2| (QREFELT $ 30)))))) 

(SDEFUN |SHP;polsth2|
        ((|p1| UP) (|p| |NonNegativeInteger|) (|p2| UP)
         (|q| |NonNegativeInteger|) (|c1| R) ($ |List| UP))
        (SPROG
         ((|List2| (|List| UP)) (|Pr5| (UP)) (#1=#:G840 NIL) (|Pr4| (UP))
          (#2=#:G838 NIL) (#3=#:G846 NIL) (|j| NIL)
          (|sres| (|PrimitiveArray| UP)) (|Listf| (|List| UP)) (|Pr3| (UP))
          (|Pr2| (UP)) (|Pr1| (UP)) (|sc1| (R)))
         (SEQ
          (LETT |sc1| (SPADCALL (SPADCALL |c1| (QREFELT $ 16)) (QREFELT $ 17))
                . #4=(|SHP;polsth2|))
          (LETT |Pr1|
                (SPADCALL (SPADCALL |sc1| 0 (QREFELT $ 25)) |p1|
                          (QREFELT $ 19))
                . #4#)
          (LETT |Pr2|
                (SPADCALL (SPADCALL |p1| (QREFELT $ 18)) |p2| (QREFELT $ 19))
                . #4#)
          (LETT |Pr3|
                (SPADCALL (SPADCALL |sc1| 0 (QREFELT $ 25)) |Pr2|
                          (QREFELT $ 19))
                . #4#)
          (LETT |Listf| (LIST |Pr1| |Pr3|) . #4#)
          (LETT |sres| (SPADCALL |p1| |Pr2| (QREFELT $ 35)) . #4#)
          (LETT |List2| NIL . #4#)
          (SEQ (LETT |j| 0 . #4#) (LETT #3# (- |p| 2) . #4#) G190
               (COND ((|greater_SI| |j| #3#) (GO G191)))
               (SEQ
                (LETT |Pr4|
                      (SPADCALL
                       (SPADCALL
                        (|SHP;delta|
                         (PROG1 (LETT #2# (- (- |p| |j|) 1) . #4#)
                           (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #2#))
                         $)
                        0 (QREFELT $ 25))
                       (QAREF1 |sres| |j|) (QREFELT $ 19))
                      . #4#)
                (LETT |Pr5|
                      (PROG2
                          (LETT #1# (SPADCALL |Pr4| |c1| (QREFELT $ 21)) . #4#)
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                        (|Union| (QREFELT $ 7) "failed") #1#))
                      . #4#)
                (EXIT
                 (LETT |List2| (SPADCALL (LIST |Pr5|) |List2| (QREFELT $ 30))
                       . #4#)))
               (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |Listf| |List2| (QREFELT $ 30)))))) 

(SDEFUN |SHP;polsth3|
        ((|p1| UP) (|p| |NonNegativeInteger|) (|p2| UP)
         (|q| |NonNegativeInteger|) (|c1| R) ($ |List| UP))
        (SPROG
         ((|List2| (|List| UP)) (|Pr3| (UP)) (#1=#:G858 NIL) (|Pr2| (UP))
          (#2=#:G856 NIL) (#3=#:G864 NIL) (#4=#:G849 NIL) (|j| NIL)
          (|sres| (|PrimitiveArray| UP)) (|Listf| (|List| UP)) (|Pr1| (UP))
          (|v| (|NonNegativeInteger|)) (|q1| (|NonNegativeInteger|))
          (#5=#:G847 NIL) (|sc1| (R)))
         (SEQ
          (LETT |sc1| (SPADCALL (SPADCALL |c1| (QREFELT $ 16)) (QREFELT $ 17))
                . #6=(|SHP;polsth3|))
          (LETT |q1|
                (PROG1 (LETT #5# (- |q| 1) . #6#)
                  (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #5#))
                . #6#)
          (LETT |v| (+ |p| |q1|) . #6#)
          (LETT |Pr1|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (|SHP;delta| |q1| $)
                            (SPADCALL |sc1| (+ |q| 1) (QREFELT $ 14))
                            (QREFELT $ 26))
                  0 (QREFELT $ 25))
                 |p1| (QREFELT $ 19))
                . #6#)
          (LETT |Listf| (LIST |Pr1|) . #6#)
          (LETT |sres|
                (SPADCALL
                 (SPADCALL (SPADCALL |p1| (QREFELT $ 18)) |p2| (QREFELT $ 19))
                 |p1| (QREFELT $ 35))
                . #6#)
          (LETT |List2| NIL . #6#)
          (SEQ (LETT |j| 0 . #6#)
               (LETT #3#
                     (PROG1 (LETT #4# (- |p| 1) . #6#)
                       (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #4#))
                     . #6#)
               G190 (COND ((|greater_SI| |j| #3#) (GO G191)))
               (SEQ
                (LETT |Pr2|
                      (SPADCALL
                       (SPADCALL
                        (|SHP;delta|
                         (PROG1 (LETT #2# (- |v| |j|) . #6#)
                           (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #2#))
                         $)
                        0 (QREFELT $ 25))
                       (QAREF1 |sres| |j|) (QREFELT $ 19))
                      . #6#)
                (LETT |Pr3|
                      (PROG2
                          (LETT #1# (SPADCALL |Pr2| |c1| (QREFELT $ 21)) . #6#)
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                        (|Union| (QREFELT $ 7) "failed") #1#))
                      . #6#)
                (EXIT
                 (LETT |List2| (SPADCALL (LIST |Pr3|) |List2| (QREFELT $ 30))
                       . #6#)))
               (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |Listf| |List2| (QREFELT $ 30)))))) 

(SDEFUN |SHP;SturmHabichtSequence;2UPL;5| ((|p1| UP) (|p2| UP) ($ |List| UP))
        (SPROG ((|c1| (R)) (|q| #1=(|NonNegativeInteger|)) (|p| #1#))
               (SEQ
                (LETT |p| (SPADCALL |p1| (QREFELT $ 23))
                      . #2=(|SHP;SturmHabichtSequence;2UPL;5|))
                (LETT |q| (SPADCALL |p2| (QREFELT $ 23)) . #2#)
                (LETT |c1| (SPADCALL |p1| (QREFELT $ 22)) . #2#)
                (COND
                 ((OR (SPADCALL |c1| (|spadConstant| $ 8) (QREFELT $ 38))
                      (EQL |q| 1))
                  (EXIT (|SHP;polsth1| |p1| |p| |p2| |q| |c1| $))))
                (EXIT
                 (COND ((EQL |q| 0) (|SHP;polsth2| |p1| |p| |p2| |q| |c1| $))
                       ('T (|SHP;polsth3| |p1| |p| |p2| |q| |c1| $))))))) 

(SDEFUN |SHP;SturmHabichtCoefficients;2UPL;6|
        ((|p1| UP) (|p2| UP) ($ |List| R))
        (SPROG
         ((#1=#:G867 NIL) (#2=#:G872 NIL) (|p| NIL) (#3=#:G873 NIL) (|j| NIL)
          (#4=#:G871 NIL) (|qp| (|NonNegativeInteger|)) (|List1| (|List| UP)))
         (SEQ
          (LETT |List1| (SPADCALL |p1| |p2| (QREFELT $ 39))
                . #5=(|SHP;SturmHabichtCoefficients;2UPL;6|))
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
                                    (QREFELT $ 40))
                          #4#)
                         . #5#)))
                 (LETT #2# (PROG1 (CDR #2#) (LETT |j| (|inc_SI| |j|) . #5#))
                       . #5#)
                 (GO G190) G191 (EXIT (NREVERSE #4#)))))))) 

(SDEFUN |SHP;variation| ((|Lsig| |List| R) ($ |Integer|))
        (SPROG ((|List1| (|List| R)) (|sig1| (R)) (|elt2| (R)) (|elt1| (R)))
               (SEQ
                (COND ((SPADCALL |Lsig| 1 (QREFELT $ 43)) 0)
                      (#1='T
                       (SEQ
                        (LETT |elt1| (|SPADfirst| |Lsig|)
                              . #2=(|SHP;variation|))
                        (LETT |elt2| (SPADCALL |Lsig| 2 (QREFELT $ 44)) . #2#)
                        (LETT |sig1|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL |elt1| |elt2| (QREFELT $ 26))
                                (QREFELT $ 16))
                               (QREFELT $ 17))
                              . #2#)
                        (LETT |List1| (CDR |Lsig|) . #2#)
                        (EXIT
                         (COND
                          ((SPADCALL |sig1| (|spadConstant| $ 8)
                                     (QREFELT $ 38))
                           (|SHP;variation| |List1| $))
                          (#1# (+ 1 (|SHP;variation| |List1| $))))))))))) 

(SDEFUN |SHP;permanence| ((|Lsig| |List| R) ($ |Integer|))
        (SPROG ((|List1| (|List| R)) (|sig1| (R)) (|elt2| (R)) (|elt1| (R)))
               (SEQ
                (COND ((SPADCALL |Lsig| 1 (QREFELT $ 43)) 0)
                      (#1='T
                       (SEQ
                        (LETT |elt1| (|SPADfirst| |Lsig|)
                              . #2=(|SHP;permanence|))
                        (LETT |elt2| (SPADCALL |Lsig| 2 (QREFELT $ 44)) . #2#)
                        (LETT |sig1|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL |elt1| |elt2| (QREFELT $ 26))
                                (QREFELT $ 16))
                               (QREFELT $ 17))
                              . #2#)
                        (LETT |List1| (CDR |Lsig|) . #2#)
                        (EXIT
                         (COND
                          ((SPADCALL |sig1|
                                     (SPADCALL (|spadConstant| $ 8)
                                               (QREFELT $ 10))
                                     (QREFELT $ 38))
                           (|SHP;permanence| |List1| $))
                          (#1# (+ 1 (|SHP;permanence| |List1| $))))))))))) 

(SDEFUN |SHP;qzeros| ((|Lsig| |List| R) ($ |List| R))
        (SEQ (LETT |Lsig| (REVERSE |Lsig|) . #1=(|SHP;qzeros|))
             (SEQ G190
                  (COND
                   ((NULL
                     (SPADCALL (|SPADfirst| |Lsig|) (|spadConstant| $ 24)
                               (QREFELT $ 38)))
                    (GO G191)))
                  (SEQ (EXIT (LETT |Lsig| (CDR |Lsig|) . #1#))) NIL (GO G190)
                  G191 (EXIT NIL))
             (EXIT (NREVERSE |Lsig|)))) 

(SDEFUN |SHP;epsil|
        ((|int1| |NonNegativeInteger|) (|elt1| R) (|elt2| R) ($ |Integer|))
        (SPROG
         ((|ct4| (|Integer|)) (|ct3| (|NonNegativeInteger|)) (#1=#:G886 NIL)
          (|ct2| #2=(|Integer|)) (|ct1| #2#))
         (SEQ
          (COND ((OR (EQL |int1| 0) (ODDP |int1|)) 0)
                ('T
                 (SEQ
                  (LETT |ct1|
                        (COND
                         ((SPADCALL |elt1| (|spadConstant| $ 24)
                                    (QREFELT $ 45))
                          1)
                         (#3='T -1))
                        . #4=(|SHP;epsil|))
                  (LETT |ct2|
                        (COND
                         ((SPADCALL |elt2| (|spadConstant| $ 24)
                                    (QREFELT $ 45))
                          1)
                         (#3# -1))
                        . #4#)
                  (LETT |ct3|
                        (PROG2
                            (LETT #1# (SPADCALL |int1| 2 (QREFELT $ 13)) . #4#)
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
              (SPADCALL (|SPADfirst| |Lsig|) (|spadConstant| $ 24)
                        (QREFELT $ 38)))
          0)
         ('T (+ 1 (|SHP;numbnce| (CDR |Lsig|) $))))) 

(SDEFUN |SHP;numbce| ((|Lsig| |List| R) ($ |NonNegativeInteger|))
        (COND
         ((OR (NULL |Lsig|)
              (SPADCALL (|SPADfirst| |Lsig|) (|spadConstant| $ 24)
                        (QREFELT $ 46)))
          0)
         ('T (+ 1 (|SHP;numbce| (CDR |Lsig|) $))))) 

(SDEFUN |SHP;wfunctaux| ((|Lsig| . #1=(|List| R)) ($ |Integer|))
        (SPROG
         ((|ind4| (|Integer|)) (|ind3| (|Integer|)) (|ind2| (|Integer|))
          (|List1| #1#) (#2=#:G904 NIL) (|j| NIL)
          (|cont2| (|NonNegativeInteger|)) (|List2| (|List| R)) (#3=#:G903 NIL)
          (|cont1| (|NonNegativeInteger|)))
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
                                            (QREFELT $ 47))
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
                       ((SPADCALL |cont2| 0 (QREFELT $ 48))
                        (LETT |ind2|
                              (|SHP;epsil| |cont2|
                               (SPADCALL |List2| (QREFELT $ 49))
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

(SDEFUN |SHP;SturmHabicht;2UPI;15| ((|p1| UP) (|p2| UP) ($ |Integer|))
        (SPROG
         ((#1=#:G912 NIL) (|p| NIL) (#2=#:G911 NIL) (|List1| (|List| UP)))
         (SEQ
          (COND
           ((OR (SPADCALL |p2| (|spadConstant| $ 27) (QREFELT $ 32))
                (EQL (SPADCALL |p1| (QREFELT $ 23)) 0))
            0)
           ('T
            (SEQ
             (LETT |List1| (SPADCALL |p1| |p2| (QREFELT $ 39))
                   . #3=(|SHP;SturmHabicht;2UPI;15|))
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
                       (LETT #2# (CONS (SPADCALL |p| (QREFELT $ 22)) #2#)
                             . #3#)))
                     (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                     (EXIT (NREVERSE #2#))))
               $)))))))) 

(SDEFUN |SHP;countRealRoots;UPI;16| ((|p1| UP) ($ |Integer|))
        (SPADCALL |p1| (|spadConstant| $ 9) (QREFELT $ 50))) 

(SDEFUN |SHP;SturmHabichtMultiple;2UPI;17| ((|p1| UP) (|p2| UP) ($ |Integer|))
        (SPROG
         ((#1=#:G946 NIL) (|f| NIL) (#2=#:G945 NIL)
          (|sqfr|
           (|List|
            (|Record| (|:| |flg| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |fctr| UP) (|:| |xpnt| (|Integer|)))))
          (SH (|List| UP)) (|ans| (|Integer|)) (#3=#:G914 NIL) (#4=#:G943 NIL)
          (|p| NIL) (#5=#:G944 NIL) (|j| NIL) (#6=#:G942 NIL)
          (|qp| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((OR (SPADCALL |p2| (|spadConstant| $ 27) (QREFELT $ 32))
                (EQL (SPADCALL |p1| (QREFELT $ 23)) 0))
            0)
           ('T
            (SEQ
             (LETT SH (SPADCALL |p1| |p2| (QREFELT $ 39))
                   . #7=(|SHP;SturmHabichtMultiple;2UPI;17|))
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
                                             (QREFELT $ 40))
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
                     (SPADCALL (|SPADfirst| SH) (|spadConstant| $ 27)
                               (QREFELT $ 32)))
                    (GO G191)))
                  (SEQ (EXIT (LETT SH (CDR SH) . #7#))) NIL (GO G190) G191
                  (EXIT NIL))
             (EXIT
              (COND ((EQL (SPADCALL (|SPADfirst| SH) (QREFELT $ 23)) 0) |ans|)
                    ((QEQCAR
                      (SPADCALL (SPADCALL |p1| (QREFELT $ 18)) (|SPADfirst| SH)
                                (QREFELT $ 52))
                      0)
                     (+ |ans| (SPADCALL (|SPADfirst| SH) |p2| (QREFELT $ 53))))
                    ('T
                     (SEQ
                      (LETT |sqfr|
                            (SPADCALL (SPADCALL |p1| (QREFELT $ 55))
                                      (QREFELT $ 60))
                            . #7#)
                      (COND
                       ((EQL (LENGTH |sqfr|) 1)
                        (COND
                         ((EQL (QVELT (|SPADfirst| |sqfr|) 2) 1)
                          (EXIT |ans|)))))
                      (EXIT
                       (SPADCALL (ELT $ 61)
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
                                                             (QREFELT $ 50)))
                                                #2#)
                                               . #7#)))
                                       (LETT #1# (CDR #1#) . #7#) (GO G190)
                                       G191 (EXIT (NREVERSE #2#))))
                                 (QREFELT $ 64))))))))))))) 

(SDEFUN |SHP;countRealRootsMultiple;UPI;18| ((|p1| UP) ($ |Integer|))
        (SPADCALL |p1| (|spadConstant| $ 9) (QREFELT $ 53))) 

(DECLAIM (NOTINLINE |SturmHabichtPackage;|)) 

(DEFUN |SturmHabichtPackage| (&REST #1=#:G948)
  (SPROG NIL
         (PROG (#2=#:G949)
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
          (LETT $ (GETREFV 66) . #1#)
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
             (QSETREFV $ 53
                       (CONS
                        (|dispatchFunction| |SHP;SturmHabichtMultiple;2UPI;17|)
                        $))
             (QSETREFV $ 65
                       (CONS
                        (|dispatchFunction|
                         |SHP;countRealRootsMultiple;UPI;18|)
                        $)))))
          $))) 

(MAKEPROP '|SturmHabichtPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . |One|)
              (4 . |One|) (8 . -) (|Union| $ '"failed") (|NonNegativeInteger|)
              (13 . |exquo|) (19 . ^) (|Integer|) (25 . |sign|) (30 . |coerce|)
              (35 . |differentiate|) (40 . *) (46 . |pseudoRemainder|)
              (52 . |exquo|) (58 . |leadingCoefficient|) (63 . |degree|)
              (68 . |Zero|) (72 . |monomial|) (78 . *) (84 . |Zero|) (|List| 7)
              (88 . |new|) (94 . |append|) (|Boolean|) (100 . =)
              (|PrimitiveArray| 7) (|SubResultantPackage| 6 7)
              (106 . |subresultantVector|) (112 . |parts|) (117 . |elt|)
              (123 . =) |SHP;SturmHabichtSequence;2UPL;5| (129 . |coefficient|)
              (|List| 6) |SHP;SturmHabichtCoefficients;2UPL;6| (135 . |size?|)
              (141 . |elt|) (147 . >) (153 . ~=) (159 . |append|) (165 . >)
              (171 . |last|) |SHP;SturmHabicht;2UPI;15|
              |SHP;countRealRoots;UPI;16| (176 . |exquo|)
              (182 . |SturmHabichtMultiple|) (|Factored| $)
              (188 . |squareFree|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 56) (|:| |fctr| 7) (|:| |xpnt| 15))
              (|List| 57) (|Factored| 7) (193 . |factorList|) (198 . +)
              (|Mapping| 15 15 15) (|List| 15) (204 . |reduce|)
              (210 . |countRealRootsMultiple|))
           '#(|countRealRootsMultiple| 215 |countRealRoots| 220
              |SturmHabichtSequence| 225 |SturmHabichtMultiple| 231
              |SturmHabichtCoefficients| 237 |SturmHabicht| 243)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 65
                                                 '(0 6 0 8 0 7 0 9 1 6 0 0 10 2
                                                   12 11 0 0 13 2 6 0 0 12 14 1
                                                   6 15 0 16 1 6 0 15 17 1 7 0
                                                   0 18 2 7 0 0 0 19 2 7 0 0 0
                                                   20 2 7 11 0 6 21 1 7 6 0 22
                                                   1 7 12 0 23 0 6 0 24 2 7 0 6
                                                   12 25 2 6 0 0 0 26 0 7 0 27
                                                   2 28 0 12 7 29 2 28 0 0 0 30
                                                   2 7 31 0 0 32 2 34 33 7 7 35
                                                   1 33 28 0 36 2 28 7 0 15 37
                                                   2 6 31 0 0 38 2 7 6 0 12 40
                                                   2 41 31 0 12 43 2 41 6 0 15
                                                   44 2 6 31 0 0 45 2 6 31 0 0
                                                   46 2 41 0 0 0 47 2 12 31 0 0
                                                   48 1 41 6 0 49 2 7 11 0 0 52
                                                   2 0 15 7 7 53 1 7 54 0 55 1
                                                   59 58 0 60 2 15 0 0 0 61 2
                                                   63 15 62 0 64 1 0 15 7 65 1
                                                   1 15 7 65 1 0 15 7 51 2 0 28
                                                   7 7 39 2 1 15 7 7 53 2 0 41
                                                   7 7 42 2 0 15 7 7 50)))))
           '|lookupComplete|)) 
