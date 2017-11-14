
(PUT '|FCDCPO;finitePoset;LL$;1| '|SPADreplace| 'CONS) 

(SDEFUN |FCDCPO;finitePoset;LL$;1|
        ((|set1| |List| S) (|struct1| |List| (|List| (|Boolean|))) ($ $))
        (CONS |set1| |struct1|)) 

(PUT '|FCDCPO;getVert;$L;2| '|SPADreplace| 'QCAR) 

(SDEFUN |FCDCPO;getVert;$L;2| ((|s| $) ($ |List| S)) (QCAR |s|)) 

(PUT '|FCDCPO;getArr;$L;3| '|SPADreplace| 'QCDR) 

(SDEFUN |FCDCPO;getArr;$L;3| ((|s| $) ($ |List| (|List| (|Boolean|))))
        (QCDR |s|)) 

(SDEFUN |FCDCPO;setVert;$LV;4| ((|s| $) (|v| |List| S) ($ |Void|))
        (SEQ (PROGN (RPLACA |s| |v|) (QCAR |s|))
             (EXIT (SPADCALL (QREFELT $ 14))))) 

(SDEFUN |FCDCPO;setArr;$LV;5|
        ((|s| $) (|v| |List| (|List| (|Boolean|))) ($ |Void|))
        (SEQ (PROGN (RPLACD |s| |v|) (QCDR |s|))
             (EXIT (SPADCALL (QREFELT $ 14))))) 

(SDEFUN |FCDCPO;listToString|
        ((|a| |List| (|NonNegativeInteger|)) ($ |String|))
        (SPROG ((|res| (|String|)) (#1=#:G713 NIL) (|x| NIL))
               (SEQ (LETT |res| "[" . #2=(|FCDCPO;listToString|))
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

(SDEFUN |FCDCPO;meet;$3Nni;7|
        ((|s| $) (|a| . #1=(|NonNegativeInteger|)) (|b| . #1#)
         ($ |NonNegativeInteger|))
        (SPROG
         ((#2=#:G715 NIL) (|res| (|Union| (|NonNegativeInteger|) "failed")))
         (SEQ
          (LETT |res| (SPADCALL |s| |a| |b| (QREFELT $ 19))
                . #3=(|FCDCPO;meet;$3Nni;7|))
          (COND
           ((SPADCALL |res| (CONS 1 "failed") (QREFELT $ 21))
            (|error| "This POSET does not have meet")))
          (EXIT
           (PROG2 (LETT #2# |res| . #3#)
               (QCDR #2#)
             (|check_union2| (QEQCAR #2# 0) (|NonNegativeInteger|)
                             (|Union| (|NonNegativeInteger|) "failed") #2#)))))) 

(DECLAIM (NOTINLINE |FiniteCoDcpo;|)) 

(DEFUN |FiniteCoDcpo| (#1=#:G728)
  (SPROG NIL
         (PROG (#2=#:G729)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FiniteCoDcpo|)
                                               '|domainEqualList|)
                    . #3=(|FiniteCoDcpo|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|FiniteCoDcpo;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|FiniteCoDcpo|)))))))))) 

(DEFUN |FiniteCoDcpo;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteCoDcpo|))
          (LETT |dv$| (LIST '|FiniteCoDcpo| DV$1) . #1#)
          (LETT $ (GETREFV 43) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FiniteCoDcpo| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record| (|:| |set1| (|List| |#1|))
                              (|:| |struct1| (|List| (|List| (|Boolean|))))))
          $))) 

(MAKEPROP '|FiniteCoDcpo| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 6)
              (|List| (|List| 20)) |FCDCPO;finitePoset;LL$;1|
              |FCDCPO;getVert;$L;2| |FCDCPO;getArr;$L;3| (|Void|) (0 . |void|)
              |FCDCPO;setVert;$LV;4| |FCDCPO;setArr;$LV;5|
              (|Union| 18 '"failed") (|NonNegativeInteger|) (4 . |meetIfCan|)
              (|Boolean|) (11 . =) |FCDCPO;meet;$3Nni;7|
              (|IncidenceAlgebra| 26 6) (|List| 18) (|Mapping| 20 6 6)
              (|Integer|) (|String|) (|List| $) (|Scene| (|SCartesian| '2))
              (|Matrix| 26) (|Matrix| 18) (|List| (|Loop|)) (|Tree| 26)
              (|List| 33)
              (|Record| (|:| |name| 27) (|:| |arrType| 18) (|:| |fromOb| 18)
                        (|:| |toOb| 18) (|:| |xOffset| 26) (|:| |yOffset| 26)
                        (|:| |map| 24))
              (|List| 35) (|DirectedGraph| $)
              (|Record| (|:| |value| 6) (|:| |posX| 18) (|:| |posY| 18))
              (|List| 38) (|OutputForm|) (|HashState|) (|SingleInteger|))
           '#(~= 17 |zetaMatrix| 23 |upperSet| 28 |unit| 33 |terminal| 39
              |subdiagramSvg| 44 |spanningTreeNode| 52 |spanningTreeArrow| 58
              |spanningForestNode| 64 |spanningForestArrow| 69 |setVert| 74
              |setArr| 80 |routeNodes| 86 |routeArrows| 93 |powerSetStructure|
              100 |outDegree| 105 |opposite| 111 |objectToIndex| 116
              |nodeToNode| 122 |nodeToArrow| 128 |nodeFromNode| 134
              |nodeFromArrow| 140 |moebius| 146 |min| 151 |merge| 162
              |meetIfCan| 168 |meet| 181 |max| 188 |mapContra| 199 |map| 208
              |lub| 217 |lowerSet| 223 |looseEquals| 228 |loopsNodes| 234
              |loopsAtNode| 239 |loopsArrows| 245 |le| 250 |latex| 257
              |laplacianMatrix| 262 |kgraph| 267 |joinIfCan| 273
              |isGreaterThan?| 286 |isFunctional?| 293 |isFixPoint?| 298
              |isDirected?| 304 |isDirectSuccessor?| 308 |isChain?| 315
              |isAntisymmetric?| 320 |isAntiChain?| 325 |isAcyclic?| 330
              |initial| 335 |indexToObject| 339 |incidenceMatrix| 345
              |inDegree| 350 |implies| 356 |hashUpdate!| 363 |hash| 369 |glb|
              374 |getVertices| 380 |getVertexIndex| 385 |getVert| 391
              |getArrows| 396 |getArrowIndex| 401 |getArr| 408 |flatten| 413
              |finitePoset| 418 |distanceMatrix| 430 |distance| 435
              |diagramsSvg| 442 |diagramWidth| 449 |diagramSvg| 454
              |diagramHeight| 461 |deepDiagramSvg| 466 |cycleOpen| 473
              |cycleClosed| 479 |createY| 485 |createX| 491 |createWidth| 497
              |coverMatrix| 502 |completeTransitivity| 507
              |completeReflexivity| 512 |coerce| 517 |arrowsToNode| 522
              |arrowsToArrow| 528 |arrowsFromNode| 534 |arrowsFromArrow| 540
              |arrowName| 546 |adjacencyMatrix| 553 |addObject!| 558
              |addArrow!| 570 = 608 + 614)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0))
                 (CONS
                  '#(NIL |Poset&| NIL |FiniteGraph&| |SetCategory&| NIL
                     |BasicType&|)
                  (CONS
                   '#((|CoDcpo| 6) (|Poset| 6) (|Preorder| 6) (|FiniteGraph| 6)
                      (|SetCategory|) (|CoercibleTo| 40) (|BasicType|))
                   (|makeByteWordVec2| 42
                                       '(0 13 0 14 3 0 17 0 18 18 19 2 17 20 0
                                         0 21 2 0 20 0 0 1 1 0 23 0 1 1 0 0 0 1
                                         2 0 0 8 27 1 1 0 0 6 1 4 0 13 29 0 20
                                         20 1 2 0 33 0 18 1 2 0 33 0 18 1 1 0
                                         34 0 1 1 0 34 0 1 2 0 13 0 8 15 2 0 13
                                         0 9 16 3 0 24 0 18 18 1 3 0 24 0 18 18
                                         1 1 0 0 6 1 2 0 18 0 18 1 1 0 0 0 1 2
                                         0 18 0 6 1 2 0 24 0 18 1 2 0 24 0 18 1
                                         2 0 24 0 18 1 2 0 24 0 18 1 1 0 23 0 1
                                         2 0 18 0 24 1 1 0 18 0 1 2 0 0 0 0 1 2
                                         0 17 0 24 1 3 0 17 0 18 18 19 3 0 18 0
                                         18 18 22 2 0 18 0 24 1 1 0 18 0 1 5 0
                                         0 0 24 8 26 26 1 5 0 0 0 24 8 26 26 1
                                         2 0 17 0 24 1 1 0 0 0 1 2 0 20 0 0 1 1
                                         0 32 0 1 2 0 32 0 18 1 1 0 32 0 1 3 0
                                         20 0 18 18 1 1 0 27 0 1 1 0 30 0 1 2 0
                                         0 8 27 1 2 0 17 0 24 1 3 0 17 0 18 18
                                         1 3 0 20 0 18 18 1 1 0 20 0 1 2 0 20 0
                                         18 1 0 0 20 1 3 0 20 0 18 18 1 1 0 20
                                         0 1 1 0 20 0 1 1 0 20 0 1 1 0 20 0 1 0
                                         0 0 1 2 0 6 0 18 1 1 0 30 0 1 2 0 18 0
                                         18 1 3 0 20 0 18 18 1 2 0 41 41 0 1 1
                                         0 42 0 1 2 0 17 0 24 1 1 0 39 0 1 2 0
                                         18 0 6 1 1 0 8 0 11 1 0 36 0 1 3 0 18
                                         0 18 18 1 1 0 9 0 12 1 0 0 37 1 2 0 0
                                         8 25 1 2 0 0 8 9 10 1 0 30 0 1 3 0 26
                                         0 18 18 1 3 0 13 27 28 20 1 1 0 18 0 1
                                         3 0 13 27 0 20 1 1 0 18 0 1 3 0 13 27
                                         0 20 1 2 0 0 8 27 1 2 0 0 8 27 1 2 0
                                         18 18 18 1 2 0 18 18 18 1 1 0 18 18 1
                                         1 0 23 0 1 1 0 0 0 1 1 0 0 0 1 1 0 40
                                         0 1 2 0 24 0 18 1 2 0 24 0 18 1 2 0 24
                                         0 18 1 2 0 24 0 18 1 3 0 27 0 18 18 1
                                         1 0 31 0 1 2 0 0 0 6 1 2 0 0 0 38 1 3
                                         0 0 0 18 18 1 4 0 0 0 27 6 6 1 4 0 0 0
                                         27 18 18 1 5 0 0 0 27 18 18 24 1 2 0 0
                                         0 35 1 2 0 20 0 0 1 2 0 0 0 0 1)))))
           '|lookupComplete|)) 
