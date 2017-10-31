
(PUT '|FBICPO;finitePoset;LL$;1| '|SPADreplace| 'CONS) 

(SDEFUN |FBICPO;finitePoset;LL$;1|
        ((|set1| |List| S) (|struct1| |List| (|List| (|Boolean|))) ($ $))
        (CONS |set1| |struct1|)) 

(PUT '|FBICPO;getVert;$L;2| '|SPADreplace| 'QCAR) 

(SDEFUN |FBICPO;getVert;$L;2| ((|s| $) ($ |List| S)) (QCAR |s|)) 

(PUT '|FBICPO;getArr;$L;3| '|SPADreplace| 'QCDR) 

(SDEFUN |FBICPO;getArr;$L;3| ((|s| $) ($ |List| (|List| (|Boolean|))))
        (QCDR |s|)) 

(SDEFUN |FBICPO;setVert;$LV;4| ((|s| $) (|v| |List| S) ($ |Void|))
        (SEQ (PROGN (RPLACA |s| |v|) (QCAR |s|))
             (EXIT (SPADCALL (QREFELT $ 14))))) 

(SDEFUN |FBICPO;setArr;$LV;5|
        ((|s| $) (|v| |List| (|List| (|Boolean|))) ($ |Void|))
        (SEQ (PROGN (RPLACD |s| |v|) (QCDR |s|))
             (EXIT (SPADCALL (QREFELT $ 14))))) 

(SDEFUN |FBICPO;listToString|
        ((|a| |List| (|NonNegativeInteger|)) ($ |String|))
        (SPROG ((|res| (|String|)) (#1=#:G710 NIL) (|x| NIL))
               (SEQ (LETT |res| "[" . #2=(|FBICPO;listToString|))
                    (SEQ (LETT |x| NIL . #2#) (LETT #1# |a| . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |res| (STRCONC |res| (STRINGIMAGE |x|)) . #2#)
                          (EXIT (LETT |res| (STRCONC |res| ", ") . #2#)))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT (STRCONC |res| "]"))))) 

(SDEFUN |FBICPO;join;$3Nni;7|
        ((|s| $) (|a| . #1=(|NonNegativeInteger|)) (|b| . #1#)
         ($ |NonNegativeInteger|))
        (SPROG
         ((#2=#:G712 NIL) (|res| (|Union| (|NonNegativeInteger|) "failed")))
         (SEQ
          (LETT |res| (SPADCALL |s| |a| |b| (QREFELT $ 19))
                . #3=(|FBICPO;join;$3Nni;7|))
          (COND
           ((SPADCALL |res| (CONS 1 "failed") (QREFELT $ 21))
            (|error| "This POSET does not have join")))
          (EXIT
           (PROG2 (LETT #2# |res| . #3#)
               (QCDR #2#)
             (|check_union2| (QEQCAR #2# 0) (|NonNegativeInteger|)
                             (|Union| (|NonNegativeInteger|) "failed") #2#)))))) 

(SDEFUN |FBICPO;meet;$3Nni;8|
        ((|s| $) (|a| . #1=(|NonNegativeInteger|)) (|b| . #1#)
         ($ |NonNegativeInteger|))
        (SPROG
         ((#2=#:G718 NIL) (|res| (|Union| (|NonNegativeInteger|) "failed")))
         (SEQ
          (LETT |res| (SPADCALL |s| |a| |b| (QREFELT $ 23))
                . #3=(|FBICPO;meet;$3Nni;8|))
          (COND
           ((SPADCALL |res| (CONS 1 "failed") (QREFELT $ 21))
            (|error| "This POSET does not have meet")))
          (EXIT
           (PROG2 (LETT #2# |res| . #3#)
               (QCDR #2#)
             (|check_union2| (QEQCAR #2# 0) (|NonNegativeInteger|)
                             (|Union| (|NonNegativeInteger|) "failed") #2#)))))) 

(DECLAIM (NOTINLINE |FiniteBiCPO;|)) 

(DEFUN |FiniteBiCPO| (#1=#:G730)
  (SPROG NIL
         (PROG (#2=#:G731)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FiniteBiCPO|)
                                               '|domainEqualList|)
                    . #3=(|FiniteBiCPO|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|FiniteBiCPO;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|FiniteBiCPO|)))))))))) 

(DEFUN |FiniteBiCPO;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteBiCPO|))
          (LETT |dv$| (LIST '|FiniteBiCPO| DV$1) . #1#)
          (LETT $ (GETREFV 44) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FiniteBiCPO| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record| (|:| |set1| (|List| |#1|))
                              (|:| |struct1| (|List| (|List| (|Boolean|))))))
          $))) 

(MAKEPROP '|FiniteBiCPO| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 6)
              (|List| (|List| 20)) |FBICPO;finitePoset;LL$;1|
              |FBICPO;getVert;$L;2| |FBICPO;getArr;$L;3| (|Void|) (0 . |void|)
              |FBICPO;setVert;$LV;4| |FBICPO;setArr;$LV;5|
              (|Union| 18 '"failed") (|NonNegativeInteger|) (4 . |joinIfCan|)
              (|Boolean|) (11 . =) |FBICPO;join;$3Nni;7| (17 . |meetIfCan|)
              |FBICPO;meet;$3Nni;8| (|IncidenceAlgebra| 28 6) (|List| 18)
              (|Mapping| 20 6 6) (|Integer|) (|String|)
              (|Scene| (|SCartesian| '2)) (|Matrix| 28) (|Matrix| 18)
              (|List| (|Loop|)) (|List| 35) (|Tree| 28) (|DirectedGraph| $)
              (|Record| (|:| |name| 29) (|:| |arrType| 18) (|:| |fromOb| 18)
                        (|:| |toOb| 18) (|:| |xOffset| 28) (|:| |yOffset| 28)
                        (|:| |map| 26))
              (|List| 37)
              (|Record| (|:| |value| 6) (|:| |posX| 18) (|:| |posY| 18))
              (|List| 39) (|OutputForm|) (|HashState|) (|SingleInteger|))
           '#(~= 24 |zetaMatrix| 30 |upperSet| 35 |unit| 40 |terminal| 46
              |subdiagramSvg| 51 |spanningTreeNode| 59 |spanningTreeArrow| 65
              |spanningForestNode| 71 |spanningForestArrow| 76 |setVert| 81
              |setArr| 87 |routeNodes| 93 |routeArrows| 100 |powerSetStructure|
              107 |outDegree| 112 |opposite| 118 |objectToIndex| 123
              |nodeToNode| 129 |nodeToArrow| 135 |nodeFromNode| 141
              |nodeFromArrow| 147 |moebius| 153 |min| 158 |merge| 169
              |meetIfCan| 175 |meet| 188 |max| 195 |mapContra| 206 |map| 215
              |lub| 224 |lowerSet| 230 |looseEquals| 235 |loopsNodes| 241
              |loopsAtNode| 246 |loopsArrows| 252 |le| 257 |latex| 264
              |laplacianMatrix| 269 |kgraph| 274 |joinIfCan| 280 |join| 293
              |isGreaterThan?| 300 |isFunctional?| 307 |isFixPoint?| 312
              |isDirected?| 318 |isDirectSuccessor?| 322 |isChain?| 329
              |isAntisymmetric?| 334 |isAntiChain?| 339 |isAcyclic?| 344
              |initial| 349 |indexToObject| 353 |incidenceMatrix| 359
              |inDegree| 364 |implies| 370 |hashUpdate!| 377 |hash| 383 |glb|
              388 |getVertices| 394 |getVertexIndex| 399 |getVert| 405
              |getArrows| 410 |getArrowIndex| 415 |getArr| 422 |flatten| 427
              |finitePoset| 432 |distanceMatrix| 444 |distance| 449
              |diagramWidth| 456 |diagramSvg| 461 |diagramHeight| 468
              |deepDiagramSvg| 473 |cycleOpen| 480 |cycleClosed| 486 |createY|
              492 |createX| 498 |createWidth| 504 |coverMatrix| 509
              |completeTransitivity| 514 |completeReflexivity| 519 |coerce| 524
              |arrowsToNode| 534 |arrowsToArrow| 540 |arrowsFromNode| 546
              |arrowsFromArrow| 552 |arrowName| 558 |adjacencyMatrix| 565
              |addObject!| 570 |addObject| 582 |addArrow!| 588 |addArrow| 613 =
              620 + 626)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(NIL NIL NIL |Poset&| NIL |FiniteGraph&| |SetCategory&| NIL
                     |BasicType&|)
                  (CONS
                   '#((|BiCPO| 6) (|Dcpo| 6) (|CoDcpo| 6) (|Poset| 6)
                      (|Preorder| 6) (|FiniteGraph| 6) (|SetCategory|)
                      (|CoercibleTo| 41) (|BasicType|))
                   (|makeByteWordVec2| 43
                                       '(0 13 0 14 3 0 17 0 18 18 19 2 17 20 0
                                         0 21 3 0 17 0 18 18 23 2 0 20 0 0 1 1
                                         0 25 0 1 1 0 0 0 1 2 0 0 8 29 1 1 0 0
                                         6 1 4 0 13 30 0 20 20 1 2 0 35 0 18 1
                                         2 0 35 0 18 1 1 0 34 0 1 1 0 34 0 1 2
                                         0 13 0 8 15 2 0 13 0 9 16 3 0 26 0 18
                                         18 1 3 0 26 0 18 18 1 1 0 0 6 1 2 0 18
                                         0 18 1 1 0 0 0 1 2 0 18 0 6 1 2 0 26 0
                                         18 1 2 0 26 0 18 1 2 0 26 0 18 1 2 0
                                         26 0 18 1 1 0 25 0 1 1 0 18 0 1 2 0 18
                                         0 26 1 2 0 0 0 0 1 2 0 17 0 26 1 3 0
                                         17 0 18 18 23 3 0 18 0 18 18 24 2 0 18
                                         0 26 1 1 0 18 0 1 5 0 0 0 26 8 28 28 1
                                         5 0 0 0 26 8 28 28 1 2 0 17 0 26 1 1 0
                                         0 0 1 2 0 20 0 0 1 1 0 33 0 1 2 0 33 0
                                         18 1 1 0 33 0 1 3 0 20 0 18 18 1 1 0
                                         29 0 1 1 0 31 0 1 2 0 0 8 29 1 2 0 17
                                         0 26 1 3 0 17 0 18 18 19 3 0 18 0 18
                                         18 22 3 0 20 0 18 18 1 1 0 20 0 1 2 0
                                         20 0 18 1 0 0 20 1 3 0 20 0 18 18 1 1
                                         0 20 0 1 1 0 20 0 1 1 0 20 0 1 1 0 20
                                         0 1 0 0 0 1 2 0 6 0 18 1 1 0 31 0 1 2
                                         0 18 0 18 1 3 0 20 0 18 18 1 2 0 42 42
                                         0 1 1 0 43 0 1 2 0 17 0 26 1 1 0 40 0
                                         1 2 0 18 0 6 1 1 0 8 0 11 1 0 38 0 1 3
                                         0 18 0 18 18 1 1 0 9 0 12 1 0 0 36 1 2
                                         0 0 8 9 10 2 0 0 8 27 1 1 0 31 0 1 3 0
                                         28 0 18 18 1 1 0 18 0 1 3 0 13 29 0 20
                                         1 1 0 18 0 1 3 0 13 29 0 20 1 2 0 0 8
                                         29 1 2 0 0 8 29 1 2 0 18 18 18 1 2 0
                                         18 18 18 1 1 0 18 18 1 1 0 25 0 1 1 0
                                         0 0 1 1 0 0 0 1 1 0 41 0 1 1 0 41 0 1
                                         2 0 26 0 18 1 2 0 26 0 18 1 2 0 26 0
                                         18 1 2 0 26 0 18 1 3 0 29 0 18 18 1 1
                                         0 32 0 1 2 0 0 0 6 1 2 0 0 0 39 1 2 0
                                         0 0 6 1 5 0 0 0 29 18 18 26 1 4 0 0 0
                                         29 6 6 1 4 0 0 0 29 18 18 1 3 0 0 0 18
                                         18 1 2 0 20 0 0 1 2 0 0 0 0 1)))))
           '|lookupComplete|)) 
