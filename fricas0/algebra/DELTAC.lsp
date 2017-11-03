
(SDEFUN |DELTAC;dim1todim0|
        ((|dim1| |List| (|List| (|Integer|))) (|n| . #1=(|NonNegativeInteger|))
         ($ |List| (|List| (|Integer|))))
        (SPROG
         ((|res| (|List| (|List| (|Integer|)))) (#2=#:G746 NIL) (|x| NIL)
          (#3=#:G745 NIL) (|m3| (|NonNegativeInteger|)) (#4=#:G725 NIL)
          (#5=#:G744 NIL) (|m2| NIL) (#6=#:G743 NIL) (|smp| NIL)
          (|pointsUsed| (|List| (|Boolean|))) (|m| #1#) (#7=#:G717 NIL)
          (#8=#:G742 NIL) (#9=#:G741 NIL))
         (SEQ (LETT |m| |n| . #10=(|DELTAC;dim1todim0|))
              (SEQ (LETT |smp| NIL . #10#) (LETT #9# |dim1| . #10#) G190
                   (COND
                    ((OR (ATOM #9#) (PROGN (LETT |smp| (CAR #9#) . #10#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |m2| NIL . #10#) (LETT #8# |smp| . #10#) G190
                          (COND
                           ((OR (ATOM #8#)
                                (PROGN (LETT |m2| (CAR #8#) . #10#) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |m3|
                                 (PROG1 (LETT #7# (ABS |m2|) . #10#)
                                   (|check_subtype2| (>= #7# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #7#))
                                 . #10#)
                           (EXIT
                            (COND
                             ((SPADCALL |m3| |m| (QREFELT $ 10))
                              (LETT |m| |m3| . #10#)))))
                          (LETT #8# (CDR #8#) . #10#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #9# (CDR #9#) . #10#) (GO G190) G191 (EXIT NIL))
              (LETT |pointsUsed| (SPADCALL |m| NIL (QREFELT $ 12)) . #10#)
              (SEQ (LETT |smp| NIL . #10#) (LETT #6# |dim1| . #10#) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |smp| (CAR #6#) . #10#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |m2| NIL . #10#) (LETT #5# |smp| . #10#) G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |m2| (CAR #5#) . #10#) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |m3|
                                 (PROG1 (LETT #4# (ABS |m2|) . #10#)
                                   (|check_subtype2| (>= #4# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #4#))
                                 . #10#)
                           (EXIT
                            (SPADCALL |pointsUsed| |m3| 'T (QREFELT $ 14))))
                          (LETT #5# (CDR #5#) . #10#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #6# (CDR #6#) . #10#) (GO G190) G191 (EXIT NIL))
              (LETT |res|
                    (PROGN
                     (LETT #3# NIL . #10#)
                     (SEQ (LETT |x| NIL . #10#) (LETT #2# |pointsUsed| . #10#)
                          G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |x| (CAR #2#) . #10#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3# (CONS (COND (|x| (LIST 0)) ('T NIL)) #3#)
                                  . #10#)))
                          (LETT #2# (CDR #2#) . #10#) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    . #10#)
              (EXIT |res|)))) 

(SDEFUN |DELTAC;deltaComplex;LNniL$;2|
        ((|v| |List| VS) (|numPoints| |NonNegativeInteger|)
         (|f| |List| (|List| (|List| (|Integer|)))) ($ $))
        (SPROG
         ((|fp| (|List| (|List| (|List| (|Integer|)))))
          (|f0| (|List| (|List| (|Integer|)))))
         (SEQ
          (LETT |f0|
                (|DELTAC;dim1todim0| (SPADCALL |f| '|last| (QREFELT $ 18))
                 |numPoints| $)
                . #1=(|DELTAC;deltaComplex;LNniL$;2|))
          (LETT |fp| (SPADCALL |f| |f0| (QREFELT $ 19)) . #1#)
          (EXIT (CONS |v| |fp|))))) 

(SDEFUN |DELTAC;deltaComplex;Fsc$;3|
        ((|fsc| |FiniteSimplicialComplex| VS) ($ $))
        (SPADCALL |fsc| NIL (QREFELT $ 23))) 

(SDEFUN |DELTAC;deltaComplex;FscB$;4|
        ((|fsc| |FiniteSimplicialComplex| VS) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|vs| #1=(|List| VS)) (|previousFaceList| (|List| (|OrientedFacet|)))
          (|faceMaps| (|List| (|List| (|List| (|Integer|)))))
          (|map1| (|List| (|List| (|Integer|))))
          (|newIndexes| (|List| (|Integer|))) (|i| (|Integer|)) (#2=#:G790 NIL)
          (|oldFaceLow| NIL) (|oldFacesLow| (|List| (|OrientedFacet|)))
          (#3=#:G789 NIL) (|oldFaceHigh| NIL) (#4=#:G788 NIL) (|x| NIL)
          (#5=#:G787 NIL) (|m3| (|NonNegativeInteger|)) (#6=#:G762 NIL)
          (#7=#:G786 NIL) (|m2| NIL) (#8=#:G785 NIL) (|smp| NIL)
          (|pointsUsed| (|List| (|Boolean|))) (|m| #9=(|NonNegativeInteger|))
          (#10=#:G758 NIL) (#11=#:G784 NIL) (#12=#:G783 NIL)
          (|map2| (|List| (|List| (|Integer|)))) (|fm| (|List| (|Integer|)))
          (#13=#:G782 NIL) (#14=#:G780 NIL) (|gradeList| NIL) (#15=#:G781 NIL)
          (|grn| NIL) (|allFacetsGraded| (|List| (|List| (|OrientedFacet|))))
          (#16=#:G779 NIL) (|l| NIL) (#17=#:G778 NIL)
          (|allFacets| (|List| (|List| (|OrientedFacet|))))
          (|fscRep|
           (|Record| (|:| VERTSET #1#) (|:| NUMPOINTS #9#)
                     (|:| SIMP (|List| (|OrientedFacet|))))))
         (SEQ (LETT |fscRep| |fsc| . #18=(|DELTAC;deltaComplex;FscB$;4|))
              (LETT |allFacets| (SPADCALL |fsc| (QREFELT $ 26)) . #18#)
              (COND
               (|trace|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL "deltaComplex(" (QREFELT $ 29))
                             (SPADCALL |fsc| (QREFELT $ 30)) (QREFELT $ 31))
                   (SPADCALL ") allFacets=" (QREFELT $ 29)) (QREFELT $ 31))
                  (SPADCALL |allFacets| (QREFELT $ 32)) (QREFELT $ 31))
                 (QREFELT $ 34))))
              (LETT |allFacetsGraded|
                    (PROGN
                     (LETT #17# NIL . #18#)
                     (SEQ (LETT |l| NIL . #18#) (LETT #16# |allFacets| . #18#)
                          G190
                          (COND
                           ((OR (ATOM #16#)
                                (PROGN (LETT |l| (CAR #16#) . #18#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #17#
                                  (CONS (SPADCALL |l| (QREFELT $ 36)) #17#)
                                  . #18#)))
                          (LETT #16# (CDR #16#) . #18#) (GO G190) G191
                          (EXIT (NREVERSE #17#))))
                    . #18#)
              (COND
               (|trace|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL "deltaComplex allFacetsGraded=" (QREFELT $ 29))
                  (SPADCALL |allFacetsGraded| (QREFELT $ 32)) (QREFELT $ 31))
                 (QREFELT $ 34))))
              (LETT |faceMaps| NIL . #18#) (LETT |previousFaceList| NIL . #18#)
              (SEQ (LETT |grn| 1 . #18#)
                   (LETT #15# (LENGTH |allFacetsGraded|) . #18#)
                   (LETT |gradeList| NIL . #18#)
                   (LETT #14# |allFacetsGraded| . #18#) G190
                   (COND
                    ((OR (ATOM #14#)
                         (PROGN (LETT |gradeList| (CAR #14#) . #18#) NIL)
                         (|greater_SI| |grn| #15#))
                     (GO G191)))
                   (SEQ
                    (COND
                     (|trace|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL "deltaComplex grad num=" (QREFELT $ 29))
                          (SPADCALL |grn| (QREFELT $ 37)) (QREFELT $ 31))
                         (SPADCALL "=" (QREFELT $ 29)) (QREFELT $ 31))
                        (SPADCALL |gradeList| (QREFELT $ 38)) (QREFELT $ 31))
                       (QREFELT $ 34))))
                    (LETT |map1| NIL . #18#)
                    (COND
                     ((EQL |grn| 1)
                      (SEQ (LETT |map2| NIL . #18#)
                           (SEQ (LETT |x| NIL . #18#)
                                (LETT #13# |gradeList| . #18#) G190
                                (COND
                                 ((OR (ATOM #13#)
                                      (PROGN (LETT |x| (CAR #13#) . #18#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (LETT |fm| (SPADCALL |x| (QREFELT $ 41))
                                       . #18#)
                                 (LETT |map2| (CONS |fm| |map2|) . #18#)
                                 (EXIT
                                  (COND
                                   (|trace|
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           "  deltaComplex getIndexesSigned("
                                           (QREFELT $ 29))
                                          (SPADCALL |x| (QREFELT $ 42))
                                          (QREFELT $ 31))
                                         (SPADCALL ") fm=" (QREFELT $ 29))
                                         (QREFELT $ 31))
                                        (SPADCALL |fm| (QREFELT $ 43))
                                        (QREFELT $ 31))
                                       (SPADCALL " map2=" (QREFELT $ 29))
                                       (QREFELT $ 31))
                                      (SPADCALL |map2| (QREFELT $ 44))
                                      (QREFELT $ 31))
                                     (QREFELT $ 34))))))
                                (LETT #13# (CDR #13#) . #18#) (GO G190) G191
                                (EXIT NIL))
                           (LETT |m| (QVELT |fscRep| 1) . #18#)
                           (SEQ (LETT |smp| NIL . #18#)
                                (LETT #12# |map2| . #18#) G190
                                (COND
                                 ((OR (ATOM #12#)
                                      (PROGN
                                       (LETT |smp| (CAR #12#) . #18#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SEQ (LETT |m2| NIL . #18#)
                                       (LETT #11# |smp| . #18#) G190
                                       (COND
                                        ((OR (ATOM #11#)
                                             (PROGN
                                              (LETT |m2| (CAR #11#) . #18#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |m3|
                                              (PROG1
                                                  (LETT #10# (ABS |m2|) . #18#)
                                                (|check_subtype2| (>= #10# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #10#))
                                              . #18#)
                                        (EXIT
                                         (COND
                                          ((SPADCALL |m3| |m| (QREFELT $ 10))
                                           (LETT |m| |m3| . #18#)))))
                                       (LETT #11# (CDR #11#) . #18#) (GO G190)
                                       G191 (EXIT NIL))))
                                (LETT #12# (CDR #12#) . #18#) (GO G190) G191
                                (EXIT NIL))
                           (COND
                            (|trace|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL "  deltaComplex m=" (QREFELT $ 29))
                               (SPADCALL |m| (QREFELT $ 37)) (QREFELT $ 31))
                              (QREFELT $ 34))))
                           (LETT |pointsUsed| (SPADCALL |m| NIL (QREFELT $ 12))
                                 . #18#)
                           (SEQ (LETT |smp| NIL . #18#)
                                (LETT #8# |map2| . #18#) G190
                                (COND
                                 ((OR (ATOM #8#)
                                      (PROGN
                                       (LETT |smp| (CAR #8#) . #18#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SEQ (LETT |m2| NIL . #18#)
                                       (LETT #7# |smp| . #18#) G190
                                       (COND
                                        ((OR (ATOM #7#)
                                             (PROGN
                                              (LETT |m2| (CAR #7#) . #18#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |m3|
                                              (PROG1
                                                  (LETT #6# (ABS |m2|) . #18#)
                                                (|check_subtype2| (>= #6# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #6#))
                                              . #18#)
                                        (EXIT
                                         (SPADCALL |pointsUsed| |m3| 'T
                                                   (QREFELT $ 14))))
                                       (LETT #7# (CDR #7#) . #18#) (GO G190)
                                       G191 (EXIT NIL))))
                                (LETT #8# (CDR #8#) . #18#) (GO G190) G191
                                (EXIT NIL))
                           (LETT |map1|
                                 (PROGN
                                  (LETT #5# NIL . #18#)
                                  (SEQ (LETT |x| NIL . #18#)
                                       (LETT #4# |pointsUsed| . #18#) G190
                                       (COND
                                        ((OR (ATOM #4#)
                                             (PROGN
                                              (LETT |x| (CAR #4#) . #18#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #5#
                                               (CONS
                                                (COND (|x| (LIST 0)) ('T NIL))
                                                #5#)
                                               . #18#)))
                                       (LETT #4# (CDR #4#) . #18#) (GO G190)
                                       G191 (EXIT (NREVERSE #5#))))
                                 . #18#)
                           (COND
                            (|trace|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL "  deltaComplex m="
                                             (QREFELT $ 29))
                                   (SPADCALL |m| (QREFELT $ 37))
                                   (QREFELT $ 31))
                                  (SPADCALL " map2=" (QREFELT $ 29))
                                  (QREFELT $ 31))
                                 (SPADCALL |map2| (QREFELT $ 44))
                                 (QREFELT $ 31))
                                (SPADCALL " map1=" (QREFELT $ 29))
                                (QREFELT $ 31))
                               (SPADCALL |map1| (QREFELT $ 44)) (QREFELT $ 31))
                              (QREFELT $ 34))))
                           (EXIT (LETT |map1| (REVERSE |map1|) . #18#))))
                     ('T
                      (SEQ (LETT |oldFaceHigh| NIL . #18#)
                           (LETT #3# |gradeList| . #18#) G190
                           (COND
                            ((OR (ATOM #3#)
                                 (PROGN
                                  (LETT |oldFaceHigh| (CAR #3#) . #18#)
                                  NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |oldFacesLow|
                                  (SPADCALL |oldFaceHigh| (QREFELT $ 46))
                                  . #18#)
                            (LETT |newIndexes| NIL . #18#)
                            (SEQ (LETT |oldFaceLow| NIL . #18#)
                                 (LETT #2# |oldFacesLow| . #18#) G190
                                 (COND
                                  ((OR (ATOM #2#)
                                       (PROGN
                                        (LETT |oldFaceLow| (CAR #2#) . #18#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (COND
                                   (|trace|
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           "    deltaComplex oldFaceLow="
                                           (QREFELT $ 29))
                                          (SPADCALL |oldFaceLow|
                                                    (QREFELT $ 42))
                                          (QREFELT $ 31))
                                         (SPADCALL " previousFaceList="
                                                   (QREFELT $ 29))
                                         (QREFELT $ 31))
                                        (SPADCALL |previousFaceList|
                                                  (QREFELT $ 38))
                                        (QREFELT $ 31))
                                       (SPADCALL " allFacetsGraded.1="
                                                 (QREFELT $ 29))
                                       (QREFELT $ 31))
                                      (SPADCALL
                                       (SPADCALL |allFacetsGraded| 1
                                                 (QREFELT $ 47))
                                       (QREFELT $ 38))
                                      (QREFELT $ 31))
                                     (QREFELT $ 34))))
                                  (LETT |i|
                                        (SPADCALL |oldFaceLow|
                                                  |previousFaceList|
                                                  (QREFELT $ 48))
                                        . #18#)
                                  (COND
                                   ((EQL |i| 0)
                                    (SEQ
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL "  deltaComplex oldFaceLow="
                                                   (QREFELT $ 29))
                                         (SPADCALL |oldFaceLow| (QREFELT $ 42))
                                         (QREFELT $ 31))
                                        (SPADCALL
                                         " not found in previousFaceList="
                                         (QREFELT $ 29))
                                        (QREFELT $ 31))
                                       (SPADCALL |previousFaceList|
                                                 (QREFELT $ 38))
                                       (QREFELT $ 31))
                                      (QREFELT $ 34))
                                     (EXIT
                                      (|error|
                                       (STRCONC "cant find index:"
                                                (STRINGIMAGE |i|)))))))
                                  (EXIT
                                   (LETT |newIndexes| (CONS |i| |newIndexes|)
                                         . #18#)))
                                 (LETT #2# (CDR #2#) . #18#) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (LETT |map1| (CONS (NREVERSE |newIndexes|) |map1|)
                                   . #18#)))
                           (LETT #3# (CDR #3#) . #18#) (GO G190) G191
                           (EXIT NIL))))
                    (LETT |faceMaps| (CONS (NREVERSE |map1|) |faceMaps|)
                          . #18#)
                    (EXIT (LETT |previousFaceList| |gradeList| . #18#)))
                   (LETT #14#
                         (PROG1 (CDR #14#)
                           (LETT |grn| (|inc_SI| |grn|) . #18#))
                         . #18#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |vs| (QVELT |fscRep| 0) . #18#)
              (COND
               (|trace|
                (SPADCALL
                 (SPADCALL (SPADCALL "deltaComplex faceMaps=" (QREFELT $ 29))
                           (SPADCALL |faceMaps| (QREFELT $ 50)) (QREFELT $ 31))
                 (QREFELT $ 34))))
              (EXIT (CONS |vs| |faceMaps|))))) 

(SDEFUN |DELTAC;deltaComplex;Fcc$;5| ((|fsc| |FiniteCubicalComplex| VS) ($ $))
        (SPROG
         ((|fp| (|List| (|List| (|List| (|Integer|)))))
          (|f0| (|List| (|List| (|Integer|)))) (|m| (|NonNegativeInteger|))
          (|vs| (|List| VS)) (|previousFaceList| (|List| (|CubicalFacet|)))
          (|faceMaps| (|List| (|List| (|List| (|Integer|)))))
          (|map1| (|List| (|List| (|Integer|))))
          (|newIndexes| (|List| (|Integer|))) (|i| (|Integer|)) (#1=#:G807 NIL)
          (|oldFaceLow| NIL) (|oldFacesLow| (|List| (|CubicalFacet|)))
          (#2=#:G806 NIL) (|oldFaceHigh| NIL) (#3=#:G804 NIL) (|gradeList| NIL)
          (#4=#:G805 NIL) (|grn| NIL)
          (|allFacetsGraded| (|List| (|List| (|CubicalFacet|))))
          (#5=#:G803 NIL) (|gradedList| NIL)
          (|allFacets| (|List| (|List| (|CubicalFacet|)))))
         (SEQ
          (LETT |allFacets| (SPADCALL |fsc| (QREFELT $ 53))
                . #6=(|DELTAC;deltaComplex;Fcc$;5|))
          (LETT |allFacetsGraded| NIL . #6#)
          (SEQ (LETT |gradedList| NIL . #6#) (LETT #5# |allFacets| . #6#) G190
               (COND
                ((OR (ATOM #5#)
                     (PROGN (LETT |gradedList| (CAR #5#) . #6#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |allFacetsGraded|
                       (SPADCALL |allFacetsGraded|
                                 (SPADCALL |gradedList| (QREFELT $ 55))
                                 (QREFELT $ 56))
                       . #6#)))
               (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
          (LETT |faceMaps| NIL . #6#)
          (LETT |previousFaceList| (|SPADfirst| |allFacetsGraded|) . #6#)
          (SEQ (LETT |grn| 1 . #6#) (LETT #4# (LENGTH |allFacetsGraded|) . #6#)
               (LETT |gradeList| NIL . #6#) (LETT #3# |allFacetsGraded| . #6#)
               G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |gradeList| (CAR #3#) . #6#) NIL)
                     (|greater_SI| |grn| #4#))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND ((EQL |grn| 1) "iterate")
                       ('T
                        (SEQ (LETT |map1| NIL . #6#)
                             (SEQ (LETT |oldFaceHigh| NIL . #6#)
                                  (LETT #2# |gradeList| . #6#) G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN
                                         (LETT |oldFaceHigh| (CAR #2#) . #6#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (LETT |oldFacesLow|
                                         (SPADCALL |oldFaceHigh|
                                                   (QREFELT $ 58))
                                         . #6#)
                                   (LETT |newIndexes| NIL . #6#)
                                   (SEQ (LETT |oldFaceLow| NIL . #6#)
                                        (LETT #1# |oldFacesLow| . #6#) G190
                                        (COND
                                         ((OR (ATOM #1#)
                                              (PROGN
                                               (LETT |oldFaceLow| (CAR #1#)
                                                     . #6#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (LETT |i|
                                               (SPADCALL |oldFaceLow|
                                                         |previousFaceList|
                                                         (QREFELT $ 59))
                                               . #6#)
                                         (COND
                                          ((EQL |i| 0)
                                           (SEQ
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL
                                                 "  deltaComplex oldFaceLow="
                                                 (QREFELT $ 29))
                                                (SPADCALL |oldFaceLow|
                                                          (QREFELT $ 60))
                                                (QREFELT $ 31))
                                               (SPADCALL
                                                " not found in previousFaceList="
                                                (QREFELT $ 29))
                                               (QREFELT $ 31))
                                              (SPADCALL |previousFaceList|
                                                        (QREFELT $ 61))
                                              (QREFELT $ 31))
                                             (QREFELT $ 34))
                                            (EXIT
                                             (|error|
                                              (STRCONC
                                               "deltaComplex: cant find index:"
                                               (STRINGIMAGE |i|)))))))
                                         (EXIT
                                          (LETT |newIndexes|
                                                (CONS |i| |newIndexes|)
                                                . #6#)))
                                        (LETT #1# (CDR #1#) . #6#) (GO G190)
                                        G191 (EXIT NIL))
                                   (EXIT
                                    (LETT |map1|
                                          (CONS (NREVERSE |newIndexes|) |map1|)
                                          . #6#)))
                                  (LETT #2# (CDR #2#) . #6#) (GO G190) G191
                                  (EXIT NIL))
                             (LETT |faceMaps|
                                   (CONS (NREVERSE |map1|) |faceMaps|) . #6#)
                             (EXIT
                              (LETT |previousFaceList| |gradeList| . #6#)))))))
               (LETT #3# (PROG1 (CDR #3#) (LETT |grn| (|inc_SI| |grn|) . #6#))
                     . #6#)
               (GO G190) G191 (EXIT NIL))
          (LETT |vs| (QCAR |fsc|) . #6#)
          (LETT |m| (SPADCALL |fsc| (QREFELT $ 62)) . #6#)
          (LETT |f0|
                (|DELTAC;dim1todim0|
                 (SPADCALL |faceMaps| '|last| (QREFELT $ 18)) |m| $)
                . #6#)
          (LETT |fp| (SPADCALL |faceMaps| |f0| (QREFELT $ 19)) . #6#)
          (EXIT (CONS |vs| |fp|))))) 

(SDEFUN |DELTAC;link;2Nni$;6|
        ((|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|simp| (|List| (|List| (|List| (|Integer|)))))
          (|points| (|List| (|List| (|Integer|)))) (|vs| (|List| VS)))
         (SEQ (LETT |vs| NIL . #1=(|DELTAC;link;2Nni$;6|))
              (LETT |simp| (LIST (LIST (LIST |a| |b|))) . #1#)
              (LETT |points| (|DELTAC;dim1todim0| (|SPADfirst| |simp|) 2 $)
                    . #1#)
              (LETT |simp| (SPADCALL |simp| |points| (QREFELT $ 19)) . #1#)
              (EXIT (CONS |vs| |simp|))))) 

(SDEFUN |DELTAC;triangle;3Nni$;7|
        ((|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         (|c| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|simp| (|List| #1=(|List| (|List| (|Integer|))))) (|points| #1#)
          (|triangles| (|List| (|List| (|Integer|))))
          (|edges| (|List| (|List| (|Integer|)))) (|vs| (|List| VS)))
         (SEQ (LETT |vs| NIL . #2=(|DELTAC;triangle;3Nni$;7|))
              (LETT |edges| (LIST (LIST |a| |b|) (LIST |a| |c|) (LIST |b| |c|))
                    . #2#)
              (LETT |triangles| (LIST (LIST 1 -2 3)) . #2#)
              (LETT |points| (|DELTAC;dim1todim0| |edges| 3 $) . #2#)
              (LETT |simp| (LIST |triangles| |edges| |points|) . #2#)
              (EXIT (CONS |vs| |simp|))))) 

(SDEFUN |DELTAC;faceMap;$NniL;8|
        ((|s| $) (|n| |NonNegativeInteger|) ($ |List| (|List| (|Integer|))))
        (SPROG
         ((#1=#:G816 NIL) (|maps1| (|List| (|List| (|List| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |maps1| (REVERSE (QCDR |s|)) . #2=(|DELTAC;faceMap;$NniL;8|))
            (COND
             ((SPADCALL |n| (LENGTH |maps1|) (QREFELT $ 10))
              (PROGN (LETT #1# NIL . #2#) (GO #3=#:G815))))
            (EXIT (SPADCALL |maps1| |n| (QREFELT $ 66)))))
          #3# (EXIT #1#)))) 

(SDEFUN |DELTAC;chain;$Cc;9| ((|s| $) ($ |ChainComplex|))
        (SPROG
         ((|res| (|List| (|Matrix| (|Integer|)))) (|m| (|Matrix| (|Integer|)))
          (|n_rows| (|NonNegativeInteger|)) (|ele| (|Integer|))
          (|v2| (|Integer|)) (#1=#:G829 NIL) (|v| NIL) (#2=#:G827 NIL)
          (|u| NIL) (#3=#:G828 NIL) (|nu| NIL)
          (|n_cols| (|NonNegativeInteger|)) (#4=#:G826 NIL) (|faces| NIL)
          (|maps1| (|List| (|List| (|List| (|Integer|))))))
         (SEQ (LETT |res| NIL . #5=(|DELTAC;chain;$Cc;9|))
              (LETT |maps1| (REVERSE (QCDR |s|)) . #5#) (LETT |n_rows| 1 . #5#)
              (SEQ (LETT |faces| NIL . #5#) (LETT #4# |maps1| . #5#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |faces| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ (LETT |n_cols| (LENGTH |faces|) . #5#)
                        (LETT |m| (SPADCALL |n_rows| |n_cols| (QREFELT $ 69))
                              . #5#)
                        (SEQ (LETT |nu| 1 . #5#)
                             (LETT #3# (LENGTH |faces|) . #5#)
                             (LETT |u| NIL . #5#) (LETT #2# |faces| . #5#) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |u| (CAR #2#) . #5#) NIL)
                                   (|greater_SI| |nu| #3#))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |v| NIL . #5#) (LETT #1# |u| . #5#)
                                    G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN
                                           (LETT |v| (CAR #1#) . #5#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ (LETT |v2| (ABS |v|) . #5#)
                                         (EXIT
                                          (COND
                                           ((SPADCALL |v2| 0 (QREFELT $ 70))
                                            (SEQ
                                             (LETT |ele|
                                                   (COND
                                                    ((SPADCALL |v| 0
                                                               (QREFELT $ 70))
                                                     1)
                                                    ('T -1))
                                                   . #5#)
                                             (EXIT
                                              (SPADCALL |m| |v2| |nu|
                                                        (+
                                                         (QAREF2O |m| |v2| |nu|
                                                                  1 1)
                                                         |ele|)
                                                        (QREFELT $ 71))))))))
                                    (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                    (EXIT NIL))))
                             (LETT #2#
                                   (PROG1 (CDR #2#)
                                     (LETT |nu| (|inc_SI| |nu|) . #5#))
                                   . #5#)
                             (GO G190) G191 (EXIT NIL))
                        (LETT |res| (CONS |m| |res|) . #5#)
                        (EXIT (LETT |n_rows| |n_cols| . #5#)))
                   (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
              (LETT |m| (MAKE_MATRIX1 |n_rows| 0 0) . #5#)
              (LETT |res| (CONS |m| |res|) . #5#)
              (EXIT (SPADCALL (NREVERSE |res|) (QREFELT $ 74)))))) 

(SDEFUN |DELTAC;coChain;$Ccc;10| ((|s| $) ($ |CoChainComplex| VS))
        (SPROG
         ((|res| (|List| (|Matrix| (|Integer|)))) (|m| (|Matrix| (|Integer|)))
          (|n_rows| (|NonNegativeInteger|)) (|ele| (|Integer|))
          (|v2| (|Integer|)) (#1=#:G841 NIL) (|v| NIL) (#2=#:G839 NIL)
          (|u| NIL) (#3=#:G840 NIL) (|nu| NIL)
          (|n_cols| (|NonNegativeInteger|)) (#4=#:G838 NIL) (|faces| NIL)
          (|maps1| (|List| (|List| (|List| (|Integer|))))))
         (SEQ (LETT |res| NIL . #5=(|DELTAC;coChain;$Ccc;10|))
              (LETT |maps1| (REVERSE (QCDR |s|)) . #5#) (LETT |n_rows| 1 . #5#)
              (SEQ (LETT |faces| NIL . #5#) (LETT #4# |maps1| . #5#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |faces| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ (LETT |n_cols| (LENGTH |faces|) . #5#)
                        (LETT |m| (SPADCALL |n_cols| |n_rows| (QREFELT $ 69))
                              . #5#)
                        (SEQ (LETT |nu| 1 . #5#)
                             (LETT #3# (LENGTH |faces|) . #5#)
                             (LETT |u| NIL . #5#) (LETT #2# |faces| . #5#) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |u| (CAR #2#) . #5#) NIL)
                                   (|greater_SI| |nu| #3#))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |v| NIL . #5#) (LETT #1# |u| . #5#)
                                    G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN
                                           (LETT |v| (CAR #1#) . #5#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ (LETT |v2| (ABS |v|) . #5#)
                                         (EXIT
                                          (COND
                                           ((SPADCALL |v2| 0 (QREFELT $ 70))
                                            (SEQ
                                             (LETT |ele|
                                                   (COND
                                                    ((SPADCALL |v| 0
                                                               (QREFELT $ 70))
                                                     1)
                                                    ('T -1))
                                                   . #5#)
                                             (EXIT
                                              (SPADCALL |m| |nu| |v2|
                                                        (+
                                                         (QAREF2O |m| |nu| |v2|
                                                                  1 1)
                                                         |ele|)
                                                        (QREFELT $ 71))))))))
                                    (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                    (EXIT NIL))))
                             (LETT #2#
                                   (PROG1 (CDR #2#)
                                     (LETT |nu| (|inc_SI| |nu|) . #5#))
                                   . #5#)
                             (GO G190) G191 (EXIT NIL))
                        (LETT |res| (CONS |m| |res|) . #5#)
                        (EXIT (LETT |n_rows| |n_cols| . #5#)))
                   (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
              (LETT |m| (MAKE_MATRIX1 0 |n_rows| 0) . #5#)
              (LETT |res| (CONS |m| |res|) . #5#)
              (EXIT (SPADCALL |res| (QREFELT $ 77)))))) 

(SDEFUN |DELTAC;homology;$L;11| ((|a| $) ($ |List| (|Homology|)))
        (SPROG ((|cc| (|ChainComplex|)))
               (SEQ
                (LETT |cc| (SPADCALL |a| (QREFELT $ 75))
                      |DELTAC;homology;$L;11|)
                (SPADCALL |cc| (QREFELT $ 79))
                (EXIT (SPADCALL |cc| (QREFELT $ 81)))))) 

(SDEFUN |DELTAC;coHomology;$L;12| ((|a| $) ($ |List| (|Homology|)))
        (SPROG ((|cc| (|CoChainComplex| VS)))
               (SEQ
                (LETT |cc| (SPADCALL |a| (QREFELT $ 78))
                      |DELTAC;coHomology;$L;12|)
                (SPADCALL |cc| (QREFELT $ 83))
                (EXIT (SPADCALL |cc| (QREFELT $ 84)))))) 

(SDEFUN |DELTAC;oneSkeleton;$Ug;13|
        ((|s| $) ($ |UndirectedGraph| (|NonNegativeInteger|)))
        (SPROG
         ((|nodes|
           (|List|
            (|Record| (|:| |value| (|NonNegativeInteger|))
                      (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (#1=#:G859 NIL) (|m1| NIL)
          (|edges|
           (|List|
            #2=(|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|y| #2#) (|m| (|NonNegativeInteger|)) (|to1| (|NonNegativeInteger|))
          (|from1| (|NonNegativeInteger|)) (#3=#:G858 NIL) (|x| NIL)
          (|edgeIndexes| (|List| (|List| (|Integer|)))) (#4=#:G857 NIL)
          (GS
           (|Join| (|FiniteGraph| #5=(|NonNegativeInteger|))
                   (CATEGORY |domain|
                    (SIGNATURE |undirectedGraph| ($ (|List| #5#)))
                    (SIGNATURE |undirectedGraph|
                     ($
                      (|List|
                       (|Record| (|:| |value| #5#)
                                 (|:| |posX| (|NonNegativeInteger|))
                                 (|:| |posY| (|NonNegativeInteger|))))))
                    (SIGNATURE |undirectedGraph|
                     ($
                      (|List|
                       (|Record| (|:| |value| #5#)
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
                    (SIGNATURE |undirectedGraph|
                     ($ (|List| #5#)
                      (|List|
                       (|Record| (|:| |fromOb| (|NonNegativeInteger|))
                                 (|:| |toOb| (|NonNegativeInteger|))))))
                    (SIGNATURE |undirectedGraph| ($ (|FinitePoset| #5#)))
                    (SIGNATURE |undirectedGraph|
                     ($ (|List| #5#) (|List| (|List| (|NonNegativeInteger|)))))
                    (SIGNATURE * ((|UndirectedGraph| (|Product| #5# #5#)) $ $))
                    (SIGNATURE |cartesian|
                     ((|UndirectedGraph| (|Product| #5# #5#)) $ $))
                    (SIGNATURE |closedTensor| ($ $ $ (|Mapping| #5# #5# #5#)))
                    (SIGNATURE |closedCartesian|
                     ($ $ $ (|Mapping| #5# #5# #5#)))
                    (SIGNATURE |diagramSvg2|
                     ((|Void|) (|String|) $ (|Boolean|)))
                    (SIGNATURE |coerce| ($ (|FinitePoset| #5#)))))))
         (SEQ
          (EXIT
           (SEQ
            (LETT GS (|UndirectedGraph| (|NonNegativeInteger|))
                  . #6=(|DELTAC;oneSkeleton;$Ug;13|))
            (LETT |nodes| NIL . #6#) (LETT |edges| NIL . #6#)
            (COND
             ((< (LENGTH (QCDR |s|)) 2)
              (PROGN
               (LETT #4#
                     (SPADCALL (|compiledLookupCheck| '|initial| (LIST '$) GS))
                     . #6#)
               (GO #7=#:G856))))
            (LETT |m| (LENGTH (SPADCALL (REVERSE (QCDR |s|)) (QREFELT $ 86)))
                  . #6#)
            (LETT |edgeIndexes| (SPADCALL (REVERSE (QCDR |s|)) (QREFELT $ 86))
                  . #6#)
            (SEQ (LETT |x| NIL . #6#) (LETT #3# |edgeIndexes| . #6#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #6#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |from1| (ABS (SPADCALL |x| 1 (QREFELT $ 87))) . #6#)
                  (COND
                   ((SPADCALL |from1| |m| (QREFELT $ 10))
                    (LETT |m| |from1| . #6#)))
                  (LETT |to1| (ABS (SPADCALL |x| 2 (QREFELT $ 87))) . #6#)
                  (COND
                   ((SPADCALL |to1| |m| (QREFELT $ 10))
                    (LETT |m| |to1| . #6#)))
                  (LETT |y| (VECTOR "x" 0 |from1| |to1| 0 0 NIL) . #6#)
                  (EXIT
                   (LETT |edges| (SPADCALL |edges| |y| (QREFELT $ 90)) . #6#)))
                 (LETT #3# (CDR #3#) . #6#) (GO G190) G191 (EXIT NIL))
            (SEQ (LETT |m1| 1 . #6#) (LETT #1# |m| . #6#) G190
                 (COND ((|greater_SI| |m1| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |nodes|
                         (SPADCALL |nodes| (VECTOR |m1| 0 0) (QREFELT $ 93))
                         . #6#)))
                 (LETT |m1| (|inc_SI| |m1|) . #6#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (SPADCALL |nodes| |edges|
                       (|compiledLookupCheck| '|undirectedGraph|
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
                                                                (LIST '|:|
                                                                      '|map|
                                                                      (LIST
                                                                       '|List|
                                                                       (LIST
                                                                        '|NonNegativeInteger|))))))
                                              GS)))))
          #7# (EXIT #4#)))) 

(SDEFUN |DELTAC;linksInTree|
        ((|res| |List| (|List| (|Integer|))) (|a| |Tree| (|Integer|))
         ($ |List| (|List| (|Integer|))))
        (SPROG
         ((#1=#:G867 NIL) (|x| NIL) (|newLink| (|List| #2=(|Integer|)))
          (|toNode| #2#) (#3=#:G866 NIL) (|fromNode| #2#))
         (SEQ
          (LETT |fromNode| (SPADCALL |a| (QREFELT $ 97))
                . #4=(|DELTAC;linksInTree|))
          (SEQ (LETT |x| NIL . #4#)
               (LETT #3# (SPADCALL |a| (QREFELT $ 98)) . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ (LETT |toNode| (SPADCALL |x| (QREFELT $ 97)) . #4#)
                    (LETT |newLink| (LIST |fromNode| |toNode|) . #4#)
                    (EXIT
                     (LETT |res| (SPADCALL |res| |newLink| (QREFELT $ 99))
                           . #4#)))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |x| NIL . #4#)
               (LETT #1# (SPADCALL |a| (QREFELT $ 98)) . #4#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT (LETT |res| (|DELTAC;linksInTree| |res| |x| $) . #4#)))
               (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |DELTAC;containsEdge?|
        ((|edge| |List| (|Integer|)) (|edges| |List| (|List| (|Integer|)))
         ($ |Boolean|))
        (SPROG
         ((#1=#:G878 NIL) (|t2| #2=(|Integer|)) (|s2| #2#) (#3=#:G879 NIL)
          (|e| NIL) (|t| #2#) (|s| #2#))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((< (LENGTH |edge|) 2)
              (PROGN
               (LETT #1# NIL . #4=(|DELTAC;containsEdge?|))
               (GO #5=#:G877))))
            (LETT |s| (SPADCALL |edge| 1 (QREFELT $ 87)) . #4#)
            (LETT |t| (SPADCALL |edge| 2 (QREFELT $ 87)) . #4#)
            (SEQ (LETT |e| NIL . #4#) (LETT #3# |edges| . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |e| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL (LENGTH |e|) 1 (QREFELT $ 10))
                     (SEQ (LETT |s2| (SPADCALL |e| 1 (QREFELT $ 87)) . #4#)
                          (LETT |t2| (SPADCALL |e| 2 (QREFELT $ 87)) . #4#)
                          (COND
                           ((EQL (ABS |s|) (ABS |s2|))
                            (COND
                             ((EQL (ABS |t|) (ABS |t2|))
                              (PROGN (LETT #1# 'T . #4#) (GO #5#))))))
                          (EXIT
                           (COND
                            ((EQL (ABS |s|) (ABS |t2|))
                             (COND
                              ((EQL (ABS |t|) (ABS |s2|))
                               (PROGN (LETT #1# 'T . #4#) (GO #5#))))))))))))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT NIL)))
          #5# (EXIT #1#)))) 

(SDEFUN |DELTAC;fundamentalGroup;$Gp;16| ((|s| $) ($ |GroupPresentation|))
        (SPADCALL |s| 'T NIL (QREFELT $ 101))) 

(SDEFUN |DELTAC;fundamentalGroup;$2BGp;17|
        ((|s| $) (|simplify| |Boolean|) (|trace| |Boolean|)
         ($ |GroupPresentation|))
        (SPROG
         ((#1=#:G893 NIL) (|gp| (|GroupPresentation|))
          (|generators| (|List| (|NonNegativeInteger|))) (#2=#:G900 NIL)
          (|x| NIL) (|m| (|NonNegativeInteger|))
          (|rules| (|List| (|List| (|Integer|)))) (|rule| (|List| (|Integer|)))
          (#3=#:G899 NIL) (|vertn| NIL) (#4=#:G898 NIL) (|t| NIL)
          (|polygons| #5=(|List| (|List| (|Integer|)))) (#6=#:G896 NIL)
          (|edge| NIL) (#7=#:G897 NIL) (|edgen| NIL)
          (|edgesInTree| (|List| (|Boolean|))) (#8=#:G895 NIL) (|y| NIL)
          (#9=#:G894 NIL) (|res| (|List| (|List| (|Integer|)))) (|edges| #5#)
          (|span| (|Tree| (|Integer|)))
          (|graph| (|UndirectedGraph| (|NonNegativeInteger|))))
         (SEQ
          (EXIT
           (SEQ
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL
                (SPADCALL (SPADCALL "fundamentalGroup(" (QREFELT $ 29))
                          (SPADCALL |s| (QREFELT $ 103)) (QREFELT $ 31))
                (SPADCALL ")" (QREFELT $ 29)) (QREFELT $ 31))
               (QREFELT $ 34))))
            (LETT |graph| (SPADCALL |s| (QREFELT $ 95))
                  . #10=(|DELTAC;fundamentalGroup;$2BGp;17|))
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL (SPADCALL "fundamentalGroup graph=" (QREFELT $ 104))
                         (SPADCALL |graph| (QREFELT $ 105)) (QREFELT $ 31))
               (QREFELT $ 34))))
            (LETT |span| (SPADCALL |graph| 1 (QREFELT $ 106)) . #10#)
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL (SPADCALL "fundamentalGroup span=" (QREFELT $ 29))
                         (SPADCALL |span| (QREFELT $ 107)) (QREFELT $ 31))
               (QREFELT $ 34))))
            (LETT |edges| (SPADCALL |s| 2 (QREFELT $ 67)) . #10#)
            (LETT |res| (|DELTAC;linksInTree| |res| |span| $) . #10#)
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL "fundamentalGroup edges=" (QREFELT $ 29))
                           (SPADCALL |edges| (QREFELT $ 44)) (QREFELT $ 31))
                 (SPADCALL " res=" (QREFELT $ 29)) (QREFELT $ 31))
                (SPADCALL |res| (QREFELT $ 44)) (QREFELT $ 31))
               (QREFELT $ 34))))
            (LETT |edgesInTree|
                  (PROGN
                   (LETT #9# NIL . #10#)
                   (SEQ (LETT |y| NIL . #10#) (LETT #8# |edges| . #10#) G190
                        (COND
                         ((OR (ATOM #8#)
                              (PROGN (LETT |y| (CAR #8#) . #10#) NIL))
                          (GO G191)))
                        (SEQ (EXIT (LETT #9# (CONS NIL #9#) . #10#)))
                        (LETT #8# (CDR #8#) . #10#) (GO G190) G191
                        (EXIT (NREVERSE #9#))))
                  . #10#)
            (SEQ (LETT |edgen| 1 . #10#) (LETT #7# (LENGTH |edges|) . #10#)
                 (LETT |edge| NIL . #10#) (LETT #6# |edges| . #10#) G190
                 (COND
                  ((OR (ATOM #6#) (PROGN (LETT |edge| (CAR #6#) . #10#) NIL)
                       (|greater_SI| |edgen| #7#))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((|DELTAC;containsEdge?| |edge| |res| $)
                     (SPADCALL |edgesInTree| |edgen| 'T (QREFELT $ 14))))))
                 (LETT #6#
                       (PROG1 (CDR #6#)
                         (LETT |edgen| (|inc_SI| |edgen|) . #10#))
                       . #10#)
                 (GO G190) G191 (EXIT NIL))
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL "fundamentalGroup linksInTree=" (QREFELT $ 29))
                  (SPADCALL |res| (QREFELT $ 44)) (QREFELT $ 31))
                 (SPADCALL " edgesInTree=" (QREFELT $ 29)) (QREFELT $ 31))
                (SPADCALL |edgesInTree| (QREFELT $ 108)) (QREFELT $ 31))
               (QREFELT $ 34))))
            (LETT |polygons| (SPADCALL |s| 3 (QREFELT $ 67)) . #10#)
            (LETT |rules| NIL . #10#)
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL (SPADCALL "fundamentalGroup polygons=" (QREFELT $ 29))
                         (SPADCALL |polygons| (QREFELT $ 44)) (QREFELT $ 31))
               (QREFELT $ 34))))
            (SEQ (LETT |t| NIL . #10#) (LETT #4# |polygons| . #10#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #10#) NIL))
                   (GO G191)))
                 (SEQ (LETT |rule| NIL . #10#)
                      (SEQ (LETT |vertn| 1 . #10#)
                           (LETT #3# (LENGTH |t|) . #10#) G190
                           (COND ((|greater_SI| |vertn| #3#) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((NULL
                                (SPADCALL |edgesInTree|
                                          (ABS
                                           (SPADCALL |t| |vertn|
                                                     (QREFELT $ 87)))
                                          (QREFELT $ 109)))
                               (LETT |rule|
                                     (SPADCALL |rule|
                                               (SPADCALL |t| |vertn|
                                                         (QREFELT $ 87))
                                               (QREFELT $ 110))
                                     . #10#)))))
                           (LETT |vertn| (|inc_SI| |vertn|) . #10#) (GO G190)
                           G191 (EXIT NIL))
                      (EXIT
                       (COND
                        ((NULL (NULL |rule|))
                         (LETT |rules| (SPADCALL |rules| |rule| (QREFELT $ 99))
                               . #10#)))))
                 (LETT #4# (CDR #4#) . #10#) (GO G190) G191 (EXIT NIL))
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL (SPADCALL "fundamentalGroup rules=" (QREFELT $ 29))
                         (SPADCALL |rules| (QREFELT $ 44)) (QREFELT $ 31))
               (QREFELT $ 34))))
            (LETT |m| (LENGTH |edges|) . #10#) (LETT |generators| NIL . #10#)
            (SEQ (LETT |x| 1 . #10#) (LETT #2# |m| . #10#) G190
                 (COND ((|greater_SI| |x| #2#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((NULL (SPADCALL |edgesInTree| |x| (QREFELT $ 109)))
                     (LETT |generators|
                           (SPADCALL |generators| |x| (QREFELT $ 112))
                           . #10#)))))
                 (LETT |x| (|inc_SI| |x|) . #10#) (GO G190) G191 (EXIT NIL))
            (LETT |gp| (SPADCALL |generators| |rules| (QREFELT $ 113)) . #10#)
            (COND
             ((NULL |simplify|)
              (PROGN (LETT #1# |gp| . #10#) (GO #11=#:G892))))
            (EXIT (SPADCALL |gp| |trace| (QREFELT $ 114)))))
          #11# (EXIT #1#)))) 

(SDEFUN |DELTAC;equalSimplex|
        ((|a| |List| (|Integer|)) (|b| |List| (|Integer|)) ($ |Boolean|))
        (SPROG
         ((|offset| (|Integer|)) (#1=#:G908 NIL) (#2=#:G909 NIL) (|n| NIL)
          (|fst| (|Integer|)) (|len| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |len| (LENGTH |a|) . #3=(|DELTAC;equalSimplex|))
                (COND
                 ((SPADCALL |len| (LENGTH |b|) (QREFELT $ 115))
                  (PROGN (LETT #1# NIL . #3#) (GO #4=#:G907))))
                (COND ((EQL |len| 0) (PROGN (LETT #1# 'T . #3#) (GO #4#))))
                (LETT |fst| (|SPADfirst| |a|) . #3#)
                (LETT |offset| (SPADCALL |fst| |b| (QREFELT $ 116)) . #3#)
                (COND ((< |offset| 1) (PROGN (LETT #1# NIL . #3#) (GO #4#))))
                (SEQ (LETT |n| 1 . #3#) (LETT #2# (LENGTH |a|) . #3#) G190
                     (COND ((|greater_SI| |n| #2#) (GO G191)))
                     (SEQ
                      (COND
                       ((SPADCALL (SPADCALL |a| |n| (QREFELT $ 87))
                                  (SPADCALL |b| |offset| (QREFELT $ 87))
                                  (QREFELT $ 117))
                        (PROGN (LETT #1# NIL . #3#) (GO #4#))))
                      (LETT |offset| (+ |offset| 1) . #3#)
                      (EXIT
                       (COND
                        ((SPADCALL |offset| (LENGTH |b|) (QREFELT $ 70))
                         (LETT |offset| 1 . #3#)))))
                     (LETT |n| (|inc_SI| |n|) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #4# (EXIT #1#)))) 

(SDEFUN |DELTAC;=;2$B;19| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G913 NIL) (|len| (|NonNegativeInteger|))
          (|bs| #2=(|List| (|List| (|List| (|Integer|))))) (|as| #2#))
         (SEQ
          (EXIT
           (SEQ (LETT |as| (QCDR |a|) . #3=(|DELTAC;=;2$B;19|))
                (LETT |bs| (QCDR |b|) . #3#) (LETT |len| (LENGTH |as|) . #3#)
                (COND
                 ((SPADCALL |len| (LENGTH |bs|) (QREFELT $ 115))
                  (PROGN (LETT #1# NIL . #3#) (GO #4=#:G912))))
                (EXIT 'T)))
          #4# (EXIT #1#)))) 

(SDEFUN |DELTAC;coerce;$Of;20| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|tabNum| (|Integer|)) (|res| (|OutputForm|)) (|row| (|OutputForm|))
          (#1=#:G920 NIL) (|a| NIL) (#2=#:G919 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |res| (SPADCALL (QREFELT $ 119))
                  . #3=(|DELTAC;coerce;$Of;20|))
            (COND
             ((NULL (QCDR |s|))
              (PROGN
               (LETT #2#
                     (SPADCALL
                      (LIST (SPADCALL "1D: points 1.." (QREFELT $ 29)))
                      (QREFELT $ 120))
                     . #3#)
               (GO #4=#:G918))))
            (LETT |tabNum| (- (LENGTH (QCDR |s|)) 1) . #3#)
            (SEQ (LETT |a| NIL . #3#) (LETT #1# (QCDR |s|) . #3#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |row|
                        (SPADCALL
                         (LIST (SPADCALL " " (QREFELT $ 29))
                               (SPADCALL |tabNum| (QREFELT $ 121))
                               (SPADCALL "D:" (QREFELT $ 29))
                               (SPADCALL |a| (QREFELT $ 44)))
                         (QREFELT $ 120))
                        . #3#)
                  (LETT |res| (SPADCALL |res| |row| (QREFELT $ 122)) . #3#)
                  (EXIT (LETT |tabNum| (- |tabNum| 1) . #3#)))
                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT |res|)))
          #4# (EXIT #2#)))) 

(SDEFUN |DELTAC;coerce;$Fsc;21| ((|s| $) ($ |FiniteSimplicialComplex| VS))
        (SPROG ((#1=#:G922 NIL))
               (PROG2
                   (LETT #1# (SPADCALL |s| (QREFELT $ 125))
                         |DELTAC;coerce;$Fsc;21|)
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0)
                                 (|FiniteSimplicialComplex| (QREFELT $ 6))
                                 (|Union|
                                  (|FiniteSimplicialComplex| (QREFELT $ 6))
                                  "failed")
                                 #1#)))) 

(DECLAIM (NOTINLINE |DeltaComplex;|)) 

(DEFUN |DeltaComplex| (#1=#:G925)
  (SPROG NIL
         (PROG (#2=#:G926)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|DeltaComplex|)
                                               '|domainEqualList|)
                    . #3=(|DeltaComplex|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|DeltaComplex;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|DeltaComplex|)))))))))) 

(DEFUN |DeltaComplex;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|DeltaComplex|))
          (LETT |dv$| (LIST '|DeltaComplex| DV$1) . #1#)
          (LETT $ (GETREFV 129) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|DeltaComplex| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record| (|:| VERTSET (|List| |#1|))
                              (|:| MAPS
                                   (|List| (|List| (|List| (|Integer|)))))))
          $))) 

(MAKEPROP '|DeltaComplex| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Boolean|)
              (|NonNegativeInteger|) (0 . >) (|List| 8) (6 . |new|) (|Integer|)
              (12 . |setelt!|) (|List| 39) '"last" (|List| 15) (19 . |elt|)
              (25 . |concat|) (|List| 6) |DELTAC;deltaComplex;LNniL$;2|
              (|FiniteSimplicialComplex| 6) |DELTAC;deltaComplex;FscB$;4|
              |DELTAC;deltaComplex;Fsc$;3| (|List| 35) (31 . |addImpliedFaces|)
              (|String|) (|OutputForm|) (36 . |message|) (41 . |coerce|)
              (46 . |hconcat|) (52 . |coerce|) (|Void|) (57 . |print|)
              (|List| 40) (62 . |sort|) (67 . |coerce|) (72 . |coerce|)
              (|List| 13) (|OrientedFacet|) (77 . |getIndexesSigned|)
              (82 . |coerce|) (87 . |coerce|) (92 . |coerce|) (|List| $)
              (97 . |boundary|) (102 . |elt|) (108 . |position|) (114 . |Zero|)
              (118 . |coerce|) (|List| 54) (|FiniteCubicalComplex| 6)
              (123 . |addImpliedFaces|) (|List| 57) (128 . |sort|)
              (133 . |concat|) (|CubicalFacet|) (139 . |boundary|)
              (144 . |position|) (150 . |coerce|) (155 . |coerce|)
              (160 . |maxIndex|) |DELTAC;deltaComplex;Fcc$;5|
              |DELTAC;link;2Nni$;6| |DELTAC;triangle;3Nni$;7| (165 . |elt|)
              |DELTAC;faceMap;$NniL;8| (|Matrix| 13) (171 . |zero|) (177 . >)
              (183 . |setelt!|) (|List| 68) (|ChainComplex|)
              (191 . |chainComplex|) |DELTAC;chain;$Cc;9| (|CoChainComplex| 6)
              (196 . |coChainComplex|) |DELTAC;coChain;$Ccc;10|
              (201 . |validate|) (|List| (|Homology|)) (206 . |homology|)
              |DELTAC;homology;$L;11| (211 . |validate|) (216 . |coHomology|)
              |DELTAC;coHomology;$L;12| (221 . |second|) (226 . |elt|)
              (|Record| (|:| |name| 27) (|:| |arrType| 9) (|:| |fromOb| 9)
                        (|:| |toOb| 9) (|:| |xOffset| 13) (|:| |yOffset| 13)
                        (|:| |map| 111))
              (|List| 88) (232 . |concat|)
              (|Record| (|:| |value| 9) (|:| |posX| 9) (|:| |posY| 9))
              (|List| 91) (238 . |concat|) (|UndirectedGraph| 9)
              |DELTAC;oneSkeleton;$Ug;13| (|Tree| 13) (244 . |value|)
              (249 . |children|) (254 . |concat|) (|GroupPresentation|)
              |DELTAC;fundamentalGroup;$2BGp;17|
              |DELTAC;fundamentalGroup;$Gp;16| |DELTAC;coerce;$Of;20|
              (260 . |coerce|) (265 . |coerce|) (270 . |spanningTreeNode|)
              (276 . |coerce|) (281 . |coerce|) (286 . |elt|) (292 . |concat|)
              (|List| 9) (298 . |concat|) (304 . |groupPresentation|)
              (310 . |simplify|) (316 . ~=) (322 . |position|) (328 . ~=)
              |DELTAC;=;2$B;19| (334 . |empty|) (338 . |hconcat|)
              (343 . |coerce|) (348 . |vconcat|) (|Union| $ '"failed")
              (|DeltaComplex| 6) (354 . |simplicialComplexIfCan|)
              |DELTAC;coerce;$Fsc;21| (|SingleInteger|) (|HashState|))
           '#(~= 359 |triangle| 365 |oneSkeleton| 372 |link| 377 |latex| 383
              |homology| 388 |hashUpdate!| 393 |hash| 399 |fundamentalGroup|
              404 |faceMap| 416 |deltaComplex| 422 |coerce| 445 |coHomology|
              455 |coChain| 460 |chain| 465 = 470)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 28))
                        (|makeByteWordVec2| 128
                                            '(2 9 8 0 0 10 2 11 0 9 8 12 3 11 8
                                              0 13 8 14 2 17 15 0 16 18 2 17 0
                                              0 15 19 1 22 25 0 26 1 28 0 27 29
                                              1 22 28 0 30 2 28 0 0 0 31 1 25
                                              28 0 32 1 28 33 0 34 1 35 0 0 36
                                              1 9 28 0 37 1 35 28 0 38 1 40 39
                                              0 41 1 40 28 0 42 1 39 28 0 43 1
                                              15 28 0 44 1 40 45 0 46 2 25 35 0
                                              13 47 2 40 13 0 45 48 0 6 0 49 1
                                              17 28 0 50 1 52 51 0 53 1 54 0 0
                                              55 2 51 0 0 54 56 1 57 45 0 58 2
                                              57 13 0 45 59 1 57 28 0 60 1 54
                                              28 0 61 1 52 9 0 62 2 17 15 0 13
                                              66 2 68 0 9 9 69 2 13 8 0 0 70 4
                                              68 13 0 13 13 13 71 1 73 0 72 74
                                              1 76 0 72 77 1 73 8 0 79 1 73 80
                                              0 81 1 76 8 0 83 1 76 80 0 84 1
                                              17 15 0 86 2 39 13 0 13 87 2 89 0
                                              0 88 90 2 92 0 0 91 93 1 96 13 0
                                              97 1 96 45 0 98 2 15 0 0 39 99 1
                                              27 28 0 104 1 94 28 0 105 2 94 96
                                              0 9 106 1 96 28 0 107 1 11 28 0
                                              108 2 11 8 0 13 109 2 39 0 0 13
                                              110 2 111 0 0 9 112 2 100 0 111
                                              15 113 2 100 0 0 8 114 2 9 8 0 0
                                              115 2 39 13 13 0 116 2 13 8 0 0
                                              117 0 28 0 119 1 28 0 45 120 1 13
                                              28 0 121 2 28 0 0 0 122 1 22 123
                                              124 125 2 0 8 0 0 1 3 0 0 9 9 9
                                              65 1 0 94 0 95 2 0 0 9 9 64 1 0
                                              27 0 1 1 0 80 0 82 2 0 128 128 0
                                              1 1 0 127 0 1 1 0 100 0 102 3 0
                                              100 0 8 8 101 2 0 15 0 9 67 1 0 0
                                              52 63 2 0 0 22 8 23 3 0 0 20 9 17
                                              21 1 0 0 22 24 1 0 22 0 126 1 0
                                              28 0 103 1 0 80 0 85 1 0 76 0 78
                                              1 0 73 0 75 2 0 8 0 0 118)))))
           '|lookupComplete|)) 
