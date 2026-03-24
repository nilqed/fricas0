
(SDEFUN |SCENE;createSceneRoot;Sb%;1| ((|bb| (|SBoundary| PT)) (% (%)))
        (VECTOR 'ROOT NIL (CONS 3 |bb|))) 

(SDEFUN |SCENE;createSceneRoot;4I%;2|
        ((|minx| (|Integer|)) (|miny| (|Integer|)) (|maxx| (|Integer|))
         (|maxy| (|Integer|)) (% (%)))
        (SPROG ((|bb| (|SBoundary| PT)))
               (SEQ
                (LETT |bb|
                      (SPADCALL (SPADCALL |minx| |miny| (QREFELT % 11))
                                (SPADCALL |maxx| |maxy| (QREFELT % 11))
                                (QREFELT % 12)))
                (EXIT (VECTOR 'ROOT NIL (CONS 3 |bb|)))))) 

(SDEFUN |SCENE;createSceneRoot;%;3| ((% (%)))
        (VECTOR 'ROOT NIL (CONS 3 (SPADCALL (QREFELT % 14))))) 

(SDEFUN |SCENE;createSceneGroup;%;4| ((% (%)))
        (VECTOR 'GROUP NIL (CONS 11 "empty"))) 

(SDEFUN |SCENE;addSceneGroup;2%;5| ((|n| (%)) (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (SPADCALL (QREFELT % 16)))
                    (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneLine;L%;6| ((|line| (|List| PT)) (% (%)))
        (VECTOR 'LINE NIL (CONS 0 (LIST |line|)))) 

(SDEFUN |SCENE;addSceneLine;%L%;7| ((|n| (%)) (|line| (|List| PT)) (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (SPADCALL |line| (QREFELT % 21)))
                    (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneLine;2%Df%;8|
        ((|st| (%)) (|en| (%)) (|fontScale| (|DoubleFloat|)) (% (%)))
        (SPADCALL |st| |en| |fontScale| 'T (QREFELT % 25))) 

(SDEFUN |SCENE;addSceneLine;3%Df%;9|
        ((|n| (%)) (|st| (%)) (|en| (%)) (|fontScale| (|DoubleFloat|)) (% (%)))
        (SPADCALL |n| |st| |en| |fontScale| 'T (QREFELT % 27))) 

(SDEFUN |SCENE;createSceneLine;2%DfB%;10|
        ((|st| (%)) (|en| (%)) (|fontScale| (|DoubleFloat|))
         (|shortenLine| (|Boolean|)) (% (%)))
        (SPROG
         ((|enPoint| (PT)) (|stPoint| (PT)) (|enBoundary| #1=(|SBoundary| PT))
          (|stBoundary| #1#))
         (SEQ (LETT |stBoundary| (SPADCALL |st| |fontScale| (QREFELT % 29)))
              (LETT |enBoundary| (SPADCALL |en| |fontScale| (QREFELT % 29)))
              (LETT |stPoint| (SPADCALL |stBoundary| (QREFELT % 30)))
              (LETT |enPoint| (SPADCALL |enBoundary| (QREFELT % 30)))
              (COND
               (|shortenLine|
                (SEQ
                 (LETT |stPoint|
                       (SPADCALL |enBoundary| |stPoint| (QREFELT % 31)))
                 (EXIT
                  (LETT |enPoint|
                        (SPADCALL |stBoundary| |enPoint| (QREFELT % 31)))))))
              (EXIT
               (VECTOR 'LINE NIL (CONS 0 (LIST (LIST |stPoint| |enPoint|)))))))) 

(SDEFUN |SCENE;addSceneLine;3%DfB%;11|
        ((|n| (%)) (|st| (%)) (|en| (%)) (|fontScale| (|DoubleFloat|))
         (|shortenLine| (|Boolean|)) (% (%)))
        (SPROG ((|c| (%)))
               (SEQ
                (LETT |c|
                      (SPADCALL |st| |en| |fontScale| |shortenLine|
                                (QREFELT % 25)))
                (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneLines;L%;12| ((|lines| (|List| (|List| PT))) (% (%)))
        (VECTOR 'LINE NIL (CONS 0 |lines|))) 

(SDEFUN |SCENE;addSceneLines;%L%;13|
        ((|n| (%)) (|lines| (|List| (|List| PT))) (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (SPADCALL |lines| (QREFELT % 33)))
                    (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneShape;R%;14|
        ((|shape|
          (|Record| (|:| |shptype| (|Symbol|)) (|:| |centre| PT)
                    (|:| |size| PT) (|:| |fill| (|Boolean|))))
         (% (%)))
        (VECTOR 'SHAPE NIL (CONS 8 |shape|))) 

(SDEFUN |SCENE;addSceneShape;%R%;15|
        ((|n| (%))
         (|shape|
          (|Record| (|:| |shptype| (|Symbol|)) (|:| |centre| PT)
                    (|:| |size| PT) (|:| |fill| (|Boolean|))))
         (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (SPADCALL |shape| (QREFELT % 36)))
                    (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneShape;Sb%;16| ((|shape| (|SBoundary| PT)) (% (%)))
        (SPROG
         ((|sh|
           (|Record| (|:| |shptype| (|Symbol|)) (|:| |centre| PT)
                     (|:| |size| PT) (|:| |fill| (|Boolean|))))
          (|mn| (PT)) (|mx| (PT)))
         (SEQ (LETT |mx| (SPADCALL |shape| (QREFELT % 38)))
              (LETT |mn| (SPADCALL |shape| (QREFELT % 39)))
              (LETT |sh|
                    (VECTOR '|rect| |mn| (SPADCALL |mx| |mn| (QREFELT % 40))
                            NIL))
              (EXIT (VECTOR 'SHAPE NIL (CONS 8 |sh|)))))) 

(SDEFUN |SCENE;addSceneShape;%Sb%;17|
        ((|n| (%)) (|shape| (|SBoundary| PT)) (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (SPADCALL |shape| (QREFELT % 41)))
                    (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneDef;S2%;18| ((|nam| (|String|)) (|nde| (%)) (% (%)))
        (SPROG ((|nn| (|Record| (|:| |nme| (|String|)) (|:| |node| %))))
               (SEQ (LETT |nn| (CONS |nam| |nde|))
                    (EXIT (VECTOR 'DEF NIL (CONS 9 |nn|)))))) 

(SDEFUN |SCENE;addSceneDef;%S2%;19|
        ((|n| (%)) (|nam| (|String|)) (|nde| (%)) (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (SPADCALL |nam| |nde| (QREFELT % 44)))
                    (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneUse;S%;20| ((|nam| (|String|)) (% (%)))
        (SPROG ((|nn| (|Record| (|:| |nme| (|String|)) (|:| |node| %))))
               (SEQ
                (LETT |nn| (CONS |nam| (VECTOR 'GROUP NIL (CONS 11 "empty"))))
                (EXIT (VECTOR 'USE NIL (CONS 9 |nn|)))))) 

(SDEFUN |SCENE;addSceneUse;%S%;21| ((|n| (%)) (|nam| (|String|)) (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (SPADCALL |nam| (QREFELT % 46)))
                    (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneArrows;LSDf%;22|
        ((|lines| (|List| (|List| PT))) (|mode| (|Symbol|))
         (|size| (|DoubleFloat|)) (% (%)))
        (SPROG
         ((|ar|
           (|Record| (|:| |ln| (|List| (|List| PT))) (|:| |mode| (|Symbol|))
                     (|:| |size| (|DoubleFloat|)))))
         (SEQ (LETT |ar| (VECTOR |lines| |mode| |size|))
              (EXIT (VECTOR 'ARROWS NIL (CONS 6 |ar|)))))) 

(SDEFUN |SCENE;addSceneArrows;%LSDf%;23|
        ((|n| (%)) (|lines| (|List| (|List| PT))) (|mode| (|Symbol|))
         (|size| (|DoubleFloat|)) (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (SPADCALL |lines| |mode| |size| (QREFELT % 49)))
                    (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneArrow;2SPTSDf%;24|
        ((|st| (|String|)) (|en| (|String|)) (|offset| (PT))
         (|mode| (|Symbol|)) (|size| (|DoubleFloat|)) (% (%)))
        (SPROG
         ((|ar|
           (|Record| (|:| |st| (|String|)) (|:| |en| (|String|))
                     (|:| |offset| PT) (|:| |mode| (|Symbol|))
                     (|:| |size| (|DoubleFloat|)))))
         (SEQ (LETT |ar| (VECTOR |st| |en| |offset| |mode| |size|))
              (EXIT (VECTOR 'ARROW NIL (CONS 7 |ar|)))))) 

(SDEFUN |SCENE;addSceneArrow;%2SPTSDf%;25|
        ((|n| (%)) (|st| (|String|)) (|en| (|String|)) (|offset| (PT))
         (|mode| (|Symbol|)) (|size| (|DoubleFloat|)) (% (%)))
        (SPROG ((|c| (%)))
               (SEQ
                (LETT |c|
                      (SPADCALL |st| |en| |offset| |mode| |size|
                                (QREFELT % 51)))
                (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneArrow;2%PTS2Df%;26|
        ((|st| (%)) (|en| (%)) (|offset| (PT)) (|mode| (|Symbol|))
         (|size| (|DoubleFloat|)) (|fontScale| (|DoubleFloat|)) (% (%)))
        (SPROG
         ((|ar|
           (|Record| (|:| |ln| (|List| (|List| PT))) (|:| |mode| (|Symbol|))
                     (|:| |size| (|DoubleFloat|))))
          (|enPoint| (PT)) (|stPoint| (PT)) (|enBoundary| #1=(|SBoundary| PT))
          (|stBoundary| #1#))
         (SEQ (LETT |stBoundary| (SPADCALL |st| |fontScale| (QREFELT % 29)))
              (LETT |enBoundary| (SPADCALL |en| |fontScale| (QREFELT % 29)))
              (LETT |stPoint|
                    (SPADCALL |stBoundary|
                              (SPADCALL |enBoundary| (QREFELT % 30))
                              (QREFELT % 31)))
              (LETT |enPoint|
                    (SPADCALL |enBoundary|
                              (SPADCALL |stBoundary| (QREFELT % 30))
                              (QREFELT % 31)))
              (LETT |ar|
                    (VECTOR (LIST (LIST |stPoint| |enPoint|)) |mode| |size|))
              (EXIT (VECTOR 'ARROWS NIL (CONS 6 |ar|)))))) 

(SDEFUN |SCENE;addSceneArrow;3%PTS2Df%;27|
        ((|n| (%)) (|st| (%)) (|en| (%)) (|offset| (PT)) (|mode| (|Symbol|))
         (|size| (|DoubleFloat|)) (|fontScale| (|DoubleFloat|)) (% (%)))
        (SPROG ((|c| (%)))
               (SEQ
                (LETT |c|
                      (SPADCALL |st| |en| |offset| |mode| |size| |fontScale|
                                (QREFELT % 53)))
                (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneNamedPoints;Snp%;28|
        ((|np| (|SceneNamedPoints| PT)) (% (%)))
        (VECTOR 'NAMEDPOINTS NIL (CONS 10 |np|))) 

(SDEFUN |SCENE;addSceneNamedPoints;%Snp%;29|
        ((|n| (%)) (|np| (|SceneNamedPoints| PT)) (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (SPADCALL |np| (QREFELT % 56)))
                    (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneIFS;LL%;30|
        ((|inx1| (|List| (|List| (|NonNegativeInteger|)))) (|pts1| (|List| PT))
         (% (%)))
        (VECTOR 'IFS NIL (CONS 5 (CONS |inx1| |pts1|)))) 

(SDEFUN |SCENE;addSceneIFS;%LL%;31|
        ((|n| (%)) (|inx1| (|List| (|List| (|NonNegativeInteger|))))
         (|pts1| (|List| PT)) (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (SPADCALL |inx1| |pts1| (QREFELT % 59)))
                    (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneIFS;Sifs%;32| ((|in1| (|SceneIFS| PT)) (% (%)))
        (SPROG
         ((|pts1| (|List| PT))
          (|inx1| (|List| (|List| (|NonNegativeInteger|)))))
         (SEQ (LETT |inx1| (SPADCALL |in1| (QREFELT % 62)))
              (LETT |pts1| (SPADCALL |in1| (QREFELT % 63)))
              (EXIT (VECTOR 'IFS NIL (CONS 5 (CONS |inx1| |pts1|))))))) 

(SDEFUN |SCENE;addSceneIFS;%Sifs%;33|
        ((|n| (%)) (|in1| (|SceneIFS| PT)) (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (SPADCALL |in1| (QREFELT % 64)))
                    (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneBox;Df%;34| ((|size| (|DoubleFloat|)) (% (%)))
        (SPROG
         ((|inx| (|List| (|List| (|NonNegativeInteger|)))) (|pts| (|List| PT)))
         (SEQ
          (LETT |pts|
                (LIST
                 (SPADCALL |size| (|minus_DF| |size|) |size| (QREFELT % 66))
                 (SPADCALL |size| |size| |size| (QREFELT % 66))
                 (SPADCALL (|minus_DF| |size|) |size| |size| (QREFELT % 66))
                 (SPADCALL (|minus_DF| |size|) (|minus_DF| |size|) |size|
                           (QREFELT % 66))
                 (SPADCALL (|minus_DF| |size|) (|minus_DF| |size|)
                           (|minus_DF| |size|) (QREFELT % 66))
                 (SPADCALL (|minus_DF| |size|) |size| (|minus_DF| |size|)
                           (QREFELT % 66))
                 (SPADCALL |size| |size| (|minus_DF| |size|) (QREFELT % 66))
                 (SPADCALL |size| (|minus_DF| |size|) (|minus_DF| |size|)
                           (QREFELT % 66))))
          (LETT |inx|
                (LIST (LIST 0 1 2 3) (LIST 4 5 6 7) (LIST 7 6 1 0)
                      (LIST 3 2 5 4) (LIST 1 6 5 2) (LIST 3 4 7 0)))
          (EXIT (SPADCALL |inx| |pts| (QREFELT % 59)))))) 

(SDEFUN |SCENE;addSceneBox;%Df%;35|
        ((|n| (%)) (|size| (|DoubleFloat|)) (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (SPADCALL |size| (QREFELT % 67)))
                    (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneText;R%;36|
        ((|text|
          (|Record| (|:| |txt| (|String|)) (|:| |siz| (|NonNegativeInteger|))
                    (|:| |pos| PT) (|:| |np| (|List| (|String|)))))
         (% (%)))
        (VECTOR 'TEXT NIL (CONS 2 |text|))) 

(SDEFUN |SCENE;addSceneText;%R%;37|
        ((|n| (%))
         (|text|
          (|Record| (|:| |txt| (|String|)) (|:| |siz| (|NonNegativeInteger|))
                    (|:| |pos| PT) (|:| |np| (|List| (|String|)))))
         (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (SPADCALL |text| (QREFELT % 70)))
                    (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneText;SNniPT%;38|
        ((|str| (|String|)) (|sz| (|NonNegativeInteger|)) (|pz| (PT)) (% (%)))
        (SPROG
         ((|text|
           (|Record| (|:| |txt| (|String|)) (|:| |siz| (|NonNegativeInteger|))
                     (|:| |pos| PT) (|:| |np| (|List| (|String|))))))
         (SEQ (LETT |text| (VECTOR |str| |sz| |pz| NIL))
              (EXIT (VECTOR 'TEXT NIL (CONS 2 |text|)))))) 

(SDEFUN |SCENE;addSceneText;%SNniPT%;39|
        ((|n| (%)) (|str| (|String|)) (|sz| (|NonNegativeInteger|)) (|pz| (PT))
         (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (SPADCALL |str| |sz| |pz| (QREFELT % 73)))
                    (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneText;LNniPT%;40|
        ((|str| (|List| (|String|))) (|sz| (|NonNegativeInteger|)) (|pz| (PT))
         (% (%)))
        (SPROG
         ((|text|
           (|Record| (|:| |txt| (|String|)) (|:| |siz| (|NonNegativeInteger|))
                     (|:| |pos| PT) (|:| |np| (|List| (|String|))))))
         (SEQ (LETT |text| (VECTOR (|SPADfirst| |str|) |sz| |pz| |str|))
              (EXIT (VECTOR 'TEXT NIL (CONS 2 |text|)))))) 

(SDEFUN |SCENE;addSceneText;%LNniPT%;41|
        ((|n| (%)) (|str| (|List| (|String|))) (|sz| (|NonNegativeInteger|))
         (|pz| (PT)) (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (SPADCALL |str| |sz| |pz| (QREFELT % 76)))
                    (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneClip;Sb%;42| ((|bb| (|SBoundary| PT)) (% (%)))
        (VECTOR 'CLIP NIL (CONS 3 |bb|))) 

(SDEFUN |SCENE;addSceneClip;%Sb%;43|
        ((|n| (%)) (|bb| (|SBoundary| PT)) (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (SPADCALL |bb| (QREFELT % 78)))
                    (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneGrid;DfSb%;44|
        ((|stepSize| (|DoubleFloat|)) (|bb| (|SBoundary| PT)) (% (%)))
        (SPROG
         ((|ln| (%)) (#1=#:G641 NIL) (|i| NIL) (#2=#:G640 NIL) (|gp| (%))
          (|stepsy| (|NonNegativeInteger|)) (#3=#:G633 NIL)
          (|stepsx| (|NonNegativeInteger|)) (#4=#:G632 NIL)
          (|maxy| #5=(|DoubleFloat|)) (|maxx| #6=(|DoubleFloat|)) (|miny| #5#)
          (|minx| #6#))
         (SEQ
          (LETT |minx|
                (SPADCALL (SPADCALL |bb| (QREFELT % 39)) (QREFELT % 80)))
          (LETT |miny|
                (SPADCALL (SPADCALL |bb| (QREFELT % 39)) (QREFELT % 81)))
          (LETT |maxx|
                (SPADCALL (SPADCALL |bb| (QREFELT % 38)) (QREFELT % 80)))
          (LETT |maxy|
                (SPADCALL (SPADCALL |bb| (QREFELT % 38)) (QREFELT % 81)))
          (LETT |stepsx|
                (PROG1
                    (LETT #4#
                          (TRUNCATE
                           (|div_DF| (|sub_DF| |maxx| |minx|) |stepSize|)))
                  (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #4#)))
          (LETT |stepsy|
                (PROG1
                    (LETT #3#
                          (TRUNCATE
                           (|div_DF| (|sub_DF| |maxy| |miny|) |stepSize|)))
                  (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #3#)))
          (LETT |gp| (SPADCALL (QREFELT % 16)))
          (SEQ (LETT |i| 1) (LETT #2# |stepsx|) G190
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
                                   |miny| (QREFELT % 82))
                                  (SPADCALL
                                   (|add_DF| |minx|
                                             (|mul_DF|
                                              (FLOAT |i|
                                                     MOST-POSITIVE-DOUBLE-FLOAT)
                                              |stepSize|))
                                   |maxy| (QREFELT % 82)))
                                 (QREFELT % 22)))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |i| 1) (LETT #1# |stepsy|) G190
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
                                            (QREFELT % 82))
                                  (SPADCALL |maxx|
                                            (|add_DF| |miny|
                                                      (|mul_DF|
                                                       (FLOAT |i|
                                                              MOST-POSITIVE-DOUBLE-FLOAT)
                                                       |stepSize|))
                                            (QREFELT % 82)))
                                 (QREFELT % 22)))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT |gp|)))) 

(SDEFUN |SCENE;addSceneGrid;%DfSb%;45|
        ((|n| (%)) (|stepSize| (|DoubleFloat|)) (|bb| (|SBoundary| PT))
         (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (SPADCALL |stepSize| |bb| (QREFELT % 83)))
                    (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneGrid;Sb%;46| ((|bb| (|SBoundary| PT)) (% (%)))
        (SPROG
         ((|mt3| (%)) (|mt2| (%)) (|mt1| (%)) (|gp| (%))
          (|stepSize| (|DoubleFloat|)) (|maxx| #1=(|DoubleFloat|))
          (|minx| #1#))
         (SEQ
          (LETT |minx|
                (SPADCALL (SPADCALL |bb| (QREFELT % 39)) (QREFELT % 80)))
          (LETT |maxx|
                (SPADCALL (SPADCALL |bb| (QREFELT % 38)) (QREFELT % 80)))
          (LETT |stepSize| (|div_DF_I| (|sub_DF| |maxx| |minx|) 100))
          (LETT |gp| (SPADCALL (QREFELT % 16)))
          (LETT |mt1|
                (SPADCALL |gp| (VECTOR 1.0 "blue" "blue" (|mk_DF| 5 -1))
                          (QREFELT % 86)))
          (SPADCALL |mt1| |stepSize| |bb| (QREFELT % 84))
          (LETT |mt2|
                (SPADCALL |gp|
                          (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "blue"
                                  "blue" (|mk_DF| 5 -1))
                          (QREFELT % 86)))
          (SPADCALL |mt2|
                    (|mul_DF| |stepSize| (FLOAT 5 MOST-POSITIVE-DOUBLE-FLOAT))
                    |bb| (QREFELT % 84))
          (LETT |mt3|
                (SPADCALL |gp|
                          (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "red"
                                  "red" (|mk_DF| 5 -1))
                          (QREFELT % 86)))
          (SPADCALL |mt3|
                    (|mul_DF| |stepSize| (FLOAT 10 MOST-POSITIVE-DOUBLE-FLOAT))
                    |bb| (QREFELT % 84))
          (EXIT |gp|)))) 

(SDEFUN |SCENE;addSceneGrid;%Sb%;47|
        ((|n| (%)) (|bb| (|SBoundary| PT)) (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (SPADCALL |bb| (QREFELT % 87)))
                    (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createScenePattern1|
        ((|step| (|NonNegativeInteger|)) (|bb| (|SBoundary| PT)) (% (%)))
        (SPROG
         ((|ln| (%)) (|pts| (|List| PT)) (#1=#:G667 NIL) (|j| NIL)
          (#2=#:G666 NIL) (#3=#:G665 NIL) (|i| NIL) (|mt2| (%)) (#4=#:G664 NIL)
          (#5=#:G663 NIL) (#6=#:G662 NIL) (|mt1| (%)) (|gp| (%))
          (|stepSize| (|DoubleFloat|)) (|maxx| #7=(|DoubleFloat|))
          (|miny| (|DoubleFloat|)) (|minx| #7#))
         (SEQ
          (LETT |minx|
                (SPADCALL (SPADCALL |bb| (QREFELT % 39)) (QREFELT % 80)))
          (LETT |miny|
                (SPADCALL (SPADCALL |bb| (QREFELT % 39)) (QREFELT % 81)))
          (LETT |maxx|
                (SPADCALL (SPADCALL |bb| (QREFELT % 38)) (QREFELT % 80)))
          (LETT |stepSize| (|div_DF_I| (|sub_DF| |maxx| |minx|) 1200))
          (LETT |gp| (SPADCALL (QREFELT % 16)))
          (LETT |mt1|
                (SPADCALL |gp|
                          (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "blue"
                                  "blue" (|mk_DF| 5 -1))
                          (QREFELT % 86)))
          (SEQ (LETT |i| 1) (LETT #6# |step|) G190
               (COND
                ((IF (|negative?_SI| #6#)
                     (|less_SI| |i| 1200)
                     (|greater_SI| |i| 1200))
                 (GO G191)))
               (SEQ
                (LETT |pts|
                      (PROGN
                       (LETT #5# NIL)
                       (SEQ (LETT |j| 1) (LETT #4# |step|) G190
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
                                      (QREFELT % 82))
                                     #5#))))
                            (LETT |j| (|add_SI| |j| #4#)) (GO G190) G191
                            (EXIT (NREVERSE #5#)))))
                (EXIT (LETT |ln| (SPADCALL |mt1| |pts| (QREFELT % 22)))))
               (LETT |i| (|add_SI| |i| #6#)) (GO G190) G191 (EXIT NIL))
          (LETT |mt2|
                (SPADCALL |gp|
                          (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "red"
                                  "red" (|mk_DF| 5 -1))
                          (QREFELT % 86)))
          (SEQ (LETT |i| 1) (LETT #3# |step|) G190
               (COND
                ((IF (|negative?_SI| #3#)
                     (|less_SI| |i| 1000)
                     (|greater_SI| |i| 1000))
                 (GO G191)))
               (SEQ
                (LETT |pts|
                      (PROGN
                       (LETT #2# NIL)
                       (SEQ (LETT |j| 1) (LETT #1# |step|) G190
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
                                      (QREFELT % 82))
                                     #2#))))
                            (LETT |j| (|add_SI| |j| #1#)) (GO G190) G191
                            (EXIT (NREVERSE #2#)))))
                (EXIT (LETT |ln| (SPADCALL |mt2| |pts| (QREFELT % 22)))))
               (LETT |i| (|add_SI| |i| #3#)) (GO G190) G191 (EXIT NIL))
          (EXIT |gp|)))) 

(SDEFUN |SCENE;createScenePattern2|
        ((|level| (|NonNegativeInteger|)) (|bb| (|SBoundary| PT)) (% (%)))
        (SPROG
         ((|ifs2| (|SceneIFS| PT)) (|ifs| (|SceneIFS| PT))
          (|face1| (|List| PT)) (|midx| (|DoubleFloat|))
          (|maxy| #1=(|DoubleFloat|)) (|maxx| #2=(|DoubleFloat|)) (|miny| #1#)
          (|minx| #2#))
         (SEQ
          (LETT |minx|
                (SPADCALL (SPADCALL |bb| (QREFELT % 39)) (QREFELT % 80)))
          (LETT |miny|
                (SPADCALL (SPADCALL |bb| (QREFELT % 39)) (QREFELT % 81)))
          (LETT |maxx|
                (SPADCALL (SPADCALL |bb| (QREFELT % 38)) (QREFELT % 80)))
          (LETT |maxy|
                (SPADCALL (SPADCALL |bb| (QREFELT % 38)) (QREFELT % 81)))
          (LETT |midx| (|mul_DF| (|add_DF| |minx| |maxx|) (|mk_DF| 5 -1)))
          (LETT |face1|
                (LIST (SPADCALL |midx| |miny| (QREFELT % 82))
                      (SPADCALL |minx| |maxy| (QREFELT % 82))
                      (SPADCALL |maxx| |maxy| (QREFELT % 82))))
          (LETT |ifs| (SPADCALL |face1| (QREFELT % 89)))
          (LETT |ifs2| (SPADCALL |ifs| |level| (QREFELT % 90)))
          (EXIT
           (SPADCALL (SPADCALL |ifs2| (QREFELT % 62))
                     (SPADCALL |ifs2| (QREFELT % 63)) (QREFELT % 59)))))) 

(SDEFUN |SCENE;subdivideLine|
        ((|level| (|NonNegativeInteger|)) (|inLine| (|List| PT))
         (% (|List| PT)))
        (SPROG
         ((#1=#:G675 NIL) (|res| (|List| PT)) (|lastPt| (PT)) (|midpt| (PT))
          (#2=#:G678 NIL) (|x| NIL))
         (SEQ
          (COND ((EQL |level| 0) |inLine|)
                ('T
                 (SEQ (LETT |res| NIL)
                      (SEQ (LETT |x| 1) (LETT #2# (LENGTH |inLine|)) G190
                           (COND ((|greater_SI| |x| #2#) (GO G191)))
                           (SEQ
                            (COND
                             ((SPADCALL |x| 1 (QREFELT % 91))
                              (SEQ
                               (LETT |midpt|
                                     (SPADCALL (|mk_DF| 5 -1)
                                               (SPADCALL |lastPt|
                                                         (SPADCALL |inLine| |x|
                                                                   (QREFELT %
                                                                            92))
                                                         (QREFELT % 93))
                                               (QREFELT % 94)))
                               (EXIT
                                (LETT |res|
                                      (SPADCALL |res| |midpt|
                                                (QREFELT % 95)))))))
                            (LETT |lastPt|
                                  (SPADCALL |inLine| |x| (QREFELT % 92)))
                            (EXIT
                             (LETT |res|
                                   (SPADCALL |res|
                                             (SPADCALL |inLine| |x|
                                                       (QREFELT % 92))
                                             (QREFELT % 95)))))
                           (LETT |x| (|inc_SI| |x|)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (|SCENE;subdivideLine|
                        (PROG1 (LETT #1# (- |level| 1))
                          (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #1#))
                        |res| %)))))))) 

(SDEFUN |SCENE;createScenePattern3|
        ((|level| #1=(|NonNegativeInteger|)) (|bb| (|SBoundary| PT)) (% (%)))
        (SPROG
         ((|ln| (%)) (|lev2| #1#) (|pts2| (|List| (|List| PT))) (#2=#:G693 NIL)
          (|l2| NIL) (|pts| (|List| (|List| PT))) (#3=#:G692 NIL) (|j| NIL)
          (#4=#:G691 NIL) (#5=#:G690 NIL) (|i| NIL) (#6=#:G689 NIL)
          (|ycoords| (|List| (|List| #7=(|NonNegativeInteger|))))
          (|xcoords| (|List| (|List| #7#))) (|scale| (|DoubleFloat|))
          (|maxx| #8=(|DoubleFloat|)) (|miny| (|DoubleFloat|)) (|minx| #8#))
         (SEQ
          (LETT |minx|
                (SPADCALL (SPADCALL |bb| (QREFELT % 39)) (QREFELT % 80)))
          (LETT |miny|
                (SPADCALL (SPADCALL |bb| (QREFELT % 39)) (QREFELT % 81)))
          (LETT |maxx|
                (SPADCALL (SPADCALL |bb| (QREFELT % 38)) (QREFELT % 80)))
          (LETT |scale| (|div_DF_I| (|sub_DF| |maxx| |minx|) 1000))
          (LETT |xcoords|
                (LIST (LIST 0 0 500 1000 1000 0) (LIST 150 350 350 150 150)
                      (LIST 100 400 400 100 100) (LIST 600 900 900 600 600)
                      (LIST 600 900 900 600 600)))
          (LETT |ycoords|
                (LIST (LIST 0 800 1000 800 0 0) (LIST 0 0 300 300 0)
                      (LIST 500 500 700 700 500) (LIST 500 500 700 700 500)
                      (LIST 100 100 300 300 100)))
          (LETT |pts|
                (PROGN
                 (LETT #6# NIL)
                 (SEQ (LETT |i| 1) (LETT #5# (LENGTH |xcoords|)) G190
                      (COND ((|greater_SI| |i| #5#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6#
                              (CONS
                               (PROGN
                                (LETT #4# NIL)
                                (SEQ (LETT |j| 1)
                                     (LETT #3#
                                           (SPADCALL
                                            (SPADCALL |xcoords| |i|
                                                      (QREFELT % 97))
                                            (QREFELT % 98)))
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
                                                                       % 97))
                                                            |j| (QREFELT % 99))
                                                           MOST-POSITIVE-DOUBLE-FLOAT)
                                                          |scale|))
                                               (|add_DF| |miny|
                                                         (|mul_DF|
                                                          (FLOAT
                                                           (SPADCALL
                                                            (SPADCALL |ycoords|
                                                                      |i|
                                                                      (QREFELT
                                                                       % 97))
                                                            |j| (QREFELT % 99))
                                                           MOST-POSITIVE-DOUBLE-FLOAT)
                                                          |scale|))
                                               (QREFELT % 82))
                                              #4#))))
                                     (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                     (EXIT (NREVERSE #4#))))
                               #6#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #6#)))))
          (LETT |pts2| NIL) (LETT |lev2| |level|)
          (SEQ (LETT |l2| NIL) (LETT #2# |pts|) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |l2| (CAR #2#)) NIL)) (GO G191)))
               (SEQ
                (LETT |pts2|
                      (SPADCALL |pts2| (|SCENE;subdivideLine| |lev2| |l2| %)
                                (QREFELT % 100)))
                (EXIT (COND ((EQL |lev2| |level|) (LETT |lev2| 2)))))
               (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
          (EXIT (LETT |ln| (SPADCALL |pts2| (QREFELT % 33))))))) 

(SDEFUN |SCENE;createScenePattern;SNniSb%;52|
        ((|ptype| (|Symbol|)) (|step| (|NonNegativeInteger|))
         (|bb| (|SBoundary| PT)) (% (%)))
        (SPROG ((#1=#:G696 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((EQUAL |ptype| 'GRID)
                    (PROGN
                     (LETT #1# (|SCENE;createScenePattern1| |step| |bb| %))
                     (GO #2=#:G695))))
                  (COND
                   ((EQUAL |ptype| 'SIERPINSKI)
                    (PROGN
                     (LETT #1# (|SCENE;createScenePattern2| |step| |bb| %))
                     (GO #2#))))
                  (EXIT (|SCENE;createScenePattern3| |step| |bb| %))))
                #2# (EXIT #1#)))) 

(SDEFUN |SCENE;addScenePattern;%SNniSb%;53|
        ((|n| (%)) (|ptype| (|Symbol|)) (|step| (|NonNegativeInteger|))
         (|bb| (|SBoundary| PT)) (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (SPADCALL |ptype| |step| |bb| (QREFELT % 101)))
                    (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneRuler;SPTSb%;54|
        ((|ptype| (|Symbol|)) (|offset| (PT)) (|bb| (|SBoundary| PT)) (% (%)))
        (SPROG
         ((|str| (|String|))
          (|d|
           (|Record| (|:| |quotient| (|Integer|))
                     (|:| |remainder| (|Integer|))))
          (|pz| (PT)) (#1=#:G722 NIL) (#2=#:G723 NIL) (|x| NIL)
          (|stepI| (|Integer|)) (|gp| (%)) (|suffix| (|String|))
          (|zeroes| #3=(|Integer|)) (|maxPrimaryNorm| #4=(|DoubleFloat|))
          (|minPrimaryNorm| #4#) (|divn| (|DoubleFloat|)) (|expStep| #3#)
          (|stepSize| (|DoubleFloat|)) (|maxSecondary| (|DoubleFloat|))
          (|maxPrimary| #5=(|DoubleFloat|)) (|minPrimary| #5#))
         (SEQ
          (LETT |minPrimary|
                (SPADCALL (SPADCALL |bb| (QREFELT % 39)) (QREFELT % 80)))
          (LETT |maxPrimary|
                (SPADCALL (SPADCALL |bb| (QREFELT % 38)) (QREFELT % 80)))
          (LETT |maxSecondary|
                (SPADCALL (SPADCALL |bb| (QREFELT % 38)) (QREFELT % 81)))
          (COND
           ((EQUAL |ptype| 'VERTICAL)
            (SEQ
             (LETT |minPrimary|
                   (SPADCALL (SPADCALL |bb| (QREFELT % 39)) (QREFELT % 81)))
             (LETT |maxPrimary|
                   (SPADCALL (SPADCALL |bb| (QREFELT % 38)) (QREFELT % 81)))
             (EXIT
              (LETT |maxSecondary|
                    (SPADCALL (SPADCALL |bb| (QREFELT % 38))
                              (QREFELT % 80)))))))
          (LETT |stepSize| (|sub_DF| |maxPrimary| |minPrimary|))
          (LETT |expStep|
                (-
                 (TRUNCATE
                  (SPADCALL (|add_DF| |stepSize| 1.0) (QREFELT % 103)))
                 1))
          (LETT |divn|
                (|expt_DF_I| (FLOAT 10 MOST-POSITIVE-DOUBLE-FLOAT) |expStep|))
          (LETT |minPrimaryNorm| (|div_DF| |minPrimary| |divn|))
          (LETT |maxPrimaryNorm| (|div_DF| |maxPrimary| |divn|))
          (LETT |suffix| "") (LETT |zeroes| |expStep|)
          (COND
           ((> |zeroes| 2)
            (SEQ (LETT |zeroes| (- |zeroes| 3)) (LETT |suffix| "K")
                 (EXIT
                  (COND
                   ((> |zeroes| 2)
                    (SEQ (LETT |zeroes| (- |zeroes| 3)) (LETT |suffix| "M")
                         (EXIT
                          (COND
                           ((> |zeroes| 2)
                            (SEQ (LETT |zeroes| (- |zeroes| 3))
                                 (LETT |suffix| "G")
                                 (EXIT
                                  (COND
                                   ((> |zeroes| 2)
                                    (SEQ (LETT |zeroes| (- |zeroes| 3))
                                         (EXIT
                                          (LETT |suffix| "T")))))))))))))))))
          (COND
           ((< |zeroes| 0)
            (SEQ (LETT |zeroes| (+ |zeroes| 3)) (LETT |suffix| "m")
                 (EXIT
                  (COND
                   ((< |zeroes| 0)
                    (SEQ (LETT |zeroes| (+ |zeroes| 3)) (LETT |suffix| "u")
                         (EXIT
                          (COND
                           ((< |zeroes| 0)
                            (SEQ (LETT |zeroes| (+ |zeroes| 3))
                                 (LETT |suffix| "n")
                                 (EXIT
                                  (COND
                                   ((< |zeroes| 0)
                                    (SEQ (LETT |zeroes| (+ |zeroes| 3))
                                         (EXIT
                                          (LETT |suffix| "p")))))))))))))))))
          (COND ((> |zeroes| 0) (LETT |suffix| (STRCONC "0" |suffix|))))
          (COND ((> |zeroes| 1) (LETT |suffix| (STRCONC "0" |suffix|))))
          (LETT |gp| (SPADCALL (QREFELT % 16)))
          (LETT |stepI| (COND ((EQUAL |ptype| 'HORIZONTAL) 2) ('T 1)))
          (SEQ (LETT |x| (TRUNCATE |minPrimaryNorm|))
               (LETT #2# (TRUNCATE |maxPrimaryNorm|)) (LETT #1# |stepI|) G190
               (COND
                ((IF (MINUSP #1#)
                     (< |x| #2#)
                     (> |x| #2#))
                 (GO G191)))
               (SEQ (LETT |str| (|mathObject2String| |x|))
                    (LETT |pz|
                          (SPADCALL
                           (SPADCALL
                            (|mul_DF| (FLOAT |x| MOST-POSITIVE-DOUBLE-FLOAT)
                                      |divn|)
                            0.0 (QREFELT % 82))
                           |offset| (QREFELT % 93)))
                    (COND
                     ((EQUAL |ptype| 'VERTICAL)
                      (LETT |pz|
                            (SPADCALL
                             (SPADCALL 0.0
                                       (|mul_DF|
                                        (FLOAT |x| MOST-POSITIVE-DOUBLE-FLOAT)
                                        |divn|)
                                       (QREFELT % 82))
                             |offset| (QREFELT % 93)))))
                    (COND
                     ((EQL |expStep| -1)
                      (SEQ
                       (COND
                        ((> |x| 0)
                         (COND
                          ((< |x| 10) (LETT |str| (STRCONC "0." |str|))))))
                       (COND ((EQL |x| 10) (LETT |str| "1")))
                       (COND
                        ((> |x| 10)
                         (SEQ (LETT |d| (DIVIDE2 |x| 10))
                              (EXIT
                               (LETT |str|
                                     (SPADCALL
                                      (LIST (STRINGIMAGE (QCAR |d|)) "."
                                            (STRINGIMAGE (QCDR |d|)))
                                      (QREFELT % 105)))))))
                       (COND
                        ((< |x| 0)
                         (COND
                          ((> |x| -10)
                           (LETT |str|
                                 (SPADCALL
                                  (LIST "-0." (|mathObject2String| (- |x|)))
                                  (QREFELT % 105)))))))
                       (COND ((EQL |x| -10) (LETT |str| "-1")))
                       (EXIT
                        (COND
                         ((< |x| -10)
                          (SEQ (LETT |d| (DIVIDE2 (- |x|) 10))
                               (EXIT
                                (LETT |str|
                                      (SPADCALL
                                       (LIST "-" (STRINGIMAGE (QCAR |d|)) "."
                                             (STRINGIMAGE (QCDR |d|)))
                                       (QREFELT % 105))))))))))
                     ((SPADCALL |x| 0 (QREFELT % 106))
                      (LETT |str| (STRCONC |str| |suffix|))))
                    (EXIT (SPADCALL |gp| |str| 10 |pz| (QREFELT % 74))))
               (LETT |x| (+ |x| #1#)) (GO G190) G191 (EXIT NIL))
          (EXIT |gp|)))) 

(SDEFUN |SCENE;addSceneRuler;%SPTSb%;55|
        ((|n| (%)) (|ptype| (|Symbol|)) (|offset| (PT)) (|bb| (|SBoundary| PT))
         (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (SPADCALL |ptype| |offset| |bb| (QREFELT % 107)))
                    (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneGraph;Dg2NniB%;56|
        ((|g| (|DirectedGraph| (|String|))) (|x| (|NonNegativeInteger|))
         (|y| (|NonNegativeInteger|)) (|dispArrowName| (|Boolean|)) (% (%)))
        (SPROG ((|tr| (|Scene| (|SCartesian| 2))))
               (SEQ
                (LETT |tr|
                      (SPADCALL
                       (SPADCALL (FLOAT |x| MOST-POSITIVE-DOUBLE-FLOAT)
                                 (FLOAT |y| MOST-POSITIVE-DOUBLE-FLOAT) 0.0
                                 (|mk_DF| 25 -2) (|mk_DF| 25 -2)
                                 (|mk_DF| 25 -2) (QREFELT % 110))
                       (QREFELT % 112)))
                (SPADCALL |tr| |g| |dispArrowName| NIL (QREFELT % 114))
                (EXIT |tr|)))) 

(SDEFUN |SCENE;addSceneGraph;%Dg2NniB%;57|
        ((|n| (%)) (|g| (|DirectedGraph| (|String|)))
         (|x| (|NonNegativeInteger|)) (|y| (|NonNegativeInteger|))
         (|dispArrowName| (|Boolean|)) (% (%)))
        (SPROG ((|c| (%)))
               (SEQ
                (LETT |c|
                      (SPADCALL |g| |x| |y| |dispArrowName| (QREFELT % 115)))
                (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneMaterial;R%;58|
        ((|mat|
          (|Record| (|:| |lineWidth| (|DoubleFloat|))
                    (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
                    (|:| |matOpacity| (|DoubleFloat|))))
         (% (%)))
        (VECTOR 'MATERIAL NIL (CONS 1 |mat|))) 

(SDEFUN |SCENE;addSceneMaterial;%R%;59|
        ((|n| (%))
         (|mat|
          (|Record| (|:| |lineWidth| (|DoubleFloat|))
                    (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
                    (|:| |matOpacity| (|DoubleFloat|))))
         (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (SPADCALL |mat| (QREFELT % 117)))
                    (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneMaterial;Df2S%;60|
        ((|lineW| (|DoubleFloat|)) (|lineC| (|String|)) (|fillC| (|String|))
         (% (%)))
        (SPROG
         ((|mat|
           (|Record| (|:| |lineWidth| (|DoubleFloat|))
                     (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
                     (|:| |matOpacity| (|DoubleFloat|)))))
         (SEQ (LETT |mat| (VECTOR |lineW| |lineC| |fillC| 1.0))
              (EXIT (VECTOR 'MATERIAL NIL (CONS 1 |mat|)))))) 

(SDEFUN |SCENE;addSceneMaterial;%Df2S%;61|
        ((|n| (%)) (|lineW| (|DoubleFloat|)) (|lineC| (|String|))
         (|fillC| (|String|)) (% (%)))
        (SPROG ((|c| (%)))
               (SEQ
                (LETT |c| (SPADCALL |lineW| |lineC| |fillC| (QREFELT % 118)))
                (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneTransform;St%;62|
        ((|tran| (|STransform| PT)) (% (%)))
        (VECTOR 'TRANSFORM NIL (CONS 4 |tran|))) 

(SDEFUN |SCENE;addSceneTransform;%St%;63|
        ((|n| (%)) (|tran| (|STransform| PT)) (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (SPADCALL |tran| (QREFELT % 121)))
                    (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createArrows2Din2D;M2SNni%;64|
        ((|ptFun| (|Mapping| PT PT)) (|uSeg| (|Segment| (|DoubleFloat|)))
         (|vSeg| (|Segment| (|DoubleFloat|))) (|numPts| (|NonNegativeInteger|))
         (% (%)))
        (SPROG
         ((|someV| #1=(|DoubleFloat|)) (|arrows| (|List| (|List| PT)))
          (|someU| #1#) (|lp| (|List| PT)) (|outpt| (PT)) (|inPt| (PT))
          (|iu| NIL) (|iv| NIL) (|vstep| #2=(|DoubleFloat|)) (|ustep| #2#))
         (SEQ (LETT |arrows| NIL)
              (LETT |ustep|
                    (|div_DF_I|
                     (|sub_DF| (SPADCALL |uSeg| (QREFELT % 124))
                               (SPADCALL |uSeg| (QREFELT % 125)))
                     |numPts|))
              (LETT |vstep|
                    (|div_DF_I|
                     (|sub_DF| (SPADCALL |vSeg| (QREFELT % 124))
                               (SPADCALL |vSeg| (QREFELT % 125)))
                     |numPts|))
              (LETT |someV| (SPADCALL |vSeg| (QREFELT % 125)))
              (SEQ (LETT |iv| |numPts|) G190 (COND ((< |iv| 0) (GO G191)))
                   (SEQ
                    (COND
                     ((ZEROP |iv|)
                      (LETT |someV| (SPADCALL |vSeg| (QREFELT % 124)))))
                    (LETT |lp| NIL)
                    (LETT |someU| (SPADCALL |uSeg| (QREFELT % 125)))
                    (SEQ (LETT |iu| |numPts|) G190
                         (COND ((< |iu| 0) (GO G191)))
                         (SEQ
                          (COND
                           ((ZEROP |iu|)
                            (LETT |someU| (SPADCALL |uSeg| (QREFELT % 124)))))
                          (LETT |inPt|
                                (SPADCALL |someU| |someV| (QREFELT % 82)))
                          (LETT |outpt| (SPADCALL |inPt| |ptFun|))
                          (LETT |lp| (LIST |inPt| |outpt|))
                          (LETT |someU| (|add_DF| |someU| |ustep|))
                          (EXIT (LETT |arrows| (CONS |lp| |arrows|))))
                         (LETT |iu| (+ |iu| -1)) (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |someV| (|add_DF| |someV| |vstep|))))
                   (LETT |iv| (+ |iv| -1)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL |arrows| '|variable| (|mk_DF| 5 -1) (QREFELT % 49)))))) 

(SDEFUN |SCENE;addArrows2Din2D;%M2SNni%;65|
        ((|n| (%)) (|ptFun| (|Mapping| PT PT))
         (|uSeg| (|Segment| (|DoubleFloat|)))
         (|vSeg| (|Segment| (|DoubleFloat|))) (|numPts| (|NonNegativeInteger|))
         (% (%)))
        (SPROG ((|c| (%)))
               (SEQ
                (LETT |c|
                      (SPADCALL |ptFun| |uSeg| |vSeg| |numPts|
                                (QREFELT % 127)))
                (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;addChild!;2%V;66| ((|n| (%)) (|c| (%)) (% (|Void|)))
        (QSETVELT |n| 1 (SPADCALL (QVELT |n| 1) |c| (QREFELT % 130)))) 

(PUT '|SCENE;removeChild!;2%V;67| '|SPADreplace|
     '(XLAM (|n| |c|) (|error| "removeChild! not yet implemented"))) 

(SDEFUN |SCENE;removeChild!;2%V;67| ((|n| (%)) (|c| (%)) (% (|Void|)))
        (|error| "removeChild! not yet implemented")) 

(SDEFUN |SCENE;setTransform!;%StV;68|
        ((|n| (%)) (|tran| (|STransform| PT)) (% (|Void|)))
        (COND
         ((SPADCALL (QVELT |n| 0) 'TRANSFORM (QREFELT % 132))
          (|error| "use setTransform! on transform only"))
         ('T (QSETVELT |n| 2 (CONS 4 |tran|))))) 

(SDEFUN |SCENE;pathString|
        ((|pts| (|List| (|List| PT))) (|tran| (|STransform| PT))
         (|bb| (|SBoundary| PT)) (|sc| (|DoubleFloat|)) (|clipEn| (|Boolean|))
         (|useInteger| (|Boolean|)) (% (|String|)))
        (SPROG
         ((|lastValid| #1=(|Boolean|)) (|ptStr| (|String|))
          (|thisStr| (|String|)) (|minusy| (|DoubleFloat|))
          (|pntNum| (|NonNegativeInteger|)) (|valid| #1#) (|param2| (PT))
          (#2=#:G850 NIL) (|param| NIL) (#3=#:G849 NIL) (|line| NIL))
         (SEQ (LETT |ptStr| "") (LETT |lastValid| 'T)
              (SEQ (LETT |line| NIL) (LETT #3# |pts|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |line| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |pntNum| 0)
                        (EXIT
                         (SEQ (LETT |param| NIL) (LETT #2# |line|) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |param| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (LETT |param2|
                                     (SPADCALL |tran| |param| (QREFELT % 134)))
                               (LETT |valid|
                                     (COND
                                      (|clipEn|
                                       (SPADCALL |bb| |param| (QREFELT % 135)))
                                      ('T 'T)))
                               (COND
                                (|valid|
                                 (SEQ (LETT |pntNum| (+ |pntNum| 1))
                                      (COND
                                       ((SPADCALL |ptStr| "" (QREFELT % 136))
                                        (LETT |ptStr| (STRCONC |ptStr| " "))))
                                      (COND
                                       (|lastValid|
                                        (SEQ
                                         (COND
                                          ((EQL |pntNum| 1)
                                           (LETT |ptStr|
                                                 (STRCONC |ptStr| "M"))))
                                         (EXIT
                                          (COND
                                           ((EQL |pntNum| 2)
                                            (LETT |ptStr|
                                                  (STRCONC |ptStr| "L"))))))))
                                      (COND
                                       ((NULL |lastValid|)
                                        (LETT |ptStr| (STRCONC |ptStr| "M"))))
                                      (LETT |minusy|
                                            (|minus_DF|
                                             (|mul_DF|
                                              (SPADCALL |param2|
                                                        (QREFELT % 81))
                                              |sc|)))
                                      (COND
                                       (|useInteger|
                                        (LETT |thisStr|
                                              (SPADCALL
                                               (LIST
                                                (STRINGIMAGE
                                                 (TRUNCATE
                                                  (|mul_DF|
                                                   (SPADCALL |param2|
                                                             (QREFELT % 80))
                                                   |sc|)))
                                                ","
                                                (STRINGIMAGE
                                                 (TRUNCATE |minusy|)))
                                               (QREFELT % 105))))
                                       ('T
                                        (LETT |thisStr|
                                              (SPADCALL
                                               (LIST
                                                (|mathObject2String|
                                                 (|mul_DF|
                                                  (SPADCALL |param2|
                                                            (QREFELT % 80))
                                                  |sc|))
                                                ","
                                                (|mathObject2String| |minusy|))
                                               (QREFELT % 105)))))
                                      (EXIT
                                       (LETT |ptStr|
                                             (STRCONC |ptStr| |thisStr|))))))
                               (EXIT (LETT |lastValid| |valid|)))
                              (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT |ptStr|)))) 

(SDEFUN |SCENE;shorternArrow|
        ((|pts| (|Record| (|:| |st| PT) (|:| |en| PT))) (|bb| (|SBoundary| PT))
         (% (|Record| (|:| |st| PT) (|:| |en| PT))))
        (SPROG
         ((|newend| (PT)) (|newstart| (PT)) (|relpt| (PT)) (#1=#:G856 NIL)
          (|reductionFactor| (|DoubleFloat|)) (|arrLength| (|DoubleFloat|))
          (|endpt| (PT)) (|startpt| (PT)) (|totalwidth| (|DoubleFloat|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |totalwidth|
                  (SPADCALL
                   (SPADCALL (SPADCALL |bb| (QREFELT % 38))
                             (SPADCALL |bb| (QREFELT % 39)) (QREFELT % 40))
                   (QREFELT % 80)))
            (LETT |startpt| (QCAR |pts|)) (LETT |endpt| (QCDR |pts|))
            (LETT |arrLength| (SPADCALL |startpt| |endpt| (QREFELT % 137)))
            (COND
             ((|less_DF| |arrLength| (|mk_DF| 1 -1))
              (PROGN (LETT #1# |pts|) (GO #2=#:G855))))
            (LETT |reductionFactor|
                  (|div_DF| |totalwidth|
                            (|mul_DF| (|mk_DF| 40 0) |arrLength|)))
            (COND
             ((SPADCALL |reductionFactor| (|mk_DF| 4 -1) (QREFELT % 138))
              (PROGN (LETT #1# |pts|) (GO #2#))))
            (LETT |relpt| (SPADCALL |endpt| |startpt| (QREFELT % 40)))
            (LETT |newstart|
                  (SPADCALL |startpt|
                            (SPADCALL |reductionFactor| |relpt| (QREFELT % 94))
                            (QREFELT % 93)))
            (LETT |newend|
                  (SPADCALL |startpt|
                            (SPADCALL
                             (|sub_DF| (|mk_DF| 1 0) |reductionFactor|) |relpt|
                             (QREFELT % 94))
                            (QREFELT % 93)))
            (EXIT (CONS |newstart| |newend|))))
          #2# (EXIT #1#)))) 

(SDEFUN |SCENE;lineArrow|
        ((|pts| (|List| (|List| PT))) (|tran| (|STransform| PT))
         (|bb| (|SBoundary| PT))
         (|mat|
          (|Record| (|:| |lineWidth| (|DoubleFloat|))
                    (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
                    (|:| |matOpacity| (|DoubleFloat|))))
         (|sc| (|DoubleFloat|)) (|clipEn| (|Boolean|)) (|mode| (|Symbol|))
         (|size| (|DoubleFloat|)) (% (|List| (|XmlElement|))))
        (SPROG
         ((|nodeEles| (|List| (|XmlElement|))) (|x| (|XmlElement|))
          (|nodeAtts| (|List| (|XmlAttribute|))) (|linWidth| (|DoubleFloat|))
          (|ptStr| (|String|)) (|thisStr| (|String|))
          (|minusEndy| #1=(|DoubleFloat|)) (|endPoint| (PT))
          (|minusStarty| #1#) (|aline| (|Record| (|:| |st| PT) (|:| |en| PT)))
          (|startPoint| (PT)) (|pntNum| (|NonNegativeInteger|))
          (|valid| (|Boolean|)) (|param2| (PT)) (#2=#:G875 NIL) (|param| NIL)
          (#3=#:G874 NIL) (|line| NIL))
         (SEQ (LETT |nodeEles| NIL)
              (SEQ (LETT |line| NIL) (LETT #3# |pts|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |line| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |pntNum| 0) (LETT |ptStr| "")
                        (LETT |startPoint| (SPADCALL 0 0 (QREFELT % 11)))
                        (LETT |endPoint| (SPADCALL 0 0 (QREFELT % 11)))
                        (SEQ (LETT |param| NIL) (LETT #2# |line|) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |param| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |param2|
                                    (SPADCALL |tran| |param| (QREFELT % 134)))
                              (LETT |valid|
                                    (COND
                                     (|clipEn|
                                      (SPADCALL |bb| |param| (QREFELT % 135)))
                                     ('T 'T)))
                              (EXIT
                               (COND
                                (|valid|
                                 (SEQ (LETT |pntNum| (+ |pntNum| 1))
                                      (COND
                                       ((SPADCALL |ptStr| "" (QREFELT % 136))
                                        (LETT |ptStr| (STRCONC |ptStr| " "))))
                                      (COND
                                       ((EQL |pntNum| 1)
                                        (SEQ
                                         (LETT |ptStr| (STRCONC |ptStr| "M"))
                                         (EXIT (LETT |startPoint| |param2|)))))
                                      (COND
                                       ((EQL |pntNum| 2)
                                        (SEQ (LETT |endPoint| |param2|)
                                             (LETT |aline|
                                                   (CONS |startPoint|
                                                         |endPoint|))
                                             (COND
                                              ((EQUAL |mode| '|proportional|)
                                               (LETT |aline|
                                                     (|SCENE;shorternArrow|
                                                      (CONS |startPoint|
                                                            |endPoint|)
                                                      |bb| %))))
                                             (LETT |minusStarty|
                                                   (|minus_DF|
                                                    (|mul_DF|
                                                     (SPADCALL (QCAR |aline|)
                                                               (QREFELT % 81))
                                                     |sc|)))
                                             (LETT |minusEndy|
                                                   (|minus_DF|
                                                    (|mul_DF|
                                                     (SPADCALL (QCDR |aline|)
                                                               (QREFELT % 81))
                                                     |sc|)))
                                             (LETT |thisStr|
                                                   (SPADCALL
                                                    (LIST
                                                     (|mathObject2String|
                                                      (|mul_DF|
                                                       (SPADCALL (QCAR |aline|)
                                                                 (QREFELT %
                                                                          80))
                                                       |sc|))
                                                     ","
                                                     (|mathObject2String|
                                                      |minusStarty|)
                                                     "L"
                                                     (|mathObject2String|
                                                      (|mul_DF|
                                                       (SPADCALL (QCDR |aline|)
                                                                 (QREFELT %
                                                                          80))
                                                       |sc|))
                                                     ","
                                                     (|mathObject2String|
                                                      |minusEndy|))
                                                    (QREFELT % 105)))
                                             (EXIT
                                              (LETT |ptStr|
                                                    (STRCONC |ptStr|
                                                             |thisStr|))))))
                                      (EXIT
                                       (COND
                                        ((> |pntNum| 2)
                                         (SEQ (LETT |endPoint| |param2|)
                                              (LETT |minusEndy|
                                                    (|minus_DF|
                                                     (|mul_DF|
                                                      (SPADCALL |endPoint|
                                                                (QREFELT % 81))
                                                      |sc|)))
                                              (LETT |thisStr|
                                                    (SPADCALL
                                                     (LIST "L"
                                                           (|mathObject2String|
                                                            (|mul_DF|
                                                             (SPADCALL
                                                              |endPoint|
                                                              (QREFELT % 80))
                                                             |sc|))
                                                           ","
                                                           (|mathObject2String|
                                                            |minusEndy|))
                                                     (QREFELT % 105)))
                                              (EXIT
                                               (LETT |ptStr|
                                                     (STRCONC |ptStr|
                                                              |thisStr|))))))))))))
                             (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((SPADCALL |ptStr| "" (QREFELT % 136))
                           (SEQ
                            (COND
                             ((|less_DF|
                               (SPADCALL |startPoint| |endPoint|
                                         (QREFELT % 137))
                               (|mk_DF| 1 -2))
                              (LETT |ptStr|
                                    (SPADCALL
                                     (LIST "M "
                                           (|mathObject2String|
                                            (|mul_DF|
                                             (SPADCALL |startPoint|
                                                       (QREFELT % 80))
                                             |sc|))
                                           ","
                                           (|mathObject2String|
                                            (|minus_DF|
                                             (|mul_DF|
                                              (SPADCALL |startPoint|
                                                        (QREFELT % 81))
                                              |sc|)))
                                           "c -50,25 -50,-50 0,-25")
                                     (QREFELT % 105)))))
                            (LETT |linWidth|
                                  (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT))
                            (COND
                             ((EQUAL |mode| '|proportional|)
                              (LETT |linWidth|
                                    (|mul_DF|
                                     (SPADCALL
                                      (SPADCALL (SPADCALL |bb| (QREFELT % 38))
                                                (SPADCALL |bb| (QREFELT % 39))
                                                (QREFELT % 40))
                                      (QREFELT % 80))
                                     |size|))))
                            (COND
                             ((EQUAL |mode| '|variable|)
                              (LETT |linWidth|
                                    (|mul_DF|
                                     (SPADCALL |startPoint| |endPoint|
                                               (QREFELT % 137))
                                     |size|))))
                            (LETT |nodeAtts|
                                  (LIST (SPADCALL "d" |ptStr| (QREFELT % 140))
                                        (SPADCALL "fill" "none"
                                                  (QREFELT % 140))
                                        (SPADCALL "stroke" (QVELT |mat| 1)
                                                  (QREFELT % 140))
                                        (SPADCALL "stroke-width"
                                                  (|mathObject2String|
                                                   |linWidth|)
                                                  (QREFELT % 140))
                                        (SPADCALL "style"
                                                  "marker-end:url(#Arrow)"
                                                  (QREFELT % 140))))
                            (LETT |x|
                                  (SPADCALL "path" NIL |nodeAtts|
                                            (QREFELT % 143)))
                            (EXIT
                             (LETT |nodeEles|
                                   (SPADCALL |nodeEles| |x|
                                             (QREFELT % 145)))))))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT |nodeEles|)))) 

(SDEFUN |SCENE;faceString|
        ((|faces|
          (|Record| (|:| |inx| (|List| (|List| (|NonNegativeInteger|))))
                    (|:| |pts| (|List| PT))))
         (|tran| (|STransform| PT)) (|bb| (|SBoundary| PT))
         (|sc| (|DoubleFloat|)) (|clipEn| (|Boolean|)) (% (|String|)))
        (SPROG
         ((|ptStr| (|String|)) (|lastValid| #1=(|Boolean|))
          (|thisStr| (|String|)) (|minusy| (|DoubleFloat|))
          (|pntNum| (|NonNegativeInteger|)) (|valid| #1#) (|param2| (PT))
          (|param| (PT)) (#2=#:G890 NIL) (|i| NIL) (#3=#:G889 NIL) (|ln| NIL))
         (SEQ (LETT |ptStr| "") (LETT |lastValid| 'T)
              (SEQ (LETT |ln| NIL) (LETT #3# (QCAR |faces|)) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |ln| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |pntNum| 0)
                        (SEQ (LETT |i| NIL) (LETT #2# |ln|) G190
                             (COND
                              ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |param|
                                    (SPADCALL (QCDR |faces|) (+ |i| 1)
                                              (QREFELT % 92)))
                              (LETT |param2|
                                    (SPADCALL |tran| |param| (QREFELT % 134)))
                              (LETT |valid|
                                    (COND
                                     (|clipEn|
                                      (SPADCALL |bb| |param| (QREFELT % 135)))
                                     ('T 'T)))
                              (COND
                               (|valid|
                                (SEQ (LETT |pntNum| (+ |pntNum| 1))
                                     (COND
                                      ((SPADCALL |ptStr| "" (QREFELT % 136))
                                       (LETT |ptStr| (STRCONC |ptStr| " "))))
                                     (COND
                                      (|lastValid|
                                       (SEQ
                                        (COND
                                         ((EQL |pntNum| 1)
                                          (LETT |ptStr|
                                                (STRCONC |ptStr| "M"))))
                                        (EXIT
                                         (COND
                                          ((EQL |pntNum| 2)
                                           (LETT |ptStr|
                                                 (STRCONC |ptStr| "L"))))))))
                                     (COND
                                      ((NULL |lastValid|)
                                       (LETT |ptStr| (STRCONC |ptStr| "M"))))
                                     (LETT |minusy|
                                           (|minus_DF|
                                            (|mul_DF|
                                             (SPADCALL |param2| (QREFELT % 81))
                                             |sc|)))
                                     (LETT |thisStr|
                                           (SPADCALL
                                            (LIST
                                             (|mathObject2String|
                                              (|mul_DF|
                                               (SPADCALL |param2|
                                                         (QREFELT % 80))
                                               |sc|))
                                             ","
                                             (|mathObject2String| |minusy|))
                                            (QREFELT % 105)))
                                     (EXIT
                                      (LETT |ptStr|
                                            (STRCONC |ptStr| |thisStr|))))))
                              (EXIT (LETT |lastValid| |valid|)))
                             (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                        (EXIT (LETT |ptStr| (STRCONC |ptStr| "z"))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT |ptStr|)))) 

(SDEFUN |SCENE;toSVG;%RStSbDf2BSnpXe;73|
        ((|n| (%))
         (|mat|
          (|Record| (|:| |lineWidth| (|DoubleFloat|))
                    (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
                    (|:| |matOpacity| (|DoubleFloat|))))
         (|tran| (|STransform| PT)) (|bb| (|SBoundary| PT))
         (|scale| (|DoubleFloat|)) (|clipEn| (|Boolean|))
         (|useInteger| (|Boolean|)) (|npt| (|SceneNamedPoints| PT))
         (% (|XmlElement|)))
        (SPROG
         ((|nodeEles| (|List| (|XmlElement|))) (|xch| (|XmlElement|))
          (#1=#:G979 NIL) (|ch| NIL) (|nodeName| (|String|)) (|nde| (%))
          (|name| #2=(|String|))
          (|nn| (|Record| (|:| |nme| #2#) (|:| |node| %))) (#3=#:G908 NIL)
          (#4=#:G909 NIL) (|nodeAtts| (|List| (|XmlAttribute|)))
          (|linWidth| (|DoubleFloat|)) (#5=#:G906 NIL) (|ptStr| #6=(|String|))
          (|endPointM| #7=(|DoubleFloat|)) (|startPointM| #7#)
          (|endPoint| (PT)) (|startPoint| (PT)) (#8=#:G905 NIL) (#9=#:G977 NIL)
          (#10=#:G904 NIL) (|bb2| (|SBoundary| PT)) (#11=#:G902 NIL)
          (|clipEn2| (|Boolean|)) (|tran2| (|STransform| PT)) (#12=#:G903 NIL)
          (#13=#:G901 NIL) (|textScale| (|DoubleFloat|)) (|y| #7#)
          (|x| #14=(|DoubleFloat|)) (|param2| (PT))
          (|nodeAttsTxt| (|List| #15=(|XmlAttribute|))) (#16=#:G978 NIL)
          (|nam| NIL)
          (|mat2|
           (|Record| (|:| |lineWidth| (|DoubleFloat|))
                     (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
                     (|:| |matOpacity| (|DoubleFloat|))))
          (#17=#:G900 NIL) (#18=#:G907 NIL) (|sh| (|String|)) (|sw| (|String|))
          (|sy| (|String|)) (|sx| (|String|)) (|ry| #14#) (|rx| #14#)
          (|r2| (PT)) (#19=#:G899 NIL) (|viewBoxStr| #6#) (|offsety| #7#)
          (|offsetx| #7#) (|scale2| (|DoubleFloat|))
          (|maxy| #20=(|DoubleFloat|)) (|maxx| #21=(|DoubleFloat|))
          (|miny| #20#) (|minx| #21#) (|mkr| #22=(|XmlElement|))
          (|mkrAtts| (|List| #15#)) (|pth| #22#) (|pthAtts| (|List| #15#))
          (|np2| (|SceneNamedPoints| PT)))
         (SEQ
          (EXIT
           (SEQ (LETT |bb2| |bb|) (LETT |tran2| |tran|) (LETT |mat2| |mat|)
                (LETT |np2| |npt|) (LETT |clipEn2| |clipEn|)
                (LETT |scale2| |scale|) (LETT |nodeEles| NIL)
                (LETT |nodeAtts| NIL) (LETT |nodeName| "")
                (COND
                 ((EQUAL (QVELT |n| 0) 'ROOT)
                  (SEQ (LETT |nodeName| "svg")
                       (LETT |pthAtts|
                             (LIST
                              (SPADCALL "d"
                                        "M 0.0,0.0 L 5.0,-5.0 L -12.5,0.0 L 5.0,5.0 L 0.0,0.0 z "
                                        (QREFELT % 140))
                              (SPADCALL "style"
                                        "fill-rule:evenodd;stroke:#000000;stroke-width:1.0pt;marker-start:none;"
                                        (QREFELT % 140))
                              (SPADCALL "transform"
                                        "scale(0.4) rotate(180) translate(10,0)"
                                        (QREFELT % 140))))
                       (LETT |pth|
                             (SPADCALL "path" NIL |pthAtts| (QREFELT % 143)))
                       (LETT |mkrAtts|
                             (LIST (SPADCALL "orient" "auto" (QREFELT % 140))
                                   (SPADCALL "refY" "0.0" (QREFELT % 140))
                                   (SPADCALL "refX" "0.0" (QREFELT % 140))
                                   (SPADCALL "id" "Arrow" (QREFELT % 140))
                                   (SPADCALL "style" "overflow:visible"
                                             (QREFELT % 140))))
                       (LETT |mkr|
                             (SPADCALL "marker" (LIST |pth|) |mkrAtts|
                                       (QREFELT % 143)))
                       (LETT |nodeEles|
                             (LIST
                              (SPADCALL "defs" (LIST |mkr|) NIL
                                        (QREFELT % 143))))
                       (COND
                        ((NULL (QEQCAR (QVELT |n| 2) 3))
                         (|error|
                          "toSVG parameter type not valid for root node")))
                       (LETT |bb2|
                             (PROG2 (LETT #11# (QVELT |n| 2))
                                 (QCDR #11#)
                               (|check_union2| (QEQCAR #11# 3)
                                               (|SBoundary| (QREFELT % 6))
                                               (|Union|
                                                (|:| |points|
                                                     (|List|
                                                      (|List| (QREFELT % 6))))
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
                                                      (|:| |pos| (QREFELT % 6))
                                                      (|:| |np|
                                                           (|List|
                                                            (|String|)))))
                                                (|:| |boundbox|
                                                     (|SBoundary|
                                                      (QREFELT % 6)))
                                                (|:| |trans|
                                                     (|STransform|
                                                      (QREFELT % 6)))
                                                (|:| |ifs|
                                                     (|Record|
                                                      (|:| |inx|
                                                           (|List|
                                                            (|List|
                                                             (|NonNegativeInteger|))))
                                                      (|:| |pts|
                                                           (|List|
                                                            (QREFELT % 6)))))
                                                (|:| |arrws|
                                                     (|Record|
                                                      (|:| |ln|
                                                           (|List|
                                                            (|List|
                                                             (QREFELT % 6))))
                                                      (|:| |mode| (|Symbol|))
                                                      (|:| |size|
                                                           (|DoubleFloat|))))
                                                (|:| |arrw|
                                                     (|Record|
                                                      (|:| |st| (|String|))
                                                      (|:| |en| (|String|))
                                                      (|:| |offset|
                                                           (QREFELT % 6))
                                                      (|:| |mode| (|Symbol|))
                                                      (|:| |size|
                                                           (|DoubleFloat|))))
                                                (|:| |shpe|
                                                     (|Record|
                                                      (|:| |shptype|
                                                           (|Symbol|))
                                                      (|:| |centre|
                                                           (QREFELT % 6))
                                                      (|:| |size|
                                                           (QREFELT % 6))
                                                      (|:| |fill|
                                                           (|Boolean|))))
                                                (|:| |nodename|
                                                     (|Record|
                                                      (|:| |nme| (|String|))
                                                      (|:| |node| %)))
                                                (|:| |np|
                                                     (|SceneNamedPoints|
                                                      (QREFELT % 6)))
                                                (|:| |empty| #23="empty"))
                                               #11#)))
                       (COND
                        ((SPADCALL |bb2| (QREFELT % 146))
                         (LETT |bb2| (SPADCALL |n| 1.0 (QREFELT % 29)))))
                       (COND
                        ((SPADCALL |bb2| (QREFELT % 146))
                         (|error| "scene contains no drawable elements")))
                       (LETT |minx|
                             (SPADCALL (SPADCALL |bb2| (QREFELT % 39))
                                       (QREFELT % 80)))
                       (LETT |miny|
                             (SPADCALL (SPADCALL |bb2| (QREFELT % 39))
                                       (QREFELT % 81)))
                       (LETT |maxx|
                             (SPADCALL (SPADCALL |bb2| (QREFELT % 38))
                                       (QREFELT % 80)))
                       (LETT |maxy|
                             (SPADCALL (SPADCALL |bb2| (QREFELT % 38))
                                       (QREFELT % 81)))
                       (LETT |scale2|
                             (|div_DF| (FLOAT 1000 MOST-POSITIVE-DOUBLE-FLOAT)
                                       (|sub_DF| |maxx| |minx|)))
                       (LETT |offsetx| (|minus_DF| |minx|))
                       (LETT |offsety| (|minus_DF| |maxy|))
                       (LETT |tran2|
                             (SPADCALL |offsetx| |offsety| 0.0 1.0 1.0 1.0
                                       (QREFELT % 147)))
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
                                (QREFELT % 105))))
                        (#24='T
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
                                (QREFELT % 105)))))
                       (EXIT
                        (LETT |nodeAtts|
                              (LIST
                               (SPADCALL "xmlns" "http://www.w3.org/2000/svg"
                                         (QREFELT % 140))
                               (SPADCALL "width" "12cm" (QREFELT % 140))
                               (SPADCALL "height" "8cm" (QREFELT % 140))
                               (SPADCALL "viewBox" |viewBoxStr|
                                         (QREFELT % 140))))))))
                (COND ((EQUAL (QVELT |n| 0) 'GROUP) (LETT |nodeName| "g")))
                (COND
                 ((EQUAL (QVELT |n| 0) 'LINE)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 0))
                     (|error| "toSVG parameter type not valid for line node")))
                   (LETT |nodeName| "path")
                   (LETT |nodeAtts|
                         (LIST
                          (SPADCALL "d"
                                    (|SCENE;pathString|
                                     (PROG2 (LETT #19# (QVELT |n| 2))
                                         (QCDR #19#)
                                       (|check_union2| (QEQCAR #19# 0)
                                                       (|List|
                                                        (|List| (QREFELT % 6)))
                                                       (|Union|
                                                        (|:| |points|
                                                             (|List|
                                                              (|List|
                                                               (QREFELT % 6))))
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
                                                                   (QREFELT %
                                                                            6))
                                                              (|:| |np|
                                                                   (|List|
                                                                    (|String|)))))
                                                        (|:| |boundbox|
                                                             (|SBoundary|
                                                              (QREFELT % 6)))
                                                        (|:| |trans|
                                                             (|STransform|
                                                              (QREFELT % 6)))
                                                        (|:| |ifs|
                                                             (|Record|
                                                              (|:| |inx|
                                                                   (|List|
                                                                    (|List|
                                                                     (|NonNegativeInteger|))))
                                                              (|:| |pts|
                                                                   (|List|
                                                                    (QREFELT %
                                                                             6)))))
                                                        (|:| |arrws|
                                                             (|Record|
                                                              (|:| |ln|
                                                                   (|List|
                                                                    (|List|
                                                                     (QREFELT %
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
                                                                   (QREFELT %
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
                                                                   (QREFELT %
                                                                            6))
                                                              (|:| |size|
                                                                   (QREFELT %
                                                                            6))
                                                              (|:| |fill|
                                                                   (|Boolean|))))
                                                        (|:| |nodename|
                                                             (|Record|
                                                              (|:| |nme|
                                                                   (|String|))
                                                              (|:| |node| %)))
                                                        (|:| |np|
                                                             (|SceneNamedPoints|
                                                              (QREFELT % 6)))
                                                        (|:| |empty| #23#))
                                                       #19#))
                                     |tran2| |bb2| |scale2| |clipEn2|
                                     |useInteger| %)
                                    (QREFELT % 140))
                          (SPADCALL "fill" "none" (QREFELT % 140))
                          (SPADCALL "stroke" (QVELT |mat2| 1) (QREFELT % 140))
                          (SPADCALL "stroke-width"
                                    (|mathObject2String| (QVELT |mat2| 0))
                                    (QREFELT % 140))
                          (SPADCALL "stroke-linecap" "butt" (QREFELT % 140))
                          (SPADCALL "stroke-linejoin" "miter"
                                    (QREFELT % 140))))
                   (EXIT
                    (COND
                     ((|less_DF| (QVELT |mat2| 3) (|mk_DF| 95 -2))
                      (LETT |nodeAtts|
                            (SPADCALL |nodeAtts|
                                      (SPADCALL "stroke-opacity"
                                                (|mathObject2String|
                                                 (QVELT |mat2| 3))
                                                (QREFELT % 140))
                                      (QREFELT % 148)))))))))
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
                                    (PROG2 (LETT #18# (QVELT |n| 2))
                                        (QCDR #18#)
                                      (|check_union2| (QEQCAR #18# 8)
                                                      (|Record|
                                                       (|:| |shptype|
                                                            (|Symbol|))
                                                       (|:| |centre|
                                                            (QREFELT % 6))
                                                       (|:| |size|
                                                            (QREFELT % 6))
                                                       (|:| |fill|
                                                            (|Boolean|)))
                                                      (|Union|
                                                       (|:| |points|
                                                            (|List|
                                                             (|List|
                                                              (QREFELT % 6))))
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
                                                                  (QREFELT %
                                                                           6))
                                                             (|:| |np|
                                                                  (|List|
                                                                   (|String|)))))
                                                       (|:| |boundbox|
                                                            (|SBoundary|
                                                             (QREFELT % 6)))
                                                       (|:| |trans|
                                                            (|STransform|
                                                             (QREFELT % 6)))
                                                       (|:| |ifs|
                                                            (|Record|
                                                             (|:| |inx|
                                                                  (|List|
                                                                   (|List|
                                                                    (|NonNegativeInteger|))))
                                                             (|:| |pts|
                                                                  (|List|
                                                                   (QREFELT %
                                                                            6)))))
                                                       (|:| |arrws|
                                                            (|Record|
                                                             (|:| |ln|
                                                                  (|List|
                                                                   (|List|
                                                                    (QREFELT %
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
                                                                  (QREFELT %
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
                                                                  (QREFELT %
                                                                           6))
                                                             (|:| |size|
                                                                  (QREFELT %
                                                                           6))
                                                             (|:| |fill|
                                                                  (|Boolean|))))
                                                       (|:| |nodename|
                                                            (|Record|
                                                             (|:| |nme|
                                                                  (|String|))
                                                             (|:| |node| %)))
                                                       (|:| |np|
                                                            (|SceneNamedPoints|
                                                             (QREFELT % 6)))
                                                       (|:| |empty| #23#))
                                                      #18#))
                                    1)
                                   (QREFELT % 134)))
                   (LETT |r2|
                         (QVELT
                          (PROG2 (LETT #18# (QVELT |n| 2))
                              (QCDR #18#)
                            (|check_union2| (QEQCAR #18# 8)
                                            (|Record|
                                             (|:| |shptype| (|Symbol|))
                                             (|:| |centre| (QREFELT % 6))
                                             (|:| |size| (QREFELT % 6))
                                             (|:| |fill| (|Boolean|)))
                                            (|Union|
                                             (|:| |points|
                                                  (|List|
                                                   (|List| (QREFELT % 6))))
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
                                                   (|:| |pos| (QREFELT % 6))
                                                   (|:| |np|
                                                        (|List| (|String|)))))
                                             (|:| |boundbox|
                                                  (|SBoundary| (QREFELT % 6)))
                                             (|:| |trans|
                                                  (|STransform| (QREFELT % 6)))
                                             (|:| |ifs|
                                                  (|Record|
                                                   (|:| |inx|
                                                        (|List|
                                                         (|List|
                                                          (|NonNegativeInteger|))))
                                                   (|:| |pts|
                                                        (|List|
                                                         (QREFELT % 6)))))
                                             (|:| |arrws|
                                                  (|Record|
                                                   (|:| |ln|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT % 6))))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |arrw|
                                                  (|Record|
                                                   (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT % 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |shpe|
                                                  (|Record|
                                                   (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT % 6))
                                                   (|:| |size| (QREFELT % 6))
                                                   (|:| |fill| (|Boolean|))))
                                             (|:| |nodename|
                                                  (|Record|
                                                   (|:| |nme| (|String|))
                                                   (|:| |node| %)))
                                             (|:| |np|
                                                  (|SceneNamedPoints|
                                                   (QREFELT % 6)))
                                             (|:| |empty| #23#))
                                            #18#))
                          2))
                   (LETT |rx|
                         (|mul_DF| (SPADCALL |r2| (QREFELT % 80)) |scale2|))
                   (LETT |ry|
                         (|mul_DF| (SPADCALL |r2| (QREFELT % 81)) |scale2|))
                   (LETT |nodeName| "ellipse") (LETT |sx| "x") (LETT |sy| "y")
                   (LETT |sw| "width") (LETT |sh| "height")
                   (COND
                    ((EQUAL
                      (QVELT
                       (PROG2 (LETT #18# (QVELT |n| 2))
                           (QCDR #18#)
                         (|check_union2| (QEQCAR #18# 8)
                                         (|Record| (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT % 6))
                                                   (|:| |size| (QREFELT % 6))
                                                   (|:| |fill| (|Boolean|)))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT % 6))))
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
                                                              (QREFELT % 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT % 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT % 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT % 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT % 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT % 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT % 6))
                                                (|:| |size| (QREFELT % 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| %)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT % 6)))
                                          (|:| |empty| #23#))
                                         #18#))
                       0)
                      '|rect|)
                     (SEQ (LETT |nodeName| "rect") (LETT |sx| "x")
                          (LETT |sy| "y") (LETT |sw| "width")
                          (EXIT (LETT |sh| "height")))))
                   (COND
                    ((EQUAL
                      (QVELT
                       (PROG2 (LETT #18# (QVELT |n| 2))
                           (QCDR #18#)
                         (|check_union2| (QEQCAR #18# 8)
                                         (|Record| (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT % 6))
                                                   (|:| |size| (QREFELT % 6))
                                                   (|:| |fill| (|Boolean|)))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT % 6))))
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
                                                              (QREFELT % 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT % 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT % 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT % 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT % 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT % 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT % 6))
                                                (|:| |size| (QREFELT % 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| %)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT % 6)))
                                          (|:| |empty| #23#))
                                         #18#))
                       0)
                      '|ellipse|)
                     (SEQ (LETT |nodeName| "ellipse") (LETT |sx| "cx")
                          (LETT |sy| "cy") (LETT |sw| "rx")
                          (EXIT (LETT |sh| "ry")))))
                   (COND
                    ((EQUAL
                      (QVELT
                       (PROG2 (LETT #18# (QVELT |n| 2))
                           (QCDR #18#)
                         (|check_union2| (QEQCAR #18# 8)
                                         (|Record| (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT % 6))
                                                   (|:| |size| (QREFELT % 6))
                                                   (|:| |fill| (|Boolean|)))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT % 6))))
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
                                                              (QREFELT % 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT % 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT % 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT % 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT % 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT % 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT % 6))
                                                (|:| |size| (QREFELT % 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| %)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT % 6)))
                                          (|:| |empty| #23#))
                                         #18#))
                       0)
                      '|box|)
                     (SEQ (LETT |nodeName| "rect") (LETT |sx| "x")
                          (LETT |sy| "y") (LETT |sw| "width")
                          (EXIT (LETT |sh| "height")))))
                   (COND
                    ((EQUAL
                      (QVELT
                       (PROG2 (LETT #18# (QVELT |n| 2))
                           (QCDR #18#)
                         (|check_union2| (QEQCAR #18# 8)
                                         (|Record| (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT % 6))
                                                   (|:| |size| (QREFELT % 6))
                                                   (|:| |fill| (|Boolean|)))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT % 6))))
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
                                                              (QREFELT % 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT % 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT % 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT % 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT % 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT % 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT % 6))
                                                (|:| |size| (QREFELT % 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| %)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT % 6)))
                                          (|:| |empty| #23#))
                                         #18#))
                       0)
                      '|sphere|)
                     (SEQ (LETT |nodeName| "ellipse") (LETT |sx| "cx")
                          (LETT |sy| "cy") (LETT |sw| "rx")
                          (EXIT (LETT |sh| "ry")))))
                   (LETT |nodeAtts|
                         (LIST
                          (SPADCALL "stroke" (QVELT |mat2| 1) (QREFELT % 140))
                          (SPADCALL "stroke-width"
                                    (|mathObject2String| (QVELT |mat2| 0))
                                    (QREFELT % 140))
                          (SPADCALL |sx|
                                    (|mathObject2String|
                                     (|mul_DF|
                                      (SPADCALL |param2| (QREFELT % 80))
                                      |scale2|))
                                    (QREFELT % 140))
                          (SPADCALL |sy|
                                    (|mathObject2String|
                                     (|minus_DF|
                                      (|mul_DF|
                                       (SPADCALL |param2| (QREFELT % 81))
                                       |scale2|)))
                                    (QREFELT % 140))
                          (SPADCALL |sw| (|mathObject2String| (|abs_DF| |rx|))
                                    (QREFELT % 140))
                          (SPADCALL |sh| (|mathObject2String| (|abs_DF| |ry|))
                                    (QREFELT % 140))))
                   (COND
                    ((QVELT
                      (PROG2 (LETT #18# (QVELT |n| 2))
                          (QCDR #18#)
                        (|check_union2| (QEQCAR #18# 8)
                                        (|Record| (|:| |shptype| (|Symbol|))
                                                  (|:| |centre| (QREFELT % 6))
                                                  (|:| |size| (QREFELT % 6))
                                                  (|:| |fill| (|Boolean|)))
                                        (|Union|
                                         (|:| |points|
                                              (|List| (|List| (QREFELT % 6))))
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
                                                             (QREFELT % 6))
                                                        (|:| |np|
                                                             (|List|
                                                              (|String|)))))
                                         (|:| |boundbox|
                                              (|SBoundary| (QREFELT % 6)))
                                         (|:| |trans|
                                              (|STransform| (QREFELT % 6)))
                                         (|:| |ifs|
                                              (|Record|
                                               (|:| |inx|
                                                    (|List|
                                                     (|List|
                                                      (|NonNegativeInteger|))))
                                               (|:| |pts|
                                                    (|List| (QREFELT % 6)))))
                                         (|:| |arrws|
                                              (|Record|
                                               (|:| |ln|
                                                    (|List|
                                                     (|List| (QREFELT % 6))))
                                               (|:| |mode| (|Symbol|))
                                               (|:| |size| (|DoubleFloat|))))
                                         (|:| |arrw|
                                              (|Record| (|:| |st| (|String|))
                                                        (|:| |en| (|String|))
                                                        (|:| |offset|
                                                             (QREFELT % 6))
                                                        (|:| |mode| (|Symbol|))
                                                        (|:| |size|
                                                             (|DoubleFloat|))))
                                         (|:| |shpe|
                                              (|Record|
                                               (|:| |shptype| (|Symbol|))
                                               (|:| |centre| (QREFELT % 6))
                                               (|:| |size| (QREFELT % 6))
                                               (|:| |fill| (|Boolean|))))
                                         (|:| |nodename|
                                              (|Record| (|:| |nme| (|String|))
                                                        (|:| |node| %)))
                                         (|:| |np|
                                              (|SceneNamedPoints|
                                               (QREFELT % 6)))
                                         (|:| |empty| #23#))
                                        #18#))
                      3)
                     (LETT |nodeAtts|
                           (SPADCALL |nodeAtts|
                                     (SPADCALL "fill"
                                               (|mathObject2String|
                                                (QVELT |mat2| 2))
                                               (QREFELT % 140))
                                     (QREFELT % 148))))
                    (#24#
                     (LETT |nodeAtts|
                           (SPADCALL |nodeAtts|
                                     (SPADCALL "fill" "none" (QREFELT % 140))
                                     (QREFELT % 148)))))
                   (EXIT
                    (COND
                     ((|less_DF| (QVELT |mat2| 3) (|mk_DF| 95 -2))
                      (LETT |nodeAtts|
                            (SPADCALL |nodeAtts|
                                      (SPADCALL "opacity"
                                                (|mathObject2String|
                                                 (QVELT |mat2| 3))
                                                (QREFELT % 140))
                                      (QREFELT % 148)))))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'MATERIAL)
                  (SEQ (LETT |nodeName| "g")
                       (COND
                        ((NULL (QEQCAR (QVELT |n| 2) 1))
                         (|error|
                          "toSVG parameter type not valid for material node")))
                       (EXIT
                        (LETT |mat2|
                              (PROG2 (LETT #17# (QVELT |n| 2))
                                  (QCDR #17#)
                                (|check_union2| (QEQCAR #17# 1)
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
                                                       (|List| (QREFELT % 6))))
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
                                                            (QREFELT % 6))
                                                       (|:| |np|
                                                            (|List|
                                                             (|String|)))))
                                                 (|:| |boundbox|
                                                      (|SBoundary|
                                                       (QREFELT % 6)))
                                                 (|:| |trans|
                                                      (|STransform|
                                                       (QREFELT % 6)))
                                                 (|:| |ifs|
                                                      (|Record|
                                                       (|:| |inx|
                                                            (|List|
                                                             (|List|
                                                              (|NonNegativeInteger|))))
                                                       (|:| |pts|
                                                            (|List|
                                                             (QREFELT % 6)))))
                                                 (|:| |arrws|
                                                      (|Record|
                                                       (|:| |ln|
                                                            (|List|
                                                             (|List|
                                                              (QREFELT % 6))))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                                 (|:| |arrw|
                                                      (|Record|
                                                       (|:| |st| (|String|))
                                                       (|:| |en| (|String|))
                                                       (|:| |offset|
                                                            (QREFELT % 6))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                                 (|:| |shpe|
                                                      (|Record|
                                                       (|:| |shptype|
                                                            (|Symbol|))
                                                       (|:| |centre|
                                                            (QREFELT % 6))
                                                       (|:| |size|
                                                            (QREFELT % 6))
                                                       (|:| |fill|
                                                            (|Boolean|))))
                                                 (|:| |nodename|
                                                      (|Record|
                                                       (|:| |nme| (|String|))
                                                       (|:| |node| %)))
                                                 (|:| |np|
                                                      (|SceneNamedPoints|
                                                       (QREFELT % 6)))
                                                 (|:| |empty| #23#))
                                                #17#)))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'TEXT)
                  (SEQ (LETT |nodeName| "text")
                       (COND
                        ((NULL (QEQCAR (QVELT |n| 2) 2))
                         (|error|
                          "toSVG parameter type not valid for text node")))
                       (COND
                        ((SPADCALL
                          (QVELT
                           (PROG2 (LETT #13# (QVELT |n| 2))
                               (QCDR #13#)
                             (|check_union2| (QEQCAR #13# 2)
                                             (|Record| (|:| |txt| (|String|))
                                                       (|:| |siz|
                                                            (|NonNegativeInteger|))
                                                       (|:| |pos|
                                                            (QREFELT % 6))
                                                       (|:| |np|
                                                            (|List|
                                                             (|String|))))
                                             (|Union|
                                              (|:| |points|
                                                   (|List|
                                                    (|List| (QREFELT % 6))))
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
                                                    (|:| |pos| (QREFELT % 6))
                                                    (|:| |np|
                                                         (|List| (|String|)))))
                                              (|:| |boundbox|
                                                   (|SBoundary| (QREFELT % 6)))
                                              (|:| |trans|
                                                   (|STransform|
                                                    (QREFELT % 6)))
                                              (|:| |ifs|
                                                   (|Record|
                                                    (|:| |inx|
                                                         (|List|
                                                          (|List|
                                                           (|NonNegativeInteger|))))
                                                    (|:| |pts|
                                                         (|List|
                                                          (QREFELT % 6)))))
                                              (|:| |arrws|
                                                   (|Record|
                                                    (|:| |ln|
                                                         (|List|
                                                          (|List|
                                                           (QREFELT % 6))))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|))))
                                              (|:| |arrw|
                                                   (|Record|
                                                    (|:| |st| (|String|))
                                                    (|:| |en| (|String|))
                                                    (|:| |offset|
                                                         (QREFELT % 6))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|))))
                                              (|:| |shpe|
                                                   (|Record|
                                                    (|:| |shptype| (|Symbol|))
                                                    (|:| |centre|
                                                         (QREFELT % 6))
                                                    (|:| |size| (QREFELT % 6))
                                                    (|:| |fill| (|Boolean|))))
                                              (|:| |nodename|
                                                   (|Record|
                                                    (|:| |nme| (|String|))
                                                    (|:| |node| %)))
                                              (|:| |np|
                                                   (|SceneNamedPoints|
                                                    (QREFELT % 6)))
                                              (|:| |empty| #23#))
                                             #13#))
                           3)
                          NIL (QREFELT % 149))
                         (SEQ
                          (SEQ (LETT |nam| NIL)
                               (LETT #16#
                                     (QVELT
                                      (PROG2 (LETT #13# (QVELT |n| 2))
                                          (QCDR #13#)
                                        (|check_union2| (QEQCAR #13# 2)
                                                        (|Record|
                                                         (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT % 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|))))
                                                        (|Union|
                                                         (|:| |points|
                                                              (|List|
                                                               (|List|
                                                                (QREFELT %
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
                                                                    (QREFELT %
                                                                             6))
                                                               (|:| |np|
                                                                    (|List|
                                                                     (|String|)))))
                                                         (|:| |boundbox|
                                                              (|SBoundary|
                                                               (QREFELT % 6)))
                                                         (|:| |trans|
                                                              (|STransform|
                                                               (QREFELT % 6)))
                                                         (|:| |ifs|
                                                              (|Record|
                                                               (|:| |inx|
                                                                    (|List|
                                                                     (|List|
                                                                      (|NonNegativeInteger|))))
                                                               (|:| |pts|
                                                                    (|List|
                                                                     (QREFELT %
                                                                              6)))))
                                                         (|:| |arrws|
                                                              (|Record|
                                                               (|:| |ln|
                                                                    (|List|
                                                                     (|List|
                                                                      (QREFELT
                                                                       % 6))))
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
                                                                    (QREFELT %
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
                                                                    (QREFELT %
                                                                             6))
                                                               (|:| |size|
                                                                    (QREFELT %
                                                                             6))
                                                               (|:| |fill|
                                                                    (|Boolean|))))
                                                         (|:| |nodename|
                                                              (|Record|
                                                               (|:| |nme|
                                                                    (|String|))
                                                               (|:| |node| %)))
                                                         (|:| |np|
                                                              (|SceneNamedPoints|
                                                               (QREFELT % 6)))
                                                         (|:| |empty| #23#))
                                                        #13#))
                                      3))
                               G190
                               (COND
                                ((OR (ATOM #16#)
                                     (PROGN (LETT |nam| (CAR #16#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (LETT |param2|
                                      (SPADCALL |tran|
                                                (SPADCALL
                                                 (SPADCALL |np2| |nam|
                                                           (QREFELT % 150))
                                                 (QVELT
                                                  (PROG2
                                                      (LETT #13# (QVELT |n| 2))
                                                      (QCDR #13#)
                                                    (|check_union2|
                                                     (QEQCAR #13# 2)
                                                     (|Record|
                                                      (|:| |txt| (|String|))
                                                      (|:| |siz|
                                                           (|NonNegativeInteger|))
                                                      (|:| |pos| (QREFELT % 6))
                                                      (|:| |np|
                                                           (|List|
                                                            (|String|))))
                                                     (|Union|
                                                      (|:| |points|
                                                           (|List|
                                                            (|List|
                                                             (QREFELT % 6))))
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
                                                                 (QREFELT % 6))
                                                            (|:| |np|
                                                                 (|List|
                                                                  (|String|)))))
                                                      (|:| |boundbox|
                                                           (|SBoundary|
                                                            (QREFELT % 6)))
                                                      (|:| |trans|
                                                           (|STransform|
                                                            (QREFELT % 6)))
                                                      (|:| |ifs|
                                                           (|Record|
                                                            (|:| |inx|
                                                                 (|List|
                                                                  (|List|
                                                                   (|NonNegativeInteger|))))
                                                            (|:| |pts|
                                                                 (|List|
                                                                  (QREFELT %
                                                                           6)))))
                                                      (|:| |arrws|
                                                           (|Record|
                                                            (|:| |ln|
                                                                 (|List|
                                                                  (|List|
                                                                   (QREFELT %
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
                                                                 (QREFELT % 6))
                                                            (|:| |mode|
                                                                 (|Symbol|))
                                                            (|:| |size|
                                                                 (|DoubleFloat|))))
                                                      (|:| |shpe|
                                                           (|Record|
                                                            (|:| |shptype|
                                                                 (|Symbol|))
                                                            (|:| |centre|
                                                                 (QREFELT % 6))
                                                            (|:| |size|
                                                                 (QREFELT % 6))
                                                            (|:| |fill|
                                                                 (|Boolean|))))
                                                      (|:| |nodename|
                                                           (|Record|
                                                            (|:| |nme|
                                                                 (|String|))
                                                            (|:| |node| %)))
                                                      (|:| |np|
                                                           (|SceneNamedPoints|
                                                            (QREFELT % 6)))
                                                      (|:| |empty| #23#))
                                                     #13#))
                                                  2)
                                                 (QREFELT % 93))
                                                (QREFELT % 134)))
                                (LETT |nodeAttsTxt|
                                      (LIST
                                       (SPADCALL "font-size"
                                                 (STRINGIMAGE
                                                  (QVELT
                                                   (PROG2
                                                       (LETT #13#
                                                             (QVELT |n| 2))
                                                       (QCDR #13#)
                                                     (|check_union2|
                                                      (QEQCAR #13# 2)
                                                      (|Record|
                                                       (|:| |txt| (|String|))
                                                       (|:| |siz|
                                                            (|NonNegativeInteger|))
                                                       (|:| |pos|
                                                            (QREFELT % 6))
                                                       (|:| |np|
                                                            (|List|
                                                             (|String|))))
                                                      (|Union|
                                                       (|:| |points|
                                                            (|List|
                                                             (|List|
                                                              (QREFELT % 6))))
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
                                                                  (QREFELT %
                                                                           6))
                                                             (|:| |np|
                                                                  (|List|
                                                                   (|String|)))))
                                                       (|:| |boundbox|
                                                            (|SBoundary|
                                                             (QREFELT % 6)))
                                                       (|:| |trans|
                                                            (|STransform|
                                                             (QREFELT % 6)))
                                                       (|:| |ifs|
                                                            (|Record|
                                                             (|:| |inx|
                                                                  (|List|
                                                                   (|List|
                                                                    (|NonNegativeInteger|))))
                                                             (|:| |pts|
                                                                  (|List|
                                                                   (QREFELT %
                                                                            6)))))
                                                       (|:| |arrws|
                                                            (|Record|
                                                             (|:| |ln|
                                                                  (|List|
                                                                   (|List|
                                                                    (QREFELT %
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
                                                                  (QREFELT %
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
                                                                  (QREFELT %
                                                                           6))
                                                             (|:| |size|
                                                                  (QREFELT %
                                                                           6))
                                                             (|:| |fill|
                                                                  (|Boolean|))))
                                                       (|:| |nodename|
                                                            (|Record|
                                                             (|:| |nme|
                                                                  (|String|))
                                                             (|:| |node| %)))
                                                       (|:| |np|
                                                            (|SceneNamedPoints|
                                                             (QREFELT % 6)))
                                                       (|:| |empty| #23#))
                                                      #13#))
                                                   1))
                                                 (QREFELT % 140))
                                       (SPADCALL "transform"
                                                 (SPADCALL
                                                  (LIST "scale("
                                                        (|mathObject2String|
                                                         (|div_DF| |scale2|
                                                                   (FLOAT 2
                                                                          MOST-POSITIVE-DOUBLE-FLOAT)))
                                                        ","
                                                        (|mathObject2String|
                                                         (|div_DF| |scale2|
                                                                   (FLOAT 2
                                                                          MOST-POSITIVE-DOUBLE-FLOAT)))
                                                        ")")
                                                  (QREFELT % 105))
                                                 (QREFELT % 140))
                                       (SPADCALL "x"
                                                 (|mathObject2String|
                                                  (|mul_DF|
                                                   (SPADCALL |param2|
                                                             (QREFELT % 80))
                                                   (FLOAT 2
                                                          MOST-POSITIVE-DOUBLE-FLOAT)))
                                                 (QREFELT % 140))
                                       (SPADCALL "y"
                                                 (|mathObject2String|
                                                  (|minus_DF|
                                                   (|mul_DF|
                                                    (SPADCALL |param2|
                                                              (QREFELT % 81))
                                                    (FLOAT 2
                                                           MOST-POSITIVE-DOUBLE-FLOAT))))
                                                 (QREFELT % 140))
                                       (SPADCALL "style"
                                                 (STRCONC "fill:"
                                                          (QVELT |mat2| 2))
                                                 (QREFELT % 140))))
                                (LETT |xch|
                                      (SPADCALL |nodeName| |nam| |nodeAttsTxt|
                                                (QREFELT % 151)))
                                (EXIT
                                 (COND
                                  ((NULL (SPADCALL |xch| (QREFELT % 152)))
                                   (LETT |nodeEles|
                                         (SPADCALL |nodeEles| |xch|
                                                   (QREFELT % 145)))))))
                               (LETT #16# (CDR #16#)) (GO G190) G191
                               (EXIT NIL))
                          (EXIT
                           (PROGN
                            (LETT #9#
                                  (SPADCALL "g" |nodeEles| |nodeAtts|
                                            (QREFELT % 143)))
                            (GO #25=#:G976))))))
                       (LETT |param2|
                             (SPADCALL |tran|
                                       (QVELT
                                        (PROG2 (LETT #13# (QVELT |n| 2))
                                            (QCDR #13#)
                                          (|check_union2| (QEQCAR #13# 2)
                                                          (|Record|
                                                           (|:| |txt|
                                                                (|String|))
                                                           (|:| |siz|
                                                                (|NonNegativeInteger|))
                                                           (|:| |pos|
                                                                (QREFELT % 6))
                                                           (|:| |np|
                                                                (|List|
                                                                 (|String|))))
                                                          (|Union|
                                                           (|:| |points|
                                                                (|List|
                                                                 (|List|
                                                                  (QREFELT %
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
                                                                       % 6))
                                                                 (|:| |np|
                                                                      (|List|
                                                                       (|String|)))))
                                                           (|:| |boundbox|
                                                                (|SBoundary|
                                                                 (QREFELT %
                                                                          6)))
                                                           (|:| |trans|
                                                                (|STransform|
                                                                 (QREFELT %
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
                                                                        %
                                                                        6)))))
                                                           (|:| |arrws|
                                                                (|Record|
                                                                 (|:| |ln|
                                                                      (|List|
                                                                       (|List|
                                                                        (QREFELT
                                                                         %
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
                                                                       % 6))
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
                                                                       % 6))
                                                                 (|:| |size|
                                                                      (QREFELT
                                                                       % 6))
                                                                 (|:| |fill|
                                                                      (|Boolean|))))
                                                           (|:| |nodename|
                                                                (|Record|
                                                                 (|:| |nme|
                                                                      (|String|))
                                                                 (|:| |node|
                                                                      %)))
                                                           (|:| |np|
                                                                (|SceneNamedPoints|
                                                                 (QREFELT %
                                                                          6)))
                                                           (|:| |empty| #23#))
                                                          #13#))
                                        2)
                                       (QREFELT % 134)))
                       (LETT |textScale|
                             (|div_DF| |scale2|
                                       (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)))
                       (LETT |x|
                             (|mul_DF| (SPADCALL |param2| (QREFELT % 80))
                                       (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)))
                       (LETT |y|
                             (|minus_DF|
                              (|mul_DF| (SPADCALL |param2| (QREFELT % 81))
                                        (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT))))
                       (COND
                        ((SPADCALL |textScale|
                                   (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)
                                   (QREFELT % 138))
                         (SEQ
                          (LETT |x|
                                (|div_DF| (|mul_DF| |x| |textScale|)
                                          (FLOAT 2
                                                 MOST-POSITIVE-DOUBLE-FLOAT)))
                          (LETT |y|
                                (|div_DF| (|mul_DF| |y| |textScale|)
                                          (FLOAT 2
                                                 MOST-POSITIVE-DOUBLE-FLOAT)))
                          (EXIT
                           (LETT |textScale|
                                 (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT))))))
                       (LETT |nodeAtts|
                             (LIST
                              (SPADCALL "font-size"
                                        (STRINGIMAGE
                                         (QVELT
                                          (PROG2 (LETT #13# (QVELT |n| 2))
                                              (QCDR #13#)
                                            (|check_union2| (QEQCAR #13# 2)
                                                            (|Record|
                                                             (|:| |txt|
                                                                  (|String|))
                                                             (|:| |siz|
                                                                  (|NonNegativeInteger|))
                                                             (|:| |pos|
                                                                  (QREFELT %
                                                                           6))
                                                             (|:| |np|
                                                                  (|List|
                                                                   (|String|))))
                                                            (|Union|
                                                             (|:| |points|
                                                                  (|List|
                                                                   (|List|
                                                                    (QREFELT %
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
                                                                         % 6))
                                                                   (|:| |np|
                                                                        (|List|
                                                                         (|String|)))))
                                                             (|:| |boundbox|
                                                                  (|SBoundary|
                                                                   (QREFELT %
                                                                            6)))
                                                             (|:| |trans|
                                                                  (|STransform|
                                                                   (QREFELT %
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
                                                                          %
                                                                          6)))))
                                                             (|:| |arrws|
                                                                  (|Record|
                                                                   (|:| |ln|
                                                                        (|List|
                                                                         (|List|
                                                                          (QREFELT
                                                                           %
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
                                                                    (QREFELT %
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
                                                                    (QREFELT %
                                                                             6))
                                                                   (|:| |size|
                                                                        (QREFELT
                                                                         % 6))
                                                                   (|:| |fill|
                                                                        (|Boolean|))))
                                                             (|:| |nodename|
                                                                  (|Record|
                                                                   (|:| |nme|
                                                                        (|String|))
                                                                   (|:| |node|
                                                                        %)))
                                                             (|:| |np|
                                                                  (|SceneNamedPoints|
                                                                   (QREFELT %
                                                                            6)))
                                                             (|:| |empty|
                                                                  #23#))
                                                            #13#))
                                          1))
                                        (QREFELT % 140))
                              (SPADCALL "transform"
                                        (SPADCALL
                                         (LIST "scale("
                                               (|mathObject2String|
                                                |textScale|)
                                               ","
                                               (|mathObject2String|
                                                |textScale|)
                                               ")")
                                         (QREFELT % 105))
                                        (QREFELT % 140))
                              (SPADCALL "x" (|mathObject2String| |x|)
                                        (QREFELT % 140))
                              (SPADCALL "y" (|mathObject2String| |y|)
                                        (QREFELT % 140))
                              (SPADCALL "style"
                                        (STRCONC "fill:" (QVELT |mat2| 2))
                                        (QREFELT % 140))))
                       (EXIT
                        (PROGN
                         (LETT #9#
                               (SPADCALL |nodeName|
                                         (QVELT
                                          (PROG2 (LETT #13# (QVELT |n| 2))
                                              (QCDR #13#)
                                            (|check_union2| (QEQCAR #13# 2)
                                                            (|Record|
                                                             (|:| |txt|
                                                                  (|String|))
                                                             (|:| |siz|
                                                                  (|NonNegativeInteger|))
                                                             (|:| |pos|
                                                                  (QREFELT %
                                                                           6))
                                                             (|:| |np|
                                                                  (|List|
                                                                   (|String|))))
                                                            (|Union|
                                                             (|:| |points|
                                                                  (|List|
                                                                   (|List|
                                                                    (QREFELT %
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
                                                                         % 6))
                                                                   (|:| |np|
                                                                        (|List|
                                                                         (|String|)))))
                                                             (|:| |boundbox|
                                                                  (|SBoundary|
                                                                   (QREFELT %
                                                                            6)))
                                                             (|:| |trans|
                                                                  (|STransform|
                                                                   (QREFELT %
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
                                                                          %
                                                                          6)))))
                                                             (|:| |arrws|
                                                                  (|Record|
                                                                   (|:| |ln|
                                                                        (|List|
                                                                         (|List|
                                                                          (QREFELT
                                                                           %
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
                                                                    (QREFELT %
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
                                                                    (QREFELT %
                                                                             6))
                                                                   (|:| |size|
                                                                        (QREFELT
                                                                         % 6))
                                                                   (|:| |fill|
                                                                        (|Boolean|))))
                                                             (|:| |nodename|
                                                                  (|Record|
                                                                   (|:| |nme|
                                                                        (|String|))
                                                                   (|:| |node|
                                                                        %)))
                                                             (|:| |np|
                                                                  (|SceneNamedPoints|
                                                                   (QREFELT %
                                                                            6)))
                                                             (|:| |empty|
                                                                  #23#))
                                                            #13#))
                                          0)
                                         |nodeAtts| (QREFELT % 151)))
                         (GO #25#))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'TRANSFORM)
                  (SEQ (LETT |nodeName| "g")
                       (COND
                        ((NULL (QEQCAR (QVELT |n| 2) 4))
                         (|error|
                          "toSVG parameter type not valid for trans node")))
                       (EXIT
                        (LETT |tran2|
                              (SPADCALL
                               (PROG2 (LETT #12# (QVELT |n| 2))
                                   (QCDR #12#)
                                 (|check_union2| (QEQCAR #12# 4)
                                                 (|STransform| (QREFELT % 6))
                                                 (|Union|
                                                  (|:| |points|
                                                       (|List|
                                                        (|List|
                                                         (QREFELT % 6))))
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
                                                             (QREFELT % 6))
                                                        (|:| |np|
                                                             (|List|
                                                              (|String|)))))
                                                  (|:| |boundbox|
                                                       (|SBoundary|
                                                        (QREFELT % 6)))
                                                  (|:| |trans|
                                                       (|STransform|
                                                        (QREFELT % 6)))
                                                  (|:| |ifs|
                                                       (|Record|
                                                        (|:| |inx|
                                                             (|List|
                                                              (|List|
                                                               (|NonNegativeInteger|))))
                                                        (|:| |pts|
                                                             (|List|
                                                              (QREFELT % 6)))))
                                                  (|:| |arrws|
                                                       (|Record|
                                                        (|:| |ln|
                                                             (|List|
                                                              (|List|
                                                               (QREFELT % 6))))
                                                        (|:| |mode| (|Symbol|))
                                                        (|:| |size|
                                                             (|DoubleFloat|))))
                                                  (|:| |arrw|
                                                       (|Record|
                                                        (|:| |st| (|String|))
                                                        (|:| |en| (|String|))
                                                        (|:| |offset|
                                                             (QREFELT % 6))
                                                        (|:| |mode| (|Symbol|))
                                                        (|:| |size|
                                                             (|DoubleFloat|))))
                                                  (|:| |shpe|
                                                       (|Record|
                                                        (|:| |shptype|
                                                             (|Symbol|))
                                                        (|:| |centre|
                                                             (QREFELT % 6))
                                                        (|:| |size|
                                                             (QREFELT % 6))
                                                        (|:| |fill|
                                                             (|Boolean|))))
                                                  (|:| |nodename|
                                                       (|Record|
                                                        (|:| |nme| (|String|))
                                                        (|:| |node| %)))
                                                  (|:| |np|
                                                       (|SceneNamedPoints|
                                                        (QREFELT % 6)))
                                                  (|:| |empty| #23#))
                                                 #12#))
                               |tran| (QREFELT % 153)))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'CLIP)
                  (SEQ (LETT |nodeName| "g") (LETT |clipEn2| 'T)
                       (COND
                        ((NULL (QEQCAR (QVELT |n| 2) 3))
                         (|error|
                          "toSVG parameter type not valid for clip node")))
                       (EXIT
                        (LETT |bb2|
                              (PROG2 (LETT #11# (QVELT |n| 2))
                                  (QCDR #11#)
                                (|check_union2| (QEQCAR #11# 3)
                                                (|SBoundary| (QREFELT % 6))
                                                (|Union|
                                                 (|:| |points|
                                                      (|List|
                                                       (|List| (QREFELT % 6))))
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
                                                            (QREFELT % 6))
                                                       (|:| |np|
                                                            (|List|
                                                             (|String|)))))
                                                 (|:| |boundbox|
                                                      (|SBoundary|
                                                       (QREFELT % 6)))
                                                 (|:| |trans|
                                                      (|STransform|
                                                       (QREFELT % 6)))
                                                 (|:| |ifs|
                                                      (|Record|
                                                       (|:| |inx|
                                                            (|List|
                                                             (|List|
                                                              (|NonNegativeInteger|))))
                                                       (|:| |pts|
                                                            (|List|
                                                             (QREFELT % 6)))))
                                                 (|:| |arrws|
                                                      (|Record|
                                                       (|:| |ln|
                                                            (|List|
                                                             (|List|
                                                              (QREFELT % 6))))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                                 (|:| |arrw|
                                                      (|Record|
                                                       (|:| |st| (|String|))
                                                       (|:| |en| (|String|))
                                                       (|:| |offset|
                                                            (QREFELT % 6))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                                 (|:| |shpe|
                                                      (|Record|
                                                       (|:| |shptype|
                                                            (|Symbol|))
                                                       (|:| |centre|
                                                            (QREFELT % 6))
                                                       (|:| |size|
                                                            (QREFELT % 6))
                                                       (|:| |fill|
                                                            (|Boolean|))))
                                                 (|:| |nodename|
                                                      (|Record|
                                                       (|:| |nme| (|String|))
                                                       (|:| |node| %)))
                                                 (|:| |np|
                                                      (|SceneNamedPoints|
                                                       (QREFELT % 6)))
                                                 (|:| |empty| #23#))
                                                #11#)))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'IFS)
                  (SEQ (LETT |nodeName| "path")
                       (COND
                        ((NULL (QEQCAR (QVELT |n| 2) 5))
                         (|error|
                          "toSVG parameter type not valid for ifs node")))
                       (LETT |nodeAtts|
                             (LIST
                              (SPADCALL "d"
                                        (|SCENE;faceString|
                                         (PROG2 (LETT #10# (QVELT |n| 2))
                                             (QCDR #10#)
                                           (|check_union2| (QEQCAR #10# 5)
                                                           (|Record|
                                                            (|:| |inx|
                                                                 (|List|
                                                                  (|List|
                                                                   (|NonNegativeInteger|))))
                                                            (|:| |pts|
                                                                 (|List|
                                                                  (QREFELT %
                                                                           6))))
                                                           (|Union|
                                                            (|:| |points|
                                                                 (|List|
                                                                  (|List|
                                                                   (QREFELT %
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
                                                                        % 6))
                                                                  (|:| |np|
                                                                       (|List|
                                                                        (|String|)))))
                                                            (|:| |boundbox|
                                                                 (|SBoundary|
                                                                  (QREFELT %
                                                                           6)))
                                                            (|:| |trans|
                                                                 (|STransform|
                                                                  (QREFELT %
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
                                                                         %
                                                                         6)))))
                                                            (|:| |arrws|
                                                                 (|Record|
                                                                  (|:| |ln|
                                                                       (|List|
                                                                        (|List|
                                                                         (QREFELT
                                                                          %
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
                                                                        % 6))
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
                                                                        % 6))
                                                                  (|:| |size|
                                                                       (QREFELT
                                                                        % 6))
                                                                  (|:| |fill|
                                                                       (|Boolean|))))
                                                            (|:| |nodename|
                                                                 (|Record|
                                                                  (|:| |nme|
                                                                       (|String|))
                                                                  (|:| |node|
                                                                       %)))
                                                            (|:| |np|
                                                                 (|SceneNamedPoints|
                                                                  (QREFELT %
                                                                           6)))
                                                            (|:| |empty| #23#))
                                                           #10#))
                                         |tran2| |bb2| |scale2| |clipEn2| %)
                                        (QREFELT % 140))
                              (SPADCALL "fill" (QVELT |mat2| 2)
                                        (QREFELT % 140))
                              (SPADCALL "stroke" (QVELT |mat2| 1)
                                        (QREFELT % 140))
                              (SPADCALL "stroke-width"
                                        (|mathObject2String| (QVELT |mat2| 0))
                                        (QREFELT % 140))))
                       (EXIT
                        (PROGN
                         (LETT #9#
                               (SPADCALL |nodeName| NIL |nodeAtts|
                                         (QREFELT % 143)))
                         (GO #25#))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'ARROWS)
                  (SEQ (LETT |nodeName| "g")
                       (COND
                        ((NULL (QEQCAR (QVELT |n| 2) 6))
                         (|error|
                          "toSVG parameter type not valid for arrws node")))
                       (EXIT
                        (LETT |nodeEles|
                              (|SCENE;lineArrow|
                               (QVELT
                                (PROG2 (LETT #8# (QVELT |n| 2))
                                    (QCDR #8#)
                                  (|check_union2| (QEQCAR #8# 6)
                                                  (|Record|
                                                   (|:| |ln|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT % 6))))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|)))
                                                  (|Union|
                                                   (|:| |points|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT % 6))))
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
                                                              (QREFELT % 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                                   (|:| |boundbox|
                                                        (|SBoundary|
                                                         (QREFELT % 6)))
                                                   (|:| |trans|
                                                        (|STransform|
                                                         (QREFELT % 6)))
                                                   (|:| |ifs|
                                                        (|Record|
                                                         (|:| |inx|
                                                              (|List|
                                                               (|List|
                                                                (|NonNegativeInteger|))))
                                                         (|:| |pts|
                                                              (|List|
                                                               (QREFELT %
                                                                        6)))))
                                                   (|:| |arrws|
                                                        (|Record|
                                                         (|:| |ln|
                                                              (|List|
                                                               (|List|
                                                                (QREFELT %
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
                                                              (QREFELT % 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                                   (|:| |shpe|
                                                        (|Record|
                                                         (|:| |shptype|
                                                              (|Symbol|))
                                                         (|:| |centre|
                                                              (QREFELT % 6))
                                                         (|:| |size|
                                                              (QREFELT % 6))
                                                         (|:| |fill|
                                                              (|Boolean|))))
                                                   (|:| |nodename|
                                                        (|Record|
                                                         (|:| |nme| (|String|))
                                                         (|:| |node| %)))
                                                   (|:| |np|
                                                        (|SceneNamedPoints|
                                                         (QREFELT % 6)))
                                                   (|:| |empty| #23#))
                                                  #8#))
                                0)
                               |tran2| |bb2| |mat2| |scale2| |clipEn2|
                               (QVELT
                                (PROG2 (LETT #8# (QVELT |n| 2))
                                    (QCDR #8#)
                                  (|check_union2| (QEQCAR #8# 6)
                                                  (|Record|
                                                   (|:| |ln|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT % 6))))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|)))
                                                  (|Union|
                                                   (|:| |points|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT % 6))))
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
                                                              (QREFELT % 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                                   (|:| |boundbox|
                                                        (|SBoundary|
                                                         (QREFELT % 6)))
                                                   (|:| |trans|
                                                        (|STransform|
                                                         (QREFELT % 6)))
                                                   (|:| |ifs|
                                                        (|Record|
                                                         (|:| |inx|
                                                              (|List|
                                                               (|List|
                                                                (|NonNegativeInteger|))))
                                                         (|:| |pts|
                                                              (|List|
                                                               (QREFELT %
                                                                        6)))))
                                                   (|:| |arrws|
                                                        (|Record|
                                                         (|:| |ln|
                                                              (|List|
                                                               (|List|
                                                                (QREFELT %
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
                                                              (QREFELT % 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                                   (|:| |shpe|
                                                        (|Record|
                                                         (|:| |shptype|
                                                              (|Symbol|))
                                                         (|:| |centre|
                                                              (QREFELT % 6))
                                                         (|:| |size|
                                                              (QREFELT % 6))
                                                         (|:| |fill|
                                                              (|Boolean|))))
                                                   (|:| |nodename|
                                                        (|Record|
                                                         (|:| |nme| (|String|))
                                                         (|:| |node| %)))
                                                   (|:| |np|
                                                        (|SceneNamedPoints|
                                                         (QREFELT % 6)))
                                                   (|:| |empty| #23#))
                                                  #8#))
                                1)
                               (QVELT
                                (PROG2 (LETT #8# (QVELT |n| 2))
                                    (QCDR #8#)
                                  (|check_union2| (QEQCAR #8# 6)
                                                  (|Record|
                                                   (|:| |ln|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT % 6))))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|)))
                                                  (|Union|
                                                   (|:| |points|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT % 6))))
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
                                                              (QREFELT % 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                                   (|:| |boundbox|
                                                        (|SBoundary|
                                                         (QREFELT % 6)))
                                                   (|:| |trans|
                                                        (|STransform|
                                                         (QREFELT % 6)))
                                                   (|:| |ifs|
                                                        (|Record|
                                                         (|:| |inx|
                                                              (|List|
                                                               (|List|
                                                                (|NonNegativeInteger|))))
                                                         (|:| |pts|
                                                              (|List|
                                                               (QREFELT %
                                                                        6)))))
                                                   (|:| |arrws|
                                                        (|Record|
                                                         (|:| |ln|
                                                              (|List|
                                                               (|List|
                                                                (QREFELT %
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
                                                              (QREFELT % 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                                   (|:| |shpe|
                                                        (|Record|
                                                         (|:| |shptype|
                                                              (|Symbol|))
                                                         (|:| |centre|
                                                              (QREFELT % 6))
                                                         (|:| |size|
                                                              (QREFELT % 6))
                                                         (|:| |fill|
                                                              (|Boolean|))))
                                                   (|:| |nodename|
                                                        (|Record|
                                                         (|:| |nme| (|String|))
                                                         (|:| |node| %)))
                                                   (|:| |np|
                                                        (|SceneNamedPoints|
                                                         (QREFELT % 6)))
                                                   (|:| |empty| #23#))
                                                  #8#))
                                2)
                               %))))))
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
                                               (PROG2 (LETT #5# (QVELT |n| 2))
                                                   (QCDR #5#)
                                                 (|check_union2| (QEQCAR #5# 7)
                                                                 (|Record|
                                                                  (|:| |st|
                                                                       (|String|))
                                                                  (|:| |en|
                                                                       (|String|))
                                                                  (|:| |offset|
                                                                       (QREFELT
                                                                        % 6))
                                                                  (|:| |mode|
                                                                       (|Symbol|))
                                                                  (|:| |size|
                                                                       (|DoubleFloat|)))
                                                                 (|Union|
                                                                  (|:| |points|
                                                                       (|List|
                                                                        (|List|
                                                                         (QREFELT
                                                                          %
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
                                                                          % 6))
                                                                        (|:|
                                                                         |np|
                                                                         (|List|
                                                                          (|String|)))))
                                                                  (|:|
                                                                   |boundbox|
                                                                   (|SBoundary|
                                                                    (QREFELT %
                                                                             6)))
                                                                  (|:| |trans|
                                                                       (|STransform|
                                                                        (QREFELT
                                                                         % 6)))
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
                                                                           %
                                                                           6)))))
                                                                  (|:| |arrws|
                                                                       (|Record|
                                                                        (|:|
                                                                         |ln|
                                                                         (|List|
                                                                          (|List|
                                                                           (QREFELT
                                                                            %
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
                                                                          % 6))
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
                                                                          % 6))
                                                                        (|:|
                                                                         |size|
                                                                         (QREFELT
                                                                          % 6))
                                                                        (|:|
                                                                         |fill|
                                                                         (|Boolean|))))
                                                                  (|:|
                                                                   |nodename|
                                                                   (|Record|
                                                                    (|:| |nme|
                                                                         (|String|))
                                                                    (|:| |node|
                                                                         %)))
                                                                  (|:| |np|
                                                                       (|SceneNamedPoints|
                                                                        (QREFELT
                                                                         % 6)))
                                                                  (|:| |empty|
                                                                       #23#))
                                                                 #5#))
                                               0)
                                              (QREFELT % 150))
                                    (QVELT
                                     (PROG2 (LETT #5# (QVELT |n| 2))
                                         (QCDR #5#)
                                       (|check_union2| (QEQCAR #5# 7)
                                                       (|Record|
                                                        (|:| |st| (|String|))
                                                        (|:| |en| (|String|))
                                                        (|:| |offset|
                                                             (QREFELT % 6))
                                                        (|:| |mode| (|Symbol|))
                                                        (|:| |size|
                                                             (|DoubleFloat|)))
                                                       (|Union|
                                                        (|:| |points|
                                                             (|List|
                                                              (|List|
                                                               (QREFELT % 6))))
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
                                                                   (QREFELT %
                                                                            6))
                                                              (|:| |np|
                                                                   (|List|
                                                                    (|String|)))))
                                                        (|:| |boundbox|
                                                             (|SBoundary|
                                                              (QREFELT % 6)))
                                                        (|:| |trans|
                                                             (|STransform|
                                                              (QREFELT % 6)))
                                                        (|:| |ifs|
                                                             (|Record|
                                                              (|:| |inx|
                                                                   (|List|
                                                                    (|List|
                                                                     (|NonNegativeInteger|))))
                                                              (|:| |pts|
                                                                   (|List|
                                                                    (QREFELT %
                                                                             6)))))
                                                        (|:| |arrws|
                                                             (|Record|
                                                              (|:| |ln|
                                                                   (|List|
                                                                    (|List|
                                                                     (QREFELT %
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
                                                                   (QREFELT %
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
                                                                   (QREFELT %
                                                                            6))
                                                              (|:| |size|
                                                                   (QREFELT %
                                                                            6))
                                                              (|:| |fill|
                                                                   (|Boolean|))))
                                                        (|:| |nodename|
                                                             (|Record|
                                                              (|:| |nme|
                                                                   (|String|))
                                                              (|:| |node| %)))
                                                        (|:| |np|
                                                             (|SceneNamedPoints|
                                                              (QREFELT % 6)))
                                                        (|:| |empty| #23#))
                                                       #5#))
                                     2)
                                    (QREFELT % 93))
                                   (QREFELT % 134)))
                   (LETT |endPoint|
                         (SPADCALL |tran|
                                   (SPADCALL
                                    (SPADCALL |np2|
                                              (QVELT
                                               (PROG2 (LETT #5# (QVELT |n| 2))
                                                   (QCDR #5#)
                                                 (|check_union2| (QEQCAR #5# 7)
                                                                 (|Record|
                                                                  (|:| |st|
                                                                       (|String|))
                                                                  (|:| |en|
                                                                       (|String|))
                                                                  (|:| |offset|
                                                                       (QREFELT
                                                                        % 6))
                                                                  (|:| |mode|
                                                                       (|Symbol|))
                                                                  (|:| |size|
                                                                       (|DoubleFloat|)))
                                                                 (|Union|
                                                                  (|:| |points|
                                                                       (|List|
                                                                        (|List|
                                                                         (QREFELT
                                                                          %
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
                                                                          % 6))
                                                                        (|:|
                                                                         |np|
                                                                         (|List|
                                                                          (|String|)))))
                                                                  (|:|
                                                                   |boundbox|
                                                                   (|SBoundary|
                                                                    (QREFELT %
                                                                             6)))
                                                                  (|:| |trans|
                                                                       (|STransform|
                                                                        (QREFELT
                                                                         % 6)))
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
                                                                           %
                                                                           6)))))
                                                                  (|:| |arrws|
                                                                       (|Record|
                                                                        (|:|
                                                                         |ln|
                                                                         (|List|
                                                                          (|List|
                                                                           (QREFELT
                                                                            %
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
                                                                          % 6))
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
                                                                          % 6))
                                                                        (|:|
                                                                         |size|
                                                                         (QREFELT
                                                                          % 6))
                                                                        (|:|
                                                                         |fill|
                                                                         (|Boolean|))))
                                                                  (|:|
                                                                   |nodename|
                                                                   (|Record|
                                                                    (|:| |nme|
                                                                         (|String|))
                                                                    (|:| |node|
                                                                         %)))
                                                                  (|:| |np|
                                                                       (|SceneNamedPoints|
                                                                        (QREFELT
                                                                         % 6)))
                                                                  (|:| |empty|
                                                                       #23#))
                                                                 #5#))
                                               1)
                                              (QREFELT % 150))
                                    (QVELT
                                     (PROG2 (LETT #5# (QVELT |n| 2))
                                         (QCDR #5#)
                                       (|check_union2| (QEQCAR #5# 7)
                                                       (|Record|
                                                        (|:| |st| (|String|))
                                                        (|:| |en| (|String|))
                                                        (|:| |offset|
                                                             (QREFELT % 6))
                                                        (|:| |mode| (|Symbol|))
                                                        (|:| |size|
                                                             (|DoubleFloat|)))
                                                       (|Union|
                                                        (|:| |points|
                                                             (|List|
                                                              (|List|
                                                               (QREFELT % 6))))
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
                                                                   (QREFELT %
                                                                            6))
                                                              (|:| |np|
                                                                   (|List|
                                                                    (|String|)))))
                                                        (|:| |boundbox|
                                                             (|SBoundary|
                                                              (QREFELT % 6)))
                                                        (|:| |trans|
                                                             (|STransform|
                                                              (QREFELT % 6)))
                                                        (|:| |ifs|
                                                             (|Record|
                                                              (|:| |inx|
                                                                   (|List|
                                                                    (|List|
                                                                     (|NonNegativeInteger|))))
                                                              (|:| |pts|
                                                                   (|List|
                                                                    (QREFELT %
                                                                             6)))))
                                                        (|:| |arrws|
                                                             (|Record|
                                                              (|:| |ln|
                                                                   (|List|
                                                                    (|List|
                                                                     (QREFELT %
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
                                                                   (QREFELT %
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
                                                                   (QREFELT %
                                                                            6))
                                                              (|:| |size|
                                                                   (QREFELT %
                                                                            6))
                                                              (|:| |fill|
                                                                   (|Boolean|))))
                                                        (|:| |nodename|
                                                             (|Record|
                                                              (|:| |nme|
                                                                   (|String|))
                                                              (|:| |node| %)))
                                                        (|:| |np|
                                                             (|SceneNamedPoints|
                                                              (QREFELT % 6)))
                                                        (|:| |empty| #23#))
                                                       #5#))
                                     2)
                                    (QREFELT % 93))
                                   (QREFELT % 134)))
                   (LETT |startPointM|
                         (|minus_DF|
                          (|mul_DF| (SPADCALL |startPoint| (QREFELT % 81))
                                    |scale|)))
                   (LETT |endPointM|
                         (|minus_DF|
                          (|mul_DF| (SPADCALL |endPoint| (QREFELT % 81))
                                    |scale|)))
                   (COND
                    ((EQUAL
                      (QVELT
                       (PROG2 (LETT #5# (QVELT |n| 2))
                           (QCDR #5#)
                         (|check_union2| (QEQCAR #5# 7)
                                         (|Record| (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT % 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|)))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT % 6))))
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
                                                              (QREFELT % 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT % 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT % 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT % 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT % 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT % 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT % 6))
                                                (|:| |size| (QREFELT % 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| %)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT % 6)))
                                          (|:| |empty| #23#))
                                         #5#))
                       0)
                      (QVELT
                       (PROG2 (LETT #5# (QVELT |n| 2))
                           (QCDR #5#)
                         (|check_union2| (QEQCAR #5# 7)
                                         (|Record| (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT % 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|)))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT % 6))))
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
                                                              (QREFELT % 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT % 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT % 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT % 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT % 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT % 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT % 6))
                                                (|:| |size| (QREFELT % 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| %)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT % 6)))
                                          (|:| |empty| #23#))
                                         #5#))
                       1))
                     (LETT |ptStr|
                           (SPADCALL
                            (LIST "M"
                                  (|mathObject2String|
                                   (|mul_DF|
                                    (SPADCALL |startPoint| (QREFELT % 80))
                                    |scale|))
                                  "," (|mathObject2String| |startPointM|)
                                  "c -50,25 -50,-50 0,-25")
                            (QREFELT % 105))))
                    (#24#
                     (LETT |ptStr|
                           (SPADCALL
                            (LIST "M"
                                  (|mathObject2String|
                                   (|mul_DF|
                                    (SPADCALL |startPoint| (QREFELT % 80))
                                    |scale|))
                                  "," (|mathObject2String| |startPointM|) "L"
                                  (|mathObject2String|
                                   (|mul_DF|
                                    (SPADCALL |endPoint| (QREFELT % 80))
                                    |scale|))
                                  "," (|mathObject2String| |endPointM|))
                            (QREFELT % 105)))))
                   (LETT |linWidth|
                         (QVELT
                          (PROG2 (LETT #5# (QVELT |n| 2))
                              (QCDR #5#)
                            (|check_union2| (QEQCAR #5# 7)
                                            (|Record| (|:| |st| (|String|))
                                                      (|:| |en| (|String|))
                                                      (|:| |offset|
                                                           (QREFELT % 6))
                                                      (|:| |mode| (|Symbol|))
                                                      (|:| |size|
                                                           (|DoubleFloat|)))
                                            (|Union|
                                             (|:| |points|
                                                  (|List|
                                                   (|List| (QREFELT % 6))))
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
                                                   (|:| |pos| (QREFELT % 6))
                                                   (|:| |np|
                                                        (|List| (|String|)))))
                                             (|:| |boundbox|
                                                  (|SBoundary| (QREFELT % 6)))
                                             (|:| |trans|
                                                  (|STransform| (QREFELT % 6)))
                                             (|:| |ifs|
                                                  (|Record|
                                                   (|:| |inx|
                                                        (|List|
                                                         (|List|
                                                          (|NonNegativeInteger|))))
                                                   (|:| |pts|
                                                        (|List|
                                                         (QREFELT % 6)))))
                                             (|:| |arrws|
                                                  (|Record|
                                                   (|:| |ln|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT % 6))))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |arrw|
                                                  (|Record|
                                                   (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT % 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |shpe|
                                                  (|Record|
                                                   (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT % 6))
                                                   (|:| |size| (QREFELT % 6))
                                                   (|:| |fill| (|Boolean|))))
                                             (|:| |nodename|
                                                  (|Record|
                                                   (|:| |nme| (|String|))
                                                   (|:| |node| %)))
                                             (|:| |np|
                                                  (|SceneNamedPoints|
                                                   (QREFELT % 6)))
                                             (|:| |empty| #23#))
                                            #5#))
                          4))
                   (COND
                    ((EQUAL
                      (QVELT
                       (PROG2 (LETT #5# (QVELT |n| 2))
                           (QCDR #5#)
                         (|check_union2| (QEQCAR #5# 7)
                                         (|Record| (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT % 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|)))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT % 6))))
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
                                                              (QREFELT % 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT % 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT % 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT % 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT % 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT % 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT % 6))
                                                (|:| |size| (QREFELT % 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| %)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT % 6)))
                                          (|:| |empty| #23#))
                                         #5#))
                       3)
                      '|proportional|)
                     (LETT |linWidth|
                           (|mul_DF|
                            (SPADCALL
                             (SPADCALL (SPADCALL |bb2| (QREFELT % 38))
                                       (SPADCALL |bb2| (QREFELT % 39))
                                       (QREFELT % 40))
                             (QREFELT % 80))
                            (QVELT
                             (PROG2 (LETT #5# (QVELT |n| 2))
                                 (QCDR #5#)
                               (|check_union2| (QEQCAR #5# 7)
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT % 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|)))
                                               (|Union|
                                                (|:| |points|
                                                     (|List|
                                                      (|List| (QREFELT % 6))))
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
                                                      (|:| |pos| (QREFELT % 6))
                                                      (|:| |np|
                                                           (|List|
                                                            (|String|)))))
                                                (|:| |boundbox|
                                                     (|SBoundary|
                                                      (QREFELT % 6)))
                                                (|:| |trans|
                                                     (|STransform|
                                                      (QREFELT % 6)))
                                                (|:| |ifs|
                                                     (|Record|
                                                      (|:| |inx|
                                                           (|List|
                                                            (|List|
                                                             (|NonNegativeInteger|))))
                                                      (|:| |pts|
                                                           (|List|
                                                            (QREFELT % 6)))))
                                                (|:| |arrws|
                                                     (|Record|
                                                      (|:| |ln|
                                                           (|List|
                                                            (|List|
                                                             (QREFELT % 6))))
                                                      (|:| |mode| (|Symbol|))
                                                      (|:| |size|
                                                           (|DoubleFloat|))))
                                                (|:| |arrw|
                                                     (|Record|
                                                      (|:| |st| (|String|))
                                                      (|:| |en| (|String|))
                                                      (|:| |offset|
                                                           (QREFELT % 6))
                                                      (|:| |mode| (|Symbol|))
                                                      (|:| |size|
                                                           (|DoubleFloat|))))
                                                (|:| |shpe|
                                                     (|Record|
                                                      (|:| |shptype|
                                                           (|Symbol|))
                                                      (|:| |centre|
                                                           (QREFELT % 6))
                                                      (|:| |size|
                                                           (QREFELT % 6))
                                                      (|:| |fill|
                                                           (|Boolean|))))
                                                (|:| |nodename|
                                                     (|Record|
                                                      (|:| |nme| (|String|))
                                                      (|:| |node| %)))
                                                (|:| |np|
                                                     (|SceneNamedPoints|
                                                      (QREFELT % 6)))
                                                (|:| |empty| #23#))
                                               #5#))
                             4)))))
                   (COND
                    ((EQUAL
                      (QVELT
                       (PROG2 (LETT #5# (QVELT |n| 2))
                           (QCDR #5#)
                         (|check_union2| (QEQCAR #5# 7)
                                         (|Record| (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT % 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|)))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT % 6))))
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
                                                              (QREFELT % 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT % 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT % 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT % 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT % 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT % 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT % 6))
                                                (|:| |size| (QREFELT % 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| %)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT % 6)))
                                          (|:| |empty| #23#))
                                         #5#))
                       3)
                      '|variable|)
                     (LETT |linWidth|
                           (|mul_DF|
                            (SPADCALL |startPoint| |endPoint| (QREFELT % 137))
                            (QVELT
                             (PROG2 (LETT #5# (QVELT |n| 2))
                                 (QCDR #5#)
                               (|check_union2| (QEQCAR #5# 7)
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT % 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|)))
                                               (|Union|
                                                (|:| |points|
                                                     (|List|
                                                      (|List| (QREFELT % 6))))
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
                                                      (|:| |pos| (QREFELT % 6))
                                                      (|:| |np|
                                                           (|List|
                                                            (|String|)))))
                                                (|:| |boundbox|
                                                     (|SBoundary|
                                                      (QREFELT % 6)))
                                                (|:| |trans|
                                                     (|STransform|
                                                      (QREFELT % 6)))
                                                (|:| |ifs|
                                                     (|Record|
                                                      (|:| |inx|
                                                           (|List|
                                                            (|List|
                                                             (|NonNegativeInteger|))))
                                                      (|:| |pts|
                                                           (|List|
                                                            (QREFELT % 6)))))
                                                (|:| |arrws|
                                                     (|Record|
                                                      (|:| |ln|
                                                           (|List|
                                                            (|List|
                                                             (QREFELT % 6))))
                                                      (|:| |mode| (|Symbol|))
                                                      (|:| |size|
                                                           (|DoubleFloat|))))
                                                (|:| |arrw|
                                                     (|Record|
                                                      (|:| |st| (|String|))
                                                      (|:| |en| (|String|))
                                                      (|:| |offset|
                                                           (QREFELT % 6))
                                                      (|:| |mode| (|Symbol|))
                                                      (|:| |size|
                                                           (|DoubleFloat|))))
                                                (|:| |shpe|
                                                     (|Record|
                                                      (|:| |shptype|
                                                           (|Symbol|))
                                                      (|:| |centre|
                                                           (QREFELT % 6))
                                                      (|:| |size|
                                                           (QREFELT % 6))
                                                      (|:| |fill|
                                                           (|Boolean|))))
                                                (|:| |nodename|
                                                     (|Record|
                                                      (|:| |nme| (|String|))
                                                      (|:| |node| %)))
                                                (|:| |np|
                                                     (|SceneNamedPoints|
                                                      (QREFELT % 6)))
                                                (|:| |empty| #23#))
                                               #5#))
                             4)))))
                   (LETT |nodeAtts|
                         (LIST (SPADCALL "d" |ptStr| (QREFELT % 140))
                               (SPADCALL "fill" "none" (QREFELT % 140))
                               (SPADCALL "stroke" (QVELT |mat| 1)
                                         (QREFELT % 140))
                               (SPADCALL "stroke-width"
                                         (|mathObject2String| |linWidth|)
                                         (QREFELT % 140))
                               (SPADCALL "style" "marker-end:url(#Arrow)"
                                         (QREFELT % 140))))
                   (LETT |nodeEles|
                         (LIST
                          (SPADCALL "path" NIL |nodeAtts| (QREFELT % 143))))
                   (EXIT (LETT |nodeName| "g")))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'NAMEDPOINTS)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 10))
                     (|error| "toSVG parameter type not valid for np node")))
                   (SPADCALL |np2| "points"
                             (PROG2 (LETT #4# (QVELT |n| 2))
                                 (QCDR #4#)
                               (|check_union2| (QEQCAR #4# 10)
                                               (|SceneNamedPoints|
                                                (QREFELT % 6))
                                               (|Union|
                                                (|:| |points|
                                                     (|List|
                                                      (|List| (QREFELT % 6))))
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
                                                      (|:| |pos| (QREFELT % 6))
                                                      (|:| |np|
                                                           (|List|
                                                            (|String|)))))
                                                (|:| |boundbox|
                                                     (|SBoundary|
                                                      (QREFELT % 6)))
                                                (|:| |trans|
                                                     (|STransform|
                                                      (QREFELT % 6)))
                                                (|:| |ifs|
                                                     (|Record|
                                                      (|:| |inx|
                                                           (|List|
                                                            (|List|
                                                             (|NonNegativeInteger|))))
                                                      (|:| |pts|
                                                           (|List|
                                                            (QREFELT % 6)))))
                                                (|:| |arrws|
                                                     (|Record|
                                                      (|:| |ln|
                                                           (|List|
                                                            (|List|
                                                             (QREFELT % 6))))
                                                      (|:| |mode| (|Symbol|))
                                                      (|:| |size|
                                                           (|DoubleFloat|))))
                                                (|:| |arrw|
                                                     (|Record|
                                                      (|:| |st| (|String|))
                                                      (|:| |en| (|String|))
                                                      (|:| |offset|
                                                           (QREFELT % 6))
                                                      (|:| |mode| (|Symbol|))
                                                      (|:| |size|
                                                           (|DoubleFloat|))))
                                                (|:| |shpe|
                                                     (|Record|
                                                      (|:| |shptype|
                                                           (|Symbol|))
                                                      (|:| |centre|
                                                           (QREFELT % 6))
                                                      (|:| |size|
                                                           (QREFELT % 6))
                                                      (|:| |fill|
                                                           (|Boolean|))))
                                                (|:| |nodename|
                                                     (|Record|
                                                      (|:| |nme| (|String|))
                                                      (|:| |node| %)))
                                                (|:| |np|
                                                     (|SceneNamedPoints|
                                                      (QREFELT % 6)))
                                                (|:| |empty| #23#))
                                               #4#))
                             (QREFELT % 154))
                   (EXIT (LETT |nodeName| "g")))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'DEF)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 9))
                     (|error| "toSVG parameter type not valid for def node")))
                   (LETT |nn|
                         (PROG2 (LETT #3# (QVELT |n| 2))
                             (QCDR #3#)
                           (|check_union2| (QEQCAR #3# 9)
                                           (|Record| (|:| |nme| (|String|))
                                                     (|:| |node| %))
                                           (|Union|
                                            (|:| |points|
                                                 (|List|
                                                  (|List| (QREFELT % 6))))
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
                                                  (|:| |pos| (QREFELT % 6))
                                                  (|:| |np|
                                                       (|List| (|String|)))))
                                            (|:| |boundbox|
                                                 (|SBoundary| (QREFELT % 6)))
                                            (|:| |trans|
                                                 (|STransform| (QREFELT % 6)))
                                            (|:| |ifs|
                                                 (|Record|
                                                  (|:| |inx|
                                                       (|List|
                                                        (|List|
                                                         (|NonNegativeInteger|))))
                                                  (|:| |pts|
                                                       (|List|
                                                        (QREFELT % 6)))))
                                            (|:| |arrws|
                                                 (|Record|
                                                  (|:| |ln|
                                                       (|List|
                                                        (|List|
                                                         (QREFELT % 6))))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |arrw|
                                                 (|Record|
                                                  (|:| |st| (|String|))
                                                  (|:| |en| (|String|))
                                                  (|:| |offset| (QREFELT % 6))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |shpe|
                                                 (|Record|
                                                  (|:| |shptype| (|Symbol|))
                                                  (|:| |centre| (QREFELT % 6))
                                                  (|:| |size| (QREFELT % 6))
                                                  (|:| |fill| (|Boolean|))))
                                            (|:| |nodename|
                                                 (|Record|
                                                  (|:| |nme| (|String|))
                                                  (|:| |node| %)))
                                            (|:| |np|
                                                 (|SceneNamedPoints|
                                                  (QREFELT % 6)))
                                            (|:| |empty| #23#))
                                           #3#)))
                   (LETT |name| (QCAR |nn|)) (LETT |nde| (QCDR |nn|))
                   (LETT |nodeName| "g")
                   (SPADCALL |np2| |name| |nde| (QREFELT % 156))
                   (LETT |xch|
                         (SPADCALL |nde| |mat2| |tran2| |bb2| |scale2|
                                   |clipEn2| |useInteger| |np2|
                                   (QREFELT % 157)))
                   (EXIT
                    (COND
                     ((NULL (SPADCALL |xch| (QREFELT % 152)))
                      (LETT |nodeEles|
                            (SPADCALL |nodeEles| |xch| (QREFELT % 145)))))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'USE)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 9))
                     (|error| "toSVG parameter type not valid for use node")))
                   (LETT |nn|
                         (PROG2 (LETT #3# (QVELT |n| 2))
                             (QCDR #3#)
                           (|check_union2| (QEQCAR #3# 9)
                                           (|Record| (|:| |nme| (|String|))
                                                     (|:| |node| %))
                                           (|Union|
                                            (|:| |points|
                                                 (|List|
                                                  (|List| (QREFELT % 6))))
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
                                                  (|:| |pos| (QREFELT % 6))
                                                  (|:| |np|
                                                       (|List| (|String|)))))
                                            (|:| |boundbox|
                                                 (|SBoundary| (QREFELT % 6)))
                                            (|:| |trans|
                                                 (|STransform| (QREFELT % 6)))
                                            (|:| |ifs|
                                                 (|Record|
                                                  (|:| |inx|
                                                       (|List|
                                                        (|List|
                                                         (|NonNegativeInteger|))))
                                                  (|:| |pts|
                                                       (|List|
                                                        (QREFELT % 6)))))
                                            (|:| |arrws|
                                                 (|Record|
                                                  (|:| |ln|
                                                       (|List|
                                                        (|List|
                                                         (QREFELT % 6))))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |arrw|
                                                 (|Record|
                                                  (|:| |st| (|String|))
                                                  (|:| |en| (|String|))
                                                  (|:| |offset| (QREFELT % 6))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |shpe|
                                                 (|Record|
                                                  (|:| |shptype| (|Symbol|))
                                                  (|:| |centre| (QREFELT % 6))
                                                  (|:| |size| (QREFELT % 6))
                                                  (|:| |fill| (|Boolean|))))
                                            (|:| |nodename|
                                                 (|Record|
                                                  (|:| |nme| (|String|))
                                                  (|:| |node| %)))
                                            (|:| |np|
                                                 (|SceneNamedPoints|
                                                  (QREFELT % 6)))
                                            (|:| |empty| #23#))
                                           #3#)))
                   (LETT |name| (QCAR |nn|))
                   (LETT |nde| (SPADCALL |np2| |name| (QREFELT % 158)))
                   (LETT |nodeName| "g")
                   (LETT |xch|
                         (SPADCALL |nde| |mat2| |tran2| |bb2| |scale2|
                                   |clipEn2| |useInteger| |np2|
                                   (QREFELT % 157)))
                   (EXIT
                    (COND
                     ((NULL (SPADCALL |xch| (QREFELT % 152)))
                      (LETT |nodeEles|
                            (SPADCALL |nodeEles| |xch| (QREFELT % 145)))))))))
                (EXIT
                 (COND
                  ((< (SPADCALL (QVELT |n| 1) (QREFELT % 159)) 1)
                   (SPADCALL |nodeName| |nodeEles| |nodeAtts| (QREFELT % 143)))
                  (#24#
                   (SEQ
                    (SEQ (LETT |ch| NIL) (LETT #1# (QVELT |n| 1)) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |ch| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |xch|
                                (SPADCALL |ch| |mat2| |tran2| |bb2| |scale2|
                                          |clipEn2| |useInteger| |np2|
                                          (QREFELT % 157)))
                          (EXIT
                           (COND
                            ((NULL (SPADCALL |xch| (QREFELT % 152)))
                             (LETT |nodeEles|
                                   (SPADCALL |nodeEles| |xch|
                                             (QREFELT % 145)))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (SPADCALL |nodeName| |nodeEles| |nodeAtts|
                               (QREFELT % 143)))))))))
          #25# (EXIT #9#)))) 

(SDEFUN |SCENE;writeSvg;%SV;74|
        ((|n| (%)) (|filename| (|String|)) (% (|Void|)))
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
                        1.0))
          (LETT |defaultTransform| (SPADCALL (QREFELT % 160)))
          (LETT |defaultBounds| (SPADCALL (QREFELT % 14)))
          (EXIT
           (SPADCALL
            (SPADCALL |n| |defaultMaterial| |defaultTransform| |defaultBounds|
                      1.0 NIL NIL (SPADCALL NIL NIL (QREFELT % 161))
                      (QREFELT % 157))
            |filename| (QREFELT % 163)))))) 

(SDEFUN |SCENE;writeSvgQuantised;%SV;75|
        ((|n| (%)) (|filename| (|String|)) (% (|Void|)))
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
                        1.0))
          (LETT |defaultTransform| (SPADCALL (QREFELT % 160)))
          (LETT |defaultBounds| (SPADCALL (QREFELT % 14)))
          (EXIT
           (SPADCALL
            (SPADCALL |n| |defaultMaterial| |defaultTransform| |defaultBounds|
                      1.0 NIL 'T (SPADCALL NIL NIL (QREFELT % 161))
                      (QREFELT % 157))
            |filename| (QREFELT % 163)))))) 

(SDEFUN |SCENE;boundary1|
        ((|n| (%)) (|tran| #1=(|STransform| PT)) (|scale| (|DoubleFloat|))
         (|useInteger| (|Boolean|)) (|npt| (|SceneNamedPoints| PT))
         (|fontScale| #2=(|DoubleFloat|)) (% #3=(|SBoundary| PT)))
        (SPROG
         ((|res| (|SBoundary| PT)) (|res2| #3#) (#4=#:G1050 NIL) (|ch| NIL)
          (#5=#:G1049 NIL) (|p| NIL) (#6=#:G1048 NIL) (|lp| NIL)
          (|pts2| (|List| (|List| PT))) (#7=#:G1000 NIL) (#8=#:G1047 NIL)
          (#9=#:G999 NIL) (|tran2| #1#) (#10=#:G998 NIL) (|pt2| (PT))
          (|pt1| (PT)) (#11=#:G996 NIL) (|w| #12=(|DoubleFloat|)) (|h| #12#)
          (#13=#:G1044 NIL) (#14=#:G1002 NIL) (#15=#:G1046 NIL)
          (#16=#:G1045 NIL) (|pts| (|List| (|List| PT))) (#17=#:G994 NIL)
          (|fontScale2| #2#) (|maxx| #18=(|DoubleFloat|)) (|minx| #18#)
          (|bb2| (|SBoundary| PT)) (#19=#:G997 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |res| (SPADCALL (QREFELT % 14)))
                (LETT |fontScale2| |fontScale|) (LETT |tran2| |tran|)
                (COND
                 ((EQUAL (QVELT |n| 0) 'ROOT)
                  (SEQ
                   (LETT |bb2|
                         (PROG2 (LETT #19# (QVELT |n| 2))
                             (QCDR #19#)
                           (|check_union2| (QEQCAR #19# 3)
                                           (|SBoundary| (QREFELT % 6))
                                           (|Union|
                                            (|:| |points|
                                                 (|List|
                                                  (|List| (QREFELT % 6))))
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
                                                  (|:| |pos| (QREFELT % 6))
                                                  (|:| |np|
                                                       (|List| (|String|)))))
                                            (|:| |boundbox|
                                                 (|SBoundary| (QREFELT % 6)))
                                            (|:| |trans|
                                                 (|STransform| (QREFELT % 6)))
                                            (|:| |ifs|
                                                 (|Record|
                                                  (|:| |inx|
                                                       (|List|
                                                        (|List|
                                                         (|NonNegativeInteger|))))
                                                  (|:| |pts|
                                                       (|List|
                                                        (QREFELT % 6)))))
                                            (|:| |arrws|
                                                 (|Record|
                                                  (|:| |ln|
                                                       (|List|
                                                        (|List|
                                                         (QREFELT % 6))))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |arrw|
                                                 (|Record|
                                                  (|:| |st| (|String|))
                                                  (|:| |en| (|String|))
                                                  (|:| |offset| (QREFELT % 6))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |shpe|
                                                 (|Record|
                                                  (|:| |shptype| (|Symbol|))
                                                  (|:| |centre| (QREFELT % 6))
                                                  (|:| |size| (QREFELT % 6))
                                                  (|:| |fill| (|Boolean|))))
                                            (|:| |nodename|
                                                 (|Record|
                                                  (|:| |nme| (|String|))
                                                  (|:| |node| %)))
                                            (|:| |np|
                                                 (|SceneNamedPoints|
                                                  (QREFELT % 6)))
                                            (|:| |empty| #20="empty"))
                                           #19#)))
                   (COND
                    ((NULL (SPADCALL |bb2| (QREFELT % 146)))
                     (SEQ
                      (LETT |minx|
                            (SPADCALL (SPADCALL |bb2| (QREFELT % 39))
                                      (QREFELT % 80)))
                      (LETT |maxx|
                            (SPADCALL (SPADCALL |bb2| (QREFELT % 38))
                                      (QREFELT % 80)))
                      (EXIT
                       (LETT |fontScale2|
                             (|div_DF| (|sub_DF| |maxx| |minx|)
                                       (FLOAT 1000
                                              MOST-POSITIVE-DOUBLE-FLOAT)))))))
                   (EXIT (LETT |res| (SPADCALL (QREFELT % 14)))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'GROUP)
                  (LETT |res| (SPADCALL (QREFELT % 14)))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'LINE)
                  (SEQ
                   (LETT |pts|
                         (PROG2 (LETT #17# (QVELT |n| 2))
                             (QCDR #17#)
                           (|check_union2| (QEQCAR #17# 0)
                                           (|List| (|List| (QREFELT % 6)))
                                           (|Union|
                                            (|:| |points|
                                                 (|List|
                                                  (|List| (QREFELT % 6))))
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
                                                  (|:| |pos| (QREFELT % 6))
                                                  (|:| |np|
                                                       (|List| (|String|)))))
                                            (|:| |boundbox|
                                                 (|SBoundary| (QREFELT % 6)))
                                            (|:| |trans|
                                                 (|STransform| (QREFELT % 6)))
                                            (|:| |ifs|
                                                 (|Record|
                                                  (|:| |inx|
                                                       (|List|
                                                        (|List|
                                                         (|NonNegativeInteger|))))
                                                  (|:| |pts|
                                                       (|List|
                                                        (QREFELT % 6)))))
                                            (|:| |arrws|
                                                 (|Record|
                                                  (|:| |ln|
                                                       (|List|
                                                        (|List|
                                                         (QREFELT % 6))))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |arrw|
                                                 (|Record|
                                                  (|:| |st| (|String|))
                                                  (|:| |en| (|String|))
                                                  (|:| |offset| (QREFELT % 6))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |shpe|
                                                 (|Record|
                                                  (|:| |shptype| (|Symbol|))
                                                  (|:| |centre| (QREFELT % 6))
                                                  (|:| |size| (QREFELT % 6))
                                                  (|:| |fill| (|Boolean|))))
                                            (|:| |nodename|
                                                 (|Record|
                                                  (|:| |nme| (|String|))
                                                  (|:| |node| %)))
                                            (|:| |np|
                                                 (|SceneNamedPoints|
                                                  (QREFELT % 6)))
                                            (|:| |empty| #20#))
                                           #17#)))
                   (EXIT
                    (SEQ (LETT |lp| NIL) (LETT #16# |pts|) G190
                         (COND
                          ((OR (ATOM #16#) (PROGN (LETT |lp| (CAR #16#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |p| NIL) (LETT #15# |lp|) G190
                                (COND
                                 ((OR (ATOM #15#)
                                      (PROGN (LETT |p| (CAR #15#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |res|
                                        (SPADCALL |res|
                                                  (SPADCALL |tran| |p|
                                                            (QREFELT % 134))
                                                  (QREFELT % 166)))))
                                (LETT #15# (CDR #15#)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT #16# (CDR #16#)) (GO G190) G191 (EXIT NIL))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'SHAPE)
                  (SEQ
                   (LETT |pt1|
                         (QVELT
                          (PROG2 (LETT #14# (QVELT |n| 2))
                              (QCDR #14#)
                            (|check_union2| (QEQCAR #14# 8)
                                            (|Record|
                                             (|:| |shptype| (|Symbol|))
                                             (|:| |centre| (QREFELT % 6))
                                             (|:| |size| (QREFELT % 6))
                                             (|:| |fill| (|Boolean|)))
                                            (|Union|
                                             (|:| |points|
                                                  (|List|
                                                   (|List| (QREFELT % 6))))
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
                                                   (|:| |pos| (QREFELT % 6))
                                                   (|:| |np|
                                                        (|List| (|String|)))))
                                             (|:| |boundbox|
                                                  (|SBoundary| (QREFELT % 6)))
                                             (|:| |trans|
                                                  (|STransform| (QREFELT % 6)))
                                             (|:| |ifs|
                                                  (|Record|
                                                   (|:| |inx|
                                                        (|List|
                                                         (|List|
                                                          (|NonNegativeInteger|))))
                                                   (|:| |pts|
                                                        (|List|
                                                         (QREFELT % 6)))))
                                             (|:| |arrws|
                                                  (|Record|
                                                   (|:| |ln|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT % 6))))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |arrw|
                                                  (|Record|
                                                   (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT % 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |shpe|
                                                  (|Record|
                                                   (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT % 6))
                                                   (|:| |size| (QREFELT % 6))
                                                   (|:| |fill| (|Boolean|))))
                                             (|:| |nodename|
                                                  (|Record|
                                                   (|:| |nme| (|String|))
                                                   (|:| |node| %)))
                                             (|:| |np|
                                                  (|SceneNamedPoints|
                                                   (QREFELT % 6)))
                                             (|:| |empty| #20#))
                                            #14#))
                          1))
                   (LETT |pt2|
                         (QVELT
                          (PROG2 (LETT #14# (QVELT |n| 2))
                              (QCDR #14#)
                            (|check_union2| (QEQCAR #14# 8)
                                            (|Record|
                                             (|:| |shptype| (|Symbol|))
                                             (|:| |centre| (QREFELT % 6))
                                             (|:| |size| (QREFELT % 6))
                                             (|:| |fill| (|Boolean|)))
                                            (|Union|
                                             (|:| |points|
                                                  (|List|
                                                   (|List| (QREFELT % 6))))
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
                                                   (|:| |pos| (QREFELT % 6))
                                                   (|:| |np|
                                                        (|List| (|String|)))))
                                             (|:| |boundbox|
                                                  (|SBoundary| (QREFELT % 6)))
                                             (|:| |trans|
                                                  (|STransform| (QREFELT % 6)))
                                             (|:| |ifs|
                                                  (|Record|
                                                   (|:| |inx|
                                                        (|List|
                                                         (|List|
                                                          (|NonNegativeInteger|))))
                                                   (|:| |pts|
                                                        (|List|
                                                         (QREFELT % 6)))))
                                             (|:| |arrws|
                                                  (|Record|
                                                   (|:| |ln|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT % 6))))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |arrw|
                                                  (|Record|
                                                   (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT % 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |shpe|
                                                  (|Record|
                                                   (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT % 6))
                                                   (|:| |size| (QREFELT % 6))
                                                   (|:| |fill| (|Boolean|))))
                                             (|:| |nodename|
                                                  (|Record|
                                                   (|:| |nme| (|String|))
                                                   (|:| |node| %)))
                                             (|:| |np|
                                                  (|SceneNamedPoints|
                                                   (QREFELT % 6)))
                                             (|:| |empty| #20#))
                                            #14#))
                          2))
                   (COND
                    ((EQUAL
                      (QVELT
                       (PROG2 (LETT #14# (QVELT |n| 2))
                           (QCDR #14#)
                         (|check_union2| (QEQCAR #14# 8)
                                         (|Record| (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT % 6))
                                                   (|:| |size| (QREFELT % 6))
                                                   (|:| |fill| (|Boolean|)))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT % 6))))
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
                                                              (QREFELT % 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT % 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT % 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT % 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT % 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT % 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT % 6))
                                                (|:| |size| (QREFELT % 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| %)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT % 6)))
                                          (|:| |empty| #20#))
                                         #14#))
                       0)
                      '|ellipse|)
                     (PROGN
                      (LETT #13#
                            (SPADCALL (SPADCALL |tran| |pt1| (QREFELT % 134))
                                      |pt2| (QREFELT % 167)))
                      (GO #21=#:G1043))))
                   (LETT |res|
                         (SPADCALL |res|
                                   (SPADCALL |tran| |pt1| (QREFELT % 134))
                                   (QREFELT % 166)))
                   (EXIT
                    (LETT |res|
                          (SPADCALL |res|
                                    (SPADCALL |tran|
                                              (SPADCALL |pt1| |pt2|
                                                        (QREFELT % 93))
                                              (QREFELT % 134))
                                    (QREFELT % 166)))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'MATERIAL)
                  (LETT |res| (SPADCALL (QREFELT % 14)))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'TEXT)
                  (SEQ
                   (LETT |h|
                         (|mul_DF| |fontScale|
                                   (FLOAT
                                    (QVELT
                                     (PROG2 (LETT #11# (QVELT |n| 2))
                                         (QCDR #11#)
                                       (|check_union2| (QEQCAR #11# 2)
                                                       (|Record|
                                                        (|:| |txt| (|String|))
                                                        (|:| |siz|
                                                             (|NonNegativeInteger|))
                                                        (|:| |pos|
                                                             (QREFELT % 6))
                                                        (|:| |np|
                                                             (|List|
                                                              (|String|))))
                                                       (|Union|
                                                        (|:| |points|
                                                             (|List|
                                                              (|List|
                                                               (QREFELT % 6))))
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
                                                                   (QREFELT %
                                                                            6))
                                                              (|:| |np|
                                                                   (|List|
                                                                    (|String|)))))
                                                        (|:| |boundbox|
                                                             (|SBoundary|
                                                              (QREFELT % 6)))
                                                        (|:| |trans|
                                                             (|STransform|
                                                              (QREFELT % 6)))
                                                        (|:| |ifs|
                                                             (|Record|
                                                              (|:| |inx|
                                                                   (|List|
                                                                    (|List|
                                                                     (|NonNegativeInteger|))))
                                                              (|:| |pts|
                                                                   (|List|
                                                                    (QREFELT %
                                                                             6)))))
                                                        (|:| |arrws|
                                                             (|Record|
                                                              (|:| |ln|
                                                                   (|List|
                                                                    (|List|
                                                                     (QREFELT %
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
                                                                   (QREFELT %
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
                                                                   (QREFELT %
                                                                            6))
                                                              (|:| |size|
                                                                   (QREFELT %
                                                                            6))
                                                              (|:| |fill|
                                                                   (|Boolean|))))
                                                        (|:| |nodename|
                                                             (|Record|
                                                              (|:| |nme|
                                                                   (|String|))
                                                              (|:| |node| %)))
                                                        (|:| |np|
                                                             (|SceneNamedPoints|
                                                              (QREFELT % 6)))
                                                        (|:| |empty| #20#))
                                                       #11#))
                                     1)
                                    MOST-POSITIVE-DOUBLE-FLOAT)))
                   (LETT |w|
                         (|mul_DF| (|mul_DF| (|mk_DF| 5 -1) |h|)
                                   (FLOAT
                                    (QCSIZE
                                     (QVELT
                                      (PROG2 (LETT #11# (QVELT |n| 2))
                                          (QCDR #11#)
                                        (|check_union2| (QEQCAR #11# 2)
                                                        (|Record|
                                                         (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT % 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|))))
                                                        (|Union|
                                                         (|:| |points|
                                                              (|List|
                                                               (|List|
                                                                (QREFELT %
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
                                                                    (QREFELT %
                                                                             6))
                                                               (|:| |np|
                                                                    (|List|
                                                                     (|String|)))))
                                                         (|:| |boundbox|
                                                              (|SBoundary|
                                                               (QREFELT % 6)))
                                                         (|:| |trans|
                                                              (|STransform|
                                                               (QREFELT % 6)))
                                                         (|:| |ifs|
                                                              (|Record|
                                                               (|:| |inx|
                                                                    (|List|
                                                                     (|List|
                                                                      (|NonNegativeInteger|))))
                                                               (|:| |pts|
                                                                    (|List|
                                                                     (QREFELT %
                                                                              6)))))
                                                         (|:| |arrws|
                                                              (|Record|
                                                               (|:| |ln|
                                                                    (|List|
                                                                     (|List|
                                                                      (QREFELT
                                                                       % 6))))
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
                                                                    (QREFELT %
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
                                                                    (QREFELT %
                                                                             6))
                                                               (|:| |size|
                                                                    (QREFELT %
                                                                             6))
                                                               (|:| |fill|
                                                                    (|Boolean|))))
                                                         (|:| |nodename|
                                                              (|Record|
                                                               (|:| |nme|
                                                                    (|String|))
                                                               (|:| |node| %)))
                                                         (|:| |np|
                                                              (|SceneNamedPoints|
                                                               (QREFELT % 6)))
                                                         (|:| |empty| #20#))
                                                        #11#))
                                      0))
                                    MOST-POSITIVE-DOUBLE-FLOAT)))
                   (LETT |pt1|
                         (QVELT
                          (PROG2 (LETT #11# (QVELT |n| 2))
                              (QCDR #11#)
                            (|check_union2| (QEQCAR #11# 2)
                                            (|Record| (|:| |txt| (|String|))
                                                      (|:| |siz|
                                                           (|NonNegativeInteger|))
                                                      (|:| |pos| (QREFELT % 6))
                                                      (|:| |np|
                                                           (|List|
                                                            (|String|))))
                                            (|Union|
                                             (|:| |points|
                                                  (|List|
                                                   (|List| (QREFELT % 6))))
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
                                                   (|:| |pos| (QREFELT % 6))
                                                   (|:| |np|
                                                        (|List| (|String|)))))
                                             (|:| |boundbox|
                                                  (|SBoundary| (QREFELT % 6)))
                                             (|:| |trans|
                                                  (|STransform| (QREFELT % 6)))
                                             (|:| |ifs|
                                                  (|Record|
                                                   (|:| |inx|
                                                        (|List|
                                                         (|List|
                                                          (|NonNegativeInteger|))))
                                                   (|:| |pts|
                                                        (|List|
                                                         (QREFELT % 6)))))
                                             (|:| |arrws|
                                                  (|Record|
                                                   (|:| |ln|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT % 6))))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |arrw|
                                                  (|Record|
                                                   (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT % 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |shpe|
                                                  (|Record|
                                                   (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT % 6))
                                                   (|:| |size| (QREFELT % 6))
                                                   (|:| |fill| (|Boolean|))))
                                             (|:| |nodename|
                                                  (|Record|
                                                   (|:| |nme| (|String|))
                                                   (|:| |node| %)))
                                             (|:| |np|
                                                  (|SceneNamedPoints|
                                                   (QREFELT % 6)))
                                             (|:| |empty| #20#))
                                            #11#))
                          2))
                   (LETT |res|
                         (SPADCALL |res|
                                   (SPADCALL |tran| |pt1| (QREFELT % 134))
                                   (QREFELT % 166)))
                   (LETT |pt2|
                         (SPADCALL |pt1| (SPADCALL |w| |h| (QREFELT % 82))
                                   (QREFELT % 93)))
                   (EXIT
                    (LETT |res|
                          (SPADCALL |res|
                                    (SPADCALL |tran| |pt2| (QREFELT % 134))
                                    (QREFELT % 166)))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'TRANSFORM)
                  (LETT |tran2|
                        (SPADCALL
                         (PROG2 (LETT #10# (QVELT |n| 2))
                             (QCDR #10#)
                           (|check_union2| (QEQCAR #10# 4)
                                           (|STransform| (QREFELT % 6))
                                           (|Union|
                                            (|:| |points|
                                                 (|List|
                                                  (|List| (QREFELT % 6))))
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
                                                  (|:| |pos| (QREFELT % 6))
                                                  (|:| |np|
                                                       (|List| (|String|)))))
                                            (|:| |boundbox|
                                                 (|SBoundary| (QREFELT % 6)))
                                            (|:| |trans|
                                                 (|STransform| (QREFELT % 6)))
                                            (|:| |ifs|
                                                 (|Record|
                                                  (|:| |inx|
                                                       (|List|
                                                        (|List|
                                                         (|NonNegativeInteger|))))
                                                  (|:| |pts|
                                                       (|List|
                                                        (QREFELT % 6)))))
                                            (|:| |arrws|
                                                 (|Record|
                                                  (|:| |ln|
                                                       (|List|
                                                        (|List|
                                                         (QREFELT % 6))))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |arrw|
                                                 (|Record|
                                                  (|:| |st| (|String|))
                                                  (|:| |en| (|String|))
                                                  (|:| |offset| (QREFELT % 6))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |shpe|
                                                 (|Record|
                                                  (|:| |shptype| (|Symbol|))
                                                  (|:| |centre| (QREFELT % 6))
                                                  (|:| |size| (QREFELT % 6))
                                                  (|:| |fill| (|Boolean|))))
                                            (|:| |nodename|
                                                 (|Record|
                                                  (|:| |nme| (|String|))
                                                  (|:| |node| %)))
                                            (|:| |np|
                                                 (|SceneNamedPoints|
                                                  (QREFELT % 6)))
                                            (|:| |empty| #20#))
                                           #10#))
                         |tran| (QREFELT % 153)))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'CLIP)
                  (LETT |res| (SPADCALL (QREFELT % 14)))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'IFS)
                  (SEQ
                   (LETT |pts2|
                         (QCDR
                          (PROG2 (LETT #9# (QVELT |n| 2))
                              (QCDR #9#)
                            (|check_union2| (QEQCAR #9# 5)
                                            (|Record|
                                             (|:| |inx|
                                                  (|List|
                                                   (|List|
                                                    (|NonNegativeInteger|))))
                                             (|:| |pts|
                                                  (|List| (QREFELT % 6))))
                                            (|Union|
                                             (|:| |points|
                                                  (|List|
                                                   (|List| (QREFELT % 6))))
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
                                                   (|:| |pos| (QREFELT % 6))
                                                   (|:| |np|
                                                        (|List| (|String|)))))
                                             (|:| |boundbox|
                                                  (|SBoundary| (QREFELT % 6)))
                                             (|:| |trans|
                                                  (|STransform| (QREFELT % 6)))
                                             (|:| |ifs|
                                                  (|Record|
                                                   (|:| |inx|
                                                        (|List|
                                                         (|List|
                                                          (|NonNegativeInteger|))))
                                                   (|:| |pts|
                                                        (|List|
                                                         (QREFELT % 6)))))
                                             (|:| |arrws|
                                                  (|Record|
                                                   (|:| |ln|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT % 6))))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |arrw|
                                                  (|Record|
                                                   (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT % 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |shpe|
                                                  (|Record|
                                                   (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT % 6))
                                                   (|:| |size| (QREFELT % 6))
                                                   (|:| |fill| (|Boolean|))))
                                             (|:| |nodename|
                                                  (|Record|
                                                   (|:| |nme| (|String|))
                                                   (|:| |node| %)))
                                             (|:| |np|
                                                  (|SceneNamedPoints|
                                                   (QREFELT % 6)))
                                             (|:| |empty| #20#))
                                            #9#))))
                   (EXIT
                    (SEQ (LETT |p| NIL) (LETT #8# |pts2|) G190
                         (COND
                          ((OR (ATOM #8#) (PROGN (LETT |p| (CAR #8#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (SPADCALL |res|
                                           (SPADCALL |tran| |p|
                                                     (QREFELT % 134))
                                           (QREFELT % 166)))))
                         (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'ARROWS)
                  (SEQ
                   (LETT |pts2|
                         (QVELT
                          (PROG2 (LETT #7# (QVELT |n| 2))
                              (QCDR #7#)
                            (|check_union2| (QEQCAR #7# 6)
                                            (|Record|
                                             (|:| |ln|
                                                  (|List|
                                                   (|List| (QREFELT % 6))))
                                             (|:| |mode| (|Symbol|))
                                             (|:| |size| (|DoubleFloat|)))
                                            (|Union|
                                             (|:| |points|
                                                  (|List|
                                                   (|List| (QREFELT % 6))))
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
                                                   (|:| |pos| (QREFELT % 6))
                                                   (|:| |np|
                                                        (|List| (|String|)))))
                                             (|:| |boundbox|
                                                  (|SBoundary| (QREFELT % 6)))
                                             (|:| |trans|
                                                  (|STransform| (QREFELT % 6)))
                                             (|:| |ifs|
                                                  (|Record|
                                                   (|:| |inx|
                                                        (|List|
                                                         (|List|
                                                          (|NonNegativeInteger|))))
                                                   (|:| |pts|
                                                        (|List|
                                                         (QREFELT % 6)))))
                                             (|:| |arrws|
                                                  (|Record|
                                                   (|:| |ln|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT % 6))))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |arrw|
                                                  (|Record|
                                                   (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT % 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |shpe|
                                                  (|Record|
                                                   (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT % 6))
                                                   (|:| |size| (QREFELT % 6))
                                                   (|:| |fill| (|Boolean|))))
                                             (|:| |nodename|
                                                  (|Record|
                                                   (|:| |nme| (|String|))
                                                   (|:| |node| %)))
                                             (|:| |np|
                                                  (|SceneNamedPoints|
                                                   (QREFELT % 6)))
                                             (|:| |empty| #20#))
                                            #7#))
                          0))
                   (EXIT
                    (SEQ (LETT |lp| NIL) (LETT #6# |pts2|) G190
                         (COND
                          ((OR (ATOM #6#) (PROGN (LETT |lp| (CAR #6#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |p| NIL) (LETT #5# |lp|) G190
                                (COND
                                 ((OR (ATOM #5#)
                                      (PROGN (LETT |p| (CAR #5#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |res|
                                        (SPADCALL |res|
                                                  (SPADCALL |tran| |p|
                                                            (QREFELT % 134))
                                                  (QREFELT % 166)))))
                                (LETT #5# (CDR #5#)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'ARROW)
                  (LETT |res| (SPADCALL (QREFELT % 14)))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'NAMEDPOINTS)
                  (LETT |res| (SPADCALL (QREFELT % 14)))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'DEF)
                  (LETT |res| (SPADCALL (QREFELT % 14)))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'USE)
                  (LETT |res| (SPADCALL (QREFELT % 14)))))
                (SEQ (LETT |ch| NIL) (LETT #4# (QVELT |n| 1)) G190
                     (COND
                      ((OR (ATOM #4#) (PROGN (LETT |ch| (CAR #4#)) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |res2|
                            (|SCENE;boundary1| |ch| |tran2| |scale|
                             |useInteger| |npt| |fontScale2| %))
                      (EXIT
                       (LETT |res| (SPADCALL |res| |res2| (QREFELT % 168)))))
                     (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))
          #21# (EXIT #13#)))) 

(SDEFUN |SCENE;boundary;%DfSb;77|
        ((|n| (%)) (|fontScale| (|DoubleFloat|)) (% (|SBoundary| PT)))
        (SPROG ((|defaultTransform| (|STransform| PT)))
               (SEQ (LETT |defaultTransform| (SPADCALL (QREFELT % 160)))
                    (EXIT
                     (|SCENE;boundary1| |n| |defaultTransform| 1.0 NIL
                      (SPADCALL NIL NIL (QREFELT % 161))
                      (|div_DF| |fontScale|
                                (FLOAT 1000 MOST-POSITIVE-DOUBLE-FLOAT))
                      %))))) 

(SDEFUN |SCENE;pointString|
        ((|pts| (|List| PT)) (|tran| (|STransform| PT)) (|bb| (|SBoundary| PT))
         (% (|List| (|String|))))
        (SPROG
         ((|ptStr| (|List| (|String|))) (|thisStr| (|String|)) (|param2| (PT))
          (#1=#:G1058 NIL) (|param| NIL))
         (SEQ (LETT |ptStr| NIL)
              (SEQ (LETT |param| NIL) (LETT #1# |pts|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |param| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |param2| (SPADCALL |tran| |param| (QREFELT % 134)))
                    (LETT |thisStr|
                          (SPADCALL
                           (LIST
                            (|mathObject2String|
                             (SPADCALL |param2| (QREFELT % 80)))
                            " "
                            (|mathObject2String|
                             (SPADCALL |param2| (QREFELT % 81)))
                            " "
                            (|mathObject2String|
                             (SPADCALL |param2| (QREFELT % 169))))
                           (QREFELT % 105)))
                    (EXIT
                     (LETT |ptStr|
                           (SPADCALL |ptStr| |thisStr| (QREFELT % 170)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |ptStr|)))) 

(SDEFUN |SCENE;pointIndexString|
        ((|pts| (|List| (|List| (|NonNegativeInteger|))))
         (|tran| (|STransform| PT)) (|bb| (|SBoundary| PT))
         (% (|List| (|String|))))
        (SPROG
         ((|ptStr| (|List| (|String|))) (#1=#:G1067 NIL) (|param| NIL)
          (#2=#:G1066 NIL) (|line| NIL))
         (SEQ (LETT |ptStr| NIL)
              (SEQ (LETT |line| NIL) (LETT #2# |pts|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |line| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (SEQ (LETT |param| NIL) (LETT #1# |line|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |param| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |ptStr|
                                 (SPADCALL |ptStr|
                                           (|mathObject2String| |param|)
                                           (QREFELT % 170)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (LETT |ptStr| (SPADCALL |ptStr| "-1" (QREFELT % 170)))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |ptStr|)))) 

(SDEFUN |SCENE;setX3DNodeName| ((|typ| (|Symbol|)) (% (|String|)))
        (SPROG ((|nodeName| (|String|)))
               (SEQ (LETT |nodeName| "")
                    (COND ((EQUAL |typ| 'ROOT) (LETT |nodeName| "X3D")))
                    (COND ((EQUAL |typ| 'GROUP) (LETT |nodeName| "Group")))
                    (COND
                     ((EQUAL |typ| 'LINE) (LETT |nodeName| "IndexedFaceSet")))
                    (COND ((EQUAL |typ| 'SHAPE) (LETT |nodeName| "Sphere")))
                    (COND ((EQUAL |typ| 'MATERIAL) (LETT |nodeName| "Group")))
                    (COND ((EQUAL |typ| 'TEXT) (LETT |nodeName| "Text")))
                    (COND
                     ((EQUAL |typ| 'TRANSFORM) (LETT |nodeName| "Transform")))
                    (COND ((EQUAL |typ| 'CLIP) (LETT |nodeName| "Group")))
                    (COND
                     ((EQUAL |typ| 'IFS) (LETT |nodeName| "IndexedFaceSet")))
                    (COND
                     ((EQUAL |typ| 'ARROWS)
                      (LETT |nodeName| "IndexedFaceSet")))
                    (COND ((EQUAL |typ| 'DEF) (LETT |nodeName| "Group")))
                    (COND ((EQUAL |typ| 'USE) (LETT |nodeName| "Group")))
                    (EXIT |nodeName|)))) 

(SDEFUN |SCENE;toX3D;%RStSbXe;81|
        ((|n| (%))
         (|mat|
          (|Record| (|:| |lineWidth| (|DoubleFloat|))
                    (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
                    (|:| |matOpacity| (|DoubleFloat|))))
         (|tran| (|STransform| PT)) (|bb| (|SBoundary| PT)) (% (|XmlElement|)))
        (SPROG
         ((|nodeEles| (|List| (|XmlElement|))) (|xch| (|XmlElement|))
          (#1=#:G1131 NIL) (|ch| NIL) (#2=#:G1129 NIL)
          (|ifset| #3=(|XmlElement|)) (|coord| #3#) (#4=#:G1083 NIL)
          (|nodeAtts| (|List| (|XmlAttribute|))) (|ifsR| (|SceneIFS| PT))
          (|meshR| (|List| (|List| PT))) (#5=#:G1084 NIL) (#6=#:G1078 NIL)
          (#7=#:G1080 NIL) (|bb2| (|SBoundary| PT)) (#8=#:G1081 NIL)
          (|tran2| (|STransform| PT)) (#9=#:G1082 NIL)
          (|mat2|
           (|Record| (|:| |lineWidth| (|DoubleFloat|))
                     (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
                     (|:| |matOpacity| (|DoubleFloat|))))
          (#10=#:G1079 NIL) (|inner| #3#) (#11=#:G1130 NIL)
          (|nodeName| (|String|)))
         (SEQ
          (EXIT
           (SEQ (LETT |nodeName| (|SCENE;setX3DNodeName| (QVELT |n| 0) %))
                (LETT |bb2| |bb|) (LETT |tran2| |tran|) (LETT |mat2| |mat|)
                (LETT |nodeAtts| NIL)
                (COND
                 ((EQUAL (QVELT |n| 0) 'ROOT)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 3))
                     (|error| "toX3D parameter type not valid for root node")))
                   (LETT |bb2|
                         (PROG2 (LETT #8# (QVELT |n| 2))
                             (QCDR #8#)
                           (|check_union2| (QEQCAR #8# 3)
                                           (|SBoundary| (QREFELT % 6))
                                           (|Union|
                                            (|:| |points|
                                                 (|List|
                                                  (|List| (QREFELT % 6))))
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
                                                  (|:| |pos| (QREFELT % 6))
                                                  (|:| |np|
                                                       (|List| (|String|)))))
                                            (|:| |boundbox|
                                                 (|SBoundary| (QREFELT % 6)))
                                            (|:| |trans|
                                                 (|STransform| (QREFELT % 6)))
                                            (|:| |ifs|
                                                 (|Record|
                                                  (|:| |inx|
                                                       (|List|
                                                        (|List|
                                                         (|NonNegativeInteger|))))
                                                  (|:| |pts|
                                                       (|List|
                                                        (QREFELT % 6)))))
                                            (|:| |arrws|
                                                 (|Record|
                                                  (|:| |ln|
                                                       (|List|
                                                        (|List|
                                                         (QREFELT % 6))))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |arrw|
                                                 (|Record|
                                                  (|:| |st| (|String|))
                                                  (|:| |en| (|String|))
                                                  (|:| |offset| (QREFELT % 6))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |shpe|
                                                 (|Record|
                                                  (|:| |shptype| (|Symbol|))
                                                  (|:| |centre| (QREFELT % 6))
                                                  (|:| |size| (QREFELT % 6))
                                                  (|:| |fill| (|Boolean|))))
                                            (|:| |nodename|
                                                 (|Record|
                                                  (|:| |nme| (|String|))
                                                  (|:| |node| %)))
                                            (|:| |np|
                                                 (|SceneNamedPoints|
                                                  (QREFELT % 6)))
                                            (|:| |empty| #12="empty"))
                                           #8#)))
                   (COND
                    ((SPADCALL |bb2| (QREFELT % 146))
                     (LETT |bb2| (SPADCALL |n| 1.0 (QREFELT % 29)))))
                   (COND
                    ((SPADCALL |bb2| (QREFELT % 146))
                     (|error| "scene contains no drawable elements")))
                   (LETT |nodeEles| NIL)
                   (SEQ (LETT |ch| NIL) (LETT #11# (QVELT |n| 1)) G190
                        (COND
                         ((OR (ATOM #11#) (PROGN (LETT |ch| (CAR #11#)) NIL))
                          (GO G191)))
                        (SEQ
                         (LETT |xch|
                               (SPADCALL |ch| |mat2| |tran2| |bb2|
                                         (QREFELT % 171)))
                         (EXIT
                          (COND
                           ((NULL (SPADCALL |xch| (QREFELT % 152)))
                            (LETT |nodeEles|
                                  (SPADCALL |nodeEles| |xch|
                                            (QREFELT % 145)))))))
                        (LETT #11# (CDR #11#)) (GO G190) G191 (EXIT NIL))
                   (LETT |inner|
                         (SPADCALL "Scene" |nodeEles| |nodeAtts|
                                   (QREFELT % 143)))
                   (EXIT
                    (PROGN
                     (LETT #2#
                           (SPADCALL |nodeName| (LIST |inner|) |nodeAtts|
                                     (QREFELT % 143)))
                     (GO #13=#:G1128))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'MATERIAL)
                  (LETT |mat2|
                        (PROG2 (LETT #10# (QVELT |n| 2))
                            (QCDR #10#)
                          (|check_union2| (QEQCAR #10# 1)
                                          (|Record|
                                           (|:| |lineWidth| (|DoubleFloat|))
                                           (|:| |lineCol| (|String|))
                                           (|:| |fillCol| (|String|))
                                           (|:| |matOpacity| (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT % 6))))
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
                                                 (|:| |pos| (QREFELT % 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT % 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT % 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT % 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT % 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT % 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT % 6))
                                                 (|:| |size| (QREFELT % 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| %)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT % 6)))
                                           (|:| |empty| #12#))
                                          #10#)))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'TRANSFORM)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 4))
                     (|error|
                      "toX3D parameter type not valid for trans node")))
                   (EXIT
                    (LETT |tran2|
                          (SPADCALL
                           (PROG2 (LETT #9# (QVELT |n| 2))
                               (QCDR #9#)
                             (|check_union2| (QEQCAR #9# 4)
                                             (|STransform| (QREFELT % 6))
                                             (|Union|
                                              (|:| |points|
                                                   (|List|
                                                    (|List| (QREFELT % 6))))
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
                                                    (|:| |pos| (QREFELT % 6))
                                                    (|:| |np|
                                                         (|List| (|String|)))))
                                              (|:| |boundbox|
                                                   (|SBoundary| (QREFELT % 6)))
                                              (|:| |trans|
                                                   (|STransform|
                                                    (QREFELT % 6)))
                                              (|:| |ifs|
                                                   (|Record|
                                                    (|:| |inx|
                                                         (|List|
                                                          (|List|
                                                           (|NonNegativeInteger|))))
                                                    (|:| |pts|
                                                         (|List|
                                                          (QREFELT % 6)))))
                                              (|:| |arrws|
                                                   (|Record|
                                                    (|:| |ln|
                                                         (|List|
                                                          (|List|
                                                           (QREFELT % 6))))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|))))
                                              (|:| |arrw|
                                                   (|Record|
                                                    (|:| |st| (|String|))
                                                    (|:| |en| (|String|))
                                                    (|:| |offset|
                                                         (QREFELT % 6))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|))))
                                              (|:| |shpe|
                                                   (|Record|
                                                    (|:| |shptype| (|Symbol|))
                                                    (|:| |centre|
                                                         (QREFELT % 6))
                                                    (|:| |size| (QREFELT % 6))
                                                    (|:| |fill| (|Boolean|))))
                                              (|:| |nodename|
                                                   (|Record|
                                                    (|:| |nme| (|String|))
                                                    (|:| |node| %)))
                                              (|:| |np|
                                                   (|SceneNamedPoints|
                                                    (QREFELT % 6)))
                                              (|:| |empty| #12#))
                                             #9#))
                           |tran| (QREFELT % 153)))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'CLIP)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 3))
                     (|error| "toX3D parameter type not valid for clip node")))
                   (EXIT
                    (LETT |bb2|
                          (PROG2 (LETT #8# (QVELT |n| 2))
                              (QCDR #8#)
                            (|check_union2| (QEQCAR #8# 3)
                                            (|SBoundary| (QREFELT % 6))
                                            (|Union|
                                             (|:| |points|
                                                  (|List|
                                                   (|List| (QREFELT % 6))))
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
                                                   (|:| |pos| (QREFELT % 6))
                                                   (|:| |np|
                                                        (|List| (|String|)))))
                                             (|:| |boundbox|
                                                  (|SBoundary| (QREFELT % 6)))
                                             (|:| |trans|
                                                  (|STransform| (QREFELT % 6)))
                                             (|:| |ifs|
                                                  (|Record|
                                                   (|:| |inx|
                                                        (|List|
                                                         (|List|
                                                          (|NonNegativeInteger|))))
                                                   (|:| |pts|
                                                        (|List|
                                                         (QREFELT % 6)))))
                                             (|:| |arrws|
                                                  (|Record|
                                                   (|:| |ln|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT % 6))))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |arrw|
                                                  (|Record|
                                                   (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT % 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |shpe|
                                                  (|Record|
                                                   (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT % 6))
                                                   (|:| |size| (QREFELT % 6))
                                                   (|:| |fill| (|Boolean|))))
                                             (|:| |nodename|
                                                  (|Record|
                                                   (|:| |nme| (|String|))
                                                   (|:| |node| %)))
                                             (|:| |np|
                                                  (|SceneNamedPoints|
                                                   (QREFELT % 6)))
                                             (|:| |empty| #12#))
                                            #8#)))))))
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
                                      (PROG2 (LETT #7# (QVELT |n| 2))
                                          (QCDR #7#)
                                        (|check_union2| (QEQCAR #7# 2)
                                                        (|Record|
                                                         (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT % 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|))))
                                                        (|Union|
                                                         (|:| |points|
                                                              (|List|
                                                               (|List|
                                                                (QREFELT %
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
                                                                    (QREFELT %
                                                                             6))
                                                               (|:| |np|
                                                                    (|List|
                                                                     (|String|)))))
                                                         (|:| |boundbox|
                                                              (|SBoundary|
                                                               (QREFELT % 6)))
                                                         (|:| |trans|
                                                              (|STransform|
                                                               (QREFELT % 6)))
                                                         (|:| |ifs|
                                                              (|Record|
                                                               (|:| |inx|
                                                                    (|List|
                                                                     (|List|
                                                                      (|NonNegativeInteger|))))
                                                               (|:| |pts|
                                                                    (|List|
                                                                     (QREFELT %
                                                                              6)))))
                                                         (|:| |arrws|
                                                              (|Record|
                                                               (|:| |ln|
                                                                    (|List|
                                                                     (|List|
                                                                      (QREFELT
                                                                       % 6))))
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
                                                                    (QREFELT %
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
                                                                    (QREFELT %
                                                                             6))
                                                               (|:| |size|
                                                                    (QREFELT %
                                                                             6))
                                                               (|:| |fill|
                                                                    (|Boolean|))))
                                                         (|:| |nodename|
                                                              (|Record|
                                                               (|:| |nme|
                                                                    (|String|))
                                                               (|:| |node| %)))
                                                         (|:| |np|
                                                              (|SceneNamedPoints|
                                                               (QREFELT % 6)))
                                                         (|:| |empty| #12#))
                                                        #7#))
                                      0)
                                     (QREFELT % 140))))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'LINE)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 0))
                     (|error| "toX3D parameter type not valid for line node")))
                   (LETT |meshR|
                         (SPADCALL
                          (|SPADfirst|
                           (PROG2 (LETT #6# (QVELT |n| 2))
                               (QCDR #6#)
                             (|check_union2| (QEQCAR #6# 0)
                                             (|List| (|List| (QREFELT % 6)))
                                             (|Union|
                                              (|:| |points|
                                                   (|List|
                                                    (|List| (QREFELT % 6))))
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
                                                    (|:| |pos| (QREFELT % 6))
                                                    (|:| |np|
                                                         (|List| (|String|)))))
                                              (|:| |boundbox|
                                                   (|SBoundary| (QREFELT % 6)))
                                              (|:| |trans|
                                                   (|STransform|
                                                    (QREFELT % 6)))
                                              (|:| |ifs|
                                                   (|Record|
                                                    (|:| |inx|
                                                         (|List|
                                                          (|List|
                                                           (|NonNegativeInteger|))))
                                                    (|:| |pts|
                                                         (|List|
                                                          (QREFELT % 6)))))
                                              (|:| |arrws|
                                                   (|Record|
                                                    (|:| |ln|
                                                         (|List|
                                                          (|List|
                                                           (QREFELT % 6))))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|))))
                                              (|:| |arrw|
                                                   (|Record|
                                                    (|:| |st| (|String|))
                                                    (|:| |en| (|String|))
                                                    (|:| |offset|
                                                         (QREFELT % 6))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|))))
                                              (|:| |shpe|
                                                   (|Record|
                                                    (|:| |shptype| (|Symbol|))
                                                    (|:| |centre|
                                                         (QREFELT % 6))
                                                    (|:| |size| (QREFELT % 6))
                                                    (|:| |fill| (|Boolean|))))
                                              (|:| |nodename|
                                                   (|Record|
                                                    (|:| |nme| (|String|))
                                                    (|:| |node| %)))
                                              (|:| |np|
                                                   (|SceneNamedPoints|
                                                    (QREFELT % 6)))
                                              (|:| |empty| #12#))
                                             #6#)))
                          (|mk_DF| 25 -2) 8 (QREFELT % 172)))
                   (LETT |ifsR| (SPADCALL |meshR| NIL (QREFELT % 173)))
                   (LETT |nodeAtts|
                         (LIST
                          (SPADCALL "coordIndex"
                                    (|SCENE;pointIndexString|
                                     (SPADCALL |ifsR| (QREFELT % 62)) |tran|
                                     |bb| %)
                                    (QREFELT % 174))))
                   (LETT |coord|
                         (SPADCALL "Coordinate" NIL
                                   (LIST
                                    (SPADCALL "point"
                                              (|SCENE;pointString|
                                               (SPADCALL |ifsR| (QREFELT % 63))
                                               |tran| |bb| %)
                                              (QREFELT % 174)))
                                   (QREFELT % 143)))
                   (LETT |ifset|
                         (SPADCALL |nodeName| (LIST |coord|) |nodeAtts|
                                   (QREFELT % 143)))
                   (EXIT
                    (PROGN
                     (LETT #2#
                           (SPADCALL "Shape" (LIST |ifset|) NIL
                                     (QREFELT % 143)))
                     (GO #13#))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'SHAPE)
                  (COND
                   ((NULL (QEQCAR (QVELT |n| 2) 8))
                    (|error|
                     "toX3D parameter type not valid for text node")))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'ARROWS)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 6))
                     (|error|
                      "toX3D parameter type not valid for arrws node")))
                   (LETT |meshR|
                         (SPADCALL
                          (|SPADfirst|
                           (QVELT
                            (PROG2 (LETT #5# (QVELT |n| 2))
                                (QCDR #5#)
                              (|check_union2| (QEQCAR #5# 6)
                                              (|Record|
                                               (|:| |ln|
                                                    (|List|
                                                     (|List| (QREFELT % 6))))
                                               (|:| |mode| (|Symbol|))
                                               (|:| |size| (|DoubleFloat|)))
                                              (|Union|
                                               (|:| |points|
                                                    (|List|
                                                     (|List| (QREFELT % 6))))
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
                                                     (|:| |pos| (QREFELT % 6))
                                                     (|:| |np|
                                                          (|List|
                                                           (|String|)))))
                                               (|:| |boundbox|
                                                    (|SBoundary|
                                                     (QREFELT % 6)))
                                               (|:| |trans|
                                                    (|STransform|
                                                     (QREFELT % 6)))
                                               (|:| |ifs|
                                                    (|Record|
                                                     (|:| |inx|
                                                          (|List|
                                                           (|List|
                                                            (|NonNegativeInteger|))))
                                                     (|:| |pts|
                                                          (|List|
                                                           (QREFELT % 6)))))
                                               (|:| |arrws|
                                                    (|Record|
                                                     (|:| |ln|
                                                          (|List|
                                                           (|List|
                                                            (QREFELT % 6))))
                                                     (|:| |mode| (|Symbol|))
                                                     (|:| |size|
                                                          (|DoubleFloat|))))
                                               (|:| |arrw|
                                                    (|Record|
                                                     (|:| |st| (|String|))
                                                     (|:| |en| (|String|))
                                                     (|:| |offset|
                                                          (QREFELT % 6))
                                                     (|:| |mode| (|Symbol|))
                                                     (|:| |size|
                                                          (|DoubleFloat|))))
                                               (|:| |shpe|
                                                    (|Record|
                                                     (|:| |shptype| (|Symbol|))
                                                     (|:| |centre|
                                                          (QREFELT % 6))
                                                     (|:| |size| (QREFELT % 6))
                                                     (|:| |fill| (|Boolean|))))
                                               (|:| |nodename|
                                                    (|Record|
                                                     (|:| |nme| (|String|))
                                                     (|:| |node| %)))
                                               (|:| |np|
                                                    (|SceneNamedPoints|
                                                     (QREFELT % 6)))
                                               (|:| |empty| #12#))
                                              #5#))
                            0))
                          (|mk_DF| 25 -2) 8 (QREFELT % 172)))
                   (LETT |ifsR| (SPADCALL |meshR| NIL (QREFELT % 173)))
                   (LETT |nodeAtts|
                         (LIST
                          (SPADCALL "coordIndex"
                                    (|SCENE;pointIndexString|
                                     (SPADCALL |ifsR| (QREFELT % 62)) |tran|
                                     |bb| %)
                                    (QREFELT % 174))))
                   (LETT |coord|
                         (SPADCALL "Coordinate" NIL
                                   (LIST
                                    (SPADCALL "point"
                                              (|SCENE;pointString|
                                               (SPADCALL |ifsR| (QREFELT % 63))
                                               |tran| |bb| %)
                                              (QREFELT % 174)))
                                   (QREFELT % 143)))
                   (LETT |ifset|
                         (SPADCALL |nodeName| (LIST |coord|) |nodeAtts|
                                   (QREFELT % 143)))
                   (EXIT
                    (PROGN
                     (LETT #2#
                           (SPADCALL "Shape" (LIST |ifset|) NIL
                                     (QREFELT % 143)))
                     (GO #13#))))))
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
                                      (PROG2 (LETT #4# (QVELT |n| 2))
                                          (QCDR #4#)
                                        (|check_union2| (QEQCAR #4# 5)
                                                        (|Record|
                                                         (|:| |inx|
                                                              (|List|
                                                               (|List|
                                                                (|NonNegativeInteger|))))
                                                         (|:| |pts|
                                                              (|List|
                                                               (QREFELT % 6))))
                                                        (|Union|
                                                         (|:| |points|
                                                              (|List|
                                                               (|List|
                                                                (QREFELT %
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
                                                                    (QREFELT %
                                                                             6))
                                                               (|:| |np|
                                                                    (|List|
                                                                     (|String|)))))
                                                         (|:| |boundbox|
                                                              (|SBoundary|
                                                               (QREFELT % 6)))
                                                         (|:| |trans|
                                                              (|STransform|
                                                               (QREFELT % 6)))
                                                         (|:| |ifs|
                                                              (|Record|
                                                               (|:| |inx|
                                                                    (|List|
                                                                     (|List|
                                                                      (|NonNegativeInteger|))))
                                                               (|:| |pts|
                                                                    (|List|
                                                                     (QREFELT %
                                                                              6)))))
                                                         (|:| |arrws|
                                                              (|Record|
                                                               (|:| |ln|
                                                                    (|List|
                                                                     (|List|
                                                                      (QREFELT
                                                                       % 6))))
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
                                                                    (QREFELT %
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
                                                                    (QREFELT %
                                                                             6))
                                                               (|:| |size|
                                                                    (QREFELT %
                                                                             6))
                                                               (|:| |fill|
                                                                    (|Boolean|))))
                                                         (|:| |nodename|
                                                              (|Record|
                                                               (|:| |nme|
                                                                    (|String|))
                                                               (|:| |node| %)))
                                                         (|:| |np|
                                                              (|SceneNamedPoints|
                                                               (QREFELT % 6)))
                                                         (|:| |empty| #12#))
                                                        #4#)))
                                     |tran| |bb| %)
                                    (QREFELT % 174))))
                   (LETT |coord|
                         (SPADCALL "Coordinate" NIL
                                   (LIST
                                    (SPADCALL "point"
                                              (|SCENE;pointString|
                                               (QCDR
                                                (PROG2 (LETT #4# (QVELT |n| 2))
                                                    (QCDR #4#)
                                                  (|check_union2|
                                                   (QEQCAR #4# 5)
                                                   (|Record|
                                                    (|:| |inx|
                                                         (|List|
                                                          (|List|
                                                           (|NonNegativeInteger|))))
                                                    (|:| |pts|
                                                         (|List|
                                                          (QREFELT % 6))))
                                                   (|Union|
                                                    (|:| |points|
                                                         (|List|
                                                          (|List|
                                                           (QREFELT % 6))))
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
                                                               (QREFELT % 6))
                                                          (|:| |np|
                                                               (|List|
                                                                (|String|)))))
                                                    (|:| |boundbox|
                                                         (|SBoundary|
                                                          (QREFELT % 6)))
                                                    (|:| |trans|
                                                         (|STransform|
                                                          (QREFELT % 6)))
                                                    (|:| |ifs|
                                                         (|Record|
                                                          (|:| |inx|
                                                               (|List|
                                                                (|List|
                                                                 (|NonNegativeInteger|))))
                                                          (|:| |pts|
                                                               (|List|
                                                                (QREFELT %
                                                                         6)))))
                                                    (|:| |arrws|
                                                         (|Record|
                                                          (|:| |ln|
                                                               (|List|
                                                                (|List|
                                                                 (QREFELT %
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
                                                               (QREFELT % 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                                    (|:| |shpe|
                                                         (|Record|
                                                          (|:| |shptype|
                                                               (|Symbol|))
                                                          (|:| |centre|
                                                               (QREFELT % 6))
                                                          (|:| |size|
                                                               (QREFELT % 6))
                                                          (|:| |fill|
                                                               (|Boolean|))))
                                                    (|:| |nodename|
                                                         (|Record|
                                                          (|:| |nme|
                                                               (|String|))
                                                          (|:| |node| %)))
                                                    (|:| |np|
                                                         (|SceneNamedPoints|
                                                          (QREFELT % 6)))
                                                    (|:| |empty| #12#))
                                                   #4#)))
                                               |tran2| |bb2| %)
                                              (QREFELT % 174)))
                                   (QREFELT % 143)))
                   (LETT |ifset|
                         (SPADCALL |nodeName| (LIST |coord|) |nodeAtts|
                                   (QREFELT % 143)))
                   (EXIT
                    (PROGN
                     (LETT #2#
                           (SPADCALL "Shape" (LIST |ifset|) NIL
                                     (QREFELT % 143)))
                     (GO #13#))))))
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
                  ((< (SPADCALL (QVELT |n| 1) (QREFELT % 159)) 1)
                   (SPADCALL |nodeName| NIL |nodeAtts| (QREFELT % 143)))
                  ('T
                   (SEQ (LETT |nodeEles| NIL)
                        (SEQ (LETT |ch| NIL) (LETT #1# (QVELT |n| 1)) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |ch| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |xch|
                                    (SPADCALL |ch| |mat2| |tran2| |bb2|
                                              (QREFELT % 171)))
                              (EXIT
                               (COND
                                ((NULL (SPADCALL |xch| (QREFELT % 152)))
                                 (LETT |nodeEles|
                                       (SPADCALL |nodeEles| |xch|
                                                 (QREFELT % 145)))))))
                             (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (SPADCALL |nodeName| |nodeEles| |nodeAtts|
                                   (QREFELT % 143)))))))))
          #13# (EXIT #2#)))) 

(SDEFUN |SCENE;writeX3d;%SV;82|
        ((|n| (%)) (|filename| (|String|)) (% (|Void|)))
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
                        1.0))
          (LETT |defaultTransform| (SPADCALL (QREFELT % 160)))
          (LETT |defaultBounds| (SPADCALL (QREFELT % 14)))
          (EXIT
           (SPADCALL
            (SPADCALL |n| |defaultMaterial| |defaultTransform| |defaultBounds|
                      (QREFELT % 171))
            |filename| (QREFELT % 163)))))) 

(SDEFUN |SCENE;toObj;%RRRStSbV;83|
        ((|n| (%)) (|ptLst| (|Reference| (|List| PT)))
         (|indexLst| (|Reference| (|List| (|List| (|NonNegativeInteger|)))))
         (|indexNxt| (|Reference| (|NonNegativeInteger|)))
         (|tran| (|STransform| PT)) (|bb| (|SBoundary| PT)) (% (|Void|)))
        (SPROG
         ((#1=#:G1217 NIL) (|ch| NIL) (#2=#:G1203 NIL)
          (|i2| (|List| (|List| (|NonNegativeInteger|)))) (#3=#:G1216 NIL)
          (|j| NIL) (#4=#:G1215 NIL) (#5=#:G1214 NIL) (|k| NIL)
          (#6=#:G1213 NIL) (|p1| (|List| PT)) (#7=#:G1148 NIL)
          (|i1| (|List| (|List| (|NonNegativeInteger|)))) (#8=#:G1212 NIL)
          (#9=#:G1211 NIL) (#10=#:G1210 NIL) (#11=#:G1209 NIL)
          (|ifsR| (|SceneIFS| PT)) (|meshR| (|List| (|List| PT)))
          (#12=#:G1143 NIL) (#13=#:G1208 NIL) (#14=#:G1207 NIL)
          (#15=#:G1206 NIL) (#16=#:G1205 NIL) (|bb2| (|SBoundary| PT))
          (#17=#:G1146 NIL) (|tran2| (|STransform| PT)) (#18=#:G1147 NIL)
          (#19=#:G1204 NIL) (|mx| (PT)) (|mn| (PT))
          (|offsety| #20=(|DoubleFloat|)) (|offsetRequired| (|Boolean|))
          (|offsetx| #20#) (|miny| (|DoubleFloat|)) (|minx| (|DoubleFloat|)))
         (SEQ
          (EXIT
           (SEQ (LETT |bb2| |bb|) (LETT |tran2| |tran|)
                (COND
                 ((EQUAL (QVELT |n| 0) 'ROOT)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 3))
                     (|error| "toObj parameter type not valid for root node")))
                   (LETT |bb2|
                         (PROG2 (LETT #17# (QVELT |n| 2))
                             (QCDR #17#)
                           (|check_union2| (QEQCAR #17# 3)
                                           (|SBoundary| (QREFELT % 6))
                                           (|Union|
                                            (|:| |points|
                                                 (|List|
                                                  (|List| (QREFELT % 6))))
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
                                                  (|:| |pos| (QREFELT % 6))
                                                  (|:| |np|
                                                       (|List| (|String|)))))
                                            (|:| |boundbox|
                                                 (|SBoundary| (QREFELT % 6)))
                                            (|:| |trans|
                                                 (|STransform| (QREFELT % 6)))
                                            (|:| |ifs|
                                                 (|Record|
                                                  (|:| |inx|
                                                       (|List|
                                                        (|List|
                                                         (|NonNegativeInteger|))))
                                                  (|:| |pts|
                                                       (|List|
                                                        (QREFELT % 6)))))
                                            (|:| |arrws|
                                                 (|Record|
                                                  (|:| |ln|
                                                       (|List|
                                                        (|List|
                                                         (QREFELT % 6))))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |arrw|
                                                 (|Record|
                                                  (|:| |st| (|String|))
                                                  (|:| |en| (|String|))
                                                  (|:| |offset| (QREFELT % 6))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |shpe|
                                                 (|Record|
                                                  (|:| |shptype| (|Symbol|))
                                                  (|:| |centre| (QREFELT % 6))
                                                  (|:| |size| (QREFELT % 6))
                                                  (|:| |fill| (|Boolean|))))
                                            (|:| |nodename|
                                                 (|Record|
                                                  (|:| |nme| (|String|))
                                                  (|:| |node| %)))
                                            (|:| |np|
                                                 (|SceneNamedPoints|
                                                  (QREFELT % 6)))
                                            (|:| |empty| #21="empty"))
                                           #17#)))
                   (COND
                    ((SPADCALL |bb2| (QREFELT % 146))
                     (LETT |bb2| (SPADCALL |n| 1.0 (QREFELT % 29)))))
                   (COND
                    ((SPADCALL |bb2| (QREFELT % 146))
                     (|error| "scene contains no drawable elements")))
                   (LETT |minx|
                         (SPADCALL (SPADCALL |bb2| (QREFELT % 39))
                                   (QREFELT % 80)))
                   (LETT |miny|
                         (SPADCALL (SPADCALL |bb2| (QREFELT % 39))
                                   (QREFELT % 81)))
                   (LETT |offsetx| 0.0) (LETT |offsety| 0.0)
                   (LETT |offsetRequired| NIL)
                   (COND
                    ((|less_DF| |minx| 0.0)
                     (SEQ (LETT |offsetRequired| 'T)
                          (EXIT (LETT |offsetx| (|minus_DF| |minx|))))))
                   (COND
                    ((|less_DF| |miny| 0.0)
                     (SEQ (LETT |offsetRequired| 'T)
                          (EXIT (LETT |offsety| (|minus_DF| |miny|))))))
                   (COND
                    (|offsetRequired|
                     (SEQ
                      (LETT |mn|
                            (SPADCALL
                             (|add_DF|
                              (SPADCALL (SPADCALL |bb2| (QREFELT % 39))
                                        (QREFELT % 80))
                              |offsetx|)
                             (|add_DF|
                              (SPADCALL (SPADCALL |bb2| (QREFELT % 39))
                                        (QREFELT % 81))
                              |offsety|)
                             (QREFELT % 82)))
                      (LETT |mx|
                            (SPADCALL
                             (|add_DF|
                              (SPADCALL (SPADCALL |bb2| (QREFELT % 38))
                                        (QREFELT % 80))
                              |offsetx|)
                             (|add_DF|
                              (SPADCALL (SPADCALL |bb2| (QREFELT % 38))
                                        (QREFELT % 81))
                              |offsety|)
                             (QREFELT % 82)))
                      (LETT |bb2| (SPADCALL |mn| |mx| (QREFELT % 12)))
                      (EXIT
                       (LETT |tran2|
                             (SPADCALL |offsetx| |offsety| 0.0 1.0 1.0 1.0
                                       (QREFELT % 147)))))))
                   (SEQ (LETT |ch| NIL) (LETT #19# (QVELT |n| 1)) G190
                        (COND
                         ((OR (ATOM #19#) (PROGN (LETT |ch| (CAR #19#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL |ch| |ptLst| |indexLst| |indexNxt| |tran2|
                                    |bb2| (QREFELT % 179))))
                        (LETT #19# (CDR #19#)) (GO G190) G191 (EXIT NIL))
                   (EXIT (PROGN (LETT #2# (|Void|)) (GO #22=#:G1202))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'TRANSFORM)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 4))
                     (|error|
                      "toObj parameter type not valid for trans node")))
                   (EXIT
                    (LETT |tran2|
                          (SPADCALL
                           (PROG2 (LETT #18# (QVELT |n| 2))
                               (QCDR #18#)
                             (|check_union2| (QEQCAR #18# 4)
                                             (|STransform| (QREFELT % 6))
                                             (|Union|
                                              (|:| |points|
                                                   (|List|
                                                    (|List| (QREFELT % 6))))
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
                                                    (|:| |pos| (QREFELT % 6))
                                                    (|:| |np|
                                                         (|List| (|String|)))))
                                              (|:| |boundbox|
                                                   (|SBoundary| (QREFELT % 6)))
                                              (|:| |trans|
                                                   (|STransform|
                                                    (QREFELT % 6)))
                                              (|:| |ifs|
                                                   (|Record|
                                                    (|:| |inx|
                                                         (|List|
                                                          (|List|
                                                           (|NonNegativeInteger|))))
                                                    (|:| |pts|
                                                         (|List|
                                                          (QREFELT % 6)))))
                                              (|:| |arrws|
                                                   (|Record|
                                                    (|:| |ln|
                                                         (|List|
                                                          (|List|
                                                           (QREFELT % 6))))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|))))
                                              (|:| |arrw|
                                                   (|Record|
                                                    (|:| |st| (|String|))
                                                    (|:| |en| (|String|))
                                                    (|:| |offset|
                                                         (QREFELT % 6))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|))))
                                              (|:| |shpe|
                                                   (|Record|
                                                    (|:| |shptype| (|Symbol|))
                                                    (|:| |centre|
                                                         (QREFELT % 6))
                                                    (|:| |size| (QREFELT % 6))
                                                    (|:| |fill| (|Boolean|))))
                                              (|:| |nodename|
                                                   (|Record|
                                                    (|:| |nme| (|String|))
                                                    (|:| |node| %)))
                                              (|:| |np|
                                                   (|SceneNamedPoints|
                                                    (QREFELT % 6)))
                                              (|:| |empty| #21#))
                                             #18#))
                           |tran| (QREFELT % 153)))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'CLIP)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 3))
                     (|error| "toObj parameter type not valid for clip node")))
                   (LETT |bb2|
                         (PROG2 (LETT #17# (QVELT |n| 2))
                             (QCDR #17#)
                           (|check_union2| (QEQCAR #17# 3)
                                           (|SBoundary| (QREFELT % 6))
                                           (|Union|
                                            (|:| |points|
                                                 (|List|
                                                  (|List| (QREFELT % 6))))
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
                                                  (|:| |pos| (QREFELT % 6))
                                                  (|:| |np|
                                                       (|List| (|String|)))))
                                            (|:| |boundbox|
                                                 (|SBoundary| (QREFELT % 6)))
                                            (|:| |trans|
                                                 (|STransform| (QREFELT % 6)))
                                            (|:| |ifs|
                                                 (|Record|
                                                  (|:| |inx|
                                                       (|List|
                                                        (|List|
                                                         (|NonNegativeInteger|))))
                                                  (|:| |pts|
                                                       (|List|
                                                        (QREFELT % 6)))))
                                            (|:| |arrws|
                                                 (|Record|
                                                  (|:| |ln|
                                                       (|List|
                                                        (|List|
                                                         (QREFELT % 6))))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |arrw|
                                                 (|Record|
                                                  (|:| |st| (|String|))
                                                  (|:| |en| (|String|))
                                                  (|:| |offset| (QREFELT % 6))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |shpe|
                                                 (|Record|
                                                  (|:| |shptype| (|Symbol|))
                                                  (|:| |centre| (QREFELT % 6))
                                                  (|:| |size| (QREFELT % 6))
                                                  (|:| |fill| (|Boolean|))))
                                            (|:| |nodename|
                                                 (|Record|
                                                  (|:| |nme| (|String|))
                                                  (|:| |node| %)))
                                            (|:| |np|
                                                 (|SceneNamedPoints|
                                                  (QREFELT % 6)))
                                            (|:| |empty| #21#))
                                           #17#)))
                   (EXIT (PROGN (LETT #2# (|Void|)) (GO #22#))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'LINE)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 0))
                     (|error| "toObj parameter type not valid for line node")))
                   (LETT |meshR|
                         (SPADCALL
                          (|SPADfirst|
                           (PROG2 (LETT #12# (QVELT |n| 2))
                               (QCDR #12#)
                             (|check_union2| (QEQCAR #12# 0)
                                             (|List| (|List| (QREFELT % 6)))
                                             (|Union|
                                              (|:| |points|
                                                   (|List|
                                                    (|List| (QREFELT % 6))))
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
                                                    (|:| |pos| (QREFELT % 6))
                                                    (|:| |np|
                                                         (|List| (|String|)))))
                                              (|:| |boundbox|
                                                   (|SBoundary| (QREFELT % 6)))
                                              (|:| |trans|
                                                   (|STransform|
                                                    (QREFELT % 6)))
                                              (|:| |ifs|
                                                   (|Record|
                                                    (|:| |inx|
                                                         (|List|
                                                          (|List|
                                                           (|NonNegativeInteger|))))
                                                    (|:| |pts|
                                                         (|List|
                                                          (QREFELT % 6)))))
                                              (|:| |arrws|
                                                   (|Record|
                                                    (|:| |ln|
                                                         (|List|
                                                          (|List|
                                                           (QREFELT % 6))))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|))))
                                              (|:| |arrw|
                                                   (|Record|
                                                    (|:| |st| (|String|))
                                                    (|:| |en| (|String|))
                                                    (|:| |offset|
                                                         (QREFELT % 6))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|))))
                                              (|:| |shpe|
                                                   (|Record|
                                                    (|:| |shptype| (|Symbol|))
                                                    (|:| |centre|
                                                         (QREFELT % 6))
                                                    (|:| |size| (QREFELT % 6))
                                                    (|:| |fill| (|Boolean|))))
                                              (|:| |nodename|
                                                   (|Record|
                                                    (|:| |nme| (|String|))
                                                    (|:| |node| %)))
                                              (|:| |np|
                                                   (|SceneNamedPoints|
                                                    (QREFELT % 6)))
                                              (|:| |empty| #21#))
                                             #12#)))
                          (|mk_DF| 25 -2) 8 (QREFELT % 172)))
                   (LETT |ifsR| (SPADCALL |meshR| NIL (QREFELT % 173)))
                   (LETT |i1| (SPADCALL |ifsR| (QREFELT % 62)))
                   (LETT |p1| (SPADCALL |ifsR| (QREFELT % 63)))
                   (LETT |i2|
                         (PROGN
                          (LETT #16# NIL)
                          (SEQ (LETT |k| NIL) (LETT #15# |i1|) G190
                               (COND
                                ((OR (ATOM #15#)
                                     (PROGN (LETT |k| (CAR #15#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #16#
                                       (CONS
                                        (PROGN
                                         (LETT #14# NIL)
                                         (SEQ (LETT |j| NIL) (LETT #13# |k|)
                                              G190
                                              (COND
                                               ((OR (ATOM #13#)
                                                    (PROGN
                                                     (LETT |j| (CAR #13#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #14#
                                                      (CONS
                                                       (+ |j|
                                                          (SPADCALL |indexNxt|
                                                                    (QREFELT %
                                                                             180)))
                                                       #14#))))
                                              (LETT #13# (CDR #13#)) (GO G190)
                                              G191 (EXIT (NREVERSE #14#))))
                                        #16#))))
                               (LETT #15# (CDR #15#)) (GO G190) G191
                               (EXIT (NREVERSE #16#)))))
                   (SPADCALL |ptLst|
                             (SPADCALL (SPADCALL |ptLst| (QREFELT % 181)) |p1|
                                       (QREFELT % 182))
                             (QREFELT % 183))
                   (SPADCALL |indexLst|
                             (SPADCALL (SPADCALL |indexLst| (QREFELT % 184))
                                       |i2| (QREFELT % 185))
                             (QREFELT % 186))
                   (SPADCALL |indexNxt|
                             (+ (SPADCALL |indexNxt| (QREFELT % 180))
                                (LENGTH |p1|))
                             (QREFELT % 187))
                   (EXIT (PROGN (LETT #2# (|Void|)) (GO #22#))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'SHAPE)
                  (COND
                   ((NULL (QEQCAR (QVELT |n| 2) 8))
                    (|error|
                     "toObj parameter type not valid for shape node")))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'ARROWS)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 0))
                     (|error|
                      "toObj parameter type not valid for arrows node")))
                   (LETT |meshR|
                         (SPADCALL
                          (|SPADfirst|
                           (PROG2 (LETT #12# (QVELT |n| 2))
                               (QCDR #12#)
                             (|check_union2| (QEQCAR #12# 0)
                                             (|List| (|List| (QREFELT % 6)))
                                             (|Union|
                                              (|:| |points|
                                                   (|List|
                                                    (|List| (QREFELT % 6))))
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
                                                    (|:| |pos| (QREFELT % 6))
                                                    (|:| |np|
                                                         (|List| (|String|)))))
                                              (|:| |boundbox|
                                                   (|SBoundary| (QREFELT % 6)))
                                              (|:| |trans|
                                                   (|STransform|
                                                    (QREFELT % 6)))
                                              (|:| |ifs|
                                                   (|Record|
                                                    (|:| |inx|
                                                         (|List|
                                                          (|List|
                                                           (|NonNegativeInteger|))))
                                                    (|:| |pts|
                                                         (|List|
                                                          (QREFELT % 6)))))
                                              (|:| |arrws|
                                                   (|Record|
                                                    (|:| |ln|
                                                         (|List|
                                                          (|List|
                                                           (QREFELT % 6))))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|))))
                                              (|:| |arrw|
                                                   (|Record|
                                                    (|:| |st| (|String|))
                                                    (|:| |en| (|String|))
                                                    (|:| |offset|
                                                         (QREFELT % 6))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|))))
                                              (|:| |shpe|
                                                   (|Record|
                                                    (|:| |shptype| (|Symbol|))
                                                    (|:| |centre|
                                                         (QREFELT % 6))
                                                    (|:| |size| (QREFELT % 6))
                                                    (|:| |fill| (|Boolean|))))
                                              (|:| |nodename|
                                                   (|Record|
                                                    (|:| |nme| (|String|))
                                                    (|:| |node| %)))
                                              (|:| |np|
                                                   (|SceneNamedPoints|
                                                    (QREFELT % 6)))
                                              (|:| |empty| #21#))
                                             #12#)))
                          (|mk_DF| 25 -2) 8 (QREFELT % 172)))
                   (LETT |ifsR| (SPADCALL |meshR| NIL (QREFELT % 173)))
                   (LETT |i1| (SPADCALL |ifsR| (QREFELT % 62)))
                   (LETT |p1| (SPADCALL |ifsR| (QREFELT % 63)))
                   (LETT |i2|
                         (PROGN
                          (LETT #11# NIL)
                          (SEQ (LETT |k| NIL) (LETT #10# |i1|) G190
                               (COND
                                ((OR (ATOM #10#)
                                     (PROGN (LETT |k| (CAR #10#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #11#
                                       (CONS
                                        (PROGN
                                         (LETT #9# NIL)
                                         (SEQ (LETT |j| NIL) (LETT #8# |k|)
                                              G190
                                              (COND
                                               ((OR (ATOM #8#)
                                                    (PROGN
                                                     (LETT |j| (CAR #8#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #9#
                                                      (CONS
                                                       (+ |j|
                                                          (SPADCALL |indexNxt|
                                                                    (QREFELT %
                                                                             180)))
                                                       #9#))))
                                              (LETT #8# (CDR #8#)) (GO G190)
                                              G191 (EXIT (NREVERSE #9#))))
                                        #11#))))
                               (LETT #10# (CDR #10#)) (GO G190) G191
                               (EXIT (NREVERSE #11#)))))
                   (SPADCALL |ptLst|
                             (SPADCALL (SPADCALL |ptLst| (QREFELT % 181)) |p1|
                                       (QREFELT % 182))
                             (QREFELT % 183))
                   (SPADCALL |indexLst|
                             (SPADCALL (SPADCALL |indexLst| (QREFELT % 184))
                                       |i2| (QREFELT % 185))
                             (QREFELT % 186))
                   (SPADCALL |indexNxt|
                             (+ (SPADCALL |indexNxt| (QREFELT % 180))
                                (LENGTH |p1|))
                             (QREFELT % 187))
                   (EXIT (PROGN (LETT #2# (|Void|)) (GO #22#))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'IFS)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 5))
                     (|error| "toObj parameter type not valid for ifs node")))
                   (LETT |i1|
                         (QCAR
                          (PROG2 (LETT #7# (QVELT |n| 2))
                              (QCDR #7#)
                            (|check_union2| (QEQCAR #7# 5)
                                            (|Record|
                                             (|:| |inx|
                                                  (|List|
                                                   (|List|
                                                    (|NonNegativeInteger|))))
                                             (|:| |pts|
                                                  (|List| (QREFELT % 6))))
                                            (|Union|
                                             (|:| |points|
                                                  (|List|
                                                   (|List| (QREFELT % 6))))
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
                                                   (|:| |pos| (QREFELT % 6))
                                                   (|:| |np|
                                                        (|List| (|String|)))))
                                             (|:| |boundbox|
                                                  (|SBoundary| (QREFELT % 6)))
                                             (|:| |trans|
                                                  (|STransform| (QREFELT % 6)))
                                             (|:| |ifs|
                                                  (|Record|
                                                   (|:| |inx|
                                                        (|List|
                                                         (|List|
                                                          (|NonNegativeInteger|))))
                                                   (|:| |pts|
                                                        (|List|
                                                         (QREFELT % 6)))))
                                             (|:| |arrws|
                                                  (|Record|
                                                   (|:| |ln|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT % 6))))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |arrw|
                                                  (|Record|
                                                   (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT % 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |shpe|
                                                  (|Record|
                                                   (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT % 6))
                                                   (|:| |size| (QREFELT % 6))
                                                   (|:| |fill| (|Boolean|))))
                                             (|:| |nodename|
                                                  (|Record|
                                                   (|:| |nme| (|String|))
                                                   (|:| |node| %)))
                                             (|:| |np|
                                                  (|SceneNamedPoints|
                                                   (QREFELT % 6)))
                                             (|:| |empty| #21#))
                                            #7#))))
                   (LETT |p1|
                         (QCDR
                          (PROG2 (LETT #7# (QVELT |n| 2))
                              (QCDR #7#)
                            (|check_union2| (QEQCAR #7# 5)
                                            (|Record|
                                             (|:| |inx|
                                                  (|List|
                                                   (|List|
                                                    (|NonNegativeInteger|))))
                                             (|:| |pts|
                                                  (|List| (QREFELT % 6))))
                                            (|Union|
                                             (|:| |points|
                                                  (|List|
                                                   (|List| (QREFELT % 6))))
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
                                                   (|:| |pos| (QREFELT % 6))
                                                   (|:| |np|
                                                        (|List| (|String|)))))
                                             (|:| |boundbox|
                                                  (|SBoundary| (QREFELT % 6)))
                                             (|:| |trans|
                                                  (|STransform| (QREFELT % 6)))
                                             (|:| |ifs|
                                                  (|Record|
                                                   (|:| |inx|
                                                        (|List|
                                                         (|List|
                                                          (|NonNegativeInteger|))))
                                                   (|:| |pts|
                                                        (|List|
                                                         (QREFELT % 6)))))
                                             (|:| |arrws|
                                                  (|Record|
                                                   (|:| |ln|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT % 6))))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |arrw|
                                                  (|Record|
                                                   (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT % 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |shpe|
                                                  (|Record|
                                                   (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT % 6))
                                                   (|:| |size| (QREFELT % 6))
                                                   (|:| |fill| (|Boolean|))))
                                             (|:| |nodename|
                                                  (|Record|
                                                   (|:| |nme| (|String|))
                                                   (|:| |node| %)))
                                             (|:| |np|
                                                  (|SceneNamedPoints|
                                                   (QREFELT % 6)))
                                             (|:| |empty| #21#))
                                            #7#))))
                   (LETT |i2|
                         (PROGN
                          (LETT #6# NIL)
                          (SEQ (LETT |k| NIL) (LETT #5# |i1|) G190
                               (COND
                                ((OR (ATOM #5#)
                                     (PROGN (LETT |k| (CAR #5#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #6#
                                       (CONS
                                        (PROGN
                                         (LETT #4# NIL)
                                         (SEQ (LETT |j| NIL) (LETT #3# |k|)
                                              G190
                                              (COND
                                               ((OR (ATOM #3#)
                                                    (PROGN
                                                     (LETT |j| (CAR #3#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #4#
                                                      (CONS
                                                       (+ |j|
                                                          (SPADCALL |indexNxt|
                                                                    (QREFELT %
                                                                             180)))
                                                       #4#))))
                                              (LETT #3# (CDR #3#)) (GO G190)
                                              G191 (EXIT (NREVERSE #4#))))
                                        #6#))))
                               (LETT #5# (CDR #5#)) (GO G190) G191
                               (EXIT (NREVERSE #6#)))))
                   (SPADCALL |ptLst|
                             (SPADCALL (SPADCALL |ptLst| (QREFELT % 181)) |p1|
                                       (QREFELT % 182))
                             (QREFELT % 183))
                   (SPADCALL |indexLst|
                             (SPADCALL (SPADCALL |indexLst| (QREFELT % 184))
                                       |i2| (QREFELT % 185))
                             (QREFELT % 186))
                   (SPADCALL |indexNxt|
                             (+ (SPADCALL |indexNxt| (QREFELT % 180))
                                (LENGTH |p1|))
                             (QREFELT % 187))
                   (EXIT (PROGN (LETT #2# (|Void|)) (GO #22#))))))
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
                  ((< (SPADCALL (QVELT |n| 1) (QREFELT % 159)) 1) (|Void|))
                  ('T
                   (SEQ
                    (SEQ (LETT |ch| NIL) (LETT #1# (QVELT |n| 1)) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |ch| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |ch| |ptLst| |indexLst| |indexNxt| |tran2|
                                     |bb2| (QREFELT % 179))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT (|Void|))))))))
          #22# (EXIT #2#)))) 

(SDEFUN |SCENE;writeObj;%SV;84|
        ((|n| (%)) (|filename| (|String|)) (% (|Void|)))
        (SPROG
         ((|s| (|String|)) (#1=#:G1229 NIL) (|i| NIL) (#2=#:G1228 NIL)
          (|row| NIL) (#3=#:G1227 NIL) (|v| NIL) (|f1| (|TextFile|))
          (|defaultBounds| (|SBoundary| PT))
          (|defaultTransform| (|STransform| PT))
          (|indexNxt| (|Reference| (|NonNegativeInteger|)))
          (|indexLst| (|Reference| (|List| (|List| (|NonNegativeInteger|)))))
          (|ptLst| (|Reference| (|List| PT))))
         (SEQ (LETT |ptLst| (SPADCALL NIL (QREFELT % 188)))
              (LETT |indexLst| (SPADCALL NIL (QREFELT % 189)))
              (LETT |indexNxt| (SPADCALL 0 (QREFELT % 190)))
              (LETT |defaultTransform| (SPADCALL (QREFELT % 160)))
              (LETT |defaultBounds| (SPADCALL (QREFELT % 14)))
              (SPADCALL |n| |ptLst| |indexLst| |indexNxt| |defaultTransform|
                        |defaultBounds| (QREFELT % 179))
              (LETT |f1|
                    (SPADCALL (SPADCALL |filename| (QREFELT % 192)) "output"
                              (QREFELT % 194)))
              (SPADCALL |f1| "# mesh generated by fricas" (QREFELT % 195))
              (SEQ (LETT |v| NIL) (LETT #3# (SPADCALL |ptLst| (QREFELT % 181)))
                   G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |f1|
                               (SPADCALL
                                (LIST "v "
                                      (|mathObject2String|
                                       (SPADCALL |v| (QREFELT % 80)))
                                      " "
                                      (|mathObject2String|
                                       (SPADCALL |v| (QREFELT % 81)))
                                      " "
                                      (|mathObject2String|
                                       (SPADCALL |v| (QREFELT % 169))))
                                (QREFELT % 105))
                               (QREFELT % 195))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (LETT |s| "")
              (SEQ (LETT |row| NIL)
                   (LETT #2# (SPADCALL |indexLst| (QREFELT % 184))) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |row| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |s| "f")
                        (SEQ (LETT |i| NIL) (LETT #1# |row|) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |s|
                                     (SPADCALL
                                      (LIST |s| " " (STRINGIMAGE (+ |i| 1)))
                                      (QREFELT % 105)))))
                             (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                        (EXIT (SPADCALL |f1| |s| (QREFELT % 195))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (SPADCALL |f1| (QREFELT % 196)) (EXIT (|Void|))))) 

(SDEFUN |SCENE;writeVRML;%SV;85|
        ((|n| (%)) (|filename| (|String|)) (% (|Void|)))
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
                        1.0))
          (LETT |defaultTransform| (SPADCALL (QREFELT % 160)))
          (LETT |defaultBounds| (SPADCALL (QREFELT % 14)))
          (EXIT
           (SPADCALL
            (SPADCALL |n| |defaultMaterial| |defaultTransform| |defaultBounds|
                      (QREFELT % 171))
            |filename| (QREFELT % 198)))))) 

(SDEFUN |SCENE;Fnan?| ((|x| (|DoubleFloat|)) (% (|Boolean|)))
        (SPADCALL |x| |x| (QREFELT % 200))) 

(SDEFUN |SCENE;applyfxTrap|
        ((|ff| (|Mapping| (|DoubleFloat|) (|DoubleFloat|)))
         (|f| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|r| (|DoubleFloat|)) (|s| (|Union| (|DoubleFloat|) "failed")))
               (SEQ (LETT |s| (|trapNumericErrors| (SPADCALL |f| |ff|)))
                    (EXIT
                     (COND ((QEQCAR |s| 1) 0.0)
                           (#1='T
                            (SEQ (LETT |r| (QCDR |s|))
                                 (EXIT
                                  (COND
                                   ((SPADCALL |r| MOST-POSITIVE-DOUBLE-FLOAT
                                              (QREFELT % 138))
                                    MOST-POSITIVE-DOUBLE-FLOAT)
                                   ((|less_DF| |r| MOST-NEGATIVE-DOUBLE-FLOAT)
                                    MOST-NEGATIVE-DOUBLE-FLOAT)
                                   (#1# |r|)))))))))) 

(SDEFUN |SCENE;applyfxyTrap|
        ((|ff| (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|)))
         (|u| (|DoubleFloat|)) (|v| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|r| (|DoubleFloat|)) (|s| (|Union| (|DoubleFloat|) "failed")))
               (SEQ (LETT |s| (|trapNumericErrors| (SPADCALL |u| |v| |ff|)))
                    (EXIT
                     (COND ((QEQCAR |s| 1) 0.0)
                           (#1='T
                            (SEQ (LETT |r| (QCDR |s|))
                                 (EXIT
                                  (COND
                                   ((SPADCALL |r| MOST-POSITIVE-DOUBLE-FLOAT
                                              (QREFELT % 138))
                                    MOST-POSITIVE-DOUBLE-FLOAT)
                                   ((|less_DF| |r| MOST-NEGATIVE-DOUBLE-FLOAT)
                                    MOST-NEGATIVE-DOUBLE-FLOAT)
                                   (#1# |r|)))))))))) 

(SDEFUN |SCENE;normalize|
        ((|seg| (|Segment| (|DoubleFloat|))) (% (|Segment| (|DoubleFloat|))))
        (SPROG ((|b| #1=(|DoubleFloat|)) (|a| #1#))
               (SEQ (LETT |a| (SPADCALL |seg| (QREFELT % 124)))
                    (LETT |b| (SPADCALL |seg| (QREFELT % 125)))
                    (EXIT
                     (COND
                      ((|eql_DF| |a| |b|)
                       (|error| "The range specified is too small"))
                      ((|less_DF| |a| |b|) (SPADCALL |a| |b| (QREFELT % 201)))
                      ('T (SPADCALL |b| |a| (QREFELT % 201)))))))) 

(SDEFUN |SCENE;checkRange|
        ((|r| (|Segment| (|DoubleFloat|))) (% (|Segment| (|DoubleFloat|))))
        (COND
         ((SPADCALL (SPADCALL |r| (QREFELT % 124))
                    (SPADCALL |r| (QREFELT % 125)) (QREFELT % 138))
          (|error| "ranges cannot be negative"))
         ('T |r|))) 

(SDEFUN |SCENE;createPlot1Din2D;MSNni%;91|
        ((|f| (|Mapping| PT (|DoubleFloat|)))
         (|tRange| (|Segment| (|DoubleFloat|)))
         (|numPts| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((|branches| (|List| (|List| PT))) (|newl| (|List| PT))
          (#1=#:G1263 NIL) (|p| NIL) (|p0| (|List| PT))
          (|t| (|List| (|DoubleFloat|))) (|l| (|DoubleFloat|)) (#2=#:G1262 NIL)
          (|i| NIL) (|s| (|DoubleFloat|)) (|h| (|DoubleFloat|)))
         (SEQ (|SCENE;checkRange| |tRange| %)
              (LETT |l| (SPADCALL |tRange| (QREFELT % 124)))
              (LETT |h| (SPADCALL |tRange| (QREFELT % 125)))
              (LETT |t| (SPADCALL |l| (QREFELT % 203)))
              (LETT |p0| (SPADCALL (SPADCALL |l| |f|) (QREFELT % 204)))
              (LETT |s|
                    (|div_DF| (|sub_DF| |h| |l|)
                              (FLOAT (- |numPts| 1)
                                     MOST-POSITIVE-DOUBLE-FLOAT)))
              (SEQ (LETT |i| 2) (LETT #2# (- |numPts| 1)) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ (LETT |l| (|add_DF| |l| |s|)) (LETT |t| (CONS |l| |t|))
                        (EXIT (LETT |p0| (CONS (SPADCALL |l| |f|) |p0|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |t| (NREVERSE (CONS |h| |t|)))
              (LETT |p0| (NREVERSE (CONS (SPADCALL |h| |f|) |p0|)))
              (LETT |branches| NIL) (LETT |newl| NIL)
              (SEQ (LETT |p| NIL) (LETT #1# |p0|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |p| (QREFELT % 205))
                       (COND
                        ((NULL (NULL |newl|))
                         (SEQ
                          (LETT |branches|
                                (CONS (LETT |newl| (NREVERSE |newl|))
                                      |branches|))
                          (EXIT (LETT |newl| NIL))))))
                      ('T (LETT |newl| (CONS |p| |newl|))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (COND
               ((NULL (NULL |newl|))
                (LETT |branches|
                      (CONS (LETT |newl| (NREVERSE |newl|)) |branches|))))
              (EXIT (SPADCALL |branches| (QREFELT % 33)))))) 

(SDEFUN |SCENE;addPlot1Din2D;%MSNni%;92|
        ((|n| (%)) (|f| (|Mapping| PT (|DoubleFloat|)))
         (|tRange| (|Segment| (|DoubleFloat|)))
         (|numPts| (|NonNegativeInteger|)) (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (SPADCALL |f| |tRange| |numPts| (QREFELT % 207)))
                    (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createPlot1Din2D;MSNni%;93|
        ((|f| (|Mapping| (|DoubleFloat|) (|DoubleFloat|)))
         (|seg| (|Segment| (|DoubleFloat|))) (|numPts| (|NonNegativeInteger|))
         (% (%)))
        (SPROG ((|ff| (|List| (|Mapping| PT (|DoubleFloat|)))))
               (SEQ
                (LETT |ff|
                      (LIST
                       (CONS #'|SCENE;createPlot1Din2D;MSNni%;93!0|
                             (VECTOR % |f|))))
                (EXIT
                 (SPADCALL (SPADCALL |ff| (QREFELT % 210))
                           (|SCENE;normalize| |seg| %) |numPts|
                           (QREFELT % 207)))))) 

(SDEFUN |SCENE;createPlot1Din2D;MSNni%;93!0| ((|x| NIL) ($$ NIL))
        (PROG (|f| %)
          (LETT |f| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |x| (|SCENE;applyfxTrap| |f| |x| %) (QREFELT % 82)))))) 

(SDEFUN |SCENE;addPlot1Din2D;%MSNni%;94|
        ((|n| (%)) (|f| (|Mapping| (|DoubleFloat|) (|DoubleFloat|)))
         (|seg| (|Segment| (|DoubleFloat|))) (|numPts| (|NonNegativeInteger|))
         (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (SPADCALL |f| |seg| |numPts| (QREFELT % 212)))
                    (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createPlot1Din2Dparametric;PpcSNni%;95|
        ((|ppc|
          (|ParametricPlaneCurve| (|Mapping| (|DoubleFloat|) (|DoubleFloat|))))
         (|seg| (|Segment| (|DoubleFloat|))) (|numPts| (|NonNegativeInteger|))
         (% (%)))
        (SPROG
         ((|fcn| (|List| (|Mapping| PT (|DoubleFloat|))))
          (|g| #1=(|Mapping| (|DoubleFloat|) (|DoubleFloat|))) (|f| #1#))
         (SEQ (LETT |f| (SPADCALL |ppc| 1 (QREFELT % 215)))
              (LETT |g| (SPADCALL |ppc| 2 (QREFELT % 215)))
              (LETT |fcn|
                    (LIST
                     (CONS #'|SCENE;createPlot1Din2Dparametric;PpcSNni%;95!0|
                           (VECTOR |g| % |f|))))
              (EXIT
               (SPADCALL (SPADCALL |fcn| (QREFELT % 210))
                         (|SCENE;normalize| |seg| %) |numPts|
                         (QREFELT % 207)))))) 

(SDEFUN |SCENE;createPlot1Din2Dparametric;PpcSNni%;95!0| ((|x| NIL) ($$ NIL))
        (PROG (|f| % |g|)
          (LETT |f| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |g| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (|SCENE;applyfxTrap| |f| |x| %)
                      (|SCENE;applyfxTrap| |g| |x| %) (QREFELT % 82)))))) 

(SDEFUN |SCENE;addPlot1Din2Dparametric;%PpcSNni%;96|
        ((|n| (%))
         (|ppc|
          (|ParametricPlaneCurve| (|Mapping| (|DoubleFloat|) (|DoubleFloat|))))
         (|seg| (|Segment| (|DoubleFloat|))) (|numPts| (|NonNegativeInteger|))
         (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (SPADCALL |ppc| |seg| |numPts| (QREFELT % 216)))
                    (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createPlot1Din3Dparametric;PscSNni%;97|
        ((|psc|
          (|ParametricSpaceCurve| (|Mapping| (|DoubleFloat|) (|DoubleFloat|))))
         (|seg| (|Segment| (|DoubleFloat|))) (|numPts| (|NonNegativeInteger|))
         (% (%)))
        (SPROG
         ((|fcn| (|Mapping| PT (|DoubleFloat|)))
          (|h| #1=(|Mapping| (|DoubleFloat|) (|DoubleFloat|))) (|g| #1#)
          (|f| #1#))
         (SEQ (LETT |f| (SPADCALL |psc| 1 (QREFELT % 219)))
              (LETT |g| (SPADCALL |psc| 2 (QREFELT % 219)))
              (LETT |h| (SPADCALL |psc| 3 (QREFELT % 219)))
              (LETT |fcn|
                    (CONS #'|SCENE;createPlot1Din3Dparametric;PscSNni%;97!0|
                          (VECTOR |h| |g| % |f|)))
              (EXIT (SPADCALL |fcn| |seg| |numPts| (QREFELT % 220)))))) 

(SDEFUN |SCENE;createPlot1Din3Dparametric;PscSNni%;97!0| ((|x| NIL) ($$ NIL))
        (PROG (|f| % |g| |h|)
          (LETT |f| (QREFELT $$ 3))
          (LETT % (QREFELT $$ 2))
          (LETT |g| (QREFELT $$ 1))
          (LETT |h| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (|SCENE;applyfxTrap| |f| |x| %)
                      (|SCENE;applyfxTrap| |g| |x| %)
                      (|SCENE;applyfxTrap| |h| |x| %) (QREFELT % 66)))))) 

(SDEFUN |SCENE;addPlot1Din3Dparametric;%PscSNni%;98|
        ((|n| (%))
         (|psc|
          (|ParametricSpaceCurve| (|Mapping| (|DoubleFloat|) (|DoubleFloat|))))
         (|seg| (|Segment| (|DoubleFloat|))) (|numPts| (|NonNegativeInteger|))
         (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (SPADCALL |psc| |seg| |numPts| (QREFELT % 221)))
                    (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createPlot1Din3Dparametric;MSNni%;99|
        ((|psc| (|Mapping| PT (|DoubleFloat|)))
         (|seg| (|Segment| (|DoubleFloat|))) (|numPts| (|NonNegativeInteger|))
         (% (%)))
        (SPROG
         ((|p| (|List| PT)) (|t| (|List| (|DoubleFloat|)))
          (|l| (|DoubleFloat|)) (#1=#:G1303 NIL) (|i| NIL)
          (|s| (|DoubleFloat|)) (|h| (|DoubleFloat|))
          (|tRange| (|Segment| (|DoubleFloat|)))
          (|f| (|Mapping| PT (|DoubleFloat|))))
         (SEQ (LETT |f| |psc|) (LETT |tRange| (|SCENE;normalize| |seg| %))
              (|SCENE;checkRange| |tRange| %)
              (LETT |l| (SPADCALL |tRange| (QREFELT % 124)))
              (LETT |h| (SPADCALL |tRange| (QREFELT % 125)))
              (LETT |t| (SPADCALL |l| (QREFELT % 203)))
              (LETT |p| (SPADCALL (SPADCALL |l| |f|) (QREFELT % 204)))
              (LETT |s|
                    (|div_DF| (|sub_DF| |h| |l|)
                              (FLOAT (- |numPts| 1)
                                     MOST-POSITIVE-DOUBLE-FLOAT)))
              (SEQ (LETT |i| 2) (LETT #1# (- |numPts| 1)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (LETT |l| (|add_DF| |l| |s|)) (LETT |t| (CONS |l| |t|))
                        (EXIT (LETT |p| (CONS (SPADCALL |l| |f|) |p|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |t| (NREVERSE (CONS |h| |t|)))
              (LETT |p| (NREVERSE (CONS (SPADCALL |h| |f|) |p|)))
              (EXIT (SPADCALL |p| (QREFELT % 21)))))) 

(SDEFUN |SCENE;addPlot1Din3Dparametric;%MSNni%;100|
        ((|n| (%)) (|psc| (|Mapping| PT (|DoubleFloat|)))
         (|seg| (|Segment| (|DoubleFloat|))) (|numPts| (|NonNegativeInteger|))
         (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (SPADCALL |psc| |seg| |numPts| (QREFELT % 220)))
                    (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createPlot2Din3D;M2SNni%;101|
        ((|ptFun| (|Mapping| PT (|DoubleFloat|) (|DoubleFloat|)))
         (|uSeg| (|Segment| (|DoubleFloat|)))
         (|vSeg| (|Segment| (|DoubleFloat|))) (|numPts| (|NonNegativeInteger|))
         (% (%)))
        (SPROG
         ((|someV| #1=(|DoubleFloat|)) (|llp| (|List| (|List| PT)))
          (|someU| #1#) (|lp| (|List| PT)) (|pt| (PT)) (|iu| NIL) (|iv| NIL)
          (|vstep| #2=(|DoubleFloat|)) (|ustep| #2#))
         (SEQ (LETT |llp| NIL)
              (LETT |ustep|
                    (|div_DF_I|
                     (|sub_DF| (SPADCALL |uSeg| (QREFELT % 124))
                               (SPADCALL |uSeg| (QREFELT % 125)))
                     |numPts|))
              (LETT |vstep|
                    (|div_DF_I|
                     (|sub_DF| (SPADCALL |vSeg| (QREFELT % 124))
                               (SPADCALL |vSeg| (QREFELT % 125)))
                     |numPts|))
              (LETT |someV| (SPADCALL |vSeg| (QREFELT % 125)))
              (SEQ (LETT |iv| |numPts|) G190 (COND ((< |iv| 0) (GO G191)))
                   (SEQ
                    (COND
                     ((ZEROP |iv|)
                      (LETT |someV| (SPADCALL |vSeg| (QREFELT % 124)))))
                    (LETT |lp| NIL)
                    (LETT |someU| (SPADCALL |uSeg| (QREFELT % 125)))
                    (SEQ (LETT |iu| |numPts|) G190
                         (COND ((< |iu| 0) (GO G191)))
                         (SEQ
                          (COND
                           ((ZEROP |iu|)
                            (LETT |someU| (SPADCALL |uSeg| (QREFELT % 124)))))
                          (LETT |pt| (SPADCALL |someU| |someV| |ptFun|))
                          (LETT |lp| (CONS |pt| |lp|))
                          (EXIT (LETT |someU| (|add_DF| |someU| |ustep|))))
                         (LETT |iu| (+ |iu| -1)) (GO G190) G191 (EXIT NIL))
                    (LETT |llp| (CONS |lp| |llp|))
                    (EXIT (LETT |someV| (|add_DF| |someV| |vstep|))))
                   (LETT |iv| (+ |iv| -1)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (SPADCALL |llp| NIL (QREFELT % 173))
                         (QREFELT % 64)))))) 

(SDEFUN |SCENE;createPlot2Din3D;M2SNni%;102|
        ((|f| (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|)))
         (|xSeg| (|Segment| (|DoubleFloat|)))
         (|ySeg| (|Segment| (|DoubleFloat|))) (|numPts| (|NonNegativeInteger|))
         (% (%)))
        (SPROG
         ((|fcn| (|List| (|Mapping| PT (|DoubleFloat|) (|DoubleFloat|)))))
         (SEQ
          (LETT |fcn|
                (LIST
                 (CONS #'|SCENE;createPlot2Din3D;M2SNni%;102!0|
                       (VECTOR % |f|))))
          (EXIT
           (SPADCALL (SPADCALL |fcn| (QREFELT % 227))
                     (|SCENE;normalize| |xSeg| %) (|SCENE;normalize| |ySeg| %)
                     |numPts| (QREFELT % 225)))))) 

(SDEFUN |SCENE;createPlot2Din3D;M2SNni%;102!0| ((|x| NIL) (|y| NIL) ($$ NIL))
        (PROG (|f| %)
          (LETT |f| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (|SCENE;applyfxyTrap| |f| |x| |y| %) |x| |y|
                      (QREFELT % 66)))))) 

(SDEFUN |SCENE;addPlot2Din3D;%M2SNni%;103|
        ((|n| (%))
         (|f| (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|)))
         (|xSeg| (|Segment| (|DoubleFloat|)))
         (|ySeg| (|Segment| (|DoubleFloat|))) (|numPts| (|NonNegativeInteger|))
         (% (%)))
        (SPROG ((|c| (%)))
               (SEQ
                (LETT |c|
                      (SPADCALL |f| |xSeg| |ySeg| |numPts| (QREFELT % 229)))
                (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createPlot2Din3Dparametric;Ps2SNni%;104|
        ((|s|
          (|ParametricSurface|
           (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))))
         (|uSeg| (|Segment| (|DoubleFloat|)))
         (|vSeg| (|Segment| (|DoubleFloat|))) (|numPts| (|NonNegativeInteger|))
         (% (%)))
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
                (LIST (SPADCALL |s| (|spadConstant| % 232) (QREFELT % 234))))
          (LETT |g| (LIST (SPADCALL |s| 2 (QREFELT % 234))))
          (LETT |h| (LIST (SPADCALL |s| 3 (QREFELT % 234))))
          (LETT |fcn|
                (LIST
                 (CONS #'|SCENE;createPlot2Din3Dparametric;Ps2SNni%;104!0|
                       (VECTOR |h| |g| % |f|))))
          (EXIT
           (SPADCALL (SPADCALL |fcn| (QREFELT % 227))
                     (|SCENE;normalize| |uSeg| %) (|SCENE;normalize| |vSeg| %)
                     |numPts| (QREFELT % 225)))))) 

(SDEFUN |SCENE;createPlot2Din3Dparametric;Ps2SNni%;104!0|
        ((|x| NIL) (|y| NIL) ($$ NIL))
        (PROG (|f| % |g| |h|)
          (LETT |f| (QREFELT $$ 3))
          (LETT % (QREFELT $$ 2))
          (LETT |g| (QREFELT $$ 1))
          (LETT |h| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (|SCENE;applyfxyTrap| (SPADCALL |f| (QREFELT % 236)) |x| |y| %)
             (|SCENE;applyfxyTrap| (SPADCALL |g| (QREFELT % 236)) |x| |y| %)
             (|SCENE;applyfxyTrap| (SPADCALL |h| (QREFELT % 236)) |x| |y| %)
             (QREFELT % 66)))))) 

(SDEFUN |SCENE;addPlot2Din3Dparametric;%Ps2SNni%;105|
        ((|n| (%))
         (|s|
          (|ParametricSurface|
           (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))))
         (|uSeg| (|Segment| (|DoubleFloat|)))
         (|vSeg| (|Segment| (|DoubleFloat|))) (|numPts| (|NonNegativeInteger|))
         (% (%)))
        (SPROG ((|c| (%)))
               (SEQ
                (LETT |c|
                      (SPADCALL |s| |uSeg| |vSeg| |numPts| (QREFELT % 237)))
                (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;createPlot2Din3Dparametric;M2SNni%;106|
        ((|s| (|Mapping| PT (|DoubleFloat|) (|DoubleFloat|)))
         (|uSeg| (|Segment| (|DoubleFloat|)))
         (|vSeg| (|Segment| (|DoubleFloat|))) (|numPts| (|NonNegativeInteger|))
         (% (%)))
        (SPROG
         ((|fcn| (|List| (|Mapping| PT (|DoubleFloat|) (|DoubleFloat|)))))
         (SEQ (LETT |fcn| (LIST |s|))
              (EXIT
               (SPADCALL (SPADCALL |fcn| (QREFELT % 227))
                         (|SCENE;normalize| |uSeg| %)
                         (|SCENE;normalize| |vSeg| %) |numPts|
                         (QREFELT % 225)))))) 

(SDEFUN |SCENE;addPlot2Din3Dparametric;%M2SNni%;107|
        ((|n| (%)) (|s| (|Mapping| PT (|DoubleFloat|) (|DoubleFloat|)))
         (|uSeg| (|Segment| (|DoubleFloat|)))
         (|vSeg| (|Segment| (|DoubleFloat|))) (|numPts| (|NonNegativeInteger|))
         (% (%)))
        (SPROG ((|c| (%)))
               (SEQ
                (LETT |c|
                      (SPADCALL |s| |uSeg| |vSeg| |numPts| (QREFELT % 239)))
                (SPADCALL |n| |c| (QREFELT % 18)) (EXIT |c|)))) 

(SDEFUN |SCENE;outputLPoints| ((|ps| (|List| PT)) (% (|OutputForm|)))
        (SPROG ((#1=#:G1371 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((< (LENGTH |ps|) 4)
                    (PROGN
                     (LETT #1# (SPADCALL |ps| (QREFELT % 242)))
                     (GO #2=#:G1370))))
                  (EXIT
                   (SPADCALL
                    (LIST (SPADCALL (|SPADfirst| |ps|) (QREFELT % 243))
                          (SPADCALL (SPADCALL |ps| (QREFELT % 244))
                                    (QREFELT % 243))
                          (SPADCALL "...." (QREFELT % 245)))
                    (QREFELT % 246)))))
                #2# (EXIT #1#)))) 

(SDEFUN |SCENE;outputLLPoints| ((|ps| (|List| (|List| PT))) (% (|OutputForm|)))
        (SPROG ((#1=#:G1377 NIL) (#2=#:G1379 NIL) (|x| NIL) (#3=#:G1378 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((< (LENGTH |ps|) 4)
                    (PROGN
                     (LETT #1#
                           (SPADCALL
                            (PROGN
                             (LETT #3# NIL)
                             (SEQ (LETT |x| NIL) (LETT #2# |ps|) G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |x| (CAR #2#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #3#
                                          (CONS (|SCENE;outputLPoints| |x| %)
                                                #3#))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT (NREVERSE #3#))))
                            (QREFELT % 246)))
                     (GO #4=#:G1376))))
                  (EXIT
                   (SPADCALL
                    (LIST (|SCENE;outputLPoints| (|SPADfirst| |ps|) %)
                          (|SCENE;outputLPoints|
                           (SPADCALL |ps| (QREFELT % 247)) %)
                          (SPADCALL "...." (QREFELT % 245)))
                    (QREFELT % 246)))))
                #4# (EXIT #1#)))) 

(SDEFUN |SCENE;outputLIndexes|
        ((|ps| (|List| (|NonNegativeInteger|))) (% (|OutputForm|)))
        (SPROG ((#1=#:G1383 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((< (SPADCALL |ps| (QREFELT % 98)) 4)
                    (PROGN
                     (LETT #1# (SPADCALL |ps| (QREFELT % 248)))
                     (GO #2=#:G1382))))
                  (EXIT
                   (SPADCALL
                    (LIST (SPADCALL (|SPADfirst| |ps|) (QREFELT % 249))
                          (SPADCALL (SPADCALL |ps| (QREFELT % 250))
                                    (QREFELT % 249))
                          (SPADCALL "...." (QREFELT % 245)))
                    (QREFELT % 246)))))
                #2# (EXIT #1#)))) 

(SDEFUN |SCENE;outputLLIndexes|
        ((|ps| (|List| (|List| (|NonNegativeInteger|)))) (% (|OutputForm|)))
        (SPROG ((#1=#:G1389 NIL) (#2=#:G1391 NIL) (|x| NIL) (#3=#:G1390 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((< (LENGTH |ps|) 4)
                    (PROGN
                     (LETT #1#
                           (SPADCALL
                            (PROGN
                             (LETT #3# NIL)
                             (SEQ (LETT |x| NIL) (LETT #2# |ps|) G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |x| (CAR #2#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #3#
                                          (CONS (|SCENE;outputLIndexes| |x| %)
                                                #3#))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT (NREVERSE #3#))))
                            (QREFELT % 246)))
                     (GO #4=#:G1388))))
                  (EXIT
                   (SPADCALL
                    (LIST (|SCENE;outputLIndexes| (|SPADfirst| |ps|) %)
                          (|SCENE;outputLIndexes|
                           (SPADCALL |ps| (QREFELT % 251)) %)
                          (SPADCALL "...." (QREFELT % 245)))
                    (QREFELT % 246)))))
                #4# (EXIT #1#)))) 

(SDEFUN |SCENE;coerce;%Of;112| ((|n| (%)) (% (|OutputForm|)))
        (SPROG
         ((|s| (|OutputForm|)) (|nam| (|SceneNamedPoints| PT)) (#1=#:G1410 NIL)
          (|nn| (|String|)) (#2=#:G1409 NIL) (|sz| (|DoubleFloat|))
          (#3=#:G1407 NIL) (|md| (|Symbol|)) (|ofs| (PT)) (|ena| (|String|))
          (|str| (|String|)) (#4=#:G1406 NIL) (|m| (|Symbol|))
          (|pts| (|List| (|List| PT))) (|pt| (|List| PT)) (#5=#:G1405 NIL)
          (|ix| (|List| (|List| (|NonNegativeInteger|)))) (#6=#:G1403 NIL)
          (|tr| (|STransform| PT)) (#7=#:G1404 NIL) (|npt| (|List| (|String|)))
          (#8=#:G1402 NIL) (|p| (PT)) (|sz1| (|NonNegativeInteger|))
          (|t| (|String|)) (|mo| (|DoubleFloat|)) (#9=#:G1401 NIL)
          (|fc| (|String|)) (|lc| (|String|)) (|lw| (|DoubleFloat|))
          (|pt2| (PT)) (#10=#:G1408 NIL) (|pt1| (PT)) (|tp| (|Symbol|))
          (#11=#:G1400 NIL))
         (SEQ (LETT |s| (SPADCALL "scene " (QREFELT % 245)))
              (COND
               ((EQUAL (QVELT |n| 0) 'ROOT)
                (LETT |s|
                      (SPADCALL
                       (LIST |s| (SPADCALL "root " (QREFELT % 245))
                             (SPADCALL
                              (PROG2 (LETT #6# (QVELT |n| 2))
                                  (QCDR #6#)
                                (|check_union2| (QEQCAR #6# 3)
                                                (|SBoundary| (QREFELT % 6))
                                                (|Union|
                                                 (|:| |points|
                                                      (|List|
                                                       (|List| (QREFELT % 6))))
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
                                                            (QREFELT % 6))
                                                       (|:| |np|
                                                            (|List|
                                                             (|String|)))))
                                                 (|:| |boundbox|
                                                      (|SBoundary|
                                                       (QREFELT % 6)))
                                                 (|:| |trans|
                                                      (|STransform|
                                                       (QREFELT % 6)))
                                                 (|:| |ifs|
                                                      (|Record|
                                                       (|:| |inx|
                                                            (|List|
                                                             (|List|
                                                              (|NonNegativeInteger|))))
                                                       (|:| |pts|
                                                            (|List|
                                                             (QREFELT % 6)))))
                                                 (|:| |arrws|
                                                      (|Record|
                                                       (|:| |ln|
                                                            (|List|
                                                             (|List|
                                                              (QREFELT % 6))))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                                 (|:| |arrw|
                                                      (|Record|
                                                       (|:| |st| (|String|))
                                                       (|:| |en| (|String|))
                                                       (|:| |offset|
                                                            (QREFELT % 6))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                                 (|:| |shpe|
                                                      (|Record|
                                                       (|:| |shptype|
                                                            (|Symbol|))
                                                       (|:| |centre|
                                                            (QREFELT % 6))
                                                       (|:| |size|
                                                            (QREFELT % 6))
                                                       (|:| |fill|
                                                            (|Boolean|))))
                                                 (|:| |nodename|
                                                      (|Record|
                                                       (|:| |nme| (|String|))
                                                       (|:| |node| %)))
                                                 (|:| |np|
                                                      (|SceneNamedPoints|
                                                       (QREFELT % 6)))
                                                 (|:| |empty| #12="empty"))
                                                #6#))
                              (QREFELT % 252)))
                       (QREFELT % 253)))))
              (COND
               ((EQUAL (QVELT |n| 0) 'GROUP)
                (LETT |s|
                      (SPADCALL |s| (SPADCALL "group" (QREFELT % 245))
                                (QREFELT % 254)))))
              (COND
               ((EQUAL (QVELT |n| 0) 'LINE)
                (LETT |s|
                      (SPADCALL
                       (LIST |s| (SPADCALL "line " (QREFELT % 245))
                             (|SCENE;outputLLPoints|
                              (PROG2 (LETT #11# (QVELT |n| 2))
                                  (QCDR #11#)
                                (|check_union2| (QEQCAR #11# 0)
                                                (|List| (|List| (QREFELT % 6)))
                                                (|Union|
                                                 (|:| |points|
                                                      (|List|
                                                       (|List| (QREFELT % 6))))
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
                                                            (QREFELT % 6))
                                                       (|:| |np|
                                                            (|List|
                                                             (|String|)))))
                                                 (|:| |boundbox|
                                                      (|SBoundary|
                                                       (QREFELT % 6)))
                                                 (|:| |trans|
                                                      (|STransform|
                                                       (QREFELT % 6)))
                                                 (|:| |ifs|
                                                      (|Record|
                                                       (|:| |inx|
                                                            (|List|
                                                             (|List|
                                                              (|NonNegativeInteger|))))
                                                       (|:| |pts|
                                                            (|List|
                                                             (QREFELT % 6)))))
                                                 (|:| |arrws|
                                                      (|Record|
                                                       (|:| |ln|
                                                            (|List|
                                                             (|List|
                                                              (QREFELT % 6))))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                                 (|:| |arrw|
                                                      (|Record|
                                                       (|:| |st| (|String|))
                                                       (|:| |en| (|String|))
                                                       (|:| |offset|
                                                            (QREFELT % 6))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                                 (|:| |shpe|
                                                      (|Record|
                                                       (|:| |shptype|
                                                            (|Symbol|))
                                                       (|:| |centre|
                                                            (QREFELT % 6))
                                                       (|:| |size|
                                                            (QREFELT % 6))
                                                       (|:| |fill|
                                                            (|Boolean|))))
                                                 (|:| |nodename|
                                                      (|Record|
                                                       (|:| |nme| (|String|))
                                                       (|:| |node| %)))
                                                 (|:| |np|
                                                      (|SceneNamedPoints|
                                                       (QREFELT % 6)))
                                                 (|:| |empty| #12#))
                                                #11#))
                              %))
                       (QREFELT % 253)))))
              (COND
               ((EQUAL (QVELT |n| 0) 'SHAPE)
                (SEQ
                 (LETT |tp|
                       (QVELT
                        (PROG2 (LETT #10# (QVELT |n| 2))
                            (QCDR #10#)
                          (|check_union2| (QEQCAR #10# 8)
                                          (|Record| (|:| |shptype| (|Symbol|))
                                                    (|:| |centre|
                                                         (QREFELT % 6))
                                                    (|:| |size| (QREFELT % 6))
                                                    (|:| |fill| (|Boolean|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT % 6))))
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
                                                 (|:| |pos| (QREFELT % 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT % 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT % 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT % 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT % 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT % 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT % 6))
                                                 (|:| |size| (QREFELT % 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| %)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT % 6)))
                                           (|:| |empty| #12#))
                                          #10#))
                        0))
                 (LETT |pt1|
                       (QVELT
                        (PROG2 (LETT #10# (QVELT |n| 2))
                            (QCDR #10#)
                          (|check_union2| (QEQCAR #10# 8)
                                          (|Record| (|:| |shptype| (|Symbol|))
                                                    (|:| |centre|
                                                         (QREFELT % 6))
                                                    (|:| |size| (QREFELT % 6))
                                                    (|:| |fill| (|Boolean|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT % 6))))
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
                                                 (|:| |pos| (QREFELT % 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT % 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT % 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT % 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT % 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT % 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT % 6))
                                                 (|:| |size| (QREFELT % 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| %)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT % 6)))
                                           (|:| |empty| #12#))
                                          #10#))
                        1))
                 (LETT |pt2|
                       (QVELT
                        (PROG2 (LETT #10# (QVELT |n| 2))
                            (QCDR #10#)
                          (|check_union2| (QEQCAR #10# 8)
                                          (|Record| (|:| |shptype| (|Symbol|))
                                                    (|:| |centre|
                                                         (QREFELT % 6))
                                                    (|:| |size| (QREFELT % 6))
                                                    (|:| |fill| (|Boolean|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT % 6))))
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
                                                 (|:| |pos| (QREFELT % 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT % 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT % 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT % 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT % 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT % 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT % 6))
                                                 (|:| |size| (QREFELT % 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| %)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT % 6)))
                                           (|:| |empty| #12#))
                                          #10#))
                        2))
                 (EXIT
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| (SPADCALL "shape" (QREFELT % 245))
                               (SPADCALL " type=" (QREFELT % 245))
                               (SPADCALL |tp| (QREFELT % 255))
                               (SPADCALL " pt1=" (QREFELT % 245))
                               (SPADCALL |pt1| (QREFELT % 243))
                               (SPADCALL " pt2=" (QREFELT % 245))
                               (SPADCALL |pt2| (QREFELT % 243)))
                         (QREFELT % 253)))))))
              (COND
               ((EQUAL (QVELT |n| 0) 'MATERIAL)
                (SEQ
                 (LETT |lw|
                       (QVELT
                        (PROG2 (LETT #9# (QVELT |n| 2))
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
                                                 (|List| (QREFELT % 6))))
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
                                                 (|:| |pos| (QREFELT % 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT % 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT % 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT % 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT % 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT % 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT % 6))
                                                 (|:| |size| (QREFELT % 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| %)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT % 6)))
                                           (|:| |empty| #12#))
                                          #9#))
                        0))
                 (LETT |lc|
                       (QVELT
                        (PROG2 (LETT #9# (QVELT |n| 2))
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
                                                 (|List| (QREFELT % 6))))
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
                                                 (|:| |pos| (QREFELT % 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT % 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT % 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT % 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT % 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT % 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT % 6))
                                                 (|:| |size| (QREFELT % 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| %)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT % 6)))
                                           (|:| |empty| #12#))
                                          #9#))
                        1))
                 (LETT |fc|
                       (QVELT
                        (PROG2 (LETT #9# (QVELT |n| 2))
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
                                                 (|List| (QREFELT % 6))))
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
                                                 (|:| |pos| (QREFELT % 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT % 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT % 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT % 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT % 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT % 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT % 6))
                                                 (|:| |size| (QREFELT % 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| %)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT % 6)))
                                           (|:| |empty| #12#))
                                          #9#))
                        2))
                 (LETT |mo|
                       (QVELT
                        (PROG2 (LETT #9# (QVELT |n| 2))
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
                                                 (|List| (QREFELT % 6))))
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
                                                 (|:| |pos| (QREFELT % 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT % 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT % 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT % 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT % 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT % 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT % 6))
                                                 (|:| |size| (QREFELT % 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| %)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT % 6)))
                                           (|:| |empty| #12#))
                                          #9#))
                        3))
                 (EXIT
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| (SPADCALL "material" (QREFELT % 245))
                               (SPADCALL " lw=" (QREFELT % 245))
                               (SPADCALL |lw| (QREFELT % 256))
                               (SPADCALL " lc=" (QREFELT % 245))
                               (SPADCALL |lc| (QREFELT % 257))
                               (SPADCALL " fc=" (QREFELT % 245))
                               (SPADCALL |fc| (QREFELT % 257))
                               (SPADCALL " mo=" (QREFELT % 245))
                               (SPADCALL |mo| (QREFELT % 256)))
                         (QREFELT % 253)))))))
              (COND
               ((EQUAL (QVELT |n| 0) 'TEXT)
                (SEQ
                 (LETT |t|
                       (QVELT
                        (PROG2 (LETT #8# (QVELT |n| 2))
                            (QCDR #8#)
                          (|check_union2| (QEQCAR #8# 2)
                                          (|Record| (|:| |txt| (|String|))
                                                    (|:| |siz|
                                                         (|NonNegativeInteger|))
                                                    (|:| |pos| (QREFELT % 6))
                                                    (|:| |np|
                                                         (|List| (|String|))))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT % 6))))
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
                                                 (|:| |pos| (QREFELT % 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT % 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT % 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT % 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT % 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT % 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT % 6))
                                                 (|:| |size| (QREFELT % 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| %)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT % 6)))
                                           (|:| |empty| #12#))
                                          #8#))
                        0))
                 (LETT |sz1|
                       (QVELT
                        (PROG2 (LETT #8# (QVELT |n| 2))
                            (QCDR #8#)
                          (|check_union2| (QEQCAR #8# 2)
                                          (|Record| (|:| |txt| (|String|))
                                                    (|:| |siz|
                                                         (|NonNegativeInteger|))
                                                    (|:| |pos| (QREFELT % 6))
                                                    (|:| |np|
                                                         (|List| (|String|))))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT % 6))))
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
                                                 (|:| |pos| (QREFELT % 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT % 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT % 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT % 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT % 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT % 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT % 6))
                                                 (|:| |size| (QREFELT % 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| %)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT % 6)))
                                           (|:| |empty| #12#))
                                          #8#))
                        1))
                 (LETT |p|
                       (QVELT
                        (PROG2 (LETT #8# (QVELT |n| 2))
                            (QCDR #8#)
                          (|check_union2| (QEQCAR #8# 2)
                                          (|Record| (|:| |txt| (|String|))
                                                    (|:| |siz|
                                                         (|NonNegativeInteger|))
                                                    (|:| |pos| (QREFELT % 6))
                                                    (|:| |np|
                                                         (|List| (|String|))))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT % 6))))
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
                                                 (|:| |pos| (QREFELT % 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT % 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT % 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT % 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT % 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT % 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT % 6))
                                                 (|:| |size| (QREFELT % 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| %)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT % 6)))
                                           (|:| |empty| #12#))
                                          #8#))
                        2))
                 (LETT |npt|
                       (QVELT
                        (PROG2 (LETT #8# (QVELT |n| 2))
                            (QCDR #8#)
                          (|check_union2| (QEQCAR #8# 2)
                                          (|Record| (|:| |txt| (|String|))
                                                    (|:| |siz|
                                                         (|NonNegativeInteger|))
                                                    (|:| |pos| (QREFELT % 6))
                                                    (|:| |np|
                                                         (|List| (|String|))))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT % 6))))
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
                                                 (|:| |pos| (QREFELT % 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT % 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT % 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT % 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT % 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT % 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT % 6))
                                                 (|:| |size| (QREFELT % 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| %)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT % 6)))
                                           (|:| |empty| #12#))
                                          #8#))
                        3))
                 (EXIT
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| (SPADCALL "text=" (QREFELT % 245))
                               (SPADCALL |t| (QREFELT % 257))
                               (SPADCALL " sz=" (QREFELT % 245))
                               (SPADCALL |sz1| (QREFELT % 249))
                               (SPADCALL " p=" (QREFELT % 245))
                               (SPADCALL |p| (QREFELT % 243))
                               (SPADCALL " npt=" (QREFELT % 245))
                               (SPADCALL |npt| (QREFELT % 258)))
                         (QREFELT % 253)))))))
              (COND
               ((EQUAL (QVELT |n| 0) 'TRANSFORM)
                (SEQ
                 (LETT |tr|
                       (PROG2 (LETT #7# (QVELT |n| 2))
                           (QCDR #7#)
                         (|check_union2| (QEQCAR #7# 4)
                                         (|STransform| (QREFELT % 6))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT % 6))))
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
                                                              (QREFELT % 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT % 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT % 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT % 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT % 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT % 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT % 6))
                                                (|:| |size| (QREFELT % 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| %)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT % 6)))
                                          (|:| |empty| #12#))
                                         #7#)))
                 (EXIT
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| (SPADCALL "transform" (QREFELT % 245))
                               (SPADCALL " tr=" (QREFELT % 245))
                               (SPADCALL |tr| (QREFELT % 259)))
                         (QREFELT % 253)))))))
              (COND
               ((EQUAL (QVELT |n| 0) 'CLIP)
                (LETT |s|
                      (SPADCALL
                       (LIST |s| (SPADCALL "clip " (QREFELT % 245))
                             (SPADCALL
                              (PROG2 (LETT #6# (QVELT |n| 2))
                                  (QCDR #6#)
                                (|check_union2| (QEQCAR #6# 3)
                                                (|SBoundary| (QREFELT % 6))
                                                (|Union|
                                                 (|:| |points|
                                                      (|List|
                                                       (|List| (QREFELT % 6))))
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
                                                            (QREFELT % 6))
                                                       (|:| |np|
                                                            (|List|
                                                             (|String|)))))
                                                 (|:| |boundbox|
                                                      (|SBoundary|
                                                       (QREFELT % 6)))
                                                 (|:| |trans|
                                                      (|STransform|
                                                       (QREFELT % 6)))
                                                 (|:| |ifs|
                                                      (|Record|
                                                       (|:| |inx|
                                                            (|List|
                                                             (|List|
                                                              (|NonNegativeInteger|))))
                                                       (|:| |pts|
                                                            (|List|
                                                             (QREFELT % 6)))))
                                                 (|:| |arrws|
                                                      (|Record|
                                                       (|:| |ln|
                                                            (|List|
                                                             (|List|
                                                              (QREFELT % 6))))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                                 (|:| |arrw|
                                                      (|Record|
                                                       (|:| |st| (|String|))
                                                       (|:| |en| (|String|))
                                                       (|:| |offset|
                                                            (QREFELT % 6))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                                 (|:| |shpe|
                                                      (|Record|
                                                       (|:| |shptype|
                                                            (|Symbol|))
                                                       (|:| |centre|
                                                            (QREFELT % 6))
                                                       (|:| |size|
                                                            (QREFELT % 6))
                                                       (|:| |fill|
                                                            (|Boolean|))))
                                                 (|:| |nodename|
                                                      (|Record|
                                                       (|:| |nme| (|String|))
                                                       (|:| |node| %)))
                                                 (|:| |np|
                                                      (|SceneNamedPoints|
                                                       (QREFELT % 6)))
                                                 (|:| |empty| #12#))
                                                #6#))
                              (QREFELT % 252)))
                       (QREFELT % 253)))))
              (COND
               ((EQUAL (QVELT |n| 0) 'IFS)
                (SEQ
                 (LETT |ix|
                       (QCAR
                        (PROG2 (LETT #5# (QVELT |n| 2))
                            (QCDR #5#)
                          (|check_union2| (QEQCAR #5# 5)
                                          (|Record|
                                           (|:| |inx|
                                                (|List|
                                                 (|List|
                                                  (|NonNegativeInteger|))))
                                           (|:| |pts| (|List| (QREFELT % 6))))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT % 6))))
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
                                                 (|:| |pos| (QREFELT % 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT % 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT % 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT % 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT % 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT % 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT % 6))
                                                 (|:| |size| (QREFELT % 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| %)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT % 6)))
                                           (|:| |empty| #12#))
                                          #5#))))
                 (LETT |pt|
                       (QCDR
                        (PROG2 (LETT #5# (QVELT |n| 2))
                            (QCDR #5#)
                          (|check_union2| (QEQCAR #5# 5)
                                          (|Record|
                                           (|:| |inx|
                                                (|List|
                                                 (|List|
                                                  (|NonNegativeInteger|))))
                                           (|:| |pts| (|List| (QREFELT % 6))))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT % 6))))
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
                                                 (|:| |pos| (QREFELT % 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT % 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT % 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT % 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT % 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT % 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT % 6))
                                                 (|:| |size| (QREFELT % 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| %)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT % 6)))
                                           (|:| |empty| #12#))
                                          #5#))))
                 (EXIT
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| (SPADCALL "ifs" (QREFELT % 245))
                               (SPADCALL " ix=" (QREFELT % 245))
                               (|SCENE;outputLLIndexes| |ix| %)
                               (SPADCALL " pt=" (QREFELT % 245))
                               (|SCENE;outputLPoints| |pt| %))
                         (QREFELT % 253)))))))
              (COND
               ((EQUAL (QVELT |n| 0) 'ARROWS)
                (SEQ
                 (LETT |pts|
                       (QVELT
                        (PROG2 (LETT #4# (QVELT |n| 2))
                            (QCDR #4#)
                          (|check_union2| (QEQCAR #4# 6)
                                          (|Record|
                                           (|:| |ln|
                                                (|List|
                                                 (|List| (QREFELT % 6))))
                                           (|:| |mode| (|Symbol|))
                                           (|:| |size| (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT % 6))))
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
                                                 (|:| |pos| (QREFELT % 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT % 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT % 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT % 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT % 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT % 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT % 6))
                                                 (|:| |size| (QREFELT % 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| %)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT % 6)))
                                           (|:| |empty| #12#))
                                          #4#))
                        0))
                 (LETT |m|
                       (QVELT
                        (PROG2 (LETT #4# (QVELT |n| 2))
                            (QCDR #4#)
                          (|check_union2| (QEQCAR #4# 6)
                                          (|Record|
                                           (|:| |ln|
                                                (|List|
                                                 (|List| (QREFELT % 6))))
                                           (|:| |mode| (|Symbol|))
                                           (|:| |size| (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT % 6))))
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
                                                 (|:| |pos| (QREFELT % 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT % 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT % 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT % 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT % 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT % 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT % 6))
                                                 (|:| |size| (QREFELT % 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| %)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT % 6)))
                                           (|:| |empty| #12#))
                                          #4#))
                        1))
                 (LETT |sz|
                       (QVELT
                        (PROG2 (LETT #4# (QVELT |n| 2))
                            (QCDR #4#)
                          (|check_union2| (QEQCAR #4# 6)
                                          (|Record|
                                           (|:| |ln|
                                                (|List|
                                                 (|List| (QREFELT % 6))))
                                           (|:| |mode| (|Symbol|))
                                           (|:| |size| (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT % 6))))
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
                                                 (|:| |pos| (QREFELT % 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT % 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT % 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT % 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT % 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT % 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT % 6))
                                                 (|:| |size| (QREFELT % 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| %)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT % 6)))
                                           (|:| |empty| #12#))
                                          #4#))
                        2))
                 (EXIT
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| (SPADCALL "arrows" (QREFELT % 245))
                               (SPADCALL " pts=" (QREFELT % 245))
                               (|SCENE;outputLLPoints| |pts| %)
                               (SPADCALL " m=" (QREFELT % 245))
                               (SPADCALL |m| (QREFELT % 255))
                               (SPADCALL " sz=" (QREFELT % 245))
                               (SPADCALL |sz| (QREFELT % 256)))
                         (QREFELT % 253)))))))
              (COND
               ((EQUAL (QVELT |n| 0) 'ARROW)
                (SEQ
                 (LETT |str|
                       (QVELT
                        (PROG2 (LETT #3# (QVELT |n| 2))
                            (QCDR #3#)
                          (|check_union2| (QEQCAR #3# 7)
                                          (|Record| (|:| |st| (|String|))
                                                    (|:| |en| (|String|))
                                                    (|:| |offset|
                                                         (QREFELT % 6))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT % 6))))
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
                                                 (|:| |pos| (QREFELT % 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT % 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT % 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT % 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT % 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT % 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT % 6))
                                                 (|:| |size| (QREFELT % 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| %)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT % 6)))
                                           (|:| |empty| #12#))
                                          #3#))
                        0))
                 (LETT |ena|
                       (QVELT
                        (PROG2 (LETT #3# (QVELT |n| 2))
                            (QCDR #3#)
                          (|check_union2| (QEQCAR #3# 7)
                                          (|Record| (|:| |st| (|String|))
                                                    (|:| |en| (|String|))
                                                    (|:| |offset|
                                                         (QREFELT % 6))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT % 6))))
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
                                                 (|:| |pos| (QREFELT % 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT % 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT % 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT % 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT % 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT % 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT % 6))
                                                 (|:| |size| (QREFELT % 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| %)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT % 6)))
                                           (|:| |empty| #12#))
                                          #3#))
                        1))
                 (LETT |ofs|
                       (QVELT
                        (PROG2 (LETT #3# (QVELT |n| 2))
                            (QCDR #3#)
                          (|check_union2| (QEQCAR #3# 7)
                                          (|Record| (|:| |st| (|String|))
                                                    (|:| |en| (|String|))
                                                    (|:| |offset|
                                                         (QREFELT % 6))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT % 6))))
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
                                                 (|:| |pos| (QREFELT % 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT % 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT % 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT % 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT % 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT % 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT % 6))
                                                 (|:| |size| (QREFELT % 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| %)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT % 6)))
                                           (|:| |empty| #12#))
                                          #3#))
                        2))
                 (LETT |md|
                       (QVELT
                        (PROG2 (LETT #3# (QVELT |n| 2))
                            (QCDR #3#)
                          (|check_union2| (QEQCAR #3# 7)
                                          (|Record| (|:| |st| (|String|))
                                                    (|:| |en| (|String|))
                                                    (|:| |offset|
                                                         (QREFELT % 6))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT % 6))))
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
                                                 (|:| |pos| (QREFELT % 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT % 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT % 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT % 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT % 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT % 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT % 6))
                                                 (|:| |size| (QREFELT % 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| %)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT % 6)))
                                           (|:| |empty| #12#))
                                          #3#))
                        3))
                 (LETT |sz|
                       (QVELT
                        (PROG2 (LETT #3# (QVELT |n| 2))
                            (QCDR #3#)
                          (|check_union2| (QEQCAR #3# 7)
                                          (|Record| (|:| |st| (|String|))
                                                    (|:| |en| (|String|))
                                                    (|:| |offset|
                                                         (QREFELT % 6))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT % 6))))
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
                                                 (|:| |pos| (QREFELT % 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT % 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT % 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT % 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT % 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT % 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT % 6))
                                                 (|:| |size| (QREFELT % 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| %)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT % 6)))
                                           (|:| |empty| #12#))
                                          #3#))
                        4))
                 (EXIT
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| (SPADCALL "arrows" (QREFELT % 245))
                               (SPADCALL " str=" (QREFELT % 245))
                               (SPADCALL |str| (QREFELT % 257))
                               (SPADCALL " ena=" (QREFELT % 245))
                               (SPADCALL |ena| (QREFELT % 257))
                               (SPADCALL " ofs=" (QREFELT % 245))
                               (SPADCALL |ofs| (QREFELT % 243))
                               (SPADCALL " md=" (QREFELT % 245))
                               (SPADCALL |md| (QREFELT % 255))
                               (SPADCALL " sz=" (QREFELT % 245))
                               (SPADCALL |sz| (QREFELT % 256)))
                         (QREFELT % 253)))))))
              (COND
               ((EQUAL (QVELT |n| 0) 'DEF)
                (SEQ
                 (LETT |nn|
                       (QCAR
                        (PROG2 (LETT #2# (QVELT |n| 2))
                            (QCDR #2#)
                          (|check_union2| (QEQCAR #2# 9)
                                          (|Record| (|:| |nme| (|String|))
                                                    (|:| |node| %))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT % 6))))
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
                                                 (|:| |pos| (QREFELT % 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT % 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT % 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT % 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT % 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT % 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT % 6))
                                                 (|:| |size| (QREFELT % 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| %)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT % 6)))
                                           (|:| |empty| #12#))
                                          #2#))))
                 (EXIT
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| (SPADCALL "def" (QREFELT % 245))
                               (SPADCALL " nn=" (QREFELT % 245))
                               (SPADCALL |nn| (QREFELT % 257)))
                         (QREFELT % 253)))))))
              (COND
               ((EQUAL (QVELT |n| 0) 'USE)
                (SEQ
                 (LETT |nn|
                       (QCAR
                        (PROG2 (LETT #2# (QVELT |n| 2))
                            (QCDR #2#)
                          (|check_union2| (QEQCAR #2# 9)
                                          (|Record| (|:| |nme| (|String|))
                                                    (|:| |node| %))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT % 6))))
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
                                                 (|:| |pos| (QREFELT % 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT % 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT % 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT % 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT % 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT % 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT % 6))
                                                 (|:| |size| (QREFELT % 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| %)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT % 6)))
                                           (|:| |empty| #12#))
                                          #2#))))
                 (EXIT
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| (SPADCALL "use" (QREFELT % 245))
                               (SPADCALL " nn=" (QREFELT % 245))
                               (SPADCALL |nn| (QREFELT % 257)))
                         (QREFELT % 253)))))))
              (COND
               ((EQUAL (QVELT |n| 0) 'NAMEDPOINTS)
                (SEQ
                 (LETT |nam|
                       (PROG2 (LETT #1# (QVELT |n| 2))
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 10)
                                         (|SceneNamedPoints| (QREFELT % 6))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT % 6))))
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
                                                              (QREFELT % 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT % 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT % 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT % 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT % 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT % 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT % 6))
                                                (|:| |size| (QREFELT % 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| %)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT % 6)))
                                          (|:| |empty| #12#))
                                         #1#)))
                 (EXIT
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| (SPADCALL "namedpoints" (QREFELT % 245))
                               (SPADCALL " n=" (QREFELT % 245))
                               (SPADCALL |nam| (QREFELT % 260)))
                         (QREFELT % 253)))))))
              (LETT |s|
                    (SPADCALL
                     (LIST |s| (SPADCALL " #ch=" (QREFELT % 245))
                           (SPADCALL (SPADCALL (QVELT |n| 1) (QREFELT % 159))
                                     (QREFELT % 249)))
                     (QREFELT % 253)))
              (EXIT |s|)))) 

(DECLAIM (NOTINLINE |Scene;|)) 

(DEFUN |Scene;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|Scene| DV$1))
          (LETT % (GETREFV 262))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|Scene| (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7
                    (|Record| (|:| |type| (|Symbol|))
                              (|:| |children| (|List| %))
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
                                                   (|:| |node| %)))
                                    (|:| |np| (|SceneNamedPoints| |#1|))
                                    (|:| |empty| "empty")))))
          %))) 

(DEFUN |Scene| (#1=#:G1438)
  (SPROG NIL
         (PROG (#2=#:G1439)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Scene|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Scene;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Scene|)))))))))) 

(MAKEPROP '|Scene| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|SBoundary| 6)
              |SCENE;createSceneRoot;Sb%;1| (|Integer|) (0 . |sipnt|)
              (6 . |boxBoundary|) |SCENE;createSceneRoot;4I%;2|
              (12 . |nullBoundary|) |SCENE;createSceneRoot;%;3|
              |SCENE;createSceneGroup;%;4| (|Void|) |SCENE;addChild!;2%V;66|
              |SCENE;addSceneGroup;2%;5| (|List| 6)
              |SCENE;createSceneLine;L%;6| |SCENE;addSceneLine;%L%;7|
              (|DoubleFloat|) (|Boolean|) |SCENE;createSceneLine;2%DfB%;10|
              |SCENE;createSceneLine;2%Df%;8| |SCENE;addSceneLine;3%DfB%;11|
              |SCENE;addSceneLine;3%Df%;9| |SCENE;boundary;%DfSb;77|
              (16 . |getCentre|) (21 . |lineIntersect|) (|List| 20)
              |SCENE;createSceneLines;L%;12| |SCENE;addSceneLines;%L%;13|
              (|Record| (|:| |shptype| 48) (|:| |centre| 6) (|:| |size| 6)
                        (|:| |fill| 24))
              |SCENE;createSceneShape;R%;14| |SCENE;addSceneShape;%R%;15|
              (27 . |getMax|) (32 . |getMin|) (37 . -)
              |SCENE;createSceneShape;Sb%;16| |SCENE;addSceneShape;%Sb%;17|
              (|String|) |SCENE;createSceneDef;S2%;18|
              |SCENE;addSceneDef;%S2%;19| |SCENE;createSceneUse;S%;20|
              |SCENE;addSceneUse;%S%;21| (|Symbol|)
              |SCENE;createSceneArrows;LSDf%;22|
              |SCENE;addSceneArrows;%LSDf%;23|
              |SCENE;createSceneArrow;2SPTSDf%;24|
              |SCENE;addSceneArrow;%2SPTSDf%;25|
              |SCENE;createSceneArrow;2%PTS2Df%;26|
              |SCENE;addSceneArrow;3%PTS2Df%;27| (|SceneNamedPoints| 6)
              |SCENE;createSceneNamedPoints;Snp%;28|
              |SCENE;addSceneNamedPoints;%Snp%;29| (|List| 96)
              |SCENE;createSceneIFS;LL%;30| |SCENE;addSceneIFS;%LL%;31|
              (|SceneIFS| 6) (43 . |indexes|) (48 . |pointList|)
              |SCENE;createSceneIFS;Sifs%;32| |SCENE;addSceneIFS;%Sifs%;33|
              (53 . |spnt|) |SCENE;createSceneBox;Df%;34|
              |SCENE;addSceneBox;%Df%;35|
              (|Record| (|:| |txt| 43) (|:| |siz| 72) (|:| |pos| 6)
                        (|:| |np| 75))
              |SCENE;createSceneText;R%;36| |SCENE;addSceneText;%R%;37|
              (|NonNegativeInteger|) |SCENE;createSceneText;SNniPT%;38|
              |SCENE;addSceneText;%SNniPT%;39| (|List| 43)
              |SCENE;createSceneText;LNniPT%;40|
              |SCENE;addSceneText;%LNniPT%;41| |SCENE;createSceneClip;Sb%;42|
              |SCENE;addSceneClip;%Sb%;43| (60 . |screenCoordX|)
              (65 . |screenCoordY|) (70 . |spnt|)
              |SCENE;createSceneGrid;DfSb%;44| |SCENE;addSceneGrid;%DfSb%;45|
              (|Record| (|:| |lineWidth| 23) (|:| |lineCol| 43)
                        (|:| |fillCol| 43) (|:| |matOpacity| 23))
              |SCENE;addSceneMaterial;%R%;59| |SCENE;createSceneGrid;Sb%;46|
              |SCENE;addSceneGrid;%Sb%;47| (76 . |singleFace|)
              (81 . |sierpinskiDivide|) (87 . ~=) (93 . |elt|) (99 . +)
              (105 . *) (111 . |concat|) (|List| 72) (117 . |elt|) (123 . |#|)
              (128 . |elt|) (134 . |concat|)
              |SCENE;createScenePattern;SNniSb%;52|
              |SCENE;addScenePattern;%SNniSb%;53| (140 . |log10|) (|List| %)
              (145 . |concat|) (150 . ~=) |SCENE;createSceneRuler;SPTSb%;54|
              |SCENE;addSceneRuler;%SPTSb%;55| (|STransform| (|SCartesian| '2))
              (156 . |stranslate|) (|Scene| (|SCartesian| '2))
              (166 . |createSceneTransform|) (|DirectedGraph| 43)
              (171 . |subdiagramSvg|) |SCENE;createSceneGraph;Dg2NniB%;56|
              |SCENE;addSceneGraph;%Dg2NniB%;57|
              |SCENE;createSceneMaterial;R%;58|
              |SCENE;createSceneMaterial;Df2S%;60|
              |SCENE;addSceneMaterial;%Df2S%;61| (|STransform| 6)
              |SCENE;createSceneTransform;St%;62|
              |SCENE;addSceneTransform;%St%;63| (|Segment| 23) (179 . |low|)
              (184 . |high|) (|Mapping| 6 6)
              |SCENE;createArrows2Din2D;M2SNni%;64|
              |SCENE;addArrows2Din2D;%M2SNni%;65| (|List| $$) (189 . |concat|)
              |SCENE;removeChild!;2%V;67| (195 . ~=)
              |SCENE;setTransform!;%StV;68| (201 . |xform|)
              (207 . |containsPoint?|) (213 . ~=) (219 . |distance|) (225 . >)
              (|XmlAttribute|) (231 . |xmlAttribute|) (|List| 139)
              (|XmlElement|) (237 . |xmlElement|) (|List| 142) (244 . |concat|)
              (250 . |isNull?|) (255 . |stranslate|) (265 . |concat|)
              (271 . ~=) (277 . |findPoint|) (283 . |xmlElement|)
              (290 . |empty?|) (295 . |compound|) (301 . |addPoints!|)
              (|Scene| 6) (308 . |addNode!|) |SCENE;toSVG;%RStSbDf2BSnpXe;73|
              (315 . |findNode|) (321 . |#|) (326 . |identity|)
              (330 . |namedBranch|) (|ExportXml|) (336 . |writeXml|)
              |SCENE;writeSvg;%SV;74| |SCENE;writeSvgQuantised;%SV;75|
              (342 . |extendToPoint|) (348 . |ellipseBoundary|)
              (354 . |sunion|) (360 . |screenCoordZ|) (365 . |concat|)
              |SCENE;toX3D;%RStSbXe;81| (371 . |curveLoops|) (378 . |smesh|)
              (384 . |xmlAttribute|) |SCENE;writeX3d;%SV;82| (|Reference| 20)
              (|Reference| 58) (|Reference| 72) |SCENE;toObj;%RRRStSbV;83|
              (390 . |elt|) (395 . |elt|) (400 . |concat|) (406 . |setelt!|)
              (412 . |elt|) (417 . |concat|) (423 . |setelt!|)
              (429 . |setelt!|) (435 . |ref|) (440 . |ref|) (445 . |ref|)
              (|FileName|) (450 . |coerce|) (|TextFile|) (455 . |open|)
              (461 . |writeLine!|) (467 . |close!|) |SCENE;writeObj;%SV;84|
              (472 . |writeVRML|) |SCENE;writeVRML;%SV;85| (478 . ~=)
              (484 . |segment|) (|List| 23) (490 . |list|) (495 . |list|)
              (500 . |Pnan?|) (|Mapping| 6 23)
              |SCENE;createPlot1Din2D;MSNni%;91|
              |SCENE;addPlot1Din2D;%MSNni%;92| (|List| 206) (505 . |first|)
              (|Mapping| 23 23) |SCENE;createPlot1Din2D;MSNni%;93|
              |SCENE;addPlot1Din2D;%MSNni%;94| (|ParametricPlaneCurve| 211)
              (510 . |coordinate|)
              |SCENE;createPlot1Din2Dparametric;PpcSNni%;95|
              |SCENE;addPlot1Din2Dparametric;%PpcSNni%;96|
              (|ParametricSpaceCurve| 211) (516 . |coordinate|)
              |SCENE;createPlot1Din3Dparametric;MSNni%;99|
              |SCENE;createPlot1Din3Dparametric;PscSNni%;97|
              |SCENE;addPlot1Din3Dparametric;%PscSNni%;98|
              |SCENE;addPlot1Din3Dparametric;%MSNni%;100| (|Mapping| 6 23 23)
              |SCENE;createPlot2Din3D;M2SNni%;101| (|List| 224) (522 . |first|)
              (|Mapping| 23 23 23) |SCENE;createPlot2Din3D;M2SNni%;102|
              |SCENE;addPlot2Din3D;%M2SNni%;103| (527 . |One|) (531 . |One|)
              (|ParametricSurface| 228) (535 . |coordinate|) (|List| 228)
              (541 . |first|) |SCENE;createPlot2Din3Dparametric;Ps2SNni%;104|
              |SCENE;addPlot2Din3Dparametric;%Ps2SNni%;105|
              |SCENE;createPlot2Din3Dparametric;M2SNni%;106|
              |SCENE;addPlot2Din3Dparametric;%M2SNni%;107| (|OutputForm|)
              (546 . |coerce|) (551 . |coerce|) (556 . |second|)
              (561 . |message|) (566 . |bracket|) (571 . |second|)
              (576 . |coerce|) (581 . |coerce|) (586 . |second|)
              (591 . |second|) (596 . |coerce|) (601 . |hconcat|)
              (606 . |hconcat|) (612 . |coerce|) (617 . |coerce|)
              (622 . |coerce|) (627 . |coerce|) (632 . |coerce|)
              (637 . |coerce|) |SCENE;coerce;%Of;112|)
           '#(|writeX3d| 642 |writeVRML| 648 |writeSvgQuantised| 654 |writeSvg|
              660 |writeObj| 666 |toX3D| 672 |toSVG| 680 |toObj| 692
              |setTransform!| 702 |removeChild!| 708 |createSceneUse| 714
              |createSceneTransform| 719 |createSceneText| 724
              |createSceneShape| 743 |createSceneRuler| 753 |createSceneRoot|
              760 |createScenePattern| 777 |createSceneNamedPoints| 784
              |createSceneMaterial| 789 |createSceneLines| 801
              |createSceneLine| 806 |createSceneIFS| 826 |createSceneGroup| 837
              |createSceneGrid| 841 |createSceneGraph| 852 |createSceneDef| 860
              |createSceneClip| 866 |createSceneBox| 871 |createSceneArrows|
              876 |createSceneArrow| 883 |createPlot2Din3Dparametric| 902
              |createPlot2Din3D| 918 |createPlot1Din3Dparametric| 934
              |createPlot1Din2Dparametric| 948 |createPlot1Din2D| 955
              |createArrows2Din2D| 969 |coerce| 977 |boundary| 982
              |addSceneUse| 988 |addSceneTransform| 994 |addSceneText| 1000
              |addSceneShape| 1022 |addSceneRuler| 1034 |addScenePattern| 1042
              |addSceneNamedPoints| 1050 |addSceneMaterial| 1056
              |addSceneLines| 1070 |addSceneLine| 1076 |addSceneIFS| 1099
              |addSceneGroup| 1112 |addSceneGrid| 1117 |addSceneGraph| 1130
              |addSceneDef| 1139 |addSceneClip| 1146 |addSceneBox| 1152
              |addSceneArrows| 1158 |addSceneArrow| 1166
              |addPlot2Din3Dparametric| 1187 |addPlot2Din3D| 1205
              |addPlot1Din3Dparametric| 1214 |addPlot1Din2Dparametric| 1230
              |addPlot1Din2D| 1238 |addChild!| 1254 |addArrows2Din2D| 1260)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|createSceneRoot| ($$)) T)
                                   '((|createSceneRoot|
                                      ($$ (|SBoundary| |#1|)))
                                     T)
                                   '((|createSceneRoot|
                                      ($$ (|Integer|) (|Integer|) (|Integer|)
                                       (|Integer|)))
                                     T)
                                   '((|createSceneGroup| ($$)) T)
                                   '((|addSceneGroup| ($$ $$)) T)
                                   '((|createSceneLine| ($$ (|List| |#1|))) T)
                                   '((|addSceneLine| ($$ $$ (|List| |#1|))) T)
                                   '((|createSceneLine|
                                      ($$ $$ $$ (|DoubleFloat|)))
                                     T)
                                   '((|addSceneLine|
                                      ($$ $$ $$ $$ (|DoubleFloat|)))
                                     T)
                                   '((|createSceneLine|
                                      ($$ $$ $$ (|DoubleFloat|) (|Boolean|)))
                                     T)
                                   '((|addSceneLine|
                                      ($$ $$ $$ $$ (|DoubleFloat|)
                                       (|Boolean|)))
                                     T)
                                   '((|createSceneLines|
                                      ($$ (|List| (|List| |#1|))))
                                     T)
                                   '((|addSceneLines|
                                      ($$ $$ (|List| (|List| |#1|))))
                                     T)
                                   '((|createSceneShape|
                                      ($$
                                       (|Record| (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| |#1|)
                                                 (|:| |size| |#1|)
                                                 (|:| |fill| (|Boolean|)))))
                                     T)
                                   '((|addSceneShape|
                                      ($$ $$
                                       (|Record| (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| |#1|)
                                                 (|:| |size| |#1|)
                                                 (|:| |fill| (|Boolean|)))))
                                     T)
                                   '((|createSceneShape|
                                      ($$ (|SBoundary| |#1|)))
                                     T)
                                   '((|addSceneShape|
                                      ($$ $$ (|SBoundary| |#1|)))
                                     T)
                                   '((|createSceneDef| ($$ (|String|) $$)) T)
                                   '((|addSceneDef| ($$ $$ (|String|) $$)) T)
                                   '((|createSceneUse| ($$ (|String|))) T)
                                   '((|addSceneUse| ($$ $$ (|String|))) T)
                                   '((|createSceneArrows|
                                      ($$ (|List| (|List| |#1|)) (|Symbol|)
                                       (|DoubleFloat|)))
                                     T)
                                   '((|addSceneArrows|
                                      ($$ $$ (|List| (|List| |#1|)) (|Symbol|)
                                       (|DoubleFloat|)))
                                     T)
                                   '((|createSceneArrow|
                                      ($$ (|String|) (|String|) |#1| (|Symbol|)
                                       (|DoubleFloat|)))
                                     T)
                                   '((|addSceneArrow|
                                      ($$ $$ (|String|) (|String|) |#1|
                                       (|Symbol|) (|DoubleFloat|)))
                                     T)
                                   '((|createSceneArrow|
                                      ($$ $$ $$ |#1| (|Symbol|) (|DoubleFloat|)
                                       (|DoubleFloat|)))
                                     T)
                                   '((|addSceneArrow|
                                      ($$ $$ $$ $$ |#1| (|Symbol|)
                                       (|DoubleFloat|) (|DoubleFloat|)))
                                     T)
                                   '((|createSceneNamedPoints|
                                      ($$ (|SceneNamedPoints| |#1|)))
                                     T)
                                   '((|addSceneNamedPoints|
                                      ($$ $$ (|SceneNamedPoints| |#1|)))
                                     T)
                                   '((|createSceneIFS|
                                      ($$
                                       (|List| (|List| (|NonNegativeInteger|)))
                                       (|List| |#1|)))
                                     T)
                                   '((|addSceneIFS|
                                      ($$ $$
                                       (|List| (|List| (|NonNegativeInteger|)))
                                       (|List| |#1|)))
                                     T)
                                   '((|createSceneIFS| ($$ (|SceneIFS| |#1|)))
                                     T)
                                   '((|addSceneIFS| ($$ $$ (|SceneIFS| |#1|)))
                                     T)
                                   '((|createSceneBox| ($$ (|DoubleFloat|))) T)
                                   '((|addSceneBox| ($$ $$ (|DoubleFloat|))) T)
                                   '((|createSceneText|
                                      ($$
                                       (|Record| (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| |#1|)
                                                 (|:| |np|
                                                      (|List| (|String|))))))
                                     T)
                                   '((|addSceneText|
                                      ($$ $$
                                       (|Record| (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| |#1|)
                                                 (|:| |np|
                                                      (|List| (|String|))))))
                                     T)
                                   '((|createSceneText|
                                      ($$ (|String|) (|NonNegativeInteger|)
                                       |#1|))
                                     T)
                                   '((|addSceneText|
                                      ($$ $$ (|String|) (|NonNegativeInteger|)
                                       |#1|))
                                     T)
                                   '((|createSceneText|
                                      ($$ (|List| (|String|))
                                       (|NonNegativeInteger|) |#1|))
                                     T)
                                   '((|addSceneText|
                                      ($$ $$ (|List| (|String|))
                                       (|NonNegativeInteger|) |#1|))
                                     T)
                                   '((|createSceneClip|
                                      ($$ (|SBoundary| |#1|)))
                                     T)
                                   '((|addSceneClip|
                                      ($$ $$ (|SBoundary| |#1|)))
                                     T)
                                   '((|createSceneGrid|
                                      ($$ (|DoubleFloat|) (|SBoundary| |#1|)))
                                     T)
                                   '((|addSceneGrid|
                                      ($$ $$ (|DoubleFloat|)
                                       (|SBoundary| |#1|)))
                                     T)
                                   '((|createSceneGrid|
                                      ($$ (|SBoundary| |#1|)))
                                     T)
                                   '((|addSceneGrid|
                                      ($$ $$ (|SBoundary| |#1|)))
                                     T)
                                   '((|createScenePattern|
                                      ($$ (|Symbol|) (|NonNegativeInteger|)
                                       (|SBoundary| |#1|)))
                                     T)
                                   '((|addScenePattern|
                                      ($$ $$ (|Symbol|) (|NonNegativeInteger|)
                                       (|SBoundary| |#1|)))
                                     T)
                                   '((|createSceneRuler|
                                      ($$ (|Symbol|) |#1| (|SBoundary| |#1|)))
                                     T)
                                   '((|addSceneRuler|
                                      ($$ $$ (|Symbol|) |#1|
                                       (|SBoundary| |#1|)))
                                     T)
                                   '((|createSceneGraph|
                                      ($$ (|DirectedGraph| (|String|))
                                       (|NonNegativeInteger|)
                                       (|NonNegativeInteger|) (|Boolean|)))
                                     T)
                                   '((|addSceneGraph|
                                      ($$ $$ (|DirectedGraph| (|String|))
                                       (|NonNegativeInteger|)
                                       (|NonNegativeInteger|) (|Boolean|)))
                                     T)
                                   '((|createSceneMaterial|
                                      ($$
                                       (|Record|
                                        (|:| |lineWidth| (|DoubleFloat|))
                                        (|:| |lineCol| (|String|))
                                        (|:| |fillCol| (|String|))
                                        (|:| |matOpacity| (|DoubleFloat|)))))
                                     T)
                                   '((|addSceneMaterial|
                                      ($$ $$
                                       (|Record|
                                        (|:| |lineWidth| (|DoubleFloat|))
                                        (|:| |lineCol| (|String|))
                                        (|:| |fillCol| (|String|))
                                        (|:| |matOpacity| (|DoubleFloat|)))))
                                     T)
                                   '((|createSceneMaterial|
                                      ($$ (|DoubleFloat|) (|String|)
                                       (|String|)))
                                     T)
                                   '((|addSceneMaterial|
                                      ($$ $$ (|DoubleFloat|) (|String|)
                                       (|String|)))
                                     T)
                                   '((|createSceneTransform|
                                      ($$ (|STransform| |#1|)))
                                     T)
                                   '((|addSceneTransform|
                                      ($$ $$ (|STransform| |#1|)))
                                     T)
                                   '((|createPlot1Din2D|
                                      ($$ (|Mapping| |#1| (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|addPlot1Din2D|
                                      ($$ $$ (|Mapping| |#1| (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|createPlot1Din2D|
                                      ($$
                                       (|Mapping| (|DoubleFloat|)
                                                  (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|addPlot1Din2D|
                                      ($$ $$
                                       (|Mapping| (|DoubleFloat|)
                                                  (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|createPlot1Din2Dparametric|
                                      ($$
                                       (|ParametricPlaneCurve|
                                        (|Mapping| (|DoubleFloat|)
                                                   (|DoubleFloat|)))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|addPlot1Din2Dparametric|
                                      ($$ $$
                                       (|ParametricPlaneCurve|
                                        (|Mapping| (|DoubleFloat|)
                                                   (|DoubleFloat|)))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|createPlot1Din3Dparametric|
                                      ($$
                                       (|ParametricSpaceCurve|
                                        (|Mapping| (|DoubleFloat|)
                                                   (|DoubleFloat|)))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|addPlot1Din3Dparametric|
                                      ($$ $$
                                       (|ParametricSpaceCurve|
                                        (|Mapping| (|DoubleFloat|)
                                                   (|DoubleFloat|)))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|createPlot1Din3Dparametric|
                                      ($$ (|Mapping| |#1| (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|addPlot1Din3Dparametric|
                                      ($$ $$ (|Mapping| |#1| (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|createPlot2Din3D|
                                      ($$
                                       (|Mapping| |#1| (|DoubleFloat|)
                                                  (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|createPlot2Din3D|
                                      ($$
                                       (|Mapping| (|DoubleFloat|)
                                                  (|DoubleFloat|)
                                                  (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|addPlot2Din3D|
                                      ($$ $$
                                       (|Mapping| (|DoubleFloat|)
                                                  (|DoubleFloat|)
                                                  (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|createPlot2Din3Dparametric|
                                      ($$
                                       (|Mapping| |#1| (|DoubleFloat|)
                                                  (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|addPlot2Din3Dparametric|
                                      ($$ $$
                                       (|Mapping| |#1| (|DoubleFloat|)
                                                  (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|createPlot2Din3Dparametric|
                                      ($$
                                       (|ParametricSurface|
                                        (|Mapping| (|DoubleFloat|)
                                                   (|DoubleFloat|)
                                                   (|DoubleFloat|)))
                                       (|Segment| (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|addPlot2Din3Dparametric|
                                      ($$ $$
                                       (|ParametricSurface|
                                        (|Mapping| (|DoubleFloat|)
                                                   (|DoubleFloat|)
                                                   (|DoubleFloat|)))
                                       (|Segment| (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|createArrows2Din2D|
                                      ($$ (|Mapping| |#1| |#1|)
                                       (|Segment| (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|addArrows2Din2D|
                                      ($$ $$ (|Mapping| |#1| |#1|)
                                       (|Segment| (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|boundary|
                                      ((|SBoundary| |#1|) $$ (|DoubleFloat|)))
                                     T)
                                   '((|addChild!| ((|Void|) $$ $$)) T)
                                   '((|removeChild!| ((|Void|) $$ $$)) T)
                                   '((|setTransform!|
                                      ((|Void|) $$ (|STransform| |#1|)))
                                     T)
                                   '((|toSVG|
                                      ((|XmlElement|) $$
                                       (|Record|
                                        (|:| |lineWidth| (|DoubleFloat|))
                                        (|:| |lineCol| (|String|))
                                        (|:| |fillCol| (|String|))
                                        (|:| |matOpacity| (|DoubleFloat|)))
                                       (|STransform| |#1|) (|SBoundary| |#1|)
                                       (|DoubleFloat|) (|Boolean|) (|Boolean|)
                                       (|SceneNamedPoints| |#1|)))
                                     T)
                                   '((|toX3D|
                                      ((|XmlElement|) $$
                                       (|Record|
                                        (|:| |lineWidth| (|DoubleFloat|))
                                        (|:| |lineCol| (|String|))
                                        (|:| |fillCol| (|String|))
                                        (|:| |matOpacity| (|DoubleFloat|)))
                                       (|STransform| |#1|) (|SBoundary| |#1|)))
                                     T)
                                   '((|toObj|
                                      ((|Void|) $$ (|Reference| (|List| |#1|))
                                       (|Reference|
                                        (|List|
                                         (|List| (|NonNegativeInteger|))))
                                       (|Reference| (|NonNegativeInteger|))
                                       (|STransform| |#1|) (|SBoundary| |#1|)))
                                     T)
                                   '((|writeSvg| ((|Void|) $$ (|String|))) T)
                                   '((|writeSvgQuantised|
                                      ((|Void|) $$ (|String|)))
                                     T)
                                   '((|writeX3d| ((|Void|) $$ (|String|))) T)
                                   '((|writeVRML| ((|Void|) $$ (|String|))) T)
                                   '((|writeObj| ((|Void|) $$ (|String|))) T)
                                   '((|coerce| ((|OutputForm|) $$)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 261
                                            '(2 6 0 10 10 11 2 8 0 6 6 12 0 8 0
                                              14 1 8 6 0 30 2 8 6 0 6 31 1 8 6
                                              0 38 1 8 6 0 39 2 6 0 0 0 40 1 61
                                              58 0 62 1 61 20 0 63 3 6 0 23 23
                                              23 66 1 6 23 0 80 1 6 23 0 81 2 6
                                              0 23 23 82 1 61 0 20 89 2 61 0 0
                                              72 90 2 72 24 0 0 91 2 20 6 0 10
                                              92 2 6 0 0 0 93 2 6 0 23 0 94 2
                                              20 0 0 6 95 2 58 96 0 10 97 1 96
                                              72 0 98 2 96 72 0 10 99 2 32 0 0
                                              20 100 1 23 0 0 103 1 43 0 104
                                              105 2 10 24 0 0 106 6 109 0 23 23
                                              23 23 23 23 110 1 111 0 109 112 4
                                              113 17 111 0 24 24 114 1 123 23 0
                                              124 1 123 23 0 125 2 129 0 0 2
                                              130 2 48 24 0 0 132 2 120 6 0 6
                                              134 2 8 24 0 6 135 2 43 24 0 0
                                              136 2 6 23 0 0 137 2 23 24 0 0
                                              138 2 139 0 43 43 140 3 142 0 43
                                              104 141 143 2 144 0 0 142 145 1 8
                                              24 0 146 6 120 0 23 23 23 23 23
                                              23 147 2 141 0 0 139 148 2 75 24
                                              0 0 149 2 55 6 0 43 150 3 142 0
                                              43 43 141 151 1 142 24 0 152 2
                                              120 0 0 0 153 3 55 0 0 43 0 154 3
                                              55 0 0 43 155 156 2 55 155 0 43
                                              158 1 129 72 0 159 0 120 0 160 2
                                              55 0 104 75 161 2 162 17 142 43
                                              163 2 8 0 0 6 166 2 8 0 6 6 167 2
                                              8 0 0 0 168 1 6 23 0 169 2 75 0 0
                                              43 170 3 61 32 20 23 10 172 2 61
                                              0 32 24 173 2 139 0 43 75 174 1
                                              178 72 0 180 1 176 20 0 181 2 20
                                              0 0 0 182 2 176 20 0 20 183 1 177
                                              58 0 184 2 58 0 0 0 185 2 177 58
                                              0 58 186 2 178 72 0 72 187 1 176
                                              0 20 188 1 177 0 58 189 1 178 0
                                              72 190 1 191 0 43 192 2 193 0 191
                                              43 194 2 193 43 0 43 195 1 193 0
                                              0 196 2 162 17 142 43 198 2 23 24
                                              0 0 200 2 123 0 23 23 201 1 202 0
                                              23 203 1 20 0 6 204 1 6 24 0 205
                                              1 209 206 0 210 2 214 211 0 72
                                              215 2 218 211 0 72 219 1 226 224
                                              0 227 0 23 0 231 0 72 0 232 2 233
                                              228 0 72 234 1 235 228 0 236 1 20
                                              241 0 242 1 6 241 0 243 1 20 6 0
                                              244 1 241 0 43 245 1 241 0 104
                                              246 1 32 20 0 247 1 96 241 0 248
                                              1 72 241 0 249 1 96 72 0 250 1 58
                                              96 0 251 1 8 241 0 252 1 241 0
                                              104 253 2 241 0 0 0 254 1 48 241
                                              0 255 1 23 241 0 256 1 43 241 0
                                              257 1 75 241 0 258 1 120 241 0
                                              259 1 55 241 0 260 2 0 17 0 43
                                              175 2 0 17 0 43 199 2 0 17 0 43
                                              165 2 0 17 0 43 164 2 0 17 0 43
                                              197 4 0 142 0 85 120 8 171 8 0
                                              142 0 85 120 8 23 24 24 55 157 6
                                              0 17 0 176 177 178 120 8 179 2 0
                                              17 0 120 133 2 0 17 0 0 131 1 0 0
                                              43 46 1 0 0 120 121 3 0 0 75 72 6
                                              76 3 0 0 43 72 6 73 1 0 0 69 70 1
                                              0 0 8 41 1 0 0 35 36 3 0 0 48 6 8
                                              107 4 0 0 10 10 10 10 13 0 0 0 15
                                              1 0 0 8 9 3 0 0 48 72 8 101 1 0 0
                                              55 56 3 0 0 23 43 43 118 1 0 0 85
                                              117 1 0 0 32 33 4 0 0 0 0 23 24
                                              25 3 0 0 0 0 23 26 1 0 0 20 21 1
                                              0 0 61 64 2 0 0 58 20 59 0 0 0 16
                                              1 0 0 8 87 2 0 0 23 8 83 4 0 0
                                              113 72 72 24 115 2 0 0 43 0 44 1
                                              0 0 8 78 1 0 0 23 67 3 0 0 32 48
                                              23 49 6 0 0 0 0 6 48 23 23 53 5 0
                                              0 43 43 6 48 23 51 4 0 0 233 123
                                              123 72 237 4 0 0 224 123 123 72
                                              239 4 0 0 228 123 123 72 229 4 0
                                              0 224 123 123 72 225 3 0 0 206
                                              123 72 220 3 0 0 218 123 72 221 3
                                              0 0 214 123 72 216 3 0 0 211 123
                                              72 212 3 0 0 206 123 72 207 4 0 0
                                              126 123 123 72 127 1 0 241 0 261
                                              2 0 8 0 23 29 2 0 0 0 43 47 2 0 0
                                              0 120 122 4 0 0 0 75 72 6 77 4 0
                                              0 0 43 72 6 74 2 0 0 0 69 71 2 0
                                              0 0 8 42 2 0 0 0 35 37 4 0 0 0 48
                                              6 8 108 4 0 0 0 48 72 8 102 2 0 0
                                              0 55 57 4 0 0 0 23 43 43 119 2 0
                                              0 0 85 86 2 0 0 0 32 34 5 0 0 0 0
                                              0 23 24 27 4 0 0 0 0 0 23 28 2 0
                                              0 0 20 22 2 0 0 0 61 65 3 0 0 0
                                              58 20 60 1 0 0 0 19 2 0 0 0 8 88
                                              3 0 0 0 23 8 84 5 0 0 0 113 72 72
                                              24 116 3 0 0 0 43 0 45 2 0 0 0 8
                                              79 2 0 0 0 23 68 4 0 0 0 32 48 23
                                              50 7 0 0 0 0 0 6 48 23 23 54 6 0
                                              0 0 43 43 6 48 23 52 5 0 0 0 233
                                              123 123 72 238 5 0 0 0 224 123
                                              123 72 240 5 0 0 0 228 123 123 72
                                              230 4 0 0 0 206 123 72 223 4 0 0
                                              0 218 123 72 222 4 0 0 0 214 123
                                              72 217 4 0 0 0 211 123 72 213 4 0
                                              0 0 206 123 72 208 2 0 17 0 0 18
                                              5 0 0 0 126 123 123 72 128)))))
           '|lookupComplete|)) 
