
(SDEFUN |SIMPC;simplicialComplex;LNniL$;1|
        ((|v| |List| VS) (|numPoints| |NonNegativeInteger|)
         (|fs| |List| (|List| (|NonNegativeInteger|))) ($ $))
        (SPROG ((|res| (|List| (|OrientedFacet|))) (#1=#:G739 NIL) (|f| NIL))
               (SEQ (LETT |res| NIL . #2=(|SIMPC;simplicialComplex;LNniL$;1|))
                    (SEQ (LETT |f| NIL . #2#) (LETT #1# |fs| . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |f| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (SPADCALL |res|
                                           (SPADCALL 1 |f| (QREFELT $ 11))
                                           (QREFELT $ 13))
                                 . #2#)))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT (VECTOR |v| |numPoints| |res|))))) 

(SDEFUN |SIMPC;simplicialComplex;LL$;2|
        ((|v| |List| VS) (|fs| |List| (|List| (|NonNegativeInteger|))) ($ $))
        (SPROG
         ((|numPoints| (|NonNegativeInteger|)) (|m| (|NonNegativeInteger|))
          (#1=#:G746 NIL) (|fac| NIL) (|facs| (|List| (|OrientedFacet|)))
          (#2=#:G745 NIL) (|f| NIL))
         (SEQ (LETT |facs| NIL . #3=(|SIMPC;simplicialComplex;LL$;2|))
              (SEQ (LETT |f| NIL . #3#) (LETT #2# |fs| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |facs|
                           (SPADCALL |facs| (SPADCALL 1 |f| (QREFELT $ 11))
                                     (QREFELT $ 13))
                           . #3#)))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (LETT |numPoints| 0 . #3#)
              (SEQ (LETT |fac| NIL . #3#) (LETT #1# |facs| . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |fac| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ (LETT |m| (SPADCALL |fac| (QREFELT $ 18)) . #3#)
                        (EXIT
                         (COND
                          ((SPADCALL |m| |numPoints| (QREFELT $ 20))
                           (LETT |numPoints| |m| . #3#)))))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT (VECTOR |v| |numPoints| |facs|))))) 

(SDEFUN |SIMPC;simplicialComplex;L$;3| ((|v| |List| VS) ($ $))
        (SPROG ((|res| (|List| (|OrientedFacet|))))
               (SEQ (LETT |res| NIL |SIMPC;simplicialComplex;L$;3|)
                    (EXIT (VECTOR |v| 0 |res|))))) 

(SDEFUN |SIMPC;simplicialComplexIfCan;DcU;4|
        ((|dc| |DeltaComplex| VS) ($ |Union| $ "failed"))
        (SPADCALL |dc| NIL (QREFELT $ 26))) 

(SDEFUN |SIMPC;simplicialComplexIfCan;DcBU;5|
        ((|dc| |DeltaComplex| VS) (|trace| |Boolean|) ($ |Union| $ "failed"))
        (SPROG
         ((|res| (|List| (|OrientedFacet|))) (#1=#:G783 NIL) (|r| NIL)
          (|orf| (|OrientedFacet|)) (#2=#:G777 NIL)
          (|orfx| (|Union| (|OrientedFacet|) "failed"))
          (|subFacets| (|List| (|OrientedFacet|)))
          (|deleteList| (|List| (|OrientedFacet|)))
          (|subFacet2| (|OrientedFacet|)) (|m| (|Integer|))
          (|subFacet| (|OrientedFacet|)) (|ind| (|NonNegativeInteger|))
          (#3=#:G764 NIL) (#4=#:G782 NIL) (|i| NIL) (#5=#:G781 NIL)
          (|facet| NIL) (|thisPoint| #6=(|NonNegativeInteger|)) (#7=#:G780 NIL)
          (|NumPoints| #6#) (|lastMap| (|List| (|List| (|OrientedFacet|))))
          (#8=#:G778 NIL) (|map| NIL) (#9=#:G779 NIL) (|grade| NIL)
          (|maps| (|List| (|List| (|List| (|Integer|)))))
          (|vertset| #10=(|List| VS))
          (|dcrep|
           (|Record| (|:| VERTSET #10#)
                     (|:| MAPS (|List| (|List| (|List| (|Integer|))))))))
         (SEQ
          (EXIT
           (SEQ
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL
                (SPADCALL (SPADCALL "simplicialComplex(" (QREFELT $ 30))
                          (SPADCALL |dc| (QREFELT $ 31)) (QREFELT $ 32))
                (SPADCALL ")" (QREFELT $ 30)) (QREFELT $ 32))
               (QREFELT $ 34))))
            (LETT |dcrep| |dc| . #11=(|SIMPC;simplicialComplexIfCan;DcBU;5|))
            (LETT |NumPoints| 0 . #11#) (LETT |vertset| (QCAR |dcrep|) . #11#)
            (LETT |maps| (REVERSE (QCDR |dcrep|)) . #11#)
            (LETT |res| NIL . #11#) (LETT |deleteList| NIL . #11#)
            (LETT |lastMap| NIL . #11#)
            (SEQ (LETT |grade| 1 . #11#) (LETT #9# (LENGTH |maps|) . #11#)
                 (LETT |map| NIL . #11#) (LETT #8# |maps| . #11#) G190
                 (COND
                  ((OR (ATOM #8#) (PROGN (LETT |map| (CAR #8#) . #11#) NIL)
                       (|greater_SI| |grade| #9#))
                   (GO G191)))
                 (SEQ
                  (LETT |lastMap| (SPADCALL |lastMap| NIL (QREFELT $ 36))
                        . #11#)
                  (COND
                   (|trace|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL "simplicialComplex map=" (QREFELT $ 37))
                          (SPADCALL |map| (QREFELT $ 39)) (QREFELT $ 32))
                         (SPADCALL " grade=" (QREFELT $ 37)) (QREFELT $ 32))
                        (SPADCALL |grade| (QREFELT $ 40)) (QREFELT $ 32))
                       (SPADCALL " lastMap=" (QREFELT $ 37)) (QREFELT $ 32))
                      (SPADCALL |lastMap| (QREFELT $ 41)) (QREFELT $ 32))
                     (QREFELT $ 34))))
                  (COND
                   ((EQL |grade| 1)
                    (SEQ (LETT |NumPoints| (LENGTH |map|) . #11#)
                         (LETT |thisPoint| 0 . #11#)
                         (EXIT
                          (SEQ (LETT |facet| NIL . #11#)
                               (LETT #7# |map| . #11#) G190
                               (COND
                                ((OR (ATOM #7#)
                                     (PROGN
                                      (LETT |facet| (CAR #7#) . #11#)
                                      NIL))
                                 (GO G191)))
                               (SEQ (LETT |thisPoint| (+ |thisPoint| 1) . #11#)
                                    (EXIT
                                     (COND
                                      ((NULL (NULL |facet|))
                                       (SEQ
                                        (LETT |orf|
                                              (SPADCALL (LIST |thisPoint|)
                                                        (QREFELT $ 43))
                                              . #11#)
                                        (COND
                                         (|trace|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL
                                               "simplicialComplex add point="
                                               (QREFELT $ 30))
                                              (SPADCALL |orf| (QREFELT $ 44))
                                              (QREFELT $ 32))
                                             (SPADCALL " from face="
                                                       (QREFELT $ 30))
                                             (QREFELT $ 32))
                                            (SPADCALL |facet| (QREFELT $ 45))
                                            (QREFELT $ 32))
                                           (QREFELT $ 34))))
                                        (LETT |res|
                                              (SPADCALL |res| |orf|
                                                        (QREFELT $ 13))
                                              . #11#)
                                        (EXIT
                                         (SPADCALL |lastMap| |grade|
                                                   (SPADCALL
                                                    (SPADCALL |lastMap| |grade|
                                                              (QREFELT $ 46))
                                                    |orf| (QREFELT $ 13))
                                                   (QREFELT $ 47))))))))
                               (LETT #7# (CDR #7#) . #11#) (GO G190) G191
                               (EXIT NIL))))))
                  (EXIT
                   (COND
                    ((SPADCALL |grade| 1 (QREFELT $ 20))
                     (SEQ (LETT |facet| NIL . #11#) (LETT #5# |map| . #11#)
                          G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |facet| (CAR #5#) . #11#) NIL))
                            (GO G191)))
                          (SEQ (LETT |subFacets| NIL . #11#)
                               (SEQ (LETT |i| NIL . #11#)
                                    (LETT #4# |facet| . #11#) G190
                                    (COND
                                     ((OR (ATOM #4#)
                                          (PROGN
                                           (LETT |i| (CAR #4#) . #11#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (LETT |ind|
                                           (PROG1 (LETT #3# (ABS |i|) . #11#)
                                             (|check_subtype2| (>= #3# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #3#))
                                           . #11#)
                                     (LETT |subFacet|
                                           (SPADCALL
                                            (SPADCALL |lastMap| (- |grade| 1)
                                                      (QREFELT $ 46))
                                            |ind| (QREFELT $ 48))
                                           . #11#)
                                     (LETT |m| (COND ((< |i| 1) -1) ('T 1))
                                           . #11#)
                                     (LETT |subFacet2|
                                           (SPADCALL |m| |subFacet|
                                                     (QREFELT $ 49))
                                           . #11#)
                                     (LETT |deleteList|
                                           (SPADCALL |deleteList| |subFacet|
                                                     (QREFELT $ 13))
                                           . #11#)
                                     (EXIT
                                      (LETT |subFacets|
                                            (SPADCALL |subFacets| |subFacet2|
                                                      (QREFELT $ 13))
                                            . #11#)))
                                    (LETT #4# (CDR #4#) . #11#) (GO G190) G191
                                    (EXIT NIL))
                               (LETT |orfx|
                                     (SPADCALL |subFacets| (QREFELT $ 51))
                                     . #11#)
                               (COND
                                ((QEQCAR |orfx| 1)
                                 (PROGN
                                  (LETT #2# (CONS 1 "failed") . #11#)
                                  (GO #12=#:G776))))
                               (LETT |orf| (QCDR |orfx|) . #11#)
                               (LETT |res|
                                     (SPADCALL |res| |orf| (QREFELT $ 13))
                                     . #11#)
                               (EXIT
                                (SPADCALL |lastMap| |grade|
                                          (SPADCALL
                                           (SPADCALL |lastMap| |grade|
                                                     (QREFELT $ 46))
                                           |orf| (QREFELT $ 13))
                                          (QREFELT $ 47))))
                          (LETT #5# (CDR #5#) . #11#) (GO G190) G191
                          (EXIT NIL))))))
                 (LETT #8#
                       (PROG1 (CDR #8#)
                         (LETT |grade| (|inc_SI| |grade|) . #11#))
                       . #11#)
                 (GO G190) G191 (EXIT NIL))
            (SEQ (LETT |r| NIL . #11#) (LETT #1# |deleteList| . #11#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#) . #11#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |res| (SPADCALL |r| |res| (QREFELT $ 52)) . #11#)))
                 (LETT #1# (CDR #1#) . #11#) (GO G190) G191 (EXIT NIL))
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL
                (SPADCALL "simplicialComplex construct res=" (QREFELT $ 30))
                (SPADCALL |res| (QREFELT $ 53)) (QREFELT $ 32))
               (QREFELT $ 34))))
            (EXIT (CONS 0 (VECTOR |vertset| |NumPoints| |res|)))))
          #12# (EXIT #2#)))) 

(SDEFUN |SIMPC;addSimplex;$Of$;6| ((|a| $) (|f| |OrientedFacet|) ($ $))
        (SPROG
         ((|numPoints| (|NonNegativeInteger|)) (|max| (|NonNegativeInteger|))
          (#1=#:G796 NIL) (|orf2| NIL) (|res2| (|List| (|OrientedFacet|)))
          (#2=#:G795 NIL) (|orf| NIL) (|res| (|List| (|OrientedFacet|)))
          (|found| (|Boolean|)) (|m| (|Integer|)) (#3=#:G794 NIL))
         (SEQ (LETT |res| (QVELT |a| 2) . #4=(|SIMPC;addSimplex;$Of$;6|))
              (LETT |found| NIL . #4#)
              (SEQ (LETT |orf| NIL . #4#) (LETT #3# |res| . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |orf| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |orf| (QREFELT $ 54))
                                 (SPADCALL |f| (QREFELT $ 54)) (QREFELT $ 55))
                       (SEQ
                        (LETT |m|
                              (+ (SPADCALL |orf| (QREFELT $ 56))
                                 (SPADCALL |f| (QREFELT $ 56)))
                              . #4#)
                        (SPADCALL |orf| |m| (QREFELT $ 57))
                        (EXIT (LETT |found| 'T . #4#)))))))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (COND
               ((NULL |found|)
                (LETT |res| (SPADCALL |res| |f| (QREFELT $ 13)) . #4#)))
              (LETT |res2| NIL . #4#)
              (SEQ (LETT |orf| NIL . #4#) (LETT #2# |res| . #4#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |orf| (CAR #2#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |orf| (QREFELT $ 56)) 0
                                 (QREFELT $ 58))
                       (LETT |res2| (SPADCALL |res2| |orf| (QREFELT $ 13))
                             . #4#)))))
                   (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
              (LETT |numPoints| 0 . #4#)
              (SEQ (LETT |orf2| NIL . #4#) (LETT #1# |res2| . #4#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |orf2| (CAR #1#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (LETT |max| (SPADCALL |orf2| (QREFELT $ 18)) . #4#)
                        (EXIT
                         (COND
                          ((SPADCALL |max| |numPoints| (QREFELT $ 20))
                           (LETT |numPoints| |max| . #4#)))))
                   (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT (VECTOR (QVELT |a| 0) |numPoints| |res2|))))) 

(SDEFUN |SIMPC;maxIndex;$Nni;7| ((|s| $) ($ |NonNegativeInteger|))
        (SPROG
         ((|res| (|NonNegativeInteger|)) (|m| (|NonNegativeInteger|))
          (#1=#:G801 NIL) (|fac| NIL) (|facs| (|List| (|OrientedFacet|))))
         (SEQ (LETT |res| 0 . #2=(|SIMPC;maxIndex;$Nni;7|))
              (LETT |facs| (QVELT |s| 2) . #2#)
              (SEQ (LETT |fac| NIL . #2#) (LETT #1# |facs| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |fac| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (LETT |m| (SPADCALL |fac| (QREFELT $ 18)) . #2#)
                        (EXIT
                         (COND
                          ((SPADCALL |m| |res| (QREFELT $ 20))
                           (LETT |res| |m| . #2#)))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |SIMPC;minIndex;$Nni;8| ((|s| $) ($ |NonNegativeInteger|))
        (SPROG
         ((|res| (|NonNegativeInteger|)) (|m| (|NonNegativeInteger|))
          (#1=#:G809 NIL) (|fac| NIL) (#2=#:G808 NIL)
          (|facs| (|List| (|OrientedFacet|))))
         (SEQ
          (EXIT
           (SEQ (LETT |res| 10000 . #3=(|SIMPC;minIndex;$Nni;8|))
                (LETT |facs| (QVELT |s| 2) . #3#)
                (COND
                 ((EQL (LENGTH |facs|) 0)
                  (PROGN (LETT #2# 0 . #3#) (GO #4=#:G807))))
                (SEQ (LETT |fac| NIL . #3#) (LETT #1# |facs| . #3#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |fac| (CAR #1#) . #3#) NIL))
                       (GO G191)))
                     (SEQ (LETT |m| (SPADCALL |fac| (QREFELT $ 61)) . #3#)
                          (EXIT (COND ((< |m| |res|) (LETT |res| |m| . #3#)))))
                     (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))
          #4# (EXIT #2#)))) 

(SDEFUN |SIMPC;grade;$L;9| ((|s| $) ($ |List| (|List| (|OrientedFacet|))))
        (SPROG
         ((|gr| (|Integer|)) (#1=#:G820 NIL) (|face| NIL)
          (|res| (|List| (|List| (|OrientedFacet|)))) (#2=#:G819 NIL) (|a| NIL)
          (#3=#:G817 NIL) (|maxGrade| (|NonNegativeInteger|)) (#4=#:G818 NIL)
          (|simp| (|List| (|OrientedFacet|))))
         (SEQ
          (EXIT
           (SEQ (LETT |simp| (QVELT |s| 2) . #5=(|SIMPC;grade;$L;9|))
                (LETT |maxGrade| 0 . #5#)
                (SEQ (LETT |face| NIL . #5#) (LETT #4# |simp| . #5#) G190
                     (COND
                      ((OR (ATOM #4#)
                           (PROGN (LETT |face| (CAR #4#) . #5#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |face| (QREFELT $ 63)) |maxGrade|
                                   (QREFELT $ 20))
                         (LETT |maxGrade| (SPADCALL |face| (QREFELT $ 63))
                               . #5#)))))
                     (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                (LETT |res| NIL . #5#)
                (COND
                 ((< |maxGrade| 1)
                  (PROGN (LETT #3# |res| . #5#) (GO #6=#:G816))))
                (SEQ (LETT |a| 1 . #5#) (LETT #2# |maxGrade| . #5#) G190
                     (COND ((|greater_SI| |a| #2#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |res| (SPADCALL |res| NIL (QREFELT $ 36)) . #5#)))
                     (LETT |a| (|inc_SI| |a|) . #5#) (GO G190) G191 (EXIT NIL))
                (SEQ (LETT |face| NIL . #5#) (LETT #1# |simp| . #5#) G190
                     (COND
                      ((OR (ATOM #1#)
                           (PROGN (LETT |face| (CAR #1#) . #5#) NIL))
                       (GO G191)))
                     (SEQ (LETT |gr| (SPADCALL |face| (QREFELT $ 63)) . #5#)
                          (EXIT
                           (COND
                            ((SPADCALL |gr| 0 (QREFELT $ 64))
                             (SPADCALL |res| |gr|
                                       (SPADCALL
                                        (SPADCALL |res| |gr| (QREFELT $ 46))
                                        |face| (QREFELT $ 13))
                                       (QREFELT $ 47))))))
                     (LETT #1# (CDR #1#) . #5#) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))
          #6# (EXIT #3#)))) 

(SDEFUN |SIMPC;sort;2$;10| ((|s| $) ($ $))
        (SPROG ((|fs| (|List| (|OrientedFacet|))) (|v| (|List| VS)))
               (SEQ (LETT |v| (QVELT |s| 0) . #1=(|SIMPC;sort;2$;10|))
                    (LETT |fs| (QVELT |s| 2) . #1#)
                    (EXIT
                     (VECTOR |v| (QVELT |s| 1)
                             (SPADCALL |fs| (QREFELT $ 66))))))) 

(SDEFUN |SIMPC;orderedPermutation|
        ((|lst| |List| (|Integer|)) (|len| |NonNegativeInteger|)
         ($ |List| (|List| (|Integer|))))
        (SPROG
         ((|reslt| (|List| (|List| (|Integer|)))) (|r1| (|List| (|Integer|)))
          (#1=#:G836 NIL) (#2=#:G828 NIL) (|x| NIL)
          (|rst| (|List| (|Integer|))) (|fst| (|Integer|)) (#3=#:G834 NIL)
          (#4=#:G835 NIL) (|y| NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((< |len| 1)
              (PROGN
               (LETT #3# NIL . #5=(|SIMPC;orderedPermutation|))
               (GO #6=#:G833))))
            (COND
             ((SPADCALL |len| (LENGTH |lst|) (QREFELT $ 20))
              (PROGN (LETT #3# NIL . #5#) (GO #6#))))
            (COND
             ((EQL |len| (LENGTH |lst|))
              (PROGN (LETT #3# (LIST |lst|) . #5#) (GO #6#))))
            (LETT |reslt| NIL . #5#)
            (COND
             ((EQL |len| 1)
              (SEQ
               (SEQ (LETT |y| NIL . #5#) (LETT #4# |lst| . #5#) G190
                    (COND
                     ((OR (ATOM #4#) (PROGN (LETT |y| (CAR #4#) . #5#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT |reslt|
                            (SPADCALL |reslt| (LIST |y|) (QREFELT $ 68))
                            . #5#)))
                    (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
               (EXIT (PROGN (LETT #3# |reslt| . #5#) (GO #6#))))))
            (LETT |fst| (|SPADfirst| |lst|) . #5#)
            (LETT |rst| (CDR |lst|) . #5#)
            (SEQ (LETT |x| NIL . #5#)
                 (LETT #1#
                       (|SIMPC;orderedPermutation| |rst|
                        (PROG2
                            (LETT #2# (SPADCALL |len| 1 (QREFELT $ 69)) . #5#)
                            (QCDR #2#)
                          (|check_union2| (QEQCAR #2# 0) (|NonNegativeInteger|)
                                          (|Union| (|NonNegativeInteger|)
                                                   "failed")
                                          #2#))
                        $)
                       . #5#)
                 G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #5#) NIL))
                   (GO G191)))
                 (SEQ (LETT |r1| (CONS |fst| |x|) . #5#)
                      (EXIT
                       (LETT |reslt| (SPADCALL |reslt| |r1| (QREFELT $ 68))
                             . #5#)))
                 (LETT #1# (CDR #1#) . #5#) (GO G190) G191 (EXIT NIL))
            (LETT |reslt|
                  (SPADCALL |reslt| (|SIMPC;orderedPermutation| |rst| |len| $)
                            (QREFELT $ 70))
                  . #5#)
            (EXIT |reslt|)))
          #6# (EXIT #3#)))) 

(SDEFUN |SIMPC;isNewFace?|
        ((|lst| |List| (|OrientedFacet|)) (|b| |OrientedFacet|) ($ |Boolean|))
        (SPROG ((#1=#:G841 NIL) (#2=#:G842 NIL) (|a| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |a| NIL . #3=(|SIMPC;isNewFace?|))
                       (LETT #2# |lst| . #3#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |a| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |a| |b| (QREFELT $ 71))
                           (PROGN (LETT #1# NIL . #3#) (GO #4=#:G840))))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))
                #4# (EXIT #1#)))) 

(SDEFUN |SIMPC;unorientedUnion|
        ((|a| . #1=(|List| (|OrientedFacet|))) (|b| |List| (|OrientedFacet|))
         ($ |List| (|OrientedFacet|)))
        (SPROG ((|res| #1#) (#2=#:G847 NIL) (|b1| NIL))
               (SEQ (LETT |res| |a| . #3=(|SIMPC;unorientedUnion|))
                    (SEQ (LETT |b1| NIL . #3#) (LETT #2# |b| . #3#) G190
                         (COND
                          ((OR (ATOM #2#)
                               (PROGN (LETT |b1| (CAR #2#) . #3#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((|SIMPC;isNewFace?| |a| |b1| $)
                             (LETT |res| (CONS |b1| |res|) . #3#)))))
                         (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |SIMPC;addImpliedFaces;$L;14|
        ((|s| $) ($ |List| (|List| (|OrientedFacet|))))
        (SPROG
         ((|newFaces| (|List| (|OrientedFacet|)))
          (|len| (|NonNegativeInteger|)) (#1=#:G857 NIL) (|face| NIL)
          (|res| (|List| (|List| (|OrientedFacet|))))
          (|all_faces| (|List| (|OrientedFacet|))) (#2=#:G856 NIL) (|gr| NIL)
          (#3=#:G855 NIL) (|maxGrade| (|NonNegativeInteger|))
          (|inputList| (|List| (|List| (|OrientedFacet|)))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |inputList| (REVERSE (SPADCALL |s| (QREFELT $ 65)))
                  . #4=(|SIMPC;addImpliedFaces;$L;14|))
            (LETT |res| NIL . #4#) (LETT |maxGrade| (LENGTH |inputList|) . #4#)
            (COND
             ((< |maxGrade| 1)
              (SEQ
               (SPADCALL
                (SPADCALL
                 (SPADCALL "addImpliedFaces return because empty"
                           (QREFELT $ 30))
                 (SPADCALL |maxGrade| (QREFELT $ 40)) (QREFELT $ 32))
                (QREFELT $ 34))
               (EXIT (PROGN (LETT #3# |res| . #4#) (GO #5=#:G854))))))
            (LETT |res| NIL . #4#) (LETT |newFaces| NIL . #4#)
            (SEQ (LETT |gr| NIL . #4#) (LETT #2# |inputList| . #4#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |gr| (CAR #2#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |all_faces| (|SIMPC;unorientedUnion| |newFaces| |gr| $)
                        . #4#)
                  (LETT |res| (CONS |all_faces| |res|) . #4#)
                  (LETT |newFaces| NIL . #4#)
                  (EXIT
                   (SEQ (LETT |face| NIL . #4#) (LETT #1# |all_faces| . #4#)
                        G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |face| (CAR #1#) . #4#) NIL))
                          (GO G191)))
                        (SEQ
                         (LETT |len| (- (SPADCALL |face| (QREFELT $ 63)) 1)
                               . #4#)
                         (EXIT
                          (COND
                           ((SPADCALL |len| 0 (QREFELT $ 20))
                            (LETT |newFaces|
                                  (|SIMPC;unorientedUnion| |newFaces|
                                   (SPADCALL |face| |len| |len| (QREFELT $ 72))
                                   $)
                                  . #4#)))))
                        (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))))
                 (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT |res|)))
          #5# (EXIT #3#)))) 

(SDEFUN |SIMPC;boundary;2$;15| ((|s| $) ($ $))
        (SPROG
         ((|res| ($)) (#1=#:G864 NIL) (|y| NIL)
          (|x| (|List| (|OrientedFacet|))) (#2=#:G863 NIL) (|facet| NIL))
         (SEQ
          (LETT |res| (SPADCALL (QVELT |s| 0) (QREFELT $ 23))
                . #3=(|SIMPC;boundary;2$;15|))
          (SEQ (LETT |facet| NIL . #3#) (LETT #2# (QVELT |s| 2) . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |facet| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |x| (SPADCALL |facet| (QREFELT $ 74)) . #3#)
                    (EXIT
                     (SEQ (LETT |y| NIL . #3#) (LETT #1# |x| . #3#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |y| (CAR #1#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT |res| (SPADCALL |res| |y| (QREFELT $ 59))
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |SIMPC;star;$Of$;16| ((|s| $) (|simplex| |OrientedFacet|) ($ $))
        (SPROG
         ((|res| (|List| (|OrientedFacet|))) (#1=#:G869 NIL) (|simp| NIL))
         (SEQ (LETT |res| NIL . #2=(|SIMPC;star;$Of$;16|))
              (SEQ (LETT |simp| NIL . #2#) (LETT #1# (QVELT |s| 2) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |simp| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |simplex| |simp| (QREFELT $ 76))
                       (LETT |res| (SPADCALL |res| |simp| (QREFELT $ 13))
                             . #2#)))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (VECTOR (QVELT |s| 0) (QVELT |s| 1) |res|))))) 

(SDEFUN |SIMPC;link;$Of$;17| ((|s| $) (|simplex| |OrientedFacet|) ($ $))
        (SPROG
         ((|res| (|List| (|OrientedFacet|))) (|x| (|List| (|OrientedFacet|)))
          (#1=#:G875 NIL) (|facet| NIL))
         (SEQ (LETT |res| NIL . #2=(|SIMPC;link;$Of$;17|))
              (SEQ (LETT |facet| NIL . #2#) (LETT #1# (QVELT |s| 2) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |facet| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |simplex| |facet| (QREFELT $ 76))
                       (SEQ (LETT |x| (SPADCALL |facet| (QREFELT $ 74)) . #2#)
                            (EXIT
                             (LETT |res| (SPADCALL |res| |x| (QREFELT $ 78))
                                   . #2#)))))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (VECTOR (QVELT |s| 0) (QVELT |s| 1) |res|))))) 

(SDEFUN |SIMPC;cone;$Nni$;18| ((|s| $) (|vertex| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|res| (|List| (|OrientedFacet|))) (|x| (|OrientedFacet|))
          (#1=#:G880 NIL) (|facet| NIL))
         (SEQ (LETT |res| NIL . #2=(|SIMPC;cone;$Nni$;18|))
              (SEQ (LETT |facet| NIL . #2#) (LETT #1# (QVELT |s| 2) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |facet| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |x| (SPADCALL |facet| |vertex| (QREFELT $ 80)) . #2#)
                    (EXIT
                     (LETT |res| (SPADCALL |res| |x| (QREFELT $ 13)) . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (VECTOR (QVELT |s| 0) (QVELT |s| 1) |res|))))) 

(SDEFUN |SIMPC;refactorIndexes;$Nni$;19|
        ((|a| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|res| (|List| (|OrientedFacet|))) (|r| (|OrientedFacet|))
          (#1=#:G885 NIL) (|facet| NIL))
         (SEQ (LETT |res| NIL . #2=(|SIMPC;refactorIndexes;$Nni$;19|))
              (SEQ (LETT |facet| NIL . #2#) (LETT #1# (QVELT |a| 2) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |facet| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (LETT |r| (SPADCALL |facet| |n| (QREFELT $ 82)) . #2#)
                        (EXIT
                         (LETT |res| (SPADCALL |res| |r| (QREFELT $ 13))
                               . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (VECTOR (QVELT |a| 0) (QVELT |a| 1) |res|))))) 

(SDEFUN |SIMPC;makeDisjoint;3$;20| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((#1=#:G888 NIL) (|maxb| #2=(|NonNegativeInteger|))
          (|minb| #3=(|NonNegativeInteger|)) (|maxa| #2#) (|mina| #3#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |mina| (SPADCALL |a| (QREFELT $ 62))
                  . #4=(|SIMPC;makeDisjoint;3$;20|))
            (LETT |maxa| (SPADCALL |a| (QREFELT $ 60)) . #4#)
            (LETT |minb| (SPADCALL |b| (QREFELT $ 62)) . #4#)
            (LETT |maxb| (SPADCALL |b| (QREFELT $ 60)) . #4#)
            (COND
             ((< |maxa| |minb|) (PROGN (LETT #1# |b| . #4#) (GO #5=#:G887))))
            (COND ((< |maxb| |mina|) (PROGN (LETT #1# |b| . #4#) (GO #5#))))
            (EXIT (SPADCALL |b| |maxa| (QREFELT $ 83)))))
          #5# (EXIT #1#)))) 

(SDEFUN |SIMPC;simplicialJoin;2$B$;21|
        ((|a| $) (|b| $) (|enforceDisjoint| |Boolean|) ($ $))
        (SPROG
         ((|numPoints| (|NonNegativeInteger|)) (|verts| (|List| VS))
          (|res| (|List| (|OrientedFacet|))) (|fac| (|OrientedFacet|))
          (#1=#:G898 NIL) (|y| NIL) (#2=#:G897 NIL) (|x| NIL) (|b2| ($))
          (#3=#:G896 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((NULL (QVELT |a| 2))
              (PROGN
               (LETT #3# |b| . #4=(|SIMPC;simplicialJoin;2$B$;21|))
               (GO #5=#:G895))))
            (COND ((NULL (QVELT |b| 2)) (PROGN (LETT #3# |a| . #4#) (GO #5#))))
            (LETT |b2|
                  (COND (|enforceDisjoint| (SPADCALL |a| |b| (QREFELT $ 84)))
                        ('T |b|))
                  . #4#)
            (LETT |res| NIL . #4#)
            (SEQ (LETT |x| NIL . #4#) (LETT #2# (QVELT |a| 2) . #4#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |y| NIL . #4#) (LETT #1# (QVELT |b2| 2) . #4#)
                        G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |y| (CAR #1#) . #4#) NIL))
                          (GO G191)))
                        (SEQ
                         (LETT |fac| (SPADCALL |x| |y| (QREFELT $ 85)) . #4#)
                         (EXIT
                          (LETT |res| (SPADCALL |res| |fac| (QREFELT $ 13))
                                . #4#)))
                        (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))))
                 (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
            (LETT |verts| (SPADCALL (QVELT |a| 0) (QVELT |b| 0) (QREFELT $ 86))
                  . #4#)
            (LETT |numPoints| (+ (QVELT |a| 1) (QVELT |b| 1)) . #4#)
            (EXIT (VECTOR |verts| |numPoints| |res|))))
          #5# (EXIT #3#)))) 

(SDEFUN |SIMPC;merge;3$;22| ((|a| $) (|b| $) ($ $))
        (SPROG ((|res| ($)) (#1=#:G902 NIL) (|x| NIL))
               (SEQ
                (LETT |res| (MOVEVEC (MAKE-VEC 3) |a|)
                      . #2=(|SIMPC;merge;3$;22|))
                (SEQ (LETT |x| NIL . #2#) (LETT #1# (QVELT |b| 2) . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |res| (SPADCALL |res| |x| (QREFELT $ 59)) . #2#)))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))) 

(SDEFUN |SIMPC;concatIfNew|
        ((|a| |List|
          (|Record| (|:| |value| (|NonNegativeInteger|))
                    (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|))))
         (|b| |NonNegativeInteger|)
         ($ |List|
          (|Record| (|:| |value| (|NonNegativeInteger|))
                    (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|)))))
        (SPROG ((#1=#:G910 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL (VECTOR |b| 0 0) |a| (QREFELT $ 91))
                    (PROGN (LETT #1# |a| |SIMPC;concatIfNew|) (GO #2=#:G909))))
                  (EXIT (SPADCALL |a| (VECTOR |b| 0 0) (QREFELT $ 92)))))
                #2# (EXIT #1#)))) 

(SDEFUN |SIMPC;concatIfNewArrow|
        ((|a| |List|
          (|Record| (|:| |name| (|String|))
                    (|:| |arrType| (|NonNegativeInteger|))
                    (|:| |fromOb| (|NonNegativeInteger|))
                    (|:| |toOb| (|NonNegativeInteger|))
                    (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                    (|:| |map| (|List| (|NonNegativeInteger|)))))
         (|p| |NonNegativeInteger|) (|m| |NonNegativeInteger|)
         ($ |List|
          (|Record| (|:| |name| (|String|))
                    (|:| |arrType| (|NonNegativeInteger|))
                    (|:| |fromOb| (|NonNegativeInteger|))
                    (|:| |toOb| (|NonNegativeInteger|))
                    (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                    (|:| |map| (|List| (|NonNegativeInteger|))))))
        (SPROG ((#1=#:G921 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL (VECTOR "x" 0 |p| |m| 0 0 NIL) |a|
                              (QREFELT $ 95))
                    (PROGN
                     (LETT #1# |a| . #2=(|SIMPC;concatIfNewArrow|))
                     (GO #3=#:G920))))
                  (COND
                   ((SPADCALL (VECTOR "x" 0 |m| |p| 0 0 NIL) |a|
                              (QREFELT $ 95))
                    (PROGN (LETT #1# |a| . #2#) (GO #3#))))
                  (EXIT
                   (SPADCALL |a| (VECTOR "x" 0 |p| |m| 0 0 NIL)
                             (QREFELT $ 96)))))
                #3# (EXIT #1#)))) 

(SDEFUN |SIMPC;oneSkeleton;$Dg;25|
        ((|s| $) ($ |DirectedGraph| (|NonNegativeInteger|)))
        (SPROG
         ((|edges|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (#1=#:G934 NIL) (|p| NIL)
          (|nodes|
           (|List|
            (|Record| (|:| |value| (|NonNegativeInteger|))
                      (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (#2=#:G933 NIL) (|m| NIL)
          (|y|
           (|Record| (|:| |name| (|String|))
                     (|:| |arrType| (|NonNegativeInteger|))
                     (|:| |fromOb| (|NonNegativeInteger|))
                     (|:| |toOb| (|NonNegativeInteger|))
                     (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                     (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|indexes| (|List| (|NonNegativeInteger|)))
          (|n| (|NonNegativeInteger|)) (#3=#:G932 NIL) (|x| NIL)
          (GS
           (|Join| (|FiniteGraph| #4=(|NonNegativeInteger|))
                   (CATEGORY |domain|
                    (SIGNATURE |directedGraph| ($ (|List| #4#)))
                    (SIGNATURE |directedGraph|
                     ($
                      (|List|
                       (|Record| (|:| |value| #4#)
                                 (|:| |posX| (|NonNegativeInteger|))
                                 (|:| |posY| (|NonNegativeInteger|))))))
                    (SIGNATURE |directedGraph|
                     ($
                      (|List|
                       (|Record| (|:| |value| #4#)
                                 (|:| |posX| (|NonNegativeInteger|))
                                 (|:| |posY| (|NonNegativeInteger|))))
                      (|List|
                       (|Record| (|:| |name| (|String|))
                                 (|:| |arrType| (|NonNegativeInteger|))
                                 (|:| |fromOb| (|NonNegativeInteger|))
                                 (|:| |toOb| (|NonNegativeInteger|))
                                 (|:| |xOffset| (|Integer|))
                                 (|:| |yOffset| (|Integer|))
                                 (|:| |map|
                                      (|List| (|NonNegativeInteger|)))))))
                    (SIGNATURE |directedGraph|
                     ($ (|List| #4#)
                      (|List|
                       (|Record| (|:| |fromOb| (|NonNegativeInteger|))
                                 (|:| |toOb| (|NonNegativeInteger|))))))
                    (SIGNATURE |directedGraph|
                     ($ (|List| #4#) (|List| (|List| (|NonNegativeInteger|)))))
                    (SIGNATURE |directedGraph|
                     ($ (|List| (|Permutation| #4#))))
                    (SIGNATURE |directedGraph| ($ (|FinitePoset| #4#)))
                    (SIGNATURE * ((|DirectedGraph| (|Product| #4# #4#)) $ $))
                    (SIGNATURE |cartesian|
                     ((|DirectedGraph| (|Product| #4# #4#)) $ $))
                    (SIGNATURE |closedTensor| ($ $ $ (|Mapping| #4# #4# #4#)))
                    (SIGNATURE |closedCartesian|
                     ($ $ $ (|Mapping| #4# #4# #4#)))
                    (SIGNATURE ~ ($ $))
                    (SIGNATURE |coerce| ($ (|PermutationGroup| #4#)))
                    (SIGNATURE |coerce| ($ (|FinitePoset| #4#)))
                    (SIGNATURE |coerce| ($ (|List| #4#)))))))
         (SEQ
          (LETT GS (|DirectedGraph| (|NonNegativeInteger|))
                . #5=(|SIMPC;oneSkeleton;$Dg;25|))
          (LETT |nodes| NIL . #5#) (LETT |edges| NIL . #5#)
          (SEQ (LETT |x| NIL . #5#) (LETT #3# (QVELT |s| 2) . #5#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #5#) NIL))
                 (GO G191)))
               (SEQ (LETT |n| (SPADCALL |x| (QREFELT $ 63)) . #5#)
                    (LETT |indexes| (SPADCALL |x| (QREFELT $ 54)) . #5#)
                    (COND
                     ((EQL |n| 2)
                      (SEQ
                       (LETT |nodes|
                             (|SIMPC;concatIfNew| |nodes|
                              (SPADCALL |indexes| 1 (QREFELT $ 97)) $)
                             . #5#)
                       (LETT |nodes|
                             (|SIMPC;concatIfNew| |nodes|
                              (SPADCALL |indexes| 2 (QREFELT $ 97)) $)
                             . #5#)
                       (LETT |y|
                             (VECTOR "x" 0
                                     (SPADCALL |indexes| 1 (QREFELT $ 97))
                                     (SPADCALL |indexes| 2 (QREFELT $ 97)) 0 0
                                     NIL)
                             . #5#)
                       (EXIT
                        (LETT |edges| (SPADCALL |edges| |y| (QREFELT $ 96))
                              . #5#)))))
                    (EXIT
                     (COND
                      ((SPADCALL |n| 2 (QREFELT $ 20))
                       (SEQ (LETT |m| NIL . #5#) (LETT #2# |indexes| . #5#)
                            G190
                            (COND
                             ((OR (ATOM #2#)
                                  (PROGN (LETT |m| (CAR #2#) . #5#) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |nodes| (|SIMPC;concatIfNew| |nodes| |m| $)
                                   . #5#)
                             (EXIT
                              (SEQ (LETT |p| NIL . #5#)
                                   (LETT #1# |indexes| . #5#) G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |p| (CAR #1#) . #5#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((< |p| |m|)
                                       (LETT |edges|
                                             (|SIMPC;concatIfNewArrow| |edges|
                                              |p| |m| $)
                                             . #5#)))))
                                   (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                   (EXIT NIL))))
                            (LETT #2# (CDR #2#) . #5#) (GO G190) G191
                            (EXIT NIL))))))
               (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL |nodes| |edges|
                     (|compiledLookupCheck| '|directedGraph|
                                            (LIST '$
                                                  (LIST '|List|
                                                        (LIST '|Record|
                                                              (LIST '|:|
                                                                    '|value|
                                                                    (LIST
                                                                     '|NonNegativeInteger|))
                                                              (LIST '|:|
                                                                    '|posX|
                                                                    (LIST
                                                                     '|NonNegativeInteger|))
                                                              (LIST '|:|
                                                                    '|posY|
                                                                    (LIST
                                                                     '|NonNegativeInteger|))))
                                                  (LIST '|List|
                                                        (LIST '|Record|
                                                              (LIST '|:|
                                                                    '|name|
                                                                    (LIST
                                                                     '|String|))
                                                              (LIST '|:|
                                                                    '|arrType|
                                                                    (LIST
                                                                     '|NonNegativeInteger|))
                                                              (LIST '|:|
                                                                    '|fromOb|
                                                                    (LIST
                                                                     '|NonNegativeInteger|))
                                                              (LIST '|:|
                                                                    '|toOb|
                                                                    (LIST
                                                                     '|NonNegativeInteger|))
                                                              (LIST '|:|
                                                                    '|xOffset|
                                                                    (LIST
                                                                     '|Integer|))
                                                              (LIST '|:|
                                                                    '|yOffset|
                                                                    (LIST
                                                                     '|Integer|))
                                                              (LIST '|:| '|map|
                                                                    (LIST
                                                                     '|List|
                                                                     (LIST
                                                                      '|NonNegativeInteger|))))))
                                            GS)))))) 

(SDEFUN |SIMPC;fundamentalGroup;$Gp;26| ((|s| $) ($ |GroupPresentation|))
        (SPADCALL |s| 'T NIL (QREFELT $ 101))) 

(SDEFUN |SIMPC;fundamentalGroup;$2BGp;27|
        ((|s| $) (|simplify| |Boolean|) (|trace| |Boolean|)
         ($ |GroupPresentation|))
        (SPROG ((|dc| (|DeltaComplex| VS)))
               (SEQ
                (LETT |dc| (SPADCALL |s| (QREFELT $ 104))
                      |SIMPC;fundamentalGroup;$2BGp;27|)
                (EXIT (SPADCALL |dc| |simplify| |trace| (QREFELT $ 105)))))) 

(SDEFUN |SIMPC;chain;$Cc;28| ((|s| $) ($ |ChainComplex|))
        (SPROG ((|cc| (|ChainComplex|)) (|dc| (|DeltaComplex| VS)))
               (SEQ
                (LETT |dc| (SPADCALL |s| (QREFELT $ 104))
                      . #1=(|SIMPC;chain;$Cc;28|))
                (LETT |cc| (SPADCALL |dc| (QREFELT $ 107)) . #1#) (EXIT |cc|)))) 

(SDEFUN |SIMPC;coChain;$Ccc;29| ((|s| $) ($ |CoChainComplex| VS))
        (SPROG ((|dc| (|DeltaComplex| VS)))
               (SEQ
                (LETT |dc| (SPADCALL |s| (QREFELT $ 104))
                      |SIMPC;coChain;$Ccc;29|)
                (EXIT (SPADCALL |dc| (QREFELT $ 110)))))) 

(SDEFUN |SIMPC;homology;$L;30| ((|s| $) ($ |List| (|Homology|)))
        (SPROG ((|dc| (|DeltaComplex| VS)))
               (SEQ
                (LETT |dc| (SPADCALL |s| (QREFELT $ 104))
                      |SIMPC;homology;$L;30|)
                (EXIT (SPADCALL |dc| (QREFELT $ 113)))))) 

(SDEFUN |SIMPC;coHomology;$L;31| ((|s| $) ($ |List| (|Homology|)))
        (SPROG ((|dc| (|DeltaComplex| VS)))
               (SEQ
                (LETT |dc| (SPADCALL |s| (QREFELT $ 104))
                      |SIMPC;coHomology;$L;31|)
                (EXIT (SPADCALL |dc| (QREFELT $ 115)))))) 

(SDEFUN |SIMPC;product;3$;32| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|numPoints| (|NonNegativeInteger|))
          (|res3| (|List| (|OrientedFacet|)))
          (|inds2| (|List| (|NonNegativeInteger|)))
          (|newIndex| (|NonNegativeInteger|)) (|r| (|NonNegativeInteger|))
          (#1=#:G957 NIL) (|l| (|NonNegativeInteger|)) (#2=#:G972 NIL)
          (|y| NIL) (|mul| (|Integer|))
          (|inds|
           (|List|
            (|Record| (|:| |left| (|NonNegativeInteger|))
                      (|:| |right| (|NonNegativeInteger|)))))
          (#3=#:G971 NIL) (|x| NIL) (|dimb| #4=(|NonNegativeInteger|))
          (|bz| (|NonNegativeInteger|)) (|dima| #4#)
          (|az| (|NonNegativeInteger|)) (#5=#:G970 NIL) (|z| NIL)
          (|res2| (|List| (|ProductFacet|))) (#6=#:G969 NIL) (|e| NIL)
          (|res| (|List| (|ProductFacet|))) (#7=#:G968 NIL) (|simpb| NIL)
          (#8=#:G967 NIL) (|simpa| NIL) (|vs| (|List| VS)) (|pp| (VS))
          (#9=#:G966 NIL) (|pb| NIL) (#10=#:G965 NIL) (|pa| NIL)
          (|simpsb| #11=(|List| (|OrientedFacet|))) (|simpsa| #11#))
         (SEQ (LETT |simpsa| (QVELT |a| 2) . #12=(|SIMPC;product;3$;32|))
              (LETT |simpsb| (QVELT |b| 2) . #12#) (LETT |vs| NIL . #12#)
              (SEQ (LETT |pa| NIL . #12#) (LETT #10# (QVELT |a| 0) . #12#) G190
                   (COND
                    ((OR (ATOM #10#) (PROGN (LETT |pa| (CAR #10#) . #12#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |pb| NIL . #12#)
                          (LETT #9# (QVELT |b| 0) . #12#) G190
                          (COND
                           ((OR (ATOM #9#)
                                (PROGN (LETT |pb| (CAR #9#) . #12#) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |pp| (SPADCALL |pa| |pb| (QREFELT $ 117))
                                 . #12#)
                           (EXIT
                            (LETT |vs| (SPADCALL |vs| |pp| (QREFELT $ 118))
                                  . #12#)))
                          (LETT #9# (CDR #9#) . #12#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #10# (CDR #10#) . #12#) (GO G190) G191 (EXIT NIL))
              (LETT |res| NIL . #12#)
              (SEQ (LETT |simpa| NIL . #12#) (LETT #8# |simpsa| . #12#) G190
                   (COND
                    ((OR (ATOM #8#)
                         (PROGN (LETT |simpa| (CAR #8#) . #12#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |simpb| NIL . #12#) (LETT #7# |simpsb| . #12#)
                          G190
                          (COND
                           ((OR (ATOM #7#)
                                (PROGN (LETT |simpb| (CAR #7#) . #12#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT |res|
                                  (SPADCALL |res|
                                            (SPADCALL |simpa| |simpb|
                                                      (QREFELT $ 120))
                                            (QREFELT $ 121))
                                  . #12#)))
                          (LETT #7# (CDR #7#) . #12#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #8# (CDR #8#) . #12#) (GO G190) G191 (EXIT NIL))
              (LETT |res2| NIL . #12#)
              (SEQ (LETT |e| NIL . #12#) (LETT #6# |res| . #12#) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |e| (CAR #6#) . #12#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (SPADCALL |e| |res2| (QREFELT $ 123)))
                       (LETT |res2| (SPADCALL |res2| |e| (QREFELT $ 124))
                             . #12#)))))
                   (LETT #6# (CDR #6#) . #12#) (GO G190) G191 (EXIT NIL))
              (LETT |res3| NIL . #12#) (LETT |dima| 0 . #12#)
              (LETT |dimb| 0 . #12#)
              (SEQ (LETT |z| NIL . #12#) (LETT #5# |res2| . #12#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |z| (CAR #5#) . #12#) NIL))
                     (GO G191)))
                   (SEQ (LETT |az| (SPADCALL |z| (QREFELT $ 125)) . #12#)
                        (COND
                         ((SPADCALL |az| |dima| (QREFELT $ 20))
                          (LETT |dima| |az| . #12#)))
                        (LETT |bz| (SPADCALL |z| (QREFELT $ 126)) . #12#)
                        (EXIT
                         (COND
                          ((SPADCALL |bz| |dimb| (QREFELT $ 20))
                           (LETT |dimb| |bz| . #12#)))))
                   (LETT #5# (CDR #5#) . #12#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |x| NIL . #12#) (LETT #3# |res2| . #12#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #12#) NIL))
                     (GO G191)))
                   (SEQ (LETT |inds| (SPADCALL |x| (QREFELT $ 129)) . #12#)
                        (LETT |inds2| NIL . #12#)
                        (LETT |mul| (SPADCALL |x| (QREFELT $ 130)) . #12#)
                        (SEQ (LETT |y| NIL . #12#) (LETT #2# |inds| . #12#)
                             G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |y| (CAR #2#) . #12#) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |l|
                                    (PROG2
                                        (LETT #1#
                                              (SPADCALL (QCAR |y|) 1
                                                        (QREFELT $ 69))
                                              . #12#)
                                        (QCDR #1#)
                                      (|check_union2| (QEQCAR #1# 0)
                                                      (|NonNegativeInteger|)
                                                      (|Union|
                                                       (|NonNegativeInteger|)
                                                       #13="failed")
                                                      #1#))
                                    . #12#)
                              (LETT |r|
                                    (PROG2
                                        (LETT #1#
                                              (SPADCALL (QCDR |y|) 1
                                                        (QREFELT $ 69))
                                              . #12#)
                                        (QCDR #1#)
                                      (|check_union2| (QEQCAR #1# 0)
                                                      (|NonNegativeInteger|)
                                                      (|Union|
                                                       (|NonNegativeInteger|)
                                                       #13#)
                                                      #1#))
                                    . #12#)
                              (LETT |newIndex| (+ (+ (* |l| |dimb|) |r|) 1)
                                    . #12#)
                              (EXIT
                               (LETT |inds2|
                                     (SPADCALL |inds2| |newIndex|
                                               (QREFELT $ 131))
                                     . #12#)))
                             (LETT #2# (CDR #2#) . #12#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (LETT |res3|
                               (SPADCALL |res3|
                                         (SPADCALL |mul| |inds2|
                                                   (QREFELT $ 11))
                                         (QREFELT $ 13))
                               . #12#)))
                   (LETT #3# (CDR #3#) . #12#) (GO G190) G191 (EXIT NIL))
              (LETT |numPoints| (* (QVELT |a| 1) (QVELT |b| 1)) . #12#)
              (EXIT (VECTOR |vs| |numPoints| |res3|))))) 

(SDEFUN |SIMPC;equalSimplex|
        ((|a| |List| (|NonNegativeInteger|))
         (|b| |List| (|NonNegativeInteger|)) ($ |Boolean|))
        (SPROG
         ((|offset| (|Integer|)) (#1=#:G982 NIL) (#2=#:G983 NIL) (|n| NIL)
          (|fst| (|NonNegativeInteger|)) (|len| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |len| (SPADCALL |a| (QREFELT $ 133))
                  . #3=(|SIMPC;equalSimplex|))
            (COND
             ((SPADCALL |len| (SPADCALL |b| (QREFELT $ 133)) (QREFELT $ 134))
              (PROGN (LETT #1# NIL . #3#) (GO #4=#:G981))))
            (COND ((EQL |len| 0) (PROGN (LETT #1# 'T . #3#) (GO #4#))))
            (LETT |fst| (|SPADfirst| |a|) . #3#)
            (LETT |offset| (SPADCALL |fst| |b| (QREFELT $ 135)) . #3#)
            (COND ((< |offset| 1) (PROGN (LETT #1# NIL . #3#) (GO #4#))))
            (SEQ (LETT |n| 1 . #3#)
                 (LETT #2# (SPADCALL |a| (QREFELT $ 133)) . #3#) G190
                 (COND ((|greater_SI| |n| #2#) (GO G191)))
                 (SEQ
                  (COND
                   ((SPADCALL (SPADCALL |a| |n| (QREFELT $ 97))
                              (SPADCALL |b| |offset| (QREFELT $ 97))
                              (QREFELT $ 134))
                    (PROGN (LETT #1# NIL . #3#) (GO #4#))))
                  (LETT |offset| (+ |offset| 1) . #3#)
                  (EXIT
                   (COND
                    ((SPADCALL |offset| (SPADCALL |b| (QREFELT $ 133))
                               (QREFELT $ 64))
                     (LETT |offset| 1 . #3#)))))
                 (LETT |n| (|inc_SI| |n|) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #4# (EXIT #1#)))) 

(SDEFUN |SIMPC;=;2$B;34| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G995 NIL) (#2=#:G999 NIL) (|f| NIL)
          (|x| (|NonNegativeInteger|)) (#3=#:G998 NIL) (|a1| NIL)
          (|flags| (|List| (|Boolean|))) (#4=#:G997 NIL) (#5=#:G996 NIL)
          (|len| (|NonNegativeInteger|)) (|bs| #6=(|List| (|OrientedFacet|)))
          (|as| #6#))
         (SEQ
          (EXIT
           (SEQ (LETT |as| (QVELT |a| 2) . #7=(|SIMPC;=;2$B;34|))
                (LETT |bs| (QVELT |b| 2) . #7#)
                (LETT |len| (LENGTH |as|) . #7#)
                (COND
                 ((SPADCALL |len| (LENGTH |bs|) (QREFELT $ 134))
                  (PROGN (LETT #1# NIL . #7#) (GO #8=#:G994))))
                (LETT |flags|
                      (PROGN
                       (LETT #5# NIL . #7#)
                       (SEQ (LETT |x| NIL . #7#) (LETT #4# |as| . #7#) G190
                            (COND
                             ((OR (ATOM #4#)
                                  (PROGN (LETT |x| (CAR #4#) . #7#) NIL))
                              (GO G191)))
                            (SEQ (EXIT (LETT #5# (CONS NIL #5#) . #7#)))
                            (LETT #4# (CDR #4#) . #7#) (GO G190) G191
                            (EXIT (NREVERSE #5#))))
                      . #7#)
                (SEQ (LETT |a1| NIL . #7#) (LETT #3# |as| . #7#) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |a1| (CAR #3#) . #7#) NIL))
                       (GO G191)))
                     (SEQ (LETT |x| 1 . #7#)
                          (SEQ G190
                               (COND
                                ((NULL
                                  (COND
                                   ((SPADCALL |a1|
                                              (SPADCALL |bs| |x|
                                                        (QREFELT $ 48))
                                              (QREFELT $ 136))
                                    'T)
                                   ('T
                                    (SPADCALL |flags| |x| (QREFELT $ 138)))))
                                 (GO G191)))
                               (SEQ (LETT |x| (+ |x| 1) . #7#)
                                    (EXIT
                                     (COND
                                      ((SPADCALL |x| (LENGTH |as|)
                                                 (QREFELT $ 20))
                                       (PROGN
                                        (LETT #1# NIL . #7#)
                                        (GO #8#))))))
                               NIL (GO G190) G191 (EXIT NIL))
                          (EXIT (SPADCALL |flags| |x| 'T (QREFELT $ 139))))
                     (LETT #3# (CDR #3#) . #7#) (GO G190) G191 (EXIT NIL))
                (SEQ (LETT |f| NIL . #7#) (LETT #2# |flags| . #7#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#) . #7#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((|BooleanEquality| |f| NIL)
                         (PROGN (LETT #1# NIL . #7#) (GO #8#))))))
                     (LETT #2# (CDR #2#) . #7#) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #8# (EXIT #1#)))) 

(SDEFUN |SIMPC;coerce;$Of;35| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|res| (|OutputForm|)) (#1=#:G1005 NIL) (|a| NIL) (#2=#:G1004 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |res|
                  (SPADCALL
                   (LIST (SPADCALL "points 1.." (QREFELT $ 30))
                         (SPADCALL (QVELT |s| 1) (QREFELT $ 40)))
                   (QREFELT $ 141))
                  . #3=(|SIMPC;coerce;$Of;35|))
            (COND
             ((NULL (QVELT |s| 2))
              (PROGN
               (LETT #2#
                     (SPADCALL (SPADCALL "empty" (QREFELT $ 30))
                               (QREFELT $ 142))
                     . #3#)
               (GO #4=#:G1003))))
            (SEQ (LETT |a| NIL . #3#) (LETT #1# (QVELT |s| 2) . #3#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |res|
                         (SPADCALL |res| (SPADCALL |a| (QREFELT $ 44))
                                   (QREFELT $ 143))
                         . #3#)))
                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT |res|)))
          #4# (EXIT #2#)))) 

(SDEFUN |SIMPC;coerce;$Dc;36| ((|s| $) ($ |DeltaComplex| VS))
        (SPADCALL |s| (QREFELT $ 104))) 

(DECLAIM (NOTINLINE |FiniteSimplicialComplex;|)) 

(DEFUN |FiniteSimplicialComplex| (#1=#:G1007)
  (SPROG NIL
         (PROG (#2=#:G1008)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FiniteSimplicialComplex|)
                                               '|domainEqualList|)
                    . #3=(|FiniteSimplicialComplex|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|FiniteSimplicialComplex;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FiniteSimplicialComplex|)))))))))) 

(DEFUN |FiniteSimplicialComplex;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteSimplicialComplex|))
          (LETT |dv$| (LIST '|FiniteSimplicialComplex| DV$1) . #1#)
          (LETT $ (GETREFV 148) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FiniteSimplicialComplex|
                      (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record| (|:| VERTSET (|List| |#1|))
                              (|:| NUMPOINTS (|NonNegativeInteger|))
                              (|:| SIMP (|List| (|OrientedFacet|)))))
          $))) 

(MAKEPROP '|FiniteSimplicialComplex| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Integer|)
              (|List| 15) (|OrientedFacet|) (0 . |orientedFacet|) (|List| 10)
              (6 . |concat|) (|List| 6) (|NonNegativeInteger|) (|List| 9)
              |SIMPC;simplicialComplex;LNniL$;1| (12 . |maxIndex|) (|Boolean|)
              (17 . >) |SIMPC;simplicialComplex;LL$;2| (23 . |Zero|)
              |SIMPC;simplicialComplex;L$;3| (|Union| $ '"failed")
              (|DeltaComplex| 6) |SIMPC;simplicialComplexIfCan;DcBU;5|
              |SIMPC;simplicialComplexIfCan;DcU;4| (|String|) (|OutputForm|)
              (27 . |message|) (32 . |coerce|) (37 . |hconcat|) (|Void|)
              (43 . |print|) (|List| 12) (48 . |concat|) (54 . |coerce|)
              (|List| 42) (59 . |coerce|) (64 . |coerce|) (69 . |coerce|)
              (|List| 8) (74 . |orientedFacetSigned|) (79 . |coerce|)
              (84 . |coerce|) (89 . |elt|) (95 . |setelt!|) (102 . |elt|)
              (108 . |orientedFacet|) (|List| $) (114 . |orientedFacetIfCan|)
              (119 . |remove|) (125 . |coerce|) (130 . |getIndexes|) (135 . =)
              (141 . |getMult|) (146 . |setMult!|) (152 . ~=)
              |SIMPC;addSimplex;$Of$;6| |SIMPC;maxIndex;$Nni;7|
              (158 . |minIndex|) |SIMPC;minIndex;$Nni;8| (163 . |order|)
              (168 . >) |SIMPC;grade;$L;9| (174 . |sort|) |SIMPC;sort;2$;10|
              (179 . |concat|) (185 . |subtractIfCan|) (191 . |concat|)
              (197 . |sameFace?|) (203 . |allSubsets|)
              |SIMPC;addImpliedFaces;$L;14| (210 . |boundary|)
              |SIMPC;boundary;2$;15| (215 . |isSubsetOf?|) |SIMPC;star;$Of$;16|
              (221 . |concat|) |SIMPC;link;$Of$;17| (227 . |addVertex|)
              |SIMPC;cone;$Nni$;18| (233 . |refactorIndexes|)
              |SIMPC;refactorIndexes;$Nni$;19| |SIMPC;makeDisjoint;3$;20|
              (239 . |join|) (245 . |concat|) |SIMPC;simplicialJoin;2$B$;21|
              |SIMPC;merge;3$;22|
              (|Record| (|:| |value| 15) (|:| |posX| 15) (|:| |posY| 15))
              (|List| 89) (251 . |member?|) (257 . |concat|)
              (|Record| (|:| |name| 28) (|:| |arrType| 15) (|:| |fromOb| 15)
                        (|:| |toOb| 15) (|:| |xOffset| 8) (|:| |yOffset| 8)
                        (|:| |map| 9))
              (|List| 93) (263 . |member?|) (269 . |concat|) (275 . |elt|)
              (|DirectedGraph| 15) |SIMPC;oneSkeleton;$Dg;25|
              (|GroupPresentation|) |SIMPC;fundamentalGroup;$2BGp;27|
              |SIMPC;fundamentalGroup;$Gp;26| (|FiniteSimplicialComplex| 6)
              (281 . |deltaComplex|) (286 . |fundamentalGroup|)
              (|ChainComplex|) (293 . |chain|) |SIMPC;chain;$Cc;28|
              (|CoChainComplex| 6) (298 . |coChain|) |SIMPC;coChain;$Ccc;29|
              (|List| (|Homology|)) (303 . |homology|) |SIMPC;homology;$L;30|
              (308 . |coHomology|) |SIMPC;coHomology;$L;31| (313 . +)
              (319 . |concat|) (|List| 122) (325 . |product|) (331 . |concat|)
              (|ProductFacet|) (337 . |member?|) (343 . |concat|)
              (349 . |getMaxLeft|) (354 . |getMaxRight|)
              (|Record| (|:| |left| 15) (|:| |right| 15)) (|List| 127)
              (359 . |getIndexs|) (364 . |getMult|) (369 . |concat|)
              |SIMPC;product;3$;32| (375 . |#|) (380 . ~=) (386 . |position|)
              (392 . ~=) (|List| 19) (398 . |elt|) (404 . |setelt!|)
              |SIMPC;=;2$B;34| (411 . |hconcat|) (416 . |bracket|)
              (421 . |vconcat|) |SIMPC;coerce;$Of;35| |SIMPC;coerce;$Dc;36|
              (|SingleInteger|) (|HashState|))
           '#(~= 427 |star| 433 |sort| 439 |simplicialJoin| 444
              |simplicialComplexIfCan| 451 |simplicialComplex| 462
              |refactorIndexes| 480 |product| 486 |oneSkeleton| 492 |minIndex|
              497 |merge| 502 |maxIndex| 508 |makeDisjoint| 513 |link| 519
              |latex| 525 |homology| 530 |hashUpdate!| 535 |hash| 541 |grade|
              546 |fundamentalGroup| 551 |cone| 563 |coerce| 569 |coHomology|
              579 |coChain| 584 |chain| 589 |boundary| 594 |addSimplex| 599
              |addImpliedFaces| 605 = 610)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 29))
                        (|makeByteWordVec2| 147
                                            '(2 10 0 8 9 11 2 12 0 0 10 13 1 10
                                              15 0 18 2 15 19 0 0 20 0 6 0 22 1
                                              29 0 28 30 1 25 29 0 31 2 29 0 0
                                              0 32 1 29 33 0 34 2 35 0 0 12 36
                                              1 28 29 0 37 1 38 29 0 39 1 15 29
                                              0 40 1 35 29 0 41 1 10 0 42 43 1
                                              10 29 0 44 1 42 29 0 45 2 35 12 0
                                              8 46 3 35 12 0 8 12 47 2 12 10 0
                                              8 48 2 10 0 8 10 49 1 10 24 50 51
                                              2 12 0 10 0 52 1 12 29 0 53 1 10
                                              9 0 54 2 9 19 0 0 55 1 10 8 0 56
                                              2 10 0 0 8 57 2 8 19 0 0 58 1 10
                                              15 0 61 1 10 15 0 63 2 8 19 0 0
                                              64 1 12 0 0 66 2 38 0 0 42 68 2
                                              15 24 0 0 69 2 38 0 0 0 70 2 10
                                              19 0 0 71 3 10 50 0 15 15 72 1 10
                                              50 0 74 2 10 19 0 0 76 2 12 0 0 0
                                              78 2 10 0 0 15 80 2 10 0 0 15 82
                                              2 10 0 0 0 85 2 14 0 0 0 86 2 90
                                              19 89 0 91 2 90 0 0 89 92 2 94 19
                                              93 0 95 2 94 0 0 93 96 2 9 15 0 8
                                              97 1 25 0 103 104 3 25 100 0 19
                                              19 105 1 25 106 0 107 1 25 109 0
                                              110 1 25 112 0 113 1 25 112 0 115
                                              2 6 0 0 0 117 2 14 0 0 6 118 2 10
                                              119 0 0 120 2 119 0 0 0 121 2 119
                                              19 122 0 123 2 119 0 0 122 124 1
                                              122 15 0 125 1 122 15 0 126 1 122
                                              128 0 129 1 122 8 0 130 2 9 0 0
                                              15 131 1 9 15 0 133 2 15 19 0 0
                                              134 2 9 8 15 0 135 2 10 19 0 0
                                              136 2 137 19 0 8 138 3 137 19 0 8
                                              19 139 1 29 0 50 141 1 29 0 0 142
                                              2 29 0 0 0 143 2 0 19 0 0 1 2 0 0
                                              0 10 77 1 0 0 0 67 3 0 0 0 0 19
                                              87 2 0 24 25 19 26 1 0 24 25 27 2
                                              0 0 14 16 21 1 0 0 14 23 3 0 0 14
                                              15 16 17 2 0 0 0 15 83 2 0 0 0 0
                                              132 1 0 98 0 99 1 0 15 0 62 2 0 0
                                              0 0 88 1 0 15 0 60 2 0 0 0 0 84 2
                                              0 0 0 10 79 1 0 28 0 1 1 0 112 0
                                              114 2 0 147 147 0 1 1 0 146 0 1 1
                                              0 35 0 65 3 0 100 0 19 19 101 1 0
                                              100 0 102 2 0 0 0 15 81 1 0 25 0
                                              145 1 0 29 0 144 1 0 112 0 116 1
                                              0 109 0 111 1 0 106 0 108 1 0 0 0
                                              75 2 0 0 0 10 59 1 0 35 0 73 2 0
                                              19 0 0 140)))))
           '|lookupComplete|)) 
