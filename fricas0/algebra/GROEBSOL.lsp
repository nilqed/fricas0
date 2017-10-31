
(SDEFUN |GROEBSOL;testPower|
        ((|uf| |SparseUnivariatePolynomial|
          (|DistributedMultivariatePolynomial| |lv| F))
         (|x| |OrderedVariableList| |lv|)
         (|lpol| |List| (|DistributedMultivariatePolynomial| |lv| F))
         ($ |Union| (|DistributedMultivariatePolynomial| |lv| F) #1="failed"))
        (SPROG
         ((|g| (|DistributedMultivariatePolynomial| |lv| F))
          (|linp|
           (|SparseUnivariatePolynomial|
            (|DistributedMultivariatePolynomial| |lv| F)))
          (|lc| (|DistributedMultivariatePolynomial| |lv| F)) (#2=#:G720 NIL)
          (|trailp| (|DistributedMultivariatePolynomial| |lv| F))
          (|gg| (|DistributedMultivariatePolynomial| |lv| F))
          (|testquo|
           (|Union| (|DistributedMultivariatePolynomial| |lv| F) "failed"))
          (#3=#:G723 NIL) (|df| (|NonNegativeInteger|)))
         (SEQ
          (LETT |df| (SPADCALL |uf| (QREFELT $ 12))
                . #4=(|GROEBSOL;testPower|))
          (LETT |trailp|
                (SPADCALL |uf|
                          (PROG1 (LETT #3# (- |df| 1) . #4#)
                            (|check_subtype2| (>= #3# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #3#))
                          (QREFELT $ 16))
                . #4#)
          (LETT |testquo|
                (SPADCALL |trailp| (SPADCALL |df| (QREFELT $ 18))
                          (QREFELT $ 20))
                . #4#)
          (EXIT
           (COND ((QEQCAR |testquo| 1) (CONS 1 "failed"))
                 (#5='T
                  (SEQ (LETT |trailp| (QCDR |testquo|) . #4#)
                       (LETT |gg|
                             (SPADCALL
                              (LETT |lc| (SPADCALL |uf| (QREFELT $ 21)) . #4#)
                              |trailp| (QREFELT $ 22))
                             . #4#)
                       (LETT |trailp|
                             (PROG2
                                 (LETT #2#
                                       (SPADCALL |trailp| |gg| (QREFELT $ 23))
                                       . #4#)
                                 (QCDR #2#)
                               (|check_union2| (QEQCAR #2# 0)
                                               (|DistributedMultivariatePolynomial|
                                                (QREFELT $ 6) (QREFELT $ 7))
                                               (|Union|
                                                (|DistributedMultivariatePolynomial|
                                                 (QREFELT $ 6) (QREFELT $ 7))
                                                #1#)
                                               #2#))
                             . #4#)
                       (LETT |lc|
                             (PROG2
                                 (LETT #2# (SPADCALL |lc| |gg| (QREFELT $ 23))
                                       . #4#)
                                 (QCDR #2#)
                               (|check_union2| (QEQCAR #2# 0)
                                               (|DistributedMultivariatePolynomial|
                                                (QREFELT $ 6) (QREFELT $ 7))
                                               (|Union|
                                                (|DistributedMultivariatePolynomial|
                                                 (QREFELT $ 6) (QREFELT $ 7))
                                                #1#)
                                               #2#))
                             . #4#)
                       (LETT |linp|
                             (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 24))
                                       (SPADCALL |trailp| 0 (QREFELT $ 24))
                                       (QREFELT $ 25))
                             . #4#)
                       (LETT |g|
                             (SPADCALL
                              (SPADCALL |uf|
                                        (SPADCALL |linp| |df| (QREFELT $ 26))
                                        (QREFELT $ 27))
                              |x| (QREFELT $ 30))
                             . #4#)
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |g| |lpol| (QREFELT $ 33))
                                    (|spadConstant| $ 34) (QREFELT $ 36))
                          (CONS 1 "failed"))
                         (#5#
                          (CONS 0
                                (SPADCALL |linp| |x| (QREFELT $ 30))))))))))))) 

(SDEFUN |GROEBSOL;testGenPos|
        ((|lpol| |List| (|DistributedMultivariatePolynomial| |lv| F))
         (|lvar| |List| (|OrderedVariableList| |lv|))
         ($ |Union| (|List| (|DistributedMultivariatePolynomial| |lv| F))
          "failed"))
        (SPROG
         ((#1=#:G742 NIL) (|rlvar| (|List| (|OrderedVariableList| |lv|)))
          (|newlpol| (|List| #2=(|DistributedMultivariatePolynomial| |lv| F)))
          (|g| (|Union| (|DistributedMultivariatePolynomial| |lv| F) "failed"))
          (|fi|
           (|SparseUnivariatePolynomial|
            (|DistributedMultivariatePolynomial| |lv| F)))
          (|x| (|OrderedVariableList| |lv|)) (#3=#:G743 NIL) (|f| #2#)
          (|rlpol| (|List| (|DistributedMultivariatePolynomial| |lv| F))))
         (SEQ
          (EXIT
           (SEQ (LETT |rlpol| (REVERSE |lpol|) . #4=(|GROEBSOL;testGenPos|))
                (LETT |f| (|SPADfirst| |rlpol|) . #4#)
                (EXIT
                 (COND ((EQL (LENGTH |lvar|) 1) (CONS 0 (LIST |f|)))
                       ('T
                        (SEQ (LETT |rlvar| (CDR (REVERSE |lvar|)) . #4#)
                             (LETT |newlpol| (LIST |f|) . #4#)
                             (SEQ (LETT |f| NIL . #4#)
                                  (LETT #3# (CDR |rlpol|) . #4#) G190
                                  (COND
                                   ((OR (ATOM #3#)
                                        (PROGN (LETT |f| (CAR #3#) . #4#) NIL))
                                    (GO G191)))
                                  (SEQ (LETT |x| (|SPADfirst| |rlvar|) . #4#)
                                       (LETT |fi|
                                             (SPADCALL |f| |x| (QREFELT $ 37))
                                             . #4#)
                                       (EXIT
                                        (COND
                                         ((QEQCAR
                                           (SPADCALL
                                            (SPADCALL |fi| (QREFELT $ 21))
                                            (QREFELT $ 39))
                                           1)
                                          (SEQ
                                           (SEQ
                                            (LETT |g|
                                                  (|GROEBSOL;testPower| |fi|
                                                   |x| |newlpol| $)
                                                  . #4#)
                                            (EXIT
                                             (COND
                                              ((QEQCAR |g| 1)
                                               (PROGN
                                                (LETT #1# (CONS 1 "failed")
                                                      . #4#)
                                                (GO #5=#:G741))))))
                                           (LETT |newlpol|
                                                 (CONS
                                                  (SPADCALL (QCDR |g|)
                                                            |newlpol|
                                                            (QREFELT $ 33))
                                                  |newlpol|)
                                                 . #4#)
                                           (EXIT
                                            (LETT |rlvar| (CDR |rlvar|)
                                                  . #4#))))
                                         ((SPADCALL
                                           (SPADCALL |f| |newlpol|
                                                     (QREFELT $ 33))
                                           (|spadConstant| $ 34)
                                           (QREFELT $ 36))
                                          (PROGN
                                           (LETT #1# (CONS 1 "failed") . #4#)
                                           (GO #5#))))))
                                  (LETT #3# (CDR #3#) . #4#) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT (CONS 0 |newlpol|))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |GROEBSOL;genPos|
        ((|lp| |List| (|DistributedMultivariatePolynomial| |lv| F))
         (|lvar| |List| (|OrderedVariableList| |lv|))
         ($ |Record|
          (|:| |polys|
               (|List|
                (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (|:| |lpolys| (|List| (|DistributedMultivariatePolynomial| |lv| F)))
          (|:| |coord| (|List| (|Integer|)))
          (|:| |univp|
               (|HomogeneousDistributedMultivariatePolynomial| |lv| F))))
        (SPROG
         ((#1=#:G729 NIL) (|testfail| (|Boolean|))
          (|gb1|
           (|Union| (|List| (|DistributedMultivariatePolynomial| |lv| F))
                    #2="failed"))
          (|gbt| (|List| (|DistributedMultivariatePolynomial| |lv| F)))
          (|gb|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (#3=#:G770 NIL) (|p| NIL) (#4=#:G769 NIL)
          (|val| #5=(|HomogeneousDistributedMultivariatePolynomial| |lv| F))
          (#6=#:G750 NIL) (#7=#:G749 #5#) (#8=#:G751 #5#) (#9=#:G767 NIL)
          (|vv| NIL) (#10=#:G768 NIL) (|rv| NIL)
          (|ranvals| (|List| (|Integer|))) (#11=#:G766 NIL) (#12=#:G765 NIL)
          (|count| NIL) (|rlvar| (|List| (|OrderedVariableList| |lv|)))
          (|x| (|OrderedVariableList| |lv|))
          (|lnp|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (#13=#:G764 NIL) (|f| NIL) (#14=#:G763 NIL))
         (SEQ (LETT |rlvar| (REVERSE |lvar|) . #15=(|GROEBSOL;genPos|))
              (LETT |lnp|
                    (PROGN
                     (LETT #14# NIL . #15#)
                     (SEQ (LETT |f| NIL . #15#) (LETT #13# |lp| . #15#) G190
                          (COND
                           ((OR (ATOM #13#)
                                (PROGN (LETT |f| (CAR #13#) . #15#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #14#
                                  (CONS (SPADCALL |f| (QREFELT $ 42)) #14#)
                                  . #15#)))
                          (LETT #13# (CDR #13#) . #15#) (GO G190) G191
                          (EXIT (NREVERSE #14#))))
                    . #15#)
              (LETT |x| (|SPADfirst| |rlvar|) . #15#)
              (LETT |rlvar| (CDR |rlvar|) . #15#) (LETT |testfail| 'T . #15#)
              (SEQ (LETT |count| 1 . #15#) G190
                   (COND ((NULL |testfail|) (GO G191)))
                   (SEQ
                    (LETT |ranvals|
                          (PROGN
                           (LETT #12# NIL . #15#)
                           (SEQ (LETT |vv| NIL . #15#)
                                (LETT #11# |rlvar| . #15#) G190
                                (COND
                                 ((OR (ATOM #11#)
                                      (PROGN
                                       (LETT |vv| (CAR #11#) . #15#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #12#
                                        (CONS
                                         (+ 1
                                            (RANDOM
                                             (* |count| (LENGTH |lvar|))))
                                         #12#)
                                        . #15#)))
                                (LETT #11# (CDR #11#) . #15#) (GO G190) G191
                                (EXIT (NREVERSE #12#))))
                          . #15#)
                    (LETT |val|
                          (PROGN
                           (LETT #6# NIL . #15#)
                           (SEQ (LETT |rv| NIL . #15#)
                                (LETT #10# |ranvals| . #15#)
                                (LETT |vv| NIL . #15#)
                                (LETT #9# |rlvar| . #15#) G190
                                (COND
                                 ((OR (ATOM #9#)
                                      (PROGN (LETT |vv| (CAR #9#) . #15#) NIL)
                                      (ATOM #10#)
                                      (PROGN
                                       (LETT |rv| (CAR #10#) . #15#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #8#
                                         (SPADCALL |rv|
                                                   (SPADCALL |vv|
                                                             (QREFELT $ 43))
                                                   (QREFELT $ 44))
                                         . #15#)
                                   (COND
                                    (#6#
                                     (LETT #7#
                                           (SPADCALL #7# #8# (QREFELT $ 45))
                                           . #15#))
                                    ('T
                                     (PROGN
                                      (LETT #7# #8# . #15#)
                                      (LETT #6# 'T . #15#)))))))
                                (LETT #9#
                                      (PROG1 (CDR #9#)
                                        (LETT #10# (CDR #10#) . #15#))
                                      . #15#)
                                (GO G190) G191 (EXIT NIL))
                           (COND (#6# #7#) ('T (|spadConstant| $ 46))))
                          . #15#)
                    (LETT |val|
                          (SPADCALL |val| (SPADCALL |x| (QREFELT $ 43))
                                    (QREFELT $ 45))
                          . #15#)
                    (LETT |gb|
                          (PROGN
                           (LETT #4# NIL . #15#)
                           (SEQ (LETT |p| NIL . #15#) (LETT #3# |lnp| . #15#)
                                G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |p| (CAR #3#) . #15#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #4#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |p| |x| (QREFELT $ 47))
                                          |val| (QREFELT $ 49))
                                         #4#)
                                        . #15#)))
                                (LETT #3# (CDR #3#) . #15#) (GO G190) G191
                                (EXIT (NREVERSE #4#))))
                          . #15#)
                    (LETT |gb| (SPADCALL |gb| (QREFELT $ 52)) . #15#)
                    (LETT |gbt| (SPADCALL |gb| (QREFELT $ 54)) . #15#)
                    (LETT |gb1| (|GROEBSOL;testGenPos| |gbt| |lvar| $) . #15#)
                    (EXIT
                     (COND ((QEQCAR |gb1| 1) "try again")
                           ('T (LETT |testfail| NIL . #15#)))))
                   (LETT |count| (|inc_SI| |count|) . #15#) (GO G190) G191
                   (EXIT NIL))
              (EXIT
               (VECTOR |gb| |gbt| |ranvals|
                       (SPADCALL
                        (SPADCALL
                         (PROG2 (LETT #1# |gb1| . #15#)
                             (QCDR #1#)
                           (|check_union2| (QEQCAR #1# 0)
                                           (|List|
                                            (|DistributedMultivariatePolynomial|
                                             (QREFELT $ 6) (QREFELT $ 7)))
                                           (|Union|
                                            (|List|
                                             (|DistributedMultivariatePolynomial|
                                              (QREFELT $ 6) (QREFELT $ 7)))
                                            #2#)
                                           #1#))
                         (QREFELT $ 55))
                        (QREFELT $ 42))))))) 

(SDEFUN |GROEBSOL;genericPosition;LLR;4|
        ((|lp| |List| (|DistributedMultivariatePolynomial| |lv| F))
         (|lvar| |List| (|OrderedVariableList| |lv|))
         ($ |Record|
          (|:| |dpolys| (|List| (|DistributedMultivariatePolynomial| |lv| F)))
          (|:| |coords| (|List| (|Integer|)))))
        (SPROG
         ((|nans|
           (|Record|
            (|:| |polys|
                 (|List|
                  (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
            (|:| |lpolys|
                 (|List| (|DistributedMultivariatePolynomial| |lv| F)))
            (|:| |coord| (|List| (|Integer|)))
            (|:| |univp|
                 (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))))
         (SEQ
          (LETT |nans| (|GROEBSOL;genPos| |lp| |lvar| $)
                |GROEBSOL;genericPosition;LLR;4|)
          (EXIT (CONS (QVELT |nans| 1) (QVELT |nans| 2)))))) 

(SDEFUN |GROEBSOL;select|
        ((|lup| |List|
          (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
         ($
          . #1=(|List|
                (|List|
                 (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))))
        (SPROG
         ((#2=#:G776 NIL) (#3=#:G775 #1#) (#4=#:G777 #1#) (#5=#:G782 NIL)
          (|lsel| NIL) (#6=#:G781 NIL) (#7=#:G780 NIL) (|f| NIL))
         (SEQ
          (COND
           ((SPADCALL |lup| NIL (QREFELT $ 60)) (SPADCALL NIL (QREFELT $ 61)))
           (#8='T
            (PROGN
             (LETT #2# NIL . #9=(|GROEBSOL;select|))
             (SEQ (LETT |f| NIL . #9#) (LETT #7# (|SPADfirst| |lup|) . #9#)
                  G190
                  (COND
                   ((OR (ATOM #7#) (PROGN (LETT |f| (CAR #7#) . #9#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4#
                           (PROGN
                            (LETT #6# NIL . #9#)
                            (SEQ (LETT |lsel| NIL . #9#)
                                 (LETT #5# (|GROEBSOL;select| (CDR |lup|) $)
                                       . #9#)
                                 G190
                                 (COND
                                  ((OR (ATOM #5#)
                                       (PROGN
                                        (LETT |lsel| (CAR #5#) . #9#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #6# (CONS (CONS |f| |lsel|) #6#)
                                         . #9#)))
                                 (LETT #5# (CDR #5#) . #9#) (GO G190) G191
                                 (EXIT (NREVERSE #6#))))
                           . #9#)
                     (COND
                      (#2# (LETT #3# (SPADCALL #3# #4# (QREFELT $ 62)) . #9#))
                      ('T (PROGN (LETT #3# #4# . #9#) (LETT #2# 'T . #9#)))))))
                  (LETT #7# (CDR #7#) . #9#) (GO G190) G191 (EXIT NIL))
             (COND (#2# #3#) (#8# NIL)))))))) 

(SDEFUN |GROEBSOL;findCompon|
        ((|leq| |List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
         (|lvar| |List| (|OrderedVariableList| |lv|))
         ($ |List| (|List| (|DistributedMultivariatePolynomial| |lv| F))))
        (SPROG
         ((#1=#:G816 NIL) (|ll| NIL) (#2=#:G815 NIL)
          (|ans|
           (|List| #3=(|List| (|DistributedMultivariatePolynomial| |lv| F))))
          (#4=#:G814 NIL) (|p| NIL) (#5=#:G813 NIL) (#6=#:G812 NIL) (|lp| NIL)
          (#7=#:G811 NIL)
          (|val| #8=(|HomogeneousDistributedMultivariatePolynomial| |lv| F))
          (#9=#:G797 NIL) (#10=#:G796 #8#) (#11=#:G798 #8#) (#12=#:G809 NIL)
          (|vv| NIL) (#13=#:G810 NIL) (|rv| NIL)
          (|rlvar| (|List| (|OrderedVariableList| |lv|)))
          (|x| (|OrderedVariableList| |lv|)) (|ranvals| (|List| (|Integer|)))
          (|result|
           (|List|
            (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))))
          (|tlfact|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (#14=#:G808 NIL) (|tfact| NIL)
          (|lfact|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (#15=#:G807 NIL) (|ff| NIL) (#16=#:G806 NIL)
          (|fg|
           (|Factored|
            (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (|g| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
          (|lgp|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (|gp|
           (|Record|
            (|:| |polys|
                 (|List|
                  (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
            (|:| |lpolys|
                 (|List| (|DistributedMultivariatePolynomial| |lv| F)))
            (|:| |coord| (|List| (|Integer|)))
            (|:| |univp|
                 (|HomogeneousDistributedMultivariatePolynomial| |lv| F))))
          (|teq| #3#))
         (SEQ
          (LETT |teq| (SPADCALL |leq| (QREFELT $ 54))
                . #17=(|GROEBSOL;findCompon|))
          (EXIT
           (COND ((EQL (LENGTH |teq|) (LENGTH |lvar|)) (LIST |teq|))
                 (#18='T
                  (SEQ (LETT |gp| (|GROEBSOL;genPos| |teq| |lvar| $) . #17#)
                       (LETT |lgp| (QVELT |gp| 0) . #17#)
                       (LETT |g| (QVELT |gp| 3) . #17#)
                       (LETT |fg| (SPADCALL |g| (QREFELT $ 65)) . #17#)
                       (LETT |lfact|
                             (PROGN
                              (LETT #16# NIL . #17#)
                              (SEQ (LETT |ff| NIL . #17#)
                                   (LETT #15# (SPADCALL |fg| (QREFELT $ 68))
                                         . #17#)
                                   G190
                                   (COND
                                    ((OR (ATOM #15#)
                                         (PROGN
                                          (LETT |ff| (CAR #15#) . #17#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #16# (CONS (QCAR |ff|) #16#)
                                           . #17#)))
                                   (LETT #15# (CDR #15#) . #17#) (GO G190) G191
                                   (EXIT (NREVERSE #16#))))
                             . #17#)
                       (LETT |result| NIL . #17#)
                       (EXIT
                        (COND ((EQL (LENGTH |lfact|) 1) (LIST |teq|))
                              (#18#
                               (SEQ
                                (SEQ (LETT |tfact| NIL . #17#)
                                     (LETT #14# |lfact| . #17#) G190
                                     (COND
                                      ((OR (ATOM #14#)
                                           (PROGN
                                            (LETT |tfact| (CAR #14#) . #17#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |tlfact| (CONS |tfact| |lgp|)
                                            . #17#)
                                      (EXIT
                                       (LETT |result| (CONS |tlfact| |result|)
                                             . #17#)))
                                     (LETT #14# (CDR #14#) . #17#) (GO G190)
                                     G191 (EXIT NIL))
                                (LETT |ranvals| (QVELT |gp| 2) . #17#)
                                (LETT |rlvar| (REVERSE |lvar|) . #17#)
                                (LETT |x| (|SPADfirst| |rlvar|) . #17#)
                                (LETT |rlvar| (CDR |rlvar|) . #17#)
                                (LETT |val|
                                      (PROGN
                                       (LETT #9# NIL . #17#)
                                       (SEQ (LETT |rv| NIL . #17#)
                                            (LETT #13# |ranvals| . #17#)
                                            (LETT |vv| NIL . #17#)
                                            (LETT #12# |rlvar| . #17#) G190
                                            (COND
                                             ((OR (ATOM #12#)
                                                  (PROGN
                                                   (LETT |vv| (CAR #12#)
                                                         . #17#)
                                                   NIL)
                                                  (ATOM #13#)
                                                  (PROGN
                                                   (LETT |rv| (CAR #13#)
                                                         . #17#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (PROGN
                                               (LETT #11#
                                                     (SPADCALL |rv|
                                                               (SPADCALL |vv|
                                                                         (QREFELT
                                                                          $
                                                                          43))
                                                               (QREFELT $ 44))
                                                     . #17#)
                                               (COND
                                                (#9#
                                                 (LETT #10#
                                                       (SPADCALL #10# #11#
                                                                 (QREFELT $
                                                                          45))
                                                       . #17#))
                                                ('T
                                                 (PROGN
                                                  (LETT #10# #11# . #17#)
                                                  (LETT #9# 'T . #17#)))))))
                                            (LETT #12#
                                                  (PROG1 (CDR #12#)
                                                    (LETT #13# (CDR #13#)
                                                          . #17#))
                                                  . #17#)
                                            (GO G190) G191 (EXIT NIL))
                                       (COND (#9# #10#)
                                             (#18# (|spadConstant| $ 46))))
                                      . #17#)
                                (LETT |val|
                                      (SPADCALL (SPADCALL |x| (QREFELT $ 43))
                                                |val| (QREFELT $ 69))
                                      . #17#)
                                (LETT |ans|
                                      (PROGN
                                       (LETT #7# NIL . #17#)
                                       (SEQ (LETT |lp| NIL . #17#)
                                            (LETT #6# |result| . #17#) G190
                                            (COND
                                             ((OR (ATOM #6#)
                                                  (PROGN
                                                   (LETT |lp| (CAR #6#) . #17#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #7#
                                                    (CONS
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (PROGN
                                                        (LETT #5# NIL . #17#)
                                                        (SEQ
                                                         (LETT |p| NIL . #17#)
                                                         (LETT #4# |lp| . #17#)
                                                         G190
                                                         (COND
                                                          ((OR (ATOM #4#)
                                                               (PROGN
                                                                (LETT |p|
                                                                      (CAR #4#)
                                                                      . #17#)
                                                                NIL))
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (LETT #5#
                                                                 (CONS
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    |p| |x|
                                                                    (QREFELT $
                                                                             47))
                                                                   |val|
                                                                   (QREFELT $
                                                                            49))
                                                                  #5#)
                                                                 . #17#)))
                                                         (LETT #4# (CDR #4#)
                                                               . #17#)
                                                         (GO G190) G191
                                                         (EXIT
                                                          (NREVERSE #5#))))
                                                       (QREFELT $ 52))
                                                      (QREFELT $ 54))
                                                     #7#)
                                                    . #17#)))
                                            (LETT #6# (CDR #6#) . #17#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #7#))))
                                      . #17#)
                                (EXIT
                                 (PROGN
                                  (LETT #2# NIL . #17#)
                                  (SEQ (LETT |ll| NIL . #17#)
                                       (LETT #1# |ans| . #17#) G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN
                                              (LETT |ll| (CAR #1#) . #17#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (COND
                                          ((SPADCALL |ll|
                                                     (LIST
                                                      (|spadConstant| $ 70))
                                                     (QREFELT $ 71))
                                           (LETT #2# (CONS |ll| #2#)
                                                 . #17#)))))
                                       (LETT #1# (CDR #1#) . #17#) (GO G190)
                                       G191 (EXIT (NREVERSE #2#)))))))))))))))) 

(SDEFUN |GROEBSOL;zeroDim?|
        ((|lp| |List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
         (|lvar| . #1=(|List| (|OrderedVariableList| |lv|))) ($ |Boolean|))
        (SPROG
         ((|lvint1| #1#) (|x| (|OrderedVariableList| |lv|)) (#2=#:G819 NIL)
          (|g| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
          (#3=#:G827 NIL) (|f| NIL) (|n| (|NonNegativeInteger|)))
         (SEQ
          (COND ((NULL |lp|) NIL)
                (#4='T
                 (SEQ (LETT |n| (LENGTH |lvar|) . #5=(|GROEBSOL;zeroDim?|))
                      (EXIT
                       (COND ((< (LENGTH |lp|) |n|) NIL)
                             (#4#
                              (SEQ (LETT |lvint1| |lvar| . #5#)
                                   (SEQ (LETT |f| NIL . #5#)
                                        (LETT #3# |lp| . #5#) G190
                                        (COND
                                         ((OR (ATOM #3#)
                                              (PROGN
                                               (LETT |f| (CAR #3#) . #5#)
                                               NIL)
                                              (NULL (NULL (NULL |lvint1|))))
                                          (GO G191)))
                                        (SEQ
                                         (LETT |g|
                                               (SPADCALL |f|
                                                         (SPADCALL |f|
                                                                   (QREFELT $
                                                                            72))
                                                         (QREFELT $ 69))
                                               . #5#)
                                         (LETT |x|
                                               (PROG2
                                                   (LETT #2#
                                                         (SPADCALL |g|
                                                                   (QREFELT $
                                                                            73))
                                                         . #5#)
                                                   (QCDR #2#)
                                                 (|check_union2| (QEQCAR #2# 0)
                                                                 (|OrderedVariableList|
                                                                  (QREFELT $
                                                                           6))
                                                                 (|Union|
                                                                  (|OrderedVariableList|
                                                                   (QREFELT $
                                                                            6))
                                                                  "failed")
                                                                 #2#))
                                               . #5#)
                                         (EXIT
                                          (COND
                                           ((SPADCALL
                                             (SPADCALL
                                              (SPADCALL |g| |x| (QREFELT $ 47))
                                              (QREFELT $ 74))
                                             (QREFELT $ 75))
                                            (LETT |lvint1|
                                                  (SPADCALL |x| |lvint1|
                                                            (QREFELT $ 76))
                                                  . #5#)))))
                                        (LETT #3# (CDR #3#) . #5#) (GO G190)
                                        G191 (EXIT NIL))
                                   (EXIT (NULL |lvint1|)))))))))))) 

(SDEFUN |GROEBSOL;groebSolve;LLL;8|
        ((|leq| |List| (|DistributedMultivariatePolynomial| |lv| F))
         (|lvar| |List| (|OrderedVariableList| |lv|))
         ($ |List| (|List| (|DistributedMultivariatePolynomial| |lv| F))))
        (SPROG
         ((|result|
           (|List| (|List| (|DistributedMultivariatePolynomial| |lv| F))))
          (|tfact|
           #1=(|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (#2=#:G857 NIL)
          (|lfact|
           (|List|
            (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))))
          (#3=#:G856 NIL) (|ff| NIL) (#4=#:G855 NIL) (#5=#:G854 NIL)
          (|llf| NIL) (#6=#:G853 NIL) (#7=#:G849 NIL)
          (|llfact|
           (|List|
            (|Factored|
             (|HomogeneousDistributedMultivariatePolynomial| |lv| F))))
          (|fg|
           (|Factored|
            (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (|g| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
          (#8=#:G852 NIL) (|x| NIL)
          (|lup|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (|basis|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (|leq1| #1#)
          (|lnp|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (#9=#:G851 NIL) (|f| NIL) (#10=#:G850 NIL))
         (SEQ
          (LETT |lnp|
                (PROGN
                 (LETT #10# NIL . #11=(|GROEBSOL;groebSolve;LLL;8|))
                 (SEQ (LETT |f| NIL . #11#) (LETT #9# |leq| . #11#) G190
                      (COND
                       ((OR (ATOM #9#) (PROGN (LETT |f| (CAR #9#) . #11#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #10# (CONS (SPADCALL |f| (QREFELT $ 42)) #10#)
                              . #11#)))
                      (LETT #9# (CDR #9#) . #11#) (GO G190) G191
                      (EXIT (NREVERSE #10#))))
                . #11#)
          (LETT |leq1| (SPADCALL |lnp| (QREFELT $ 52)) . #11#)
          (COND
           ((EQL (LENGTH |leq1|) 1)
            (COND
             ((SPADCALL (|SPADfirst| |leq1|) (|spadConstant| $ 77)
                        (QREFELT $ 78))
              (EXIT (SPADCALL NIL (QREFELT $ 80)))))))
          (COND
           ((NULL (|GROEBSOL;zeroDim?| |leq1| |lvar| $))
            (EXIT
             (|error| "system does not have a finite number of solutions"))))
          (LETT |basis| (SPADCALL |leq1| (QREFELT $ 81)) . #11#)
          (LETT |lup| NIL . #11#) (LETT |llfact| NIL . #11#)
          (SEQ
           (EXIT
            (SEQ (LETT |x| NIL . #11#) (LETT #8# |lvar| . #11#) G190
                 (COND
                  ((OR (ATOM #8#) (PROGN (LETT |x| (CAR #8#) . #11#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |g| (SPADCALL |leq1| |basis| |x| (QREFELT $ 82))
                        . #11#)
                  (LETT |fg| (SPADCALL |g| (QREFELT $ 65)) . #11#)
                  (LETT |llfact| (CONS |fg| |llfact|) . #11#)
                  (EXIT
                   (COND
                    ((EQL (SPADCALL |g| |x| (QREFELT $ 83)) (LENGTH |basis|))
                     (PROGN (LETT #7# |$NoValue| . #11#) (GO #12=#:G833))))))
                 (LETT #8# (CDR #8#) . #11#) (GO G190) G191 (EXIT NIL)))
           #12# (EXIT #7#))
          (LETT |result| NIL . #11#)
          (LETT |lfact|
                (|GROEBSOL;select|
                 (PROGN
                  (LETT #6# NIL . #11#)
                  (SEQ (LETT |llf| NIL . #11#) (LETT #5# |llfact| . #11#) G190
                       (COND
                        ((OR (ATOM #5#)
                             (PROGN (LETT |llf| (CAR #5#) . #11#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #6#
                               (CONS
                                (PROGN
                                 (LETT #4# NIL . #11#)
                                 (SEQ (LETT |ff| NIL . #11#)
                                      (LETT #3# (SPADCALL |llf| (QREFELT $ 68))
                                            . #11#)
                                      G190
                                      (COND
                                       ((OR (ATOM #3#)
                                            (PROGN
                                             (LETT |ff| (CAR #3#) . #11#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #4# (CONS (QCAR |ff|) #4#)
                                              . #11#)))
                                      (LETT #3# (CDR #3#) . #11#) (GO G190)
                                      G191 (EXIT (NREVERSE #4#))))
                                #6#)
                               . #11#)))
                       (LETT #5# (CDR #5#) . #11#) (GO G190) G191
                       (EXIT (NREVERSE #6#))))
                 $)
                . #11#)
          (SEQ (LETT |tfact| NIL . #11#) (LETT #2# |lfact| . #11#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |tfact| (CAR #2#) . #11#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |tfact|
                      (SPADCALL (SPADCALL |tfact| |leq1| (QREFELT $ 84))
                                (QREFELT $ 52))
                      . #11#)
                (EXIT
                 (COND
                  ((SPADCALL |tfact| (LIST (|spadConstant| $ 77))
                             (QREFELT $ 85))
                   "next value")
                  ('T
                   (LETT |result|
                         (SPADCALL |result|
                                   (|GROEBSOL;findCompon| |tfact| |lvar| $)
                                   (QREFELT $ 86))
                         . #11#)))))
               (LETT #2# (CDR #2#) . #11#) (GO G190) G191 (EXIT NIL))
          (EXIT |result|)))) 

(SDEFUN |GROEBSOL;testDim;LLU;9|
        ((|leq| |List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
         (|lvar| |List| (|OrderedVariableList| |lv|))
         ($ |Union|
          (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
          "failed"))
        (SPROG
         ((|leq1|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))))
         (SEQ
          (LETT |leq1| (SPADCALL |leq| (QREFELT $ 52))
                |GROEBSOL;testDim;LLU;9|)
          (COND
           ((EQL (LENGTH |leq1|) 1)
            (COND
             ((SPADCALL (|SPADfirst| |leq1|) (|spadConstant| $ 77)
                        (QREFELT $ 78))
              (EXIT (CONS 0 NIL))))))
          (COND
           ((NULL (|GROEBSOL;zeroDim?| |leq1| |lvar| $))
            (EXIT (CONS 1 "failed"))))
          (EXIT (CONS 0 |leq1|))))) 

(DECLAIM (NOTINLINE |GroebnerSolve;|)) 

(DEFUN |GroebnerSolve| (&REST #1=#:G869)
  (SPROG NIL
         (PROG (#2=#:G870)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|GroebnerSolve|)
                                               '|domainEqualList|)
                    . #3=(|GroebnerSolve|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |GroebnerSolve;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|GroebnerSolve|)))))))))) 

(DEFUN |GroebnerSolve;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|GroebnerSolve|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|GroebnerSolve| DV$1 DV$2 DV$3) . #1#)
          (LETT $ (GETREFV 90) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|GroebnerSolve|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 9 (LENGTH |#1|))
          $))) 

(MAKEPROP '|GroebnerSolve| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) '|nv| (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| 15) (0 . |degree|) (5 . |One|)
              (9 . |One|) (|DistributedMultivariatePolynomial| 6 7)
              (13 . |coefficient|) (|Integer|) (19 . |coerce|)
              (|Union| $ '"failed") (24 . |exquo|) (30 . |leadingCoefficient|)
              (35 . |gcd|) (41 . |exquo|) (47 . |monomial|) (53 . +) (59 . ^)
              (65 . -) (|SparseUnivariatePolynomial| $)
              (|OrderedVariableList| 6) (71 . |multivariate|) (|List| 15)
              (|GroebnerInternalPackage| 7
                                         (|DirectProduct|
                                          (NRTEVAL (LENGTH (QREFELT $ 6))) 10)
                                         29 15)
              (77 . |redPol|) (83 . |Zero|) (|Boolean|) (87 . ~=)
              (93 . |univariate|) (|Union| 29 '"failed") (99 . |mainVariable|)
              (|HomogeneousDistributedMultivariatePolynomial| 6 7)
              (|PolToPol| 6 7) (104 . |dmpToHdmp|) (109 . |coerce|) (114 . *)
              (120 . +) (126 . |Zero|) (130 . |univariate|)
              (|SparseUnivariatePolynomial| 40) (136 . |elt|) (|List| 40)
              (|GroebnerPackage| 7
                                 (|HomogeneousDirectProduct|
                                  (NRTEVAL (LENGTH (QREFELT $ 6))) 10)
                                 29 40)
              (142 . |groebner|) (|LinGroebnerPackage| 6 7) (147 . |totolex|)
              (152 . |last|)
              (|Record| (|:| |dpolys| 31) (|:| |coords| (|List| 17)))
              (|List| 29) |GROEBSOL;genericPosition;LLR;4| (|List| 50)
              (157 . =) (163 . |list|) (168 . |append|) (|Factored| 40)
              (|GeneralizedMultivariateFactorize| 29
                                                  (|HomogeneousDirectProduct|
                                                   (NRTEVAL
                                                    (LENGTH (QREFELT $ 6)))
                                                   10)
                                                  8 7 40)
              (174 . |factor|) (|Record| (|:| |factor| 40) (|:| |exponent| 17))
              (|List| 66) (179 . |factors|) (184 . -) (190 . |One|) (194 . ~=)
              (200 . |reductum|) (205 . |mainVariable|)
              (210 . |leadingCoefficient|) (215 . |ground?|) (220 . |remove|)
              (226 . |One|) (230 . =) (|List| 31) (236 . |list|)
              (241 . |computeBasis|) (246 . |minPol|) (253 . |degree|)
              (259 . |concat|) (265 . =) (271 . |concat|)
              |GROEBSOL;groebSolve;LLL;8| (|Union| 50 '"failed")
              |GROEBSOL;testDim;LLU;9|)
           '#(|testDim| 277 |groebSolve| 283 |genericPosition| 289) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 89
                                                 '(1 11 10 0 12 0 7 0 13 0 8 0
                                                   14 2 11 15 0 10 16 1 7 0 17
                                                   18 2 15 19 0 7 20 1 11 15 0
                                                   21 2 15 0 0 0 22 2 15 19 0 0
                                                   23 2 11 0 15 10 24 2 11 0 0
                                                   0 25 2 11 0 0 10 26 2 11 0 0
                                                   0 27 2 15 0 28 29 30 2 32 15
                                                   15 31 33 0 15 0 34 2 15 35 0
                                                   0 36 2 15 28 0 29 37 1 15 38
                                                   0 39 1 41 40 15 42 1 40 0 29
                                                   43 2 40 0 17 0 44 2 40 0 0 0
                                                   45 0 40 0 46 2 40 28 0 29 47
                                                   2 48 40 0 40 49 1 51 50 50
                                                   52 1 53 31 50 54 1 31 15 0
                                                   55 2 59 35 0 0 60 1 59 0 50
                                                   61 2 59 0 0 0 62 1 64 63 40
                                                   65 1 63 67 0 68 2 40 0 0 0
                                                   69 0 15 0 70 2 31 35 0 0 71
                                                   1 40 0 0 72 1 40 38 0 73 1
                                                   48 40 0 74 1 40 35 0 75 2 57
                                                   0 29 0 76 0 40 0 77 2 40 35
                                                   0 0 78 1 79 0 31 80 1 53 50
                                                   50 81 3 53 40 50 50 29 82 2
                                                   40 10 0 29 83 2 50 0 0 0 84
                                                   2 50 35 0 0 85 2 79 0 0 0 86
                                                   2 0 88 50 57 89 2 0 79 31 57
                                                   87 2 0 56 31 57 58)))))
           '|lookupComplete|)) 
