
(PUT '|FPOSET;finitePoset;LL%;1| '|SPADreplace| 'CONS) 

(SDEFUN |FPOSET;finitePoset;LL%;1|
        ((|carrier| (|List| S)) (|struct1| (|List| (|List| (|Boolean|))))
         (% (%)))
        (CONS |carrier| |struct1|)) 

(SDEFUN |FPOSET;finitePoset;LM%;2|
        ((|carrier| (|List| S)) (|pred| (|Mapping| (|Boolean|) S S)) (% (%)))
        (SPROG
         ((|struct1| (|List| (|List| (|Boolean|)))) (#1=#:G13 NIL) (|x| NIL)
          (#2=#:G12 NIL) (#3=#:G11 NIL) (|y| NIL) (#4=#:G10 NIL))
         (SEQ
          (LETT |struct1|
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |y| NIL) (LETT #3# |carrier|) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |y| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (PROGN
                                (LETT #2# NIL)
                                (SEQ (LETT |x| NIL) (LETT #1# |carrier|) G190
                                     (COND
                                      ((OR (ATOM #1#)
                                           (PROGN (LETT |x| (CAR #1#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #2#
                                             (CONS (SPADCALL |x| |y| |pred|)
                                                   #2#))))
                                     (LETT #1# (CDR #1#)) (GO G190) G191
                                     (EXIT (NREVERSE #2#))))
                               #4#))))
                      (LETT #3# (CDR #3#)) (GO G190) G191
                      (EXIT (NREVERSE #4#)))))
          (EXIT (CONS |carrier| |struct1|))))) 

(PUT '|FPOSET;getVert;%L;3| '|SPADreplace| 'QCAR) 

(SDEFUN |FPOSET;getVert;%L;3| ((|s| (%)) (% (|List| S))) (QCAR |s|)) 

(PUT '|FPOSET;getArr;%L;4| '|SPADreplace| 'QCDR) 

(SDEFUN |FPOSET;getArr;%L;4| ((|s| (%)) (% (|List| (|List| (|Boolean|)))))
        (QCDR |s|)) 

(DECLAIM (NOTINLINE |FinitePoset;|)) 

(DEFUN |FinitePoset;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|FinitePoset| DV$1))
          (LETT % (GETREFV 36))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|FinitePoset| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7
                    (|Record| (|:| |set1| (|List| |#1|))
                              (|:| |struct1| (|List| (|List| (|Boolean|))))))
          %))) 

(DEFUN |FinitePoset| (#1=#:G23)
  (SPROG NIL
         (PROG (#2=#:G24)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FinitePoset|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|FinitePoset;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|FinitePoset|)))))))))) 

(MAKEPROP '|FinitePoset| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 6)
              (|List| (|List| 15)) |FPOSET;finitePoset;LL%;1|
              (|Mapping| 15 6 6) |FPOSET;finitePoset;LM%;2|
              |FPOSET;getVert;%L;3| |FPOSET;getArr;%L;4| (|Boolean|)
              (|OutputForm|) (|String|)
              (|Record| (|:| |value| 6) (|:| |posX| 19) (|:| |posY| 19))
              (|NonNegativeInteger|)
              (|Record| (|:| |name| 17) (|:| |arrType| 19) (|:| |fromOb| 19)
                        (|:| |toOb| 19) (|:| |xOffset| 25) (|:| |yOffset| 25)
                        (|:| |map| 21))
              (|List| 19) (|List| 18) (|DirectedGraph| %) (|List| 20)
              (|Integer|) (|Tree| 25) (|List| 26) (|List| (|Loop|))
              (|Matrix| 25) (|Matrix| 19) (|Void|) (|Scene| (|SCartesian| '2))
              (|List| %) (|Union| 19 '"failed") (|IncidenceAlgebra| 25 6))
           '#(~= 0 |zetaMatrix| 6 |upperSet| 11 |unit| 16 |terminal| 22
              |subdiagramSvg| 27 |spanningTreeNode| 35 |spanningTreeArrow| 41
              |spanningForestNode| 47 |spanningForestArrow| 52 |routeNodes| 57
              |routeArrows| 64 |outDegree| 71 |opposite| 77 |objectToIndex| 82
              |nodeToNode| 88 |nodeToArrow| 94 |nodeFromNode| 100
              |nodeFromArrow| 106 |moebius| 112 |min| 117 |merge| 128
              |meetIfCan| 134 |max| 147 |mapContra| 158 |map| 167 |lub| 176
              |lowerSet| 182 |looseEquals| 187 |loopsNodes| 193 |loopsAtNode|
              198 |loopsArrows| 204 |le| 209 |latex| 216 |laplacianMatrix| 221
              |kgraph| 226 |joinIfCan| 232 |isGreaterThan?| 245 |isFunctional?|
              252 |isFixPoint?| 257 |isDirected?| 263 |isDirectSuccessor?| 267
              |isChain?| 274 |isAntiChain?| 279 |isAcyclic?| 284 |initial| 289
              |indexToObject| 293 |incidenceMatrix| 299 |inDegree| 304
              |implies| 310 |glb| 317 |getVertices| 323 |getVertexIndex| 328
              |getVert| 334 |getArrows| 339 |getArrowIndex| 344 |getArr| 351
              |flatten| 356 |finitePoset| 361 |distanceMatrix| 373 |distance|
              378 |diagramsSvg| 385 |diagramWidth| 392 |diagramSvg| 397
              |diagramHeight| 404 |deepDiagramSvg| 409 |cycleOpen| 416
              |cycleClosed| 422 |createY| 428 |createX| 434 |createWidth| 440
              |coverMatrix| 445 |coerce| 450 |arrowsToNode| 455 |arrowsToArrow|
              461 |arrowsFromNode| 467 |arrowsFromArrow| 473 |arrowName| 479
              |adjacencyMatrix| 486 |addObject!| 491 |addObject| 503
              |addArrow!| 509 |addArrow| 540 = 547 + 553)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0))
                 (CONS
                  '#(|Poset&| NIL |FiniteGraph&| |SetCategory&| NIL
                     |BasicType&|)
                  (CONS
                   '#((|Poset| 6) (|Preorder| 6) (|FiniteGraph| 6)
                      (|SetCategory|) (|CoercibleTo| 16) (|BasicType|))
                   (|makeByteWordVec2| 35
                                       '(2 0 15 0 0 1 1 0 35 0 1 1 0 0 0 1 2 0
                                         0 8 17 1 1 0 0 6 1 4 0 31 32 0 15 15 1
                                         2 0 26 0 19 1 2 0 26 0 19 1 1 0 27 0 1
                                         1 0 27 0 1 3 0 21 0 19 19 1 3 0 21 0
                                         19 19 1 2 0 19 0 19 1 1 0 0 0 1 2 0 19
                                         0 6 1 2 0 21 0 19 1 2 0 21 0 19 1 2 0
                                         21 0 19 1 2 0 21 0 19 1 1 0 35 0 1 2 0
                                         19 0 21 1 1 0 19 0 1 2 0 0 0 0 1 3 0
                                         34 0 19 19 1 2 0 34 0 21 1 1 0 19 0 1
                                         2 0 19 0 21 1 5 0 0 0 21 8 25 25 1 5 0
                                         0 0 21 8 25 25 1 2 0 34 0 21 1 1 0 0 0
                                         1 2 0 15 0 0 1 1 0 28 0 1 2 0 28 0 19
                                         1 1 0 28 0 1 3 0 15 0 6 6 1 1 0 17 0 1
                                         1 0 29 0 1 2 0 0 8 17 1 3 0 34 0 19 19
                                         1 2 0 34 0 21 1 3 0 15 0 19 19 1 1 0
                                         15 0 1 2 0 15 0 19 1 0 0 15 1 3 0 15 0
                                         19 19 1 1 0 15 0 1 1 0 15 0 1 1 0 15 0
                                         1 0 0 0 1 2 0 6 0 19 1 1 0 29 0 1 2 0
                                         19 0 19 1 3 0 15 0 19 19 1 2 0 34 0 21
                                         1 1 0 22 0 1 2 0 19 0 6 1 1 0 8 0 13 1
                                         0 24 0 1 3 0 19 0 19 19 1 1 0 9 0 14 1
                                         0 0 23 1 2 0 0 8 11 12 2 0 0 8 9 10 1
                                         0 29 0 1 3 0 25 0 19 19 1 3 0 31 17 33
                                         15 1 1 0 19 0 1 3 0 31 17 0 15 1 1 0
                                         19 0 1 3 0 31 17 0 15 1 2 0 0 8 17 1 2
                                         0 0 8 17 1 2 0 19 19 19 1 2 0 19 19 19
                                         1 1 0 19 19 1 1 0 35 0 1 1 0 16 0 1 2
                                         0 21 0 19 1 2 0 21 0 19 1 2 0 21 0 19
                                         1 2 0 21 0 19 1 3 0 17 0 19 19 1 1 0
                                         30 0 1 2 0 0 0 6 1 2 0 0 0 18 1 2 0 0
                                         0 6 1 4 0 0 0 17 19 19 1 2 0 0 0 20 1
                                         5 0 0 0 17 19 19 21 1 4 0 0 0 17 6 6 1
                                         3 0 0 0 6 6 1 2 0 15 0 0 1 2 0 0 0 0
                                         1)))))
           '|lookupComplete|)) 
