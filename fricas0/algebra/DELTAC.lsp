
(PUT '|DELTAC;deltaComplex;VSL$;1| '|SPADreplace| 'CONS) 

(SDEFUN |DELTAC;deltaComplex;VSL$;1|
        ((|v| VS) (|f| |List| (|List| (|List| (|Integer|)))) ($ $))
        (CONS |v| |f|)) 

(SDEFUN |DELTAC;deltaComplex;Fsc$;2|
        ((|fsc| |FiniteSimplicialComplex| VS) ($ $))
        (SPROG
         ((|vs| (VS)) (|previousFaceList| (|List| (|OrientedFacet|)))
          (|faceMaps| (|List| (|List| (|List| (|Integer|)))))
          (|map1| (|List| (|List| (|Integer|))))
          (|newIndexes| (|List| (|Integer|))) (|i| (|Integer|)) (#1=#:G740 NIL)
          (|oldFaceLow| NIL) (|oldFacesLow| (|List| (|OrientedFacet|)))
          (#2=#:G739 NIL) (|oldFaceHigh| NIL) (|fm| (|List| (|Integer|)))
          (#3=#:G738 NIL) (|x| NIL) (#4=#:G736 NIL) (|gradeList| NIL)
          (#5=#:G737 NIL) (|grn| NIL)
          (|allFacetsGraded| (|List| (|List| (|OrientedFacet|))))
          (#6=#:G735 NIL) (|l| NIL) (#7=#:G734 NIL)
          (|allFacets| (|List| (|List| (|OrientedFacet|)))))
         (SEQ
          (LETT |allFacets| (SPADCALL |fsc| (QREFELT $ 12))
                . #8=(|DELTAC;deltaComplex;Fsc$;2|))
          (LETT |allFacetsGraded|
                (PROGN
                 (LETT #7# NIL . #8#)
                 (SEQ (LETT |l| NIL . #8#) (LETT #6# |allFacets| . #8#) G190
                      (COND
                       ((OR (ATOM #6#) (PROGN (LETT |l| (CAR #6#) . #8#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #7# (CONS (SPADCALL |l| (QREFELT $ 14)) #7#)
                              . #8#)))
                      (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                      (EXIT (NREVERSE #7#))))
                . #8#)
          (LETT |faceMaps| NIL . #8#) (LETT |previousFaceList| NIL . #8#)
          (SEQ (LETT |grn| 1 . #8#) (LETT #5# (LENGTH |allFacetsGraded|) . #8#)
               (LETT |gradeList| NIL . #8#) (LETT #4# |allFacetsGraded| . #8#)
               G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |gradeList| (CAR #4#) . #8#) NIL)
                     (|greater_SI| |grn| #5#))
                 (GO G191)))
               (SEQ (LETT |map1| NIL . #8#)
                    (COND
                     ((EQL |grn| 1)
                      (SEQ (LETT |x| NIL . #8#) (LETT #3# |gradeList| . #8#)
                           G190
                           (COND
                            ((OR (ATOM #3#)
                                 (PROGN (LETT |x| (CAR #3#) . #8#) NIL))
                             (GO G191)))
                           (SEQ (LETT |fm| (SPADCALL |x| (QREFELT $ 17)) . #8#)
                                (EXIT (LETT |map1| (CONS |fm| |map1|) . #8#)))
                           (LETT #3# (CDR #3#) . #8#) (GO G190) G191
                           (EXIT NIL)))
                     ('T
                      (SEQ (LETT |oldFaceHigh| NIL . #8#)
                           (LETT #2# |gradeList| . #8#) G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN
                                  (LETT |oldFaceHigh| (CAR #2#) . #8#)
                                  NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |oldFacesLow|
                                  (SPADCALL |oldFaceHigh| (QREFELT $ 19))
                                  . #8#)
                            (LETT |newIndexes| NIL . #8#)
                            (SEQ (LETT |oldFaceLow| NIL . #8#)
                                 (LETT #1# |oldFacesLow| . #8#) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN
                                        (LETT |oldFaceLow| (CAR #1#) . #8#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |i|
                                        (SPADCALL |oldFaceLow|
                                                  |previousFaceList|
                                                  (QREFELT $ 21))
                                        . #8#)
                                  (COND
                                   ((EQL |i| 0)
                                    (SEQ
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL "  deltaComplex oldFaceLow="
                                                  (SPADCALL |oldFaceLow|
                                                            (QREFELT $ 23))
                                                  (QREFELT $ 24))
                                        " not found in previousFaceList="
                                        (QREFELT $ 24))
                                       (SPADCALL |previousFaceList|
                                                 (QREFELT $ 25))
                                       (QREFELT $ 24))
                                      (QREFELT $ 27))
                                     (EXIT
                                      (|error|
                                       (STRCONC "cant find index:"
                                                (STRINGIMAGE |i|)))))))
                                  (EXIT
                                   (LETT |newIndexes| (CONS |i| |newIndexes|)
                                         . #8#)))
                                 (LETT #1# (CDR #1#) . #8#) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (LETT |map1| (CONS (NREVERSE |newIndexes|) |map1|)
                                   . #8#)))
                           (LETT #2# (CDR #2#) . #8#) (GO G190) G191
                           (EXIT NIL))))
                    (LETT |faceMaps| (CONS (NREVERSE |map1|) |faceMaps|) . #8#)
                    (EXIT (LETT |previousFaceList| |gradeList| . #8#)))
               (LETT #4# (PROG1 (CDR #4#) (LETT |grn| (|inc_SI| |grn|) . #8#))
                     . #8#)
               (GO G190) G191 (EXIT NIL))
          (LETT |vs| (QCAR |fsc|) . #8#)
          (EXIT (CONS |vs| (NREVERSE |faceMaps|)))))) 

(SDEFUN |DELTAC;deltaComplex;Fcc$;3| ((|fsc| |FiniteCubicalComplex| VS) ($ $))
        (SPROG
         ((|previousFaceList| (|List| (|CubicalFacet|)))
          (|faceMaps| (|List| (|List| (|List| (|Integer|)))))
          (|map1| (|List| (|List| (|Integer|))))
          (|newIndexes| (|List| (|Integer|))) (|i| (|Integer|)) (#1=#:G763 NIL)
          (|oldFaceLow| NIL) (|oldFacesLow| (|List| (|CubicalFacet|)))
          (#2=#:G762 NIL) (|oldFaceHigh| NIL) (#3=#:G760 NIL) (|gradeList| NIL)
          (#4=#:G761 NIL) (|grn| NIL) (|vs| (VS))
          (|allFacetsGraded| (|List| (|List| (|CubicalFacet|))))
          (#5=#:G759 NIL) (|gradedList| NIL)
          (|allFacets| (|List| (|List| (|CubicalFacet|)))))
         (SEQ
          (LETT |allFacets| (SPADCALL |fsc| (QREFELT $ 31))
                . #6=(|DELTAC;deltaComplex;Fcc$;3|))
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
                                 (SPADCALL |gradedList| (QREFELT $ 33))
                                 (QREFELT $ 34))
                       . #6#)))
               (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
          (LETT |faceMaps| NIL . #6#)
          (LETT |previousFaceList| (|SPADfirst| |allFacetsGraded|) . #6#)
          (COND
           ((|domainEqual| (QREFELT $ 6) (|VertexSetAbstract|))
            (LETT |vs| (SPADCALL (LENGTH |previousFaceList|) (QREFELT $ 37))
                  . #6#))
           ('T
            (|error|
             (SPADCALL "deltaComplex: can only handle cubical complexes "
                       "with abstract vertex set" (QREFELT $ 39)))))
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
                                                   (QREFELT $ 41))
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
                                                         (QREFELT $ 42))
                                               . #6#)
                                         (COND
                                          ((EQL |i| 0)
                                           (SEQ
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL
                                                "  deltaComplex oldFaceLow="
                                                (SPADCALL |oldFaceLow|
                                                          (QREFELT $ 43))
                                                (QREFELT $ 24))
                                               " not found in previousFaceList="
                                               (QREFELT $ 24))
                                              (SPADCALL |previousFaceList|
                                                        (QREFELT $ 44))
                                              (QREFELT $ 24))
                                             (QREFELT $ 27))
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
          (EXIT (CONS |vs| (NREVERSE |faceMaps|)))))) 

(SDEFUN |DELTAC;link;2Nni$;4|
        ((|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|) ($ $))
        (SPROG ((|simp| (|List| (|List| (|List| (|Integer|))))) (|vs| (VS)))
               (SEQ
                (LETT |vs| (SPADCALL 2 (QREFELT $ 37))
                      . #1=(|DELTAC;link;2Nni$;4|))
                (LETT |simp| (LIST (LIST (LIST |a| |b|))) . #1#)
                (EXIT (CONS |vs| |simp|))))) 

(SDEFUN |DELTAC;triangle;3Nni$;5|
        ((|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         (|c| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|simp| (|List| #1=(|List| (|List| (|Integer|))))) (|triangles| #1#)
          (|edges| (|List| (|List| (|Integer|)))) (|vs| (VS)))
         (SEQ
          (LETT |vs| (SPADCALL 3 (QREFELT $ 37))
                . #2=(|DELTAC;triangle;3Nni$;5|))
          (LETT |edges| (LIST (LIST |a| |b|) (LIST |a| |c|) (LIST |b| |c|))
                . #2#)
          (LETT |triangles| (LIST (LIST |a| (- |b|) |c|)) . #2#)
          (LETT |simp| (LIST |edges| |triangles|) . #2#)
          (EXIT (CONS |vs| |simp|))))) 

(SDEFUN |DELTAC;faceMap;$NniL;6|
        ((|s| $) (|n| |NonNegativeInteger|) ($ |List| (|List| (|Integer|))))
        (SPROG
         ((#1=#:G771 NIL) (|maps1| (|List| (|List| (|List| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ (LETT |maps1| (QCDR |s|) . #2=(|DELTAC;faceMap;$NniL;6|))
                (COND
                 ((SPADCALL |n| (LENGTH |maps1|) (QREFELT $ 49))
                  (PROGN (LETT #1# NIL . #2#) (GO #3=#:G770))))
                (EXIT (SPADCALL |maps1| |n| (QREFELT $ 51)))))
          #3# (EXIT #1#)))) 

(SDEFUN |DELTAC;chain;$Cc;7| ((|s| $) ($ |ChainComplex|))
        (SPROG
         ((|res| (|List| (|Matrix| (|Integer|)))) (|m| (|Matrix| (|Integer|)))
          (|n_rows| (|NonNegativeInteger|)) (|ele| (|Integer|))
          (|v2| (|Integer|)) (#1=#:G783 NIL) (|v| NIL) (#2=#:G781 NIL)
          (|u| NIL) (#3=#:G782 NIL) (|nu| NIL)
          (|n_cols| (|NonNegativeInteger|)) (#4=#:G780 NIL) (|faces| NIL)
          (|maps1| (|List| (|List| (|List| (|Integer|))))))
         (SEQ (LETT |res| NIL . #5=(|DELTAC;chain;$Cc;7|))
              (LETT |maps1| (QCDR |s|) . #5#)
              (LETT |n_rows| (SPADCALL (QCAR |s|) (QREFELT $ 53)) . #5#)
              (LETT |res| (CONS (SPADCALL 1 |n_rows| (QREFELT $ 55)) |res|)
                    . #5#)
              (SEQ (LETT |faces| NIL . #5#) (LETT #4# |maps1| . #5#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |faces| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ (LETT |n_cols| (LENGTH |faces|) . #5#)
                        (LETT |m| (SPADCALL |n_rows| |n_cols| (QREFELT $ 55))
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
                                         (LETT |ele|
                                               (COND
                                                ((SPADCALL |v| 0
                                                           (QREFELT $ 56))
                                                 1)
                                                ('T -1))
                                               . #5#)
                                         (EXIT
                                          (SPADCALL |m| |v2| |nu|
                                                    (+
                                                     (QAREF2O |m| |v2| |nu| 1
                                                              1)
                                                     |ele|)
                                                    (QREFELT $ 57))))
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
              (EXIT (SPADCALL (NREVERSE |res|) (QREFELT $ 60)))))) 

(SDEFUN |DELTAC;homology;$L;8| ((|a| $) ($ |List| (|Homology|)))
        (SPROG ((|cc| (|ChainComplex|)))
               (SEQ
                (LETT |cc| (SPADCALL |a| (QREFELT $ 61))
                      |DELTAC;homology;$L;8|)
                (SPADCALL |cc| (QREFELT $ 62))
                (EXIT (SPADCALL |cc| (QREFELT $ 64)))))) 

(SDEFUN |DELTAC;oneSkeleton;$Ug;9|
        ((|s| $) ($ |UndirectedGraph| (|NonNegativeInteger|)))
        (SPROG
         ((|nodes|
           (|List|
            (|Record| (|:| |value| (|NonNegativeInteger|))
                      (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (#1=#:G797 NIL) (|m1| NIL)
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
          (|from1| (|NonNegativeInteger|)) (#3=#:G796 NIL) (|x| NIL)
          (|edgeIndexes| (|List| (|List| (|Integer|))))
          (GS
           (|Join| (|FiniteGraph| #4=(|NonNegativeInteger|))
                   (CATEGORY |domain|
                    (SIGNATURE |undirectedGraph| ($ (|List| #4#)))
                    (SIGNATURE |undirectedGraph|
                     ($
                      (|List|
                       (|Record| (|:| |value| #4#)
                                 (|:| |posX| (|NonNegativeInteger|))
                                 (|:| |posY| (|NonNegativeInteger|))))))
                    (SIGNATURE |undirectedGraph|
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
                    (SIGNATURE |undirectedGraph|
                     ($ (|List| #4#)
                      (|List|
                       (|Record| (|:| |fromOb| (|NonNegativeInteger|))
                                 (|:| |toOb| (|NonNegativeInteger|))))))
                    (SIGNATURE |undirectedGraph| ($ (|FinitePoset| #4#)))
                    (SIGNATURE |undirectedGraph|
                     ($ (|List| #4#) (|List| (|List| (|NonNegativeInteger|)))))
                    (SIGNATURE * ((|UndirectedGraph| (|Product| #4# #4#)) $ $))
                    (SIGNATURE |cartesian|
                     ((|UndirectedGraph| (|Product| #4# #4#)) $ $))
                    (SIGNATURE |closedTensor| ($ $ $ (|Mapping| #4# #4# #4#)))
                    (SIGNATURE |closedCartesian|
                     ($ $ $ (|Mapping| #4# #4# #4#)))
                    (SIGNATURE |coerce| ($ (|FinitePoset| #4#)))))))
         (SEQ
          (LETT GS (|UndirectedGraph| (|NonNegativeInteger|))
                . #5=(|DELTAC;oneSkeleton;$Ug;9|))
          (LETT |nodes| NIL . #5#) (LETT |edges| NIL . #5#)
          (LETT |m| (SPADCALL (QCAR |s|) (QREFELT $ 53)) . #5#)
          (LETT |edgeIndexes| (|SPADfirst| (QCDR |s|)) . #5#)
          (SEQ (LETT |x| NIL . #5#) (LETT #3# |edgeIndexes| . #5#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #5#) NIL))
                 (GO G191)))
               (SEQ (LETT |from1| (ABS (SPADCALL |x| 1 (QREFELT $ 66))) . #5#)
                    (COND
                     ((SPADCALL |from1| |m| (QREFELT $ 49))
                      (LETT |m| |from1| . #5#)))
                    (LETT |to1| (ABS (SPADCALL |x| 2 (QREFELT $ 66))) . #5#)
                    (COND
                     ((SPADCALL |to1| |m| (QREFELT $ 49))
                      (LETT |m| |to1| . #5#)))
                    (LETT |y| (VECTOR "x" 0 |from1| |to1| 0 0 NIL) . #5#)
                    (EXIT
                     (LETT |edges| (SPADCALL |edges| |y| (QREFELT $ 69))
                           . #5#)))
               (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
          (SPADCALL (QCAR |s|) |m| (QREFELT $ 70))
          (SEQ (LETT |m1| 1 . #5#) (LETT #1# |m| . #5#) G190
               (COND ((|greater_SI| |m1| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |nodes|
                       (SPADCALL |nodes| (VECTOR |m1| 0 0) (QREFELT $ 73))
                       . #5#)))
               (LETT |m1| (|inc_SI| |m1|) . #5#) (GO G190) G191 (EXIT NIL))
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
                                                              (LIST '|:| '|map|
                                                                    (LIST
                                                                     '|List|
                                                                     (LIST
                                                                      '|NonNegativeInteger|))))))
                                            GS)))))) 

(SDEFUN |DELTAC;linksInTree|
        ((|res| |List| (|List| (|Integer|))) (|a| |Tree| (|Integer|))
         ($ |List| (|List| (|Integer|))))
        (SPROG
         ((#1=#:G805 NIL) (|x| NIL) (|newLink| (|List| #2=(|Integer|)))
          (|toNode| #2#) (#3=#:G804 NIL) (|fromNode| #2#))
         (SEQ
          (LETT |fromNode| (SPADCALL |a| (QREFELT $ 77))
                . #4=(|DELTAC;linksInTree|))
          (SEQ (LETT |x| NIL . #4#)
               (LETT #3# (SPADCALL |a| (QREFELT $ 78)) . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ (LETT |toNode| (SPADCALL |x| (QREFELT $ 77)) . #4#)
                    (LETT |newLink| (LIST |fromNode| |toNode|) . #4#)
                    (EXIT
                     (LETT |res| (SPADCALL |res| |newLink| (QREFELT $ 79))
                           . #4#)))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |x| NIL . #4#)
               (LETT #1# (SPADCALL |a| (QREFELT $ 78)) . #4#) G190
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
         ((#1=#:G816 NIL) (|t2| #2=(|Integer|)) (|s2| #2#) (#3=#:G817 NIL)
          (|e| NIL) (|t| #2#) (|s| #2#))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((< (LENGTH |edge|) 2)
              (PROGN
               (LETT #1# NIL . #4=(|DELTAC;containsEdge?|))
               (GO #5=#:G815))))
            (LETT |s| (SPADCALL |edge| 1 (QREFELT $ 66)) . #4#)
            (LETT |t| (SPADCALL |edge| 2 (QREFELT $ 66)) . #4#)
            (SEQ (LETT |e| NIL . #4#) (LETT #3# |edges| . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |e| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL (LENGTH |e|) 1 (QREFELT $ 49))
                     (SEQ (LETT |s2| (SPADCALL |e| 1 (QREFELT $ 66)) . #4#)
                          (LETT |t2| (SPADCALL |e| 2 (QREFELT $ 66)) . #4#)
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

(SDEFUN |DELTAC;fundamentalGroup;$Gp;12| ((|s| $) ($ |GroupPresentation|))
        (SPADCALL |s| 'T NIL (QREFELT $ 81))) 

(SDEFUN |DELTAC;fundamentalGroup;$2BGp;13|
        ((|s| $) (|simplify| |Boolean|) (|trace| |Boolean|)
         ($ |GroupPresentation|))
        (SPROG
         ((#1=#:G831 NIL) (|gp| (|GroupPresentation|))
          (|generators| (|List| (|NonNegativeInteger|))) (#2=#:G838 NIL)
          (|x| NIL) (|m| (|NonNegativeInteger|))
          (|rules| (|List| (|List| (|Integer|)))) (|rule| (|List| (|Integer|)))
          (#3=#:G837 NIL) (|vertn| NIL) (#4=#:G836 NIL) (|t| NIL)
          (|polygons| #5=(|List| (|List| (|Integer|)))) (#6=#:G834 NIL)
          (|edge| NIL) (#7=#:G835 NIL) (|edgen| NIL)
          (|edgesInTree| (|List| (|Boolean|))) (#8=#:G833 NIL) (|y| NIL)
          (#9=#:G832 NIL) (|res| (|List| (|List| (|Integer|)))) (|edges| #5#)
          (|span| (|Tree| (|Integer|)))
          (|graph| (|UndirectedGraph| (|NonNegativeInteger|))))
         (SEQ
          (EXIT
           (SEQ
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL
                (SPADCALL "fundamentalGroup(" (SPADCALL |s| (QREFELT $ 83))
                          (QREFELT $ 24))
                ")" (QREFELT $ 24))
               (QREFELT $ 27))))
            (LETT |graph| (SPADCALL |s| (QREFELT $ 75))
                  . #10=(|DELTAC;fundamentalGroup;$2BGp;13|))
            (LETT |span| (SPADCALL |graph| 1 (QREFELT $ 84)) . #10#)
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL "fundamentalGroup span="
                         (SPADCALL |span| (QREFELT $ 85)) (QREFELT $ 24))
               (QREFELT $ 27))))
            (LETT |edges| (SPADCALL |s| 1 (QREFELT $ 52)) . #10#)
            (LETT |res| NIL . #10#)
            (LETT |res| (|DELTAC;linksInTree| |res| |span| $) . #10#)
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
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL
                (SPADCALL
                 (SPADCALL "fundamentalGroup edges="
                           (SPADCALL |edges| (QREFELT $ 86)) (QREFELT $ 24))
                 " res=" (QREFELT $ 24))
                (SPADCALL |res| (QREFELT $ 86)) (QREFELT $ 24))
               (QREFELT $ 27))))
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
                     (SPADCALL |edgesInTree| |edgen| 'T (QREFELT $ 88))))))
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
                 (SPADCALL "fundamentalGroup linksInTree="
                           (SPADCALL |res| (QREFELT $ 86)) (QREFELT $ 24))
                 " edgesInTree=" (QREFELT $ 24))
                (SPADCALL |edgesInTree| (QREFELT $ 89)) (QREFELT $ 24))
               (QREFELT $ 27))))
            (LETT |polygons| (SPADCALL |s| 2 (QREFELT $ 52)) . #10#)
            (LETT |rules| NIL . #10#)
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL "fundamentalGroup polygons="
                         (SPADCALL |polygons| (QREFELT $ 86)) (QREFELT $ 24))
               (QREFELT $ 27))))
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
                                                     (QREFELT $ 66)))
                                          (QREFELT $ 90)))
                               (LETT |rule|
                                     (SPADCALL |rule|
                                               (SPADCALL |t| |vertn|
                                                         (QREFELT $ 66))
                                               (QREFELT $ 91))
                                     . #10#)))))
                           (LETT |vertn| (|inc_SI| |vertn|) . #10#) (GO G190)
                           G191 (EXIT NIL))
                      (EXIT
                       (COND
                        ((NULL (NULL |rule|))
                         (LETT |rules| (SPADCALL |rules| |rule| (QREFELT $ 79))
                               . #10#)))))
                 (LETT #4# (CDR #4#) . #10#) (GO G190) G191 (EXIT NIL))
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL "fundamentalGroup rules="
                         (SPADCALL |rules| (QREFELT $ 86)) (QREFELT $ 24))
               (QREFELT $ 27))))
            (LETT |m| (LENGTH |edges|) . #10#) (LETT |generators| NIL . #10#)
            (SEQ (LETT |x| 1 . #10#) (LETT #2# |m| . #10#) G190
                 (COND ((|greater_SI| |x| #2#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((NULL (SPADCALL |edgesInTree| |x| (QREFELT $ 90)))
                     (LETT |generators|
                           (SPADCALL |generators| |x| (QREFELT $ 93))
                           . #10#)))))
                 (LETT |x| (|inc_SI| |x|) . #10#) (GO G190) G191 (EXIT NIL))
            (LETT |gp| (SPADCALL |generators| |rules| (QREFELT $ 94)) . #10#)
            (COND
             ((NULL |simplify|)
              (PROGN (LETT #1# |gp| . #10#) (GO #11=#:G830))))
            (EXIT (SPADCALL |gp| |trace| (QREFELT $ 95)))))
          #11# (EXIT #1#)))) 

(SDEFUN |DELTAC;equalSimplex|
        ((|a| |List| (|Integer|)) (|b| |List| (|Integer|)) ($ |Boolean|))
        (SPROG
         ((|offset| (|Integer|)) (#1=#:G846 NIL) (#2=#:G847 NIL) (|n| NIL)
          (|fst| (|Integer|)) (|len| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |len| (LENGTH |a|) . #3=(|DELTAC;equalSimplex|))
                (COND
                 ((SPADCALL |len| (LENGTH |b|) (QREFELT $ 96))
                  (PROGN (LETT #1# NIL . #3#) (GO #4=#:G845))))
                (COND ((EQL |len| 0) (PROGN (LETT #1# 'T . #3#) (GO #4#))))
                (LETT |fst| (|SPADfirst| |a|) . #3#)
                (LETT |offset| (SPADCALL |fst| |b| (QREFELT $ 97)) . #3#)
                (COND ((< |offset| 1) (PROGN (LETT #1# NIL . #3#) (GO #4#))))
                (SEQ (LETT |n| 1 . #3#) (LETT #2# (LENGTH |a|) . #3#) G190
                     (COND ((|greater_SI| |n| #2#) (GO G191)))
                     (SEQ
                      (COND
                       ((SPADCALL (SPADCALL |a| |n| (QREFELT $ 66))
                                  (SPADCALL |b| |offset| (QREFELT $ 66))
                                  (QREFELT $ 98))
                        (PROGN (LETT #1# NIL . #3#) (GO #4#))))
                      (LETT |offset| (+ |offset| 1) . #3#)
                      (EXIT
                       (COND
                        ((SPADCALL |offset| (LENGTH |b|) (QREFELT $ 56))
                         (LETT |offset| 1 . #3#)))))
                     (LETT |n| (|inc_SI| |n|) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #4# (EXIT #1#)))) 

(SDEFUN |DELTAC;=;2$B;15| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G851 NIL) (|len| (|NonNegativeInteger|))
          (|bs| #2=(|List| (|List| (|List| (|Integer|))))) (|as| #2#))
         (SEQ
          (EXIT
           (SEQ (LETT |as| (QCDR |a|) . #3=(|DELTAC;=;2$B;15|))
                (LETT |bs| (QCDR |b|) . #3#) (LETT |len| (LENGTH |as|) . #3#)
                (COND
                 ((SPADCALL |len| (LENGTH |bs|) (QREFELT $ 96))
                  (PROGN (LETT #1# NIL . #3#) (GO #4=#:G850))))
                (EXIT 'T)))
          #4# (EXIT #1#)))) 

(SDEFUN |DELTAC;coerce;$Of;16| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|tabNum| (|NonNegativeInteger|)) (|res| (|OutputForm|))
          (|row| (|OutputForm|)) (#1=#:G858 NIL) (|a| NIL) (#2=#:G857 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |res| (SPADCALL (QREFELT $ 100))
                  . #3=(|DELTAC;coerce;$Of;16|))
            (COND
             ((NULL (QCDR |s|)) (PROGN (LETT #2# |res| . #3#) (GO #4=#:G856))))
            (LETT |tabNum| 1 . #3#)
            (SEQ (LETT |a| NIL . #3#) (LETT #1# (QCDR |s|) . #3#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |row|
                        (SPADCALL
                         (LIST (SPADCALL " " (QREFELT $ 101))
                               (SPADCALL |tabNum| (QREFELT $ 102))
                               (SPADCALL "D:" (QREFELT $ 101))
                               (SPADCALL |a| (QREFELT $ 86)))
                         (QREFELT $ 103))
                        . #3#)
                  (LETT |res| (SPADCALL |res| |row| (QREFELT $ 104)) . #3#)
                  (EXIT (LETT |tabNum| (+ |tabNum| 1) . #3#)))
                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT |res|)))
          #4# (EXIT #2#)))) 

(SDEFUN |DELTAC;coerce;$Fsc;17| ((|s| $) ($ |FiniteSimplicialComplex| VS))
        (SPADCALL |s| (QREFELT $ 106))) 

(DECLAIM (NOTINLINE |DeltaComplex;|)) 

(DEFUN |DeltaComplex| (#1=#:G860)
  (SPROG NIL
         (PROG (#2=#:G861)
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
          (LETT $ (GETREFV 110) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|DeltaComplex| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record| (|:| VERTSET |#1|)
                              (|:| MAPS
                                   (|List| (|List| (|List| (|Integer|)))))))
          $))) 

(MAKEPROP '|DeltaComplex| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 50)
              |DELTAC;deltaComplex;VSL$;1| (|List| 13)
              (|FiniteSimplicialComplex| 6) (0 . |addImpliedFaces|) (|List| 16)
              (5 . |sort|) (|List| 20) (|OrientedFacet|)
              (10 . |getIndexesSigned|) (|List| $) (15 . |delta|) (|Integer|)
              (20 . |position|) (|OutputForm|) (26 . |coerce|) (31 . |hconcat|)
              (37 . |coerce|) (|Void|) (42 . |print|)
              |DELTAC;deltaComplex;Fsc$;2| (|List| 32)
              (|FiniteCubicalComplex| 6) (47 . |addImpliedFaces|) (|List| 40)
              (52 . |sort|) (57 . |concat|) (|NonNegativeInteger|)
              (|VertexSetAbstract|) (63 . |vertexSeta|) (|String|) (68 . |elt|)
              (|CubicalFacet|) (74 . |delta|) (79 . |position|) (85 . |coerce|)
              (90 . |coerce|) |DELTAC;deltaComplex;Fcc$;3|
              |DELTAC;link;2Nni$;4| |DELTAC;triangle;3Nni$;5| (|Boolean|)
              (95 . >) (|List| 15) (101 . |elt|) |DELTAC;faceMap;$NniL;6|
              (107 . |maxFaces|) (|Matrix| 20) (112 . |zero|) (118 . >)
              (124 . |setelt!|) (|List| 54) (|ChainComplex|)
              (132 . |chainComplex|) |DELTAC;chain;$Cc;7| (137 . |validate|)
              (|List| (|Homology|)) (142 . |homology|) |DELTAC;homology;$L;8|
              (147 . |elt|)
              (|Record| (|:| |name| 38) (|:| |arrType| 35) (|:| |fromOb| 35)
                        (|:| |toOb| 35) (|:| |xOffset| 20) (|:| |yOffset| 20)
                        (|:| |map| 92))
              (|List| 67) (153 . |concat|) (159 . |setMaxFaces|)
              (|Record| (|:| |value| 35) (|:| |posX| 35) (|:| |posY| 35))
              (|List| 71) (165 . |concat|) (|UndirectedGraph| 35)
              |DELTAC;oneSkeleton;$Ug;9| (|Tree| 20) (171 . |value|)
              (176 . |children|) (181 . |concat|) (|GroupPresentation|)
              |DELTAC;fundamentalGroup;$2BGp;13|
              |DELTAC;fundamentalGroup;$Gp;12| |DELTAC;coerce;$Of;16|
              (187 . |spanningTreeNode|) (193 . |coerce|) (198 . |coerce|)
              (|List| 48) (203 . |setelt!|) (210 . |coerce|) (215 . |elt|)
              (221 . |concat|) (|List| 35) (227 . |concat|)
              (233 . |groupPresentation|) (239 . |simplify|) (245 . ~=)
              (251 . |position|) (257 . ~=) |DELTAC;=;2$B;15| (263 . |empty|)
              (267 . |message|) (272 . |coerce|) (277 . |hconcat|)
              (282 . |vconcat|) (|DeltaComplex| 6) (288 . |simplicialComplex|)
              |DELTAC;coerce;$Fsc;17| (|SingleInteger|) (|HashState|))
           '#(~= 293 |triangle| 299 |oneSkeleton| 306 |link| 311 |latex| 317
              |homology| 322 |hashUpdate!| 327 |hash| 333 |fundamentalGroup|
              338 |faceMap| 350 |deltaComplex| 356 |coerce| 372 |chain| 382 =
              387)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 22))
                        (|makeByteWordVec2| 109
                                            '(1 11 10 0 12 1 13 0 0 14 1 16 15
                                              0 17 1 16 18 0 19 2 16 20 0 18 21
                                              1 16 22 0 23 2 22 0 0 0 24 1 13
                                              22 0 25 1 22 26 0 27 1 30 29 0 31
                                              1 32 0 0 33 2 29 0 0 32 34 1 36 0
                                              35 37 2 38 0 0 0 39 1 40 18 0 41
                                              2 40 20 0 18 42 1 40 22 0 43 1 32
                                              22 0 44 2 35 48 0 0 49 2 8 50 0
                                              20 51 1 6 35 0 53 2 54 0 35 35 55
                                              2 20 48 0 0 56 4 54 20 0 20 20 20
                                              57 1 59 0 58 60 1 59 48 0 62 1 59
                                              63 0 64 2 15 20 0 20 66 2 68 0 0
                                              67 69 2 6 26 0 35 70 2 72 0 0 71
                                              73 1 76 20 0 77 1 76 18 0 78 2 50
                                              0 0 15 79 2 74 76 0 35 84 1 76 22
                                              0 85 1 50 22 0 86 3 87 48 0 20 48
                                              88 1 87 22 0 89 2 87 48 0 20 90 2
                                              15 0 0 20 91 2 92 0 0 35 93 2 80
                                              0 92 50 94 2 80 0 0 48 95 2 35 48
                                              0 0 96 2 15 20 20 0 97 2 20 48 0
                                              0 98 0 22 0 100 1 22 0 38 101 1
                                              35 22 0 102 1 22 0 18 103 2 22 0
                                              0 0 104 1 11 0 105 106 2 0 48 0 0
                                              1 3 0 0 35 35 35 47 1 0 74 0 75 2
                                              0 0 35 35 46 1 0 38 0 1 1 0 63 0
                                              65 2 0 109 109 0 1 1 0 108 0 1 1
                                              0 80 0 82 3 0 80 0 48 48 81 2 0
                                              50 0 35 52 1 0 0 11 28 1 0 0 30
                                              45 2 0 0 6 8 9 1 0 11 0 107 1 0
                                              22 0 83 1 0 59 0 61 2 0 48 0 0
                                              99)))))
           '|lookupComplete|)) 
