
(SDEFUN |SIMPTEST;randomFacet| ((|n| |NonNegativeInteger|) ($ |OrientedFacet|))
        (SPROG
         ((|verts| (|List| (|NonNegativeInteger|)))
          (|i| (|NonNegativeInteger|)) (#1=#:G737 NIL) (|x| NIL))
         (SEQ (LETT |verts| NIL . #2=(|SIMPTEST;randomFacet|))
              (SEQ (LETT |x| 1 . #2#) (LETT #1# |n| . #2#) G190
                   (COND ((|greater_SI| |x| #1#) (GO G191)))
                   (SEQ (LETT |i| (+ (RANDOM (+ |n| 4)) 1) . #2#)
                        (SEQ G190
                             (COND
                              ((NULL (SPADCALL |i| |verts| (QREFELT $ 9)))
                               (GO G191)))
                             (SEQ
                              (EXIT (LETT |i| (+ (RANDOM (+ |n| 4)) 1) . #2#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (LETT |verts| (SPADCALL |verts| |i| (QREFELT $ 11))
                               . #2#)))
                   (LETT |x| (|inc_SI| |x|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL 1 (SPADCALL |verts| (QREFELT $ 12)) (QREFELT $ 15)))))) 

(SDEFUN |SIMPTEST;randomSimplicialComplex|
        ((|n| |NonNegativeInteger|)
         ($ |FiniteSimplicialComplex| (|VertexSetAbstract|)))
        (SPROG ((#1=#:G740 NIL) (|i| (|NonNegativeInteger|)))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |i| (+ (RANDOM 12) 1)
                        . #2=(|SIMPTEST;randomSimplicialComplex|))
                  (COND
                   ((EQL |i| 1)
                    (PROGN
                     (LETT #1# (SPADCALL 2 (QREFELT $ 18)) . #2#)
                     (GO #3=#:G739))))
                  (COND
                   ((EQL |i| 2)
                    (PROGN
                     (LETT #1# (SPADCALL 2 (QREFELT $ 19)) . #2#)
                     (GO #3#))))
                  (COND
                   ((EQL |i| 3)
                    (PROGN
                     (LETT #1# (SPADCALL 3 (QREFELT $ 18)) . #2#)
                     (GO #3#))))
                  (COND
                   ((EQL |i| 4)
                    (PROGN
                     (LETT #1# (SPADCALL 3 (QREFELT $ 19)) . #2#)
                     (GO #3#))))
                  (COND
                   ((EQL |i| 5)
                    (PROGN
                     (LETT #1# (SPADCALL 4 (QREFELT $ 18)) . #2#)
                     (GO #3#))))
                  (COND
                   ((EQL |i| 6)
                    (PROGN
                     (LETT #1# (SPADCALL 4 (QREFELT $ 19)) . #2#)
                     (GO #3#))))
                  (COND
                   ((EQL |i| 7)
                    (PROGN
                     (LETT #1# (SPADCALL 5 (QREFELT $ 18)) . #2#)
                     (GO #3#))))
                  (COND
                   ((EQL |i| 8)
                    (PROGN
                     (LETT #1# (SPADCALL 5 (QREFELT $ 19)) . #2#)
                     (GO #3#))))
                  (COND
                   ((EQL |i| 9)
                    (PROGN
                     (LETT #1# (SPADCALL (QREFELT $ 20)) . #2#)
                     (GO #3#))))
                  (COND
                   ((EQL |i| 10)
                    (PROGN
                     (LETT #1# (SPADCALL (QREFELT $ 21)) . #2#)
                     (GO #3#))))
                  (COND
                   ((EQL |i| 11)
                    (PROGN
                     (LETT #1# (SPADCALL (QREFELT $ 22)) . #2#)
                     (GO #3#))))
                  (COND
                   ((EQL |i| 12)
                    (PROGN
                     (LETT #1# (SPADCALL (QREFELT $ 23)) . #2#)
                     (GO #3#))))
                  (EXIT (SPADCALL (QREFELT $ 24)))))
                #3# (EXIT #1#)))) 

(SDEFUN |SIMPTEST;testOrientedFacet;B;3| (($ |Boolean|))
        (SPROG
         ((|f2| (|OrientedFacet|)) (|d| (|List| (|OrientedFacet|)))
          (|f| (|OrientedFacet|)))
         (SEQ
          (LETT |f| (|SIMPTEST;randomFacet| 3 $)
                . #1=(|SIMPTEST;testOrientedFacet;B;3|))
          (LETT |d| (SPADCALL |f| (QREFELT $ 26)) . #1#)
          (LETT |f2| (SPADCALL |d| (QREFELT $ 27)) . #1#)
          (COND
           ((SPADCALL |f| |f2| (QREFELT $ 28))
            (SEQ
             (SPADCALL
              (SPADCALL "testOrientedFacet error: random:"
                        (SPADCALL |f| (QREFELT $ 30)) (QREFELT $ 31))
              (QREFELT $ 33))
             (SPADCALL
              (SPADCALL "testOrientedFacet: delta="
                        (SPADCALL |d| (QREFELT $ 35)) (QREFELT $ 31))
              (QREFELT $ 33))
             (SPADCALL
              (SPADCALL "testOrientedFacet: f2=" (SPADCALL |f2| (QREFELT $ 30))
                        (QREFELT $ 31))
              (QREFELT $ 33))
             (EXIT
              (|error|
               (SPADCALL "test OrientedFacet failed : delta should be inverse "
                         "of construct from boundary" (QREFELT $ 37)))))))
          (EXIT 'T)))) 

(SDEFUN |SIMPTEST;testSimplicialComplex1;B;4| (($ |Boolean|))
        (SPROG
         ((|delta2| #1=(|FiniteSimplicialComplex| (|VertexSetAbstract|)))
          (|delta1| #1#) (|zero| (ASIMP)) (|vs1| (|VertexSetAbstract|))
          (|v1| (|List| (|List| (|NonNegativeInteger|))))
          (ASIMP
           (|Join| (|SetCategory|)
                   (CATEGORY |domain|
                    (SIGNATURE |simplicialComplex|
                     ($ #2=(|VertexSetAbstract|)
                      (|List| (|List| (|NonNegativeInteger|)))))
                    (SIGNATURE |simplicialComplex| ($ #2#))
                    (SIGNATURE |simplicialComplex| ($ (|DeltaComplex| #2#)))
                    (SIGNATURE |addSimplex| ($ $ (|OrientedFacet|)))
                    (SIGNATURE |grade| ((|List| (|List| (|OrientedFacet|))) $))
                    (SIGNATURE |sort| ($ $))
                    (SIGNATURE |addImpliedFaces|
                     ((|List| (|List| (|OrientedFacet|))) $))
                    (SIGNATURE |delta| ($ $))
                    (SIGNATURE |star| ($ $ (|OrientedFacet|)))
                    (SIGNATURE |link| ($ $ (|OrientedFacet|)))
                    (SIGNATURE |cone| ($ $ (|NonNegativeInteger|)))
                    (SIGNATURE |simplicialJoin| ($ $ $))
                    (SIGNATURE |product| ($ $ $))
                    (SIGNATURE |oneSkeleton|
                     ((|DirectedGraph| (|NonNegativeInteger|)) $))
                    (SIGNATURE |fundamentalGroup| ((|GroupPresentation|) $))
                    (SIGNATURE |fundamentalGroup|
                     ((|GroupPresentation|) $ (|Boolean|) (|Boolean|)))
                    (SIGNATURE |chain| ((|ChainComplex|) $))
                    (SIGNATURE |homology| ((|List| (|Homology|)) $))
                    (SIGNATURE |coerce| ((|DeltaComplex| #2#) $)))))
          (|sc2| (|FiniteSimplicialComplex| (|VertexSetAbstract|)))
          (|d| (|DeltaComplex| (|VertexSetAbstract|)))
          (|sc| (|FiniteSimplicialComplex| (|VertexSetAbstract|))))
         (SEQ
          (LETT |sc| (|SIMPTEST;randomSimplicialComplex| 3 $)
                . #3=(|SIMPTEST;testSimplicialComplex1;B;4|))
          (LETT |d| (SPADCALL |sc| (QREFELT $ 40)) . #3#)
          (LETT |sc2| (SPADCALL |d| (QREFELT $ 41)) . #3#)
          (COND
           ((SPADCALL |sc| |sc2| (QREFELT $ 42))
            (SEQ
             (SPADCALL
              (SPADCALL "testSimplicialComplex1 error: random:"
                        (SPADCALL |sc| (QREFELT $ 43)) (QREFELT $ 31))
              (QREFELT $ 33))
             (SPADCALL
              (SPADCALL "testSimplicialComplex1 error: deltaComplex="
                        (SPADCALL |d| (QREFELT $ 44)) (QREFELT $ 31))
              (QREFELT $ 33))
             (SPADCALL
              (SPADCALL "testSimplicialComplex1 error: f2="
                        (SPADCALL |sc2| (QREFELT $ 43)) (QREFELT $ 31))
              (QREFELT $ 33))
             (EXIT
              (|error|
               (SPADCALL
                "test SimplicialComplex1 failed : coerce to delta should "
                "be inverse of FiniteSimplicialComplex" (QREFELT $ 37)))))))
          (LETT |delta1| (SPADCALL |sc| (QREFELT $ 45)) . #3#)
          (LETT |delta2| (SPADCALL |delta1| (QREFELT $ 45)) . #3#)
          (LETT ASIMP (|FiniteSimplicialComplex| (|VertexSetAbstract|)) . #3#)
          (LETT |v1| NIL . #3#) (LETT |vs1| (SPADCALL 0 (QREFELT $ 47)) . #3#)
          (LETT |zero|
                (SPADCALL |vs1| |v1|
                          (|compiledLookupCheck| '|simplicialComplex|
                                                 (LIST '$
                                                       (LIST
                                                        '|VertexSetAbstract|)
                                                       (LIST '|List|
                                                             (LIST '|List|
                                                                   (LIST
                                                                    '|NonNegativeInteger|))))
                                                 ASIMP))
                . #3#)
          (COND
           ((SPADCALL |delta2| |zero| (QREFELT $ 42))
            (SEQ
             (SPADCALL
              (SPADCALL "testSimplicialComplex2 error: random:"
                        (SPADCALL |sc| (QREFELT $ 43)) (QREFELT $ 31))
              (QREFELT $ 33))
             (SPADCALL
              (SPADCALL "testSimplicialComplex2 error: delta1="
                        (SPADCALL |delta1| (QREFELT $ 43)) (QREFELT $ 31))
              (QREFELT $ 33))
             (SPADCALL
              (SPADCALL "testSimplicialComplex2 error: delta2="
                        (SPADCALL |delta2| (QREFELT $ 43)) (QREFELT $ 31))
              (QREFELT $ 33))
             (EXIT
              (|error|
               (SPADCALL "test SimplicialComplex2 failed : delta function "
                         "composed with itself should give zero"
                         (QREFELT $ 37)))))))
          (LETT |delta1| (SPADCALL |sc| (QREFELT $ 45)) . #3#)
          (LETT |delta2| (SPADCALL |delta1| (QREFELT $ 45)) . #3#) (EXIT 'T)))) 

(SDEFUN |SIMPTEST;testSimplicialComplex2;B;5| (($ |Boolean|))
        (SPROG
         ((|g7| #1=(|GroupPresentation|)) (|g6| #1#) (|g5| #1#) (|g4| #1#)
          (|g3| #1#) (|g2| #1#) (|g1| #1#) (|rule2| #2=(|GroupPresentation|))
          (|rule1| #2#) (|free1| (|GroupPresentation|))
          (|triv| (|GroupPresentation|)))
         (SEQ
          (LETT |triv| (SPADCALL (QREFELT $ 50))
                . #3=(|SIMPTEST;testSimplicialComplex2;B;5|))
          (LETT |free1| (SPADCALL (LIST 1) (QREFELT $ 51)) . #3#)
          (LETT |rule1| (SPADCALL (LIST 1) (LIST (LIST 1)) (QREFELT $ 53))
                . #3#)
          (LETT |rule2| (SPADCALL (LIST 1) (LIST (LIST 1 1)) (QREFELT $ 53))
                . #3#)
          (LETT |g1| (SPADCALL (SPADCALL 2 (QREFELT $ 18)) (QREFELT $ 54))
                . #3#)
          (COND
           ((SPADCALL |g1| |triv| (QREFELT $ 55))
            (SEQ
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL "testSimplicialComplex2 fundamentalGroup:"
                          (SPADCALL |g1| (QREFELT $ 56)) (QREFELT $ 31))
                " should be empty:" (QREFELT $ 31))
               (SPADCALL |triv| (QREFELT $ 56)) (QREFELT $ 31))
              (QREFELT $ 33))
             (EXIT
              (|error|
               "fundamentalGroup of sphereSolid(2) should be empty")))))
          (LETT |g2| (SPADCALL (SPADCALL 3 (QREFELT $ 18)) (QREFELT $ 54))
                . #3#)
          (COND
           ((SPADCALL |g2| |triv| (QREFELT $ 55))
            (SEQ
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL "testSimplicialComplex2 fundamentalGroup:"
                          (SPADCALL |g2| (QREFELT $ 56)) (QREFELT $ 31))
                " should be empty:" (QREFELT $ 31))
               (SPADCALL |triv| (QREFELT $ 56)) (QREFELT $ 31))
              (QREFELT $ 33))
             (EXIT
              (|error|
               "fundamentalGroup of sphereSolid(3) should be empty")))))
          (LETT |g3| (SPADCALL (SPADCALL 2 (QREFELT $ 19)) (QREFELT $ 54))
                . #3#)
          (COND
           ((SPADCALL |g3| |free1| (QREFELT $ 55))
            (SEQ
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL "testSimplicialComplex2 fundamentalGroup:"
                          (SPADCALL |g3| (QREFELT $ 56)) (QREFELT $ 31))
                " should be free in 1 dim:" (QREFELT $ 31))
               (SPADCALL |free1| (QREFELT $ 56)) (QREFELT $ 31))
              (QREFELT $ 33))
             (EXIT
              (|error|
               "fundamentalGroup of sphereSurface(2) should be free in 1 gen")))))
          (LETT |g4| (SPADCALL (SPADCALL 3 (QREFELT $ 19)) (QREFELT $ 54))
                . #3#)
          (COND
           ((SPADCALL |g4| |triv| (QREFELT $ 55))
            (SEQ
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL "testSimplicialComplex2 fundamentalGroup:"
                          (SPADCALL |g4| (QREFELT $ 56)) (QREFELT $ 31))
                " should be empty:" (QREFELT $ 31))
               (SPADCALL |triv| (QREFELT $ 56)) (QREFELT $ 31))
              (QREFELT $ 33))
             (EXIT
              (|error|
               "fundamentalGroup of sphereSurface(3) should be empty")))))
          (LETT |g5| (SPADCALL (SPADCALL (QREFELT $ 21)) (QREFELT $ 54)) . #3#)
          (COND
           ((SPADCALL |g5| |free1| (QREFELT $ 55))
            (SEQ
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL "testSimplicialComplex2 fundamentalGroup:"
                          (SPADCALL |g5| (QREFELT $ 56)) (QREFELT $ 31))
                " should be free in 1 dim:" (QREFELT $ 31))
               (SPADCALL |free1| (QREFELT $ 56)) (QREFELT $ 31))
              (QREFELT $ 33))
             (EXIT
              (|error|
               "fundamentalGroup of band() should be free in 1 gen")))))
          (LETT |g6| (SPADCALL (SPADCALL (QREFELT $ 22)) (QREFELT $ 54)) . #3#)
          (COND
           ((SPADCALL |g6| |free1| (QREFELT $ 55))
            (SEQ
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL "testSimplicialComplex2 fundamentalGroup:"
                          (SPADCALL |g6| (QREFELT $ 56)) (QREFELT $ 31))
                " should be free in 1 dim:" (QREFELT $ 31))
               (SPADCALL |free1| (QREFELT $ 56)) (QREFELT $ 31))
              (QREFELT $ 33))
             (EXIT
              (|error|
               "fundamentalGroup of moebiusBand() should be free in 1 gen")))))
          (LETT |g7| (SPADCALL (SPADCALL (QREFELT $ 23)) (QREFELT $ 54)) . #3#)
          (COND
           ((SPADCALL |g7| |rule2| (QREFELT $ 55))
            (SEQ
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL "testSimplicialComplex2 fundamentalGroup:"
                          (SPADCALL |g7| (QREFELT $ 56)) (QREFELT $ 31))
                " should have 1 rule:" (QREFELT $ 31))
               (SPADCALL |rule2| (QREFELT $ 56)) (QREFELT $ 31))
              (QREFELT $ 33))
             (EXIT
              (|error|
               "fundamentalGroup of projectivePlane() should have 1 rule")))))
          (EXIT 'T)))) 

(SDEFUN |SIMPTEST;testHomology;B;6| (($ |Boolean|))
        (SPROG
         ((|hc6| #1=(|List| (|Homology|)))
          (|bc6| (|FiniteCubicalComplex| (|VertexSetAbstract|))) (|hc5| #1#)
          (|bc5| (|FiniteCubicalComplex| (|VertexSetAbstract|))) (|hc4| #1#)
          (|bc4| #2=(|FiniteCubicalComplex| (|VertexSetAbstract|))) (|hc3| #1#)
          (|bc3| #2#) (|hc2| #1#)
          (|bc2| #3=(|FiniteCubicalComplex| (|VertexSetAbstract|)))
          (|hc1| #4=(|List| (|Homology|))) (|bc1| #3#) (|h7| #4#)
          (|b7| (|FiniteSimplicialComplex| (|VertexSetAbstract|))) (|h6| #4#)
          (|b6| (|FiniteSimplicialComplex| (|VertexSetAbstract|))) (|h5| #4#)
          (|b5| (|FiniteSimplicialComplex| (|VertexSetAbstract|))) (|h4| #4#)
          (|b4| #5=(|FiniteSimplicialComplex| (|VertexSetAbstract|)))
          (|h3| #4#) (|b3| #5#) (|h2| #4#)
          (|b2| #6=(|FiniteSimplicialComplex| (|VertexSetAbstract|)))
          (|h1| #4#) (|b1| #6#))
         (SEQ
          (LETT |b1| (SPADCALL 2 (QREFELT $ 18))
                . #7=(|SIMPTEST;testHomology;B;6|))
          (LETT |h1| (SPADCALL |b1| (QREFELT $ 59)) . #7#)
          (COND
           ((SPADCALL |h1|
                      (LIST (SPADCALL (QREFELT $ 61)) (SPADCALL (QREFELT $ 62))
                            (SPADCALL (QREFELT $ 62)))
                      (QREFELT $ 63))
            (SEQ
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL "testHomology sphereSolid 2D is:"
                          (SPADCALL |h1| (QREFELT $ 64)) (QREFELT $ 31))
                " should be:" (QREFELT $ 31))
               (SPADCALL
                (LIST (SPADCALL (QREFELT $ 61)) (SPADCALL (QREFELT $ 62))
                      (SPADCALL (QREFELT $ 62)))
                (QREFELT $ 64))
               (QREFELT $ 31))
              (QREFELT $ 33))
             (EXIT (|error| "error in testHomology for sphereSolid 2D")))))
          (LETT |b2| (SPADCALL 3 (QREFELT $ 18)) . #7#)
          (LETT |h2| (SPADCALL |b2| (QREFELT $ 59)) . #7#)
          (COND
           ((SPADCALL |h2|
                      (LIST (SPADCALL (QREFELT $ 61)) (SPADCALL (QREFELT $ 62))
                            (SPADCALL (QREFELT $ 62))
                            (SPADCALL (QREFELT $ 62)))
                      (QREFELT $ 63))
            (SEQ
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL "testHomology sphereSolid 3D is:"
                          (SPADCALL |h2| (QREFELT $ 64)) (QREFELT $ 31))
                " should be:" (QREFELT $ 31))
               (SPADCALL
                (LIST (SPADCALL (QREFELT $ 61)) (SPADCALL (QREFELT $ 62))
                      (SPADCALL (QREFELT $ 62)))
                (QREFELT $ 64))
               (QREFELT $ 31))
              (QREFELT $ 33))
             (EXIT (|error| "error in testHomology for sphereSolid 3D")))))
          (LETT |b3| (SPADCALL 2 (QREFELT $ 19)) . #7#)
          (LETT |h3| (SPADCALL |b3| (QREFELT $ 59)) . #7#)
          (COND
           ((SPADCALL |h3|
                      (LIST (SPADCALL (QREFELT $ 61))
                            (SPADCALL (QREFELT $ 61)))
                      (QREFELT $ 63))
            (SEQ
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL "testHomology sphereSurface 2D is:"
                          (SPADCALL |h3| (QREFELT $ 64)) (QREFELT $ 31))
                " should be:" (QREFELT $ 31))
               (SPADCALL
                (LIST (SPADCALL (QREFELT $ 61)) (SPADCALL (QREFELT $ 61)))
                (QREFELT $ 64))
               (QREFELT $ 31))
              (QREFELT $ 33))
             (EXIT (|error| "error in testHomology for sphereSurface 2D")))))
          (LETT |b4| (SPADCALL 3 (QREFELT $ 19)) . #7#)
          (LETT |h4| (SPADCALL |b4| (QREFELT $ 59)) . #7#)
          (COND
           ((SPADCALL |h4|
                      (LIST (SPADCALL (QREFELT $ 61)) (SPADCALL (QREFELT $ 62))
                            (SPADCALL (QREFELT $ 61)))
                      (QREFELT $ 63))
            (SEQ
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL "testHomology sphereSurface 3D is:"
                          (SPADCALL |h4| (QREFELT $ 64)) (QREFELT $ 31))
                " should be:" (QREFELT $ 31))
               (SPADCALL
                (LIST (SPADCALL (QREFELT $ 61)) (SPADCALL (QREFELT $ 62))
                      (SPADCALL (QREFELT $ 61)))
                (QREFELT $ 64))
               (QREFELT $ 31))
              (QREFELT $ 33))
             (EXIT (|error| "error in testHomology for sphereSurface 3D")))))
          (LETT |b5| (SPADCALL (QREFELT $ 20)) . #7#)
          (LETT |h5| (SPADCALL |b5| (QREFELT $ 59)) . #7#)
          (COND
           ((SPADCALL |h5|
                      (LIST (SPADCALL (QREFELT $ 61)) (SPADCALL (QREFELT $ 65))
                            (SPADCALL (QREFELT $ 61)))
                      (QREFELT $ 63))
            (SEQ
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL "testHomology torusSurface is:"
                          (SPADCALL |h5| (QREFELT $ 64)) (QREFELT $ 31))
                " should be:" (QREFELT $ 31))
               (SPADCALL
                (LIST (SPADCALL (QREFELT $ 61)) (SPADCALL (QREFELT $ 65))
                      (SPADCALL (QREFELT $ 61)))
                (QREFELT $ 64))
               (QREFELT $ 31))
              (QREFELT $ 33))
             (EXIT (|error| "error in testHomology for torusSurface")))))
          (LETT |b6| (SPADCALL (QREFELT $ 23)) . #7#)
          (LETT |h6| (SPADCALL |b6| (QREFELT $ 59)) . #7#)
          (COND
           ((SPADCALL |h6|
                      (LIST (SPADCALL (QREFELT $ 61)) (SPADCALL (QREFELT $ 66))
                            (SPADCALL (QREFELT $ 62)))
                      (QREFELT $ 63))
            (SEQ
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL "testHomology projectivePlane is:"
                          (SPADCALL |h6| (QREFELT $ 64)) (QREFELT $ 31))
                " should be:" (QREFELT $ 31))
               (SPADCALL
                (LIST (SPADCALL (QREFELT $ 61)) (SPADCALL (QREFELT $ 66))
                      (SPADCALL (QREFELT $ 62)))
                (QREFELT $ 64))
               (QREFELT $ 31))
              (QREFELT $ 33))
             (EXIT (|error| "error in testHomology for projectivePlane")))))
          (LETT |b7| (SPADCALL (QREFELT $ 24)) . #7#)
          (LETT |h7| (SPADCALL |b7| (QREFELT $ 59)) . #7#)
          (COND
           ((SPADCALL |h7|
                      (LIST (SPADCALL (QREFELT $ 61)) (SPADCALL (QREFELT $ 67))
                            (SPADCALL (QREFELT $ 62)))
                      (QREFELT $ 63))
            (SEQ
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL "testHomology kleinBottle is:"
                          (SPADCALL |h7| (QREFELT $ 64)) (QREFELT $ 31))
                " should be:" (QREFELT $ 31))
               (SPADCALL
                (LIST (SPADCALL (QREFELT $ 61)) (SPADCALL (QREFELT $ 67))
                      (SPADCALL (QREFELT $ 62)))
                (QREFELT $ 64))
               (QREFELT $ 31))
              (QREFELT $ 33))
             (EXIT (|error| "error in testHomology for kleinBottle")))))
          (LETT |bc1| (SPADCALL 2 (QREFELT $ 70)) . #7#)
          (LETT |hc1| (SPADCALL |b1| (QREFELT $ 59)) . #7#)
          (COND
           ((SPADCALL |hc1|
                      (LIST (SPADCALL (QREFELT $ 61)) (SPADCALL (QREFELT $ 62))
                            (SPADCALL (QREFELT $ 62)))
                      (QREFELT $ 63))
            (SEQ
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL "testHomology sphereSolid 2D is:"
                          (SPADCALL |hc1| (QREFELT $ 64)) (QREFELT $ 31))
                " should be:" (QREFELT $ 31))
               (SPADCALL
                (LIST (SPADCALL (QREFELT $ 61)) (SPADCALL (QREFELT $ 62))
                      (SPADCALL (QREFELT $ 62)))
                (QREFELT $ 64))
               (QREFELT $ 31))
              (QREFELT $ 33))
             (EXIT (|error| "error in testHomology for sphereSolid 2D")))))
          (LETT |bc2| (SPADCALL 3 (QREFELT $ 70)) . #7#)
          (LETT |hc2| (SPADCALL |bc2| (QREFELT $ 71)) . #7#)
          (COND
           ((SPADCALL |hc2|
                      (LIST (SPADCALL (QREFELT $ 61)) (SPADCALL (QREFELT $ 62))
                            (SPADCALL (QREFELT $ 62))
                            (SPADCALL (QREFELT $ 62)))
                      (QREFELT $ 63))
            (SEQ
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL "testHomology sphereSolid 3D is:"
                          (SPADCALL |hc2| (QREFELT $ 64)) (QREFELT $ 31))
                " should be:" (QREFELT $ 31))
               (SPADCALL
                (LIST (SPADCALL (QREFELT $ 61)) (SPADCALL (QREFELT $ 62))
                      (SPADCALL (QREFELT $ 62)))
                (QREFELT $ 64))
               (QREFELT $ 31))
              (QREFELT $ 33))
             (EXIT (|error| "error in testHomology for sphereSolid 3D")))))
          (LETT |bc3| (SPADCALL 2 (QREFELT $ 72)) . #7#)
          (LETT |hc3| (SPADCALL |bc3| (QREFELT $ 71)) . #7#)
          (COND
           ((SPADCALL |hc3|
                      (LIST (SPADCALL (QREFELT $ 61))
                            (SPADCALL (QREFELT $ 61)))
                      (QREFELT $ 63))
            (SEQ
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL "testHomology sphereSurface 2D is:"
                          (SPADCALL |hc3| (QREFELT $ 64)) (QREFELT $ 31))
                " should be:" (QREFELT $ 31))
               (SPADCALL
                (LIST (SPADCALL (QREFELT $ 61)) (SPADCALL (QREFELT $ 61)))
                (QREFELT $ 64))
               (QREFELT $ 31))
              (QREFELT $ 33))
             (EXIT (|error| "error in testHomology for sphereSurface 2D")))))
          (LETT |bc4| (SPADCALL 3 (QREFELT $ 72)) . #7#)
          (LETT |hc4| (SPADCALL |bc4| (QREFELT $ 71)) . #7#)
          (COND
           ((SPADCALL |hc4|
                      (LIST (SPADCALL (QREFELT $ 61)) (SPADCALL (QREFELT $ 62))
                            (SPADCALL (QREFELT $ 61)))
                      (QREFELT $ 63))
            (SEQ
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL "testHomology sphereSurface 3D is:"
                          (SPADCALL |hc4| (QREFELT $ 64)) (QREFELT $ 31))
                " should be:" (QREFELT $ 31))
               (SPADCALL
                (LIST (SPADCALL (QREFELT $ 61)) (SPADCALL (QREFELT $ 62))
                      (SPADCALL (QREFELT $ 61)))
                (QREFELT $ 64))
               (QREFELT $ 31))
              (QREFELT $ 33))
             (EXIT (|error| "error in testHomology for sphereSurface 3D")))))
          (LETT |bc5| (SPADCALL (QREFELT $ 73)) . #7#)
          (LETT |hc5| (SPADCALL |bc5| (QREFELT $ 71)) . #7#)
          (COND
           ((SPADCALL |hc5|
                      (LIST (SPADCALL (QREFELT $ 61)) (SPADCALL (QREFELT $ 65))
                            (SPADCALL (QREFELT $ 61)))
                      (QREFELT $ 63))
            (SEQ
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL "testHomology torusSurface is:"
                          (SPADCALL |hc5| (QREFELT $ 64)) (QREFELT $ 31))
                " should be:" (QREFELT $ 31))
               (SPADCALL
                (LIST (SPADCALL (QREFELT $ 61)) (SPADCALL (QREFELT $ 65))
                      (SPADCALL (QREFELT $ 61)))
                (QREFELT $ 64))
               (QREFELT $ 31))
              (QREFELT $ 33))
             (EXIT (|error| "error in testHomology for torusSurface")))))
          (LETT |bc6| (SPADCALL (QREFELT $ 74)) . #7#)
          (LETT |hc6| (SPADCALL |bc6| (QREFELT $ 71)) . #7#)
          (COND
           ((SPADCALL |hc6|
                      (LIST (SPADCALL (QREFELT $ 61)) (SPADCALL (QREFELT $ 66))
                            (SPADCALL (QREFELT $ 62)))
                      (QREFELT $ 63))
            (SEQ
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL "testHomology projectivePlane is:"
                          (SPADCALL |hc6| (QREFELT $ 64)) (QREFELT $ 31))
                " should be:" (QREFELT $ 31))
               (SPADCALL
                (LIST (SPADCALL (QREFELT $ 61)) (SPADCALL (QREFELT $ 66))
                      (SPADCALL (QREFELT $ 62)))
                (QREFELT $ 64))
               (QREFELT $ 31))
              (QREFELT $ 33))
             (EXIT (|error| "error in testHomology for projectivePlane")))))
          (EXIT 'T)))) 

(SDEFUN |SIMPTEST;testAll;NniB;7| ((|n| |NonNegativeInteger|) ($ |Boolean|))
        (SPROG ((#1=#:G799 NIL) (|x| NIL))
               (SEQ
                (SEQ (LETT |x| 1 . #2=(|SIMPTEST;testAll;NniB;7|))
                     (LETT #1# |n| . #2#) G190
                     (COND ((|greater_SI| |x| #1#) (GO G191)))
                     (SEQ (SPADCALL (QREFELT $ 38))
                          (EXIT (SPADCALL (QREFELT $ 48))))
                     (LETT |x| (|inc_SI| |x|) . #2#) (GO G190) G191 (EXIT NIL))
                (SPADCALL (QREFELT $ 57)) (SPADCALL (QREFELT $ 75)) (EXIT 'T)))) 

(DECLAIM (NOTINLINE |SimplicialComplexTests;|)) 

(DEFUN |SimplicialComplexTests| ()
  (SPROG NIL
         (PROG (#1=#:G801)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|SimplicialComplexTests|)
                    . #2=(|SimplicialComplexTests|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|SimplicialComplexTests|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|SimplicialComplexTests;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|SimplicialComplexTests|)))))))))) 

(DEFUN |SimplicialComplexTests;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|SimplicialComplexTests|)
                . #1=(|SimplicialComplexTests|))
          (LETT $ (GETREFV 77) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|SimplicialComplexTests| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|SimplicialComplexTests| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Boolean|) (|NonNegativeInteger|)
              (|List| 7) (0 . |member?|) (6 . |random|) (10 . |concat|)
              (16 . |sort|) (|Integer|) (|OrientedFacet|)
              (21 . |orientedFacet|) (|FiniteSimplicialComplex| 46)
              (|SimplicialComplexFactory|) (27 . |sphereSolid|)
              (32 . |sphereSurface|) (37 . |torusSurface|) (41 . |band|)
              (45 . |moebiusBand|) (49 . |projectivePlane|)
              (53 . |kleinBottle|) (|List| $) (57 . |delta|)
              (62 . |orientedFacet|) (67 . ~=) (|OutputForm|) (73 . |coerce|)
              (78 . |hconcat|) (|Void|) (84 . |print|) (|List| 14)
              (89 . |coerce|) (|String|) (94 . |elt|)
              |SIMPTEST;testOrientedFacet;B;3| (|DeltaComplex| 46)
              (100 . |coerce|) (105 . |coerce|) (110 . ~=) (116 . |coerce|)
              (121 . |coerce|) (126 . |delta|) (|VertexSetAbstract|)
              (131 . |vertexSeta|) |SIMPTEST;testSimplicialComplex1;B;4|
              (|GroupPresentation|) (136 . |groupPresentation|)
              (140 . |groupPresentation|) (|List| (|List| 13))
              (145 . |groupPresentation|) (151 . |fundamentalGroup|) (156 . ~=)
              (162 . |coerce|) |SIMPTEST;testSimplicialComplex2;B;5|
              (|List| 60) (167 . |homology|) (|Homology|) (172 . |homologyz|)
              (176 . |homology0|) (180 . ~=) (186 . |coerce|)
              (191 . |homologyzz|) (195 . |homologyc2|) (199 . |homologyzc2|)
              (|FiniteCubicalComplex| 46) (|CubicalComplexFactory|)
              (203 . |sphereSolid|) (208 . |homology|) (213 . |sphereSurface|)
              (218 . |torusSurface|) (222 . |projectivePlane|)
              |SIMPTEST;testHomology;B;6| |SIMPTEST;testAll;NniB;7|)
           '#(|testSimplicialComplex2| 226 |testSimplicialComplex1| 230
              |testOrientedFacet| 234 |testHomology| 238 |testAll| 242)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 76
                                                 '(2 8 6 7 0 9 0 6 0 10 2 8 0 0
                                                   7 11 1 8 0 0 12 2 14 0 13 8
                                                   15 1 17 16 7 18 1 17 16 7 19
                                                   0 17 16 20 0 17 16 21 0 17
                                                   16 22 0 17 16 23 0 17 16 24
                                                   1 14 25 0 26 1 14 0 25 27 2
                                                   14 6 0 0 28 1 14 29 0 30 2
                                                   29 0 0 0 31 1 29 32 0 33 1
                                                   34 29 0 35 2 36 0 0 0 37 1
                                                   16 39 0 40 1 39 16 0 41 2 16
                                                   6 0 0 42 1 16 29 0 43 1 39
                                                   29 0 44 1 16 0 0 45 1 46 0 7
                                                   47 0 49 0 50 1 49 0 8 51 2
                                                   49 0 8 52 53 1 16 49 0 54 2
                                                   49 6 0 0 55 1 49 29 0 56 1
                                                   16 58 0 59 0 60 0 61 0 60 0
                                                   62 2 58 6 0 0 63 1 58 29 0
                                                   64 0 60 0 65 0 60 0 66 0 60
                                                   0 67 1 69 68 7 70 1 68 58 0
                                                   71 1 69 68 7 72 0 69 68 73 0
                                                   69 68 74 0 0 6 57 0 0 6 48 0
                                                   0 6 38 0 0 6 75 1 0 6 7
                                                   76)))))
           '|lookupComplete|)) 

(MAKEPROP '|SimplicialComplexTests| 'NILADIC T) 
