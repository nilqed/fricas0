
(SDEFUN |SCENE;createSceneRoot;Sb$;1| ((|bb| |SBoundary| PT) ($ $))
        (VECTOR 'ROOT NIL (CONS 3 |bb|))) 

(SDEFUN |SCENE;createSceneRoot;R$;2|
        ((|bb| |Record| (|:| |mins| PT) (|:| |maxs| PT)) ($ $))
        (SPADCALL (SPADCALL (QCAR |bb|) (QCDR |bb|) (QREFELT $ 10))
                  (QREFELT $ 9))) 

(SDEFUN |SCENE;createSceneRoot;4I$;3|
        ((|minx| |Integer|) (|miny| |Integer|) (|maxx| |Integer|)
         (|maxy| |Integer|) ($ $))
        (SPROG ((|bb| (|SBoundary| PT)))
               (SEQ
                (LETT |bb|
                      (SPADCALL (SPADCALL |minx| |miny| (QREFELT $ 14))
                                (SPADCALL |maxx| |maxy| (QREFELT $ 14))
                                (QREFELT $ 10))
                      |SCENE;createSceneRoot;4I$;3|)
                (EXIT (VECTOR 'ROOT NIL (CONS 3 |bb|)))))) 

(SDEFUN |SCENE;createSceneRoot;$;4| (($ $))
        (VECTOR 'ROOT NIL (CONS 3 (SPADCALL (QREFELT $ 16))))) 

(SDEFUN |SCENE;createSceneGroup;$;5| (($ $))
        (VECTOR 'GROUP NIL (CONS 11 "empty"))) 

(SDEFUN |SCENE;addSceneGroup;2$;6| ((|n| $) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL (QREFELT $ 18)) |SCENE;addSceneGroup;2$;6|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneLine;L$;7| ((|line| |List| PT) ($ $))
        (VECTOR 'LINE NIL (CONS 0 (LIST |line|)))) 

(SDEFUN |SCENE;addSceneLine;$L$;8| ((|n| $) (|line| |List| PT) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |line| (QREFELT $ 23))
                      |SCENE;addSceneLine;$L$;8|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneLine;2$Df$;9|
        ((|st| $) (|en| $) (|fontScale| |DoubleFloat|) ($ $))
        (SPROG
         ((|enPoint| (PT)) (|stPoint| (PT)) (|enBoundary| #1=(|SBoundary| PT))
          (|stBoundary| #1#))
         (SEQ
          (LETT |stBoundary| (SPADCALL |st| |fontScale| (QREFELT $ 26))
                . #2=(|SCENE;createSceneLine;2$Df$;9|))
          (LETT |enBoundary| (SPADCALL |en| |fontScale| (QREFELT $ 26)) . #2#)
          (LETT |stPoint|
                (SPADCALL |enBoundary| (SPADCALL |stBoundary| (QREFELT $ 27))
                          (QREFELT $ 28))
                . #2#)
          (LETT |enPoint|
                (SPADCALL |stBoundary| (SPADCALL |enBoundary| (QREFELT $ 27))
                          (QREFELT $ 28))
                . #2#)
          (EXIT
           (VECTOR 'LINE NIL (CONS 0 (LIST (LIST |stPoint| |enPoint|)))))))) 

(SDEFUN |SCENE;addSceneLine;3$Df$;10|
        ((|n| $) (|st| $) (|en| $) (|fontScale| |DoubleFloat|) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |st| |en| |fontScale| (QREFELT $ 29))
                      |SCENE;addSceneLine;3$Df$;10|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneLines;L$;11| ((|lines| |List| (|List| PT)) ($ $))
        (VECTOR 'LINE NIL (CONS 0 |lines|))) 

(SDEFUN |SCENE;addSceneLines;$L$;12|
        ((|n| $) (|lines| |List| (|List| PT)) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |lines| (QREFELT $ 32))
                      |SCENE;addSceneLines;$L$;12|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneShape;R$;13|
        ((|shape| |Record| (|:| |shptype| (|Symbol|)) (|:| |centre| PT)
          (|:| |size| PT) (|:| |fill| (|Boolean|)))
         ($ $))
        (VECTOR 'SHAPE NIL (CONS 8 |shape|))) 

(SDEFUN |SCENE;addSceneShape;$R$;14|
        ((|n| $)
         (|shape| |Record| (|:| |shptype| (|Symbol|)) (|:| |centre| PT)
          (|:| |size| PT) (|:| |fill| (|Boolean|)))
         ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |shape| (QREFELT $ 35))
                      |SCENE;addSceneShape;$R$;14|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneShape;Sb$;15| ((|shape| |SBoundary| PT) ($ $))
        (SPROG
         ((|sh|
           (|Record| (|:| |shptype| (|Symbol|)) (|:| |centre| PT)
                     (|:| |size| PT) (|:| |fill| (|Boolean|))))
          (|mn| (PT)) (|mx| (PT)))
         (SEQ
          (LETT |mx| (SPADCALL |shape| (QREFELT $ 37))
                . #1=(|SCENE;createSceneShape;Sb$;15|))
          (LETT |mn| (SPADCALL |shape| (QREFELT $ 38)) . #1#)
          (LETT |sh|
                (VECTOR '|rect| |mn| (SPADCALL |mx| |mn| (QREFELT $ 39)) NIL)
                . #1#)
          (EXIT (VECTOR 'SHAPE NIL (CONS 8 |sh|)))))) 

(SDEFUN |SCENE;addSceneShape;$Sb$;16| ((|n| $) (|shape| |SBoundary| PT) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |shape| (QREFELT $ 40))
                      |SCENE;addSceneShape;$Sb$;16|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneDef;S2$;17| ((|nam| |String|) (|nde| $) ($ $))
        (SPROG ((|nn| (|Record| (|:| |nme| (|String|)) (|:| |node| $))))
               (SEQ
                (LETT |nn| (CONS |nam| |nde|) |SCENE;createSceneDef;S2$;17|)
                (EXIT (VECTOR 'DEF NIL (CONS 9 |nn|)))))) 

(SDEFUN |SCENE;addSceneDef;$S2$;18| ((|n| $) (|nam| |String|) (|nde| $) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |nam| |nde| (QREFELT $ 43))
                      |SCENE;addSceneDef;$S2$;18|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneUse;S$;19| ((|nam| |String|) ($ $))
        (SPROG ((|nn| (|Record| (|:| |nme| (|String|)) (|:| |node| $))))
               (SEQ
                (LETT |nn| (CONS |nam| (VECTOR 'GROUP NIL (CONS 11 "empty")))
                      |SCENE;createSceneUse;S$;19|)
                (EXIT (VECTOR 'USE NIL (CONS 9 |nn|)))))) 

(SDEFUN |SCENE;addSceneUse;$S$;20| ((|n| $) (|nam| |String|) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |nam| (QREFELT $ 45))
                      |SCENE;addSceneUse;$S$;20|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneArrows;LSDf$;21|
        ((|lines| |List| (|List| PT)) (|mode| |Symbol|) (|size| |DoubleFloat|)
         ($ $))
        (SPROG
         ((|ar|
           (|Record| (|:| |ln| (|List| (|List| PT))) (|:| |mode| (|Symbol|))
                     (|:| |size| (|DoubleFloat|)))))
         (SEQ
          (LETT |ar| (VECTOR |lines| |mode| |size|)
                |SCENE;createSceneArrows;LSDf$;21|)
          (EXIT (VECTOR 'ARROWS NIL (CONS 6 |ar|)))))) 

(SDEFUN |SCENE;addSceneArrows;$LSDf$;22|
        ((|n| $) (|lines| |List| (|List| PT)) (|mode| |Symbol|)
         (|size| |DoubleFloat|) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |lines| |mode| |size| (QREFELT $ 48))
                      |SCENE;addSceneArrows;$LSDf$;22|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneArrow;2SPTSDf$;23|
        ((|st| |String|) (|en| |String|) (|offset| PT) (|mode| |Symbol|)
         (|size| |DoubleFloat|) ($ $))
        (SPROG
         ((|ar|
           (|Record| (|:| |st| (|String|)) (|:| |en| (|String|))
                     (|:| |offset| PT) (|:| |mode| (|Symbol|))
                     (|:| |size| (|DoubleFloat|)))))
         (SEQ
          (LETT |ar| (VECTOR |st| |en| |offset| |mode| |size|)
                |SCENE;createSceneArrow;2SPTSDf$;23|)
          (EXIT (VECTOR 'ARROW NIL (CONS 7 |ar|)))))) 

(SDEFUN |SCENE;addSceneArrow;$2SPTSDf$;24|
        ((|n| $) (|st| |String|) (|en| |String|) (|offset| PT)
         (|mode| |Symbol|) (|size| |DoubleFloat|) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c|
                      (SPADCALL |st| |en| |offset| |mode| |size|
                                (QREFELT $ 50))
                      |SCENE;addSceneArrow;$2SPTSDf$;24|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneArrow;2$PTS2Df$;25|
        ((|st| $) (|en| $) (|offset| PT) (|mode| |Symbol|)
         (|size| |DoubleFloat|) (|fontScale| |DoubleFloat|) ($ $))
        (SPROG
         ((|ar|
           (|Record| (|:| |ln| (|List| (|List| PT))) (|:| |mode| (|Symbol|))
                     (|:| |size| (|DoubleFloat|))))
          (|enPoint| (PT)) (|stPoint| (PT)) (|enBoundary| #1=(|SBoundary| PT))
          (|stBoundary| #1#))
         (SEQ
          (LETT |stBoundary| (SPADCALL |st| |fontScale| (QREFELT $ 26))
                . #2=(|SCENE;createSceneArrow;2$PTS2Df$;25|))
          (LETT |enBoundary| (SPADCALL |en| |fontScale| (QREFELT $ 26)) . #2#)
          (LETT |stPoint|
                (SPADCALL |stBoundary| (SPADCALL |enBoundary| (QREFELT $ 27))
                          (QREFELT $ 28))
                . #2#)
          (LETT |enPoint|
                (SPADCALL |enBoundary| (SPADCALL |stBoundary| (QREFELT $ 27))
                          (QREFELT $ 28))
                . #2#)
          (LETT |ar| (VECTOR (LIST (LIST |stPoint| |enPoint|)) |mode| |size|)
                . #2#)
          (EXIT (VECTOR 'ARROWS NIL (CONS 6 |ar|)))))) 

(SDEFUN |SCENE;addSceneArrow;3$PTS2Df$;26|
        ((|n| $) (|st| $) (|en| $) (|offset| PT) (|mode| |Symbol|)
         (|size| |DoubleFloat|) (|fontScale| |DoubleFloat|) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c|
                      (SPADCALL |st| |en| |offset| |mode| |size| |fontScale|
                                (QREFELT $ 52))
                      |SCENE;addSceneArrow;3$PTS2Df$;26|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneNamedPoints;Snp$;27|
        ((|np| |SceneNamedPoints| PT) ($ $))
        (VECTOR 'NAMEDPOINTS NIL (CONS 10 |np|))) 

(SDEFUN |SCENE;addSceneNamedPoints;$Snp$;28|
        ((|n| $) (|np| |SceneNamedPoints| PT) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |np| (QREFELT $ 55))
                      |SCENE;addSceneNamedPoints;$Snp$;28|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneIFS;LL$;29|
        ((|inx1| |List| (|List| (|NonNegativeInteger|))) (|pts1| |List| PT)
         ($ $))
        (VECTOR 'IFS NIL (CONS 5 (CONS |inx1| |pts1|)))) 

(SDEFUN |SCENE;addSceneIFS;$LL$;30|
        ((|n| $) (|inx1| |List| (|List| (|NonNegativeInteger|)))
         (|pts1| |List| PT) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |inx1| |pts1| (QREFELT $ 58))
                      |SCENE;addSceneIFS;$LL$;30|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneIFS;Sifs$;31| ((|in1| |SceneIFS| PT) ($ $))
        (SPROG
         ((|pts1| (|List| PT))
          (|inx1| (|List| (|List| (|NonNegativeInteger|)))))
         (SEQ
          (LETT |inx1| (SPADCALL |in1| (QREFELT $ 61))
                . #1=(|SCENE;createSceneIFS;Sifs$;31|))
          (LETT |pts1| (SPADCALL |in1| (QREFELT $ 62)) . #1#)
          (EXIT (VECTOR 'IFS NIL (CONS 5 (CONS |inx1| |pts1|))))))) 

(SDEFUN |SCENE;addSceneIFS;$Sifs$;32| ((|n| $) (|in1| |SceneIFS| PT) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |in1| (QREFELT $ 63))
                      |SCENE;addSceneIFS;$Sifs$;32|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneBox;Df$;33| ((|size| |DoubleFloat|) ($ $))
        (SPROG
         ((|inx| (|List| (|List| (|NonNegativeInteger|)))) (|pts| (|List| PT)))
         (SEQ
          (LETT |pts|
                (LIST
                 (SPADCALL |size| (|minus_DF| |size|) |size| (QREFELT $ 65))
                 (SPADCALL |size| |size| |size| (QREFELT $ 65))
                 (SPADCALL (|minus_DF| |size|) |size| |size| (QREFELT $ 65))
                 (SPADCALL (|minus_DF| |size|) (|minus_DF| |size|) |size|
                           (QREFELT $ 65))
                 (SPADCALL (|minus_DF| |size|) (|minus_DF| |size|)
                           (|minus_DF| |size|) (QREFELT $ 65))
                 (SPADCALL (|minus_DF| |size|) |size| (|minus_DF| |size|)
                           (QREFELT $ 65))
                 (SPADCALL |size| |size| (|minus_DF| |size|) (QREFELT $ 65))
                 (SPADCALL |size| (|minus_DF| |size|) (|minus_DF| |size|)
                           (QREFELT $ 65)))
                . #1=(|SCENE;createSceneBox;Df$;33|))
          (LETT |inx|
                (LIST (LIST 0 1 2 3) (LIST 4 5 6 7) (LIST 7 6 1 0)
                      (LIST 3 2 5 4) (LIST 1 6 5 2) (LIST 3 4 7 0))
                . #1#)
          (EXIT (SPADCALL |inx| |pts| (QREFELT $ 58)))))) 

(SDEFUN |SCENE;addSceneBox;$Df$;34| ((|n| $) (|size| |DoubleFloat|) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |size| (QREFELT $ 66))
                      |SCENE;addSceneBox;$Df$;34|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneText;R$;35|
        ((|text| |Record| (|:| |txt| (|String|))
          (|:| |siz| (|NonNegativeInteger|)) (|:| |pos| PT)
          (|:| |np| (|List| (|String|))))
         ($ $))
        (VECTOR 'TEXT NIL (CONS 2 |text|))) 

(SDEFUN |SCENE;addSceneText;$R$;36|
        ((|n| $)
         (|text| |Record| (|:| |txt| (|String|))
          (|:| |siz| (|NonNegativeInteger|)) (|:| |pos| PT)
          (|:| |np| (|List| (|String|))))
         ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |text| (QREFELT $ 69))
                      |SCENE;addSceneText;$R$;36|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneText;SNniPT$;37|
        ((|str| |String|) (|sz| |NonNegativeInteger|) (|pz| PT) ($ $))
        (SPROG
         ((|text|
           (|Record| (|:| |txt| (|String|)) (|:| |siz| (|NonNegativeInteger|))
                     (|:| |pos| PT) (|:| |np| (|List| (|String|))))))
         (SEQ
          (LETT |text| (VECTOR |str| |sz| |pz| NIL)
                |SCENE;createSceneText;SNniPT$;37|)
          (EXIT (VECTOR 'TEXT NIL (CONS 2 |text|)))))) 

(SDEFUN |SCENE;addSceneText;$SNniPT$;38|
        ((|n| $) (|str| |String|) (|sz| |NonNegativeInteger|) (|pz| PT) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |str| |sz| |pz| (QREFELT $ 72))
                      |SCENE;addSceneText;$SNniPT$;38|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneText;LNniPT$;39|
        ((|str| |List| (|String|)) (|sz| |NonNegativeInteger|) (|pz| PT) ($ $))
        (SPROG
         ((|text|
           (|Record| (|:| |txt| (|String|)) (|:| |siz| (|NonNegativeInteger|))
                     (|:| |pos| PT) (|:| |np| (|List| (|String|))))))
         (SEQ
          (LETT |text| (VECTOR (|SPADfirst| |str|) |sz| |pz| |str|)
                |SCENE;createSceneText;LNniPT$;39|)
          (EXIT (VECTOR 'TEXT NIL (CONS 2 |text|)))))) 

(SDEFUN |SCENE;addSceneText;$LNniPT$;40|
        ((|n| $) (|str| |List| (|String|)) (|sz| |NonNegativeInteger|)
         (|pz| PT) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |str| |sz| |pz| (QREFELT $ 75))
                      |SCENE;addSceneText;$LNniPT$;40|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneClip;Sb$;41| ((|bb| |SBoundary| PT) ($ $))
        (VECTOR 'CLIP NIL (CONS 3 |bb|))) 

(SDEFUN |SCENE;addSceneClip;$Sb$;42| ((|n| $) (|bb| |SBoundary| PT) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |bb| (QREFELT $ 77))
                      |SCENE;addSceneClip;$Sb$;42|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneClip;R$;43|
        ((|bb| |Record| (|:| |mins| PT) (|:| |maxs| PT)) ($ $))
        (SPADCALL (SPADCALL (QCAR |bb|) (QCDR |bb|) (QREFELT $ 10))
                  (QREFELT $ 77))) 

(SDEFUN |SCENE;addSceneClip;$R$;44|
        ((|n| $) (|bb| |Record| (|:| |mins| PT) (|:| |maxs| PT)) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |bb| (QREFELT $ 79))
                      |SCENE;addSceneClip;$R$;44|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneGrid;DfSb$;45|
        ((|stepSize| |DoubleFloat|) (|bb| |SBoundary| PT) ($ $))
        (SPROG
         ((|ln| ($)) (#1=#:G1347 NIL) (|i| NIL) (#2=#:G1346 NIL) (|gp| ($))
          (|stepsy| (|NonNegativeInteger|)) (#3=#:G1340 NIL)
          (|stepsx| (|NonNegativeInteger|)) (#4=#:G1339 NIL)
          (|maxy| #5=(|DoubleFloat|)) (|maxx| #6=(|DoubleFloat|)) (|miny| #5#)
          (|minx| #6#))
         (SEQ
          (LETT |minx| (SPADCALL (SPADCALL |bb| (QREFELT $ 38)) (QREFELT $ 81))
                . #7=(|SCENE;createSceneGrid;DfSb$;45|))
          (LETT |miny| (SPADCALL (SPADCALL |bb| (QREFELT $ 38)) (QREFELT $ 82))
                . #7#)
          (LETT |maxx| (SPADCALL (SPADCALL |bb| (QREFELT $ 37)) (QREFELT $ 81))
                . #7#)
          (LETT |maxy| (SPADCALL (SPADCALL |bb| (QREFELT $ 37)) (QREFELT $ 82))
                . #7#)
          (LETT |stepsx|
                (PROG1
                    (LETT #4#
                          (TRUNCATE
                           (|div_DF| (|sub_DF| |maxx| |minx|) |stepSize|))
                          . #7#)
                  (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #4#))
                . #7#)
          (LETT |stepsy|
                (PROG1
                    (LETT #3#
                          (TRUNCATE
                           (|div_DF| (|sub_DF| |maxy| |miny|) |stepSize|))
                          . #7#)
                  (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #3#))
                . #7#)
          (LETT |gp| (SPADCALL (QREFELT $ 18)) . #7#)
          (SEQ (LETT |i| 1 . #7#) (LETT #2# |stepsx| . #7#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |ln|
                       (SPADCALL |gp|
                                 (LIST
                                  (SPADCALL
                                   (|add_DF| |minx|
                                             (|mul_DF|
                                              (FLOAT |i|
                                                     MOST-POSITIVE-DOUBLE-FLOAT)
                                              |stepSize|))
                                   |miny| (QREFELT $ 83))
                                  (SPADCALL
                                   (|add_DF| |minx|
                                             (|mul_DF|
                                              (FLOAT |i|
                                                     MOST-POSITIVE-DOUBLE-FLOAT)
                                              |stepSize|))
                                   |maxy| (QREFELT $ 83)))
                                 (QREFELT $ 24))
                       . #7#)))
               (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |i| 1 . #7#) (LETT #1# |stepsy| . #7#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |ln|
                       (SPADCALL |gp|
                                 (LIST
                                  (SPADCALL |minx|
                                            (|add_DF| |miny|
                                                      (|mul_DF|
                                                       (FLOAT |i|
                                                              MOST-POSITIVE-DOUBLE-FLOAT)
                                                       |stepSize|))
                                            (QREFELT $ 83))
                                  (SPADCALL |maxx|
                                            (|add_DF| |miny|
                                                      (|mul_DF|
                                                       (FLOAT |i|
                                                              MOST-POSITIVE-DOUBLE-FLOAT)
                                                       |stepSize|))
                                            (QREFELT $ 83)))
                                 (QREFELT $ 24))
                       . #7#)))
               (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
          (EXIT |gp|)))) 

(SDEFUN |SCENE;addSceneGrid;$DfSb$;46|
        ((|n| $) (|stepSize| |DoubleFloat|) (|bb| |SBoundary| PT) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |stepSize| |bb| (QREFELT $ 84))
                      |SCENE;addSceneGrid;$DfSb$;46|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneGrid;DfR$;47|
        ((|stepSize| |DoubleFloat|)
         (|bb| |Record| (|:| |mins| PT) (|:| |maxs| PT)) ($ $))
        (SPADCALL |stepSize| (SPADCALL (QCAR |bb|) (QCDR |bb|) (QREFELT $ 10))
                  (QREFELT $ 84))) 

(SDEFUN |SCENE;addSceneGrid;$DfR$;48|
        ((|n| $) (|stepSize| |DoubleFloat|)
         (|bb| |Record| (|:| |mins| PT) (|:| |maxs| PT)) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |stepSize| |bb| (QREFELT $ 86))
                      |SCENE;addSceneGrid;$DfR$;48|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneGrid;Sb$;49| ((|bb| |SBoundary| PT) ($ $))
        (SPROG
         ((|gd3| ($)) (|mt3| ($)) (|gd2| ($)) (|mt2| ($)) (|gd1| ($))
          (|mt1| ($)) (|gp| ($)) (|stepSize| (|DoubleFloat|))
          (|maxx| #1=(|DoubleFloat|)) (|minx| #1#))
         (SEQ
          (LETT |minx| (SPADCALL (SPADCALL |bb| (QREFELT $ 38)) (QREFELT $ 81))
                . #2=(|SCENE;createSceneGrid;Sb$;49|))
          (LETT |maxx| (SPADCALL (SPADCALL |bb| (QREFELT $ 37)) (QREFELT $ 81))
                . #2#)
          (LETT |stepSize| (|div_DF_I| (|sub_DF| |maxx| |minx|) 100) . #2#)
          (LETT |gp| (SPADCALL (QREFELT $ 18)) . #2#)
          (LETT |mt1|
                (SPADCALL |gp|
                          (VECTOR 1.0 "blue" "blue"
                                  (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 90))
                                            (QREFELT $ 91)))
                          (QREFELT $ 93))
                . #2#)
          (LETT |gd1| (SPADCALL |mt1| |stepSize| |bb| (QREFELT $ 85)) . #2#)
          (LETT |mt2|
                (SPADCALL |gp|
                          (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "blue"
                                  "blue"
                                  (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 90))
                                            (QREFELT $ 91)))
                          (QREFELT $ 93))
                . #2#)
          (LETT |gd2|
                (SPADCALL |mt2|
                          (|mul_DF| |stepSize|
                                    (FLOAT 5 MOST-POSITIVE-DOUBLE-FLOAT))
                          |bb| (QREFELT $ 85))
                . #2#)
          (LETT |mt3|
                (SPADCALL |gp|
                          (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "red"
                                  "red"
                                  (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 90))
                                            (QREFELT $ 91)))
                          (QREFELT $ 93))
                . #2#)
          (LETT |gd3|
                (SPADCALL |mt3|
                          (|mul_DF| |stepSize|
                                    (FLOAT 10 MOST-POSITIVE-DOUBLE-FLOAT))
                          |bb| (QREFELT $ 85))
                . #2#)
          (EXIT |gp|)))) 

(SDEFUN |SCENE;addSceneGrid;$Sb$;50| ((|n| $) (|bb| |SBoundary| PT) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |bb| (QREFELT $ 94))
                      |SCENE;addSceneGrid;$Sb$;50|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneGrid;R$;51|
        ((|bb| |Record| (|:| |mins| PT) (|:| |maxs| PT)) ($ $))
        (SPADCALL (SPADCALL (QCAR |bb|) (QCDR |bb|) (QREFELT $ 10))
                  (QREFELT $ 94))) 

(SDEFUN |SCENE;addSceneGrid;$R$;52|
        ((|n| $) (|bb| |Record| (|:| |mins| PT) (|:| |maxs| PT)) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |bb| (QREFELT $ 96))
                      |SCENE;addSceneGrid;$R$;52|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createScenePattern1|
        ((|step| |NonNegativeInteger|) (|bb| |SBoundary| PT) ($ $))
        (SPROG
         ((|ln| ($)) (|pts| (|List| PT)) (#1=#:G1381 NIL) (|j| NIL)
          (#2=#:G1380 NIL) (#3=#:G1379 NIL) (|i| NIL) (|mt2| ($))
          (#4=#:G1378 NIL) (#5=#:G1377 NIL) (#6=#:G1376 NIL) (|mt1| ($))
          (|gp| ($)) (|stepSize| (|DoubleFloat|)) (|maxy| #7=(|DoubleFloat|))
          (|maxx| #8=(|DoubleFloat|)) (|miny| #7#) (|minx| #8#))
         (SEQ
          (LETT |minx| (SPADCALL (SPADCALL |bb| (QREFELT $ 38)) (QREFELT $ 81))
                . #9=(|SCENE;createScenePattern1|))
          (LETT |miny| (SPADCALL (SPADCALL |bb| (QREFELT $ 38)) (QREFELT $ 82))
                . #9#)
          (LETT |maxx| (SPADCALL (SPADCALL |bb| (QREFELT $ 37)) (QREFELT $ 81))
                . #9#)
          (LETT |maxy| (SPADCALL (SPADCALL |bb| (QREFELT $ 37)) (QREFELT $ 82))
                . #9#)
          (LETT |stepSize| (|div_DF_I| (|sub_DF| |maxx| |minx|) 1200) . #9#)
          (LETT |gp| (SPADCALL (QREFELT $ 18)) . #9#)
          (LETT |mt1|
                (SPADCALL |gp|
                          (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "blue"
                                  "blue"
                                  (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 90))
                                            (QREFELT $ 91)))
                          (QREFELT $ 93))
                . #9#)
          (SEQ (LETT |i| 1 . #9#) (LETT #6# |step| . #9#) G190
               (COND
                ((IF (MINUSP #6#)
                     (< |i| 1200)
                     (> |i| 1200))
                 (GO G191)))
               (SEQ
                (LETT |pts|
                      (PROGN
                       (LETT #5# NIL . #9#)
                       (SEQ (LETT |j| 1 . #9#) (LETT #4# |step| . #9#) G190
                            (COND
                             ((IF (|negative?_SI| #4#)
                                  (|less_SI| |j| 1200)
                                  (|greater_SI| |j| 1200))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #5#
                                    (CONS
                                     (SPADCALL
                                      (|add_DF| |minx|
                                                (|mul_DF|
                                                 (FLOAT |i|
                                                        MOST-POSITIVE-DOUBLE-FLOAT)
                                                 |stepSize|))
                                      (|add_DF| |miny|
                                                (|mul_DF|
                                                 (FLOAT |j|
                                                        MOST-POSITIVE-DOUBLE-FLOAT)
                                                 |stepSize|))
                                      (QREFELT $ 83))
                                     #5#)
                                    . #9#)))
                            (LETT |j| (|add_SI| |j| #4#) . #9#) (GO G190) G191
                            (EXIT (NREVERSE #5#))))
                      . #9#)
                (EXIT (LETT |ln| (SPADCALL |mt1| |pts| (QREFELT $ 24)) . #9#)))
               (LETT |i| (+ |i| #6#) . #9#) (GO G190) G191 (EXIT NIL))
          (LETT |mt2|
                (SPADCALL |gp|
                          (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "red"
                                  "red"
                                  (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 90))
                                            (QREFELT $ 91)))
                          (QREFELT $ 93))
                . #9#)
          (SEQ (LETT |i| 1 . #9#) (LETT #3# |step| . #9#) G190
               (COND
                ((IF (|negative?_SI| #3#)
                     (|less_SI| |i| 1000)
                     (|greater_SI| |i| 1000))
                 (GO G191)))
               (SEQ
                (LETT |pts|
                      (PROGN
                       (LETT #2# NIL . #9#)
                       (SEQ (LETT |j| 1 . #9#) (LETT #1# |step| . #9#) G190
                            (COND
                             ((IF (|negative?_SI| #1#)
                                  (|less_SI| |j| 1200)
                                  (|greater_SI| |j| 1200))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS
                                     (SPADCALL
                                      (|add_DF| |minx|
                                                (|mul_DF|
                                                 (FLOAT |j|
                                                        MOST-POSITIVE-DOUBLE-FLOAT)
                                                 |stepSize|))
                                      (|add_DF| |miny|
                                                (|mul_DF|
                                                 (FLOAT |i|
                                                        MOST-POSITIVE-DOUBLE-FLOAT)
                                                 |stepSize|))
                                      (QREFELT $ 83))
                                     #2#)
                                    . #9#)))
                            (LETT |j| (|add_SI| |j| #1#) . #9#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      . #9#)
                (EXIT (LETT |ln| (SPADCALL |mt2| |pts| (QREFELT $ 24)) . #9#)))
               (LETT |i| (|add_SI| |i| #3#) . #9#) (GO G190) G191 (EXIT NIL))
          (EXIT |gp|)))) 

(SDEFUN |SCENE;createScenePattern2|
        ((|level| |NonNegativeInteger|) (|bb| |SBoundary| PT) ($ $))
        (SPROG
         ((|ifs2| (|SceneIFS| PT)) (|ifs| (|SceneIFS| PT))
          (|face1| (|List| PT)) (|midx| (|DoubleFloat|))
          (|maxy| #1=(|DoubleFloat|)) (|maxx| #2=(|DoubleFloat|)) (|miny| #1#)
          (|minx| #2#))
         (SEQ
          (LETT |minx| (SPADCALL (SPADCALL |bb| (QREFELT $ 38)) (QREFELT $ 81))
                . #3=(|SCENE;createScenePattern2|))
          (LETT |miny| (SPADCALL (SPADCALL |bb| (QREFELT $ 38)) (QREFELT $ 82))
                . #3#)
          (LETT |maxx| (SPADCALL (SPADCALL |bb| (QREFELT $ 37)) (QREFELT $ 81))
                . #3#)
          (LETT |maxy| (SPADCALL (SPADCALL |bb| (QREFELT $ 37)) (QREFELT $ 82))
                . #3#)
          (LETT |midx|
                (|mul_DF| (|add_DF| |minx| |maxx|)
                          (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 90))
                                    (QREFELT $ 91)))
                . #3#)
          (LETT |face1|
                (LIST (SPADCALL |midx| |miny| (QREFELT $ 83))
                      (SPADCALL |minx| |maxy| (QREFELT $ 83))
                      (SPADCALL |maxx| |maxy| (QREFELT $ 83)))
                . #3#)
          (LETT |ifs| (SPADCALL |face1| (QREFELT $ 98)) . #3#)
          (LETT |ifs2| (SPADCALL |ifs| |level| (QREFELT $ 99)) . #3#)
          (EXIT
           (SPADCALL (SPADCALL |ifs2| (QREFELT $ 61))
                     (SPADCALL |ifs2| (QREFELT $ 62)) (QREFELT $ 58)))))) 

(SDEFUN |SCENE;subdivideLine|
        ((|level| |NonNegativeInteger|) (|inLine| |List| PT) ($ |List| PT))
        (SPROG
         ((#1=#:G1399 NIL) (|res| (|List| PT)) (|lastPt| (PT)) (|midpt| (PT))
          (#2=#:G1402 NIL) (|x| NIL))
         (SEQ
          (COND ((EQL |level| 0) |inLine|)
                ('T
                 (SEQ (LETT |res| NIL . #3=(|SCENE;subdivideLine|))
                      (SEQ (LETT |x| 1 . #3#)
                           (LETT #2# (LENGTH |inLine|) . #3#) G190
                           (COND ((|greater_SI| |x| #2#) (GO G191)))
                           (SEQ
                            (COND
                             ((SPADCALL |x| 1 (QREFELT $ 101))
                              (SEQ
                               (LETT |midpt|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL 5 -1 10 (QREFELT $ 90))
                                       (QREFELT $ 91))
                                      (SPADCALL |lastPt|
                                                (SPADCALL |inLine| |x|
                                                          (QREFELT $ 102))
                                                (QREFELT $ 103))
                                      (QREFELT $ 104))
                                     . #3#)
                               (EXIT
                                (LETT |res|
                                      (SPADCALL |res| |midpt| (QREFELT $ 105))
                                      . #3#)))))
                            (LETT |lastPt|
                                  (SPADCALL |inLine| |x| (QREFELT $ 102))
                                  . #3#)
                            (EXIT
                             (LETT |res|
                                   (SPADCALL |res|
                                             (SPADCALL |inLine| |x|
                                                       (QREFELT $ 102))
                                             (QREFELT $ 105))
                                   . #3#)))
                           (LETT |x| (|inc_SI| |x|) . #3#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (|SCENE;subdivideLine|
                        (PROG1 (LETT #1# (- |level| 1) . #3#)
                          (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #1#))
                        |res| $)))))))) 

(SDEFUN |SCENE;createScenePattern3|
        ((|level| . #1=(|NonNegativeInteger|)) (|bb| |SBoundary| PT) ($ $))
        (SPROG
         ((|ln| ($)) (|lev2| #1#) (|pts2| (|List| (|List| PT)))
          (#2=#:G1416 NIL) (|l2| NIL) (|pts| (|List| (|List| PT)))
          (#3=#:G1415 NIL) (|j| NIL) (#4=#:G1414 NIL) (#5=#:G1413 NIL)
          (|i| NIL) (#6=#:G1412 NIL)
          (|ycoords| (|List| (|List| #7=(|NonNegativeInteger|))))
          (|xcoords| (|List| (|List| #7#))) (|scale| (|DoubleFloat|))
          (|maxy| #8=(|DoubleFloat|)) (|maxx| #9=(|DoubleFloat|)) (|miny| #8#)
          (|minx| #9#))
         (SEQ
          (LETT |minx| (SPADCALL (SPADCALL |bb| (QREFELT $ 38)) (QREFELT $ 81))
                . #10=(|SCENE;createScenePattern3|))
          (LETT |miny| (SPADCALL (SPADCALL |bb| (QREFELT $ 38)) (QREFELT $ 82))
                . #10#)
          (LETT |maxx| (SPADCALL (SPADCALL |bb| (QREFELT $ 37)) (QREFELT $ 81))
                . #10#)
          (LETT |maxy| (SPADCALL (SPADCALL |bb| (QREFELT $ 37)) (QREFELT $ 82))
                . #10#)
          (LETT |scale| (|div_DF_I| (|sub_DF| |maxx| |minx|) 1000) . #10#)
          (LETT |xcoords|
                (LIST (LIST 0 0 500 1000 1000 0) (LIST 150 350 350 150 150)
                      (LIST 100 400 400 100 100) (LIST 600 900 900 600 600)
                      (LIST 600 900 900 600 600))
                . #10#)
          (LETT |ycoords|
                (LIST (LIST 0 800 1000 800 0 0) (LIST 0 0 300 300 0)
                      (LIST 500 500 700 700 500) (LIST 500 500 700 700 500)
                      (LIST 100 100 300 300 100))
                . #10#)
          (LETT |pts|
                (PROGN
                 (LETT #6# NIL . #10#)
                 (SEQ (LETT |i| 1 . #10#) (LETT #5# (LENGTH |xcoords|) . #10#)
                      G190 (COND ((|greater_SI| |i| #5#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6#
                              (CONS
                               (PROGN
                                (LETT #4# NIL . #10#)
                                (SEQ (LETT |j| 1 . #10#)
                                     (LETT #3#
                                           (SPADCALL
                                            (SPADCALL |xcoords| |i|
                                                      (QREFELT $ 107))
                                            (QREFELT $ 108))
                                           . #10#)
                                     G190
                                     (COND ((|greater_SI| |j| #3#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #4#
                                             (CONS
                                              (SPADCALL
                                               (|add_DF| |minx|
                                                         (|mul_DF|
                                                          (FLOAT
                                                           (SPADCALL
                                                            (SPADCALL |xcoords|
                                                                      |i|
                                                                      (QREFELT
                                                                       $ 107))
                                                            |j|
                                                            (QREFELT $ 109))
                                                           MOST-POSITIVE-DOUBLE-FLOAT)
                                                          |scale|))
                                               (|add_DF| |miny|
                                                         (|mul_DF|
                                                          (FLOAT
                                                           (SPADCALL
                                                            (SPADCALL |ycoords|
                                                                      |i|
                                                                      (QREFELT
                                                                       $ 107))
                                                            |j|
                                                            (QREFELT $ 109))
                                                           MOST-POSITIVE-DOUBLE-FLOAT)
                                                          |scale|))
                                               (QREFELT $ 83))
                                              #4#)
                                             . #10#)))
                                     (LETT |j| (|inc_SI| |j|) . #10#) (GO G190)
                                     G191 (EXIT (NREVERSE #4#))))
                               #6#)
                              . #10#)))
                      (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #10#)
          (LETT |pts2| NIL . #10#) (LETT |lev2| |level| . #10#)
          (SEQ (LETT |l2| NIL . #10#) (LETT #2# |pts| . #10#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |l2| (CAR #2#) . #10#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |pts2|
                      (SPADCALL |pts2| (|SCENE;subdivideLine| |lev2| |l2| $)
                                (QREFELT $ 110))
                      . #10#)
                (EXIT (COND ((EQL |lev2| |level|) (LETT |lev2| 2 . #10#)))))
               (LETT #2# (CDR #2#) . #10#) (GO G190) G191 (EXIT NIL))
          (EXIT (LETT |ln| (SPADCALL |pts2| (QREFELT $ 32)) . #10#))))) 

(SDEFUN |SCENE;createScenePattern;SNniSb$;57|
        ((|ptype| |Symbol|) (|step| |NonNegativeInteger|) (|bb| |SBoundary| PT)
         ($ $))
        (SPROG ((#1=#:G1425 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((EQUAL |ptype| 'GRID)
                    (PROGN
                     (LETT #1# (|SCENE;createScenePattern1| |step| |bb| $)
                           . #2=(|SCENE;createScenePattern;SNniSb$;57|))
                     (GO #3=#:G1424))))
                  (COND
                   ((EQUAL |ptype| 'SIERPINSKI)
                    (PROGN
                     (LETT #1# (|SCENE;createScenePattern2| |step| |bb| $)
                           . #2#)
                     (GO #3#))))
                  (EXIT (|SCENE;createScenePattern3| |step| |bb| $))))
                #3# (EXIT #1#)))) 

(SDEFUN |SCENE;addScenePattern;$SNniSb$;58|
        ((|n| $) (|ptype| |Symbol|) (|step| |NonNegativeInteger|)
         (|bb| |SBoundary| PT) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |ptype| |step| |bb| (QREFELT $ 111))
                      |SCENE;addScenePattern;$SNniSb$;58|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createScenePattern;SNniR$;59|
        ((|ptype| |Symbol|) (|step| |NonNegativeInteger|)
         (|bb| |Record| (|:| |mins| PT) (|:| |maxs| PT)) ($ $))
        (SPADCALL |ptype| |step|
                  (SPADCALL (QCAR |bb|) (QCDR |bb|) (QREFELT $ 10))
                  (QREFELT $ 111))) 

(SDEFUN |SCENE;addScenePattern;$SNniR$;60|
        ((|n| $) (|ptype| |Symbol|) (|step| |NonNegativeInteger|)
         (|bb| |Record| (|:| |mins| PT) (|:| |maxs| PT)) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |ptype| |step| |bb| (QREFELT $ 113))
                      |SCENE;addScenePattern;$SNniR$;60|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneRuler;SPTSb$;61|
        ((|ptype| |Symbol|) (|offset| PT) (|bb| |SBoundary| PT) ($ $))
        (SPROG
         ((|str| (|String|))
          (|d|
           (|Record| (|:| |quotient| (|Integer|))
                     (|:| |remainder| (|Integer|))))
          (|pz| (PT)) (#1=#:G1455 NIL) (#2=#:G1456 NIL) (|x| NIL)
          (|stepI| (|Integer|)) (|gp| ($)) (|suffix| (|String|))
          (|zeroes| #3=(|Integer|)) (|maxPrimaryNorm| #4=(|DoubleFloat|))
          (|minPrimaryNorm| #4#) (|divn| (|DoubleFloat|)) (|expStep| #3#)
          (|stepSize| (|DoubleFloat|)) (|maxSecondary| #5=(|DoubleFloat|))
          (|maxPrimary| #6=(|DoubleFloat|)) (|minSecondary| #5#)
          (|minPrimary| #6#))
         (SEQ
          (LETT |minPrimary|
                (SPADCALL (SPADCALL |bb| (QREFELT $ 38)) (QREFELT $ 81))
                . #7=(|SCENE;createSceneRuler;SPTSb$;61|))
          (LETT |minSecondary|
                (SPADCALL (SPADCALL |bb| (QREFELT $ 38)) (QREFELT $ 82)) . #7#)
          (LETT |maxPrimary|
                (SPADCALL (SPADCALL |bb| (QREFELT $ 37)) (QREFELT $ 81)) . #7#)
          (LETT |maxSecondary|
                (SPADCALL (SPADCALL |bb| (QREFELT $ 37)) (QREFELT $ 82)) . #7#)
          (COND
           ((EQUAL |ptype| 'VERTICAL)
            (SEQ
             (LETT |minPrimary|
                   (SPADCALL (SPADCALL |bb| (QREFELT $ 38)) (QREFELT $ 82))
                   . #7#)
             (LETT |minSecondary|
                   (SPADCALL (SPADCALL |bb| (QREFELT $ 38)) (QREFELT $ 81))
                   . #7#)
             (LETT |maxPrimary|
                   (SPADCALL (SPADCALL |bb| (QREFELT $ 37)) (QREFELT $ 82))
                   . #7#)
             (EXIT
              (LETT |maxSecondary|
                    (SPADCALL (SPADCALL |bb| (QREFELT $ 37)) (QREFELT $ 81))
                    . #7#)))))
          (LETT |stepSize| (|sub_DF| |maxPrimary| |minPrimary|) . #7#)
          (LETT |expStep|
                (-
                 (TRUNCATE
                  (SPADCALL (|add_DF| |stepSize| 1.0) (QREFELT $ 115)))
                 1)
                . #7#)
          (LETT |divn|
                (|expt_DF_I| (FLOAT 10 MOST-POSITIVE-DOUBLE-FLOAT) |expStep|)
                . #7#)
          (LETT |minPrimaryNorm| (|div_DF| |minPrimary| |divn|) . #7#)
          (LETT |maxPrimaryNorm| (|div_DF| |maxPrimary| |divn|) . #7#)
          (LETT |suffix| "" . #7#) (LETT |zeroes| |expStep| . #7#)
          (COND
           ((SPADCALL |zeroes| 2 (QREFELT $ 116))
            (SEQ (LETT |zeroes| (- |zeroes| 3) . #7#) (LETT |suffix| "K" . #7#)
                 (EXIT
                  (COND
                   ((SPADCALL |zeroes| 2 (QREFELT $ 116))
                    (SEQ (LETT |zeroes| (- |zeroes| 3) . #7#)
                         (LETT |suffix| "M" . #7#)
                         (EXIT
                          (COND
                           ((SPADCALL |zeroes| 2 (QREFELT $ 116))
                            (SEQ (LETT |zeroes| (- |zeroes| 3) . #7#)
                                 (LETT |suffix| "G" . #7#)
                                 (EXIT
                                  (COND
                                   ((SPADCALL |zeroes| 2 (QREFELT $ 116))
                                    (SEQ (LETT |zeroes| (- |zeroes| 3) . #7#)
                                         (EXIT
                                          (LETT |suffix| "T"
                                                . #7#)))))))))))))))))
          (COND
           ((< |zeroes| 0)
            (SEQ (LETT |zeroes| (+ |zeroes| 3) . #7#) (LETT |suffix| "m" . #7#)
                 (EXIT
                  (COND
                   ((< |zeroes| 0)
                    (SEQ (LETT |zeroes| (+ |zeroes| 3) . #7#)
                         (LETT |suffix| "u" . #7#)
                         (EXIT
                          (COND
                           ((< |zeroes| 0)
                            (SEQ (LETT |zeroes| (+ |zeroes| 3) . #7#)
                                 (LETT |suffix| "n" . #7#)
                                 (EXIT
                                  (COND
                                   ((< |zeroes| 0)
                                    (SEQ (LETT |zeroes| (+ |zeroes| 3) . #7#)
                                         (EXIT
                                          (LETT |suffix| "p"
                                                . #7#)))))))))))))))))
          (COND
           ((SPADCALL |zeroes| 0 (QREFELT $ 116))
            (LETT |suffix| (STRCONC "0" |suffix|) . #7#)))
          (COND
           ((SPADCALL |zeroes| 1 (QREFELT $ 116))
            (LETT |suffix| (STRCONC "0" |suffix|) . #7#)))
          (LETT |gp| (SPADCALL (QREFELT $ 18)) . #7#)
          (LETT |stepI| (COND ((EQUAL |ptype| 'HORIZONTAL) 2) ('T 1)) . #7#)
          (SEQ (LETT |x| (TRUNCATE |minPrimaryNorm|) . #7#)
               (LETT #2# (TRUNCATE |maxPrimaryNorm|) . #7#)
               (LETT #1# |stepI| . #7#) G190
               (COND
                ((IF (MINUSP #1#)
                     (< |x| #2#)
                     (> |x| #2#))
                 (GO G191)))
               (SEQ (LETT |str| (|mathObject2String| |x|) . #7#)
                    (LETT |pz|
                          (SPADCALL
                           (SPADCALL
                            (|mul_DF| (FLOAT |x| MOST-POSITIVE-DOUBLE-FLOAT)
                                      |divn|)
                            0.0 (QREFELT $ 83))
                           |offset| (QREFELT $ 103))
                          . #7#)
                    (COND
                     ((EQUAL |ptype| 'VERTICAL)
                      (LETT |pz|
                            (SPADCALL
                             (SPADCALL 0.0
                                       (|mul_DF|
                                        (FLOAT |x| MOST-POSITIVE-DOUBLE-FLOAT)
                                        |divn|)
                                       (QREFELT $ 83))
                             |offset| (QREFELT $ 103))
                            . #7#)))
                    (COND
                     ((EQL |expStep| -1)
                      (SEQ
                       (COND
                        ((SPADCALL |x| 0 (QREFELT $ 116))
                         (COND
                          ((< |x| 10)
                           (LETT |str| (STRCONC "0." |str|) . #7#)))))
                       (COND ((EQL |x| 10) (LETT |str| "1" . #7#)))
                       (COND
                        ((SPADCALL |x| 10 (QREFELT $ 116))
                         (SEQ (LETT |d| (DIVIDE2 |x| 10) . #7#)
                              (EXIT
                               (LETT |str|
                                     (SPADCALL
                                      (LIST (STRINGIMAGE (QCAR |d|)) "."
                                            (STRINGIMAGE (QCDR |d|)))
                                      (QREFELT $ 118))
                                     . #7#)))))
                       (COND
                        ((< |x| 0)
                         (COND
                          ((SPADCALL |x| -10 (QREFELT $ 116))
                           (LETT |str|
                                 (SPADCALL
                                  (LIST "-0." (|mathObject2String| (- |x|)))
                                  (QREFELT $ 118))
                                 . #7#)))))
                       (COND ((EQL |x| -10) (LETT |str| "-1" . #7#)))
                       (EXIT
                        (COND
                         ((< |x| -10)
                          (SEQ (LETT |d| (DIVIDE2 (- |x|) 10) . #7#)
                               (EXIT
                                (LETT |str|
                                      (SPADCALL
                                       (LIST "-" (STRINGIMAGE (QCAR |d|)) "."
                                             (STRINGIMAGE (QCDR |d|)))
                                       (QREFELT $ 118))
                                      . #7#))))))))
                     ((SPADCALL |x| 0 (QREFELT $ 119))
                      (LETT |str| (STRCONC |str| |suffix|) . #7#)))
                    (EXIT (SPADCALL |gp| |str| 20 |pz| (QREFELT $ 73))))
               (LETT |x| (+ |x| #1#) . #7#) (GO G190) G191 (EXIT NIL))
          (EXIT |gp|)))) 

(SDEFUN |SCENE;addSceneRuler;$SPTSb$;62|
        ((|n| $) (|ptype| |Symbol|) (|offset| PT) (|bb| |SBoundary| PT) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |ptype| |offset| |bb| (QREFELT $ 120))
                      |SCENE;addSceneRuler;$SPTSb$;62|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneRuler;SPTR$;63|
        ((|ptype| |Symbol|) (|offset| PT)
         (|bb| |Record| (|:| |mins| PT) (|:| |maxs| PT)) ($ $))
        (SPADCALL |ptype| |offset|
                  (SPADCALL (QCAR |bb|) (QCDR |bb|) (QREFELT $ 10))
                  (QREFELT $ 120))) 

(SDEFUN |SCENE;addSceneRuler;$SPTR$;64|
        ((|n| $) (|ptype| |Symbol|) (|offset| PT)
         (|bb| |Record| (|:| |mins| PT) (|:| |maxs| PT)) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |ptype| |offset| |bb| (QREFELT $ 122))
                      |SCENE;addSceneRuler;$SPTR$;64|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneGraph;Dg2NniB$;65|
        ((|g| |DirectedGraph| (|String|)) (|x| |NonNegativeInteger|)
         (|y| |NonNegativeInteger|) (|dispArrowName| |Boolean|) ($ $))
        (SPROG ((|tr| (|Scene| (|SCartesian| 2))))
               (SEQ
                (LETT |tr|
                      (SPADCALL
                       (SPADCALL (FLOAT |x| MOST-POSITIVE-DOUBLE-FLOAT)
                                 (FLOAT |y| MOST-POSITIVE-DOUBLE-FLOAT) 0.0
                                 (SPADCALL (SPADCALL 25 -2 10 (QREFELT $ 90))
                                           (QREFELT $ 91))
                                 (SPADCALL (SPADCALL 25 -2 10 (QREFELT $ 90))
                                           (QREFELT $ 91))
                                 (SPADCALL (SPADCALL 25 -2 10 (QREFELT $ 90))
                                           (QREFELT $ 91))
                                 (QREFELT $ 125))
                       (QREFELT $ 127))
                      |SCENE;createSceneGraph;Dg2NniB$;65|)
                (SPADCALL |tr| |g| |dispArrowName| NIL (QREFELT $ 129))
                (EXIT |tr|)))) 

(SDEFUN |SCENE;addSceneGraph;$Dg2NniB$;66|
        ((|n| $) (|g| |DirectedGraph| (|String|)) (|x| |NonNegativeInteger|)
         (|y| |NonNegativeInteger|) (|dispArrowName| |Boolean|) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c|
                      (SPADCALL |g| |x| |y| |dispArrowName| (QREFELT $ 130))
                      |SCENE;addSceneGraph;$Dg2NniB$;66|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneMaterial;R$;67|
        ((|mat| |Record| (|:| |lineWidth| (|DoubleFloat|))
          (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
          (|:| |matOpacity| (|DoubleFloat|)))
         ($ $))
        (VECTOR 'MATERIAL NIL (CONS 1 |mat|))) 

(SDEFUN |SCENE;addSceneMaterial;$R$;68|
        ((|n| $)
         (|mat| |Record| (|:| |lineWidth| (|DoubleFloat|))
          (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
          (|:| |matOpacity| (|DoubleFloat|)))
         ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |mat| (QREFELT $ 132))
                      |SCENE;addSceneMaterial;$R$;68|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneMaterial;Df2S$;69|
        ((|lineW| |DoubleFloat|) (|lineC| |String|) (|fillC| |String|) ($ $))
        (SPROG
         ((|mat|
           (|Record| (|:| |lineWidth| (|DoubleFloat|))
                     (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
                     (|:| |matOpacity| (|DoubleFloat|)))))
         (SEQ
          (LETT |mat| (VECTOR |lineW| |lineC| |fillC| 1.0)
                |SCENE;createSceneMaterial;Df2S$;69|)
          (EXIT (VECTOR 'MATERIAL NIL (CONS 1 |mat|)))))) 

(SDEFUN |SCENE;addSceneMaterial;$Df2S$;70|
        ((|n| $) (|lineW| |DoubleFloat|) (|lineC| |String|) (|fillC| |String|)
         ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |lineW| |lineC| |fillC| (QREFELT $ 133))
                      |SCENE;addSceneMaterial;$Df2S$;70|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneTransform;St$;71| ((|tran| |STransform| PT) ($ $))
        (VECTOR 'TRANSFORM NIL (CONS 4 |tran|))) 

(SDEFUN |SCENE;addSceneTransform;$St$;72|
        ((|n| $) (|tran| |STransform| PT) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |tran| (QREFELT $ 136))
                      |SCENE;addSceneTransform;$St$;72|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createArrows2Din2D;M2SNni$;73|
        ((|ptFun| |Mapping| PT PT) (|uSeg| |Segment| (|DoubleFloat|))
         (|vSeg| |Segment| (|DoubleFloat|)) (|numPts| |NonNegativeInteger|)
         ($ $))
        (SPROG
         ((|someV| #1=(|DoubleFloat|)) (|arrows| (|List| (|List| PT)))
          (|someU| #1#) (|lp| (|List| PT)) (|outpt| (PT)) (|inPt| (PT))
          (|iu| NIL) (|iv| NIL) (|vstep| #2=(|DoubleFloat|)) (|ustep| #2#))
         (SEQ (LETT |arrows| NIL . #3=(|SCENE;createArrows2Din2D;M2SNni$;73|))
              (LETT |ustep|
                    (|div_DF_I|
                     (|sub_DF| (SPADCALL |uSeg| (QREFELT $ 139))
                               (SPADCALL |uSeg| (QREFELT $ 140)))
                     |numPts|)
                    . #3#)
              (LETT |vstep|
                    (|div_DF_I|
                     (|sub_DF| (SPADCALL |vSeg| (QREFELT $ 139))
                               (SPADCALL |vSeg| (QREFELT $ 140)))
                     |numPts|)
                    . #3#)
              (LETT |someV| (SPADCALL |vSeg| (QREFELT $ 140)) . #3#)
              (SEQ (LETT |iv| |numPts| . #3#) G190
                   (COND ((< |iv| 0) (GO G191)))
                   (SEQ
                    (COND
                     ((ZEROP |iv|)
                      (LETT |someV| (SPADCALL |vSeg| (QREFELT $ 139)) . #3#)))
                    (LETT |lp| NIL . #3#)
                    (LETT |someU| (SPADCALL |uSeg| (QREFELT $ 140)) . #3#)
                    (SEQ (LETT |iu| |numPts| . #3#) G190
                         (COND ((< |iu| 0) (GO G191)))
                         (SEQ
                          (COND
                           ((ZEROP |iu|)
                            (LETT |someU| (SPADCALL |uSeg| (QREFELT $ 139))
                                  . #3#)))
                          (LETT |inPt|
                                (SPADCALL |someU| |someV| (QREFELT $ 83))
                                . #3#)
                          (LETT |outpt| (SPADCALL |inPt| |ptFun|) . #3#)
                          (LETT |lp| (LIST |inPt| |outpt|) . #3#)
                          (LETT |someU| (|add_DF| |someU| |ustep|) . #3#)
                          (EXIT (LETT |arrows| (CONS |lp| |arrows|) . #3#)))
                         (LETT |iu| (+ |iu| -1) . #3#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT (LETT |someV| (|add_DF| |someV| |vstep|) . #3#)))
                   (LETT |iv| (+ |iv| -1) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL |arrows| '|variable|
                         (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 90))
                                   (QREFELT $ 91))
                         (QREFELT $ 48)))))) 

(SDEFUN |SCENE;addArrows2Din2D;$M2SNni$;74|
        ((|n| $) (|ptFun| |Mapping| PT PT) (|uSeg| |Segment| (|DoubleFloat|))
         (|vSeg| |Segment| (|DoubleFloat|)) (|numPts| |NonNegativeInteger|)
         ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c|
                      (SPADCALL |ptFun| |uSeg| |vSeg| |numPts| (QREFELT $ 142))
                      |SCENE;addArrows2Din2D;$M2SNni$;74|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;addChild!;2$V;75| ((|n| $) (|c| $) ($ |Void|))
        (QSETVELT |n| 1 (SPADCALL (QVELT |n| 1) |c| (QREFELT $ 145)))) 

(PUT '|SCENE;removeChild!;2$V;76| '|SPADreplace|
     '(XLAM (|n| |c|) (|error| "removeChild! not yet implemented"))) 

(SDEFUN |SCENE;removeChild!;2$V;76| ((|n| $) (|c| $) ($ |Void|))
        (|error| "removeChild! not yet implemented")) 

(SDEFUN |SCENE;setTransform!;$StV;77|
        ((|n| $) (|tran| |STransform| PT) ($ |Void|))
        (COND
         ((SPADCALL (QVELT |n| 0) 'TRANSFORM (QREFELT $ 147))
          (|error| "use setTransform! on transform only"))
         ('T (QSETVELT |n| 2 (CONS 4 |tran|))))) 

(SDEFUN |SCENE;pathString|
        ((|pts| |List| (|List| PT)) (|tran| |STransform| PT)
         (|bb| |SBoundary| PT) (|sc| |DoubleFloat|) (|clipEn| |Boolean|)
         (|useInteger| |Boolean|) ($ |String|))
        (SPROG
         ((|lastValid| #1=(|Boolean|)) (|ptStr| (|String|))
          (|thisStr| (|String|)) (|minusy| (|DoubleFloat|))
          (|pntNum| (|NonNegativeInteger|)) (|valid| #1#) (|param2| (PT))
          (#2=#:G1584 NIL) (|param| NIL) (#3=#:G1583 NIL) (|line| NIL))
         (SEQ (LETT |ptStr| "" . #4=(|SCENE;pathString|))
              (LETT |lastValid| 'T . #4#)
              (SEQ (LETT |line| NIL . #4#) (LETT #3# |pts| . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |line| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (LETT |pntNum| 0 . #4#)
                        (EXIT
                         (SEQ (LETT |param| NIL . #4#) (LETT #2# |line| . #4#)
                              G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |param| (CAR #2#) . #4#) NIL))
                                (GO G191)))
                              (SEQ
                               (LETT |param2|
                                     (SPADCALL |tran| |param| (QREFELT $ 149))
                                     . #4#)
                               (LETT |valid|
                                     (COND
                                      (|clipEn|
                                       (SPADCALL |bb| |param| (QREFELT $ 150)))
                                      ('T 'T))
                                     . #4#)
                               (COND
                                (|valid|
                                 (SEQ (LETT |pntNum| (+ |pntNum| 1) . #4#)
                                      (COND
                                       ((SPADCALL |ptStr| "" (QREFELT $ 151))
                                        (LETT |ptStr| (STRCONC |ptStr| " ")
                                              . #4#)))
                                      (COND
                                       (|lastValid|
                                        (SEQ
                                         (COND
                                          ((EQL |pntNum| 1)
                                           (LETT |ptStr| (STRCONC |ptStr| "M")
                                                 . #4#)))
                                         (EXIT
                                          (COND
                                           ((EQL |pntNum| 2)
                                            (LETT |ptStr| (STRCONC |ptStr| "L")
                                                  . #4#)))))))
                                      (COND
                                       ((NULL |lastValid|)
                                        (LETT |ptStr| (STRCONC |ptStr| "M")
                                              . #4#)))
                                      (LETT |minusy|
                                            (|minus_DF|
                                             (|mul_DF|
                                              (SPADCALL |param2|
                                                        (QREFELT $ 82))
                                              |sc|))
                                            . #4#)
                                      (COND
                                       (|useInteger|
                                        (LETT |thisStr|
                                              (SPADCALL
                                               (LIST
                                                (STRINGIMAGE
                                                 (TRUNCATE
                                                  (|mul_DF|
                                                   (SPADCALL |param2|
                                                             (QREFELT $ 81))
                                                   |sc|)))
                                                ","
                                                (STRINGIMAGE
                                                 (TRUNCATE |minusy|)))
                                               (QREFELT $ 118))
                                              . #4#))
                                       ('T
                                        (LETT |thisStr|
                                              (SPADCALL
                                               (LIST
                                                (|mathObject2String|
                                                 (|mul_DF|
                                                  (SPADCALL |param2|
                                                            (QREFELT $ 81))
                                                  |sc|))
                                                ","
                                                (|mathObject2String| |minusy|))
                                               (QREFELT $ 118))
                                              . #4#)))
                                      (EXIT
                                       (LETT |ptStr|
                                             (STRCONC |ptStr| |thisStr|)
                                             . #4#)))))
                               (EXIT (LETT |lastValid| |valid| . #4#)))
                              (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT |ptStr|)))) 

(SDEFUN |SCENE;shorternArrow|
        ((|pts| |Record| (|:| |st| PT) (|:| |en| PT)) (|bb| |SBoundary| PT)
         ($ |Record| (|:| |st| PT) (|:| |en| PT)))
        (SPROG
         ((|newend| (PT)) (|newstart| (PT)) (|relpt| (PT)) (#1=#:G1590 NIL)
          (|reductionFactor| (|DoubleFloat|)) (|arrLength| (|DoubleFloat|))
          (|endpt| (PT)) (|startpt| (PT)) (|totalwidth| (|DoubleFloat|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |totalwidth|
                  (SPADCALL
                   (SPADCALL (SPADCALL |bb| (QREFELT $ 37))
                             (SPADCALL |bb| (QREFELT $ 38)) (QREFELT $ 39))
                   (QREFELT $ 81))
                  . #2=(|SCENE;shorternArrow|))
            (LETT |startpt| (QCAR |pts|) . #2#)
            (LETT |endpt| (QCDR |pts|) . #2#)
            (LETT |arrLength| (SPADCALL |startpt| |endpt| (QREFELT $ 152))
                  . #2#)
            (COND
             ((|less_DF| |arrLength|
                         (SPADCALL (SPADCALL 1 -1 10 (QREFELT $ 90))
                                   (QREFELT $ 91)))
              (PROGN (LETT #1# |pts| . #2#) (GO #3=#:G1589))))
            (LETT |reductionFactor|
                  (|div_DF| |totalwidth|
                            (|mul_DF|
                             (SPADCALL (SPADCALL 40 0 10 (QREFELT $ 90))
                                       (QREFELT $ 91))
                             |arrLength|))
                  . #2#)
            (COND
             ((SPADCALL |reductionFactor|
                        (SPADCALL (SPADCALL 4 -1 10 (QREFELT $ 90))
                                  (QREFELT $ 91))
                        (QREFELT $ 155))
              (PROGN (LETT #1# |pts| . #2#) (GO #3#))))
            (LETT |relpt| (SPADCALL |endpt| |startpt| (QREFELT $ 39)) . #2#)
            (LETT |newstart|
                  (SPADCALL |startpt|
                            (SPADCALL |reductionFactor| |relpt|
                                      (QREFELT $ 104))
                            (QREFELT $ 103))
                  . #2#)
            (LETT |newend|
                  (SPADCALL |startpt|
                            (SPADCALL
                             (|sub_DF|
                              (SPADCALL (SPADCALL 1 0 10 (QREFELT $ 90))
                                        (QREFELT $ 91))
                              |reductionFactor|)
                             |relpt| (QREFELT $ 104))
                            (QREFELT $ 103))
                  . #2#)
            (EXIT (CONS |newstart| |newend|))))
          #3# (EXIT #1#)))) 

(SDEFUN |SCENE;lineArrow|
        ((|pts| |List| (|List| PT)) (|tran| |STransform| PT)
         (|bb| |SBoundary| PT)
         (|mat| |Record| (|:| |lineWidth| (|DoubleFloat|))
          (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
          (|:| |matOpacity| (|DoubleFloat|)))
         (|sc| |DoubleFloat|) (|clipEn| |Boolean|) (|mode| |Symbol|)
         (|size| |DoubleFloat|) ($ |List| (|XmlElement|)))
        (SPROG
         ((|nodeEles| (|List| (|XmlElement|))) (|x| (|XmlElement|))
          (|nodeAtts| (|List| (|XmlAttribute|))) (|linWidth| (|DoubleFloat|))
          (|ptStr| (|String|)) (|thisStr| (|String|))
          (|minusEndy| #1=(|DoubleFloat|)) (|endPoint| (PT))
          (|minusStarty| #1#) (|aline| (|Record| (|:| |st| PT) (|:| |en| PT)))
          (|startPoint| (PT)) (|pntNum| (|NonNegativeInteger|))
          (|valid| (|Boolean|)) (|param2| (PT)) (#2=#:G1607 NIL) (|param| NIL)
          (#3=#:G1606 NIL) (|line| NIL))
         (SEQ (LETT |nodeEles| NIL . #4=(|SCENE;lineArrow|))
              (SEQ (LETT |line| NIL . #4#) (LETT #3# |pts| . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |line| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (LETT |pntNum| 0 . #4#) (LETT |ptStr| "" . #4#)
                        (LETT |startPoint| (SPADCALL 0 0 (QREFELT $ 14)) . #4#)
                        (LETT |endPoint| (SPADCALL 0 0 (QREFELT $ 14)) . #4#)
                        (SEQ (LETT |param| NIL . #4#) (LETT #2# |line| . #4#)
                             G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |param| (CAR #2#) . #4#) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |param2|
                                    (SPADCALL |tran| |param| (QREFELT $ 149))
                                    . #4#)
                              (LETT |valid|
                                    (COND
                                     (|clipEn|
                                      (SPADCALL |bb| |param| (QREFELT $ 150)))
                                     ('T 'T))
                                    . #4#)
                              (EXIT
                               (COND
                                (|valid|
                                 (SEQ (LETT |pntNum| (+ |pntNum| 1) . #4#)
                                      (COND
                                       ((SPADCALL |ptStr| "" (QREFELT $ 151))
                                        (LETT |ptStr| (STRCONC |ptStr| " ")
                                              . #4#)))
                                      (COND
                                       ((EQL |pntNum| 1)
                                        (SEQ
                                         (LETT |ptStr| (STRCONC |ptStr| "M")
                                               . #4#)
                                         (EXIT
                                          (LETT |startPoint| |param2|
                                                . #4#)))))
                                      (COND
                                       ((EQL |pntNum| 2)
                                        (SEQ (LETT |endPoint| |param2| . #4#)
                                             (LETT |aline|
                                                   (CONS |startPoint|
                                                         |endPoint|)
                                                   . #4#)
                                             (COND
                                              ((EQUAL |mode| '|proportional|)
                                               (LETT |aline|
                                                     (|SCENE;shorternArrow|
                                                      (CONS |startPoint|
                                                            |endPoint|)
                                                      |bb| $)
                                                     . #4#)))
                                             (LETT |minusStarty|
                                                   (|minus_DF|
                                                    (|mul_DF|
                                                     (SPADCALL (QCAR |aline|)
                                                               (QREFELT $ 82))
                                                     |sc|))
                                                   . #4#)
                                             (LETT |minusEndy|
                                                   (|minus_DF|
                                                    (|mul_DF|
                                                     (SPADCALL (QCDR |aline|)
                                                               (QREFELT $ 82))
                                                     |sc|))
                                                   . #4#)
                                             (LETT |thisStr|
                                                   (SPADCALL
                                                    (LIST
                                                     (|mathObject2String|
                                                      (|mul_DF|
                                                       (SPADCALL (QCAR |aline|)
                                                                 (QREFELT $
                                                                          81))
                                                       |sc|))
                                                     ","
                                                     (|mathObject2String|
                                                      |minusStarty|)
                                                     "L"
                                                     (|mathObject2String|
                                                      (|mul_DF|
                                                       (SPADCALL (QCDR |aline|)
                                                                 (QREFELT $
                                                                          81))
                                                       |sc|))
                                                     ","
                                                     (|mathObject2String|
                                                      |minusEndy|))
                                                    (QREFELT $ 118))
                                                   . #4#)
                                             (EXIT
                                              (LETT |ptStr|
                                                    (STRCONC |ptStr| |thisStr|)
                                                    . #4#)))))
                                      (EXIT
                                       (COND
                                        ((SPADCALL |pntNum| 2 (QREFELT $ 156))
                                         (SEQ (LETT |endPoint| |param2| . #4#)
                                              (LETT |minusEndy|
                                                    (|minus_DF|
                                                     (|mul_DF|
                                                      (SPADCALL |endPoint|
                                                                (QREFELT $ 82))
                                                      |sc|))
                                                    . #4#)
                                              (LETT |thisStr|
                                                    (SPADCALL
                                                     (LIST "L"
                                                           (|mathObject2String|
                                                            (|mul_DF|
                                                             (SPADCALL
                                                              |endPoint|
                                                              (QREFELT $ 81))
                                                             |sc|))
                                                           ","
                                                           (|mathObject2String|
                                                            |minusEndy|))
                                                     (QREFELT $ 118))
                                                    . #4#)
                                              (EXIT
                                               (LETT |ptStr|
                                                     (STRCONC |ptStr|
                                                              |thisStr|)
                                                     . #4#)))))))))))
                             (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (COND
                          ((SPADCALL |ptStr| "" (QREFELT $ 151))
                           (SEQ
                            (COND
                             ((|less_DF|
                               (SPADCALL |startPoint| |endPoint|
                                         (QREFELT $ 152))
                               (SPADCALL (SPADCALL 1 -2 10 (QREFELT $ 90))
                                         (QREFELT $ 91)))
                              (LETT |ptStr|
                                    (SPADCALL
                                     (LIST "M "
                                           (|mathObject2String|
                                            (|mul_DF|
                                             (SPADCALL |startPoint|
                                                       (QREFELT $ 81))
                                             |sc|))
                                           ","
                                           (|mathObject2String|
                                            (|minus_DF|
                                             (|mul_DF|
                                              (SPADCALL |startPoint|
                                                        (QREFELT $ 82))
                                              |sc|)))
                                           "c -50,25 -50,-50 0,-25")
                                     (QREFELT $ 118))
                                    . #4#)))
                            (LETT |linWidth|
                                  (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) . #4#)
                            (COND
                             ((EQUAL |mode| '|proportional|)
                              (LETT |linWidth|
                                    (|mul_DF|
                                     (SPADCALL
                                      (SPADCALL (SPADCALL |bb| (QREFELT $ 37))
                                                (SPADCALL |bb| (QREFELT $ 38))
                                                (QREFELT $ 39))
                                      (QREFELT $ 81))
                                     |size|)
                                    . #4#)))
                            (COND
                             ((EQUAL |mode| '|variable|)
                              (LETT |linWidth|
                                    (|mul_DF|
                                     (SPADCALL |startPoint| |endPoint|
                                               (QREFELT $ 152))
                                     |size|)
                                    . #4#)))
                            (LETT |nodeAtts|
                                  (LIST (SPADCALL "d" |ptStr| (QREFELT $ 158))
                                        (SPADCALL "fill" "none"
                                                  (QREFELT $ 158))
                                        (SPADCALL "stroke" (QVELT |mat| 1)
                                                  (QREFELT $ 158))
                                        (SPADCALL "stroke-width"
                                                  (|mathObject2String|
                                                   |linWidth|)
                                                  (QREFELT $ 158))
                                        (SPADCALL "style"
                                                  "marker-end:url(#Arrow)"
                                                  (QREFELT $ 158)))
                                  . #4#)
                            (LETT |x|
                                  (SPADCALL "path" NIL |nodeAtts|
                                            (QREFELT $ 161))
                                  . #4#)
                            (EXIT
                             (LETT |nodeEles|
                                   (SPADCALL |nodeEles| |x| (QREFELT $ 163))
                                   . #4#)))))))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT |nodeEles|)))) 

(SDEFUN |SCENE;faceString|
        ((|faces| |Record| (|:| |inx| (|List| (|List| (|NonNegativeInteger|))))
          (|:| |pts| (|List| PT)))
         (|tran| |STransform| PT) (|bb| |SBoundary| PT) (|sc| |DoubleFloat|)
         (|clipEn| |Boolean|) ($ |String|))
        (SPROG
         ((|ptStr| (|String|)) (|lastValid| #1=(|Boolean|))
          (|thisStr| (|String|)) (|minusy| (|DoubleFloat|))
          (|pntNum| (|NonNegativeInteger|)) (|valid| #1#) (|param2| (PT))
          (|param| (PT)) (#2=#:G1620 NIL) (|i| NIL) (#3=#:G1619 NIL)
          (|ln| NIL))
         (SEQ (LETT |ptStr| "" . #4=(|SCENE;faceString|))
              (LETT |lastValid| 'T . #4#)
              (SEQ (LETT |ln| NIL . #4#) (LETT #3# (QCAR |faces|) . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |ln| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (LETT |pntNum| 0 . #4#)
                        (SEQ (LETT |i| NIL . #4#) (LETT #2# |ln| . #4#) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |i| (CAR #2#) . #4#) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |param|
                                    (SPADCALL (QCDR |faces|) (+ |i| 1)
                                              (QREFELT $ 102))
                                    . #4#)
                              (LETT |param2|
                                    (SPADCALL |tran| |param| (QREFELT $ 149))
                                    . #4#)
                              (LETT |valid|
                                    (COND
                                     (|clipEn|
                                      (SPADCALL |bb| |param| (QREFELT $ 150)))
                                     ('T 'T))
                                    . #4#)
                              (COND
                               (|valid|
                                (SEQ (LETT |pntNum| (+ |pntNum| 1) . #4#)
                                     (COND
                                      ((SPADCALL |ptStr| "" (QREFELT $ 151))
                                       (LETT |ptStr| (STRCONC |ptStr| " ")
                                             . #4#)))
                                     (COND
                                      (|lastValid|
                                       (SEQ
                                        (COND
                                         ((EQL |pntNum| 1)
                                          (LETT |ptStr| (STRCONC |ptStr| "M")
                                                . #4#)))
                                        (EXIT
                                         (COND
                                          ((EQL |pntNum| 2)
                                           (LETT |ptStr| (STRCONC |ptStr| "L")
                                                 . #4#)))))))
                                     (COND
                                      ((NULL |lastValid|)
                                       (LETT |ptStr| (STRCONC |ptStr| "M")
                                             . #4#)))
                                     (LETT |minusy|
                                           (|minus_DF|
                                            (|mul_DF|
                                             (SPADCALL |param2| (QREFELT $ 82))
                                             |sc|))
                                           . #4#)
                                     (LETT |thisStr|
                                           (SPADCALL
                                            (LIST
                                             (|mathObject2String|
                                              (|mul_DF|
                                               (SPADCALL |param2|
                                                         (QREFELT $ 81))
                                               |sc|))
                                             ","
                                             (|mathObject2String| |minusy|))
                                            (QREFELT $ 118))
                                           . #4#)
                                     (EXIT
                                      (LETT |ptStr| (STRCONC |ptStr| |thisStr|)
                                            . #4#)))))
                              (EXIT (LETT |lastValid| |valid| . #4#)))
                             (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT (LETT |ptStr| (STRCONC |ptStr| "z") . #4#)))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT |ptStr|)))) 

(SDEFUN |SCENE;toSVG;$RStSbDf2BSnpXe;82|
        ((|n| $)
         (|mat| |Record| (|:| |lineWidth| (|DoubleFloat|))
          (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
          (|:| |matOpacity| (|DoubleFloat|)))
         (|tran| |STransform| PT) (|bb| |SBoundary| PT) (|scale| |DoubleFloat|)
         (|clipEn| |Boolean|) (|useInteger| |Boolean|)
         (|npt| |SceneNamedPoints| PT) ($ |XmlElement|))
        (SPROG
         ((|nodeEles| (|List| (|XmlElement|))) (|xch| (|XmlElement|))
          (#1=#:G1706 NIL) (|ch| NIL) (|nodeName| (|String|)) (|nde| ($))
          (|name| #2=(|String|))
          (|nn| (|Record| (|:| |nme| #2#) (|:| |node| $))) (#3=#:G1638 NIL)
          (#4=#:G1639 NIL) (|nodeAtts| (|List| (|XmlAttribute|)))
          (|linWidth| (|DoubleFloat|)) (#5=#:G1636 NIL) (|ptStr| #6=(|String|))
          (|endPointM| #7=(|DoubleFloat|)) (|startPointM| #7#)
          (|endPoint| (PT)) (|startPoint| (PT)) (#8=#:G1635 NIL)
          (#9=#:G1704 NIL) (#10=#:G1634 NIL) (|bb2| (|SBoundary| PT))
          (#11=#:G1632 NIL) (|clipEn2| (|Boolean|)) (|tran2| (|STransform| PT))
          (#12=#:G1633 NIL) (#13=#:G1631 NIL) (|param2| (PT))
          (|nodeAttsTxt| (|List| #14=(|XmlAttribute|))) (#15=#:G1705 NIL)
          (|nam| NIL)
          (|mat2|
           (|Record| (|:| |lineWidth| (|DoubleFloat|))
                     (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
                     (|:| |matOpacity| (|DoubleFloat|))))
          (#16=#:G1630 NIL) (#17=#:G1637 NIL) (|sh| (|String|))
          (|sw| (|String|)) (|sy| (|String|)) (|sx| (|String|))
          (|ry| #18=(|DoubleFloat|)) (|rx| #18#) (|r2| (PT)) (#19=#:G1629 NIL)
          (|viewBoxStr| #6#) (|offsety| #7#) (|offsetx| #7#)
          (|scale2| (|DoubleFloat|)) (|maxy| #20=(|DoubleFloat|))
          (|maxx| #21=(|DoubleFloat|)) (|miny| #20#) (|minx| #21#)
          (|mkr| #22=(|XmlElement|)) (|mkrAtts| (|List| #14#)) (|pth| #22#)
          (|pthAtts| (|List| #14#)) (|np2| (|SceneNamedPoints| PT)))
         (SEQ
          (EXIT
           (SEQ (LETT |bb2| |bb| . #23=(|SCENE;toSVG;$RStSbDf2BSnpXe;82|))
                (LETT |tran2| |tran| . #23#) (LETT |mat2| |mat| . #23#)
                (LETT |np2| |npt| . #23#) (LETT |clipEn2| |clipEn| . #23#)
                (LETT |scale2| |scale| . #23#) (LETT |nodeEles| NIL . #23#)
                (LETT |nodeAtts| NIL . #23#) (LETT |nodeName| "" . #23#)
                (COND
                 ((EQUAL (QVELT |n| 0) 'ROOT)
                  (SEQ (LETT |nodeName| "svg" . #23#)
                       (LETT |pthAtts|
                             (LIST
                              (SPADCALL "d"
                                        "M 0.0,0.0 L 5.0,-5.0 L -12.5,0.0 L 5.0,5.0 L 0.0,0.0 z "
                                        (QREFELT $ 158))
                              (SPADCALL "style"
                                        "fill-rule:evenodd;stroke:#000000;stroke-width:1.0pt;marker-start:none;"
                                        (QREFELT $ 158))
                              (SPADCALL "transform"
                                        "scale(0.4) rotate(180) translate(10,0)"
                                        (QREFELT $ 158)))
                             . #23#)
                       (LETT |pth|
                             (SPADCALL "path" NIL |pthAtts| (QREFELT $ 161))
                             . #23#)
                       (LETT |mkrAtts|
                             (LIST (SPADCALL "orient" "auto" (QREFELT $ 158))
                                   (SPADCALL "refY" "0.0" (QREFELT $ 158))
                                   (SPADCALL "refX" "0.0" (QREFELT $ 158))
                                   (SPADCALL "id" "Arrow" (QREFELT $ 158))
                                   (SPADCALL "style" "overflow:visible"
                                             (QREFELT $ 158)))
                             . #23#)
                       (LETT |mkr|
                             (SPADCALL "marker" (LIST |pth|) |mkrAtts|
                                       (QREFELT $ 161))
                             . #23#)
                       (LETT |nodeEles|
                             (LIST
                              (SPADCALL "defs" (LIST |mkr|) NIL
                                        (QREFELT $ 161)))
                             . #23#)
                       (COND
                        ((NULL (QEQCAR (QVELT |n| 2) 3))
                         (|error|
                          "toSVG parameter type not valid for root node")))
                       (LETT |bb2|
                             (PROG2 (LETT #11# (QVELT |n| 2) . #23#)
                                 (QCDR #11#)
                               (|check_union2| (QEQCAR #11# 3)
                                               (|SBoundary| (QREFELT $ 6))
                                               (|Union|
                                                (|:| |points|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |material|
                                                     (|Record|
                                                      (|:| |lineWidth|
                                                           (|DoubleFloat|))
                                                      (|:| |lineCol|
                                                           (|String|))
                                                      (|:| |fillCol|
                                                           (|String|))
                                                      (|:| |matOpacity|
                                                           (|DoubleFloat|))))
                                                (|:| |text|
                                                     (|Record|
                                                      (|:| |txt| (|String|))
                                                      (|:| |siz|
                                                           (|NonNegativeInteger|))
                                                      (|:| |pos| (QREFELT $ 6))
                                                      (|:| |np|
                                                           (|List|
                                                            (|String|)))))
                                                (|:| |boundbox|
                                                     (|SBoundary|
                                                      (QREFELT $ 6)))
                                                (|:| |trans|
                                                     (|STransform|
                                                      (QREFELT $ 6)))
                                                (|:| |ifs|
                                                     (|Record|
                                                      (|:| |inx|
                                                           (|List|
                                                            (|List|
                                                             (|NonNegativeInteger|))))
                                                      (|:| |pts|
                                                           (|List|
                                                            (QREFELT $ 6)))))
                                                (|:| |arrws|
                                                     (|Record|
                                                      (|:| |ln|
                                                           (|List|
                                                            (|List|
                                                             (QREFELT $ 6))))
                                                      (|:| |mode| (|Symbol|))
                                                      (|:| |size|
                                                           (|DoubleFloat|))))
                                                (|:| |arrw|
                                                     (|Record|
                                                      (|:| |st| (|String|))
                                                      (|:| |en| (|String|))
                                                      (|:| |offset|
                                                           (QREFELT $ 6))
                                                      (|:| |mode| (|Symbol|))
                                                      (|:| |size|
                                                           (|DoubleFloat|))))
                                                (|:| |shpe|
                                                     (|Record|
                                                      (|:| |shptype|
                                                           (|Symbol|))
                                                      (|:| |centre|
                                                           (QREFELT $ 6))
                                                      (|:| |size|
                                                           (QREFELT $ 6))
                                                      (|:| |fill|
                                                           (|Boolean|))))
                                                (|:| |nodename|
                                                     (|Record|
                                                      (|:| |nme| (|String|))
                                                      (|:| |node| $)))
                                                (|:| |np|
                                                     (|SceneNamedPoints|
                                                      (QREFELT $ 6)))
                                                (|:| |empty| #24="empty"))
                                               #11#))
                             . #23#)
                       (COND
                        ((SPADCALL |bb2| (QREFELT $ 164))
                         (LETT |bb2| (SPADCALL |n| 1.0 (QREFELT $ 26))
                               . #23#)))
                       (COND
                        ((SPADCALL |bb2| (QREFELT $ 164))
                         (|error| "scene contains no drawable elements")))
                       (LETT |minx|
                             (SPADCALL (SPADCALL |bb2| (QREFELT $ 38))
                                       (QREFELT $ 81))
                             . #23#)
                       (LETT |miny|
                             (SPADCALL (SPADCALL |bb2| (QREFELT $ 38))
                                       (QREFELT $ 82))
                             . #23#)
                       (LETT |maxx|
                             (SPADCALL (SPADCALL |bb2| (QREFELT $ 37))
                                       (QREFELT $ 81))
                             . #23#)
                       (LETT |maxy|
                             (SPADCALL (SPADCALL |bb2| (QREFELT $ 37))
                                       (QREFELT $ 82))
                             . #23#)
                       (LETT |scale2|
                             (|div_DF| (FLOAT 1000 MOST-POSITIVE-DOUBLE-FLOAT)
                                       (|sub_DF| |maxx| |minx|))
                             . #23#)
                       (LETT |offsetx| (|minus_DF| |minx|) . #23#)
                       (LETT |offsety| (|minus_DF| |maxy|) . #23#)
                       (LETT |tran2|
                             (SPADCALL |offsetx| |offsety| 0.0 1.0 1.0 1.0
                                       (QREFELT $ 165))
                             . #23#)
                       (COND
                        (|useInteger|
                         (LETT |viewBoxStr|
                               (SPADCALL
                                (LIST "0 0 "
                                      (|mathObject2String|
                                       (TRUNCATE
                                        (|mul_DF| (|sub_DF| |maxx| |minx|)
                                                  |scale2|)))
                                      " "
                                      (|mathObject2String|
                                       (TRUNCATE
                                        (|mul_DF| (|sub_DF| |maxy| |miny|)
                                                  |scale2|))))
                                (QREFELT $ 118))
                               . #23#))
                        (#25='T
                         (LETT |viewBoxStr|
                               (SPADCALL
                                (LIST "0.0 0.0 "
                                      (|mathObject2String|
                                       (|mul_DF| (|sub_DF| |maxx| |minx|)
                                                 |scale2|))
                                      " "
                                      (|mathObject2String|
                                       (|mul_DF| (|sub_DF| |maxy| |miny|)
                                                 |scale2|)))
                                (QREFELT $ 118))
                               . #23#)))
                       (EXIT
                        (LETT |nodeAtts|
                              (LIST
                               (SPADCALL "xmlns" "http://www.w3.org/2000/svg"
                                         (QREFELT $ 158))
                               (SPADCALL "width" "12cm" (QREFELT $ 158))
                               (SPADCALL "height" "8cm" (QREFELT $ 158))
                               (SPADCALL "viewBox" |viewBoxStr|
                                         (QREFELT $ 158)))
                              . #23#)))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'GROUP) (LETT |nodeName| "g" . #23#)))
                (COND
                 ((EQUAL (QVELT |n| 0) 'LINE)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 0))
                     (|error| "toSVG parameter type not valid for line node")))
                   (LETT |nodeName| "path" . #23#)
                   (LETT |nodeAtts|
                         (LIST
                          (SPADCALL "d"
                                    (|SCENE;pathString|
                                     (PROG2 (LETT #19# (QVELT |n| 2) . #23#)
                                         (QCDR #19#)
                                       (|check_union2| (QEQCAR #19# 0)
                                                       (|List|
                                                        (|List| (QREFELT $ 6)))
                                                       (|Union|
                                                        (|:| |points|
                                                             (|List|
                                                              (|List|
                                                               (QREFELT $ 6))))
                                                        (|:| |material|
                                                             (|Record|
                                                              (|:| |lineWidth|
                                                                   (|DoubleFloat|))
                                                              (|:| |lineCol|
                                                                   (|String|))
                                                              (|:| |fillCol|
                                                                   (|String|))
                                                              (|:| |matOpacity|
                                                                   (|DoubleFloat|))))
                                                        (|:| |text|
                                                             (|Record|
                                                              (|:| |txt|
                                                                   (|String|))
                                                              (|:| |siz|
                                                                   (|NonNegativeInteger|))
                                                              (|:| |pos|
                                                                   (QREFELT $
                                                                            6))
                                                              (|:| |np|
                                                                   (|List|
                                                                    (|String|)))))
                                                        (|:| |boundbox|
                                                             (|SBoundary|
                                                              (QREFELT $ 6)))
                                                        (|:| |trans|
                                                             (|STransform|
                                                              (QREFELT $ 6)))
                                                        (|:| |ifs|
                                                             (|Record|
                                                              (|:| |inx|
                                                                   (|List|
                                                                    (|List|
                                                                     (|NonNegativeInteger|))))
                                                              (|:| |pts|
                                                                   (|List|
                                                                    (QREFELT $
                                                                             6)))))
                                                        (|:| |arrws|
                                                             (|Record|
                                                              (|:| |ln|
                                                                   (|List|
                                                                    (|List|
                                                                     (QREFELT $
                                                                              6))))
                                                              (|:| |mode|
                                                                   (|Symbol|))
                                                              (|:| |size|
                                                                   (|DoubleFloat|))))
                                                        (|:| |arrw|
                                                             (|Record|
                                                              (|:| |st|
                                                                   (|String|))
                                                              (|:| |en|
                                                                   (|String|))
                                                              (|:| |offset|
                                                                   (QREFELT $
                                                                            6))
                                                              (|:| |mode|
                                                                   (|Symbol|))
                                                              (|:| |size|
                                                                   (|DoubleFloat|))))
                                                        (|:| |shpe|
                                                             (|Record|
                                                              (|:| |shptype|
                                                                   (|Symbol|))
                                                              (|:| |centre|
                                                                   (QREFELT $
                                                                            6))
                                                              (|:| |size|
                                                                   (QREFELT $
                                                                            6))
                                                              (|:| |fill|
                                                                   (|Boolean|))))
                                                        (|:| |nodename|
                                                             (|Record|
                                                              (|:| |nme|
                                                                   (|String|))
                                                              (|:| |node| $)))
                                                        (|:| |np|
                                                             (|SceneNamedPoints|
                                                              (QREFELT $ 6)))
                                                        (|:| |empty| #24#))
                                                       #19#))
                                     |tran2| |bb2| |scale2| |clipEn2|
                                     |useInteger| $)
                                    (QREFELT $ 158))
                          (SPADCALL "fill" "none" (QREFELT $ 158))
                          (SPADCALL "stroke" (QVELT |mat2| 1) (QREFELT $ 158))
                          (SPADCALL "stroke-width"
                                    (|mathObject2String| (QVELT |mat2| 0))
                                    (QREFELT $ 158))
                          (SPADCALL "stroke-linecap" "butt" (QREFELT $ 158))
                          (SPADCALL "stroke-linejoin" "miter" (QREFELT $ 158)))
                         . #23#)
                   (EXIT
                    (COND
                     ((|less_DF| (QVELT |mat2| 3)
                                 (SPADCALL (SPADCALL 95 -2 10 (QREFELT $ 90))
                                           (QREFELT $ 91)))
                      (LETT |nodeAtts|
                            (SPADCALL |nodeAtts|
                                      (SPADCALL "stroke-opacity"
                                                (|mathObject2String|
                                                 (QVELT |mat2| 3))
                                                (QREFELT $ 158))
                                      (QREFELT $ 166))
                            . #23#)))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'SHAPE)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 8))
                     (|error|
                      "toSVG parameter type not valid for shape node")))
                   (LETT |param2|
                         (SPADCALL |tran|
                                   (QVELT
                                    (PROG2 (LETT #17# (QVELT |n| 2) . #23#)
                                        (QCDR #17#)
                                      (|check_union2| (QEQCAR #17# 8)
                                                      (|Record|
                                                       (|:| |shptype|
                                                            (|Symbol|))
                                                       (|:| |centre|
                                                            (QREFELT $ 6))
                                                       (|:| |size|
                                                            (QREFELT $ 6))
                                                       (|:| |fill|
                                                            (|Boolean|)))
                                                      (|Union|
                                                       (|:| |points|
                                                            (|List|
                                                             (|List|
                                                              (QREFELT $ 6))))
                                                       (|:| |material|
                                                            (|Record|
                                                             (|:| |lineWidth|
                                                                  (|DoubleFloat|))
                                                             (|:| |lineCol|
                                                                  (|String|))
                                                             (|:| |fillCol|
                                                                  (|String|))
                                                             (|:| |matOpacity|
                                                                  (|DoubleFloat|))))
                                                       (|:| |text|
                                                            (|Record|
                                                             (|:| |txt|
                                                                  (|String|))
                                                             (|:| |siz|
                                                                  (|NonNegativeInteger|))
                                                             (|:| |pos|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |np|
                                                                  (|List|
                                                                   (|String|)))))
                                                       (|:| |boundbox|
                                                            (|SBoundary|
                                                             (QREFELT $ 6)))
                                                       (|:| |trans|
                                                            (|STransform|
                                                             (QREFELT $ 6)))
                                                       (|:| |ifs|
                                                            (|Record|
                                                             (|:| |inx|
                                                                  (|List|
                                                                   (|List|
                                                                    (|NonNegativeInteger|))))
                                                             (|:| |pts|
                                                                  (|List|
                                                                   (QREFELT $
                                                                            6)))))
                                                       (|:| |arrws|
                                                            (|Record|
                                                             (|:| |ln|
                                                                  (|List|
                                                                   (|List|
                                                                    (QREFELT $
                                                                             6))))
                                                             (|:| |mode|
                                                                  (|Symbol|))
                                                             (|:| |size|
                                                                  (|DoubleFloat|))))
                                                       (|:| |arrw|
                                                            (|Record|
                                                             (|:| |st|
                                                                  (|String|))
                                                             (|:| |en|
                                                                  (|String|))
                                                             (|:| |offset|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |mode|
                                                                  (|Symbol|))
                                                             (|:| |size|
                                                                  (|DoubleFloat|))))
                                                       (|:| |shpe|
                                                            (|Record|
                                                             (|:| |shptype|
                                                                  (|Symbol|))
                                                             (|:| |centre|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |size|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |fill|
                                                                  (|Boolean|))))
                                                       (|:| |nodename|
                                                            (|Record|
                                                             (|:| |nme|
                                                                  (|String|))
                                                             (|:| |node| $)))
                                                       (|:| |np|
                                                            (|SceneNamedPoints|
                                                             (QREFELT $ 6)))
                                                       (|:| |empty| #24#))
                                                      #17#))
                                    1)
                                   (QREFELT $ 149))
                         . #23#)
                   (LETT |r2|
                         (SPADCALL |tran|
                                   (QVELT
                                    (PROG2 (LETT #17# (QVELT |n| 2) . #23#)
                                        (QCDR #17#)
                                      (|check_union2| (QEQCAR #17# 8)
                                                      (|Record|
                                                       (|:| |shptype|
                                                            (|Symbol|))
                                                       (|:| |centre|
                                                            (QREFELT $ 6))
                                                       (|:| |size|
                                                            (QREFELT $ 6))
                                                       (|:| |fill|
                                                            (|Boolean|)))
                                                      (|Union|
                                                       (|:| |points|
                                                            (|List|
                                                             (|List|
                                                              (QREFELT $ 6))))
                                                       (|:| |material|
                                                            (|Record|
                                                             (|:| |lineWidth|
                                                                  (|DoubleFloat|))
                                                             (|:| |lineCol|
                                                                  (|String|))
                                                             (|:| |fillCol|
                                                                  (|String|))
                                                             (|:| |matOpacity|
                                                                  (|DoubleFloat|))))
                                                       (|:| |text|
                                                            (|Record|
                                                             (|:| |txt|
                                                                  (|String|))
                                                             (|:| |siz|
                                                                  (|NonNegativeInteger|))
                                                             (|:| |pos|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |np|
                                                                  (|List|
                                                                   (|String|)))))
                                                       (|:| |boundbox|
                                                            (|SBoundary|
                                                             (QREFELT $ 6)))
                                                       (|:| |trans|
                                                            (|STransform|
                                                             (QREFELT $ 6)))
                                                       (|:| |ifs|
                                                            (|Record|
                                                             (|:| |inx|
                                                                  (|List|
                                                                   (|List|
                                                                    (|NonNegativeInteger|))))
                                                             (|:| |pts|
                                                                  (|List|
                                                                   (QREFELT $
                                                                            6)))))
                                                       (|:| |arrws|
                                                            (|Record|
                                                             (|:| |ln|
                                                                  (|List|
                                                                   (|List|
                                                                    (QREFELT $
                                                                             6))))
                                                             (|:| |mode|
                                                                  (|Symbol|))
                                                             (|:| |size|
                                                                  (|DoubleFloat|))))
                                                       (|:| |arrw|
                                                            (|Record|
                                                             (|:| |st|
                                                                  (|String|))
                                                             (|:| |en|
                                                                  (|String|))
                                                             (|:| |offset|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |mode|
                                                                  (|Symbol|))
                                                             (|:| |size|
                                                                  (|DoubleFloat|))))
                                                       (|:| |shpe|
                                                            (|Record|
                                                             (|:| |shptype|
                                                                  (|Symbol|))
                                                             (|:| |centre|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |size|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |fill|
                                                                  (|Boolean|))))
                                                       (|:| |nodename|
                                                            (|Record|
                                                             (|:| |nme|
                                                                  (|String|))
                                                             (|:| |node| $)))
                                                       (|:| |np|
                                                            (|SceneNamedPoints|
                                                             (QREFELT $ 6)))
                                                       (|:| |empty| #24#))
                                                      #17#))
                                    2)
                                   (QREFELT $ 149))
                         . #23#)
                   (LETT |rx|
                         (|mul_DF| (SPADCALL |r2| (QREFELT $ 81)) |scale2|)
                         . #23#)
                   (LETT |ry|
                         (|mul_DF| (SPADCALL |r2| (QREFELT $ 82)) |scale2|)
                         . #23#)
                   (LETT |nodeName| "ellipse" . #23#) (LETT |sx| "x" . #23#)
                   (LETT |sy| "y" . #23#) (LETT |sw| "width" . #23#)
                   (LETT |sh| "height" . #23#)
                   (COND
                    ((EQUAL
                      (QVELT
                       (PROG2 (LETT #17# (QVELT |n| 2) . #23#)
                           (QCDR #17#)
                         (|check_union2| (QEQCAR #17# 8)
                                         (|Record| (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT $ 6))
                                                   (|:| |size| (QREFELT $ 6))
                                                   (|:| |fill| (|Boolean|)))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT $ 6))))
                                          (|:| |material|
                                               (|Record|
                                                (|:| |lineWidth|
                                                     (|DoubleFloat|))
                                                (|:| |lineCol| (|String|))
                                                (|:| |fillCol| (|String|))
                                                (|:| |matOpacity|
                                                     (|DoubleFloat|))))
                                          (|:| |text|
                                               (|Record| (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT $ 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT $ 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT $ 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT $ 6))
                                                (|:| |size| (QREFELT $ 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| $)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT $ 6)))
                                          (|:| |empty| #24#))
                                         #17#))
                       0)
                      '|rect|)
                     (SEQ (LETT |nodeName| "rect" . #23#)
                          (LETT |sx| "x" . #23#) (LETT |sy| "y" . #23#)
                          (LETT |sw| "width" . #23#)
                          (LETT |sh| "height" . #23#)
                          (EXIT
                           (LETT |param2|
                                 (SPADCALL |param2|
                                           (SPADCALL 0.0
                                                     (SPADCALL |r2|
                                                               (QREFELT $ 82))
                                                     (QREFELT $ 83))
                                           (QREFELT $ 103))
                                 . #23#)))))
                   (COND
                    ((EQUAL
                      (QVELT
                       (PROG2 (LETT #17# (QVELT |n| 2) . #23#)
                           (QCDR #17#)
                         (|check_union2| (QEQCAR #17# 8)
                                         (|Record| (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT $ 6))
                                                   (|:| |size| (QREFELT $ 6))
                                                   (|:| |fill| (|Boolean|)))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT $ 6))))
                                          (|:| |material|
                                               (|Record|
                                                (|:| |lineWidth|
                                                     (|DoubleFloat|))
                                                (|:| |lineCol| (|String|))
                                                (|:| |fillCol| (|String|))
                                                (|:| |matOpacity|
                                                     (|DoubleFloat|))))
                                          (|:| |text|
                                               (|Record| (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT $ 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT $ 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT $ 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT $ 6))
                                                (|:| |size| (QREFELT $ 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| $)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT $ 6)))
                                          (|:| |empty| #24#))
                                         #17#))
                       0)
                      '|ellipse|)
                     (SEQ (LETT |nodeName| "ellipse" . #23#)
                          (LETT |sx| "cx" . #23#) (LETT |sy| "cy" . #23#)
                          (LETT |sw| "rx" . #23#)
                          (EXIT (LETT |sh| "ry" . #23#)))))
                   (COND
                    ((EQUAL
                      (QVELT
                       (PROG2 (LETT #17# (QVELT |n| 2) . #23#)
                           (QCDR #17#)
                         (|check_union2| (QEQCAR #17# 8)
                                         (|Record| (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT $ 6))
                                                   (|:| |size| (QREFELT $ 6))
                                                   (|:| |fill| (|Boolean|)))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT $ 6))))
                                          (|:| |material|
                                               (|Record|
                                                (|:| |lineWidth|
                                                     (|DoubleFloat|))
                                                (|:| |lineCol| (|String|))
                                                (|:| |fillCol| (|String|))
                                                (|:| |matOpacity|
                                                     (|DoubleFloat|))))
                                          (|:| |text|
                                               (|Record| (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT $ 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT $ 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT $ 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT $ 6))
                                                (|:| |size| (QREFELT $ 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| $)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT $ 6)))
                                          (|:| |empty| #24#))
                                         #17#))
                       0)
                      '|box|)
                     (SEQ (LETT |nodeName| "rect" . #23#)
                          (LETT |sx| "x" . #23#) (LETT |sy| "y" . #23#)
                          (LETT |sw| "width" . #23#)
                          (LETT |sh| "height" . #23#)
                          (EXIT
                           (LETT |param2|
                                 (SPADCALL |param2|
                                           (SPADCALL 0.0
                                                     (SPADCALL |r2|
                                                               (QREFELT $ 82))
                                                     (QREFELT $ 83))
                                           (QREFELT $ 103))
                                 . #23#)))))
                   (COND
                    ((EQUAL
                      (QVELT
                       (PROG2 (LETT #17# (QVELT |n| 2) . #23#)
                           (QCDR #17#)
                         (|check_union2| (QEQCAR #17# 8)
                                         (|Record| (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT $ 6))
                                                   (|:| |size| (QREFELT $ 6))
                                                   (|:| |fill| (|Boolean|)))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT $ 6))))
                                          (|:| |material|
                                               (|Record|
                                                (|:| |lineWidth|
                                                     (|DoubleFloat|))
                                                (|:| |lineCol| (|String|))
                                                (|:| |fillCol| (|String|))
                                                (|:| |matOpacity|
                                                     (|DoubleFloat|))))
                                          (|:| |text|
                                               (|Record| (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT $ 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT $ 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT $ 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT $ 6))
                                                (|:| |size| (QREFELT $ 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| $)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT $ 6)))
                                          (|:| |empty| #24#))
                                         #17#))
                       0)
                      '|sphere|)
                     (SEQ (LETT |nodeName| "ellipse" . #23#)
                          (LETT |sx| "cx" . #23#) (LETT |sy| "cy" . #23#)
                          (LETT |sw| "rx" . #23#)
                          (EXIT (LETT |sh| "ry" . #23#)))))
                   (LETT |nodeAtts|
                         (LIST
                          (SPADCALL "stroke" (QVELT |mat2| 1) (QREFELT $ 158))
                          (SPADCALL "stroke-width"
                                    (|mathObject2String| (QVELT |mat2| 0))
                                    (QREFELT $ 158))
                          (SPADCALL |sx|
                                    (|mathObject2String|
                                     (|mul_DF|
                                      (SPADCALL |param2| (QREFELT $ 81))
                                      |scale2|))
                                    (QREFELT $ 158))
                          (SPADCALL |sy|
                                    (|mathObject2String|
                                     (|minus_DF|
                                      (|mul_DF|
                                       (SPADCALL |param2| (QREFELT $ 82))
                                       |scale2|)))
                                    (QREFELT $ 158))
                          (SPADCALL |sw| (|mathObject2String| |rx|)
                                    (QREFELT $ 158))
                          (SPADCALL |sh| (|mathObject2String| |ry|)
                                    (QREFELT $ 158)))
                         . #23#)
                   (COND
                    ((QVELT
                      (PROG2 (LETT #17# (QVELT |n| 2) . #23#)
                          (QCDR #17#)
                        (|check_union2| (QEQCAR #17# 8)
                                        (|Record| (|:| |shptype| (|Symbol|))
                                                  (|:| |centre| (QREFELT $ 6))
                                                  (|:| |size| (QREFELT $ 6))
                                                  (|:| |fill| (|Boolean|)))
                                        (|Union|
                                         (|:| |points|
                                              (|List| (|List| (QREFELT $ 6))))
                                         (|:| |material|
                                              (|Record|
                                               (|:| |lineWidth|
                                                    (|DoubleFloat|))
                                               (|:| |lineCol| (|String|))
                                               (|:| |fillCol| (|String|))
                                               (|:| |matOpacity|
                                                    (|DoubleFloat|))))
                                         (|:| |text|
                                              (|Record| (|:| |txt| (|String|))
                                                        (|:| |siz|
                                                             (|NonNegativeInteger|))
                                                        (|:| |pos|
                                                             (QREFELT $ 6))
                                                        (|:| |np|
                                                             (|List|
                                                              (|String|)))))
                                         (|:| |boundbox|
                                              (|SBoundary| (QREFELT $ 6)))
                                         (|:| |trans|
                                              (|STransform| (QREFELT $ 6)))
                                         (|:| |ifs|
                                              (|Record|
                                               (|:| |inx|
                                                    (|List|
                                                     (|List|
                                                      (|NonNegativeInteger|))))
                                               (|:| |pts|
                                                    (|List| (QREFELT $ 6)))))
                                         (|:| |arrws|
                                              (|Record|
                                               (|:| |ln|
                                                    (|List|
                                                     (|List| (QREFELT $ 6))))
                                               (|:| |mode| (|Symbol|))
                                               (|:| |size| (|DoubleFloat|))))
                                         (|:| |arrw|
                                              (|Record| (|:| |st| (|String|))
                                                        (|:| |en| (|String|))
                                                        (|:| |offset|
                                                             (QREFELT $ 6))
                                                        (|:| |mode| (|Symbol|))
                                                        (|:| |size|
                                                             (|DoubleFloat|))))
                                         (|:| |shpe|
                                              (|Record|
                                               (|:| |shptype| (|Symbol|))
                                               (|:| |centre| (QREFELT $ 6))
                                               (|:| |size| (QREFELT $ 6))
                                               (|:| |fill| (|Boolean|))))
                                         (|:| |nodename|
                                              (|Record| (|:| |nme| (|String|))
                                                        (|:| |node| $)))
                                         (|:| |np|
                                              (|SceneNamedPoints|
                                               (QREFELT $ 6)))
                                         (|:| |empty| #24#))
                                        #17#))
                      3)
                     (LETT |nodeAtts|
                           (SPADCALL |nodeAtts|
                                     (SPADCALL "fill"
                                               (|mathObject2String|
                                                (QVELT |mat2| 2))
                                               (QREFELT $ 158))
                                     (QREFELT $ 166))
                           . #23#))
                    (#25#
                     (LETT |nodeAtts|
                           (SPADCALL |nodeAtts|
                                     (SPADCALL "fill" "none" (QREFELT $ 158))
                                     (QREFELT $ 166))
                           . #23#)))
                   (EXIT
                    (COND
                     ((|less_DF| (QVELT |mat2| 3)
                                 (SPADCALL (SPADCALL 95 -2 10 (QREFELT $ 90))
                                           (QREFELT $ 91)))
                      (LETT |nodeAtts|
                            (SPADCALL |nodeAtts|
                                      (SPADCALL "opacity"
                                                (|mathObject2String|
                                                 (QVELT |mat2| 3))
                                                (QREFELT $ 158))
                                      (QREFELT $ 166))
                            . #23#)))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'MATERIAL)
                  (SEQ (LETT |nodeName| "g" . #23#)
                       (COND
                        ((NULL (QEQCAR (QVELT |n| 2) 1))
                         (|error|
                          "toSVG parameter type not valid for material node")))
                       (EXIT
                        (LETT |mat2|
                              (PROG2 (LETT #16# (QVELT |n| 2) . #23#)
                                  (QCDR #16#)
                                (|check_union2| (QEQCAR #16# 1)
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|)))
                                                (|Union|
                                                 (|:| |points|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |material|
                                                      (|Record|
                                                       (|:| |lineWidth|
                                                            (|DoubleFloat|))
                                                       (|:| |lineCol|
                                                            (|String|))
                                                       (|:| |fillCol|
                                                            (|String|))
                                                       (|:| |matOpacity|
                                                            (|DoubleFloat|))))
                                                 (|:| |text|
                                                      (|Record|
                                                       (|:| |txt| (|String|))
                                                       (|:| |siz|
                                                            (|NonNegativeInteger|))
                                                       (|:| |pos|
                                                            (QREFELT $ 6))
                                                       (|:| |np|
                                                            (|List|
                                                             (|String|)))))
                                                 (|:| |boundbox|
                                                      (|SBoundary|
                                                       (QREFELT $ 6)))
                                                 (|:| |trans|
                                                      (|STransform|
                                                       (QREFELT $ 6)))
                                                 (|:| |ifs|
                                                      (|Record|
                                                       (|:| |inx|
                                                            (|List|
                                                             (|List|
                                                              (|NonNegativeInteger|))))
                                                       (|:| |pts|
                                                            (|List|
                                                             (QREFELT $ 6)))))
                                                 (|:| |arrws|
                                                      (|Record|
                                                       (|:| |ln|
                                                            (|List|
                                                             (|List|
                                                              (QREFELT $ 6))))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                                 (|:| |arrw|
                                                      (|Record|
                                                       (|:| |st| (|String|))
                                                       (|:| |en| (|String|))
                                                       (|:| |offset|
                                                            (QREFELT $ 6))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                                 (|:| |shpe|
                                                      (|Record|
                                                       (|:| |shptype|
                                                            (|Symbol|))
                                                       (|:| |centre|
                                                            (QREFELT $ 6))
                                                       (|:| |size|
                                                            (QREFELT $ 6))
                                                       (|:| |fill|
                                                            (|Boolean|))))
                                                 (|:| |nodename|
                                                      (|Record|
                                                       (|:| |nme| (|String|))
                                                       (|:| |node| $)))
                                                 (|:| |np|
                                                      (|SceneNamedPoints|
                                                       (QREFELT $ 6)))
                                                 (|:| |empty| #24#))
                                                #16#))
                              . #23#)))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'TEXT)
                  (SEQ (LETT |nodeName| "text" . #23#)
                       (COND
                        ((NULL (QEQCAR (QVELT |n| 2) 2))
                         (|error|
                          "toSVG parameter type not valid for text node")))
                       (COND
                        ((SPADCALL
                          (QVELT
                           (PROG2 (LETT #13# (QVELT |n| 2) . #23#)
                               (QCDR #13#)
                             (|check_union2| (QEQCAR #13# 2)
                                             (|Record| (|:| |txt| (|String|))
                                                       (|:| |siz|
                                                            (|NonNegativeInteger|))
                                                       (|:| |pos|
                                                            (QREFELT $ 6))
                                                       (|:| |np|
                                                            (|List|
                                                             (|String|))))
                                             (|Union|
                                              (|:| |points|
                                                   (|List|
                                                    (|List| (QREFELT $ 6))))
                                              (|:| |material|
                                                   (|Record|
                                                    (|:| |lineWidth|
                                                         (|DoubleFloat|))
                                                    (|:| |lineCol| (|String|))
                                                    (|:| |fillCol| (|String|))
                                                    (|:| |matOpacity|
                                                         (|DoubleFloat|))))
                                              (|:| |text|
                                                   (|Record|
                                                    (|:| |txt| (|String|))
                                                    (|:| |siz|
                                                         (|NonNegativeInteger|))
                                                    (|:| |pos| (QREFELT $ 6))
                                                    (|:| |np|
                                                         (|List| (|String|)))))
                                              (|:| |boundbox|
                                                   (|SBoundary| (QREFELT $ 6)))
                                              (|:| |trans|
                                                   (|STransform|
                                                    (QREFELT $ 6)))
                                              (|:| |ifs|
                                                   (|Record|
                                                    (|:| |inx|
                                                         (|List|
                                                          (|List|
                                                           (|NonNegativeInteger|))))
                                                    (|:| |pts|
                                                         (|List|
                                                          (QREFELT $ 6)))))
                                              (|:| |arrws|
                                                   (|Record|
                                                    (|:| |ln|
                                                         (|List|
                                                          (|List|
                                                           (QREFELT $ 6))))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|))))
                                              (|:| |arrw|
                                                   (|Record|
                                                    (|:| |st| (|String|))
                                                    (|:| |en| (|String|))
                                                    (|:| |offset|
                                                         (QREFELT $ 6))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|))))
                                              (|:| |shpe|
                                                   (|Record|
                                                    (|:| |shptype| (|Symbol|))
                                                    (|:| |centre|
                                                         (QREFELT $ 6))
                                                    (|:| |size| (QREFELT $ 6))
                                                    (|:| |fill| (|Boolean|))))
                                              (|:| |nodename|
                                                   (|Record|
                                                    (|:| |nme| (|String|))
                                                    (|:| |node| $)))
                                              (|:| |np|
                                                   (|SceneNamedPoints|
                                                    (QREFELT $ 6)))
                                              (|:| |empty| #24#))
                                             #13#))
                           3)
                          NIL (QREFELT $ 167))
                         (SEQ
                          (SEQ (LETT |nam| NIL . #23#)
                               (LETT #15#
                                     (QVELT
                                      (PROG2 (LETT #13# (QVELT |n| 2) . #23#)
                                          (QCDR #13#)
                                        (|check_union2| (QEQCAR #13# 2)
                                                        (|Record|
                                                         (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|))))
                                                        (|Union|
                                                         (|:| |points|
                                                              (|List|
                                                               (|List|
                                                                (QREFELT $
                                                                         6))))
                                                         (|:| |material|
                                                              (|Record|
                                                               (|:| |lineWidth|
                                                                    (|DoubleFloat|))
                                                               (|:| |lineCol|
                                                                    (|String|))
                                                               (|:| |fillCol|
                                                                    (|String|))
                                                               (|:|
                                                                |matOpacity|
                                                                (|DoubleFloat|))))
                                                         (|:| |text|
                                                              (|Record|
                                                               (|:| |txt|
                                                                    (|String|))
                                                               (|:| |siz|
                                                                    (|NonNegativeInteger|))
                                                               (|:| |pos|
                                                                    (QREFELT $
                                                                             6))
                                                               (|:| |np|
                                                                    (|List|
                                                                     (|String|)))))
                                                         (|:| |boundbox|
                                                              (|SBoundary|
                                                               (QREFELT $ 6)))
                                                         (|:| |trans|
                                                              (|STransform|
                                                               (QREFELT $ 6)))
                                                         (|:| |ifs|
                                                              (|Record|
                                                               (|:| |inx|
                                                                    (|List|
                                                                     (|List|
                                                                      (|NonNegativeInteger|))))
                                                               (|:| |pts|
                                                                    (|List|
                                                                     (QREFELT $
                                                                              6)))))
                                                         (|:| |arrws|
                                                              (|Record|
                                                               (|:| |ln|
                                                                    (|List|
                                                                     (|List|
                                                                      (QREFELT
                                                                       $ 6))))
                                                               (|:| |mode|
                                                                    (|Symbol|))
                                                               (|:| |size|
                                                                    (|DoubleFloat|))))
                                                         (|:| |arrw|
                                                              (|Record|
                                                               (|:| |st|
                                                                    (|String|))
                                                               (|:| |en|
                                                                    (|String|))
                                                               (|:| |offset|
                                                                    (QREFELT $
                                                                             6))
                                                               (|:| |mode|
                                                                    (|Symbol|))
                                                               (|:| |size|
                                                                    (|DoubleFloat|))))
                                                         (|:| |shpe|
                                                              (|Record|
                                                               (|:| |shptype|
                                                                    (|Symbol|))
                                                               (|:| |centre|
                                                                    (QREFELT $
                                                                             6))
                                                               (|:| |size|
                                                                    (QREFELT $
                                                                             6))
                                                               (|:| |fill|
                                                                    (|Boolean|))))
                                                         (|:| |nodename|
                                                              (|Record|
                                                               (|:| |nme|
                                                                    (|String|))
                                                               (|:| |node| $)))
                                                         (|:| |np|
                                                              (|SceneNamedPoints|
                                                               (QREFELT $ 6)))
                                                         (|:| |empty| #24#))
                                                        #13#))
                                      3)
                                     . #23#)
                               G190
                               (COND
                                ((OR (ATOM #15#)
                                     (PROGN
                                      (LETT |nam| (CAR #15#) . #23#)
                                      NIL))
                                 (GO G191)))
                               (SEQ
                                (LETT |param2|
                                      (SPADCALL |tran|
                                                (SPADCALL
                                                 (SPADCALL |np2| |nam|
                                                           (QREFELT $ 168))
                                                 (QVELT
                                                  (PROG2
                                                      (LETT #13# (QVELT |n| 2)
                                                            . #23#)
                                                      (QCDR #13#)
                                                    (|check_union2|
                                                     (QEQCAR #13# 2)
                                                     (|Record|
                                                      (|:| |txt| (|String|))
                                                      (|:| |siz|
                                                           (|NonNegativeInteger|))
                                                      (|:| |pos| (QREFELT $ 6))
                                                      (|:| |np|
                                                           (|List|
                                                            (|String|))))
                                                     (|Union|
                                                      (|:| |points|
                                                           (|List|
                                                            (|List|
                                                             (QREFELT $ 6))))
                                                      (|:| |material|
                                                           (|Record|
                                                            (|:| |lineWidth|
                                                                 (|DoubleFloat|))
                                                            (|:| |lineCol|
                                                                 (|String|))
                                                            (|:| |fillCol|
                                                                 (|String|))
                                                            (|:| |matOpacity|
                                                                 (|DoubleFloat|))))
                                                      (|:| |text|
                                                           (|Record|
                                                            (|:| |txt|
                                                                 (|String|))
                                                            (|:| |siz|
                                                                 (|NonNegativeInteger|))
                                                            (|:| |pos|
                                                                 (QREFELT $ 6))
                                                            (|:| |np|
                                                                 (|List|
                                                                  (|String|)))))
                                                      (|:| |boundbox|
                                                           (|SBoundary|
                                                            (QREFELT $ 6)))
                                                      (|:| |trans|
                                                           (|STransform|
                                                            (QREFELT $ 6)))
                                                      (|:| |ifs|
                                                           (|Record|
                                                            (|:| |inx|
                                                                 (|List|
                                                                  (|List|
                                                                   (|NonNegativeInteger|))))
                                                            (|:| |pts|
                                                                 (|List|
                                                                  (QREFELT $
                                                                           6)))))
                                                      (|:| |arrws|
                                                           (|Record|
                                                            (|:| |ln|
                                                                 (|List|
                                                                  (|List|
                                                                   (QREFELT $
                                                                            6))))
                                                            (|:| |mode|
                                                                 (|Symbol|))
                                                            (|:| |size|
                                                                 (|DoubleFloat|))))
                                                      (|:| |arrw|
                                                           (|Record|
                                                            (|:| |st|
                                                                 (|String|))
                                                            (|:| |en|
                                                                 (|String|))
                                                            (|:| |offset|
                                                                 (QREFELT $ 6))
                                                            (|:| |mode|
                                                                 (|Symbol|))
                                                            (|:| |size|
                                                                 (|DoubleFloat|))))
                                                      (|:| |shpe|
                                                           (|Record|
                                                            (|:| |shptype|
                                                                 (|Symbol|))
                                                            (|:| |centre|
                                                                 (QREFELT $ 6))
                                                            (|:| |size|
                                                                 (QREFELT $ 6))
                                                            (|:| |fill|
                                                                 (|Boolean|))))
                                                      (|:| |nodename|
                                                           (|Record|
                                                            (|:| |nme|
                                                                 (|String|))
                                                            (|:| |node| $)))
                                                      (|:| |np|
                                                           (|SceneNamedPoints|
                                                            (QREFELT $ 6)))
                                                      (|:| |empty| #24#))
                                                     #13#))
                                                  2)
                                                 (QREFELT $ 103))
                                                (QREFELT $ 149))
                                      . #23#)
                                (LETT |nodeAttsTxt|
                                      (LIST
                                       (SPADCALL "font-size"
                                                 (STRINGIMAGE
                                                  (QVELT
                                                   (PROG2
                                                       (LETT #13# (QVELT |n| 2)
                                                             . #23#)
                                                       (QCDR #13#)
                                                     (|check_union2|
                                                      (QEQCAR #13# 2)
                                                      (|Record|
                                                       (|:| |txt| (|String|))
                                                       (|:| |siz|
                                                            (|NonNegativeInteger|))
                                                       (|:| |pos|
                                                            (QREFELT $ 6))
                                                       (|:| |np|
                                                            (|List|
                                                             (|String|))))
                                                      (|Union|
                                                       (|:| |points|
                                                            (|List|
                                                             (|List|
                                                              (QREFELT $ 6))))
                                                       (|:| |material|
                                                            (|Record|
                                                             (|:| |lineWidth|
                                                                  (|DoubleFloat|))
                                                             (|:| |lineCol|
                                                                  (|String|))
                                                             (|:| |fillCol|
                                                                  (|String|))
                                                             (|:| |matOpacity|
                                                                  (|DoubleFloat|))))
                                                       (|:| |text|
                                                            (|Record|
                                                             (|:| |txt|
                                                                  (|String|))
                                                             (|:| |siz|
                                                                  (|NonNegativeInteger|))
                                                             (|:| |pos|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |np|
                                                                  (|List|
                                                                   (|String|)))))
                                                       (|:| |boundbox|
                                                            (|SBoundary|
                                                             (QREFELT $ 6)))
                                                       (|:| |trans|
                                                            (|STransform|
                                                             (QREFELT $ 6)))
                                                       (|:| |ifs|
                                                            (|Record|
                                                             (|:| |inx|
                                                                  (|List|
                                                                   (|List|
                                                                    (|NonNegativeInteger|))))
                                                             (|:| |pts|
                                                                  (|List|
                                                                   (QREFELT $
                                                                            6)))))
                                                       (|:| |arrws|
                                                            (|Record|
                                                             (|:| |ln|
                                                                  (|List|
                                                                   (|List|
                                                                    (QREFELT $
                                                                             6))))
                                                             (|:| |mode|
                                                                  (|Symbol|))
                                                             (|:| |size|
                                                                  (|DoubleFloat|))))
                                                       (|:| |arrw|
                                                            (|Record|
                                                             (|:| |st|
                                                                  (|String|))
                                                             (|:| |en|
                                                                  (|String|))
                                                             (|:| |offset|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |mode|
                                                                  (|Symbol|))
                                                             (|:| |size|
                                                                  (|DoubleFloat|))))
                                                       (|:| |shpe|
                                                            (|Record|
                                                             (|:| |shptype|
                                                                  (|Symbol|))
                                                             (|:| |centre|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |size|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |fill|
                                                                  (|Boolean|))))
                                                       (|:| |nodename|
                                                            (|Record|
                                                             (|:| |nme|
                                                                  (|String|))
                                                             (|:| |node| $)))
                                                       (|:| |np|
                                                            (|SceneNamedPoints|
                                                             (QREFELT $ 6)))
                                                       (|:| |empty| #24#))
                                                      #13#))
                                                   1))
                                                 (QREFELT $ 158))
                                       (SPADCALL "x"
                                                 (|mathObject2String|
                                                  (|mul_DF|
                                                   (SPADCALL |param2|
                                                             (QREFELT $ 81))
                                                   |scale2|))
                                                 (QREFELT $ 158))
                                       (SPADCALL "y"
                                                 (|mathObject2String|
                                                  (|minus_DF|
                                                   (|mul_DF|
                                                    (SPADCALL |param2|
                                                              (QREFELT $ 82))
                                                    |scale2|)))
                                                 (QREFELT $ 158))
                                       (SPADCALL "style"
                                                 (STRCONC "fill:"
                                                          (QVELT |mat2| 2))
                                                 (QREFELT $ 158)))
                                      . #23#)
                                (LETT |xch|
                                      (SPADCALL |nodeName| |nam| |nodeAttsTxt|
                                                (QREFELT $ 169))
                                      . #23#)
                                (EXIT
                                 (COND
                                  ((NULL (SPADCALL |xch| (QREFELT $ 170)))
                                   (LETT |nodeEles|
                                         (SPADCALL |nodeEles| |xch|
                                                   (QREFELT $ 163))
                                         . #23#)))))
                               (LETT #15# (CDR #15#) . #23#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT
                           (PROGN
                            (LETT #9#
                                  (SPADCALL "g" |nodeEles| |nodeAtts|
                                            (QREFELT $ 161))
                                  . #23#)
                            (GO #26=#:G1703))))))
                       (LETT |param2|
                             (SPADCALL |tran|
                                       (QVELT
                                        (PROG2 (LETT #13# (QVELT |n| 2) . #23#)
                                            (QCDR #13#)
                                          (|check_union2| (QEQCAR #13# 2)
                                                          (|Record|
                                                           (|:| |txt|
                                                                (|String|))
                                                           (|:| |siz|
                                                                (|NonNegativeInteger|))
                                                           (|:| |pos|
                                                                (QREFELT $ 6))
                                                           (|:| |np|
                                                                (|List|
                                                                 (|String|))))
                                                          (|Union|
                                                           (|:| |points|
                                                                (|List|
                                                                 (|List|
                                                                  (QREFELT $
                                                                           6))))
                                                           (|:| |material|
                                                                (|Record|
                                                                 (|:|
                                                                  |lineWidth|
                                                                  (|DoubleFloat|))
                                                                 (|:| |lineCol|
                                                                      (|String|))
                                                                 (|:| |fillCol|
                                                                      (|String|))
                                                                 (|:|
                                                                  |matOpacity|
                                                                  (|DoubleFloat|))))
                                                           (|:| |text|
                                                                (|Record|
                                                                 (|:| |txt|
                                                                      (|String|))
                                                                 (|:| |siz|
                                                                      (|NonNegativeInteger|))
                                                                 (|:| |pos|
                                                                      (QREFELT
                                                                       $ 6))
                                                                 (|:| |np|
                                                                      (|List|
                                                                       (|String|)))))
                                                           (|:| |boundbox|
                                                                (|SBoundary|
                                                                 (QREFELT $
                                                                          6)))
                                                           (|:| |trans|
                                                                (|STransform|
                                                                 (QREFELT $
                                                                          6)))
                                                           (|:| |ifs|
                                                                (|Record|
                                                                 (|:| |inx|
                                                                      (|List|
                                                                       (|List|
                                                                        (|NonNegativeInteger|))))
                                                                 (|:| |pts|
                                                                      (|List|
                                                                       (QREFELT
                                                                        $
                                                                        6)))))
                                                           (|:| |arrws|
                                                                (|Record|
                                                                 (|:| |ln|
                                                                      (|List|
                                                                       (|List|
                                                                        (QREFELT
                                                                         $
                                                                         6))))
                                                                 (|:| |mode|
                                                                      (|Symbol|))
                                                                 (|:| |size|
                                                                      (|DoubleFloat|))))
                                                           (|:| |arrw|
                                                                (|Record|
                                                                 (|:| |st|
                                                                      (|String|))
                                                                 (|:| |en|
                                                                      (|String|))
                                                                 (|:| |offset|
                                                                      (QREFELT
                                                                       $ 6))
                                                                 (|:| |mode|
                                                                      (|Symbol|))
                                                                 (|:| |size|
                                                                      (|DoubleFloat|))))
                                                           (|:| |shpe|
                                                                (|Record|
                                                                 (|:| |shptype|
                                                                      (|Symbol|))
                                                                 (|:| |centre|
                                                                      (QREFELT
                                                                       $ 6))
                                                                 (|:| |size|
                                                                      (QREFELT
                                                                       $ 6))
                                                                 (|:| |fill|
                                                                      (|Boolean|))))
                                                           (|:| |nodename|
                                                                (|Record|
                                                                 (|:| |nme|
                                                                      (|String|))
                                                                 (|:| |node|
                                                                      $)))
                                                           (|:| |np|
                                                                (|SceneNamedPoints|
                                                                 (QREFELT $
                                                                          6)))
                                                           (|:| |empty| #24#))
                                                          #13#))
                                        2)
                                       (QREFELT $ 149))
                             . #23#)
                       (LETT |nodeAtts|
                             (LIST
                              (SPADCALL "font-size"
                                        (STRINGIMAGE
                                         (QVELT
                                          (PROG2
                                              (LETT #13# (QVELT |n| 2) . #23#)
                                              (QCDR #13#)
                                            (|check_union2| (QEQCAR #13# 2)
                                                            (|Record|
                                                             (|:| |txt|
                                                                  (|String|))
                                                             (|:| |siz|
                                                                  (|NonNegativeInteger|))
                                                             (|:| |pos|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |np|
                                                                  (|List|
                                                                   (|String|))))
                                                            (|Union|
                                                             (|:| |points|
                                                                  (|List|
                                                                   (|List|
                                                                    (QREFELT $
                                                                             6))))
                                                             (|:| |material|
                                                                  (|Record|
                                                                   (|:|
                                                                    |lineWidth|
                                                                    (|DoubleFloat|))
                                                                   (|:|
                                                                    |lineCol|
                                                                    (|String|))
                                                                   (|:|
                                                                    |fillCol|
                                                                    (|String|))
                                                                   (|:|
                                                                    |matOpacity|
                                                                    (|DoubleFloat|))))
                                                             (|:| |text|
                                                                  (|Record|
                                                                   (|:| |txt|
                                                                        (|String|))
                                                                   (|:| |siz|
                                                                        (|NonNegativeInteger|))
                                                                   (|:| |pos|
                                                                        (QREFELT
                                                                         $ 6))
                                                                   (|:| |np|
                                                                        (|List|
                                                                         (|String|)))))
                                                             (|:| |boundbox|
                                                                  (|SBoundary|
                                                                   (QREFELT $
                                                                            6)))
                                                             (|:| |trans|
                                                                  (|STransform|
                                                                   (QREFELT $
                                                                            6)))
                                                             (|:| |ifs|
                                                                  (|Record|
                                                                   (|:| |inx|
                                                                        (|List|
                                                                         (|List|
                                                                          (|NonNegativeInteger|))))
                                                                   (|:| |pts|
                                                                        (|List|
                                                                         (QREFELT
                                                                          $
                                                                          6)))))
                                                             (|:| |arrws|
                                                                  (|Record|
                                                                   (|:| |ln|
                                                                        (|List|
                                                                         (|List|
                                                                          (QREFELT
                                                                           $
                                                                           6))))
                                                                   (|:| |mode|
                                                                        (|Symbol|))
                                                                   (|:| |size|
                                                                        (|DoubleFloat|))))
                                                             (|:| |arrw|
                                                                  (|Record|
                                                                   (|:| |st|
                                                                        (|String|))
                                                                   (|:| |en|
                                                                        (|String|))
                                                                   (|:|
                                                                    |offset|
                                                                    (QREFELT $
                                                                             6))
                                                                   (|:| |mode|
                                                                        (|Symbol|))
                                                                   (|:| |size|
                                                                        (|DoubleFloat|))))
                                                             (|:| |shpe|
                                                                  (|Record|
                                                                   (|:|
                                                                    |shptype|
                                                                    (|Symbol|))
                                                                   (|:|
                                                                    |centre|
                                                                    (QREFELT $
                                                                             6))
                                                                   (|:| |size|
                                                                        (QREFELT
                                                                         $ 6))
                                                                   (|:| |fill|
                                                                        (|Boolean|))))
                                                             (|:| |nodename|
                                                                  (|Record|
                                                                   (|:| |nme|
                                                                        (|String|))
                                                                   (|:| |node|
                                                                        $)))
                                                             (|:| |np|
                                                                  (|SceneNamedPoints|
                                                                   (QREFELT $
                                                                            6)))
                                                             (|:| |empty|
                                                                  #24#))
                                                            #13#))
                                          1))
                                        (QREFELT $ 158))
                              (SPADCALL "x"
                                        (|mathObject2String|
                                         (|mul_DF|
                                          (SPADCALL |param2| (QREFELT $ 81))
                                          |scale2|))
                                        (QREFELT $ 158))
                              (SPADCALL "y"
                                        (|mathObject2String|
                                         (|minus_DF|
                                          (|mul_DF|
                                           (SPADCALL |param2| (QREFELT $ 82))
                                           |scale2|)))
                                        (QREFELT $ 158))
                              (SPADCALL "style"
                                        (STRCONC "fill:" (QVELT |mat2| 2))
                                        (QREFELT $ 158)))
                             . #23#)
                       (EXIT
                        (PROGN
                         (LETT #9#
                               (SPADCALL |nodeName|
                                         (QVELT
                                          (PROG2
                                              (LETT #13# (QVELT |n| 2) . #23#)
                                              (QCDR #13#)
                                            (|check_union2| (QEQCAR #13# 2)
                                                            (|Record|
                                                             (|:| |txt|
                                                                  (|String|))
                                                             (|:| |siz|
                                                                  (|NonNegativeInteger|))
                                                             (|:| |pos|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |np|
                                                                  (|List|
                                                                   (|String|))))
                                                            (|Union|
                                                             (|:| |points|
                                                                  (|List|
                                                                   (|List|
                                                                    (QREFELT $
                                                                             6))))
                                                             (|:| |material|
                                                                  (|Record|
                                                                   (|:|
                                                                    |lineWidth|
                                                                    (|DoubleFloat|))
                                                                   (|:|
                                                                    |lineCol|
                                                                    (|String|))
                                                                   (|:|
                                                                    |fillCol|
                                                                    (|String|))
                                                                   (|:|
                                                                    |matOpacity|
                                                                    (|DoubleFloat|))))
                                                             (|:| |text|
                                                                  (|Record|
                                                                   (|:| |txt|
                                                                        (|String|))
                                                                   (|:| |siz|
                                                                        (|NonNegativeInteger|))
                                                                   (|:| |pos|
                                                                        (QREFELT
                                                                         $ 6))
                                                                   (|:| |np|
                                                                        (|List|
                                                                         (|String|)))))
                                                             (|:| |boundbox|
                                                                  (|SBoundary|
                                                                   (QREFELT $
                                                                            6)))
                                                             (|:| |trans|
                                                                  (|STransform|
                                                                   (QREFELT $
                                                                            6)))
                                                             (|:| |ifs|
                                                                  (|Record|
                                                                   (|:| |inx|
                                                                        (|List|
                                                                         (|List|
                                                                          (|NonNegativeInteger|))))
                                                                   (|:| |pts|
                                                                        (|List|
                                                                         (QREFELT
                                                                          $
                                                                          6)))))
                                                             (|:| |arrws|
                                                                  (|Record|
                                                                   (|:| |ln|
                                                                        (|List|
                                                                         (|List|
                                                                          (QREFELT
                                                                           $
                                                                           6))))
                                                                   (|:| |mode|
                                                                        (|Symbol|))
                                                                   (|:| |size|
                                                                        (|DoubleFloat|))))
                                                             (|:| |arrw|
                                                                  (|Record|
                                                                   (|:| |st|
                                                                        (|String|))
                                                                   (|:| |en|
                                                                        (|String|))
                                                                   (|:|
                                                                    |offset|
                                                                    (QREFELT $
                                                                             6))
                                                                   (|:| |mode|
                                                                        (|Symbol|))
                                                                   (|:| |size|
                                                                        (|DoubleFloat|))))
                                                             (|:| |shpe|
                                                                  (|Record|
                                                                   (|:|
                                                                    |shptype|
                                                                    (|Symbol|))
                                                                   (|:|
                                                                    |centre|
                                                                    (QREFELT $
                                                                             6))
                                                                   (|:| |size|
                                                                        (QREFELT
                                                                         $ 6))
                                                                   (|:| |fill|
                                                                        (|Boolean|))))
                                                             (|:| |nodename|
                                                                  (|Record|
                                                                   (|:| |nme|
                                                                        (|String|))
                                                                   (|:| |node|
                                                                        $)))
                                                             (|:| |np|
                                                                  (|SceneNamedPoints|
                                                                   (QREFELT $
                                                                            6)))
                                                             (|:| |empty|
                                                                  #24#))
                                                            #13#))
                                          0)
                                         |nodeAtts| (QREFELT $ 169))
                               . #23#)
                         (GO #26#))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'TRANSFORM)
                  (SEQ (LETT |nodeName| "g" . #23#)
                       (COND
                        ((NULL (QEQCAR (QVELT |n| 2) 4))
                         (|error|
                          "toSVG parameter type not valid for trans node")))
                       (EXIT
                        (LETT |tran2|
                              (SPADCALL
                               (PROG2 (LETT #12# (QVELT |n| 2) . #23#)
                                   (QCDR #12#)
                                 (|check_union2| (QEQCAR #12# 4)
                                                 (|STransform| (QREFELT $ 6))
                                                 (|Union|
                                                  (|:| |points|
                                                       (|List|
                                                        (|List|
                                                         (QREFELT $ 6))))
                                                  (|:| |material|
                                                       (|Record|
                                                        (|:| |lineWidth|
                                                             (|DoubleFloat|))
                                                        (|:| |lineCol|
                                                             (|String|))
                                                        (|:| |fillCol|
                                                             (|String|))
                                                        (|:| |matOpacity|
                                                             (|DoubleFloat|))))
                                                  (|:| |text|
                                                       (|Record|
                                                        (|:| |txt| (|String|))
                                                        (|:| |siz|
                                                             (|NonNegativeInteger|))
                                                        (|:| |pos|
                                                             (QREFELT $ 6))
                                                        (|:| |np|
                                                             (|List|
                                                              (|String|)))))
                                                  (|:| |boundbox|
                                                       (|SBoundary|
                                                        (QREFELT $ 6)))
                                                  (|:| |trans|
                                                       (|STransform|
                                                        (QREFELT $ 6)))
                                                  (|:| |ifs|
                                                       (|Record|
                                                        (|:| |inx|
                                                             (|List|
                                                              (|List|
                                                               (|NonNegativeInteger|))))
                                                        (|:| |pts|
                                                             (|List|
                                                              (QREFELT $ 6)))))
                                                  (|:| |arrws|
                                                       (|Record|
                                                        (|:| |ln|
                                                             (|List|
                                                              (|List|
                                                               (QREFELT $ 6))))
                                                        (|:| |mode| (|Symbol|))
                                                        (|:| |size|
                                                             (|DoubleFloat|))))
                                                  (|:| |arrw|
                                                       (|Record|
                                                        (|:| |st| (|String|))
                                                        (|:| |en| (|String|))
                                                        (|:| |offset|
                                                             (QREFELT $ 6))
                                                        (|:| |mode| (|Symbol|))
                                                        (|:| |size|
                                                             (|DoubleFloat|))))
                                                  (|:| |shpe|
                                                       (|Record|
                                                        (|:| |shptype|
                                                             (|Symbol|))
                                                        (|:| |centre|
                                                             (QREFELT $ 6))
                                                        (|:| |size|
                                                             (QREFELT $ 6))
                                                        (|:| |fill|
                                                             (|Boolean|))))
                                                  (|:| |nodename|
                                                       (|Record|
                                                        (|:| |nme| (|String|))
                                                        (|:| |node| $)))
                                                  (|:| |np|
                                                       (|SceneNamedPoints|
                                                        (QREFELT $ 6)))
                                                  (|:| |empty| #24#))
                                                 #12#))
                               |tran| (QREFELT $ 171))
                              . #23#)))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'CLIP)
                  (SEQ (LETT |nodeName| "g" . #23#) (LETT |clipEn2| 'T . #23#)
                       (COND
                        ((NULL (QEQCAR (QVELT |n| 2) 3))
                         (|error|
                          "toSVG parameter type not valid for clip node")))
                       (EXIT
                        (LETT |bb2|
                              (PROG2 (LETT #11# (QVELT |n| 2) . #23#)
                                  (QCDR #11#)
                                (|check_union2| (QEQCAR #11# 3)
                                                (|SBoundary| (QREFELT $ 6))
                                                (|Union|
                                                 (|:| |points|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |material|
                                                      (|Record|
                                                       (|:| |lineWidth|
                                                            (|DoubleFloat|))
                                                       (|:| |lineCol|
                                                            (|String|))
                                                       (|:| |fillCol|
                                                            (|String|))
                                                       (|:| |matOpacity|
                                                            (|DoubleFloat|))))
                                                 (|:| |text|
                                                      (|Record|
                                                       (|:| |txt| (|String|))
                                                       (|:| |siz|
                                                            (|NonNegativeInteger|))
                                                       (|:| |pos|
                                                            (QREFELT $ 6))
                                                       (|:| |np|
                                                            (|List|
                                                             (|String|)))))
                                                 (|:| |boundbox|
                                                      (|SBoundary|
                                                       (QREFELT $ 6)))
                                                 (|:| |trans|
                                                      (|STransform|
                                                       (QREFELT $ 6)))
                                                 (|:| |ifs|
                                                      (|Record|
                                                       (|:| |inx|
                                                            (|List|
                                                             (|List|
                                                              (|NonNegativeInteger|))))
                                                       (|:| |pts|
                                                            (|List|
                                                             (QREFELT $ 6)))))
                                                 (|:| |arrws|
                                                      (|Record|
                                                       (|:| |ln|
                                                            (|List|
                                                             (|List|
                                                              (QREFELT $ 6))))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                                 (|:| |arrw|
                                                      (|Record|
                                                       (|:| |st| (|String|))
                                                       (|:| |en| (|String|))
                                                       (|:| |offset|
                                                            (QREFELT $ 6))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                                 (|:| |shpe|
                                                      (|Record|
                                                       (|:| |shptype|
                                                            (|Symbol|))
                                                       (|:| |centre|
                                                            (QREFELT $ 6))
                                                       (|:| |size|
                                                            (QREFELT $ 6))
                                                       (|:| |fill|
                                                            (|Boolean|))))
                                                 (|:| |nodename|
                                                      (|Record|
                                                       (|:| |nme| (|String|))
                                                       (|:| |node| $)))
                                                 (|:| |np|
                                                      (|SceneNamedPoints|
                                                       (QREFELT $ 6)))
                                                 (|:| |empty| #24#))
                                                #11#))
                              . #23#)))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'IFS)
                  (SEQ (LETT |nodeName| "path" . #23#)
                       (COND
                        ((NULL (QEQCAR (QVELT |n| 2) 5))
                         (|error|
                          "toSVG parameter type not valid for ifs node")))
                       (LETT |nodeAtts|
                             (LIST
                              (SPADCALL "d"
                                        (|SCENE;faceString|
                                         (PROG2
                                             (LETT #10# (QVELT |n| 2) . #23#)
                                             (QCDR #10#)
                                           (|check_union2| (QEQCAR #10# 5)
                                                           (|Record|
                                                            (|:| |inx|
                                                                 (|List|
                                                                  (|List|
                                                                   (|NonNegativeInteger|))))
                                                            (|:| |pts|
                                                                 (|List|
                                                                  (QREFELT $
                                                                           6))))
                                                           (|Union|
                                                            (|:| |points|
                                                                 (|List|
                                                                  (|List|
                                                                   (QREFELT $
                                                                            6))))
                                                            (|:| |material|
                                                                 (|Record|
                                                                  (|:|
                                                                   |lineWidth|
                                                                   (|DoubleFloat|))
                                                                  (|:|
                                                                   |lineCol|
                                                                   (|String|))
                                                                  (|:|
                                                                   |fillCol|
                                                                   (|String|))
                                                                  (|:|
                                                                   |matOpacity|
                                                                   (|DoubleFloat|))))
                                                            (|:| |text|
                                                                 (|Record|
                                                                  (|:| |txt|
                                                                       (|String|))
                                                                  (|:| |siz|
                                                                       (|NonNegativeInteger|))
                                                                  (|:| |pos|
                                                                       (QREFELT
                                                                        $ 6))
                                                                  (|:| |np|
                                                                       (|List|
                                                                        (|String|)))))
                                                            (|:| |boundbox|
                                                                 (|SBoundary|
                                                                  (QREFELT $
                                                                           6)))
                                                            (|:| |trans|
                                                                 (|STransform|
                                                                  (QREFELT $
                                                                           6)))
                                                            (|:| |ifs|
                                                                 (|Record|
                                                                  (|:| |inx|
                                                                       (|List|
                                                                        (|List|
                                                                         (|NonNegativeInteger|))))
                                                                  (|:| |pts|
                                                                       (|List|
                                                                        (QREFELT
                                                                         $
                                                                         6)))))
                                                            (|:| |arrws|
                                                                 (|Record|
                                                                  (|:| |ln|
                                                                       (|List|
                                                                        (|List|
                                                                         (QREFELT
                                                                          $
                                                                          6))))
                                                                  (|:| |mode|
                                                                       (|Symbol|))
                                                                  (|:| |size|
                                                                       (|DoubleFloat|))))
                                                            (|:| |arrw|
                                                                 (|Record|
                                                                  (|:| |st|
                                                                       (|String|))
                                                                  (|:| |en|
                                                                       (|String|))
                                                                  (|:| |offset|
                                                                       (QREFELT
                                                                        $ 6))
                                                                  (|:| |mode|
                                                                       (|Symbol|))
                                                                  (|:| |size|
                                                                       (|DoubleFloat|))))
                                                            (|:| |shpe|
                                                                 (|Record|
                                                                  (|:|
                                                                   |shptype|
                                                                   (|Symbol|))
                                                                  (|:| |centre|
                                                                       (QREFELT
                                                                        $ 6))
                                                                  (|:| |size|
                                                                       (QREFELT
                                                                        $ 6))
                                                                  (|:| |fill|
                                                                       (|Boolean|))))
                                                            (|:| |nodename|
                                                                 (|Record|
                                                                  (|:| |nme|
                                                                       (|String|))
                                                                  (|:| |node|
                                                                       $)))
                                                            (|:| |np|
                                                                 (|SceneNamedPoints|
                                                                  (QREFELT $
                                                                           6)))
                                                            (|:| |empty| #24#))
                                                           #10#))
                                         |tran2| |bb2| |scale2| |clipEn2| $)
                                        (QREFELT $ 158))
                              (SPADCALL "fill" (QVELT |mat2| 2)
                                        (QREFELT $ 158))
                              (SPADCALL "stroke" (QVELT |mat2| 1)
                                        (QREFELT $ 158))
                              (SPADCALL "stroke-width"
                                        (|mathObject2String| (QVELT |mat2| 0))
                                        (QREFELT $ 158)))
                             . #23#)
                       (EXIT
                        (PROGN
                         (LETT #9#
                               (SPADCALL |nodeName| NIL |nodeAtts|
                                         (QREFELT $ 161))
                               . #23#)
                         (GO #26#))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'ARROWS)
                  (SEQ (LETT |nodeName| "g" . #23#)
                       (COND
                        ((NULL (QEQCAR (QVELT |n| 2) 6))
                         (|error|
                          "toSVG parameter type not valid for arrws node")))
                       (EXIT
                        (LETT |nodeEles|
                              (|SCENE;lineArrow|
                               (QVELT
                                (PROG2 (LETT #8# (QVELT |n| 2) . #23#)
                                    (QCDR #8#)
                                  (|check_union2| (QEQCAR #8# 6)
                                                  (|Record|
                                                   (|:| |ln|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT $ 6))))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|)))
                                                  (|Union|
                                                   (|:| |points|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT $ 6))))
                                                   (|:| |material|
                                                        (|Record|
                                                         (|:| |lineWidth|
                                                              (|DoubleFloat|))
                                                         (|:| |lineCol|
                                                              (|String|))
                                                         (|:| |fillCol|
                                                              (|String|))
                                                         (|:| |matOpacity|
                                                              (|DoubleFloat|))))
                                                   (|:| |text|
                                                        (|Record|
                                                         (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                                   (|:| |boundbox|
                                                        (|SBoundary|
                                                         (QREFELT $ 6)))
                                                   (|:| |trans|
                                                        (|STransform|
                                                         (QREFELT $ 6)))
                                                   (|:| |ifs|
                                                        (|Record|
                                                         (|:| |inx|
                                                              (|List|
                                                               (|List|
                                                                (|NonNegativeInteger|))))
                                                         (|:| |pts|
                                                              (|List|
                                                               (QREFELT $
                                                                        6)))))
                                                   (|:| |arrws|
                                                        (|Record|
                                                         (|:| |ln|
                                                              (|List|
                                                               (|List|
                                                                (QREFELT $
                                                                         6))))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                                   (|:| |arrw|
                                                        (|Record|
                                                         (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                                   (|:| |shpe|
                                                        (|Record|
                                                         (|:| |shptype|
                                                              (|Symbol|))
                                                         (|:| |centre|
                                                              (QREFELT $ 6))
                                                         (|:| |size|
                                                              (QREFELT $ 6))
                                                         (|:| |fill|
                                                              (|Boolean|))))
                                                   (|:| |nodename|
                                                        (|Record|
                                                         (|:| |nme| (|String|))
                                                         (|:| |node| $)))
                                                   (|:| |np|
                                                        (|SceneNamedPoints|
                                                         (QREFELT $ 6)))
                                                   (|:| |empty| #24#))
                                                  #8#))
                                0)
                               |tran2| |bb2| |mat2| |scale2| |clipEn2|
                               (QVELT
                                (PROG2 (LETT #8# (QVELT |n| 2) . #23#)
                                    (QCDR #8#)
                                  (|check_union2| (QEQCAR #8# 6)
                                                  (|Record|
                                                   (|:| |ln|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT $ 6))))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|)))
                                                  (|Union|
                                                   (|:| |points|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT $ 6))))
                                                   (|:| |material|
                                                        (|Record|
                                                         (|:| |lineWidth|
                                                              (|DoubleFloat|))
                                                         (|:| |lineCol|
                                                              (|String|))
                                                         (|:| |fillCol|
                                                              (|String|))
                                                         (|:| |matOpacity|
                                                              (|DoubleFloat|))))
                                                   (|:| |text|
                                                        (|Record|
                                                         (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                                   (|:| |boundbox|
                                                        (|SBoundary|
                                                         (QREFELT $ 6)))
                                                   (|:| |trans|
                                                        (|STransform|
                                                         (QREFELT $ 6)))
                                                   (|:| |ifs|
                                                        (|Record|
                                                         (|:| |inx|
                                                              (|List|
                                                               (|List|
                                                                (|NonNegativeInteger|))))
                                                         (|:| |pts|
                                                              (|List|
                                                               (QREFELT $
                                                                        6)))))
                                                   (|:| |arrws|
                                                        (|Record|
                                                         (|:| |ln|
                                                              (|List|
                                                               (|List|
                                                                (QREFELT $
                                                                         6))))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                                   (|:| |arrw|
                                                        (|Record|
                                                         (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                                   (|:| |shpe|
                                                        (|Record|
                                                         (|:| |shptype|
                                                              (|Symbol|))
                                                         (|:| |centre|
                                                              (QREFELT $ 6))
                                                         (|:| |size|
                                                              (QREFELT $ 6))
                                                         (|:| |fill|
                                                              (|Boolean|))))
                                                   (|:| |nodename|
                                                        (|Record|
                                                         (|:| |nme| (|String|))
                                                         (|:| |node| $)))
                                                   (|:| |np|
                                                        (|SceneNamedPoints|
                                                         (QREFELT $ 6)))
                                                   (|:| |empty| #24#))
                                                  #8#))
                                1)
                               (QVELT
                                (PROG2 (LETT #8# (QVELT |n| 2) . #23#)
                                    (QCDR #8#)
                                  (|check_union2| (QEQCAR #8# 6)
                                                  (|Record|
                                                   (|:| |ln|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT $ 6))))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|)))
                                                  (|Union|
                                                   (|:| |points|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT $ 6))))
                                                   (|:| |material|
                                                        (|Record|
                                                         (|:| |lineWidth|
                                                              (|DoubleFloat|))
                                                         (|:| |lineCol|
                                                              (|String|))
                                                         (|:| |fillCol|
                                                              (|String|))
                                                         (|:| |matOpacity|
                                                              (|DoubleFloat|))))
                                                   (|:| |text|
                                                        (|Record|
                                                         (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                                   (|:| |boundbox|
                                                        (|SBoundary|
                                                         (QREFELT $ 6)))
                                                   (|:| |trans|
                                                        (|STransform|
                                                         (QREFELT $ 6)))
                                                   (|:| |ifs|
                                                        (|Record|
                                                         (|:| |inx|
                                                              (|List|
                                                               (|List|
                                                                (|NonNegativeInteger|))))
                                                         (|:| |pts|
                                                              (|List|
                                                               (QREFELT $
                                                                        6)))))
                                                   (|:| |arrws|
                                                        (|Record|
                                                         (|:| |ln|
                                                              (|List|
                                                               (|List|
                                                                (QREFELT $
                                                                         6))))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                                   (|:| |arrw|
                                                        (|Record|
                                                         (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                                   (|:| |shpe|
                                                        (|Record|
                                                         (|:| |shptype|
                                                              (|Symbol|))
                                                         (|:| |centre|
                                                              (QREFELT $ 6))
                                                         (|:| |size|
                                                              (QREFELT $ 6))
                                                         (|:| |fill|
                                                              (|Boolean|))))
                                                   (|:| |nodename|
                                                        (|Record|
                                                         (|:| |nme| (|String|))
                                                         (|:| |node| $)))
                                                   (|:| |np|
                                                        (|SceneNamedPoints|
                                                         (QREFELT $ 6)))
                                                   (|:| |empty| #24#))
                                                  #8#))
                                2)
                               $)
                              . #23#)))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'ARROW)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 7))
                     (|error| "toSVG parameter type not valid for arrw node")))
                   (LETT |startPoint|
                         (SPADCALL |tran|
                                   (SPADCALL
                                    (SPADCALL |np2|
                                              (QVELT
                                               (PROG2
                                                   (LETT #5# (QVELT |n| 2)
                                                         . #23#)
                                                   (QCDR #5#)
                                                 (|check_union2| (QEQCAR #5# 7)
                                                                 (|Record|
                                                                  (|:| |st|
                                                                       (|String|))
                                                                  (|:| |en|
                                                                       (|String|))
                                                                  (|:| |offset|
                                                                       (QREFELT
                                                                        $ 6))
                                                                  (|:| |mode|
                                                                       (|Symbol|))
                                                                  (|:| |size|
                                                                       (|DoubleFloat|)))
                                                                 (|Union|
                                                                  (|:| |points|
                                                                       (|List|
                                                                        (|List|
                                                                         (QREFELT
                                                                          $
                                                                          6))))
                                                                  (|:|
                                                                   |material|
                                                                   (|Record|
                                                                    (|:|
                                                                     |lineWidth|
                                                                     (|DoubleFloat|))
                                                                    (|:|
                                                                     |lineCol|
                                                                     (|String|))
                                                                    (|:|
                                                                     |fillCol|
                                                                     (|String|))
                                                                    (|:|
                                                                     |matOpacity|
                                                                     (|DoubleFloat|))))
                                                                  (|:| |text|
                                                                       (|Record|
                                                                        (|:|
                                                                         |txt|
                                                                         (|String|))
                                                                        (|:|
                                                                         |siz|
                                                                         (|NonNegativeInteger|))
                                                                        (|:|
                                                                         |pos|
                                                                         (QREFELT
                                                                          $ 6))
                                                                        (|:|
                                                                         |np|
                                                                         (|List|
                                                                          (|String|)))))
                                                                  (|:|
                                                                   |boundbox|
                                                                   (|SBoundary|
                                                                    (QREFELT $
                                                                             6)))
                                                                  (|:| |trans|
                                                                       (|STransform|
                                                                        (QREFELT
                                                                         $ 6)))
                                                                  (|:| |ifs|
                                                                       (|Record|
                                                                        (|:|
                                                                         |inx|
                                                                         (|List|
                                                                          (|List|
                                                                           (|NonNegativeInteger|))))
                                                                        (|:|
                                                                         |pts|
                                                                         (|List|
                                                                          (QREFELT
                                                                           $
                                                                           6)))))
                                                                  (|:| |arrws|
                                                                       (|Record|
                                                                        (|:|
                                                                         |ln|
                                                                         (|List|
                                                                          (|List|
                                                                           (QREFELT
                                                                            $
                                                                            6))))
                                                                        (|:|
                                                                         |mode|
                                                                         (|Symbol|))
                                                                        (|:|
                                                                         |size|
                                                                         (|DoubleFloat|))))
                                                                  (|:| |arrw|
                                                                       (|Record|
                                                                        (|:|
                                                                         |st|
                                                                         (|String|))
                                                                        (|:|
                                                                         |en|
                                                                         (|String|))
                                                                        (|:|
                                                                         |offset|
                                                                         (QREFELT
                                                                          $ 6))
                                                                        (|:|
                                                                         |mode|
                                                                         (|Symbol|))
                                                                        (|:|
                                                                         |size|
                                                                         (|DoubleFloat|))))
                                                                  (|:| |shpe|
                                                                       (|Record|
                                                                        (|:|
                                                                         |shptype|
                                                                         (|Symbol|))
                                                                        (|:|
                                                                         |centre|
                                                                         (QREFELT
                                                                          $ 6))
                                                                        (|:|
                                                                         |size|
                                                                         (QREFELT
                                                                          $ 6))
                                                                        (|:|
                                                                         |fill|
                                                                         (|Boolean|))))
                                                                  (|:|
                                                                   |nodename|
                                                                   (|Record|
                                                                    (|:| |nme|
                                                                         (|String|))
                                                                    (|:| |node|
                                                                         $)))
                                                                  (|:| |np|
                                                                       (|SceneNamedPoints|
                                                                        (QREFELT
                                                                         $ 6)))
                                                                  (|:| |empty|
                                                                       #24#))
                                                                 #5#))
                                               0)
                                              (QREFELT $ 168))
                                    (QVELT
                                     (PROG2 (LETT #5# (QVELT |n| 2) . #23#)
                                         (QCDR #5#)
                                       (|check_union2| (QEQCAR #5# 7)
                                                       (|Record|
                                                        (|:| |st| (|String|))
                                                        (|:| |en| (|String|))
                                                        (|:| |offset|
                                                             (QREFELT $ 6))
                                                        (|:| |mode| (|Symbol|))
                                                        (|:| |size|
                                                             (|DoubleFloat|)))
                                                       (|Union|
                                                        (|:| |points|
                                                             (|List|
                                                              (|List|
                                                               (QREFELT $ 6))))
                                                        (|:| |material|
                                                             (|Record|
                                                              (|:| |lineWidth|
                                                                   (|DoubleFloat|))
                                                              (|:| |lineCol|
                                                                   (|String|))
                                                              (|:| |fillCol|
                                                                   (|String|))
                                                              (|:| |matOpacity|
                                                                   (|DoubleFloat|))))
                                                        (|:| |text|
                                                             (|Record|
                                                              (|:| |txt|
                                                                   (|String|))
                                                              (|:| |siz|
                                                                   (|NonNegativeInteger|))
                                                              (|:| |pos|
                                                                   (QREFELT $
                                                                            6))
                                                              (|:| |np|
                                                                   (|List|
                                                                    (|String|)))))
                                                        (|:| |boundbox|
                                                             (|SBoundary|
                                                              (QREFELT $ 6)))
                                                        (|:| |trans|
                                                             (|STransform|
                                                              (QREFELT $ 6)))
                                                        (|:| |ifs|
                                                             (|Record|
                                                              (|:| |inx|
                                                                   (|List|
                                                                    (|List|
                                                                     (|NonNegativeInteger|))))
                                                              (|:| |pts|
                                                                   (|List|
                                                                    (QREFELT $
                                                                             6)))))
                                                        (|:| |arrws|
                                                             (|Record|
                                                              (|:| |ln|
                                                                   (|List|
                                                                    (|List|
                                                                     (QREFELT $
                                                                              6))))
                                                              (|:| |mode|
                                                                   (|Symbol|))
                                                              (|:| |size|
                                                                   (|DoubleFloat|))))
                                                        (|:| |arrw|
                                                             (|Record|
                                                              (|:| |st|
                                                                   (|String|))
                                                              (|:| |en|
                                                                   (|String|))
                                                              (|:| |offset|
                                                                   (QREFELT $
                                                                            6))
                                                              (|:| |mode|
                                                                   (|Symbol|))
                                                              (|:| |size|
                                                                   (|DoubleFloat|))))
                                                        (|:| |shpe|
                                                             (|Record|
                                                              (|:| |shptype|
                                                                   (|Symbol|))
                                                              (|:| |centre|
                                                                   (QREFELT $
                                                                            6))
                                                              (|:| |size|
                                                                   (QREFELT $
                                                                            6))
                                                              (|:| |fill|
                                                                   (|Boolean|))))
                                                        (|:| |nodename|
                                                             (|Record|
                                                              (|:| |nme|
                                                                   (|String|))
                                                              (|:| |node| $)))
                                                        (|:| |np|
                                                             (|SceneNamedPoints|
                                                              (QREFELT $ 6)))
                                                        (|:| |empty| #24#))
                                                       #5#))
                                     2)
                                    (QREFELT $ 103))
                                   (QREFELT $ 149))
                         . #23#)
                   (LETT |endPoint|
                         (SPADCALL |tran|
                                   (SPADCALL
                                    (SPADCALL |np2|
                                              (QVELT
                                               (PROG2
                                                   (LETT #5# (QVELT |n| 2)
                                                         . #23#)
                                                   (QCDR #5#)
                                                 (|check_union2| (QEQCAR #5# 7)
                                                                 (|Record|
                                                                  (|:| |st|
                                                                       (|String|))
                                                                  (|:| |en|
                                                                       (|String|))
                                                                  (|:| |offset|
                                                                       (QREFELT
                                                                        $ 6))
                                                                  (|:| |mode|
                                                                       (|Symbol|))
                                                                  (|:| |size|
                                                                       (|DoubleFloat|)))
                                                                 (|Union|
                                                                  (|:| |points|
                                                                       (|List|
                                                                        (|List|
                                                                         (QREFELT
                                                                          $
                                                                          6))))
                                                                  (|:|
                                                                   |material|
                                                                   (|Record|
                                                                    (|:|
                                                                     |lineWidth|
                                                                     (|DoubleFloat|))
                                                                    (|:|
                                                                     |lineCol|
                                                                     (|String|))
                                                                    (|:|
                                                                     |fillCol|
                                                                     (|String|))
                                                                    (|:|
                                                                     |matOpacity|
                                                                     (|DoubleFloat|))))
                                                                  (|:| |text|
                                                                       (|Record|
                                                                        (|:|
                                                                         |txt|
                                                                         (|String|))
                                                                        (|:|
                                                                         |siz|
                                                                         (|NonNegativeInteger|))
                                                                        (|:|
                                                                         |pos|
                                                                         (QREFELT
                                                                          $ 6))
                                                                        (|:|
                                                                         |np|
                                                                         (|List|
                                                                          (|String|)))))
                                                                  (|:|
                                                                   |boundbox|
                                                                   (|SBoundary|
                                                                    (QREFELT $
                                                                             6)))
                                                                  (|:| |trans|
                                                                       (|STransform|
                                                                        (QREFELT
                                                                         $ 6)))
                                                                  (|:| |ifs|
                                                                       (|Record|
                                                                        (|:|
                                                                         |inx|
                                                                         (|List|
                                                                          (|List|
                                                                           (|NonNegativeInteger|))))
                                                                        (|:|
                                                                         |pts|
                                                                         (|List|
                                                                          (QREFELT
                                                                           $
                                                                           6)))))
                                                                  (|:| |arrws|
                                                                       (|Record|
                                                                        (|:|
                                                                         |ln|
                                                                         (|List|
                                                                          (|List|
                                                                           (QREFELT
                                                                            $
                                                                            6))))
                                                                        (|:|
                                                                         |mode|
                                                                         (|Symbol|))
                                                                        (|:|
                                                                         |size|
                                                                         (|DoubleFloat|))))
                                                                  (|:| |arrw|
                                                                       (|Record|
                                                                        (|:|
                                                                         |st|
                                                                         (|String|))
                                                                        (|:|
                                                                         |en|
                                                                         (|String|))
                                                                        (|:|
                                                                         |offset|
                                                                         (QREFELT
                                                                          $ 6))
                                                                        (|:|
                                                                         |mode|
                                                                         (|Symbol|))
                                                                        (|:|
                                                                         |size|
                                                                         (|DoubleFloat|))))
                                                                  (|:| |shpe|
                                                                       (|Record|
                                                                        (|:|
                                                                         |shptype|
                                                                         (|Symbol|))
                                                                        (|:|
                                                                         |centre|
                                                                         (QREFELT
                                                                          $ 6))
                                                                        (|:|
                                                                         |size|
                                                                         (QREFELT
                                                                          $ 6))
                                                                        (|:|
                                                                         |fill|
                                                                         (|Boolean|))))
                                                                  (|:|
                                                                   |nodename|
                                                                   (|Record|
                                                                    (|:| |nme|
                                                                         (|String|))
                                                                    (|:| |node|
                                                                         $)))
                                                                  (|:| |np|
                                                                       (|SceneNamedPoints|
                                                                        (QREFELT
                                                                         $ 6)))
                                                                  (|:| |empty|
                                                                       #24#))
                                                                 #5#))
                                               1)
                                              (QREFELT $ 168))
                                    (QVELT
                                     (PROG2 (LETT #5# (QVELT |n| 2) . #23#)
                                         (QCDR #5#)
                                       (|check_union2| (QEQCAR #5# 7)
                                                       (|Record|
                                                        (|:| |st| (|String|))
                                                        (|:| |en| (|String|))
                                                        (|:| |offset|
                                                             (QREFELT $ 6))
                                                        (|:| |mode| (|Symbol|))
                                                        (|:| |size|
                                                             (|DoubleFloat|)))
                                                       (|Union|
                                                        (|:| |points|
                                                             (|List|
                                                              (|List|
                                                               (QREFELT $ 6))))
                                                        (|:| |material|
                                                             (|Record|
                                                              (|:| |lineWidth|
                                                                   (|DoubleFloat|))
                                                              (|:| |lineCol|
                                                                   (|String|))
                                                              (|:| |fillCol|
                                                                   (|String|))
                                                              (|:| |matOpacity|
                                                                   (|DoubleFloat|))))
                                                        (|:| |text|
                                                             (|Record|
                                                              (|:| |txt|
                                                                   (|String|))
                                                              (|:| |siz|
                                                                   (|NonNegativeInteger|))
                                                              (|:| |pos|
                                                                   (QREFELT $
                                                                            6))
                                                              (|:| |np|
                                                                   (|List|
                                                                    (|String|)))))
                                                        (|:| |boundbox|
                                                             (|SBoundary|
                                                              (QREFELT $ 6)))
                                                        (|:| |trans|
                                                             (|STransform|
                                                              (QREFELT $ 6)))
                                                        (|:| |ifs|
                                                             (|Record|
                                                              (|:| |inx|
                                                                   (|List|
                                                                    (|List|
                                                                     (|NonNegativeInteger|))))
                                                              (|:| |pts|
                                                                   (|List|
                                                                    (QREFELT $
                                                                             6)))))
                                                        (|:| |arrws|
                                                             (|Record|
                                                              (|:| |ln|
                                                                   (|List|
                                                                    (|List|
                                                                     (QREFELT $
                                                                              6))))
                                                              (|:| |mode|
                                                                   (|Symbol|))
                                                              (|:| |size|
                                                                   (|DoubleFloat|))))
                                                        (|:| |arrw|
                                                             (|Record|
                                                              (|:| |st|
                                                                   (|String|))
                                                              (|:| |en|
                                                                   (|String|))
                                                              (|:| |offset|
                                                                   (QREFELT $
                                                                            6))
                                                              (|:| |mode|
                                                                   (|Symbol|))
                                                              (|:| |size|
                                                                   (|DoubleFloat|))))
                                                        (|:| |shpe|
                                                             (|Record|
                                                              (|:| |shptype|
                                                                   (|Symbol|))
                                                              (|:| |centre|
                                                                   (QREFELT $
                                                                            6))
                                                              (|:| |size|
                                                                   (QREFELT $
                                                                            6))
                                                              (|:| |fill|
                                                                   (|Boolean|))))
                                                        (|:| |nodename|
                                                             (|Record|
                                                              (|:| |nme|
                                                                   (|String|))
                                                              (|:| |node| $)))
                                                        (|:| |np|
                                                             (|SceneNamedPoints|
                                                              (QREFELT $ 6)))
                                                        (|:| |empty| #24#))
                                                       #5#))
                                     2)
                                    (QREFELT $ 103))
                                   (QREFELT $ 149))
                         . #23#)
                   (LETT |startPointM|
                         (|minus_DF|
                          (|mul_DF| (SPADCALL |startPoint| (QREFELT $ 82))
                                    |scale|))
                         . #23#)
                   (LETT |endPointM|
                         (|minus_DF|
                          (|mul_DF| (SPADCALL |endPoint| (QREFELT $ 82))
                                    |scale|))
                         . #23#)
                   (COND
                    ((EQUAL
                      (QVELT
                       (PROG2 (LETT #5# (QVELT |n| 2) . #23#)
                           (QCDR #5#)
                         (|check_union2| (QEQCAR #5# 7)
                                         (|Record| (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT $ 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|)))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT $ 6))))
                                          (|:| |material|
                                               (|Record|
                                                (|:| |lineWidth|
                                                     (|DoubleFloat|))
                                                (|:| |lineCol| (|String|))
                                                (|:| |fillCol| (|String|))
                                                (|:| |matOpacity|
                                                     (|DoubleFloat|))))
                                          (|:| |text|
                                               (|Record| (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT $ 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT $ 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT $ 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT $ 6))
                                                (|:| |size| (QREFELT $ 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| $)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT $ 6)))
                                          (|:| |empty| #24#))
                                         #5#))
                       0)
                      (QVELT
                       (PROG2 (LETT #5# (QVELT |n| 2) . #23#)
                           (QCDR #5#)
                         (|check_union2| (QEQCAR #5# 7)
                                         (|Record| (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT $ 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|)))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT $ 6))))
                                          (|:| |material|
                                               (|Record|
                                                (|:| |lineWidth|
                                                     (|DoubleFloat|))
                                                (|:| |lineCol| (|String|))
                                                (|:| |fillCol| (|String|))
                                                (|:| |matOpacity|
                                                     (|DoubleFloat|))))
                                          (|:| |text|
                                               (|Record| (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT $ 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT $ 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT $ 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT $ 6))
                                                (|:| |size| (QREFELT $ 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| $)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT $ 6)))
                                          (|:| |empty| #24#))
                                         #5#))
                       1))
                     (LETT |ptStr|
                           (SPADCALL
                            (LIST "M"
                                  (|mathObject2String|
                                   (|mul_DF|
                                    (SPADCALL |startPoint| (QREFELT $ 81))
                                    |scale|))
                                  "," (|mathObject2String| |startPointM|)
                                  "c -50,25 -50,-50 0,-25")
                            (QREFELT $ 118))
                           . #23#))
                    (#25#
                     (LETT |ptStr|
                           (SPADCALL
                            (LIST "M"
                                  (|mathObject2String|
                                   (|mul_DF|
                                    (SPADCALL |startPoint| (QREFELT $ 81))
                                    |scale|))
                                  "," (|mathObject2String| |startPointM|) "L"
                                  (|mathObject2String|
                                   (|mul_DF|
                                    (SPADCALL |endPoint| (QREFELT $ 81))
                                    |scale|))
                                  "," (|mathObject2String| |endPointM|))
                            (QREFELT $ 118))
                           . #23#)))
                   (LETT |linWidth|
                         (QVELT
                          (PROG2 (LETT #5# (QVELT |n| 2) . #23#)
                              (QCDR #5#)
                            (|check_union2| (QEQCAR #5# 7)
                                            (|Record| (|:| |st| (|String|))
                                                      (|:| |en| (|String|))
                                                      (|:| |offset|
                                                           (QREFELT $ 6))
                                                      (|:| |mode| (|Symbol|))
                                                      (|:| |size|
                                                           (|DoubleFloat|)))
                                            (|Union|
                                             (|:| |points|
                                                  (|List|
                                                   (|List| (QREFELT $ 6))))
                                             (|:| |material|
                                                  (|Record|
                                                   (|:| |lineWidth|
                                                        (|DoubleFloat|))
                                                   (|:| |lineCol| (|String|))
                                                   (|:| |fillCol| (|String|))
                                                   (|:| |matOpacity|
                                                        (|DoubleFloat|))))
                                             (|:| |text|
                                                  (|Record|
                                                   (|:| |txt| (|String|))
                                                   (|:| |siz|
                                                        (|NonNegativeInteger|))
                                                   (|:| |pos| (QREFELT $ 6))
                                                   (|:| |np|
                                                        (|List| (|String|)))))
                                             (|:| |boundbox|
                                                  (|SBoundary| (QREFELT $ 6)))
                                             (|:| |trans|
                                                  (|STransform| (QREFELT $ 6)))
                                             (|:| |ifs|
                                                  (|Record|
                                                   (|:| |inx|
                                                        (|List|
                                                         (|List|
                                                          (|NonNegativeInteger|))))
                                                   (|:| |pts|
                                                        (|List|
                                                         (QREFELT $ 6)))))
                                             (|:| |arrws|
                                                  (|Record|
                                                   (|:| |ln|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT $ 6))))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |arrw|
                                                  (|Record|
                                                   (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT $ 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |shpe|
                                                  (|Record|
                                                   (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT $ 6))
                                                   (|:| |size| (QREFELT $ 6))
                                                   (|:| |fill| (|Boolean|))))
                                             (|:| |nodename|
                                                  (|Record|
                                                   (|:| |nme| (|String|))
                                                   (|:| |node| $)))
                                             (|:| |np|
                                                  (|SceneNamedPoints|
                                                   (QREFELT $ 6)))
                                             (|:| |empty| #24#))
                                            #5#))
                          4)
                         . #23#)
                   (COND
                    ((EQUAL
                      (QVELT
                       (PROG2 (LETT #5# (QVELT |n| 2) . #23#)
                           (QCDR #5#)
                         (|check_union2| (QEQCAR #5# 7)
                                         (|Record| (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT $ 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|)))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT $ 6))))
                                          (|:| |material|
                                               (|Record|
                                                (|:| |lineWidth|
                                                     (|DoubleFloat|))
                                                (|:| |lineCol| (|String|))
                                                (|:| |fillCol| (|String|))
                                                (|:| |matOpacity|
                                                     (|DoubleFloat|))))
                                          (|:| |text|
                                               (|Record| (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT $ 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT $ 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT $ 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT $ 6))
                                                (|:| |size| (QREFELT $ 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| $)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT $ 6)))
                                          (|:| |empty| #24#))
                                         #5#))
                       3)
                      '|proportional|)
                     (LETT |linWidth|
                           (|mul_DF|
                            (SPADCALL
                             (SPADCALL (SPADCALL |bb2| (QREFELT $ 37))
                                       (SPADCALL |bb2| (QREFELT $ 38))
                                       (QREFELT $ 39))
                             (QREFELT $ 81))
                            (QVELT
                             (PROG2 (LETT #5# (QVELT |n| 2) . #23#)
                                 (QCDR #5#)
                               (|check_union2| (QEQCAR #5# 7)
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|)))
                                               (|Union|
                                                (|:| |points|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |material|
                                                     (|Record|
                                                      (|:| |lineWidth|
                                                           (|DoubleFloat|))
                                                      (|:| |lineCol|
                                                           (|String|))
                                                      (|:| |fillCol|
                                                           (|String|))
                                                      (|:| |matOpacity|
                                                           (|DoubleFloat|))))
                                                (|:| |text|
                                                     (|Record|
                                                      (|:| |txt| (|String|))
                                                      (|:| |siz|
                                                           (|NonNegativeInteger|))
                                                      (|:| |pos| (QREFELT $ 6))
                                                      (|:| |np|
                                                           (|List|
                                                            (|String|)))))
                                                (|:| |boundbox|
                                                     (|SBoundary|
                                                      (QREFELT $ 6)))
                                                (|:| |trans|
                                                     (|STransform|
                                                      (QREFELT $ 6)))
                                                (|:| |ifs|
                                                     (|Record|
                                                      (|:| |inx|
                                                           (|List|
                                                            (|List|
                                                             (|NonNegativeInteger|))))
                                                      (|:| |pts|
                                                           (|List|
                                                            (QREFELT $ 6)))))
                                                (|:| |arrws|
                                                     (|Record|
                                                      (|:| |ln|
                                                           (|List|
                                                            (|List|
                                                             (QREFELT $ 6))))
                                                      (|:| |mode| (|Symbol|))
                                                      (|:| |size|
                                                           (|DoubleFloat|))))
                                                (|:| |arrw|
                                                     (|Record|
                                                      (|:| |st| (|String|))
                                                      (|:| |en| (|String|))
                                                      (|:| |offset|
                                                           (QREFELT $ 6))
                                                      (|:| |mode| (|Symbol|))
                                                      (|:| |size|
                                                           (|DoubleFloat|))))
                                                (|:| |shpe|
                                                     (|Record|
                                                      (|:| |shptype|
                                                           (|Symbol|))
                                                      (|:| |centre|
                                                           (QREFELT $ 6))
                                                      (|:| |size|
                                                           (QREFELT $ 6))
                                                      (|:| |fill|
                                                           (|Boolean|))))
                                                (|:| |nodename|
                                                     (|Record|
                                                      (|:| |nme| (|String|))
                                                      (|:| |node| $)))
                                                (|:| |np|
                                                     (|SceneNamedPoints|
                                                      (QREFELT $ 6)))
                                                (|:| |empty| #24#))
                                               #5#))
                             4))
                           . #23#)))
                   (COND
                    ((EQUAL
                      (QVELT
                       (PROG2 (LETT #5# (QVELT |n| 2) . #23#)
                           (QCDR #5#)
                         (|check_union2| (QEQCAR #5# 7)
                                         (|Record| (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT $ 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|)))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT $ 6))))
                                          (|:| |material|
                                               (|Record|
                                                (|:| |lineWidth|
                                                     (|DoubleFloat|))
                                                (|:| |lineCol| (|String|))
                                                (|:| |fillCol| (|String|))
                                                (|:| |matOpacity|
                                                     (|DoubleFloat|))))
                                          (|:| |text|
                                               (|Record| (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT $ 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT $ 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT $ 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT $ 6))
                                                (|:| |size| (QREFELT $ 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| $)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT $ 6)))
                                          (|:| |empty| #24#))
                                         #5#))
                       3)
                      '|variable|)
                     (LETT |linWidth|
                           (|mul_DF|
                            (SPADCALL |startPoint| |endPoint| (QREFELT $ 152))
                            (QVELT
                             (PROG2 (LETT #5# (QVELT |n| 2) . #23#)
                                 (QCDR #5#)
                               (|check_union2| (QEQCAR #5# 7)
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|)))
                                               (|Union|
                                                (|:| |points|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |material|
                                                     (|Record|
                                                      (|:| |lineWidth|
                                                           (|DoubleFloat|))
                                                      (|:| |lineCol|
                                                           (|String|))
                                                      (|:| |fillCol|
                                                           (|String|))
                                                      (|:| |matOpacity|
                                                           (|DoubleFloat|))))
                                                (|:| |text|
                                                     (|Record|
                                                      (|:| |txt| (|String|))
                                                      (|:| |siz|
                                                           (|NonNegativeInteger|))
                                                      (|:| |pos| (QREFELT $ 6))
                                                      (|:| |np|
                                                           (|List|
                                                            (|String|)))))
                                                (|:| |boundbox|
                                                     (|SBoundary|
                                                      (QREFELT $ 6)))
                                                (|:| |trans|
                                                     (|STransform|
                                                      (QREFELT $ 6)))
                                                (|:| |ifs|
                                                     (|Record|
                                                      (|:| |inx|
                                                           (|List|
                                                            (|List|
                                                             (|NonNegativeInteger|))))
                                                      (|:| |pts|
                                                           (|List|
                                                            (QREFELT $ 6)))))
                                                (|:| |arrws|
                                                     (|Record|
                                                      (|:| |ln|
                                                           (|List|
                                                            (|List|
                                                             (QREFELT $ 6))))
                                                      (|:| |mode| (|Symbol|))
                                                      (|:| |size|
                                                           (|DoubleFloat|))))
                                                (|:| |arrw|
                                                     (|Record|
                                                      (|:| |st| (|String|))
                                                      (|:| |en| (|String|))
                                                      (|:| |offset|
                                                           (QREFELT $ 6))
                                                      (|:| |mode| (|Symbol|))
                                                      (|:| |size|
                                                           (|DoubleFloat|))))
                                                (|:| |shpe|
                                                     (|Record|
                                                      (|:| |shptype|
                                                           (|Symbol|))
                                                      (|:| |centre|
                                                           (QREFELT $ 6))
                                                      (|:| |size|
                                                           (QREFELT $ 6))
                                                      (|:| |fill|
                                                           (|Boolean|))))
                                                (|:| |nodename|
                                                     (|Record|
                                                      (|:| |nme| (|String|))
                                                      (|:| |node| $)))
                                                (|:| |np|
                                                     (|SceneNamedPoints|
                                                      (QREFELT $ 6)))
                                                (|:| |empty| #24#))
                                               #5#))
                             4))
                           . #23#)))
                   (LETT |nodeAtts|
                         (LIST (SPADCALL "d" |ptStr| (QREFELT $ 158))
                               (SPADCALL "fill" "none" (QREFELT $ 158))
                               (SPADCALL "stroke" (QVELT |mat| 1)
                                         (QREFELT $ 158))
                               (SPADCALL "stroke-width"
                                         (|mathObject2String| |linWidth|)
                                         (QREFELT $ 158))
                               (SPADCALL "style" "marker-end:url(#Arrow)"
                                         (QREFELT $ 158)))
                         . #23#)
                   (LETT |nodeEles|
                         (LIST
                          (SPADCALL "path" NIL |nodeAtts| (QREFELT $ 161)))
                         . #23#)
                   (EXIT (LETT |nodeName| "g" . #23#)))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'NAMEDPOINTS)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 10))
                     (|error| "toSVG parameter type not valid for np node")))
                   (SPADCALL |np2| "points"
                             (PROG2 (LETT #4# (QVELT |n| 2) . #23#)
                                 (QCDR #4#)
                               (|check_union2| (QEQCAR #4# 10)
                                               (|SceneNamedPoints|
                                                (QREFELT $ 6))
                                               (|Union|
                                                (|:| |points|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |material|
                                                     (|Record|
                                                      (|:| |lineWidth|
                                                           (|DoubleFloat|))
                                                      (|:| |lineCol|
                                                           (|String|))
                                                      (|:| |fillCol|
                                                           (|String|))
                                                      (|:| |matOpacity|
                                                           (|DoubleFloat|))))
                                                (|:| |text|
                                                     (|Record|
                                                      (|:| |txt| (|String|))
                                                      (|:| |siz|
                                                           (|NonNegativeInteger|))
                                                      (|:| |pos| (QREFELT $ 6))
                                                      (|:| |np|
                                                           (|List|
                                                            (|String|)))))
                                                (|:| |boundbox|
                                                     (|SBoundary|
                                                      (QREFELT $ 6)))
                                                (|:| |trans|
                                                     (|STransform|
                                                      (QREFELT $ 6)))
                                                (|:| |ifs|
                                                     (|Record|
                                                      (|:| |inx|
                                                           (|List|
                                                            (|List|
                                                             (|NonNegativeInteger|))))
                                                      (|:| |pts|
                                                           (|List|
                                                            (QREFELT $ 6)))))
                                                (|:| |arrws|
                                                     (|Record|
                                                      (|:| |ln|
                                                           (|List|
                                                            (|List|
                                                             (QREFELT $ 6))))
                                                      (|:| |mode| (|Symbol|))
                                                      (|:| |size|
                                                           (|DoubleFloat|))))
                                                (|:| |arrw|
                                                     (|Record|
                                                      (|:| |st| (|String|))
                                                      (|:| |en| (|String|))
                                                      (|:| |offset|
                                                           (QREFELT $ 6))
                                                      (|:| |mode| (|Symbol|))
                                                      (|:| |size|
                                                           (|DoubleFloat|))))
                                                (|:| |shpe|
                                                     (|Record|
                                                      (|:| |shptype|
                                                           (|Symbol|))
                                                      (|:| |centre|
                                                           (QREFELT $ 6))
                                                      (|:| |size|
                                                           (QREFELT $ 6))
                                                      (|:| |fill|
                                                           (|Boolean|))))
                                                (|:| |nodename|
                                                     (|Record|
                                                      (|:| |nme| (|String|))
                                                      (|:| |node| $)))
                                                (|:| |np|
                                                     (|SceneNamedPoints|
                                                      (QREFELT $ 6)))
                                                (|:| |empty| #24#))
                                               #4#))
                             (QREFELT $ 172))
                   (EXIT (LETT |nodeName| "g" . #23#)))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'DEF)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 9))
                     (|error| "toSVG parameter type not valid for def node")))
                   (LETT |nn|
                         (PROG2 (LETT #3# (QVELT |n| 2) . #23#)
                             (QCDR #3#)
                           (|check_union2| (QEQCAR #3# 9)
                                           (|Record| (|:| |nme| (|String|))
                                                     (|:| |node| $))
                                           (|Union|
                                            (|:| |points|
                                                 (|List|
                                                  (|List| (QREFELT $ 6))))
                                            (|:| |material|
                                                 (|Record|
                                                  (|:| |lineWidth|
                                                       (|DoubleFloat|))
                                                  (|:| |lineCol| (|String|))
                                                  (|:| |fillCol| (|String|))
                                                  (|:| |matOpacity|
                                                       (|DoubleFloat|))))
                                            (|:| |text|
                                                 (|Record|
                                                  (|:| |txt| (|String|))
                                                  (|:| |siz|
                                                       (|NonNegativeInteger|))
                                                  (|:| |pos| (QREFELT $ 6))
                                                  (|:| |np|
                                                       (|List| (|String|)))))
                                            (|:| |boundbox|
                                                 (|SBoundary| (QREFELT $ 6)))
                                            (|:| |trans|
                                                 (|STransform| (QREFELT $ 6)))
                                            (|:| |ifs|
                                                 (|Record|
                                                  (|:| |inx|
                                                       (|List|
                                                        (|List|
                                                         (|NonNegativeInteger|))))
                                                  (|:| |pts|
                                                       (|List|
                                                        (QREFELT $ 6)))))
                                            (|:| |arrws|
                                                 (|Record|
                                                  (|:| |ln|
                                                       (|List|
                                                        (|List|
                                                         (QREFELT $ 6))))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |arrw|
                                                 (|Record|
                                                  (|:| |st| (|String|))
                                                  (|:| |en| (|String|))
                                                  (|:| |offset| (QREFELT $ 6))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |shpe|
                                                 (|Record|
                                                  (|:| |shptype| (|Symbol|))
                                                  (|:| |centre| (QREFELT $ 6))
                                                  (|:| |size| (QREFELT $ 6))
                                                  (|:| |fill| (|Boolean|))))
                                            (|:| |nodename|
                                                 (|Record|
                                                  (|:| |nme| (|String|))
                                                  (|:| |node| $)))
                                            (|:| |np|
                                                 (|SceneNamedPoints|
                                                  (QREFELT $ 6)))
                                            (|:| |empty| #24#))
                                           #3#))
                         . #23#)
                   (LETT |name| (QCAR |nn|) . #23#)
                   (LETT |nde| (QCDR |nn|) . #23#) (LETT |nodeName| "g" . #23#)
                   (SPADCALL |np2| |name| |nde| (QREFELT $ 174))
                   (LETT |xch|
                         (SPADCALL |nde| |mat2| |tran2| |bb2| |scale2|
                                   |clipEn2| |useInteger| |np2|
                                   (QREFELT $ 175))
                         . #23#)
                   (EXIT
                    (COND
                     ((NULL (SPADCALL |xch| (QREFELT $ 170)))
                      (LETT |nodeEles|
                            (SPADCALL |nodeEles| |xch| (QREFELT $ 163))
                            . #23#)))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'USE)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 9))
                     (|error| "toSVG parameter type not valid for use node")))
                   (LETT |nn|
                         (PROG2 (LETT #3# (QVELT |n| 2) . #23#)
                             (QCDR #3#)
                           (|check_union2| (QEQCAR #3# 9)
                                           (|Record| (|:| |nme| (|String|))
                                                     (|:| |node| $))
                                           (|Union|
                                            (|:| |points|
                                                 (|List|
                                                  (|List| (QREFELT $ 6))))
                                            (|:| |material|
                                                 (|Record|
                                                  (|:| |lineWidth|
                                                       (|DoubleFloat|))
                                                  (|:| |lineCol| (|String|))
                                                  (|:| |fillCol| (|String|))
                                                  (|:| |matOpacity|
                                                       (|DoubleFloat|))))
                                            (|:| |text|
                                                 (|Record|
                                                  (|:| |txt| (|String|))
                                                  (|:| |siz|
                                                       (|NonNegativeInteger|))
                                                  (|:| |pos| (QREFELT $ 6))
                                                  (|:| |np|
                                                       (|List| (|String|)))))
                                            (|:| |boundbox|
                                                 (|SBoundary| (QREFELT $ 6)))
                                            (|:| |trans|
                                                 (|STransform| (QREFELT $ 6)))
                                            (|:| |ifs|
                                                 (|Record|
                                                  (|:| |inx|
                                                       (|List|
                                                        (|List|
                                                         (|NonNegativeInteger|))))
                                                  (|:| |pts|
                                                       (|List|
                                                        (QREFELT $ 6)))))
                                            (|:| |arrws|
                                                 (|Record|
                                                  (|:| |ln|
                                                       (|List|
                                                        (|List|
                                                         (QREFELT $ 6))))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |arrw|
                                                 (|Record|
                                                  (|:| |st| (|String|))
                                                  (|:| |en| (|String|))
                                                  (|:| |offset| (QREFELT $ 6))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |shpe|
                                                 (|Record|
                                                  (|:| |shptype| (|Symbol|))
                                                  (|:| |centre| (QREFELT $ 6))
                                                  (|:| |size| (QREFELT $ 6))
                                                  (|:| |fill| (|Boolean|))))
                                            (|:| |nodename|
                                                 (|Record|
                                                  (|:| |nme| (|String|))
                                                  (|:| |node| $)))
                                            (|:| |np|
                                                 (|SceneNamedPoints|
                                                  (QREFELT $ 6)))
                                            (|:| |empty| #24#))
                                           #3#))
                         . #23#)
                   (LETT |name| (QCAR |nn|) . #23#)
                   (LETT |nde| (SPADCALL |np2| |name| (QREFELT $ 176)) . #23#)
                   (LETT |nodeName| "g" . #23#)
                   (LETT |xch|
                         (SPADCALL |nde| |mat2| |tran2| |bb2| |scale2|
                                   |clipEn2| |useInteger| |np2|
                                   (QREFELT $ 175))
                         . #23#)
                   (EXIT
                    (COND
                     ((NULL (SPADCALL |xch| (QREFELT $ 170)))
                      (LETT |nodeEles|
                            (SPADCALL |nodeEles| |xch| (QREFELT $ 163))
                            . #23#)))))))
                (EXIT
                 (COND
                  ((< (SPADCALL (QVELT |n| 1) (QREFELT $ 177)) 1)
                   (SPADCALL |nodeName| |nodeEles| |nodeAtts| (QREFELT $ 161)))
                  (#25#
                   (SEQ
                    (SEQ (LETT |ch| NIL . #23#) (LETT #1# (QVELT |n| 1) . #23#)
                         G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |ch| (CAR #1#) . #23#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |xch|
                                (SPADCALL |ch| |mat2| |tran2| |bb2| |scale2|
                                          |clipEn2| |useInteger| |np2|
                                          (QREFELT $ 175))
                                . #23#)
                          (EXIT
                           (COND
                            ((NULL (SPADCALL |xch| (QREFELT $ 170)))
                             (LETT |nodeEles|
                                   (SPADCALL |nodeEles| |xch| (QREFELT $ 163))
                                   . #23#)))))
                         (LETT #1# (CDR #1#) . #23#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (SPADCALL |nodeName| |nodeEles| |nodeAtts|
                               (QREFELT $ 161)))))))))
          #26# (EXIT #9#)))) 

(SDEFUN |SCENE;toSVG;$RStRDf2BSnpXe;83|
        ((|n| $)
         (|mat| |Record| (|:| |lineWidth| (|DoubleFloat|))
          (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
          (|:| |matOpacity| (|DoubleFloat|)))
         (|tran| |STransform| PT)
         (|bb| |Record| (|:| |mins| PT) (|:| |maxs| PT))
         (|scale| |DoubleFloat|) (|clipEn| |Boolean|) (|useInteger| |Boolean|)
         (|npt| |SceneNamedPoints| PT) ($ |XmlElement|))
        (SPADCALL |n| |mat| |tran|
                  (SPADCALL (QCAR |bb|) (QCDR |bb|) (QREFELT $ 10)) |scale|
                  |clipEn| |useInteger| |npt| (QREFELT $ 175))) 

(SDEFUN |SCENE;writeSvg;$SV;84| ((|n| $) (|filename| |String|) ($ |Void|))
        (SPROG
         ((|defaultBounds| (|SBoundary| PT))
          (|defaultTransform| (|STransform| PT))
          (|defaultMaterial|
           (|Record| (|:| |lineWidth| (|DoubleFloat|))
                     (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
                     (|:| |matOpacity| (|DoubleFloat|)))))
         (SEQ
          (LETT |defaultMaterial|
                (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "black" "black"
                        1.0)
                . #1=(|SCENE;writeSvg;$SV;84|))
          (LETT |defaultTransform| (SPADCALL (QREFELT $ 179)) . #1#)
          (LETT |defaultBounds| (SPADCALL (QREFELT $ 16)) . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL |n| |defaultMaterial| |defaultTransform| |defaultBounds|
                      1.0 NIL NIL (SPADCALL NIL NIL (QREFELT $ 180))
                      (QREFELT $ 175))
            |filename| (QREFELT $ 182)))))) 

(SDEFUN |SCENE;writeSvgQuantised;$SV;85|
        ((|n| $) (|filename| |String|) ($ |Void|))
        (SPROG
         ((|defaultBounds| (|SBoundary| PT))
          (|defaultTransform| (|STransform| PT))
          (|defaultMaterial|
           (|Record| (|:| |lineWidth| (|DoubleFloat|))
                     (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
                     (|:| |matOpacity| (|DoubleFloat|)))))
         (SEQ
          (LETT |defaultMaterial|
                (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "black" "black"
                        1.0)
                . #1=(|SCENE;writeSvgQuantised;$SV;85|))
          (LETT |defaultTransform| (SPADCALL (QREFELT $ 179)) . #1#)
          (LETT |defaultBounds| (SPADCALL (QREFELT $ 16)) . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL |n| |defaultMaterial| |defaultTransform| |defaultBounds|
                      1.0 NIL 'T (SPADCALL NIL NIL (QREFELT $ 180))
                      (QREFELT $ 175))
            |filename| (QREFELT $ 182)))))) 

(SDEFUN |SCENE;boundary1|
        ((|n| $) (|tran| . #1=(|STransform| PT)) (|scale| |DoubleFloat|)
         (|useInteger| |Boolean|) (|npt| |SceneNamedPoints| PT)
         (|fontScale| . #2=(|DoubleFloat|)) ($ . #3=(|SBoundary| PT)))
        (SPROG
         ((|res| (|SBoundary| PT)) (|res2| #3#) (#4=#:G1774 NIL) (|ch| NIL)
          (#5=#:G1773 NIL) (|p| NIL) (#6=#:G1772 NIL) (|lp| NIL)
          (|pts2| (|List| (|List| PT))) (#7=#:G1730 NIL) (#8=#:G1771 NIL)
          (#9=#:G1729 NIL) (|tran2| #1#) (#10=#:G1728 NIL) (|pt2| (PT))
          (|pt1| (PT)) (#11=#:G1726 NIL) (|w| #12=(|DoubleFloat|)) (|h| #12#)
          (#13=#:G1768 NIL) (#14=#:G1732 NIL) (#15=#:G1770 NIL)
          (#16=#:G1769 NIL) (|pts| (|List| (|List| PT))) (#17=#:G1724 NIL)
          (|fontScale2| #2#) (|maxx| #18=(|DoubleFloat|)) (|minx| #18#)
          (|bb2| (|SBoundary| PT)) (#19=#:G1727 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |res| (SPADCALL (QREFELT $ 16)) . #20=(|SCENE;boundary1|))
            (LETT |fontScale2| |fontScale| . #20#) (LETT |tran2| |tran| . #20#)
            (COND
             ((EQUAL (QVELT |n| 0) 'ROOT)
              (SEQ
               (LETT |bb2|
                     (PROG2 (LETT #19# (QVELT |n| 2) . #20#)
                         (QCDR #19#)
                       (|check_union2| (QEQCAR #19# 3)
                                       (|SBoundary| (QREFELT $ 6))
                                       (|Union|
                                        (|:| |points|
                                             (|List| (|List| (QREFELT $ 6))))
                                        (|:| |material|
                                             (|Record|
                                              (|:| |lineWidth| (|DoubleFloat|))
                                              (|:| |lineCol| (|String|))
                                              (|:| |fillCol| (|String|))
                                              (|:| |matOpacity|
                                                   (|DoubleFloat|))))
                                        (|:| |text|
                                             (|Record| (|:| |txt| (|String|))
                                                       (|:| |siz|
                                                            (|NonNegativeInteger|))
                                                       (|:| |pos|
                                                            (QREFELT $ 6))
                                                       (|:| |np|
                                                            (|List|
                                                             (|String|)))))
                                        (|:| |boundbox|
                                             (|SBoundary| (QREFELT $ 6)))
                                        (|:| |trans|
                                             (|STransform| (QREFELT $ 6)))
                                        (|:| |ifs|
                                             (|Record|
                                              (|:| |inx|
                                                   (|List|
                                                    (|List|
                                                     (|NonNegativeInteger|))))
                                              (|:| |pts|
                                                   (|List| (QREFELT $ 6)))))
                                        (|:| |arrws|
                                             (|Record|
                                              (|:| |ln|
                                                   (|List|
                                                    (|List| (QREFELT $ 6))))
                                              (|:| |mode| (|Symbol|))
                                              (|:| |size| (|DoubleFloat|))))
                                        (|:| |arrw|
                                             (|Record| (|:| |st| (|String|))
                                                       (|:| |en| (|String|))
                                                       (|:| |offset|
                                                            (QREFELT $ 6))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                        (|:| |shpe|
                                             (|Record|
                                              (|:| |shptype| (|Symbol|))
                                              (|:| |centre| (QREFELT $ 6))
                                              (|:| |size| (QREFELT $ 6))
                                              (|:| |fill| (|Boolean|))))
                                        (|:| |nodename|
                                             (|Record| (|:| |nme| (|String|))
                                                       (|:| |node| $)))
                                        (|:| |np|
                                             (|SceneNamedPoints|
                                              (QREFELT $ 6)))
                                        (|:| |empty| #21="empty"))
                                       #19#))
                     . #20#)
               (COND
                ((NULL (SPADCALL |bb2| (QREFELT $ 164)))
                 (SEQ
                  (LETT |minx|
                        (SPADCALL (SPADCALL |bb2| (QREFELT $ 38))
                                  (QREFELT $ 81))
                        . #20#)
                  (LETT |maxx|
                        (SPADCALL (SPADCALL |bb2| (QREFELT $ 37))
                                  (QREFELT $ 81))
                        . #20#)
                  (EXIT
                   (LETT |fontScale2|
                         (|div_DF| (|sub_DF| |maxx| |minx|)
                                   (FLOAT 1000 MOST-POSITIVE-DOUBLE-FLOAT))
                         . #20#)))))
               (EXIT (LETT |res| (SPADCALL (QREFELT $ 16)) . #20#)))))
            (COND
             ((EQUAL (QVELT |n| 0) 'GROUP)
              (LETT |res| (SPADCALL (QREFELT $ 16)) . #20#)))
            (COND
             ((EQUAL (QVELT |n| 0) 'LINE)
              (SEQ
               (LETT |pts|
                     (PROG2 (LETT #17# (QVELT |n| 2) . #20#)
                         (QCDR #17#)
                       (|check_union2| (QEQCAR #17# 0)
                                       (|List| (|List| (QREFELT $ 6)))
                                       (|Union|
                                        (|:| |points|
                                             (|List| (|List| (QREFELT $ 6))))
                                        (|:| |material|
                                             (|Record|
                                              (|:| |lineWidth| (|DoubleFloat|))
                                              (|:| |lineCol| (|String|))
                                              (|:| |fillCol| (|String|))
                                              (|:| |matOpacity|
                                                   (|DoubleFloat|))))
                                        (|:| |text|
                                             (|Record| (|:| |txt| (|String|))
                                                       (|:| |siz|
                                                            (|NonNegativeInteger|))
                                                       (|:| |pos|
                                                            (QREFELT $ 6))
                                                       (|:| |np|
                                                            (|List|
                                                             (|String|)))))
                                        (|:| |boundbox|
                                             (|SBoundary| (QREFELT $ 6)))
                                        (|:| |trans|
                                             (|STransform| (QREFELT $ 6)))
                                        (|:| |ifs|
                                             (|Record|
                                              (|:| |inx|
                                                   (|List|
                                                    (|List|
                                                     (|NonNegativeInteger|))))
                                              (|:| |pts|
                                                   (|List| (QREFELT $ 6)))))
                                        (|:| |arrws|
                                             (|Record|
                                              (|:| |ln|
                                                   (|List|
                                                    (|List| (QREFELT $ 6))))
                                              (|:| |mode| (|Symbol|))
                                              (|:| |size| (|DoubleFloat|))))
                                        (|:| |arrw|
                                             (|Record| (|:| |st| (|String|))
                                                       (|:| |en| (|String|))
                                                       (|:| |offset|
                                                            (QREFELT $ 6))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                        (|:| |shpe|
                                             (|Record|
                                              (|:| |shptype| (|Symbol|))
                                              (|:| |centre| (QREFELT $ 6))
                                              (|:| |size| (QREFELT $ 6))
                                              (|:| |fill| (|Boolean|))))
                                        (|:| |nodename|
                                             (|Record| (|:| |nme| (|String|))
                                                       (|:| |node| $)))
                                        (|:| |np|
                                             (|SceneNamedPoints|
                                              (QREFELT $ 6)))
                                        (|:| |empty| #21#))
                                       #17#))
                     . #20#)
               (EXIT
                (SEQ (LETT |lp| NIL . #20#) (LETT #16# |pts| . #20#) G190
                     (COND
                      ((OR (ATOM #16#)
                           (PROGN (LETT |lp| (CAR #16#) . #20#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |p| NIL . #20#) (LETT #15# |lp| . #20#) G190
                            (COND
                             ((OR (ATOM #15#)
                                  (PROGN (LETT |p| (CAR #15#) . #20#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |res|
                                    (SPADCALL |res|
                                              (SPADCALL |tran| |p|
                                                        (QREFELT $ 149))
                                              (QREFELT $ 185))
                                    . #20#)))
                            (LETT #15# (CDR #15#) . #20#) (GO G190) G191
                            (EXIT NIL))))
                     (LETT #16# (CDR #16#) . #20#) (GO G190) G191
                     (EXIT NIL))))))
            (COND
             ((EQUAL (QVELT |n| 0) 'SHAPE)
              (SEQ
               (LETT |pt1|
                     (QVELT
                      (PROG2 (LETT #14# (QVELT |n| 2) . #20#)
                          (QCDR #14#)
                        (|check_union2| (QEQCAR #14# 8)
                                        (|Record| (|:| |shptype| (|Symbol|))
                                                  (|:| |centre| (QREFELT $ 6))
                                                  (|:| |size| (QREFELT $ 6))
                                                  (|:| |fill| (|Boolean|)))
                                        (|Union|
                                         (|:| |points|
                                              (|List| (|List| (QREFELT $ 6))))
                                         (|:| |material|
                                              (|Record|
                                               (|:| |lineWidth|
                                                    (|DoubleFloat|))
                                               (|:| |lineCol| (|String|))
                                               (|:| |fillCol| (|String|))
                                               (|:| |matOpacity|
                                                    (|DoubleFloat|))))
                                         (|:| |text|
                                              (|Record| (|:| |txt| (|String|))
                                                        (|:| |siz|
                                                             (|NonNegativeInteger|))
                                                        (|:| |pos|
                                                             (QREFELT $ 6))
                                                        (|:| |np|
                                                             (|List|
                                                              (|String|)))))
                                         (|:| |boundbox|
                                              (|SBoundary| (QREFELT $ 6)))
                                         (|:| |trans|
                                              (|STransform| (QREFELT $ 6)))
                                         (|:| |ifs|
                                              (|Record|
                                               (|:| |inx|
                                                    (|List|
                                                     (|List|
                                                      (|NonNegativeInteger|))))
                                               (|:| |pts|
                                                    (|List| (QREFELT $ 6)))))
                                         (|:| |arrws|
                                              (|Record|
                                               (|:| |ln|
                                                    (|List|
                                                     (|List| (QREFELT $ 6))))
                                               (|:| |mode| (|Symbol|))
                                               (|:| |size| (|DoubleFloat|))))
                                         (|:| |arrw|
                                              (|Record| (|:| |st| (|String|))
                                                        (|:| |en| (|String|))
                                                        (|:| |offset|
                                                             (QREFELT $ 6))
                                                        (|:| |mode| (|Symbol|))
                                                        (|:| |size|
                                                             (|DoubleFloat|))))
                                         (|:| |shpe|
                                              (|Record|
                                               (|:| |shptype| (|Symbol|))
                                               (|:| |centre| (QREFELT $ 6))
                                               (|:| |size| (QREFELT $ 6))
                                               (|:| |fill| (|Boolean|))))
                                         (|:| |nodename|
                                              (|Record| (|:| |nme| (|String|))
                                                        (|:| |node| $)))
                                         (|:| |np|
                                              (|SceneNamedPoints|
                                               (QREFELT $ 6)))
                                         (|:| |empty| #21#))
                                        #14#))
                      1)
                     . #20#)
               (LETT |pt2|
                     (QVELT
                      (PROG2 (LETT #14# (QVELT |n| 2) . #20#)
                          (QCDR #14#)
                        (|check_union2| (QEQCAR #14# 8)
                                        (|Record| (|:| |shptype| (|Symbol|))
                                                  (|:| |centre| (QREFELT $ 6))
                                                  (|:| |size| (QREFELT $ 6))
                                                  (|:| |fill| (|Boolean|)))
                                        (|Union|
                                         (|:| |points|
                                              (|List| (|List| (QREFELT $ 6))))
                                         (|:| |material|
                                              (|Record|
                                               (|:| |lineWidth|
                                                    (|DoubleFloat|))
                                               (|:| |lineCol| (|String|))
                                               (|:| |fillCol| (|String|))
                                               (|:| |matOpacity|
                                                    (|DoubleFloat|))))
                                         (|:| |text|
                                              (|Record| (|:| |txt| (|String|))
                                                        (|:| |siz|
                                                             (|NonNegativeInteger|))
                                                        (|:| |pos|
                                                             (QREFELT $ 6))
                                                        (|:| |np|
                                                             (|List|
                                                              (|String|)))))
                                         (|:| |boundbox|
                                              (|SBoundary| (QREFELT $ 6)))
                                         (|:| |trans|
                                              (|STransform| (QREFELT $ 6)))
                                         (|:| |ifs|
                                              (|Record|
                                               (|:| |inx|
                                                    (|List|
                                                     (|List|
                                                      (|NonNegativeInteger|))))
                                               (|:| |pts|
                                                    (|List| (QREFELT $ 6)))))
                                         (|:| |arrws|
                                              (|Record|
                                               (|:| |ln|
                                                    (|List|
                                                     (|List| (QREFELT $ 6))))
                                               (|:| |mode| (|Symbol|))
                                               (|:| |size| (|DoubleFloat|))))
                                         (|:| |arrw|
                                              (|Record| (|:| |st| (|String|))
                                                        (|:| |en| (|String|))
                                                        (|:| |offset|
                                                             (QREFELT $ 6))
                                                        (|:| |mode| (|Symbol|))
                                                        (|:| |size|
                                                             (|DoubleFloat|))))
                                         (|:| |shpe|
                                              (|Record|
                                               (|:| |shptype| (|Symbol|))
                                               (|:| |centre| (QREFELT $ 6))
                                               (|:| |size| (QREFELT $ 6))
                                               (|:| |fill| (|Boolean|))))
                                         (|:| |nodename|
                                              (|Record| (|:| |nme| (|String|))
                                                        (|:| |node| $)))
                                         (|:| |np|
                                              (|SceneNamedPoints|
                                               (QREFELT $ 6)))
                                         (|:| |empty| #21#))
                                        #14#))
                      2)
                     . #20#)
               (COND
                ((EQUAL
                  (QVELT
                   (PROG2 (LETT #14# (QVELT |n| 2) . #20#)
                       (QCDR #14#)
                     (|check_union2| (QEQCAR #14# 8)
                                     (|Record| (|:| |shptype| (|Symbol|))
                                               (|:| |centre| (QREFELT $ 6))
                                               (|:| |size| (QREFELT $ 6))
                                               (|:| |fill| (|Boolean|)))
                                     (|Union|
                                      (|:| |points|
                                           (|List| (|List| (QREFELT $ 6))))
                                      (|:| |material|
                                           (|Record|
                                            (|:| |lineWidth| (|DoubleFloat|))
                                            (|:| |lineCol| (|String|))
                                            (|:| |fillCol| (|String|))
                                            (|:| |matOpacity|
                                                 (|DoubleFloat|))))
                                      (|:| |text|
                                           (|Record| (|:| |txt| (|String|))
                                                     (|:| |siz|
                                                          (|NonNegativeInteger|))
                                                     (|:| |pos| (QREFELT $ 6))
                                                     (|:| |np|
                                                          (|List|
                                                           (|String|)))))
                                      (|:| |boundbox|
                                           (|SBoundary| (QREFELT $ 6)))
                                      (|:| |trans|
                                           (|STransform| (QREFELT $ 6)))
                                      (|:| |ifs|
                                           (|Record|
                                            (|:| |inx|
                                                 (|List|
                                                  (|List|
                                                   (|NonNegativeInteger|))))
                                            (|:| |pts|
                                                 (|List| (QREFELT $ 6)))))
                                      (|:| |arrws|
                                           (|Record|
                                            (|:| |ln|
                                                 (|List|
                                                  (|List| (QREFELT $ 6))))
                                            (|:| |mode| (|Symbol|))
                                            (|:| |size| (|DoubleFloat|))))
                                      (|:| |arrw|
                                           (|Record| (|:| |st| (|String|))
                                                     (|:| |en| (|String|))
                                                     (|:| |offset|
                                                          (QREFELT $ 6))
                                                     (|:| |mode| (|Symbol|))
                                                     (|:| |size|
                                                          (|DoubleFloat|))))
                                      (|:| |shpe|
                                           (|Record| (|:| |shptype| (|Symbol|))
                                                     (|:| |centre|
                                                          (QREFELT $ 6))
                                                     (|:| |size| (QREFELT $ 6))
                                                     (|:| |fill| (|Boolean|))))
                                      (|:| |nodename|
                                           (|Record| (|:| |nme| (|String|))
                                                     (|:| |node| $)))
                                      (|:| |np|
                                           (|SceneNamedPoints| (QREFELT $ 6)))
                                      (|:| |empty| #21#))
                                     #14#))
                   0)
                  '|ellipse|)
                 (PROGN
                  (LETT #13#
                        (SPADCALL (SPADCALL |tran| |pt1| (QREFELT $ 149)) |pt2|
                                  (QREFELT $ 186))
                        . #20#)
                  (GO #22=#:G1767))))
               (LETT |res|
                     (SPADCALL |res| (SPADCALL |tran| |pt1| (QREFELT $ 149))
                               (QREFELT $ 185))
                     . #20#)
               (EXIT
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL |tran|
                                          (SPADCALL |pt1| |pt2|
                                                    (QREFELT $ 103))
                                          (QREFELT $ 149))
                                (QREFELT $ 185))
                      . #20#)))))
            (COND
             ((EQUAL (QVELT |n| 0) 'MATERIAL)
              (LETT |res| (SPADCALL (QREFELT $ 16)) . #20#)))
            (COND
             ((EQUAL (QVELT |n| 0) 'TEXT)
              (SEQ
               (LETT |h|
                     (|mul_DF| |fontScale|
                               (FLOAT
                                (QVELT
                                 (PROG2 (LETT #11# (QVELT |n| 2) . #20#)
                                     (QCDR #11#)
                                   (|check_union2| (QEQCAR #11# 2)
                                                   (|Record|
                                                    (|:| |txt| (|String|))
                                                    (|:| |siz|
                                                         (|NonNegativeInteger|))
                                                    (|:| |pos| (QREFELT $ 6))
                                                    (|:| |np|
                                                         (|List| (|String|))))
                                                   (|Union|
                                                    (|:| |points|
                                                         (|List|
                                                          (|List|
                                                           (QREFELT $ 6))))
                                                    (|:| |material|
                                                         (|Record|
                                                          (|:| |lineWidth|
                                                               (|DoubleFloat|))
                                                          (|:| |lineCol|
                                                               (|String|))
                                                          (|:| |fillCol|
                                                               (|String|))
                                                          (|:| |matOpacity|
                                                               (|DoubleFloat|))))
                                                    (|:| |text|
                                                         (|Record|
                                                          (|:| |txt|
                                                               (|String|))
                                                          (|:| |siz|
                                                               (|NonNegativeInteger|))
                                                          (|:| |pos|
                                                               (QREFELT $ 6))
                                                          (|:| |np|
                                                               (|List|
                                                                (|String|)))))
                                                    (|:| |boundbox|
                                                         (|SBoundary|
                                                          (QREFELT $ 6)))
                                                    (|:| |trans|
                                                         (|STransform|
                                                          (QREFELT $ 6)))
                                                    (|:| |ifs|
                                                         (|Record|
                                                          (|:| |inx|
                                                               (|List|
                                                                (|List|
                                                                 (|NonNegativeInteger|))))
                                                          (|:| |pts|
                                                               (|List|
                                                                (QREFELT $
                                                                         6)))))
                                                    (|:| |arrws|
                                                         (|Record|
                                                          (|:| |ln|
                                                               (|List|
                                                                (|List|
                                                                 (QREFELT $
                                                                          6))))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                                    (|:| |arrw|
                                                         (|Record|
                                                          (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                                    (|:| |shpe|
                                                         (|Record|
                                                          (|:| |shptype|
                                                               (|Symbol|))
                                                          (|:| |centre|
                                                               (QREFELT $ 6))
                                                          (|:| |size|
                                                               (QREFELT $ 6))
                                                          (|:| |fill|
                                                               (|Boolean|))))
                                                    (|:| |nodename|
                                                         (|Record|
                                                          (|:| |nme|
                                                               (|String|))
                                                          (|:| |node| $)))
                                                    (|:| |np|
                                                         (|SceneNamedPoints|
                                                          (QREFELT $ 6)))
                                                    (|:| |empty| #21#))
                                                   #11#))
                                 1)
                                MOST-POSITIVE-DOUBLE-FLOAT))
                     . #20#)
               (LETT |w|
                     (|mul_DF|
                      (|mul_DF|
                       (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 90))
                                 (QREFELT $ 91))
                       |h|)
                      (FLOAT
                       (QCSIZE
                        (QVELT
                         (PROG2 (LETT #11# (QVELT |n| 2) . #20#)
                             (QCDR #11#)
                           (|check_union2| (QEQCAR #11# 2)
                                           (|Record| (|:| |txt| (|String|))
                                                     (|:| |siz|
                                                          (|NonNegativeInteger|))
                                                     (|:| |pos| (QREFELT $ 6))
                                                     (|:| |np|
                                                          (|List| (|String|))))
                                           (|Union|
                                            (|:| |points|
                                                 (|List|
                                                  (|List| (QREFELT $ 6))))
                                            (|:| |material|
                                                 (|Record|
                                                  (|:| |lineWidth|
                                                       (|DoubleFloat|))
                                                  (|:| |lineCol| (|String|))
                                                  (|:| |fillCol| (|String|))
                                                  (|:| |matOpacity|
                                                       (|DoubleFloat|))))
                                            (|:| |text|
                                                 (|Record|
                                                  (|:| |txt| (|String|))
                                                  (|:| |siz|
                                                       (|NonNegativeInteger|))
                                                  (|:| |pos| (QREFELT $ 6))
                                                  (|:| |np|
                                                       (|List| (|String|)))))
                                            (|:| |boundbox|
                                                 (|SBoundary| (QREFELT $ 6)))
                                            (|:| |trans|
                                                 (|STransform| (QREFELT $ 6)))
                                            (|:| |ifs|
                                                 (|Record|
                                                  (|:| |inx|
                                                       (|List|
                                                        (|List|
                                                         (|NonNegativeInteger|))))
                                                  (|:| |pts|
                                                       (|List|
                                                        (QREFELT $ 6)))))
                                            (|:| |arrws|
                                                 (|Record|
                                                  (|:| |ln|
                                                       (|List|
                                                        (|List|
                                                         (QREFELT $ 6))))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |arrw|
                                                 (|Record|
                                                  (|:| |st| (|String|))
                                                  (|:| |en| (|String|))
                                                  (|:| |offset| (QREFELT $ 6))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |shpe|
                                                 (|Record|
                                                  (|:| |shptype| (|Symbol|))
                                                  (|:| |centre| (QREFELT $ 6))
                                                  (|:| |size| (QREFELT $ 6))
                                                  (|:| |fill| (|Boolean|))))
                                            (|:| |nodename|
                                                 (|Record|
                                                  (|:| |nme| (|String|))
                                                  (|:| |node| $)))
                                            (|:| |np|
                                                 (|SceneNamedPoints|
                                                  (QREFELT $ 6)))
                                            (|:| |empty| #21#))
                                           #11#))
                         0))
                       MOST-POSITIVE-DOUBLE-FLOAT))
                     . #20#)
               (LETT |pt1|
                     (QVELT
                      (PROG2 (LETT #11# (QVELT |n| 2) . #20#)
                          (QCDR #11#)
                        (|check_union2| (QEQCAR #11# 2)
                                        (|Record| (|:| |txt| (|String|))
                                                  (|:| |siz|
                                                       (|NonNegativeInteger|))
                                                  (|:| |pos| (QREFELT $ 6))
                                                  (|:| |np|
                                                       (|List| (|String|))))
                                        (|Union|
                                         (|:| |points|
                                              (|List| (|List| (QREFELT $ 6))))
                                         (|:| |material|
                                              (|Record|
                                               (|:| |lineWidth|
                                                    (|DoubleFloat|))
                                               (|:| |lineCol| (|String|))
                                               (|:| |fillCol| (|String|))
                                               (|:| |matOpacity|
                                                    (|DoubleFloat|))))
                                         (|:| |text|
                                              (|Record| (|:| |txt| (|String|))
                                                        (|:| |siz|
                                                             (|NonNegativeInteger|))
                                                        (|:| |pos|
                                                             (QREFELT $ 6))
                                                        (|:| |np|
                                                             (|List|
                                                              (|String|)))))
                                         (|:| |boundbox|
                                              (|SBoundary| (QREFELT $ 6)))
                                         (|:| |trans|
                                              (|STransform| (QREFELT $ 6)))
                                         (|:| |ifs|
                                              (|Record|
                                               (|:| |inx|
                                                    (|List|
                                                     (|List|
                                                      (|NonNegativeInteger|))))
                                               (|:| |pts|
                                                    (|List| (QREFELT $ 6)))))
                                         (|:| |arrws|
                                              (|Record|
                                               (|:| |ln|
                                                    (|List|
                                                     (|List| (QREFELT $ 6))))
                                               (|:| |mode| (|Symbol|))
                                               (|:| |size| (|DoubleFloat|))))
                                         (|:| |arrw|
                                              (|Record| (|:| |st| (|String|))
                                                        (|:| |en| (|String|))
                                                        (|:| |offset|
                                                             (QREFELT $ 6))
                                                        (|:| |mode| (|Symbol|))
                                                        (|:| |size|
                                                             (|DoubleFloat|))))
                                         (|:| |shpe|
                                              (|Record|
                                               (|:| |shptype| (|Symbol|))
                                               (|:| |centre| (QREFELT $ 6))
                                               (|:| |size| (QREFELT $ 6))
                                               (|:| |fill| (|Boolean|))))
                                         (|:| |nodename|
                                              (|Record| (|:| |nme| (|String|))
                                                        (|:| |node| $)))
                                         (|:| |np|
                                              (|SceneNamedPoints|
                                               (QREFELT $ 6)))
                                         (|:| |empty| #21#))
                                        #11#))
                      2)
                     . #20#)
               (LETT |res|
                     (SPADCALL |res| (SPADCALL |tran| |pt1| (QREFELT $ 149))
                               (QREFELT $ 185))
                     . #20#)
               (LETT |pt2|
                     (SPADCALL |pt1| (SPADCALL |w| |h| (QREFELT $ 83))
                               (QREFELT $ 103))
                     . #20#)
               (EXIT
                (LETT |res|
                      (SPADCALL |res| (SPADCALL |tran| |pt2| (QREFELT $ 149))
                                (QREFELT $ 185))
                      . #20#)))))
            (COND
             ((EQUAL (QVELT |n| 0) 'TRANSFORM)
              (LETT |tran2|
                    (SPADCALL
                     (PROG2 (LETT #10# (QVELT |n| 2) . #20#)
                         (QCDR #10#)
                       (|check_union2| (QEQCAR #10# 4)
                                       (|STransform| (QREFELT $ 6))
                                       (|Union|
                                        (|:| |points|
                                             (|List| (|List| (QREFELT $ 6))))
                                        (|:| |material|
                                             (|Record|
                                              (|:| |lineWidth| (|DoubleFloat|))
                                              (|:| |lineCol| (|String|))
                                              (|:| |fillCol| (|String|))
                                              (|:| |matOpacity|
                                                   (|DoubleFloat|))))
                                        (|:| |text|
                                             (|Record| (|:| |txt| (|String|))
                                                       (|:| |siz|
                                                            (|NonNegativeInteger|))
                                                       (|:| |pos|
                                                            (QREFELT $ 6))
                                                       (|:| |np|
                                                            (|List|
                                                             (|String|)))))
                                        (|:| |boundbox|
                                             (|SBoundary| (QREFELT $ 6)))
                                        (|:| |trans|
                                             (|STransform| (QREFELT $ 6)))
                                        (|:| |ifs|
                                             (|Record|
                                              (|:| |inx|
                                                   (|List|
                                                    (|List|
                                                     (|NonNegativeInteger|))))
                                              (|:| |pts|
                                                   (|List| (QREFELT $ 6)))))
                                        (|:| |arrws|
                                             (|Record|
                                              (|:| |ln|
                                                   (|List|
                                                    (|List| (QREFELT $ 6))))
                                              (|:| |mode| (|Symbol|))
                                              (|:| |size| (|DoubleFloat|))))
                                        (|:| |arrw|
                                             (|Record| (|:| |st| (|String|))
                                                       (|:| |en| (|String|))
                                                       (|:| |offset|
                                                            (QREFELT $ 6))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                        (|:| |shpe|
                                             (|Record|
                                              (|:| |shptype| (|Symbol|))
                                              (|:| |centre| (QREFELT $ 6))
                                              (|:| |size| (QREFELT $ 6))
                                              (|:| |fill| (|Boolean|))))
                                        (|:| |nodename|
                                             (|Record| (|:| |nme| (|String|))
                                                       (|:| |node| $)))
                                        (|:| |np|
                                             (|SceneNamedPoints|
                                              (QREFELT $ 6)))
                                        (|:| |empty| #21#))
                                       #10#))
                     |tran| (QREFELT $ 171))
                    . #20#)))
            (COND
             ((EQUAL (QVELT |n| 0) 'CLIP)
              (LETT |res| (SPADCALL (QREFELT $ 16)) . #20#)))
            (COND
             ((EQUAL (QVELT |n| 0) 'IFS)
              (SEQ
               (LETT |pts2|
                     (QCDR
                      (PROG2 (LETT #9# (QVELT |n| 2) . #20#)
                          (QCDR #9#)
                        (|check_union2| (QEQCAR #9# 5)
                                        (|Record|
                                         (|:| |inx|
                                              (|List|
                                               (|List|
                                                (|NonNegativeInteger|))))
                                         (|:| |pts| (|List| (QREFELT $ 6))))
                                        (|Union|
                                         (|:| |points|
                                              (|List| (|List| (QREFELT $ 6))))
                                         (|:| |material|
                                              (|Record|
                                               (|:| |lineWidth|
                                                    (|DoubleFloat|))
                                               (|:| |lineCol| (|String|))
                                               (|:| |fillCol| (|String|))
                                               (|:| |matOpacity|
                                                    (|DoubleFloat|))))
                                         (|:| |text|
                                              (|Record| (|:| |txt| (|String|))
                                                        (|:| |siz|
                                                             (|NonNegativeInteger|))
                                                        (|:| |pos|
                                                             (QREFELT $ 6))
                                                        (|:| |np|
                                                             (|List|
                                                              (|String|)))))
                                         (|:| |boundbox|
                                              (|SBoundary| (QREFELT $ 6)))
                                         (|:| |trans|
                                              (|STransform| (QREFELT $ 6)))
                                         (|:| |ifs|
                                              (|Record|
                                               (|:| |inx|
                                                    (|List|
                                                     (|List|
                                                      (|NonNegativeInteger|))))
                                               (|:| |pts|
                                                    (|List| (QREFELT $ 6)))))
                                         (|:| |arrws|
                                              (|Record|
                                               (|:| |ln|
                                                    (|List|
                                                     (|List| (QREFELT $ 6))))
                                               (|:| |mode| (|Symbol|))
                                               (|:| |size| (|DoubleFloat|))))
                                         (|:| |arrw|
                                              (|Record| (|:| |st| (|String|))
                                                        (|:| |en| (|String|))
                                                        (|:| |offset|
                                                             (QREFELT $ 6))
                                                        (|:| |mode| (|Symbol|))
                                                        (|:| |size|
                                                             (|DoubleFloat|))))
                                         (|:| |shpe|
                                              (|Record|
                                               (|:| |shptype| (|Symbol|))
                                               (|:| |centre| (QREFELT $ 6))
                                               (|:| |size| (QREFELT $ 6))
                                               (|:| |fill| (|Boolean|))))
                                         (|:| |nodename|
                                              (|Record| (|:| |nme| (|String|))
                                                        (|:| |node| $)))
                                         (|:| |np|
                                              (|SceneNamedPoints|
                                               (QREFELT $ 6)))
                                         (|:| |empty| #21#))
                                        #9#)))
                     . #20#)
               (EXIT
                (SEQ (LETT |p| NIL . #20#) (LETT #8# |pts2| . #20#) G190
                     (COND
                      ((OR (ATOM #8#) (PROGN (LETT |p| (CAR #8#) . #20#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |res|
                             (SPADCALL |res|
                                       (SPADCALL |tran| |p| (QREFELT $ 149))
                                       (QREFELT $ 185))
                             . #20#)))
                     (LETT #8# (CDR #8#) . #20#) (GO G190) G191 (EXIT NIL))))))
            (COND
             ((EQUAL (QVELT |n| 0) 'ARROWS)
              (SEQ
               (LETT |pts2|
                     (QVELT
                      (PROG2 (LETT #7# (QVELT |n| 2) . #20#)
                          (QCDR #7#)
                        (|check_union2| (QEQCAR #7# 6)
                                        (|Record|
                                         (|:| |ln|
                                              (|List| (|List| (QREFELT $ 6))))
                                         (|:| |mode| (|Symbol|))
                                         (|:| |size| (|DoubleFloat|)))
                                        (|Union|
                                         (|:| |points|
                                              (|List| (|List| (QREFELT $ 6))))
                                         (|:| |material|
                                              (|Record|
                                               (|:| |lineWidth|
                                                    (|DoubleFloat|))
                                               (|:| |lineCol| (|String|))
                                               (|:| |fillCol| (|String|))
                                               (|:| |matOpacity|
                                                    (|DoubleFloat|))))
                                         (|:| |text|
                                              (|Record| (|:| |txt| (|String|))
                                                        (|:| |siz|
                                                             (|NonNegativeInteger|))
                                                        (|:| |pos|
                                                             (QREFELT $ 6))
                                                        (|:| |np|
                                                             (|List|
                                                              (|String|)))))
                                         (|:| |boundbox|
                                              (|SBoundary| (QREFELT $ 6)))
                                         (|:| |trans|
                                              (|STransform| (QREFELT $ 6)))
                                         (|:| |ifs|
                                              (|Record|
                                               (|:| |inx|
                                                    (|List|
                                                     (|List|
                                                      (|NonNegativeInteger|))))
                                               (|:| |pts|
                                                    (|List| (QREFELT $ 6)))))
                                         (|:| |arrws|
                                              (|Record|
                                               (|:| |ln|
                                                    (|List|
                                                     (|List| (QREFELT $ 6))))
                                               (|:| |mode| (|Symbol|))
                                               (|:| |size| (|DoubleFloat|))))
                                         (|:| |arrw|
                                              (|Record| (|:| |st| (|String|))
                                                        (|:| |en| (|String|))
                                                        (|:| |offset|
                                                             (QREFELT $ 6))
                                                        (|:| |mode| (|Symbol|))
                                                        (|:| |size|
                                                             (|DoubleFloat|))))
                                         (|:| |shpe|
                                              (|Record|
                                               (|:| |shptype| (|Symbol|))
                                               (|:| |centre| (QREFELT $ 6))
                                               (|:| |size| (QREFELT $ 6))
                                               (|:| |fill| (|Boolean|))))
                                         (|:| |nodename|
                                              (|Record| (|:| |nme| (|String|))
                                                        (|:| |node| $)))
                                         (|:| |np|
                                              (|SceneNamedPoints|
                                               (QREFELT $ 6)))
                                         (|:| |empty| #21#))
                                        #7#))
                      0)
                     . #20#)
               (EXIT
                (SEQ (LETT |lp| NIL . #20#) (LETT #6# |pts2| . #20#) G190
                     (COND
                      ((OR (ATOM #6#) (PROGN (LETT |lp| (CAR #6#) . #20#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |p| NIL . #20#) (LETT #5# |lp| . #20#) G190
                            (COND
                             ((OR (ATOM #5#)
                                  (PROGN (LETT |p| (CAR #5#) . #20#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |res|
                                    (SPADCALL |res|
                                              (SPADCALL |tran| |p|
                                                        (QREFELT $ 149))
                                              (QREFELT $ 185))
                                    . #20#)))
                            (LETT #5# (CDR #5#) . #20#) (GO G190) G191
                            (EXIT NIL))))
                     (LETT #6# (CDR #6#) . #20#) (GO G190) G191 (EXIT NIL))))))
            (COND
             ((EQUAL (QVELT |n| 0) 'ARROW)
              (LETT |res| (SPADCALL (QREFELT $ 16)) . #20#)))
            (COND
             ((EQUAL (QVELT |n| 0) 'NAMEDPOINTS)
              (LETT |res| (SPADCALL (QREFELT $ 16)) . #20#)))
            (COND
             ((EQUAL (QVELT |n| 0) 'DEF)
              (LETT |res| (SPADCALL (QREFELT $ 16)) . #20#)))
            (COND
             ((EQUAL (QVELT |n| 0) 'USE)
              (LETT |res| (SPADCALL (QREFELT $ 16)) . #20#)))
            (SEQ (LETT |ch| NIL . #20#) (LETT #4# (QVELT |n| 1) . #20#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |ch| (CAR #4#) . #20#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |res2|
                        (|SCENE;boundary1| |ch| |tran2| |scale| |useInteger|
                         |npt| |fontScale2| $)
                        . #20#)
                  (EXIT
                   (LETT |res| (SPADCALL |res| |res2| (QREFELT $ 187))
                         . #20#)))
                 (LETT #4# (CDR #4#) . #20#) (GO G190) G191 (EXIT NIL))
            (EXIT |res|)))
          #22# (EXIT #13#)))) 

(SDEFUN |SCENE;boundary;$DfSb;87|
        ((|n| $) (|fontScale| |DoubleFloat|) ($ |SBoundary| PT))
        (SPROG ((|defaultTransform| (|STransform| PT)))
               (SEQ
                (LETT |defaultTransform| (SPADCALL (QREFELT $ 179))
                      |SCENE;boundary;$DfSb;87|)
                (EXIT
                 (|SCENE;boundary1| |n| |defaultTransform| 1.0 NIL
                  (SPADCALL NIL NIL (QREFELT $ 180))
                  (|div_DF| |fontScale|
                            (FLOAT 1000 MOST-POSITIVE-DOUBLE-FLOAT))
                  $))))) 

(SDEFUN |SCENE;pointString|
        ((|pts| |List| PT) (|tran| |STransform| PT) (|bb| |SBoundary| PT)
         ($ |List| (|String|)))
        (SPROG
         ((|ptStr| (|List| (|String|))) (|thisStr| (|String|)) (|param2| (PT))
          (#1=#:G1781 NIL) (|param| NIL) (|lastValid| (|Boolean|)))
         (SEQ (LETT |ptStr| NIL . #2=(|SCENE;pointString|))
              (LETT |lastValid| 'T . #2#)
              (SEQ (LETT |param| NIL . #2#) (LETT #1# |pts| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |param| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |param2| (SPADCALL |tran| |param| (QREFELT $ 149))
                          . #2#)
                    (LETT |thisStr|
                          (SPADCALL
                           (LIST
                            (|mathObject2String|
                             (SPADCALL |param2| (QREFELT $ 81)))
                            " "
                            (|mathObject2String|
                             (SPADCALL |param2| (QREFELT $ 82)))
                            " "
                            (|mathObject2String|
                             (SPADCALL |param2| (QREFELT $ 188))))
                           (QREFELT $ 118))
                          . #2#)
                    (EXIT
                     (LETT |ptStr| (SPADCALL |ptStr| |thisStr| (QREFELT $ 189))
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |ptStr|)))) 

(SDEFUN |SCENE;pointIndexString|
        ((|pts| |List| (|List| (|NonNegativeInteger|)))
         (|tran| |STransform| PT) (|bb| |SBoundary| PT) ($ |List| (|String|)))
        (SPROG
         ((|ptStr| (|List| (|String|))) (#1=#:G1788 NIL) (|param| NIL)
          (#2=#:G1787 NIL) (|line| NIL))
         (SEQ (LETT |ptStr| NIL . #3=(|SCENE;pointIndexString|))
              (SEQ (LETT |line| NIL . #3#) (LETT #2# |pts| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |line| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (SEQ (LETT |param| NIL . #3#) (LETT #1# |line| . #3#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |param| (CAR #1#) . #3#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |ptStr|
                                 (SPADCALL |ptStr|
                                           (|mathObject2String| |param|)
                                           (QREFELT $ 189))
                                 . #3#)))
                         (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (LETT |ptStr| (SPADCALL |ptStr| "-1" (QREFELT $ 189))
                           . #3#)))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |ptStr|)))) 

(SDEFUN |SCENE;setX3DNodeName| ((|typ| |Symbol|) ($ |String|))
        (SPROG ((|nodeName| (|String|)))
               (SEQ (LETT |nodeName| "" . #1=(|SCENE;setX3DNodeName|))
                    (COND ((EQUAL |typ| 'ROOT) (LETT |nodeName| "X3D" . #1#)))
                    (COND
                     ((EQUAL |typ| 'GROUP) (LETT |nodeName| "Group" . #1#)))
                    (COND
                     ((EQUAL |typ| 'LINE)
                      (LETT |nodeName| "IndexedFaceSet" . #1#)))
                    (COND
                     ((EQUAL |typ| 'SHAPE) (LETT |nodeName| "Sphere" . #1#)))
                    (COND
                     ((EQUAL |typ| 'MATERIAL) (LETT |nodeName| "Group" . #1#)))
                    (COND ((EQUAL |typ| 'TEXT) (LETT |nodeName| "Text" . #1#)))
                    (COND
                     ((EQUAL |typ| 'TRANSFORM)
                      (LETT |nodeName| "Transform" . #1#)))
                    (COND
                     ((EQUAL |typ| 'CLIP) (LETT |nodeName| "Group" . #1#)))
                    (COND
                     ((EQUAL |typ| 'IFS)
                      (LETT |nodeName| "IndexedFaceSet" . #1#)))
                    (COND
                     ((EQUAL |typ| 'ARROWS)
                      (LETT |nodeName| "IndexedFaceSet" . #1#)))
                    (COND ((EQUAL |typ| 'DEF) (LETT |nodeName| "Group" . #1#)))
                    (COND ((EQUAL |typ| 'USE) (LETT |nodeName| "Group" . #1#)))
                    (EXIT |nodeName|)))) 

(SDEFUN |SCENE;toX3D;$RStSbXe;91|
        ((|n| $)
         (|mat| |Record| (|:| |lineWidth| (|DoubleFloat|))
          (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
          (|:| |matOpacity| (|DoubleFloat|)))
         (|tran| |STransform| PT) (|bb| |SBoundary| PT) ($ |XmlElement|))
        (SPROG
         ((|nodeEles| (|List| (|XmlElement|))) (|xch| (|XmlElement|))
          (#1=#:G1850 NIL) (|ch| NIL) (#2=#:G1848 NIL)
          (|ifset| #3=(|XmlElement|)) (|coord| #3#) (#4=#:G1804 NIL)
          (|nodeAtts| (|List| (|XmlAttribute|))) (|ifsR| (|SceneIFS| PT))
          (|meshR| (|List| (|List| PT))) (#5=#:G1805 NIL) (#6=#:G1799 NIL)
          (#7=#:G1801 NIL) (|bb2| (|SBoundary| PT)) (#8=#:G1802 NIL)
          (|tran2| (|STransform| PT)) (#9=#:G1803 NIL)
          (|mat2|
           (|Record| (|:| |lineWidth| (|DoubleFloat|))
                     (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
                     (|:| |matOpacity| (|DoubleFloat|))))
          (#10=#:G1800 NIL) (|inner| #3#) (#11=#:G1849 NIL)
          (|nodeName| (|String|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |nodeName| (|SCENE;setX3DNodeName| (QVELT |n| 0) $)
                  . #12=(|SCENE;toX3D;$RStSbXe;91|))
            (LETT |bb2| |bb| . #12#) (LETT |tran2| |tran| . #12#)
            (LETT |mat2| |mat| . #12#) (LETT |nodeAtts| NIL . #12#)
            (COND
             ((EQUAL (QVELT |n| 0) 'ROOT)
              (SEQ
               (COND
                ((NULL (QEQCAR (QVELT |n| 2) 3))
                 (|error| "toX3D parameter type not valid for root node")))
               (LETT |bb2|
                     (PROG2 (LETT #8# (QVELT |n| 2) . #12#)
                         (QCDR #8#)
                       (|check_union2| (QEQCAR #8# 3)
                                       (|SBoundary| (QREFELT $ 6))
                                       (|Union|
                                        (|:| |points|
                                             (|List| (|List| (QREFELT $ 6))))
                                        (|:| |material|
                                             (|Record|
                                              (|:| |lineWidth| (|DoubleFloat|))
                                              (|:| |lineCol| (|String|))
                                              (|:| |fillCol| (|String|))
                                              (|:| |matOpacity|
                                                   (|DoubleFloat|))))
                                        (|:| |text|
                                             (|Record| (|:| |txt| (|String|))
                                                       (|:| |siz|
                                                            (|NonNegativeInteger|))
                                                       (|:| |pos|
                                                            (QREFELT $ 6))
                                                       (|:| |np|
                                                            (|List|
                                                             (|String|)))))
                                        (|:| |boundbox|
                                             (|SBoundary| (QREFELT $ 6)))
                                        (|:| |trans|
                                             (|STransform| (QREFELT $ 6)))
                                        (|:| |ifs|
                                             (|Record|
                                              (|:| |inx|
                                                   (|List|
                                                    (|List|
                                                     (|NonNegativeInteger|))))
                                              (|:| |pts|
                                                   (|List| (QREFELT $ 6)))))
                                        (|:| |arrws|
                                             (|Record|
                                              (|:| |ln|
                                                   (|List|
                                                    (|List| (QREFELT $ 6))))
                                              (|:| |mode| (|Symbol|))
                                              (|:| |size| (|DoubleFloat|))))
                                        (|:| |arrw|
                                             (|Record| (|:| |st| (|String|))
                                                       (|:| |en| (|String|))
                                                       (|:| |offset|
                                                            (QREFELT $ 6))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                        (|:| |shpe|
                                             (|Record|
                                              (|:| |shptype| (|Symbol|))
                                              (|:| |centre| (QREFELT $ 6))
                                              (|:| |size| (QREFELT $ 6))
                                              (|:| |fill| (|Boolean|))))
                                        (|:| |nodename|
                                             (|Record| (|:| |nme| (|String|))
                                                       (|:| |node| $)))
                                        (|:| |np|
                                             (|SceneNamedPoints|
                                              (QREFELT $ 6)))
                                        (|:| |empty| #13="empty"))
                                       #8#))
                     . #12#)
               (COND
                ((SPADCALL |bb2| (QREFELT $ 164))
                 (LETT |bb2| (SPADCALL |n| 1.0 (QREFELT $ 26)) . #12#)))
               (COND
                ((SPADCALL |bb2| (QREFELT $ 164))
                 (|error| "scene contains no drawable elements")))
               (LETT |nodeEles| NIL . #12#)
               (SEQ (LETT |ch| NIL . #12#) (LETT #11# (QVELT |n| 1) . #12#)
                    G190
                    (COND
                     ((OR (ATOM #11#)
                          (PROGN (LETT |ch| (CAR #11#) . #12#) NIL))
                      (GO G191)))
                    (SEQ
                     (LETT |xch|
                           (SPADCALL |ch| |mat2| |tran2| |bb2| (QREFELT $ 190))
                           . #12#)
                     (EXIT
                      (COND
                       ((NULL (SPADCALL |xch| (QREFELT $ 170)))
                        (LETT |nodeEles|
                              (SPADCALL |nodeEles| |xch| (QREFELT $ 163))
                              . #12#)))))
                    (LETT #11# (CDR #11#) . #12#) (GO G190) G191 (EXIT NIL))
               (LETT |inner|
                     (SPADCALL "Scene" |nodeEles| |nodeAtts| (QREFELT $ 161))
                     . #12#)
               (EXIT
                (PROGN
                 (LETT #2#
                       (SPADCALL |nodeName| (LIST |inner|) |nodeAtts|
                                 (QREFELT $ 161))
                       . #12#)
                 (GO #14=#:G1847))))))
            (COND
             ((EQUAL (QVELT |n| 0) 'MATERIAL)
              (LETT |mat2|
                    (PROG2 (LETT #10# (QVELT |n| 2) . #12#)
                        (QCDR #10#)
                      (|check_union2| (QEQCAR #10# 1)
                                      (|Record|
                                       (|:| |lineWidth| (|DoubleFloat|))
                                       (|:| |lineCol| (|String|))
                                       (|:| |fillCol| (|String|))
                                       (|:| |matOpacity| (|DoubleFloat|)))
                                      (|Union|
                                       (|:| |points|
                                            (|List| (|List| (QREFELT $ 6))))
                                       (|:| |material|
                                            (|Record|
                                             (|:| |lineWidth| (|DoubleFloat|))
                                             (|:| |lineCol| (|String|))
                                             (|:| |fillCol| (|String|))
                                             (|:| |matOpacity|
                                                  (|DoubleFloat|))))
                                       (|:| |text|
                                            (|Record| (|:| |txt| (|String|))
                                                      (|:| |siz|
                                                           (|NonNegativeInteger|))
                                                      (|:| |pos| (QREFELT $ 6))
                                                      (|:| |np|
                                                           (|List|
                                                            (|String|)))))
                                       (|:| |boundbox|
                                            (|SBoundary| (QREFELT $ 6)))
                                       (|:| |trans|
                                            (|STransform| (QREFELT $ 6)))
                                       (|:| |ifs|
                                            (|Record|
                                             (|:| |inx|
                                                  (|List|
                                                   (|List|
                                                    (|NonNegativeInteger|))))
                                             (|:| |pts|
                                                  (|List| (QREFELT $ 6)))))
                                       (|:| |arrws|
                                            (|Record|
                                             (|:| |ln|
                                                  (|List|
                                                   (|List| (QREFELT $ 6))))
                                             (|:| |mode| (|Symbol|))
                                             (|:| |size| (|DoubleFloat|))))
                                       (|:| |arrw|
                                            (|Record| (|:| |st| (|String|))
                                                      (|:| |en| (|String|))
                                                      (|:| |offset|
                                                           (QREFELT $ 6))
                                                      (|:| |mode| (|Symbol|))
                                                      (|:| |size|
                                                           (|DoubleFloat|))))
                                       (|:| |shpe|
                                            (|Record|
                                             (|:| |shptype| (|Symbol|))
                                             (|:| |centre| (QREFELT $ 6))
                                             (|:| |size| (QREFELT $ 6))
                                             (|:| |fill| (|Boolean|))))
                                       (|:| |nodename|
                                            (|Record| (|:| |nme| (|String|))
                                                      (|:| |node| $)))
                                       (|:| |np|
                                            (|SceneNamedPoints| (QREFELT $ 6)))
                                       (|:| |empty| #13#))
                                      #10#))
                    . #12#)))
            (COND
             ((EQUAL (QVELT |n| 0) 'TRANSFORM)
              (SEQ
               (COND
                ((NULL (QEQCAR (QVELT |n| 2) 4))
                 (|error| "toX3D parameter type not valid for trans node")))
               (EXIT
                (LETT |tran2|
                      (SPADCALL
                       (PROG2 (LETT #9# (QVELT |n| 2) . #12#)
                           (QCDR #9#)
                         (|check_union2| (QEQCAR #9# 4)
                                         (|STransform| (QREFELT $ 6))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT $ 6))))
                                          (|:| |material|
                                               (|Record|
                                                (|:| |lineWidth|
                                                     (|DoubleFloat|))
                                                (|:| |lineCol| (|String|))
                                                (|:| |fillCol| (|String|))
                                                (|:| |matOpacity|
                                                     (|DoubleFloat|))))
                                          (|:| |text|
                                               (|Record| (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT $ 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT $ 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT $ 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT $ 6))
                                                (|:| |size| (QREFELT $ 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| $)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT $ 6)))
                                          (|:| |empty| #13#))
                                         #9#))
                       |tran| (QREFELT $ 171))
                      . #12#)))))
            (COND
             ((EQUAL (QVELT |n| 0) 'CLIP)
              (SEQ
               (COND
                ((NULL (QEQCAR (QVELT |n| 2) 3))
                 (|error| "toX3D parameter type not valid for clip node")))
               (EXIT
                (LETT |bb2|
                      (PROG2 (LETT #8# (QVELT |n| 2) . #12#)
                          (QCDR #8#)
                        (|check_union2| (QEQCAR #8# 3)
                                        (|SBoundary| (QREFELT $ 6))
                                        (|Union|
                                         (|:| |points|
                                              (|List| (|List| (QREFELT $ 6))))
                                         (|:| |material|
                                              (|Record|
                                               (|:| |lineWidth|
                                                    (|DoubleFloat|))
                                               (|:| |lineCol| (|String|))
                                               (|:| |fillCol| (|String|))
                                               (|:| |matOpacity|
                                                    (|DoubleFloat|))))
                                         (|:| |text|
                                              (|Record| (|:| |txt| (|String|))
                                                        (|:| |siz|
                                                             (|NonNegativeInteger|))
                                                        (|:| |pos|
                                                             (QREFELT $ 6))
                                                        (|:| |np|
                                                             (|List|
                                                              (|String|)))))
                                         (|:| |boundbox|
                                              (|SBoundary| (QREFELT $ 6)))
                                         (|:| |trans|
                                              (|STransform| (QREFELT $ 6)))
                                         (|:| |ifs|
                                              (|Record|
                                               (|:| |inx|
                                                    (|List|
                                                     (|List|
                                                      (|NonNegativeInteger|))))
                                               (|:| |pts|
                                                    (|List| (QREFELT $ 6)))))
                                         (|:| |arrws|
                                              (|Record|
                                               (|:| |ln|
                                                    (|List|
                                                     (|List| (QREFELT $ 6))))
                                               (|:| |mode| (|Symbol|))
                                               (|:| |size| (|DoubleFloat|))))
                                         (|:| |arrw|
                                              (|Record| (|:| |st| (|String|))
                                                        (|:| |en| (|String|))
                                                        (|:| |offset|
                                                             (QREFELT $ 6))
                                                        (|:| |mode| (|Symbol|))
                                                        (|:| |size|
                                                             (|DoubleFloat|))))
                                         (|:| |shpe|
                                              (|Record|
                                               (|:| |shptype| (|Symbol|))
                                               (|:| |centre| (QREFELT $ 6))
                                               (|:| |size| (QREFELT $ 6))
                                               (|:| |fill| (|Boolean|))))
                                         (|:| |nodename|
                                              (|Record| (|:| |nme| (|String|))
                                                        (|:| |node| $)))
                                         (|:| |np|
                                              (|SceneNamedPoints|
                                               (QREFELT $ 6)))
                                         (|:| |empty| #13#))
                                        #8#))
                      . #12#)))))
            (COND
             ((EQUAL (QVELT |n| 0) 'TEXT)
              (SEQ
               (COND
                ((NULL (QEQCAR (QVELT |n| 2) 2))
                 (|error| "toX3D parameter type not valid for text node")))
               (EXIT
                (LETT |nodeAtts|
                      (LIST
                       (SPADCALL "string"
                                 (QVELT
                                  (PROG2 (LETT #7# (QVELT |n| 2) . #12#)
                                      (QCDR #7#)
                                    (|check_union2| (QEQCAR #7# 2)
                                                    (|Record|
                                                     (|:| |txt| (|String|))
                                                     (|:| |siz|
                                                          (|NonNegativeInteger|))
                                                     (|:| |pos| (QREFELT $ 6))
                                                     (|:| |np|
                                                          (|List| (|String|))))
                                                    (|Union|
                                                     (|:| |points|
                                                          (|List|
                                                           (|List|
                                                            (QREFELT $ 6))))
                                                     (|:| |material|
                                                          (|Record|
                                                           (|:| |lineWidth|
                                                                (|DoubleFloat|))
                                                           (|:| |lineCol|
                                                                (|String|))
                                                           (|:| |fillCol|
                                                                (|String|))
                                                           (|:| |matOpacity|
                                                                (|DoubleFloat|))))
                                                     (|:| |text|
                                                          (|Record|
                                                           (|:| |txt|
                                                                (|String|))
                                                           (|:| |siz|
                                                                (|NonNegativeInteger|))
                                                           (|:| |pos|
                                                                (QREFELT $ 6))
                                                           (|:| |np|
                                                                (|List|
                                                                 (|String|)))))
                                                     (|:| |boundbox|
                                                          (|SBoundary|
                                                           (QREFELT $ 6)))
                                                     (|:| |trans|
                                                          (|STransform|
                                                           (QREFELT $ 6)))
                                                     (|:| |ifs|
                                                          (|Record|
                                                           (|:| |inx|
                                                                (|List|
                                                                 (|List|
                                                                  (|NonNegativeInteger|))))
                                                           (|:| |pts|
                                                                (|List|
                                                                 (QREFELT $
                                                                          6)))))
                                                     (|:| |arrws|
                                                          (|Record|
                                                           (|:| |ln|
                                                                (|List|
                                                                 (|List|
                                                                  (QREFELT $
                                                                           6))))
                                                           (|:| |mode|
                                                                (|Symbol|))
                                                           (|:| |size|
                                                                (|DoubleFloat|))))
                                                     (|:| |arrw|
                                                          (|Record|
                                                           (|:| |st|
                                                                (|String|))
                                                           (|:| |en|
                                                                (|String|))
                                                           (|:| |offset|
                                                                (QREFELT $ 6))
                                                           (|:| |mode|
                                                                (|Symbol|))
                                                           (|:| |size|
                                                                (|DoubleFloat|))))
                                                     (|:| |shpe|
                                                          (|Record|
                                                           (|:| |shptype|
                                                                (|Symbol|))
                                                           (|:| |centre|
                                                                (QREFELT $ 6))
                                                           (|:| |size|
                                                                (QREFELT $ 6))
                                                           (|:| |fill|
                                                                (|Boolean|))))
                                                     (|:| |nodename|
                                                          (|Record|
                                                           (|:| |nme|
                                                                (|String|))
                                                           (|:| |node| $)))
                                                     (|:| |np|
                                                          (|SceneNamedPoints|
                                                           (QREFELT $ 6)))
                                                     (|:| |empty| #13#))
                                                    #7#))
                                  0)
                                 (QREFELT $ 158)))
                      . #12#)))))
            (COND
             ((EQUAL (QVELT |n| 0) 'LINE)
              (SEQ
               (COND
                ((NULL (QEQCAR (QVELT |n| 2) 0))
                 (|error| "toX3D parameter type not valid for line node")))
               (LETT |meshR|
                     (SPADCALL
                      (|SPADfirst|
                       (PROG2 (LETT #6# (QVELT |n| 2) . #12#)
                           (QCDR #6#)
                         (|check_union2| (QEQCAR #6# 0)
                                         (|List| (|List| (QREFELT $ 6)))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT $ 6))))
                                          (|:| |material|
                                               (|Record|
                                                (|:| |lineWidth|
                                                     (|DoubleFloat|))
                                                (|:| |lineCol| (|String|))
                                                (|:| |fillCol| (|String|))
                                                (|:| |matOpacity|
                                                     (|DoubleFloat|))))
                                          (|:| |text|
                                               (|Record| (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT $ 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT $ 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT $ 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT $ 6))
                                                (|:| |size| (QREFELT $ 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| $)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT $ 6)))
                                          (|:| |empty| #13#))
                                         #6#)))
                      (SPADCALL (SPADCALL 25 -2 10 (QREFELT $ 90))
                                (QREFELT $ 91))
                      8 (QREFELT $ 191))
                     . #12#)
               (LETT |ifsR| (SPADCALL |meshR| NIL (QREFELT $ 192)) . #12#)
               (LETT |nodeAtts|
                     (LIST
                      (SPADCALL "coordIndex"
                                (|SCENE;pointIndexString|
                                 (SPADCALL |ifsR| (QREFELT $ 61)) |tran| |bb|
                                 $)
                                (QREFELT $ 193)))
                     . #12#)
               (LETT |coord|
                     (SPADCALL "Coordinate" NIL
                               (LIST
                                (SPADCALL "point"
                                          (|SCENE;pointString|
                                           (SPADCALL |ifsR| (QREFELT $ 62))
                                           |tran| |bb| $)
                                          (QREFELT $ 193)))
                               (QREFELT $ 161))
                     . #12#)
               (LETT |ifset|
                     (SPADCALL |nodeName| (LIST |coord|) |nodeAtts|
                               (QREFELT $ 161))
                     . #12#)
               (EXIT
                (PROGN
                 (LETT #2#
                       (SPADCALL "Shape" (LIST |ifset|) NIL (QREFELT $ 161))
                       . #12#)
                 (GO #14#))))))
            (COND
             ((EQUAL (QVELT |n| 0) 'SHAPE)
              (COND
               ((NULL (QEQCAR (QVELT |n| 2) 8))
                (|error| "toX3D parameter type not valid for text node")))))
            (COND
             ((EQUAL (QVELT |n| 0) 'ARROWS)
              (SEQ
               (COND
                ((NULL (QEQCAR (QVELT |n| 2) 6))
                 (|error| "toX3D parameter type not valid for arrws node")))
               (LETT |meshR|
                     (SPADCALL
                      (|SPADfirst|
                       (QVELT
                        (PROG2 (LETT #5# (QVELT |n| 2) . #12#)
                            (QCDR #5#)
                          (|check_union2| (QEQCAR #5# 6)
                                          (|Record|
                                           (|:| |ln|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |mode| (|Symbol|))
                                           (|:| |size| (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #13#))
                                          #5#))
                        0))
                      (SPADCALL (SPADCALL 25 -2 10 (QREFELT $ 90))
                                (QREFELT $ 91))
                      8 (QREFELT $ 191))
                     . #12#)
               (LETT |ifsR| (SPADCALL |meshR| NIL (QREFELT $ 192)) . #12#)
               (LETT |nodeAtts|
                     (LIST
                      (SPADCALL "coordIndex"
                                (|SCENE;pointIndexString|
                                 (SPADCALL |ifsR| (QREFELT $ 61)) |tran| |bb|
                                 $)
                                (QREFELT $ 193)))
                     . #12#)
               (LETT |coord|
                     (SPADCALL "Coordinate" NIL
                               (LIST
                                (SPADCALL "point"
                                          (|SCENE;pointString|
                                           (SPADCALL |ifsR| (QREFELT $ 62))
                                           |tran| |bb| $)
                                          (QREFELT $ 193)))
                               (QREFELT $ 161))
                     . #12#)
               (LETT |ifset|
                     (SPADCALL |nodeName| (LIST |coord|) |nodeAtts|
                               (QREFELT $ 161))
                     . #12#)
               (EXIT
                (PROGN
                 (LETT #2#
                       (SPADCALL "Shape" (LIST |ifset|) NIL (QREFELT $ 161))
                       . #12#)
                 (GO #14#))))))
            (COND
             ((EQUAL (QVELT |n| 0) 'IFS)
              (SEQ
               (COND
                ((NULL (QEQCAR (QVELT |n| 2) 5))
                 (|error| "toX3D parameter type not valid for ifs node")))
               (LETT |nodeAtts|
                     (LIST
                      (SPADCALL "coordIndex"
                                (|SCENE;pointIndexString|
                                 (QCAR
                                  (PROG2 (LETT #4# (QVELT |n| 2) . #12#)
                                      (QCDR #4#)
                                    (|check_union2| (QEQCAR #4# 5)
                                                    (|Record|
                                                     (|:| |inx|
                                                          (|List|
                                                           (|List|
                                                            (|NonNegativeInteger|))))
                                                     (|:| |pts|
                                                          (|List|
                                                           (QREFELT $ 6))))
                                                    (|Union|
                                                     (|:| |points|
                                                          (|List|
                                                           (|List|
                                                            (QREFELT $ 6))))
                                                     (|:| |material|
                                                          (|Record|
                                                           (|:| |lineWidth|
                                                                (|DoubleFloat|))
                                                           (|:| |lineCol|
                                                                (|String|))
                                                           (|:| |fillCol|
                                                                (|String|))
                                                           (|:| |matOpacity|
                                                                (|DoubleFloat|))))
                                                     (|:| |text|
                                                          (|Record|
                                                           (|:| |txt|
                                                                (|String|))
                                                           (|:| |siz|
                                                                (|NonNegativeInteger|))
                                                           (|:| |pos|
                                                                (QREFELT $ 6))
                                                           (|:| |np|
                                                                (|List|
                                                                 (|String|)))))
                                                     (|:| |boundbox|
                                                          (|SBoundary|
                                                           (QREFELT $ 6)))
                                                     (|:| |trans|
                                                          (|STransform|
                                                           (QREFELT $ 6)))
                                                     (|:| |ifs|
                                                          (|Record|
                                                           (|:| |inx|
                                                                (|List|
                                                                 (|List|
                                                                  (|NonNegativeInteger|))))
                                                           (|:| |pts|
                                                                (|List|
                                                                 (QREFELT $
                                                                          6)))))
                                                     (|:| |arrws|
                                                          (|Record|
                                                           (|:| |ln|
                                                                (|List|
                                                                 (|List|
                                                                  (QREFELT $
                                                                           6))))
                                                           (|:| |mode|
                                                                (|Symbol|))
                                                           (|:| |size|
                                                                (|DoubleFloat|))))
                                                     (|:| |arrw|
                                                          (|Record|
                                                           (|:| |st|
                                                                (|String|))
                                                           (|:| |en|
                                                                (|String|))
                                                           (|:| |offset|
                                                                (QREFELT $ 6))
                                                           (|:| |mode|
                                                                (|Symbol|))
                                                           (|:| |size|
                                                                (|DoubleFloat|))))
                                                     (|:| |shpe|
                                                          (|Record|
                                                           (|:| |shptype|
                                                                (|Symbol|))
                                                           (|:| |centre|
                                                                (QREFELT $ 6))
                                                           (|:| |size|
                                                                (QREFELT $ 6))
                                                           (|:| |fill|
                                                                (|Boolean|))))
                                                     (|:| |nodename|
                                                          (|Record|
                                                           (|:| |nme|
                                                                (|String|))
                                                           (|:| |node| $)))
                                                     (|:| |np|
                                                          (|SceneNamedPoints|
                                                           (QREFELT $ 6)))
                                                     (|:| |empty| #13#))
                                                    #4#)))
                                 |tran| |bb| $)
                                (QREFELT $ 193)))
                     . #12#)
               (LETT |coord|
                     (SPADCALL "Coordinate" NIL
                               (LIST
                                (SPADCALL "point"
                                          (|SCENE;pointString|
                                           (QCDR
                                            (PROG2
                                                (LETT #4# (QVELT |n| 2) . #12#)
                                                (QCDR #4#)
                                              (|check_union2| (QEQCAR #4# 5)
                                                              (|Record|
                                                               (|:| |inx|
                                                                    (|List|
                                                                     (|List|
                                                                      (|NonNegativeInteger|))))
                                                               (|:| |pts|
                                                                    (|List|
                                                                     (QREFELT $
                                                                              6))))
                                                              (|Union|
                                                               (|:| |points|
                                                                    (|List|
                                                                     (|List|
                                                                      (QREFELT
                                                                       $ 6))))
                                                               (|:| |material|
                                                                    (|Record|
                                                                     (|:|
                                                                      |lineWidth|
                                                                      (|DoubleFloat|))
                                                                     (|:|
                                                                      |lineCol|
                                                                      (|String|))
                                                                     (|:|
                                                                      |fillCol|
                                                                      (|String|))
                                                                     (|:|
                                                                      |matOpacity|
                                                                      (|DoubleFloat|))))
                                                               (|:| |text|
                                                                    (|Record|
                                                                     (|:| |txt|
                                                                          (|String|))
                                                                     (|:| |siz|
                                                                          (|NonNegativeInteger|))
                                                                     (|:| |pos|
                                                                          (QREFELT
                                                                           $
                                                                           6))
                                                                     (|:| |np|
                                                                          (|List|
                                                                           (|String|)))))
                                                               (|:| |boundbox|
                                                                    (|SBoundary|
                                                                     (QREFELT $
                                                                              6)))
                                                               (|:| |trans|
                                                                    (|STransform|
                                                                     (QREFELT $
                                                                              6)))
                                                               (|:| |ifs|
                                                                    (|Record|
                                                                     (|:| |inx|
                                                                          (|List|
                                                                           (|List|
                                                                            (|NonNegativeInteger|))))
                                                                     (|:| |pts|
                                                                          (|List|
                                                                           (QREFELT
                                                                            $
                                                                            6)))))
                                                               (|:| |arrws|
                                                                    (|Record|
                                                                     (|:| |ln|
                                                                          (|List|
                                                                           (|List|
                                                                            (QREFELT
                                                                             $
                                                                             6))))
                                                                     (|:|
                                                                      |mode|
                                                                      (|Symbol|))
                                                                     (|:|
                                                                      |size|
                                                                      (|DoubleFloat|))))
                                                               (|:| |arrw|
                                                                    (|Record|
                                                                     (|:| |st|
                                                                          (|String|))
                                                                     (|:| |en|
                                                                          (|String|))
                                                                     (|:|
                                                                      |offset|
                                                                      (QREFELT
                                                                       $ 6))
                                                                     (|:|
                                                                      |mode|
                                                                      (|Symbol|))
                                                                     (|:|
                                                                      |size|
                                                                      (|DoubleFloat|))))
                                                               (|:| |shpe|
                                                                    (|Record|
                                                                     (|:|
                                                                      |shptype|
                                                                      (|Symbol|))
                                                                     (|:|
                                                                      |centre|
                                                                      (QREFELT
                                                                       $ 6))
                                                                     (|:|
                                                                      |size|
                                                                      (QREFELT
                                                                       $ 6))
                                                                     (|:|
                                                                      |fill|
                                                                      (|Boolean|))))
                                                               (|:| |nodename|
                                                                    (|Record|
                                                                     (|:| |nme|
                                                                          (|String|))
                                                                     (|:|
                                                                      |node|
                                                                      $)))
                                                               (|:| |np|
                                                                    (|SceneNamedPoints|
                                                                     (QREFELT $
                                                                              6)))
                                                               (|:| |empty|
                                                                    #13#))
                                                              #4#)))
                                           |tran2| |bb2| $)
                                          (QREFELT $ 193)))
                               (QREFELT $ 161))
                     . #12#)
               (LETT |ifset|
                     (SPADCALL |nodeName| (LIST |coord|) |nodeAtts|
                               (QREFELT $ 161))
                     . #12#)
               (EXIT
                (PROGN
                 (LETT #2#
                       (SPADCALL "Shape" (LIST |ifset|) NIL (QREFELT $ 161))
                       . #12#)
                 (GO #14#))))))
            (COND
             ((EQUAL (QVELT |n| 0) 'DEF)
              (COND
               ((NULL (QEQCAR (QVELT |n| 2) 9))
                (|error| "toSVG parameter type not valid for def node")))))
            (COND
             ((EQUAL (QVELT |n| 0) 'USE)
              (COND
               ((NULL (QEQCAR (QVELT |n| 2) 9))
                (|error| "toSVG parameter type not valid for use node")))))
            (EXIT
             (COND
              ((< (SPADCALL (QVELT |n| 1) (QREFELT $ 177)) 1)
               (SPADCALL |nodeName| NIL |nodeAtts| (QREFELT $ 161)))
              ('T
               (SEQ (LETT |nodeEles| NIL . #12#)
                    (SEQ (LETT |ch| NIL . #12#) (LETT #1# (QVELT |n| 1) . #12#)
                         G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |ch| (CAR #1#) . #12#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |xch|
                                (SPADCALL |ch| |mat2| |tran2| |bb2|
                                          (QREFELT $ 190))
                                . #12#)
                          (EXIT
                           (COND
                            ((NULL (SPADCALL |xch| (QREFELT $ 170)))
                             (LETT |nodeEles|
                                   (SPADCALL |nodeEles| |xch| (QREFELT $ 163))
                                   . #12#)))))
                         (LETT #1# (CDR #1#) . #12#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (SPADCALL |nodeName| |nodeEles| |nodeAtts|
                               (QREFELT $ 161)))))))))
          #14# (EXIT #2#)))) 

(SDEFUN |SCENE;toX3D;$RStRXe;92|
        ((|n| $)
         (|mat| |Record| (|:| |lineWidth| (|DoubleFloat|))
          (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
          (|:| |matOpacity| (|DoubleFloat|)))
         (|tran| |STransform| PT)
         (|bb| |Record| (|:| |mins| PT) (|:| |maxs| PT)) ($ |XmlElement|))
        (SPADCALL |n| |mat| |tran|
                  (SPADCALL (QCAR |bb|) (QCDR |bb|) (QREFELT $ 10))
                  (QREFELT $ 190))) 

(SDEFUN |SCENE;writeX3d;$SV;93| ((|n| $) (|filename| |String|) ($ |Void|))
        (SPROG
         ((|defaultBounds| (|SBoundary| PT))
          (|defaultTransform| (|STransform| PT))
          (|defaultMaterial|
           (|Record| (|:| |lineWidth| (|DoubleFloat|))
                     (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
                     (|:| |matOpacity| (|DoubleFloat|)))))
         (SEQ
          (LETT |defaultMaterial|
                (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "black" "black"
                        1.0)
                . #1=(|SCENE;writeX3d;$SV;93|))
          (LETT |defaultTransform| (SPADCALL (QREFELT $ 179)) . #1#)
          (LETT |defaultBounds| (SPADCALL (QREFELT $ 16)) . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL |n| |defaultMaterial| |defaultTransform| |defaultBounds|
                      (QREFELT $ 190))
            |filename| (QREFELT $ 182)))))) 

(SDEFUN |SCENE;toObj;$RRRStSbV;94|
        ((|n| $) (|ptLst| |Reference| (|List| PT))
         (|indexLst| |Reference| (|List| (|List| (|NonNegativeInteger|))))
         (|indexNxt| |Reference| (|NonNegativeInteger|))
         (|tran| |STransform| PT) (|bb| |SBoundary| PT) ($ |Void|))
        (SPROG
         ((#1=#:G1931 NIL) (|ch| NIL) (#2=#:G1917 NIL)
          (|i2| (|List| (|List| (|NonNegativeInteger|)))) (#3=#:G1930 NIL)
          (|j| NIL) (#4=#:G1929 NIL) (#5=#:G1928 NIL) (|k| NIL)
          (#6=#:G1927 NIL) (|p1| (|List| PT)) (#7=#:G1870 NIL)
          (|i1| (|List| (|List| (|NonNegativeInteger|)))) (#8=#:G1926 NIL)
          (#9=#:G1925 NIL) (#10=#:G1924 NIL) (#11=#:G1923 NIL)
          (|ifsR| (|SceneIFS| PT)) (|meshR| (|List| (|List| PT)))
          (#12=#:G1865 NIL) (#13=#:G1922 NIL) (#14=#:G1921 NIL)
          (#15=#:G1920 NIL) (#16=#:G1919 NIL) (|bb2| (|SBoundary| PT))
          (#17=#:G1868 NIL) (|tran2| (|STransform| PT)) (#18=#:G1869 NIL)
          (#19=#:G1918 NIL) (|mx| (PT)) (|mn| (PT))
          (|offsety| #20=(|DoubleFloat|)) (|offsetRequired| (|Boolean|))
          (|offsetx| #20#) (|miny| (|DoubleFloat|)) (|minx| (|DoubleFloat|))
          (|nodeName| (|String|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |nodeName| (|SCENE;setX3DNodeName| (QVELT |n| 0) $)
                  . #21=(|SCENE;toObj;$RRRStSbV;94|))
            (LETT |bb2| |bb| . #21#) (LETT |tran2| |tran| . #21#)
            (COND
             ((EQUAL (QVELT |n| 0) 'ROOT)
              (SEQ
               (COND
                ((NULL (QEQCAR (QVELT |n| 2) 3))
                 (|error| "toObj parameter type not valid for root node")))
               (LETT |bb2|
                     (PROG2 (LETT #17# (QVELT |n| 2) . #21#)
                         (QCDR #17#)
                       (|check_union2| (QEQCAR #17# 3)
                                       (|SBoundary| (QREFELT $ 6))
                                       (|Union|
                                        (|:| |points|
                                             (|List| (|List| (QREFELT $ 6))))
                                        (|:| |material|
                                             (|Record|
                                              (|:| |lineWidth| (|DoubleFloat|))
                                              (|:| |lineCol| (|String|))
                                              (|:| |fillCol| (|String|))
                                              (|:| |matOpacity|
                                                   (|DoubleFloat|))))
                                        (|:| |text|
                                             (|Record| (|:| |txt| (|String|))
                                                       (|:| |siz|
                                                            (|NonNegativeInteger|))
                                                       (|:| |pos|
                                                            (QREFELT $ 6))
                                                       (|:| |np|
                                                            (|List|
                                                             (|String|)))))
                                        (|:| |boundbox|
                                             (|SBoundary| (QREFELT $ 6)))
                                        (|:| |trans|
                                             (|STransform| (QREFELT $ 6)))
                                        (|:| |ifs|
                                             (|Record|
                                              (|:| |inx|
                                                   (|List|
                                                    (|List|
                                                     (|NonNegativeInteger|))))
                                              (|:| |pts|
                                                   (|List| (QREFELT $ 6)))))
                                        (|:| |arrws|
                                             (|Record|
                                              (|:| |ln|
                                                   (|List|
                                                    (|List| (QREFELT $ 6))))
                                              (|:| |mode| (|Symbol|))
                                              (|:| |size| (|DoubleFloat|))))
                                        (|:| |arrw|
                                             (|Record| (|:| |st| (|String|))
                                                       (|:| |en| (|String|))
                                                       (|:| |offset|
                                                            (QREFELT $ 6))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                        (|:| |shpe|
                                             (|Record|
                                              (|:| |shptype| (|Symbol|))
                                              (|:| |centre| (QREFELT $ 6))
                                              (|:| |size| (QREFELT $ 6))
                                              (|:| |fill| (|Boolean|))))
                                        (|:| |nodename|
                                             (|Record| (|:| |nme| (|String|))
                                                       (|:| |node| $)))
                                        (|:| |np|
                                             (|SceneNamedPoints|
                                              (QREFELT $ 6)))
                                        (|:| |empty| #22="empty"))
                                       #17#))
                     . #21#)
               (COND
                ((SPADCALL |bb2| (QREFELT $ 164))
                 (LETT |bb2| (SPADCALL |n| 1.0 (QREFELT $ 26)) . #21#)))
               (COND
                ((SPADCALL |bb2| (QREFELT $ 164))
                 (|error| "scene contains no drawable elements")))
               (LETT |minx|
                     (SPADCALL (SPADCALL |bb2| (QREFELT $ 38)) (QREFELT $ 81))
                     . #21#)
               (LETT |miny|
                     (SPADCALL (SPADCALL |bb2| (QREFELT $ 38)) (QREFELT $ 82))
                     . #21#)
               (LETT |offsetx| 0.0 . #21#) (LETT |offsety| 0.0 . #21#)
               (LETT |offsetRequired| NIL . #21#)
               (COND
                ((|less_DF| |minx| 0.0)
                 (SEQ (LETT |offsetRequired| 'T . #21#)
                      (EXIT (LETT |offsetx| (|minus_DF| |minx|) . #21#)))))
               (COND
                ((|less_DF| |miny| 0.0)
                 (SEQ (LETT |offsetRequired| 'T . #21#)
                      (EXIT (LETT |offsety| (|minus_DF| |miny|) . #21#)))))
               (COND
                (|offsetRequired|
                 (SEQ
                  (LETT |mn|
                        (SPADCALL
                         (|add_DF|
                          (SPADCALL (SPADCALL |bb2| (QREFELT $ 38))
                                    (QREFELT $ 81))
                          |offsetx|)
                         (|add_DF|
                          (SPADCALL (SPADCALL |bb2| (QREFELT $ 38))
                                    (QREFELT $ 82))
                          |offsety|)
                         (QREFELT $ 83))
                        . #21#)
                  (LETT |mx|
                        (SPADCALL
                         (|add_DF|
                          (SPADCALL (SPADCALL |bb2| (QREFELT $ 37))
                                    (QREFELT $ 81))
                          |offsetx|)
                         (|add_DF|
                          (SPADCALL (SPADCALL |bb2| (QREFELT $ 37))
                                    (QREFELT $ 82))
                          |offsety|)
                         (QREFELT $ 83))
                        . #21#)
                  (LETT |bb2| (SPADCALL |mn| |mx| (QREFELT $ 10)) . #21#)
                  (EXIT
                   (LETT |tran2|
                         (SPADCALL |offsetx| |offsety| 0.0 1.0 1.0 1.0
                                   (QREFELT $ 165))
                         . #21#)))))
               (SEQ (LETT |ch| NIL . #21#) (LETT #19# (QVELT |n| 1) . #21#)
                    G190
                    (COND
                     ((OR (ATOM #19#)
                          (PROGN (LETT |ch| (CAR #19#) . #21#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (SPADCALL |ch| |ptLst| |indexLst| |indexNxt| |tran2|
                                |bb2| (QREFELT $ 199))))
                    (LETT #19# (CDR #19#) . #21#) (GO G190) G191 (EXIT NIL))
               (EXIT (PROGN (LETT #2# (|Void|) . #21#) (GO #23=#:G1916))))))
            (COND
             ((EQUAL (QVELT |n| 0) 'TRANSFORM)
              (SEQ
               (COND
                ((NULL (QEQCAR (QVELT |n| 2) 4))
                 (|error| "toObj parameter type not valid for trans node")))
               (EXIT
                (LETT |tran2|
                      (SPADCALL
                       (PROG2 (LETT #18# (QVELT |n| 2) . #21#)
                           (QCDR #18#)
                         (|check_union2| (QEQCAR #18# 4)
                                         (|STransform| (QREFELT $ 6))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT $ 6))))
                                          (|:| |material|
                                               (|Record|
                                                (|:| |lineWidth|
                                                     (|DoubleFloat|))
                                                (|:| |lineCol| (|String|))
                                                (|:| |fillCol| (|String|))
                                                (|:| |matOpacity|
                                                     (|DoubleFloat|))))
                                          (|:| |text|
                                               (|Record| (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT $ 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT $ 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT $ 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT $ 6))
                                                (|:| |size| (QREFELT $ 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| $)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT $ 6)))
                                          (|:| |empty| #22#))
                                         #18#))
                       |tran| (QREFELT $ 171))
                      . #21#)))))
            (COND
             ((EQUAL (QVELT |n| 0) 'CLIP)
              (SEQ
               (COND
                ((NULL (QEQCAR (QVELT |n| 2) 3))
                 (|error| "toObj parameter type not valid for clip node")))
               (LETT |bb2|
                     (PROG2 (LETT #17# (QVELT |n| 2) . #21#)
                         (QCDR #17#)
                       (|check_union2| (QEQCAR #17# 3)
                                       (|SBoundary| (QREFELT $ 6))
                                       (|Union|
                                        (|:| |points|
                                             (|List| (|List| (QREFELT $ 6))))
                                        (|:| |material|
                                             (|Record|
                                              (|:| |lineWidth| (|DoubleFloat|))
                                              (|:| |lineCol| (|String|))
                                              (|:| |fillCol| (|String|))
                                              (|:| |matOpacity|
                                                   (|DoubleFloat|))))
                                        (|:| |text|
                                             (|Record| (|:| |txt| (|String|))
                                                       (|:| |siz|
                                                            (|NonNegativeInteger|))
                                                       (|:| |pos|
                                                            (QREFELT $ 6))
                                                       (|:| |np|
                                                            (|List|
                                                             (|String|)))))
                                        (|:| |boundbox|
                                             (|SBoundary| (QREFELT $ 6)))
                                        (|:| |trans|
                                             (|STransform| (QREFELT $ 6)))
                                        (|:| |ifs|
                                             (|Record|
                                              (|:| |inx|
                                                   (|List|
                                                    (|List|
                                                     (|NonNegativeInteger|))))
                                              (|:| |pts|
                                                   (|List| (QREFELT $ 6)))))
                                        (|:| |arrws|
                                             (|Record|
                                              (|:| |ln|
                                                   (|List|
                                                    (|List| (QREFELT $ 6))))
                                              (|:| |mode| (|Symbol|))
                                              (|:| |size| (|DoubleFloat|))))
                                        (|:| |arrw|
                                             (|Record| (|:| |st| (|String|))
                                                       (|:| |en| (|String|))
                                                       (|:| |offset|
                                                            (QREFELT $ 6))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                        (|:| |shpe|
                                             (|Record|
                                              (|:| |shptype| (|Symbol|))
                                              (|:| |centre| (QREFELT $ 6))
                                              (|:| |size| (QREFELT $ 6))
                                              (|:| |fill| (|Boolean|))))
                                        (|:| |nodename|
                                             (|Record| (|:| |nme| (|String|))
                                                       (|:| |node| $)))
                                        (|:| |np|
                                             (|SceneNamedPoints|
                                              (QREFELT $ 6)))
                                        (|:| |empty| #22#))
                                       #17#))
                     . #21#)
               (EXIT (PROGN (LETT #2# (|Void|) . #21#) (GO #23#))))))
            (COND
             ((EQUAL (QVELT |n| 0) 'LINE)
              (SEQ
               (COND
                ((NULL (QEQCAR (QVELT |n| 2) 0))
                 (|error| "toObj parameter type not valid for line node")))
               (LETT |meshR|
                     (SPADCALL
                      (|SPADfirst|
                       (PROG2 (LETT #12# (QVELT |n| 2) . #21#)
                           (QCDR #12#)
                         (|check_union2| (QEQCAR #12# 0)
                                         (|List| (|List| (QREFELT $ 6)))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT $ 6))))
                                          (|:| |material|
                                               (|Record|
                                                (|:| |lineWidth|
                                                     (|DoubleFloat|))
                                                (|:| |lineCol| (|String|))
                                                (|:| |fillCol| (|String|))
                                                (|:| |matOpacity|
                                                     (|DoubleFloat|))))
                                          (|:| |text|
                                               (|Record| (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT $ 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT $ 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT $ 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT $ 6))
                                                (|:| |size| (QREFELT $ 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| $)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT $ 6)))
                                          (|:| |empty| #22#))
                                         #12#)))
                      (SPADCALL (SPADCALL 25 -2 10 (QREFELT $ 90))
                                (QREFELT $ 91))
                      8 (QREFELT $ 191))
                     . #21#)
               (LETT |ifsR| (SPADCALL |meshR| NIL (QREFELT $ 192)) . #21#)
               (LETT |i1| (SPADCALL |ifsR| (QREFELT $ 61)) . #21#)
               (LETT |p1| (SPADCALL |ifsR| (QREFELT $ 62)) . #21#)
               (LETT |i2|
                     (PROGN
                      (LETT #16# NIL . #21#)
                      (SEQ (LETT |k| NIL . #21#) (LETT #15# |i1| . #21#) G190
                           (COND
                            ((OR (ATOM #15#)
                                 (PROGN (LETT |k| (CAR #15#) . #21#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #16#
                                   (CONS
                                    (PROGN
                                     (LETT #14# NIL . #21#)
                                     (SEQ (LETT |j| NIL . #21#)
                                          (LETT #13# |k| . #21#) G190
                                          (COND
                                           ((OR (ATOM #13#)
                                                (PROGN
                                                 (LETT |j| (CAR #13#) . #21#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #14#
                                                  (CONS
                                                   (+ |j|
                                                      (SPADCALL |indexNxt|
                                                                (QREFELT $
                                                                         200)))
                                                   #14#)
                                                  . #21#)))
                                          (LETT #13# (CDR #13#) . #21#)
                                          (GO G190) G191
                                          (EXIT (NREVERSE #14#))))
                                    #16#)
                                   . #21#)))
                           (LETT #15# (CDR #15#) . #21#) (GO G190) G191
                           (EXIT (NREVERSE #16#))))
                     . #21#)
               (SPADCALL |ptLst|
                         (SPADCALL (SPADCALL |ptLst| (QREFELT $ 201)) |p1|
                                   (QREFELT $ 202))
                         (QREFELT $ 203))
               (SPADCALL |indexLst|
                         (SPADCALL (SPADCALL |indexLst| (QREFELT $ 204)) |i2|
                                   (QREFELT $ 205))
                         (QREFELT $ 206))
               (SPADCALL |indexNxt|
                         (+ (SPADCALL |indexNxt| (QREFELT $ 200))
                            (LENGTH |p1|))
                         (QREFELT $ 207))
               (EXIT (PROGN (LETT #2# (|Void|) . #21#) (GO #23#))))))
            (COND
             ((EQUAL (QVELT |n| 0) 'SHAPE)
              (COND
               ((NULL (QEQCAR (QVELT |n| 2) 8))
                (|error| "toObj parameter type not valid for shape node")))))
            (COND
             ((EQUAL (QVELT |n| 0) 'ARROWS)
              (SEQ
               (COND
                ((NULL (QEQCAR (QVELT |n| 2) 0))
                 (|error| "toObj parameter type not valid for arrows node")))
               (LETT |meshR|
                     (SPADCALL
                      (|SPADfirst|
                       (PROG2 (LETT #12# (QVELT |n| 2) . #21#)
                           (QCDR #12#)
                         (|check_union2| (QEQCAR #12# 0)
                                         (|List| (|List| (QREFELT $ 6)))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT $ 6))))
                                          (|:| |material|
                                               (|Record|
                                                (|:| |lineWidth|
                                                     (|DoubleFloat|))
                                                (|:| |lineCol| (|String|))
                                                (|:| |fillCol| (|String|))
                                                (|:| |matOpacity|
                                                     (|DoubleFloat|))))
                                          (|:| |text|
                                               (|Record| (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT $ 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT $ 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT $ 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT $ 6))
                                                (|:| |size| (QREFELT $ 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| $)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT $ 6)))
                                          (|:| |empty| #22#))
                                         #12#)))
                      (SPADCALL (SPADCALL 25 -2 10 (QREFELT $ 90))
                                (QREFELT $ 91))
                      8 (QREFELT $ 191))
                     . #21#)
               (LETT |ifsR| (SPADCALL |meshR| NIL (QREFELT $ 192)) . #21#)
               (LETT |i1| (SPADCALL |ifsR| (QREFELT $ 61)) . #21#)
               (LETT |p1| (SPADCALL |ifsR| (QREFELT $ 62)) . #21#)
               (LETT |i2|
                     (PROGN
                      (LETT #11# NIL . #21#)
                      (SEQ (LETT |k| NIL . #21#) (LETT #10# |i1| . #21#) G190
                           (COND
                            ((OR (ATOM #10#)
                                 (PROGN (LETT |k| (CAR #10#) . #21#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #11#
                                   (CONS
                                    (PROGN
                                     (LETT #9# NIL . #21#)
                                     (SEQ (LETT |j| NIL . #21#)
                                          (LETT #8# |k| . #21#) G190
                                          (COND
                                           ((OR (ATOM #8#)
                                                (PROGN
                                                 (LETT |j| (CAR #8#) . #21#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #9#
                                                  (CONS
                                                   (+ |j|
                                                      (SPADCALL |indexNxt|
                                                                (QREFELT $
                                                                         200)))
                                                   #9#)
                                                  . #21#)))
                                          (LETT #8# (CDR #8#) . #21#) (GO G190)
                                          G191 (EXIT (NREVERSE #9#))))
                                    #11#)
                                   . #21#)))
                           (LETT #10# (CDR #10#) . #21#) (GO G190) G191
                           (EXIT (NREVERSE #11#))))
                     . #21#)
               (SPADCALL |ptLst|
                         (SPADCALL (SPADCALL |ptLst| (QREFELT $ 201)) |p1|
                                   (QREFELT $ 202))
                         (QREFELT $ 203))
               (SPADCALL |indexLst|
                         (SPADCALL (SPADCALL |indexLst| (QREFELT $ 204)) |i2|
                                   (QREFELT $ 205))
                         (QREFELT $ 206))
               (SPADCALL |indexNxt|
                         (+ (SPADCALL |indexNxt| (QREFELT $ 200))
                            (LENGTH |p1|))
                         (QREFELT $ 207))
               (EXIT (PROGN (LETT #2# (|Void|) . #21#) (GO #23#))))))
            (COND
             ((EQUAL (QVELT |n| 0) 'IFS)
              (SEQ
               (COND
                ((NULL (QEQCAR (QVELT |n| 2) 5))
                 (|error| "toObj parameter type not valid for ifs node")))
               (LETT |i1|
                     (QCAR
                      (PROG2 (LETT #7# (QVELT |n| 2) . #21#)
                          (QCDR #7#)
                        (|check_union2| (QEQCAR #7# 5)
                                        (|Record|
                                         (|:| |inx|
                                              (|List|
                                               (|List|
                                                (|NonNegativeInteger|))))
                                         (|:| |pts| (|List| (QREFELT $ 6))))
                                        (|Union|
                                         (|:| |points|
                                              (|List| (|List| (QREFELT $ 6))))
                                         (|:| |material|
                                              (|Record|
                                               (|:| |lineWidth|
                                                    (|DoubleFloat|))
                                               (|:| |lineCol| (|String|))
                                               (|:| |fillCol| (|String|))
                                               (|:| |matOpacity|
                                                    (|DoubleFloat|))))
                                         (|:| |text|
                                              (|Record| (|:| |txt| (|String|))
                                                        (|:| |siz|
                                                             (|NonNegativeInteger|))
                                                        (|:| |pos|
                                                             (QREFELT $ 6))
                                                        (|:| |np|
                                                             (|List|
                                                              (|String|)))))
                                         (|:| |boundbox|
                                              (|SBoundary| (QREFELT $ 6)))
                                         (|:| |trans|
                                              (|STransform| (QREFELT $ 6)))
                                         (|:| |ifs|
                                              (|Record|
                                               (|:| |inx|
                                                    (|List|
                                                     (|List|
                                                      (|NonNegativeInteger|))))
                                               (|:| |pts|
                                                    (|List| (QREFELT $ 6)))))
                                         (|:| |arrws|
                                              (|Record|
                                               (|:| |ln|
                                                    (|List|
                                                     (|List| (QREFELT $ 6))))
                                               (|:| |mode| (|Symbol|))
                                               (|:| |size| (|DoubleFloat|))))
                                         (|:| |arrw|
                                              (|Record| (|:| |st| (|String|))
                                                        (|:| |en| (|String|))
                                                        (|:| |offset|
                                                             (QREFELT $ 6))
                                                        (|:| |mode| (|Symbol|))
                                                        (|:| |size|
                                                             (|DoubleFloat|))))
                                         (|:| |shpe|
                                              (|Record|
                                               (|:| |shptype| (|Symbol|))
                                               (|:| |centre| (QREFELT $ 6))
                                               (|:| |size| (QREFELT $ 6))
                                               (|:| |fill| (|Boolean|))))
                                         (|:| |nodename|
                                              (|Record| (|:| |nme| (|String|))
                                                        (|:| |node| $)))
                                         (|:| |np|
                                              (|SceneNamedPoints|
                                               (QREFELT $ 6)))
                                         (|:| |empty| #22#))
                                        #7#)))
                     . #21#)
               (LETT |p1|
                     (QCDR
                      (PROG2 (LETT #7# (QVELT |n| 2) . #21#)
                          (QCDR #7#)
                        (|check_union2| (QEQCAR #7# 5)
                                        (|Record|
                                         (|:| |inx|
                                              (|List|
                                               (|List|
                                                (|NonNegativeInteger|))))
                                         (|:| |pts| (|List| (QREFELT $ 6))))
                                        (|Union|
                                         (|:| |points|
                                              (|List| (|List| (QREFELT $ 6))))
                                         (|:| |material|
                                              (|Record|
                                               (|:| |lineWidth|
                                                    (|DoubleFloat|))
                                               (|:| |lineCol| (|String|))
                                               (|:| |fillCol| (|String|))
                                               (|:| |matOpacity|
                                                    (|DoubleFloat|))))
                                         (|:| |text|
                                              (|Record| (|:| |txt| (|String|))
                                                        (|:| |siz|
                                                             (|NonNegativeInteger|))
                                                        (|:| |pos|
                                                             (QREFELT $ 6))
                                                        (|:| |np|
                                                             (|List|
                                                              (|String|)))))
                                         (|:| |boundbox|
                                              (|SBoundary| (QREFELT $ 6)))
                                         (|:| |trans|
                                              (|STransform| (QREFELT $ 6)))
                                         (|:| |ifs|
                                              (|Record|
                                               (|:| |inx|
                                                    (|List|
                                                     (|List|
                                                      (|NonNegativeInteger|))))
                                               (|:| |pts|
                                                    (|List| (QREFELT $ 6)))))
                                         (|:| |arrws|
                                              (|Record|
                                               (|:| |ln|
                                                    (|List|
                                                     (|List| (QREFELT $ 6))))
                                               (|:| |mode| (|Symbol|))
                                               (|:| |size| (|DoubleFloat|))))
                                         (|:| |arrw|
                                              (|Record| (|:| |st| (|String|))
                                                        (|:| |en| (|String|))
                                                        (|:| |offset|
                                                             (QREFELT $ 6))
                                                        (|:| |mode| (|Symbol|))
                                                        (|:| |size|
                                                             (|DoubleFloat|))))
                                         (|:| |shpe|
                                              (|Record|
                                               (|:| |shptype| (|Symbol|))
                                               (|:| |centre| (QREFELT $ 6))
                                               (|:| |size| (QREFELT $ 6))
                                               (|:| |fill| (|Boolean|))))
                                         (|:| |nodename|
                                              (|Record| (|:| |nme| (|String|))
                                                        (|:| |node| $)))
                                         (|:| |np|
                                              (|SceneNamedPoints|
                                               (QREFELT $ 6)))
                                         (|:| |empty| #22#))
                                        #7#)))
                     . #21#)
               (LETT |i2|
                     (PROGN
                      (LETT #6# NIL . #21#)
                      (SEQ (LETT |k| NIL . #21#) (LETT #5# |i1| . #21#) G190
                           (COND
                            ((OR (ATOM #5#)
                                 (PROGN (LETT |k| (CAR #5#) . #21#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #6#
                                   (CONS
                                    (PROGN
                                     (LETT #4# NIL . #21#)
                                     (SEQ (LETT |j| NIL . #21#)
                                          (LETT #3# |k| . #21#) G190
                                          (COND
                                           ((OR (ATOM #3#)
                                                (PROGN
                                                 (LETT |j| (CAR #3#) . #21#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #4#
                                                  (CONS
                                                   (+ |j|
                                                      (SPADCALL |indexNxt|
                                                                (QREFELT $
                                                                         200)))
                                                   #4#)
                                                  . #21#)))
                                          (LETT #3# (CDR #3#) . #21#) (GO G190)
                                          G191 (EXIT (NREVERSE #4#))))
                                    #6#)
                                   . #21#)))
                           (LETT #5# (CDR #5#) . #21#) (GO G190) G191
                           (EXIT (NREVERSE #6#))))
                     . #21#)
               (SPADCALL |ptLst|
                         (SPADCALL (SPADCALL |ptLst| (QREFELT $ 201)) |p1|
                                   (QREFELT $ 202))
                         (QREFELT $ 203))
               (SPADCALL |indexLst|
                         (SPADCALL (SPADCALL |indexLst| (QREFELT $ 204)) |i2|
                                   (QREFELT $ 205))
                         (QREFELT $ 206))
               (SPADCALL |indexNxt|
                         (+ (SPADCALL |indexNxt| (QREFELT $ 200))
                            (LENGTH |p1|))
                         (QREFELT $ 207))
               (EXIT (PROGN (LETT #2# (|Void|) . #21#) (GO #23#))))))
            (COND
             ((EQUAL (QVELT |n| 0) 'DEF)
              (COND
               ((NULL (QEQCAR (QVELT |n| 2) 9))
                (|error| "toSVG parameter type not valid for def node")))))
            (COND
             ((EQUAL (QVELT |n| 0) 'USE)
              (COND
               ((NULL (QEQCAR (QVELT |n| 2) 9))
                (|error| "toSVG parameter type not valid for use node")))))
            (EXIT
             (COND ((< (SPADCALL (QVELT |n| 1) (QREFELT $ 177)) 1) (|Void|))
                   ('T
                    (SEQ
                     (SEQ (LETT |ch| NIL . #21#)
                          (LETT #1# (QVELT |n| 1) . #21#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |ch| (CAR #1#) . #21#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |ch| |ptLst| |indexLst| |indexNxt|
                                      |tran2| |bb2| (QREFELT $ 199))))
                          (LETT #1# (CDR #1#) . #21#) (GO G190) G191
                          (EXIT NIL))
                     (EXIT (|Void|))))))))
          #23# (EXIT #2#)))) 

(SDEFUN |SCENE;toObj;$RRRStRV;95|
        ((|n| $) (|ptLst| |Reference| (|List| PT))
         (|indexLst| |Reference| (|List| (|List| (|NonNegativeInteger|))))
         (|indexNxt| |Reference| (|NonNegativeInteger|))
         (|tran| |STransform| PT)
         (|bb| |Record| (|:| |mins| PT) (|:| |maxs| PT)) ($ |Void|))
        (SPADCALL |n| |ptLst| |indexLst| |indexNxt| |tran|
                  (SPADCALL (QCAR |bb|) (QCDR |bb|) (QREFELT $ 10))
                  (QREFELT $ 199))) 

(SDEFUN |SCENE;writeObj;$SV;96| ((|n| $) (|filename| |String|) ($ |Void|))
        (SPROG
         ((|s| (|String|)) (#1=#:G1942 NIL) (|i| NIL) (#2=#:G1941 NIL)
          (|row| NIL) (#3=#:G1940 NIL) (|v| NIL) (|f1| (|TextFile|))
          (|defaultBounds| (|SBoundary| PT))
          (|defaultTransform| (|STransform| PT))
          (|indexNxt| (|Reference| (|NonNegativeInteger|)))
          (|indexLst| (|Reference| (|List| (|List| (|NonNegativeInteger|)))))
          (|ptLst| (|Reference| (|List| PT))))
         (SEQ
          (LETT |ptLst| (SPADCALL NIL (QREFELT $ 209))
                . #4=(|SCENE;writeObj;$SV;96|))
          (LETT |indexLst| (SPADCALL NIL (QREFELT $ 210)) . #4#)
          (LETT |indexNxt| (SPADCALL 0 (QREFELT $ 211)) . #4#)
          (LETT |defaultTransform| (SPADCALL (QREFELT $ 179)) . #4#)
          (LETT |defaultBounds| (SPADCALL (QREFELT $ 16)) . #4#)
          (SPADCALL |n| |ptLst| |indexLst| |indexNxt| |defaultTransform|
                    |defaultBounds| (QREFELT $ 199))
          (LETT |f1|
                (SPADCALL (SPADCALL |filename| (QREFELT $ 213)) "output"
                          (QREFELT $ 215))
                . #4#)
          (SPADCALL |f1| "# mesh generated by axiom" (QREFELT $ 216))
          (SEQ (LETT |v| NIL . #4#)
               (LETT #3# (SPADCALL |ptLst| (QREFELT $ 201)) . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |f1|
                           (SPADCALL
                            (LIST "v "
                                  (|mathObject2String|
                                   (SPADCALL |v| (QREFELT $ 81)))
                                  " "
                                  (|mathObject2String|
                                   (SPADCALL |v| (QREFELT $ 82)))
                                  " "
                                  (|mathObject2String|
                                   (SPADCALL |v| (QREFELT $ 188))))
                            (QREFELT $ 118))
                           (QREFELT $ 216))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (LETT |s| "" . #4#)
          (SEQ (LETT |row| NIL . #4#)
               (LETT #2# (SPADCALL |indexLst| (QREFELT $ 204)) . #4#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |row| (CAR #2#) . #4#) NIL))
                 (GO G191)))
               (SEQ (LETT |s| "f" . #4#)
                    (SEQ (LETT |i| NIL . #4#) (LETT #1# |row| . #4#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |i| (CAR #1#) . #4#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |s|
                                 (SPADCALL
                                  (LIST |s| " " (STRINGIMAGE (+ |i| 1)))
                                  (QREFELT $ 118))
                                 . #4#)))
                         (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |f1| |s| (QREFELT $ 216))))
               (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
          (SPADCALL |f1| (QREFELT $ 217)) (EXIT (|Void|))))) 

(SDEFUN |SCENE;writeVRML;$SV;97| ((|n| $) (|filename| |String|) ($ |Void|))
        (SPROG
         ((|defaultBounds| (|SBoundary| PT))
          (|defaultTransform| (|STransform| PT))
          (|defaultMaterial|
           (|Record| (|:| |lineWidth| (|DoubleFloat|))
                     (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
                     (|:| |matOpacity| (|DoubleFloat|)))))
         (SEQ
          (LETT |defaultMaterial|
                (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "black" "black"
                        1.0)
                . #1=(|SCENE;writeVRML;$SV;97|))
          (LETT |defaultTransform| (SPADCALL (QREFELT $ 179)) . #1#)
          (LETT |defaultBounds| (SPADCALL (QREFELT $ 16)) . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL |n| |defaultMaterial| |defaultTransform| |defaultBounds|
                      (QREFELT $ 190))
            |filename| (QREFELT $ 219)))))) 

(SDEFUN |SCENE;Fnan?| ((|x| |DoubleFloat|) ($ |Boolean|))
        (SPADCALL |x| |x| (QREFELT $ 221))) 

(SDEFUN |SCENE;applyfxTrap|
        ((|ff| |Mapping| (|DoubleFloat|) (|DoubleFloat|)) (|f| |DoubleFloat|)
         ($ |DoubleFloat|))
        (SPROG ((|r| (|DoubleFloat|)) (|s| (|Union| (|DoubleFloat|) "failed")))
               (SEQ
                (LETT |s| (|trapNumericErrors| (SPADCALL |f| |ff|))
                      . #1=(|SCENE;applyfxTrap|))
                (EXIT
                 (COND ((QEQCAR |s| 1) 0.0)
                       (#2='T
                        (SEQ (LETT |r| (QCDR |s|) . #1#)
                             (EXIT
                              (COND
                               ((SPADCALL |r| MOST-POSITIVE-DOUBLE-FLOAT
                                          (QREFELT $ 155))
                                MOST-POSITIVE-DOUBLE-FLOAT)
                               ((|less_DF| |r| MOST-NEGATIVE-DOUBLE-FLOAT)
                                MOST-NEGATIVE-DOUBLE-FLOAT)
                               (#2# |r|)))))))))) 

(SDEFUN |SCENE;applyfxyTrap|
        ((|ff| |Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))
         (|u| |DoubleFloat|) (|v| |DoubleFloat|) ($ |DoubleFloat|))
        (SPROG ((|r| (|DoubleFloat|)) (|s| (|Union| (|DoubleFloat|) "failed")))
               (SEQ
                (LETT |s| (|trapNumericErrors| (SPADCALL |u| |v| |ff|))
                      . #1=(|SCENE;applyfxyTrap|))
                (EXIT
                 (COND ((QEQCAR |s| 1) 0.0)
                       (#2='T
                        (SEQ (LETT |r| (QCDR |s|) . #1#)
                             (EXIT
                              (COND
                               ((SPADCALL |r| MOST-POSITIVE-DOUBLE-FLOAT
                                          (QREFELT $ 155))
                                MOST-POSITIVE-DOUBLE-FLOAT)
                               ((|less_DF| |r| MOST-NEGATIVE-DOUBLE-FLOAT)
                                MOST-NEGATIVE-DOUBLE-FLOAT)
                               (#2# |r|)))))))))) 

(SDEFUN |SCENE;normalize|
        ((|seg| |Segment| (|DoubleFloat|)) ($ |Segment| (|DoubleFloat|)))
        (SPROG ((|b| #1=(|DoubleFloat|)) (|a| #1#))
               (SEQ
                (LETT |a| (SPADCALL |seg| (QREFELT $ 139))
                      . #2=(|SCENE;normalize|))
                (LETT |b| (SPADCALL |seg| (QREFELT $ 140)) . #2#)
                (EXIT
                 (COND
                  ((|eql_DF| |a| |b|)
                   (|error| "The range specified is too small"))
                  ((|less_DF| |a| |b|) (SPADCALL |a| |b| (QREFELT $ 222)))
                  ('T (SPADCALL |b| |a| (QREFELT $ 222)))))))) 

(SDEFUN |SCENE;checkRange|
        ((|r| |Segment| (|DoubleFloat|)) ($ |Segment| (|DoubleFloat|)))
        (COND
         ((SPADCALL (SPADCALL |r| (QREFELT $ 139))
                    (SPADCALL |r| (QREFELT $ 140)) (QREFELT $ 155))
          (|error| "ranges cannot be negative"))
         ('T |r|))) 

(SDEFUN |SCENE;createPlot1Din2D;MSNni$;103|
        ((|f| |Mapping| PT (|DoubleFloat|))
         (|tRange| |Segment| (|DoubleFloat|)) (|numPts| |NonNegativeInteger|)
         ($ $))
        (SPROG
         ((|branches| (|List| (|List| PT))) (|newl| (|List| PT))
          (#1=#:G1974 NIL) (|p| NIL) (|p0| (|List| PT))
          (|t| (|List| (|DoubleFloat|))) (|l| (|DoubleFloat|)) (#2=#:G1973 NIL)
          (|i| NIL) (|s| (|DoubleFloat|)) (|h| (|DoubleFloat|)))
         (SEQ (|SCENE;checkRange| |tRange| $)
              (LETT |l| (SPADCALL |tRange| (QREFELT $ 139))
                    . #3=(|SCENE;createPlot1Din2D;MSNni$;103|))
              (LETT |h| (SPADCALL |tRange| (QREFELT $ 140)) . #3#)
              (LETT |t| (SPADCALL |l| (QREFELT $ 224)) . #3#)
              (LETT |p0| (SPADCALL (SPADCALL |l| |f|) (QREFELT $ 225)) . #3#)
              (LETT |s|
                    (|div_DF| (|sub_DF| |h| |l|)
                              (FLOAT (- |numPts| 1)
                                     MOST-POSITIVE-DOUBLE-FLOAT))
                    . #3#)
              (SEQ (LETT |i| 2 . #3#) (LETT #2# (- |numPts| 1) . #3#) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ (LETT |l| (|add_DF| |l| |s|) . #3#)
                        (LETT |t| (CONS |l| |t|) . #3#)
                        (EXIT
                         (LETT |p0| (CONS (SPADCALL |l| |f|) |p0|) . #3#)))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (LETT |t| (NREVERSE (CONS |h| |t|)) . #3#)
              (LETT |p0| (NREVERSE (CONS (SPADCALL |h| |f|) |p0|)) . #3#)
              (LETT |branches| NIL . #3#) (LETT |newl| NIL . #3#)
              (SEQ (LETT |p| NIL . #3#) (LETT #1# |p0| . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |p| (QREFELT $ 226))
                       (COND
                        ((NULL (NULL |newl|))
                         (SEQ
                          (LETT |branches|
                                (CONS (LETT |newl| (NREVERSE |newl|) . #3#)
                                      |branches|)
                                . #3#)
                          (EXIT (LETT |newl| NIL . #3#))))))
                      ('T (LETT |newl| (CONS |p| |newl|) . #3#)))))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
              (COND
               ((NULL (NULL |newl|))
                (LETT |branches|
                      (CONS (LETT |newl| (NREVERSE |newl|) . #3#) |branches|)
                      . #3#)))
              (EXIT (SPADCALL |branches| (QREFELT $ 32)))))) 

(SDEFUN |SCENE;addPlot1Din2D;$MSNni$;104|
        ((|n| $) (|f| |Mapping| PT (|DoubleFloat|))
         (|tRange| |Segment| (|DoubleFloat|)) (|numPts| |NonNegativeInteger|)
         ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |f| |tRange| |numPts| (QREFELT $ 228))
                      |SCENE;addPlot1Din2D;$MSNni$;104|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createPlot1Din2D;MSNni$;105|
        ((|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|))
         (|seg| |Segment| (|DoubleFloat|)) (|numPts| |NonNegativeInteger|)
         ($ $))
        (SPROG ((|ff| (|List| (|Mapping| PT (|DoubleFloat|)))))
               (SEQ
                (LETT |ff|
                      (LIST
                       (CONS #'|SCENE;createPlot1Din2D;MSNni$;105!0|
                             (VECTOR $ |f|)))
                      |SCENE;createPlot1Din2D;MSNni$;105|)
                (EXIT
                 (SPADCALL (SPADCALL |ff| (QREFELT $ 231))
                           (|SCENE;normalize| |seg| $) |numPts|
                           (QREFELT $ 228)))))) 

(SDEFUN |SCENE;createPlot1Din2D;MSNni$;105!0| ((|x| NIL) ($$ NIL))
        (PROG (|f| $)
          (LETT |f| (QREFELT $$ 1) . #1=(|SCENE;createPlot1Din2D;MSNni$;105|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |x| (|SCENE;applyfxTrap| |f| |x| $) (QREFELT $ 83)))))) 

(SDEFUN |SCENE;addPlot1Din2D;$MSNni$;106|
        ((|n| $) (|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|))
         (|seg| |Segment| (|DoubleFloat|)) (|numPts| |NonNegativeInteger|)
         ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |f| |seg| |numPts| (QREFELT $ 233))
                      |SCENE;addPlot1Din2D;$MSNni$;106|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createPlot1Din2Dparametric;PpcSNni$;107|
        ((|ppc| |ParametricPlaneCurve|
          (|Mapping| (|DoubleFloat|) (|DoubleFloat|)))
         (|seg| |Segment| (|DoubleFloat|)) (|numPts| |NonNegativeInteger|)
         ($ $))
        (SPROG
         ((|fcn| (|List| (|Mapping| PT (|DoubleFloat|))))
          (|g| #1=(|Mapping| (|DoubleFloat|) (|DoubleFloat|))) (|f| #1#))
         (SEQ
          (LETT |f| (SPADCALL |ppc| 1 (QREFELT $ 236))
                . #2=(|SCENE;createPlot1Din2Dparametric;PpcSNni$;107|))
          (LETT |g| (SPADCALL |ppc| 2 (QREFELT $ 236)) . #2#)
          (LETT |fcn|
                (LIST
                 (CONS #'|SCENE;createPlot1Din2Dparametric;PpcSNni$;107!0|
                       (VECTOR |g| $ |f|)))
                . #2#)
          (EXIT
           (SPADCALL (SPADCALL |fcn| (QREFELT $ 231))
                     (|SCENE;normalize| |seg| $) |numPts| (QREFELT $ 228)))))) 

(SDEFUN |SCENE;createPlot1Din2Dparametric;PpcSNni$;107!0| ((|x| NIL) ($$ NIL))
        (PROG (|f| $ |g|)
          (LETT |f| (QREFELT $$ 2)
                . #1=(|SCENE;createPlot1Din2Dparametric;PpcSNni$;107|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |g| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (|SCENE;applyfxTrap| |f| |x| $)
                      (|SCENE;applyfxTrap| |g| |x| $) (QREFELT $ 83)))))) 

(SDEFUN |SCENE;addPlot1Din2Dparametric;$PpcSNni$;108|
        ((|n| $)
         (|ppc| |ParametricPlaneCurve|
          (|Mapping| (|DoubleFloat|) (|DoubleFloat|)))
         (|seg| |Segment| (|DoubleFloat|)) (|numPts| |NonNegativeInteger|)
         ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |ppc| |seg| |numPts| (QREFELT $ 237))
                      |SCENE;addPlot1Din2Dparametric;$PpcSNni$;108|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createPlot1Din3Dparametric;PscSNni$;109|
        ((|psc| |ParametricSpaceCurve|
          (|Mapping| (|DoubleFloat|) (|DoubleFloat|)))
         (|seg| |Segment| (|DoubleFloat|)) (|numPts| |NonNegativeInteger|)
         ($ $))
        (SPROG
         ((|fcn| (|Mapping| PT (|DoubleFloat|)))
          (|h| #1=(|Mapping| (|DoubleFloat|) (|DoubleFloat|))) (|g| #1#)
          (|f| #1#))
         (SEQ
          (LETT |f| (SPADCALL |psc| 1 (QREFELT $ 240))
                . #2=(|SCENE;createPlot1Din3Dparametric;PscSNni$;109|))
          (LETT |g| (SPADCALL |psc| 2 (QREFELT $ 240)) . #2#)
          (LETT |h| (SPADCALL |psc| 3 (QREFELT $ 240)) . #2#)
          (LETT |fcn|
                (CONS #'|SCENE;createPlot1Din3Dparametric;PscSNni$;109!0|
                      (VECTOR |h| |g| $ |f|))
                . #2#)
          (EXIT (SPADCALL |fcn| |seg| |numPts| (QREFELT $ 241)))))) 

(SDEFUN |SCENE;createPlot1Din3Dparametric;PscSNni$;109!0| ((|x| NIL) ($$ NIL))
        (PROG (|f| $ |g| |h|)
          (LETT |f| (QREFELT $$ 3)
                . #1=(|SCENE;createPlot1Din3Dparametric;PscSNni$;109|))
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |g| (QREFELT $$ 1) . #1#)
          (LETT |h| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (|SCENE;applyfxTrap| |f| |x| $)
                      (|SCENE;applyfxTrap| |g| |x| $)
                      (|SCENE;applyfxTrap| |h| |x| $) (QREFELT $ 65)))))) 

(SDEFUN |SCENE;addPlot1Din3Dparametric;$PscSNni$;110|
        ((|n| $)
         (|psc| |ParametricSpaceCurve|
          (|Mapping| (|DoubleFloat|) (|DoubleFloat|)))
         (|seg| |Segment| (|DoubleFloat|)) (|numPts| |NonNegativeInteger|)
         ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |psc| |seg| |numPts| (QREFELT $ 242))
                      |SCENE;addPlot1Din3Dparametric;$PscSNni$;110|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createPlot1Din3Dparametric;MSNni$;111|
        ((|psc| |Mapping| PT (|DoubleFloat|)) (|seg| |Segment| (|DoubleFloat|))
         (|numPts| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|p| (|List| PT)) (|t| (|List| (|DoubleFloat|)))
          (|l| (|DoubleFloat|)) (#1=#:G2013 NIL) (|i| NIL)
          (|s| (|DoubleFloat|)) (|h| (|DoubleFloat|))
          (|tRange| (|Segment| (|DoubleFloat|)))
          (|f| (|Mapping| PT (|DoubleFloat|))))
         (SEQ
          (LETT |f| |psc| . #2=(|SCENE;createPlot1Din3Dparametric;MSNni$;111|))
          (LETT |tRange| (|SCENE;normalize| |seg| $) . #2#)
          (|SCENE;checkRange| |tRange| $)
          (LETT |l| (SPADCALL |tRange| (QREFELT $ 139)) . #2#)
          (LETT |h| (SPADCALL |tRange| (QREFELT $ 140)) . #2#)
          (LETT |t| (SPADCALL |l| (QREFELT $ 224)) . #2#)
          (LETT |p| (SPADCALL (SPADCALL |l| |f|) (QREFELT $ 225)) . #2#)
          (LETT |s|
                (|div_DF| (|sub_DF| |h| |l|)
                          (FLOAT (- |numPts| 1) MOST-POSITIVE-DOUBLE-FLOAT))
                . #2#)
          (SEQ (LETT |i| 2 . #2#) (LETT #1# (- |numPts| 1) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ (LETT |l| (|add_DF| |l| |s|) . #2#)
                    (LETT |t| (CONS |l| |t|) . #2#)
                    (EXIT (LETT |p| (CONS (SPADCALL |l| |f|) |p|) . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (LETT |t| (NREVERSE (CONS |h| |t|)) . #2#)
          (LETT |p| (NREVERSE (CONS (SPADCALL |h| |f|) |p|)) . #2#)
          (EXIT (SPADCALL |p| (QREFELT $ 23)))))) 

(SDEFUN |SCENE;addPlot1Din3Dparametric;$MSNni$;112|
        ((|n| $) (|psc| |Mapping| PT (|DoubleFloat|))
         (|seg| |Segment| (|DoubleFloat|)) (|numPts| |NonNegativeInteger|)
         ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |psc| |seg| |numPts| (QREFELT $ 241))
                      |SCENE;addPlot1Din3Dparametric;$MSNni$;112|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createPlot2Din3D;M2SNni$;113|
        ((|ptFun| |Mapping| PT (|DoubleFloat|) (|DoubleFloat|))
         (|uSeg| |Segment| (|DoubleFloat|)) (|vSeg| |Segment| (|DoubleFloat|))
         (|numPts| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|someV| #1=(|DoubleFloat|)) (|llp| (|List| (|List| PT)))
          (|someU| #1#) (|lp| (|List| PT)) (|pt| (PT)) (|iu| NIL) (|iv| NIL)
          (|vstep| #2=(|DoubleFloat|)) (|ustep| #2#))
         (SEQ (LETT |llp| NIL . #3=(|SCENE;createPlot2Din3D;M2SNni$;113|))
              (LETT |ustep|
                    (|div_DF_I|
                     (|sub_DF| (SPADCALL |uSeg| (QREFELT $ 139))
                               (SPADCALL |uSeg| (QREFELT $ 140)))
                     |numPts|)
                    . #3#)
              (LETT |vstep|
                    (|div_DF_I|
                     (|sub_DF| (SPADCALL |vSeg| (QREFELT $ 139))
                               (SPADCALL |vSeg| (QREFELT $ 140)))
                     |numPts|)
                    . #3#)
              (LETT |someV| (SPADCALL |vSeg| (QREFELT $ 140)) . #3#)
              (SEQ (LETT |iv| |numPts| . #3#) G190
                   (COND ((< |iv| 0) (GO G191)))
                   (SEQ
                    (COND
                     ((ZEROP |iv|)
                      (LETT |someV| (SPADCALL |vSeg| (QREFELT $ 139)) . #3#)))
                    (LETT |lp| NIL . #3#)
                    (LETT |someU| (SPADCALL |uSeg| (QREFELT $ 140)) . #3#)
                    (SEQ (LETT |iu| |numPts| . #3#) G190
                         (COND ((< |iu| 0) (GO G191)))
                         (SEQ
                          (COND
                           ((ZEROP |iu|)
                            (LETT |someU| (SPADCALL |uSeg| (QREFELT $ 139))
                                  . #3#)))
                          (LETT |pt| (SPADCALL |someU| |someV| |ptFun|) . #3#)
                          (LETT |lp| (CONS |pt| |lp|) . #3#)
                          (EXIT
                           (LETT |someU| (|add_DF| |someU| |ustep|) . #3#)))
                         (LETT |iu| (+ |iu| -1) . #3#) (GO G190) G191
                         (EXIT NIL))
                    (LETT |llp| (CONS |lp| |llp|) . #3#)
                    (EXIT (LETT |someV| (|add_DF| |someV| |vstep|) . #3#)))
                   (LETT |iv| (+ |iv| -1) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (SPADCALL |llp| NIL (QREFELT $ 192))
                         (QREFELT $ 63)))))) 

(SDEFUN |SCENE;createPlot2Din3D;M2SNni$;114|
        ((|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))
         (|xSeg| |Segment| (|DoubleFloat|)) (|ySeg| |Segment| (|DoubleFloat|))
         (|numPts| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|fcn| (|List| (|Mapping| PT (|DoubleFloat|) (|DoubleFloat|)))))
         (SEQ
          (LETT |fcn|
                (LIST
                 (CONS #'|SCENE;createPlot2Din3D;M2SNni$;114!0|
                       (VECTOR $ |f|)))
                |SCENE;createPlot2Din3D;M2SNni$;114|)
          (EXIT
           (SPADCALL (SPADCALL |fcn| (QREFELT $ 248))
                     (|SCENE;normalize| |xSeg| $) (|SCENE;normalize| |ySeg| $)
                     |numPts| (QREFELT $ 246)))))) 

(SDEFUN |SCENE;createPlot2Din3D;M2SNni$;114!0| ((|x| NIL) (|y| NIL) ($$ NIL))
        (PROG (|f| $)
          (LETT |f| (QREFELT $$ 1) . #1=(|SCENE;createPlot2Din3D;M2SNni$;114|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (|SCENE;applyfxyTrap| |f| |x| |y| $) |x| |y|
                      (QREFELT $ 65)))))) 

(SDEFUN |SCENE;addPlot2Din3D;$M2SNni$;115|
        ((|n| $)
         (|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))
         (|xSeg| |Segment| (|DoubleFloat|)) (|ySeg| |Segment| (|DoubleFloat|))
         (|numPts| |NonNegativeInteger|) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |f| |xSeg| |ySeg| |numPts| (QREFELT $ 250))
                      |SCENE;addPlot2Din3D;$M2SNni$;115|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createPlot2Din3Dparametric;Ps2SNni$;116|
        ((|s| |ParametricSurface|
          (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|)))
         (|uSeg| |Segment| (|DoubleFloat|)) (|vSeg| |Segment| (|DoubleFloat|))
         (|numPts| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|fcn| (|List| (|Mapping| PT (|DoubleFloat|) (|DoubleFloat|))))
          (|h|
           (|List|
            (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))))
          (|g|
           (|List|
            (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))))
          (|f|
           (|List|
            (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|)))))
         (SEQ
          (LETT |f|
                (LIST (SPADCALL |s| (|spadConstant| $ 253) (QREFELT $ 255)))
                . #1=(|SCENE;createPlot2Din3Dparametric;Ps2SNni$;116|))
          (LETT |g| (LIST (SPADCALL |s| 2 (QREFELT $ 255))) . #1#)
          (LETT |h| (LIST (SPADCALL |s| 3 (QREFELT $ 255))) . #1#)
          (LETT |fcn|
                (LIST
                 (CONS #'|SCENE;createPlot2Din3Dparametric;Ps2SNni$;116!0|
                       (VECTOR |h| |g| $ |f|)))
                . #1#)
          (EXIT
           (SPADCALL (SPADCALL |fcn| (QREFELT $ 248))
                     (|SCENE;normalize| |uSeg| $) (|SCENE;normalize| |vSeg| $)
                     |numPts| (QREFELT $ 246)))))) 

(SDEFUN |SCENE;createPlot2Din3Dparametric;Ps2SNni$;116!0|
        ((|x| NIL) (|y| NIL) ($$ NIL))
        (PROG (|f| $ |g| |h|)
          (LETT |f| (QREFELT $$ 3)
                . #1=(|SCENE;createPlot2Din3Dparametric;Ps2SNni$;116|))
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |g| (QREFELT $$ 1) . #1#)
          (LETT |h| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (|SCENE;applyfxyTrap| (SPADCALL |f| (QREFELT $ 257)) |x| |y| $)
             (|SCENE;applyfxyTrap| (SPADCALL |g| (QREFELT $ 257)) |x| |y| $)
             (|SCENE;applyfxyTrap| (SPADCALL |h| (QREFELT $ 257)) |x| |y| $)
             (QREFELT $ 65)))))) 

(SDEFUN |SCENE;addPlot2Din3Dparametric;$Ps2SNni$;117|
        ((|n| $)
         (|s| |ParametricSurface|
          (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|)))
         (|uSeg| |Segment| (|DoubleFloat|)) (|vSeg| |Segment| (|DoubleFloat|))
         (|numPts| |NonNegativeInteger|) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |s| |uSeg| |vSeg| |numPts| (QREFELT $ 258))
                      |SCENE;addPlot2Din3Dparametric;$Ps2SNni$;117|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createPlot2Din3Dparametric;M2SNni$;118|
        ((|s| |Mapping| PT (|DoubleFloat|) (|DoubleFloat|))
         (|uSeg| |Segment| (|DoubleFloat|)) (|vSeg| |Segment| (|DoubleFloat|))
         (|numPts| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|fcn| (|List| (|Mapping| PT (|DoubleFloat|) (|DoubleFloat|)))))
         (SEQ
          (LETT |fcn| (LIST |s|)
                |SCENE;createPlot2Din3Dparametric;M2SNni$;118|)
          (EXIT
           (SPADCALL (SPADCALL |fcn| (QREFELT $ 248))
                     (|SCENE;normalize| |uSeg| $) (|SCENE;normalize| |vSeg| $)
                     |numPts| (QREFELT $ 246)))))) 

(SDEFUN |SCENE;addPlot2Din3Dparametric;$M2SNni$;119|
        ((|n| $) (|s| |Mapping| PT (|DoubleFloat|) (|DoubleFloat|))
         (|uSeg| |Segment| (|DoubleFloat|)) (|vSeg| |Segment| (|DoubleFloat|))
         (|numPts| |NonNegativeInteger|) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |s| |uSeg| |vSeg| |numPts| (QREFELT $ 260))
                      |SCENE;addPlot2Din3Dparametric;$M2SNni$;119|)
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;outputLPoints| ((|ps| |List| PT) ($ |OutputForm|))
        (SPROG ((#1=#:G2079 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((< (LENGTH |ps|) 4)
                    (PROGN
                     (LETT #1# (SPADCALL |ps| (QREFELT $ 263))
                           |SCENE;outputLPoints|)
                     (GO #2=#:G2078))))
                  (EXIT
                   (SPADCALL
                    (LIST (SPADCALL (|SPADfirst| |ps|) (QREFELT $ 264))
                          (SPADCALL (SPADCALL |ps| (QREFELT $ 265))
                                    (QREFELT $ 264))
                          "....")
                    (QREFELT $ 266)))))
                #2# (EXIT #1#)))) 

(SDEFUN |SCENE;outputLLPoints| ((|ps| |List| (|List| PT)) ($ |OutputForm|))
        (SPROG ((#1=#:G2084 NIL) (#2=#:G2086 NIL) (|x| NIL) (#3=#:G2085 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((< (LENGTH |ps|) 4)
                    (PROGN
                     (LETT #1#
                           (SPADCALL
                            (PROGN
                             (LETT #3# NIL . #4=(|SCENE;outputLLPoints|))
                             (SEQ (LETT |x| NIL . #4#) (LETT #2# |ps| . #4#)
                                  G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |x| (CAR #2#) . #4#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #3#
                                          (CONS (|SCENE;outputLPoints| |x| $)
                                                #3#)
                                          . #4#)))
                                  (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                                  (EXIT (NREVERSE #3#))))
                            (QREFELT $ 266))
                           . #4#)
                     (GO #5=#:G2083))))
                  (EXIT
                   (SPADCALL
                    (LIST (|SCENE;outputLPoints| (|SPADfirst| |ps|) $)
                          (|SCENE;outputLPoints|
                           (SPADCALL |ps| (QREFELT $ 267)) $)
                          "....")
                    (QREFELT $ 266)))))
                #5# (EXIT #1#)))) 

(SDEFUN |SCENE;outputLIndexes|
        ((|ps| |List| (|NonNegativeInteger|)) ($ |OutputForm|))
        (SPROG ((#1=#:G2090 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((< (SPADCALL |ps| (QREFELT $ 108)) 4)
                    (PROGN
                     (LETT #1# (SPADCALL |ps| (QREFELT $ 268))
                           |SCENE;outputLIndexes|)
                     (GO #2=#:G2089))))
                  (EXIT
                   (SPADCALL
                    (LIST (SPADCALL (|SPADfirst| |ps|) (QREFELT $ 269))
                          (SPADCALL (SPADCALL |ps| (QREFELT $ 270))
                                    (QREFELT $ 269))
                          "....")
                    (QREFELT $ 266)))))
                #2# (EXIT #1#)))) 

(SDEFUN |SCENE;outputLLIndexes|
        ((|ps| |List| (|List| (|NonNegativeInteger|))) ($ |OutputForm|))
        (SPROG ((#1=#:G2095 NIL) (#2=#:G2097 NIL) (|x| NIL) (#3=#:G2096 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((< (LENGTH |ps|) 4)
                    (PROGN
                     (LETT #1#
                           (SPADCALL
                            (PROGN
                             (LETT #3# NIL . #4=(|SCENE;outputLLIndexes|))
                             (SEQ (LETT |x| NIL . #4#) (LETT #2# |ps| . #4#)
                                  G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |x| (CAR #2#) . #4#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #3#
                                          (CONS (|SCENE;outputLIndexes| |x| $)
                                                #3#)
                                          . #4#)))
                                  (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                                  (EXIT (NREVERSE #3#))))
                            (QREFELT $ 266))
                           . #4#)
                     (GO #5=#:G2094))))
                  (EXIT
                   (SPADCALL
                    (LIST (|SCENE;outputLIndexes| (|SPADfirst| |ps|) $)
                          (|SCENE;outputLIndexes|
                           (SPADCALL |ps| (QREFELT $ 271)) $)
                          "....")
                    (QREFELT $ 266)))))
                #5# (EXIT #1#)))) 

(SDEFUN |SCENE;coerce;$Of;124| ((|n| $) ($ |OutputForm|))
        (SPROG
         ((|s| (|OutputForm|)) (|nam| (|SceneNamedPoints| PT)) (#1=#:G2116 NIL)
          (|nn| (|String|)) (#2=#:G2115 NIL) (|sz| (|DoubleFloat|))
          (#3=#:G2113 NIL) (|md| (|Symbol|)) (|ofs| (PT)) (|ena| (|String|))
          (|str| (|String|)) (#4=#:G2112 NIL) (|m| (|Symbol|))
          (|pts| (|List| (|List| PT))) (|pt| (|List| PT)) (#5=#:G2111 NIL)
          (|ix| (|List| (|List| (|NonNegativeInteger|)))) (#6=#:G2109 NIL)
          (|tr| (|STransform| PT)) (#7=#:G2110 NIL) (|npt| (|List| (|String|)))
          (#8=#:G2108 NIL) (|p| (PT)) (|sz1| (|NonNegativeInteger|))
          (|t| (|String|)) (|mo| (|DoubleFloat|)) (#9=#:G2107 NIL)
          (|fc| (|String|)) (|lc| (|String|)) (|lw| (|DoubleFloat|))
          (|pt2| (PT)) (#10=#:G2114 NIL) (|pt1| (PT)) (|tp| (|Symbol|))
          (#11=#:G2106 NIL))
         (SEQ (LETT |s| "scene " . #12=(|SCENE;coerce;$Of;124|))
              (COND
               ((EQUAL (QVELT |n| 0) 'ROOT)
                (LETT |s|
                      (SPADCALL
                       (LIST |s| "root "
                             (SPADCALL
                              (PROG2 (LETT #6# (QVELT |n| 2) . #12#)
                                  (QCDR #6#)
                                (|check_union2| (QEQCAR #6# 3)
                                                (|SBoundary| (QREFELT $ 6))
                                                (|Union|
                                                 (|:| |points|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |material|
                                                      (|Record|
                                                       (|:| |lineWidth|
                                                            (|DoubleFloat|))
                                                       (|:| |lineCol|
                                                            (|String|))
                                                       (|:| |fillCol|
                                                            (|String|))
                                                       (|:| |matOpacity|
                                                            (|DoubleFloat|))))
                                                 (|:| |text|
                                                      (|Record|
                                                       (|:| |txt| (|String|))
                                                       (|:| |siz|
                                                            (|NonNegativeInteger|))
                                                       (|:| |pos|
                                                            (QREFELT $ 6))
                                                       (|:| |np|
                                                            (|List|
                                                             (|String|)))))
                                                 (|:| |boundbox|
                                                      (|SBoundary|
                                                       (QREFELT $ 6)))
                                                 (|:| |trans|
                                                      (|STransform|
                                                       (QREFELT $ 6)))
                                                 (|:| |ifs|
                                                      (|Record|
                                                       (|:| |inx|
                                                            (|List|
                                                             (|List|
                                                              (|NonNegativeInteger|))))
                                                       (|:| |pts|
                                                            (|List|
                                                             (QREFELT $ 6)))))
                                                 (|:| |arrws|
                                                      (|Record|
                                                       (|:| |ln|
                                                            (|List|
                                                             (|List|
                                                              (QREFELT $ 6))))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                                 (|:| |arrw|
                                                      (|Record|
                                                       (|:| |st| (|String|))
                                                       (|:| |en| (|String|))
                                                       (|:| |offset|
                                                            (QREFELT $ 6))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                                 (|:| |shpe|
                                                      (|Record|
                                                       (|:| |shptype|
                                                            (|Symbol|))
                                                       (|:| |centre|
                                                            (QREFELT $ 6))
                                                       (|:| |size|
                                                            (QREFELT $ 6))
                                                       (|:| |fill|
                                                            (|Boolean|))))
                                                 (|:| |nodename|
                                                      (|Record|
                                                       (|:| |nme| (|String|))
                                                       (|:| |node| $)))
                                                 (|:| |np|
                                                      (|SceneNamedPoints|
                                                       (QREFELT $ 6)))
                                                 (|:| |empty| #13="empty"))
                                                #6#))
                              (QREFELT $ 272)))
                       (QREFELT $ 273))
                      . #12#)))
              (COND
               ((EQUAL (QVELT |n| 0) 'GROUP)
                (LETT |s| (SPADCALL |s| "group" (QREFELT $ 274)) . #12#)))
              (COND
               ((EQUAL (QVELT |n| 0) 'LINE)
                (LETT |s|
                      (SPADCALL
                       (LIST |s| "line "
                             (|SCENE;outputLLPoints|
                              (PROG2 (LETT #11# (QVELT |n| 2) . #12#)
                                  (QCDR #11#)
                                (|check_union2| (QEQCAR #11# 0)
                                                (|List| (|List| (QREFELT $ 6)))
                                                (|Union|
                                                 (|:| |points|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |material|
                                                      (|Record|
                                                       (|:| |lineWidth|
                                                            (|DoubleFloat|))
                                                       (|:| |lineCol|
                                                            (|String|))
                                                       (|:| |fillCol|
                                                            (|String|))
                                                       (|:| |matOpacity|
                                                            (|DoubleFloat|))))
                                                 (|:| |text|
                                                      (|Record|
                                                       (|:| |txt| (|String|))
                                                       (|:| |siz|
                                                            (|NonNegativeInteger|))
                                                       (|:| |pos|
                                                            (QREFELT $ 6))
                                                       (|:| |np|
                                                            (|List|
                                                             (|String|)))))
                                                 (|:| |boundbox|
                                                      (|SBoundary|
                                                       (QREFELT $ 6)))
                                                 (|:| |trans|
                                                      (|STransform|
                                                       (QREFELT $ 6)))
                                                 (|:| |ifs|
                                                      (|Record|
                                                       (|:| |inx|
                                                            (|List|
                                                             (|List|
                                                              (|NonNegativeInteger|))))
                                                       (|:| |pts|
                                                            (|List|
                                                             (QREFELT $ 6)))))
                                                 (|:| |arrws|
                                                      (|Record|
                                                       (|:| |ln|
                                                            (|List|
                                                             (|List|
                                                              (QREFELT $ 6))))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                                 (|:| |arrw|
                                                      (|Record|
                                                       (|:| |st| (|String|))
                                                       (|:| |en| (|String|))
                                                       (|:| |offset|
                                                            (QREFELT $ 6))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                                 (|:| |shpe|
                                                      (|Record|
                                                       (|:| |shptype|
                                                            (|Symbol|))
                                                       (|:| |centre|
                                                            (QREFELT $ 6))
                                                       (|:| |size|
                                                            (QREFELT $ 6))
                                                       (|:| |fill|
                                                            (|Boolean|))))
                                                 (|:| |nodename|
                                                      (|Record|
                                                       (|:| |nme| (|String|))
                                                       (|:| |node| $)))
                                                 (|:| |np|
                                                      (|SceneNamedPoints|
                                                       (QREFELT $ 6)))
                                                 (|:| |empty| #13#))
                                                #11#))
                              $))
                       (QREFELT $ 273))
                      . #12#)))
              (COND
               ((EQUAL (QVELT |n| 0) 'SHAPE)
                (SEQ
                 (LETT |tp|
                       (QVELT
                        (PROG2 (LETT #10# (QVELT |n| 2) . #12#)
                            (QCDR #10#)
                          (|check_union2| (QEQCAR #10# 8)
                                          (|Record| (|:| |shptype| (|Symbol|))
                                                    (|:| |centre|
                                                         (QREFELT $ 6))
                                                    (|:| |size| (QREFELT $ 6))
                                                    (|:| |fill| (|Boolean|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #13#))
                                          #10#))
                        0)
                       . #12#)
                 (LETT |pt1|
                       (QVELT
                        (PROG2 (LETT #10# (QVELT |n| 2) . #12#)
                            (QCDR #10#)
                          (|check_union2| (QEQCAR #10# 8)
                                          (|Record| (|:| |shptype| (|Symbol|))
                                                    (|:| |centre|
                                                         (QREFELT $ 6))
                                                    (|:| |size| (QREFELT $ 6))
                                                    (|:| |fill| (|Boolean|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #13#))
                                          #10#))
                        1)
                       . #12#)
                 (LETT |pt2|
                       (QVELT
                        (PROG2 (LETT #10# (QVELT |n| 2) . #12#)
                            (QCDR #10#)
                          (|check_union2| (QEQCAR #10# 8)
                                          (|Record| (|:| |shptype| (|Symbol|))
                                                    (|:| |centre|
                                                         (QREFELT $ 6))
                                                    (|:| |size| (QREFELT $ 6))
                                                    (|:| |fill| (|Boolean|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #13#))
                                          #10#))
                        2)
                       . #12#)
                 (EXIT
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| "shape" " type="
                               (SPADCALL |tp| (QREFELT $ 275)) " pt1="
                               (SPADCALL |pt1| (QREFELT $ 264)) " pt2="
                               (SPADCALL |pt2| (QREFELT $ 264)))
                         (QREFELT $ 273))
                        . #12#)))))
              (COND
               ((EQUAL (QVELT |n| 0) 'MATERIAL)
                (SEQ
                 (LETT |lw|
                       (QVELT
                        (PROG2 (LETT #9# (QVELT |n| 2) . #12#)
                            (QCDR #9#)
                          (|check_union2| (QEQCAR #9# 1)
                                          (|Record|
                                           (|:| |lineWidth| (|DoubleFloat|))
                                           (|:| |lineCol| (|String|))
                                           (|:| |fillCol| (|String|))
                                           (|:| |matOpacity| (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #13#))
                                          #9#))
                        0)
                       . #12#)
                 (LETT |lc|
                       (QVELT
                        (PROG2 (LETT #9# (QVELT |n| 2) . #12#)
                            (QCDR #9#)
                          (|check_union2| (QEQCAR #9# 1)
                                          (|Record|
                                           (|:| |lineWidth| (|DoubleFloat|))
                                           (|:| |lineCol| (|String|))
                                           (|:| |fillCol| (|String|))
                                           (|:| |matOpacity| (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #13#))
                                          #9#))
                        1)
                       . #12#)
                 (LETT |fc|
                       (QVELT
                        (PROG2 (LETT #9# (QVELT |n| 2) . #12#)
                            (QCDR #9#)
                          (|check_union2| (QEQCAR #9# 1)
                                          (|Record|
                                           (|:| |lineWidth| (|DoubleFloat|))
                                           (|:| |lineCol| (|String|))
                                           (|:| |fillCol| (|String|))
                                           (|:| |matOpacity| (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #13#))
                                          #9#))
                        2)
                       . #12#)
                 (LETT |mo|
                       (QVELT
                        (PROG2 (LETT #9# (QVELT |n| 2) . #12#)
                            (QCDR #9#)
                          (|check_union2| (QEQCAR #9# 1)
                                          (|Record|
                                           (|:| |lineWidth| (|DoubleFloat|))
                                           (|:| |lineCol| (|String|))
                                           (|:| |fillCol| (|String|))
                                           (|:| |matOpacity| (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #13#))
                                          #9#))
                        3)
                       . #12#)
                 (EXIT
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| "material" " lw="
                               (SPADCALL |lw| (QREFELT $ 276)) " lc="
                               (SPADCALL |lc| (QREFELT $ 277)) " fc="
                               (SPADCALL |fc| (QREFELT $ 277)) " mo="
                               (SPADCALL |mo| (QREFELT $ 276)))
                         (QREFELT $ 273))
                        . #12#)))))
              (COND
               ((EQUAL (QVELT |n| 0) 'TEXT)
                (SEQ
                 (LETT |t|
                       (QVELT
                        (PROG2 (LETT #8# (QVELT |n| 2) . #12#)
                            (QCDR #8#)
                          (|check_union2| (QEQCAR #8# 2)
                                          (|Record| (|:| |txt| (|String|))
                                                    (|:| |siz|
                                                         (|NonNegativeInteger|))
                                                    (|:| |pos| (QREFELT $ 6))
                                                    (|:| |np|
                                                         (|List| (|String|))))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #13#))
                                          #8#))
                        0)
                       . #12#)
                 (LETT |sz1|
                       (QVELT
                        (PROG2 (LETT #8# (QVELT |n| 2) . #12#)
                            (QCDR #8#)
                          (|check_union2| (QEQCAR #8# 2)
                                          (|Record| (|:| |txt| (|String|))
                                                    (|:| |siz|
                                                         (|NonNegativeInteger|))
                                                    (|:| |pos| (QREFELT $ 6))
                                                    (|:| |np|
                                                         (|List| (|String|))))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #13#))
                                          #8#))
                        1)
                       . #12#)
                 (LETT |p|
                       (QVELT
                        (PROG2 (LETT #8# (QVELT |n| 2) . #12#)
                            (QCDR #8#)
                          (|check_union2| (QEQCAR #8# 2)
                                          (|Record| (|:| |txt| (|String|))
                                                    (|:| |siz|
                                                         (|NonNegativeInteger|))
                                                    (|:| |pos| (QREFELT $ 6))
                                                    (|:| |np|
                                                         (|List| (|String|))))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #13#))
                                          #8#))
                        2)
                       . #12#)
                 (LETT |npt|
                       (QVELT
                        (PROG2 (LETT #8# (QVELT |n| 2) . #12#)
                            (QCDR #8#)
                          (|check_union2| (QEQCAR #8# 2)
                                          (|Record| (|:| |txt| (|String|))
                                                    (|:| |siz|
                                                         (|NonNegativeInteger|))
                                                    (|:| |pos| (QREFELT $ 6))
                                                    (|:| |np|
                                                         (|List| (|String|))))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #13#))
                                          #8#))
                        3)
                       . #12#)
                 (EXIT
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| "text=" (SPADCALL |t| (QREFELT $ 277))
                               " sz=" (SPADCALL |sz1| (QREFELT $ 269)) " p="
                               (SPADCALL |p| (QREFELT $ 264)) " npt="
                               (SPADCALL |npt| (QREFELT $ 278)))
                         (QREFELT $ 273))
                        . #12#)))))
              (COND
               ((EQUAL (QVELT |n| 0) 'TRANSFORM)
                (SEQ
                 (LETT |tr|
                       (PROG2 (LETT #7# (QVELT |n| 2) . #12#)
                           (QCDR #7#)
                         (|check_union2| (QEQCAR #7# 4)
                                         (|STransform| (QREFELT $ 6))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT $ 6))))
                                          (|:| |material|
                                               (|Record|
                                                (|:| |lineWidth|
                                                     (|DoubleFloat|))
                                                (|:| |lineCol| (|String|))
                                                (|:| |fillCol| (|String|))
                                                (|:| |matOpacity|
                                                     (|DoubleFloat|))))
                                          (|:| |text|
                                               (|Record| (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT $ 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT $ 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT $ 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT $ 6))
                                                (|:| |size| (QREFELT $ 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| $)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT $ 6)))
                                          (|:| |empty| #13#))
                                         #7#))
                       . #12#)
                 (EXIT
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| "transform" " tr="
                               (SPADCALL |tr| (QREFELT $ 279)))
                         (QREFELT $ 273))
                        . #12#)))))
              (COND
               ((EQUAL (QVELT |n| 0) 'CLIP)
                (LETT |s|
                      (SPADCALL
                       (LIST |s| "clip "
                             (SPADCALL
                              (PROG2 (LETT #6# (QVELT |n| 2) . #12#)
                                  (QCDR #6#)
                                (|check_union2| (QEQCAR #6# 3)
                                                (|SBoundary| (QREFELT $ 6))
                                                (|Union|
                                                 (|:| |points|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |material|
                                                      (|Record|
                                                       (|:| |lineWidth|
                                                            (|DoubleFloat|))
                                                       (|:| |lineCol|
                                                            (|String|))
                                                       (|:| |fillCol|
                                                            (|String|))
                                                       (|:| |matOpacity|
                                                            (|DoubleFloat|))))
                                                 (|:| |text|
                                                      (|Record|
                                                       (|:| |txt| (|String|))
                                                       (|:| |siz|
                                                            (|NonNegativeInteger|))
                                                       (|:| |pos|
                                                            (QREFELT $ 6))
                                                       (|:| |np|
                                                            (|List|
                                                             (|String|)))))
                                                 (|:| |boundbox|
                                                      (|SBoundary|
                                                       (QREFELT $ 6)))
                                                 (|:| |trans|
                                                      (|STransform|
                                                       (QREFELT $ 6)))
                                                 (|:| |ifs|
                                                      (|Record|
                                                       (|:| |inx|
                                                            (|List|
                                                             (|List|
                                                              (|NonNegativeInteger|))))
                                                       (|:| |pts|
                                                            (|List|
                                                             (QREFELT $ 6)))))
                                                 (|:| |arrws|
                                                      (|Record|
                                                       (|:| |ln|
                                                            (|List|
                                                             (|List|
                                                              (QREFELT $ 6))))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                                 (|:| |arrw|
                                                      (|Record|
                                                       (|:| |st| (|String|))
                                                       (|:| |en| (|String|))
                                                       (|:| |offset|
                                                            (QREFELT $ 6))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                                 (|:| |shpe|
                                                      (|Record|
                                                       (|:| |shptype|
                                                            (|Symbol|))
                                                       (|:| |centre|
                                                            (QREFELT $ 6))
                                                       (|:| |size|
                                                            (QREFELT $ 6))
                                                       (|:| |fill|
                                                            (|Boolean|))))
                                                 (|:| |nodename|
                                                      (|Record|
                                                       (|:| |nme| (|String|))
                                                       (|:| |node| $)))
                                                 (|:| |np|
                                                      (|SceneNamedPoints|
                                                       (QREFELT $ 6)))
                                                 (|:| |empty| #13#))
                                                #6#))
                              (QREFELT $ 272)))
                       (QREFELT $ 273))
                      . #12#)))
              (COND
               ((EQUAL (QVELT |n| 0) 'IFS)
                (SEQ
                 (LETT |ix|
                       (QCAR
                        (PROG2 (LETT #5# (QVELT |n| 2) . #12#)
                            (QCDR #5#)
                          (|check_union2| (QEQCAR #5# 5)
                                          (|Record|
                                           (|:| |inx|
                                                (|List|
                                                 (|List|
                                                  (|NonNegativeInteger|))))
                                           (|:| |pts| (|List| (QREFELT $ 6))))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #13#))
                                          #5#)))
                       . #12#)
                 (LETT |pt|
                       (QCDR
                        (PROG2 (LETT #5# (QVELT |n| 2) . #12#)
                            (QCDR #5#)
                          (|check_union2| (QEQCAR #5# 5)
                                          (|Record|
                                           (|:| |inx|
                                                (|List|
                                                 (|List|
                                                  (|NonNegativeInteger|))))
                                           (|:| |pts| (|List| (QREFELT $ 6))))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #13#))
                                          #5#)))
                       . #12#)
                 (EXIT
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| "ifs" " ix="
                               (|SCENE;outputLLIndexes| |ix| $) " pt="
                               (|SCENE;outputLPoints| |pt| $))
                         (QREFELT $ 273))
                        . #12#)))))
              (COND
               ((EQUAL (QVELT |n| 0) 'ARROWS)
                (SEQ
                 (LETT |pts|
                       (QVELT
                        (PROG2 (LETT #4# (QVELT |n| 2) . #12#)
                            (QCDR #4#)
                          (|check_union2| (QEQCAR #4# 6)
                                          (|Record|
                                           (|:| |ln|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |mode| (|Symbol|))
                                           (|:| |size| (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #13#))
                                          #4#))
                        0)
                       . #12#)
                 (LETT |m|
                       (QVELT
                        (PROG2 (LETT #4# (QVELT |n| 2) . #12#)
                            (QCDR #4#)
                          (|check_union2| (QEQCAR #4# 6)
                                          (|Record|
                                           (|:| |ln|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |mode| (|Symbol|))
                                           (|:| |size| (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #13#))
                                          #4#))
                        1)
                       . #12#)
                 (LETT |sz|
                       (QVELT
                        (PROG2 (LETT #4# (QVELT |n| 2) . #12#)
                            (QCDR #4#)
                          (|check_union2| (QEQCAR #4# 6)
                                          (|Record|
                                           (|:| |ln|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |mode| (|Symbol|))
                                           (|:| |size| (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #13#))
                                          #4#))
                        2)
                       . #12#)
                 (EXIT
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| "arrows" " pts="
                               (|SCENE;outputLLPoints| |pts| $) " m="
                               (SPADCALL |m| (QREFELT $ 275)) " sz="
                               (SPADCALL |sz| (QREFELT $ 276)))
                         (QREFELT $ 273))
                        . #12#)))))
              (COND
               ((EQUAL (QVELT |n| 0) 'ARROW)
                (SEQ
                 (LETT |str|
                       (QVELT
                        (PROG2 (LETT #3# (QVELT |n| 2) . #12#)
                            (QCDR #3#)
                          (|check_union2| (QEQCAR #3# 7)
                                          (|Record| (|:| |st| (|String|))
                                                    (|:| |en| (|String|))
                                                    (|:| |offset|
                                                         (QREFELT $ 6))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #13#))
                                          #3#))
                        0)
                       . #12#)
                 (LETT |ena|
                       (QVELT
                        (PROG2 (LETT #3# (QVELT |n| 2) . #12#)
                            (QCDR #3#)
                          (|check_union2| (QEQCAR #3# 7)
                                          (|Record| (|:| |st| (|String|))
                                                    (|:| |en| (|String|))
                                                    (|:| |offset|
                                                         (QREFELT $ 6))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #13#))
                                          #3#))
                        1)
                       . #12#)
                 (LETT |ofs|
                       (QVELT
                        (PROG2 (LETT #3# (QVELT |n| 2) . #12#)
                            (QCDR #3#)
                          (|check_union2| (QEQCAR #3# 7)
                                          (|Record| (|:| |st| (|String|))
                                                    (|:| |en| (|String|))
                                                    (|:| |offset|
                                                         (QREFELT $ 6))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #13#))
                                          #3#))
                        2)
                       . #12#)
                 (LETT |md|
                       (QVELT
                        (PROG2 (LETT #3# (QVELT |n| 2) . #12#)
                            (QCDR #3#)
                          (|check_union2| (QEQCAR #3# 7)
                                          (|Record| (|:| |st| (|String|))
                                                    (|:| |en| (|String|))
                                                    (|:| |offset|
                                                         (QREFELT $ 6))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #13#))
                                          #3#))
                        3)
                       . #12#)
                 (LETT |sz|
                       (QVELT
                        (PROG2 (LETT #3# (QVELT |n| 2) . #12#)
                            (QCDR #3#)
                          (|check_union2| (QEQCAR #3# 7)
                                          (|Record| (|:| |st| (|String|))
                                                    (|:| |en| (|String|))
                                                    (|:| |offset|
                                                         (QREFELT $ 6))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #13#))
                                          #3#))
                        4)
                       . #12#)
                 (EXIT
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| "arrows" " str="
                               (SPADCALL |str| (QREFELT $ 277)) " ena="
                               (SPADCALL |ena| (QREFELT $ 277)) " ofs="
                               (SPADCALL |ofs| (QREFELT $ 264)) " md="
                               (SPADCALL |md| (QREFELT $ 275)) " sz="
                               (SPADCALL |sz| (QREFELT $ 276)))
                         (QREFELT $ 273))
                        . #12#)))))
              (COND
               ((EQUAL (QVELT |n| 0) 'DEF)
                (SEQ
                 (LETT |nn|
                       (QCAR
                        (PROG2 (LETT #2# (QVELT |n| 2) . #12#)
                            (QCDR #2#)
                          (|check_union2| (QEQCAR #2# 9)
                                          (|Record| (|:| |nme| (|String|))
                                                    (|:| |node| $))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #13#))
                                          #2#)))
                       . #12#)
                 (EXIT
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| "def" " nn="
                               (SPADCALL |nn| (QREFELT $ 277)))
                         (QREFELT $ 273))
                        . #12#)))))
              (COND
               ((EQUAL (QVELT |n| 0) 'USE)
                (SEQ
                 (LETT |nn|
                       (QCAR
                        (PROG2 (LETT #2# (QVELT |n| 2) . #12#)
                            (QCDR #2#)
                          (|check_union2| (QEQCAR #2# 9)
                                          (|Record| (|:| |nme| (|String|))
                                                    (|:| |node| $))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #13#))
                                          #2#)))
                       . #12#)
                 (EXIT
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| "use" " nn="
                               (SPADCALL |nn| (QREFELT $ 277)))
                         (QREFELT $ 273))
                        . #12#)))))
              (COND
               ((EQUAL (QVELT |n| 0) 'NAMEDPOINTS)
                (SEQ
                 (LETT |nam|
                       (PROG2 (LETT #1# (QVELT |n| 2) . #12#)
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 10)
                                         (|SceneNamedPoints| (QREFELT $ 6))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT $ 6))))
                                          (|:| |material|
                                               (|Record|
                                                (|:| |lineWidth|
                                                     (|DoubleFloat|))
                                                (|:| |lineCol| (|String|))
                                                (|:| |fillCol| (|String|))
                                                (|:| |matOpacity|
                                                     (|DoubleFloat|))))
                                          (|:| |text|
                                               (|Record| (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT $ 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT $ 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT $ 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT $ 6))
                                                (|:| |size| (QREFELT $ 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| $)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT $ 6)))
                                          (|:| |empty| #13#))
                                         #1#))
                       . #12#)
                 (EXIT
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| "namedpoints" " n="
                               (SPADCALL |nam| (QREFELT $ 280)))
                         (QREFELT $ 273))
                        . #12#)))))
              (LETT |s|
                    (SPADCALL
                     (LIST |s| " #ch="
                           (SPADCALL (SPADCALL (QVELT |n| 1) (QREFELT $ 177))
                                     (QREFELT $ 269)))
                     (QREFELT $ 273))
                    . #12#)
              (EXIT |s|)))) 

(DECLAIM (NOTINLINE |Scene;|)) 

(DEFUN |Scene| (#1=#:G2144)
  (SPROG NIL
         (PROG (#2=#:G2145)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Scene|)
                                               '|domainEqualList|)
                    . #3=(|Scene|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Scene;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Scene|)))))))))) 

(DEFUN |Scene;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|Scene|))
          (LETT |dv$| (LIST '|Scene| DV$1) . #1#)
          (LETT $ (GETREFV 282) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|Scene| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record| (|:| |type| (|Symbol|))
                              (|:| |children| (|List| $))
                              (|:| |parameters|
                                   (|Union|
                                    (|:| |points| (|List| (|List| |#1|)))
                                    (|:| |material|
                                         (|Record|
                                          (|:| |lineWidth| (|DoubleFloat|))
                                          (|:| |lineCol| (|String|))
                                          (|:| |fillCol| (|String|))
                                          (|:| |matOpacity| (|DoubleFloat|))))
                                    (|:| |text|
                                         (|Record| (|:| |txt| (|String|))
                                                   (|:| |siz|
                                                        (|NonNegativeInteger|))
                                                   (|:| |pos| |#1|)
                                                   (|:| |np|
                                                        (|List| (|String|)))))
                                    (|:| |boundbox| (|SBoundary| |#1|))
                                    (|:| |trans| (|STransform| |#1|))
                                    (|:| |ifs|
                                         (|Record|
                                          (|:| |inx|
                                               (|List|
                                                (|List|
                                                 (|NonNegativeInteger|))))
                                          (|:| |pts| (|List| |#1|))))
                                    (|:| |arrws|
                                         (|Record|
                                          (|:| |ln| (|List| (|List| |#1|)))
                                          (|:| |mode| (|Symbol|))
                                          (|:| |size| (|DoubleFloat|))))
                                    (|:| |arrw|
                                         (|Record| (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| |#1|)
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                    (|:| |shpe|
                                         (|Record| (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| |#1|)
                                                   (|:| |size| |#1|)
                                                   (|:| |fill| (|Boolean|))))
                                    (|:| |nodename|
                                         (|Record| (|:| |nme| (|String|))
                                                   (|:| |node| $)))
                                    (|:| |np| (|SceneNamedPoints| |#1|))
                                    (|:| |empty| "empty")))))
          $))) 

(MAKEPROP '|Scene| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|SBoundary| 6)
              |SCENE;createSceneRoot;Sb$;1| (0 . |boxBoundary|)
              (|Record| (|:| |mins| 6) (|:| |maxs| 6))
              |SCENE;createSceneRoot;R$;2| (|Integer|) (6 . |sipnt|)
              |SCENE;createSceneRoot;4I$;3| (12 . |nullBoundary|)
              |SCENE;createSceneRoot;$;4| |SCENE;createSceneGroup;$;5| (|Void|)
              |SCENE;addChild!;2$V;75| |SCENE;addSceneGroup;2$;6| (|List| 6)
              |SCENE;createSceneLine;L$;7| |SCENE;addSceneLine;$L$;8|
              (|DoubleFloat|) |SCENE;boundary;$DfSb;87| (16 . |getCentre|)
              (21 . |lineIntersect|) |SCENE;createSceneLine;2$Df$;9|
              |SCENE;addSceneLine;3$Df$;10| (|List| 22)
              |SCENE;createSceneLines;L$;11| |SCENE;addSceneLines;$L$;12|
              (|Record| (|:| |shptype| 47) (|:| |centre| 6) (|:| |size| 6)
                        (|:| |fill| 100))
              |SCENE;createSceneShape;R$;13| |SCENE;addSceneShape;$R$;14|
              (27 . |getMax|) (32 . |getMin|) (37 . -)
              |SCENE;createSceneShape;Sb$;15| |SCENE;addSceneShape;$Sb$;16|
              (|String|) |SCENE;createSceneDef;S2$;17|
              |SCENE;addSceneDef;$S2$;18| |SCENE;createSceneUse;S$;19|
              |SCENE;addSceneUse;$S$;20| (|Symbol|)
              |SCENE;createSceneArrows;LSDf$;21|
              |SCENE;addSceneArrows;$LSDf$;22|
              |SCENE;createSceneArrow;2SPTSDf$;23|
              |SCENE;addSceneArrow;$2SPTSDf$;24|
              |SCENE;createSceneArrow;2$PTS2Df$;25|
              |SCENE;addSceneArrow;3$PTS2Df$;26| (|SceneNamedPoints| 6)
              |SCENE;createSceneNamedPoints;Snp$;27|
              |SCENE;addSceneNamedPoints;$Snp$;28| (|List| 106)
              |SCENE;createSceneIFS;LL$;29| |SCENE;addSceneIFS;$LL$;30|
              (|SceneIFS| 6) (43 . |indexes|) (48 . |pointList|)
              |SCENE;createSceneIFS;Sifs$;31| |SCENE;addSceneIFS;$Sifs$;32|
              (53 . |spnt|) |SCENE;createSceneBox;Df$;33|
              |SCENE;addSceneBox;$Df$;34|
              (|Record| (|:| |txt| 42) (|:| |siz| 71) (|:| |pos| 6)
                        (|:| |np| 74))
              |SCENE;createSceneText;R$;35| |SCENE;addSceneText;$R$;36|
              (|NonNegativeInteger|) |SCENE;createSceneText;SNniPT$;37|
              |SCENE;addSceneText;$SNniPT$;38| (|List| 42)
              |SCENE;createSceneText;LNniPT$;39|
              |SCENE;addSceneText;$LNniPT$;40| |SCENE;createSceneClip;Sb$;41|
              |SCENE;addSceneClip;$Sb$;42| |SCENE;createSceneClip;R$;43|
              |SCENE;addSceneClip;$R$;44| (60 . |screenCoordX|)
              (65 . |screenCoordY|) (70 . |spnt|)
              |SCENE;createSceneGrid;DfSb$;45| |SCENE;addSceneGrid;$DfSb$;46|
              |SCENE;createSceneGrid;DfR$;47| |SCENE;addSceneGrid;$DfR$;48|
              (|PositiveInteger|) (|Float|) (76 . |float|) (83 . |coerce|)
              (|Record| (|:| |lineWidth| 25) (|:| |lineCol| 42)
                        (|:| |fillCol| 42) (|:| |matOpacity| 25))
              |SCENE;addSceneMaterial;$R$;68| |SCENE;createSceneGrid;Sb$;49|
              |SCENE;addSceneGrid;$Sb$;50| |SCENE;createSceneGrid;R$;51|
              |SCENE;addSceneGrid;$R$;52| (88 . |singleFace|)
              (93 . |sierpinskiDivide|) (|Boolean|) (99 . ~=) (105 . |elt|)
              (111 . +) (117 . *) (123 . |concat|) (|List| 71) (129 . |elt|)
              (135 . |#|) (140 . |elt|) (146 . |concat|)
              |SCENE;createScenePattern;SNniSb$;57|
              |SCENE;addScenePattern;$SNniSb$;58|
              |SCENE;createScenePattern;SNniR$;59|
              |SCENE;addScenePattern;$SNniR$;60| (152 . |log10|) (157 . >)
              (|List| $) (163 . |concat|) (168 . ~=)
              |SCENE;createSceneRuler;SPTSb$;61|
              |SCENE;addSceneRuler;$SPTSb$;62|
              |SCENE;createSceneRuler;SPTR$;63| |SCENE;addSceneRuler;$SPTR$;64|
              (|STransform| (|SCartesian| '2)) (174 . |stranslate|)
              (|Scene| (|SCartesian| '2)) (184 . |createSceneTransform|)
              (|DirectedGraph| 42) (189 . |subdiagramSvg|)
              |SCENE;createSceneGraph;Dg2NniB$;65|
              |SCENE;addSceneGraph;$Dg2NniB$;66|
              |SCENE;createSceneMaterial;R$;67|
              |SCENE;createSceneMaterial;Df2S$;69|
              |SCENE;addSceneMaterial;$Df2S$;70| (|STransform| 6)
              |SCENE;createSceneTransform;St$;71|
              |SCENE;addSceneTransform;$St$;72| (|Segment| 25) (197 . |lo|)
              (202 . |hi|) (|Mapping| 6 6)
              |SCENE;createArrows2Din2D;M2SNni$;73|
              |SCENE;addArrows2Din2D;$M2SNni$;74| (|List| $$) (207 . |concat|)
              |SCENE;removeChild!;2$V;76| (213 . ~=)
              |SCENE;setTransform!;$StV;77| (219 . |xform|)
              (225 . |containsPoint?|) (231 . ~=) (237 . |distance|)
              (243 . |One|) (247 . |Zero|) (251 . >) (257 . >) (|XmlAttribute|)
              (263 . |xmlAttribute|) (|List| 157) (|XmlElement|)
              (269 . |xmlElement|) (|List| 160) (276 . |concat|)
              (282 . |isNull?|) (287 . |stranslate|) (297 . |concat|)
              (303 . ~=) (309 . |findPoint|) (315 . |xmlElement|)
              (322 . |empty?|) (327 . |compound|) (333 . |addPoints!|)
              (|Scene| 6) (340 . |addNode!|) |SCENE;toSVG;$RStSbDf2BSnpXe;82|
              (347 . |findNode|) (353 . |#|) |SCENE;toSVG;$RStRDf2BSnpXe;83|
              (358 . |identity|) (362 . |namedBranch|) (|ExportXml|)
              (368 . |writeXml|) |SCENE;writeSvg;$SV;84|
              |SCENE;writeSvgQuantised;$SV;85| (374 . |extendToPoint|)
              (380 . |ellipseBoundary|) (386 . |sunion|) (392 . |screenCoordZ|)
              (397 . |concat|) |SCENE;toX3D;$RStSbXe;91| (403 . |curveLoops|)
              (410 . |smesh|) (416 . |xmlAttribute|) |SCENE;toX3D;$RStRXe;92|
              |SCENE;writeX3d;$SV;93| (|Reference| 22) (|Reference| 57)
              (|Reference| 71) |SCENE;toObj;$RRRStSbV;94| (422 . |elt|)
              (427 . |elt|) (432 . |concat|) (438 . |setelt!|) (444 . |elt|)
              (449 . |concat|) (455 . |setelt!|) (461 . |setelt!|)
              |SCENE;toObj;$RRRStRV;95| (467 . |ref|) (472 . |ref|)
              (477 . |ref|) (|FileName|) (482 . |coerce|) (|TextFile|)
              (487 . |open|) (493 . |writeLine!|) (499 . |close!|)
              |SCENE;writeObj;$SV;96| (504 . |writeVRML|)
              |SCENE;writeVRML;$SV;97| (510 . ~=) (516 . |segment|) (|List| 25)
              (522 . |list|) (527 . |list|) (532 . |Pnan?|) (|Mapping| 6 25)
              |SCENE;createPlot1Din2D;MSNni$;103|
              |SCENE;addPlot1Din2D;$MSNni$;104| (|List| 227) (537 . |first|)
              (|Mapping| 25 25) |SCENE;createPlot1Din2D;MSNni$;105|
              |SCENE;addPlot1Din2D;$MSNni$;106| (|ParametricPlaneCurve| 232)
              (542 . |coordinate|)
              |SCENE;createPlot1Din2Dparametric;PpcSNni$;107|
              |SCENE;addPlot1Din2Dparametric;$PpcSNni$;108|
              (|ParametricSpaceCurve| 232) (548 . |coordinate|)
              |SCENE;createPlot1Din3Dparametric;MSNni$;111|
              |SCENE;createPlot1Din3Dparametric;PscSNni$;109|
              |SCENE;addPlot1Din3Dparametric;$PscSNni$;110|
              |SCENE;addPlot1Din3Dparametric;$MSNni$;112| (|Mapping| 6 25 25)
              |SCENE;createPlot2Din3D;M2SNni$;113| (|List| 245) (554 . |first|)
              (|Mapping| 25 25 25) |SCENE;createPlot2Din3D;M2SNni$;114|
              |SCENE;addPlot2Din3D;$M2SNni$;115| (559 . |One|) (563 . |One|)
              (|ParametricSurface| 249) (567 . |coordinate|) (|List| 249)
              (573 . |first|) |SCENE;createPlot2Din3Dparametric;Ps2SNni$;116|
              |SCENE;addPlot2Din3Dparametric;$Ps2SNni$;117|
              |SCENE;createPlot2Din3Dparametric;M2SNni$;118|
              |SCENE;addPlot2Din3Dparametric;$M2SNni$;119| (|OutputForm|)
              (578 . |coerce|) (583 . |coerce|) (588 . |second|)
              (593 . |bracket|) (598 . |second|) (603 . |coerce|)
              (608 . |coerce|) (613 . |second|) (618 . |second|)
              (623 . |coerce|) (628 . |hconcat|) (633 . |hconcat|)
              (639 . |coerce|) (644 . |coerce|) (649 . |coerce|)
              (654 . |coerce|) (659 . |coerce|) (664 . |coerce|)
              |SCENE;coerce;$Of;124|)
           '#(|writeX3d| 669 |writeVRML| 675 |writeSvgQuantised| 681 |writeSvg|
              687 |writeObj| 693 |toX3D| 699 |toSVG| 715 |toObj| 739
              |setTransform!| 759 |removeChild!| 765 |createSceneUse| 771
              |createSceneTransform| 776 |createSceneText| 781
              |createSceneShape| 800 |createSceneRuler| 810 |createSceneRoot|
              824 |createScenePattern| 846 |createSceneNamedPoints| 860
              |createSceneMaterial| 865 |createSceneLines| 877
              |createSceneLine| 882 |createSceneIFS| 894 |createSceneGroup| 905
              |createSceneGrid| 909 |createSceneGraph| 931 |createSceneDef| 939
              |createSceneClip| 945 |createSceneBox| 955 |createSceneArrows|
              960 |createSceneArrow| 967 |createPlot2Din3Dparametric| 986
              |createPlot2Din3D| 1002 |createPlot1Din3Dparametric| 1018
              |createPlot1Din2Dparametric| 1032 |createPlot1Din2D| 1039
              |createArrows2Din2D| 1053 |coerce| 1061 |boundary| 1066
              |addSceneUse| 1072 |addSceneTransform| 1078 |addSceneText| 1084
              |addSceneShape| 1106 |addSceneRuler| 1118 |addScenePattern| 1134
              |addSceneNamedPoints| 1150 |addSceneMaterial| 1156
              |addSceneLines| 1170 |addSceneLine| 1176 |addSceneIFS| 1190
              |addSceneGroup| 1203 |addSceneGrid| 1208 |addSceneGraph| 1234
              |addSceneDef| 1243 |addSceneClip| 1250 |addSceneBox| 1262
              |addSceneArrows| 1268 |addSceneArrow| 1276
              |addPlot2Din3Dparametric| 1297 |addPlot2Din3D| 1315
              |addPlot1Din3Dparametric| 1324 |addPlot1Din2Dparametric| 1340
              |addPlot1Din2D| 1348 |addChild!| 1364 |addArrows2Din2D| 1370)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 281
                                                 '(2 8 0 6 6 10 2 6 0 13 13 14
                                                   0 8 0 16 1 8 6 0 27 2 8 6 0
                                                   6 28 1 8 6 0 37 1 8 6 0 38 2
                                                   6 0 0 0 39 1 60 57 0 61 1 60
                                                   22 0 62 3 6 0 25 25 25 65 1
                                                   6 25 0 81 1 6 25 0 82 2 6 0
                                                   25 25 83 3 89 0 13 13 88 90
                                                   1 89 25 0 91 1 60 0 22 98 2
                                                   60 0 0 71 99 2 71 100 0 0
                                                   101 2 22 6 0 13 102 2 6 0 0
                                                   0 103 2 6 0 25 0 104 2 22 0
                                                   0 6 105 2 57 106 0 13 107 1
                                                   106 71 0 108 2 106 71 0 13
                                                   109 2 31 0 0 22 110 1 25 0 0
                                                   115 2 13 100 0 0 116 1 42 0
                                                   117 118 2 13 100 0 0 119 6
                                                   124 0 25 25 25 25 25 25 125
                                                   1 126 0 124 127 4 128 19 126
                                                   0 100 100 129 1 138 25 0 139
                                                   1 138 25 0 140 2 144 0 0 2
                                                   145 2 47 100 0 0 147 2 135 6
                                                   0 6 149 2 8 100 0 6 150 2 42
                                                   100 0 0 151 2 6 25 0 0 152 0
                                                   89 0 153 0 89 0 154 2 25 100
                                                   0 0 155 2 71 100 0 0 156 2
                                                   157 0 42 42 158 3 160 0 42
                                                   117 159 161 2 162 0 0 160
                                                   163 1 8 100 0 164 6 135 0 25
                                                   25 25 25 25 25 165 2 159 0 0
                                                   157 166 2 74 100 0 0 167 2
                                                   54 6 0 42 168 3 160 0 42 42
                                                   159 169 1 160 100 0 170 2
                                                   135 0 0 0 171 3 54 0 0 42 0
                                                   172 3 54 0 0 42 173 174 2 54
                                                   173 0 42 176 1 144 71 0 177
                                                   0 135 0 179 2 54 0 117 74
                                                   180 2 181 19 160 42 182 2 8
                                                   0 0 6 185 2 8 0 6 6 186 2 8
                                                   0 0 0 187 1 6 25 0 188 2 74
                                                   0 0 42 189 3 60 31 22 25 13
                                                   191 2 60 0 31 100 192 2 157
                                                   0 42 74 193 1 198 71 0 200 1
                                                   196 22 0 201 2 22 0 0 0 202
                                                   2 196 22 0 22 203 1 197 57 0
                                                   204 2 57 0 0 0 205 2 197 57
                                                   0 57 206 2 198 71 0 71 207 1
                                                   196 0 22 209 1 197 0 57 210
                                                   1 198 0 71 211 1 212 0 42
                                                   213 2 214 0 212 42 215 2 214
                                                   42 0 42 216 1 214 0 0 217 2
                                                   181 19 160 42 219 2 25 100 0
                                                   0 221 2 138 0 25 25 222 1
                                                   223 0 25 224 1 22 0 6 225 1
                                                   6 100 0 226 1 230 227 0 231
                                                   2 235 232 0 71 236 2 239 232
                                                   0 71 240 1 247 245 0 248 0
                                                   25 0 252 0 71 0 253 2 254
                                                   249 0 71 255 1 256 249 0 257
                                                   1 22 262 0 263 1 6 262 0 264
                                                   1 22 6 0 265 1 262 0 117 266
                                                   1 31 22 0 267 1 106 262 0
                                                   268 1 71 262 0 269 1 106 71
                                                   0 270 1 57 106 0 271 1 8 262
                                                   0 272 1 262 0 117 273 2 262
                                                   0 0 0 274 1 47 262 0 275 1
                                                   25 262 0 276 1 42 262 0 277
                                                   1 74 262 0 278 1 135 262 0
                                                   279 1 54 262 0 280 2 0 19 0
                                                   42 195 2 0 19 0 42 220 2 0
                                                   19 0 42 184 2 0 19 0 42 183
                                                   2 0 19 0 42 218 4 0 160 0 92
                                                   135 8 190 4 0 160 0 92 135
                                                   11 194 8 0 160 0 92 135 11
                                                   25 100 100 54 178 8 0 160 0
                                                   92 135 8 25 100 100 54 175 6
                                                   0 19 0 196 197 198 135 8 199
                                                   6 0 19 0 196 197 198 135 11
                                                   208 2 0 19 0 135 148 2 0 19
                                                   0 0 146 1 0 0 42 45 1 0 0
                                                   135 136 1 0 0 68 69 3 0 0 42
                                                   71 6 72 3 0 0 74 71 6 75 1 0
                                                   0 34 35 1 0 0 8 40 3 0 0 47
                                                   6 8 120 3 0 0 47 6 11 122 0
                                                   0 0 17 1 0 0 11 12 1 0 0 8 9
                                                   4 0 0 13 13 13 13 15 3 0 0
                                                   47 71 8 111 3 0 0 47 71 11
                                                   113 1 0 0 54 55 1 0 0 92 132
                                                   3 0 0 25 42 42 133 1 0 0 31
                                                   32 1 0 0 22 23 3 0 0 0 0 25
                                                   29 2 0 0 57 22 58 1 0 0 60
                                                   63 0 0 0 18 2 0 0 25 8 84 2
                                                   0 0 25 11 86 1 0 0 8 94 1 0
                                                   0 11 96 4 0 0 128 71 71 100
                                                   130 2 0 0 42 0 43 1 0 0 8 77
                                                   1 0 0 11 79 1 0 0 25 66 3 0
                                                   0 31 47 25 48 5 0 0 42 42 6
                                                   47 25 50 6 0 0 0 0 6 47 25
                                                   25 52 4 0 0 245 138 138 71
                                                   260 4 0 0 254 138 138 71 258
                                                   4 0 0 249 138 138 71 250 4 0
                                                   0 245 138 138 71 246 3 0 0
                                                   239 138 71 242 3 0 0 227 138
                                                   71 241 3 0 0 235 138 71 237
                                                   3 0 0 227 138 71 228 3 0 0
                                                   232 138 71 233 4 0 0 141 138
                                                   138 71 142 1 0 262 0 281 2 0
                                                   8 0 25 26 2 0 0 0 42 46 2 0
                                                   0 0 135 137 2 0 0 0 68 70 4
                                                   0 0 0 42 71 6 73 4 0 0 0 74
                                                   71 6 76 2 0 0 0 34 36 2 0 0
                                                   0 8 41 4 0 0 0 47 6 8 121 4
                                                   0 0 0 47 6 11 123 4 0 0 0 47
                                                   71 8 112 4 0 0 0 47 71 11
                                                   114 2 0 0 0 54 56 2 0 0 0 92
                                                   93 4 0 0 0 25 42 42 134 2 0
                                                   0 0 31 33 2 0 0 0 22 24 4 0
                                                   0 0 0 0 25 30 3 0 0 0 57 22
                                                   59 2 0 0 0 60 64 1 0 0 0 21
                                                   3 0 0 0 25 8 85 3 0 0 0 25
                                                   11 87 2 0 0 0 8 95 2 0 0 0
                                                   11 97 5 0 0 0 128 71 71 100
                                                   131 3 0 0 0 42 0 44 2 0 0 0
                                                   8 78 2 0 0 0 11 80 2 0 0 0
                                                   25 67 4 0 0 0 31 47 25 49 6
                                                   0 0 0 42 42 6 47 25 51 7 0 0
                                                   0 0 0 6 47 25 25 53 5 0 0 0
                                                   245 138 138 71 261 5 0 0 0
                                                   254 138 138 71 259 5 0 0 0
                                                   249 138 138 71 251 4 0 0 0
                                                   239 138 71 243 4 0 0 0 227
                                                   138 71 244 4 0 0 0 235 138
                                                   71 238 4 0 0 0 227 138 71
                                                   229 4 0 0 0 232 138 71 234 2
                                                   0 19 0 0 20 5 0 0 0 141 138
                                                   138 71 143)))))
           '|lookupComplete|)) 
