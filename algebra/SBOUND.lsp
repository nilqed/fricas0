
(PUT '|SBOUND;nullBoundary;$;1| '|SPADreplace| '(XLAM NIL (CONS 0 "none"))) 

(SDEFUN |SBOUND;nullBoundary;$;1| (($ $)) (CONS 0 "none")) 

(SDEFUN |SBOUND;boxBoundary;2PT$;2| ((|c1| PT) (|c2| PT) ($ $))
        (CONS 1
              (VECTOR '|box| (SPADCALL |c1| |c2| (QREFELT $ 9))
                      (SPADCALL |c1| |c2| (QREFELT $ 10))))) 

(SDEFUN |SBOUND;ellipseBoundary;2PT$;3| ((|c1| PT) (|c2| PT) ($ $))
        (CONS 1 (VECTOR '|ellipoid| |c1| |c2|))) 

(SDEFUN |SBOUND;union;L$;4| ((|x| |List| $) ($ $)) (CONS 2 (CONS '|union| |x|))) 

(SDEFUN |SBOUND;intersection;L$;5| ((|x| |List| $) ($ $))
        (CONS 2 (CONS '|intersection| |x|))) 

(SDEFUN |SBOUND;sunion;3$;6| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((|ymax| (PT)) (#1=#:G399 NIL) (|ymin| (PT)) (|xmax| (PT))
          (|xmin| (PT)) (#2=#:G431 NIL) (|res| ($)) (#3=#:G433 NIL) (|ptr| NIL)
          (|p| (|List| $)) (#4=#:G400 NIL) (#5=#:G432 NIL))
         (SEQ
          (EXIT
           (SEQ (COND ((QEQCAR |x| 0) (PROGN (LETT #2# |y|) (GO #6=#:G430))))
                (COND ((QEQCAR |y| 0) (PROGN (LETT #2# |x|) (GO #6#))))
                (COND
                 ((QEQCAR |x| 2)
                  (SEQ
                   (LETT |p|
                         (QCDR
                          (PROG2 (LETT #4# |x|)
                              (QCDR #4#)
                            (|check_union2| (QEQCAR #4# 2)
                                            (|Record| (|:| |ty| (|Symbol|))
                                                      (|:| |parts| (|List| $)))
                                            (|Union| (|:| |nul| #7="none")
                                                     (|:| |simple|
                                                          (|Record|
                                                           (|:| |ty|
                                                                (|Symbol|))
                                                           (|:| |control1|
                                                                (QREFELT $ 6))
                                                           (|:| |control2|
                                                                (QREFELT $
                                                                         6))))
                                                     (|:| |compound|
                                                          (|Record|
                                                           (|:| |ty|
                                                                (|Symbol|))
                                                           (|:| |parts|
                                                                (|List| $)))))
                                            #4#))))
                   (COND
                    ((EQL (SPADCALL |p| (QREFELT $ 18)) 0)
                     (PROGN (LETT #2# |y|) (GO #6#))))
                   (COND
                    ((EQL (SPADCALL |p| (QREFELT $ 18)) 1)
                     (PROGN
                      (LETT #2#
                            (SPADCALL (SPADCALL |p| (QREFELT $ 19)) |y|
                                      (QREFELT $ 20)))
                      (GO #6#))))
                   (LETT |res|
                         (SPADCALL (SPADCALL |p| (QREFELT $ 19)) |y|
                                   (QREFELT $ 20)))
                   (SEQ (LETT |ptr| 2) (LETT #5# (SPADCALL |p| (QREFELT $ 18)))
                        G190 (COND ((|greater_SI| |ptr| #5#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |res|
                                (SPADCALL |res|
                                          (SPADCALL |p| |ptr| (QREFELT $ 22))
                                          (QREFELT $ 20)))))
                        (LETT |ptr| (|inc_SI| |ptr|)) (GO G190) G191
                        (EXIT NIL))
                   (EXIT (PROGN (LETT #2# |res|) (GO #6#))))))
                (COND
                 ((QEQCAR |y| 2)
                  (SEQ
                   (LETT |p|
                         (QCDR
                          (PROG2 (LETT #4# |y|)
                              (QCDR #4#)
                            (|check_union2| (QEQCAR #4# 2)
                                            (|Record| (|:| |ty| (|Symbol|))
                                                      (|:| |parts| (|List| $)))
                                            (|Union| (|:| |nul| #7#)
                                                     (|:| |simple|
                                                          (|Record|
                                                           (|:| |ty|
                                                                (|Symbol|))
                                                           (|:| |control1|
                                                                (QREFELT $ 6))
                                                           (|:| |control2|
                                                                (QREFELT $
                                                                         6))))
                                                     (|:| |compound|
                                                          (|Record|
                                                           (|:| |ty|
                                                                (|Symbol|))
                                                           (|:| |parts|
                                                                (|List| $)))))
                                            #4#))))
                   (COND
                    ((EQL (SPADCALL |p| (QREFELT $ 18)) 0)
                     (PROGN (LETT #2# |x|) (GO #6#))))
                   (COND
                    ((EQL (SPADCALL |p| (QREFELT $ 18)) 1)
                     (PROGN
                      (LETT #2#
                            (SPADCALL (SPADCALL |p| (QREFELT $ 19)) |x|
                                      (QREFELT $ 20)))
                      (GO #6#))))
                   (LETT |res|
                         (SPADCALL (SPADCALL |p| (QREFELT $ 19)) |x|
                                   (QREFELT $ 20)))
                   (SEQ (LETT |ptr| 2) (LETT #3# (SPADCALL |p| (QREFELT $ 18)))
                        G190 (COND ((|greater_SI| |ptr| #3#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |res|
                                (SPADCALL |res|
                                          (SPADCALL |p| |ptr| (QREFELT $ 22))
                                          (QREFELT $ 20)))))
                        (LETT |ptr| (|inc_SI| |ptr|)) (GO G190) G191
                        (EXIT NIL))
                   (EXIT (PROGN (LETT #2# |res|) (GO #6#))))))
                (LETT |xmin|
                      (QVELT
                       (PROG2 (LETT #1# |x|)
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 1)
                                         (|Record| (|:| |ty| (|Symbol|))
                                                   (|:| |control1|
                                                        (QREFELT $ 6))
                                                   (|:| |control2|
                                                        (QREFELT $ 6)))
                                         (|Union| (|:| |nul| #7#)
                                                  (|:| |simple|
                                                       (|Record|
                                                        (|:| |ty| (|Symbol|))
                                                        (|:| |control1|
                                                             (QREFELT $ 6))
                                                        (|:| |control2|
                                                             (QREFELT $ 6))))
                                                  (|:| |compound|
                                                       (|Record|
                                                        (|:| |ty| (|Symbol|))
                                                        (|:| |parts|
                                                             (|List| $)))))
                                         #1#))
                       1))
                (LETT |xmax|
                      (QVELT
                       (PROG2 (LETT #1# |x|)
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 1)
                                         (|Record| (|:| |ty| (|Symbol|))
                                                   (|:| |control1|
                                                        (QREFELT $ 6))
                                                   (|:| |control2|
                                                        (QREFELT $ 6)))
                                         (|Union| (|:| |nul| #7#)
                                                  (|:| |simple|
                                                       (|Record|
                                                        (|:| |ty| (|Symbol|))
                                                        (|:| |control1|
                                                             (QREFELT $ 6))
                                                        (|:| |control2|
                                                             (QREFELT $ 6))))
                                                  (|:| |compound|
                                                       (|Record|
                                                        (|:| |ty| (|Symbol|))
                                                        (|:| |parts|
                                                             (|List| $)))))
                                         #1#))
                       2))
                (LETT |ymin|
                      (QVELT
                       (PROG2 (LETT #1# |y|)
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 1)
                                         (|Record| (|:| |ty| (|Symbol|))
                                                   (|:| |control1|
                                                        (QREFELT $ 6))
                                                   (|:| |control2|
                                                        (QREFELT $ 6)))
                                         (|Union| (|:| |nul| #7#)
                                                  (|:| |simple|
                                                       (|Record|
                                                        (|:| |ty| (|Symbol|))
                                                        (|:| |control1|
                                                             (QREFELT $ 6))
                                                        (|:| |control2|
                                                             (QREFELT $ 6))))
                                                  (|:| |compound|
                                                       (|Record|
                                                        (|:| |ty| (|Symbol|))
                                                        (|:| |parts|
                                                             (|List| $)))))
                                         #1#))
                       1))
                (LETT |ymax|
                      (QVELT
                       (PROG2 (LETT #1# |y|)
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 1)
                                         (|Record| (|:| |ty| (|Symbol|))
                                                   (|:| |control1|
                                                        (QREFELT $ 6))
                                                   (|:| |control2|
                                                        (QREFELT $ 6)))
                                         (|Union| (|:| |nul| #7#)
                                                  (|:| |simple|
                                                       (|Record|
                                                        (|:| |ty| (|Symbol|))
                                                        (|:| |control1|
                                                             (QREFELT $ 6))
                                                        (|:| |control2|
                                                             (QREFELT $ 6))))
                                                  (|:| |compound|
                                                       (|Record|
                                                        (|:| |ty| (|Symbol|))
                                                        (|:| |parts|
                                                             (|List| $)))))
                                         #1#))
                       2))
                (COND
                 ((EQUAL
                   (QVELT
                    (PROG2 (LETT #1# |x|)
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 1)
                                      (|Record| (|:| |ty| (|Symbol|))
                                                (|:| |control1| (QREFELT $ 6))
                                                (|:| |control2| (QREFELT $ 6)))
                                      (|Union| (|:| |nul| #7#)
                                               (|:| |simple|
                                                    (|Record|
                                                     (|:| |ty| (|Symbol|))
                                                     (|:| |control1|
                                                          (QREFELT $ 6))
                                                     (|:| |control2|
                                                          (QREFELT $ 6))))
                                               (|:| |compound|
                                                    (|Record|
                                                     (|:| |ty| (|Symbol|))
                                                     (|:| |parts|
                                                          (|List| $)))))
                                      #1#))
                    0)
                   '|ellipoid|)
                  (SEQ
                   (LETT |xmin|
                         (SPADCALL
                          (QVELT
                           (PROG2 (LETT #1# |x|)
                               (QCDR #1#)
                             (|check_union2| (QEQCAR #1# 1)
                                             (|Record| (|:| |ty| (|Symbol|))
                                                       (|:| |control1|
                                                            (QREFELT $ 6))
                                                       (|:| |control2|
                                                            (QREFELT $ 6)))
                                             (|Union| (|:| |nul| #7#)
                                                      (|:| |simple|
                                                           (|Record|
                                                            (|:| |ty|
                                                                 (|Symbol|))
                                                            (|:| |control1|
                                                                 (QREFELT $ 6))
                                                            (|:| |control2|
                                                                 (QREFELT $
                                                                          6))))
                                                      (|:| |compound|
                                                           (|Record|
                                                            (|:| |ty|
                                                                 (|Symbol|))
                                                            (|:| |parts|
                                                                 (|List| $)))))
                                             #1#))
                           1)
                          (QVELT
                           (PROG2 (LETT #1# |x|)
                               (QCDR #1#)
                             (|check_union2| (QEQCAR #1# 1)
                                             (|Record| (|:| |ty| (|Symbol|))
                                                       (|:| |control1|
                                                            (QREFELT $ 6))
                                                       (|:| |control2|
                                                            (QREFELT $ 6)))
                                             (|Union| (|:| |nul| #7#)
                                                      (|:| |simple|
                                                           (|Record|
                                                            (|:| |ty|
                                                                 (|Symbol|))
                                                            (|:| |control1|
                                                                 (QREFELT $ 6))
                                                            (|:| |control2|
                                                                 (QREFELT $
                                                                          6))))
                                                      (|:| |compound|
                                                           (|Record|
                                                            (|:| |ty|
                                                                 (|Symbol|))
                                                            (|:| |parts|
                                                                 (|List| $)))))
                                             #1#))
                           2)
                          (QREFELT $ 23)))
                   (EXIT
                    (LETT |xmax|
                          (SPADCALL
                           (QVELT
                            (PROG2 (LETT #1# |x|)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 1)
                                              (|Record| (|:| |ty| (|Symbol|))
                                                        (|:| |control1|
                                                             (QREFELT $ 6))
                                                        (|:| |control2|
                                                             (QREFELT $ 6)))
                                              (|Union| (|:| |nul| #7#)
                                                       (|:| |simple|
                                                            (|Record|
                                                             (|:| |ty|
                                                                  (|Symbol|))
                                                             (|:| |control1|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |control2|
                                                                  (QREFELT $
                                                                           6))))
                                                       (|:| |compound|
                                                            (|Record|
                                                             (|:| |ty|
                                                                  (|Symbol|))
                                                             (|:| |parts|
                                                                  (|List|
                                                                   $)))))
                                              #1#))
                            1)
                           (QVELT
                            (PROG2 (LETT #1# |x|)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 1)
                                              (|Record| (|:| |ty| (|Symbol|))
                                                        (|:| |control1|
                                                             (QREFELT $ 6))
                                                        (|:| |control2|
                                                             (QREFELT $ 6)))
                                              (|Union| (|:| |nul| #7#)
                                                       (|:| |simple|
                                                            (|Record|
                                                             (|:| |ty|
                                                                  (|Symbol|))
                                                             (|:| |control1|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |control2|
                                                                  (QREFELT $
                                                                           6))))
                                                       (|:| |compound|
                                                            (|Record|
                                                             (|:| |ty|
                                                                  (|Symbol|))
                                                             (|:| |parts|
                                                                  (|List|
                                                                   $)))))
                                              #1#))
                            2)
                           (QREFELT $ 24)))))))
                (COND
                 ((EQUAL
                   (QVELT
                    (PROG2 (LETT #1# |y|)
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 1)
                                      (|Record| (|:| |ty| (|Symbol|))
                                                (|:| |control1| (QREFELT $ 6))
                                                (|:| |control2| (QREFELT $ 6)))
                                      (|Union| (|:| |nul| #7#)
                                               (|:| |simple|
                                                    (|Record|
                                                     (|:| |ty| (|Symbol|))
                                                     (|:| |control1|
                                                          (QREFELT $ 6))
                                                     (|:| |control2|
                                                          (QREFELT $ 6))))
                                               (|:| |compound|
                                                    (|Record|
                                                     (|:| |ty| (|Symbol|))
                                                     (|:| |parts|
                                                          (|List| $)))))
                                      #1#))
                    0)
                   '|ellipoid|)
                  (SEQ
                   (LETT |ymin|
                         (SPADCALL
                          (QVELT
                           (PROG2 (LETT #1# |y|)
                               (QCDR #1#)
                             (|check_union2| (QEQCAR #1# 1)
                                             (|Record| (|:| |ty| (|Symbol|))
                                                       (|:| |control1|
                                                            (QREFELT $ 6))
                                                       (|:| |control2|
                                                            (QREFELT $ 6)))
                                             (|Union| (|:| |nul| #7#)
                                                      (|:| |simple|
                                                           (|Record|
                                                            (|:| |ty|
                                                                 (|Symbol|))
                                                            (|:| |control1|
                                                                 (QREFELT $ 6))
                                                            (|:| |control2|
                                                                 (QREFELT $
                                                                          6))))
                                                      (|:| |compound|
                                                           (|Record|
                                                            (|:| |ty|
                                                                 (|Symbol|))
                                                            (|:| |parts|
                                                                 (|List| $)))))
                                             #1#))
                           1)
                          (QVELT
                           (PROG2 (LETT #1# |y|)
                               (QCDR #1#)
                             (|check_union2| (QEQCAR #1# 1)
                                             (|Record| (|:| |ty| (|Symbol|))
                                                       (|:| |control1|
                                                            (QREFELT $ 6))
                                                       (|:| |control2|
                                                            (QREFELT $ 6)))
                                             (|Union| (|:| |nul| #7#)
                                                      (|:| |simple|
                                                           (|Record|
                                                            (|:| |ty|
                                                                 (|Symbol|))
                                                            (|:| |control1|
                                                                 (QREFELT $ 6))
                                                            (|:| |control2|
                                                                 (QREFELT $
                                                                          6))))
                                                      (|:| |compound|
                                                           (|Record|
                                                            (|:| |ty|
                                                                 (|Symbol|))
                                                            (|:| |parts|
                                                                 (|List| $)))))
                                             #1#))
                           2)
                          (QREFELT $ 23)))
                   (EXIT
                    (LETT |ymax|
                          (SPADCALL
                           (QVELT
                            (PROG2 (LETT #1# |y|)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 1)
                                              (|Record| (|:| |ty| (|Symbol|))
                                                        (|:| |control1|
                                                             (QREFELT $ 6))
                                                        (|:| |control2|
                                                             (QREFELT $ 6)))
                                              (|Union| (|:| |nul| #7#)
                                                       (|:| |simple|
                                                            (|Record|
                                                             (|:| |ty|
                                                                  (|Symbol|))
                                                             (|:| |control1|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |control2|
                                                                  (QREFELT $
                                                                           6))))
                                                       (|:| |compound|
                                                            (|Record|
                                                             (|:| |ty|
                                                                  (|Symbol|))
                                                             (|:| |parts|
                                                                  (|List|
                                                                   $)))))
                                              #1#))
                            1)
                           (QVELT
                            (PROG2 (LETT #1# |y|)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 1)
                                              (|Record| (|:| |ty| (|Symbol|))
                                                        (|:| |control1|
                                                             (QREFELT $ 6))
                                                        (|:| |control2|
                                                             (QREFELT $ 6)))
                                              (|Union| (|:| |nul| #7#)
                                                       (|:| |simple|
                                                            (|Record|
                                                             (|:| |ty|
                                                                  (|Symbol|))
                                                             (|:| |control1|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |control2|
                                                                  (QREFELT $
                                                                           6))))
                                                       (|:| |compound|
                                                            (|Record|
                                                             (|:| |ty|
                                                                  (|Symbol|))
                                                             (|:| |parts|
                                                                  (|List|
                                                                   $)))))
                                              #1#))
                            2)
                           (QREFELT $ 24)))))))
                (EXIT
                 (CONS 1
                       (VECTOR '|box| (SPADCALL |xmin| |ymin| (QREFELT $ 9))
                               (SPADCALL |xmax| |ymax| (QREFELT $ 10)))))))
          #6# (EXIT #2#)))) 

(SDEFUN |SBOUND;extendToPoint;$PT$;7| ((|n| $) (|p| PT) ($ $))
        (SPROG
         ((|xmax| (PT)) (|xmin| (PT)) (#1=#:G445 NIL) (|res| ($))
          (#2=#:G446 NIL) (|ptr| NIL) (|pa| (|List| $)) (#3=#:G400 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((QEQCAR |n| 0)
              (PROGN
               (LETT #1# (CONS 1 (VECTOR '|box| |p| |p|)))
               (GO #4=#:G444))))
            (COND
             ((QEQCAR |n| 2)
              (SEQ
               (LETT |pa|
                     (QCDR
                      (PROG2 (LETT #3# |n|)
                          (QCDR #3#)
                        (|check_union2| (QEQCAR #3# 2)
                                        (|Record| (|:| |ty| (|Symbol|))
                                                  (|:| |parts| (|List| $)))
                                        (|Union| (|:| |nul| "none")
                                                 (|:| |simple|
                                                      (|Record|
                                                       (|:| |ty| (|Symbol|))
                                                       (|:| |control1|
                                                            (QREFELT $ 6))
                                                       (|:| |control2|
                                                            (QREFELT $ 6))))
                                                 (|:| |compound|
                                                      (|Record|
                                                       (|:| |ty| (|Symbol|))
                                                       (|:| |parts|
                                                            (|List| $)))))
                                        #3#))))
               (COND
                ((EQL (SPADCALL |pa| (QREFELT $ 18)) 0)
                 (PROGN (LETT #1# (CONS 1 (VECTOR '|box| |p| |p|))) (GO #4#))))
               (COND
                ((EQL (SPADCALL |pa| (QREFELT $ 18)) 1)
                 (PROGN
                  (LETT #1#
                        (SPADCALL (SPADCALL |pa| (QREFELT $ 19)) |p|
                                  (QREFELT $ 25)))
                  (GO #4#))))
               (LETT |res|
                     (SPADCALL (SPADCALL |pa| (QREFELT $ 19)) |p|
                               (QREFELT $ 25)))
               (SEQ (LETT |ptr| 2) (LETT #2# (SPADCALL |pa| (QREFELT $ 18)))
                    G190 (COND ((|greater_SI| |ptr| #2#) (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT |res|
                            (SPADCALL |res|
                                      (SPADCALL |pa| |ptr| (QREFELT $ 22))
                                      (QREFELT $ 20)))))
                    (LETT |ptr| (|inc_SI| |ptr|)) (GO G190) G191 (EXIT NIL))
               (EXIT (PROGN (LETT #1# |res|) (GO #4#))))))
            (LETT |xmin| (SPADCALL |n| (QREFELT $ 26)))
            (LETT |xmax| (SPADCALL |n| (QREFELT $ 27)))
            (EXIT
             (CONS 1
                   (VECTOR '|box| (SPADCALL |xmin| |p| (QREFELT $ 9))
                           (SPADCALL |xmax| |p| (QREFELT $ 10)))))))
          #4# (EXIT #1#)))) 

(SDEFUN |SBOUND;containsPoint?;$PTB;8| ((|n| $) (|p| PT) ($ |Boolean|))
        (SPROG
         ((#1=#:G399 NIL) (#2=#:G456 NIL) (|rDist| #3=(|DoubleFloat|))
          (|pDist| #3#) (|pRel| (PT)) (#4=#:G457 NIL) (|sub| NIL)
          (|pa| (|List| $)) (#5=#:G400 NIL))
         (SEQ
          (EXIT
           (SEQ (COND ((QEQCAR |n| 0) (PROGN (LETT #2# NIL) (GO #6=#:G455))))
                (COND
                 ((QEQCAR |n| 2)
                  (SEQ
                   (LETT |pa|
                         (QCDR
                          (PROG2 (LETT #5# |n|)
                              (QCDR #5#)
                            (|check_union2| (QEQCAR #5# 2)
                                            (|Record| (|:| |ty| (|Symbol|))
                                                      (|:| |parts| (|List| $)))
                                            (|Union| (|:| |nul| #7="none")
                                                     (|:| |simple|
                                                          (|Record|
                                                           (|:| |ty|
                                                                (|Symbol|))
                                                           (|:| |control1|
                                                                (QREFELT $ 6))
                                                           (|:| |control2|
                                                                (QREFELT $
                                                                         6))))
                                                     (|:| |compound|
                                                          (|Record|
                                                           (|:| |ty|
                                                                (|Symbol|))
                                                           (|:| |parts|
                                                                (|List| $)))))
                                            #5#))))
                   (SEQ (LETT |sub| NIL) (LETT #4# |pa|) G190
                        (COND
                         ((OR (ATOM #4#) (PROGN (LETT |sub| (CAR #4#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL |sub| |p| (QREFELT $ 29))
                            (PROGN (LETT #2# 'T) (GO #6#))))))
                        (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                   (EXIT (PROGN (LETT #2# NIL) (GO #6#))))))
                (COND
                 ((SPADCALL |n| (QREFELT $ 30))
                  (SEQ
                   (LETT |pRel|
                         (SPADCALL
                          (QVELT
                           (PROG2 (LETT #1# |n|)
                               (QCDR #1#)
                             (|check_union2| (QEQCAR #1# 1)
                                             (|Record| (|:| |ty| (|Symbol|))
                                                       (|:| |control1|
                                                            (QREFELT $ 6))
                                                       (|:| |control2|
                                                            (QREFELT $ 6)))
                                             (|Union| (|:| |nul| #7#)
                                                      (|:| |simple|
                                                           (|Record|
                                                            (|:| |ty|
                                                                 (|Symbol|))
                                                            (|:| |control1|
                                                                 (QREFELT $ 6))
                                                            (|:| |control2|
                                                                 (QREFELT $
                                                                          6))))
                                                      (|:| |compound|
                                                           (|Record|
                                                            (|:| |ty|
                                                                 (|Symbol|))
                                                            (|:| |parts|
                                                                 (|List| $)))))
                                             #1#))
                           1)
                          |p| (QREFELT $ 23)))
                   (LETT |pDist|
                         (|add_DF|
                          (|mul_DF| (SPADCALL |pRel| (QREFELT $ 32))
                                    (SPADCALL |pRel| (QREFELT $ 32)))
                          (|mul_DF| (SPADCALL |pRel| (QREFELT $ 33))
                                    (SPADCALL |pRel| (QREFELT $ 33)))))
                   (LETT |rDist|
                         (|add_DF|
                          (|mul_DF|
                           (SPADCALL
                            (QVELT
                             (PROG2 (LETT #1# |n|)
                                 (QCDR #1#)
                               (|check_union2| (QEQCAR #1# 1)
                                               (|Record| (|:| |ty| (|Symbol|))
                                                         (|:| |control1|
                                                              (QREFELT $ 6))
                                                         (|:| |control2|
                                                              (QREFELT $ 6)))
                                               (|Union| (|:| |nul| #7#)
                                                        (|:| |simple|
                                                             (|Record|
                                                              (|:| |ty|
                                                                   (|Symbol|))
                                                              (|:| |control1|
                                                                   (QREFELT $
                                                                            6))
                                                              (|:| |control2|
                                                                   (QREFELT $
                                                                            6))))
                                                        (|:| |compound|
                                                             (|Record|
                                                              (|:| |ty|
                                                                   (|Symbol|))
                                                              (|:| |parts|
                                                                   (|List|
                                                                    $)))))
                                               #1#))
                             2)
                            (QREFELT $ 32))
                           (SPADCALL
                            (QVELT
                             (PROG2 (LETT #1# |n|)
                                 (QCDR #1#)
                               (|check_union2| (QEQCAR #1# 1)
                                               (|Record| (|:| |ty| (|Symbol|))
                                                         (|:| |control1|
                                                              (QREFELT $ 6))
                                                         (|:| |control2|
                                                              (QREFELT $ 6)))
                                               (|Union| (|:| |nul| #7#)
                                                        (|:| |simple|
                                                             (|Record|
                                                              (|:| |ty|
                                                                   (|Symbol|))
                                                              (|:| |control1|
                                                                   (QREFELT $
                                                                            6))
                                                              (|:| |control2|
                                                                   (QREFELT $
                                                                            6))))
                                                        (|:| |compound|
                                                             (|Record|
                                                              (|:| |ty|
                                                                   (|Symbol|))
                                                              (|:| |parts|
                                                                   (|List|
                                                                    $)))))
                                               #1#))
                             2)
                            (QREFELT $ 32)))
                          (|mul_DF|
                           (SPADCALL
                            (QVELT
                             (PROG2 (LETT #1# |n|)
                                 (QCDR #1#)
                               (|check_union2| (QEQCAR #1# 1)
                                               (|Record| (|:| |ty| (|Symbol|))
                                                         (|:| |control1|
                                                              (QREFELT $ 6))
                                                         (|:| |control2|
                                                              (QREFELT $ 6)))
                                               (|Union| (|:| |nul| #7#)
                                                        (|:| |simple|
                                                             (|Record|
                                                              (|:| |ty|
                                                                   (|Symbol|))
                                                              (|:| |control1|
                                                                   (QREFELT $
                                                                            6))
                                                              (|:| |control2|
                                                                   (QREFELT $
                                                                            6))))
                                                        (|:| |compound|
                                                             (|Record|
                                                              (|:| |ty|
                                                                   (|Symbol|))
                                                              (|:| |parts|
                                                                   (|List|
                                                                    $)))))
                                               #1#))
                             2)
                            (QREFELT $ 33))
                           (SPADCALL
                            (QVELT
                             (PROG2 (LETT #1# |n|)
                                 (QCDR #1#)
                               (|check_union2| (QEQCAR #1# 1)
                                               (|Record| (|:| |ty| (|Symbol|))
                                                         (|:| |control1|
                                                              (QREFELT $ 6))
                                                         (|:| |control2|
                                                              (QREFELT $ 6)))
                                               (|Union| (|:| |nul| #7#)
                                                        (|:| |simple|
                                                             (|Record|
                                                              (|:| |ty|
                                                                   (|Symbol|))
                                                              (|:| |control1|
                                                                   (QREFELT $
                                                                            6))
                                                              (|:| |control2|
                                                                   (QREFELT $
                                                                            6))))
                                                        (|:| |compound|
                                                             (|Record|
                                                              (|:| |ty|
                                                                   (|Symbol|))
                                                              (|:| |parts|
                                                                   (|List|
                                                                    $)))))
                                               #1#))
                             2)
                            (QREFELT $ 33)))))
                   (EXIT
                    (PROGN
                     (LETT #2# (SPADCALL |rDist| |pDist| (QREFELT $ 34)))
                     (GO #6#))))))
                (EXIT
                 (SPADCALL |p|
                           (QVELT
                            (PROG2 (LETT #1# |n|)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 1)
                                              (|Record| (|:| |ty| (|Symbol|))
                                                        (|:| |control1|
                                                             (QREFELT $ 6))
                                                        (|:| |control2|
                                                             (QREFELT $ 6)))
                                              (|Union| (|:| |nul| #7#)
                                                       (|:| |simple|
                                                            (|Record|
                                                             (|:| |ty|
                                                                  (|Symbol|))
                                                             (|:| |control1|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |control2|
                                                                  (QREFELT $
                                                                           6))))
                                                       (|:| |compound|
                                                            (|Record|
                                                             (|:| |ty|
                                                                  (|Symbol|))
                                                             (|:| |parts|
                                                                  (|List|
                                                                   $)))))
                                              #1#))
                            1)
                           (QVELT
                            (PROG2 (LETT #1# |n|)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 1)
                                              (|Record| (|:| |ty| (|Symbol|))
                                                        (|:| |control1|
                                                             (QREFELT $ 6))
                                                        (|:| |control2|
                                                             (QREFELT $ 6)))
                                              (|Union| (|:| |nul| #7#)
                                                       (|:| |simple|
                                                            (|Record|
                                                             (|:| |ty|
                                                                  (|Symbol|))
                                                             (|:| |control1|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |control2|
                                                                  (QREFELT $
                                                                           6))))
                                                       (|:| |compound|
                                                            (|Record|
                                                             (|:| |ty|
                                                                  (|Symbol|))
                                                             (|:| |parts|
                                                                  (|List|
                                                                   $)))))
                                              #1#))
                            2)
                           (QREFELT $ 35)))))
          #6# (EXIT #2#)))) 

(SDEFUN |SBOUND;lineIntersect;$2PT;9| ((|n| $) (|p| PT) ($ PT))
        (SPROG
         ((|y| #1=(|DoubleFloat|)) (|x| #1#) (|yp| #2=(|DoubleFloat|))
          (|xp| #3=(|DoubleFloat|)) (|b| #2#) (|a| #3#) (|rad| (PT))
          (#4=#:G399 NIL) (|pRel| (PT)) (|cent| (PT)) (#5=#:G470 NIL)
          (|divisor| (|DoubleFloat|)) (|ab| (|DoubleFloat|)) (|centre| (PT)))
         (SEQ
          (EXIT
           (SEQ (COND ((QEQCAR |n| 0) (PROGN (LETT #5# |p|) (GO #6=#:G469))))
                (COND
                 ((QEQCAR |n| 2)
                  (|error| "cant compute lineIntersect with compound border")))
                (COND
                 ((SPADCALL |n| (QREFELT $ 30))
                  (SEQ
                   (LETT |centre|
                         (QVELT
                          (PROG2 (LETT #4# |n|)
                              (QCDR #4#)
                            (|check_union2| (QEQCAR #4# 1)
                                            (|Record| (|:| |ty| (|Symbol|))
                                                      (|:| |control1|
                                                           (QREFELT $ 6))
                                                      (|:| |control2|
                                                           (QREFELT $ 6)))
                                            (|Union| (|:| |nul| #7="none")
                                                     (|:| |simple|
                                                          (|Record|
                                                           (|:| |ty|
                                                                (|Symbol|))
                                                           (|:| |control1|
                                                                (QREFELT $ 6))
                                                           (|:| |control2|
                                                                (QREFELT $
                                                                         6))))
                                                     (|:| |compound|
                                                          (|Record|
                                                           (|:| |ty|
                                                                (|Symbol|))
                                                           (|:| |parts|
                                                                (|List| $)))))
                                            #4#))
                          1))
                   (LETT |rad|
                         (QVELT
                          (PROG2 (LETT #4# |n|)
                              (QCDR #4#)
                            (|check_union2| (QEQCAR #4# 1)
                                            (|Record| (|:| |ty| (|Symbol|))
                                                      (|:| |control1|
                                                           (QREFELT $ 6))
                                                      (|:| |control2|
                                                           (QREFELT $ 6)))
                                            (|Union| (|:| |nul| #7#)
                                                     (|:| |simple|
                                                          (|Record|
                                                           (|:| |ty|
                                                                (|Symbol|))
                                                           (|:| |control1|
                                                                (QREFELT $ 6))
                                                           (|:| |control2|
                                                                (QREFELT $
                                                                         6))))
                                                     (|:| |compound|
                                                          (|Record|
                                                           (|:| |ty|
                                                                (|Symbol|))
                                                           (|:| |parts|
                                                                (|List| $)))))
                                            #4#))
                          2))
                   (LETT |pRel| (SPADCALL |p| |centre| (QREFELT $ 23)))
                   (LETT |a| (SPADCALL |rad| (QREFELT $ 32)))
                   (LETT |b| (SPADCALL |rad| (QREFELT $ 33)))
                   (LETT |xp| (SPADCALL |pRel| (QREFELT $ 32)))
                   (LETT |yp| (SPADCALL |pRel| (QREFELT $ 33)))
                   (LETT |ab| (|mul_DF| |a| |b|))
                   (LETT |divisor|
                         (SPADCALL
                          (|add_DF|
                           (|mul_DF| (|mul_DF| (|mul_DF| |a| |a|) |yp|) |yp|)
                           (|mul_DF| (|mul_DF| (|mul_DF| |b| |b|) |xp|) |xp|))
                          (QREFELT $ 36)))
                   (LETT |x| 0.0) (LETT |y| 0.0)
                   (COND
                    ((NULL (|eql_DF| |divisor| 0.0))
                     (SEQ (LETT |x| (|div_DF| (|mul_DF| |ab| |xp|) |divisor|))
                          (EXIT
                           (LETT |y|
                                 (|div_DF| (|mul_DF| |ab| |yp|) |divisor|))))))
                   (EXIT
                    (PROGN
                     (LETT #5#
                           (SPADCALL |centre| (SPADCALL |x| |y| (QREFELT $ 37))
                                     (QREFELT $ 24)))
                     (GO #6#))))))
                (LETT |cent|
                      (SPADCALL
                       (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 40))
                                 (QREFELT $ 41))
                       (SPADCALL
                        (QVELT
                         (PROG2 (LETT #4# |n|)
                             (QCDR #4#)
                           (|check_union2| (QEQCAR #4# 1)
                                           (|Record| (|:| |ty| (|Symbol|))
                                                     (|:| |control1|
                                                          (QREFELT $ 6))
                                                     (|:| |control2|
                                                          (QREFELT $ 6)))
                                           (|Union| (|:| |nul| #7#)
                                                    (|:| |simple|
                                                         (|Record|
                                                          (|:| |ty| (|Symbol|))
                                                          (|:| |control1|
                                                               (QREFELT $ 6))
                                                          (|:| |control2|
                                                               (QREFELT $ 6))))
                                                    (|:| |compound|
                                                         (|Record|
                                                          (|:| |ty| (|Symbol|))
                                                          (|:| |parts|
                                                               (|List| $)))))
                                           #4#))
                         1)
                        (QVELT
                         (PROG2 (LETT #4# |n|)
                             (QCDR #4#)
                           (|check_union2| (QEQCAR #4# 1)
                                           (|Record| (|:| |ty| (|Symbol|))
                                                     (|:| |control1|
                                                          (QREFELT $ 6))
                                                     (|:| |control2|
                                                          (QREFELT $ 6)))
                                           (|Union| (|:| |nul| #7#)
                                                    (|:| |simple|
                                                         (|Record|
                                                          (|:| |ty| (|Symbol|))
                                                          (|:| |control1|
                                                               (QREFELT $ 6))
                                                          (|:| |control2|
                                                               (QREFELT $ 6))))
                                                    (|:| |compound|
                                                         (|Record|
                                                          (|:| |ty| (|Symbol|))
                                                          (|:| |parts|
                                                               (|List| $)))))
                                           #4#))
                         2)
                        (QREFELT $ 24))
                       (QREFELT $ 42)))
                (LETT |pRel| (SPADCALL |p| |cent| (QREFELT $ 23)))
                (LETT |rad|
                      (SPADCALL
                       (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 40))
                                 (QREFELT $ 41))
                       (SPADCALL
                        (QVELT
                         (PROG2 (LETT #4# |n|)
                             (QCDR #4#)
                           (|check_union2| (QEQCAR #4# 1)
                                           (|Record| (|:| |ty| (|Symbol|))
                                                     (|:| |control1|
                                                          (QREFELT $ 6))
                                                     (|:| |control2|
                                                          (QREFELT $ 6)))
                                           (|Union| (|:| |nul| #7#)
                                                    (|:| |simple|
                                                         (|Record|
                                                          (|:| |ty| (|Symbol|))
                                                          (|:| |control1|
                                                               (QREFELT $ 6))
                                                          (|:| |control2|
                                                               (QREFELT $ 6))))
                                                    (|:| |compound|
                                                         (|Record|
                                                          (|:| |ty| (|Symbol|))
                                                          (|:| |parts|
                                                               (|List| $)))))
                                           #4#))
                         2)
                        (QVELT
                         (PROG2 (LETT #4# |n|)
                             (QCDR #4#)
                           (|check_union2| (QEQCAR #4# 1)
                                           (|Record| (|:| |ty| (|Symbol|))
                                                     (|:| |control1|
                                                          (QREFELT $ 6))
                                                     (|:| |control2|
                                                          (QREFELT $ 6)))
                                           (|Union| (|:| |nul| #7#)
                                                    (|:| |simple|
                                                         (|Record|
                                                          (|:| |ty| (|Symbol|))
                                                          (|:| |control1|
                                                               (QREFELT $ 6))
                                                          (|:| |control2|
                                                               (QREFELT $ 6))))
                                                    (|:| |compound|
                                                         (|Record|
                                                          (|:| |ty| (|Symbol|))
                                                          (|:| |parts|
                                                               (|List| $)))))
                                           #4#))
                         1)
                        (QREFELT $ 23))
                       (QREFELT $ 42)))
                (LETT |a| (SPADCALL |rad| (QREFELT $ 32)))
                (LETT |b| (SPADCALL |rad| (QREFELT $ 33)))
                (LETT |xp| (SPADCALL |pRel| (QREFELT $ 32)))
                (LETT |yp| (SPADCALL |pRel| (QREFELT $ 33)))
                (LETT |x|
                      (COND
                       ((SPADCALL |yp| 0.0 (QREFELT $ 45))
                        (|div_DF| (|mul_DF| |b| |xp|) |yp|))
                       (#8='T (|add_DF| |a| 1.0))))
                (LETT |y|
                      (COND ((SPADCALL |yp| 0.0 (QREFELT $ 34)) |b|)
                            (#8# (|minus_DF| |b|))))
                (COND ((|less_DF| |yp| 0.0) (LETT |x| (|minus_DF| |x|))))
                (COND
                 ((OR (SPADCALL |x| |a| (QREFELT $ 34))
                      (|less_DF| |x| (|minus_DF| |a|)))
                  (SEQ
                   (LETT |y|
                         (COND
                          ((SPADCALL |xp| 0.0 (QREFELT $ 45))
                           (|div_DF| (|mul_DF| |a| |yp|) |xp|))
                          (#8# |b|)))
                   (LETT |x|
                         (COND ((SPADCALL |xp| 0.0 (QREFELT $ 34)) |a|)
                               (#8# (|minus_DF| |a|))))
                   (EXIT
                    (COND
                     ((|less_DF| |xp| 0.0) (LETT |y| (|minus_DF| |y|))))))))
                (EXIT
                 (SPADCALL |cent| (SPADCALL |x| |y| (QREFELT $ 37))
                           (QREFELT $ 24)))))
          #6# (EXIT #5#)))) 

(PUT '|SBOUND;isNull?;$B;10| '|SPADreplace| '(XLAM (|n|) (QEQCAR |n| 0))) 

(SDEFUN |SBOUND;isNull?;$B;10| ((|n| $) ($ |Boolean|)) (QEQCAR |n| 0)) 

(SDEFUN |SBOUND;isEllipse?;$B;11| ((|n| $) ($ |Boolean|))
        (SPROG ((#1=#:G479 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((NULL (QEQCAR |n| 1))
                    (PROGN (LETT #1# NIL) (GO #2=#:G478))))
                  (EXIT (EQUAL (QVELT (CDR |n|) 0) '|ellipoid|))))
                #2# (EXIT #1#)))) 

(SDEFUN |SBOUND;isBox?;$B;12| ((|n| $) ($ |Boolean|))
        (SPROG ((#1=#:G487 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((NULL (QEQCAR |n| 1))
                    (PROGN (LETT #1# NIL) (GO #2=#:G486))))
                  (EXIT (EQUAL (QVELT (CDR |n|) 0) '|box|))))
                #2# (EXIT #1#)))) 

(SDEFUN |SBOUND;getMin;$PT;13| ((|n| $) ($ PT))
        (SPROG ((#1=#:G399 NIL) (#2=#:G492 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |n| (QREFELT $ 30))
                    (PROGN
                     (LETT #2#
                           (SPADCALL
                            (SPADCALL
                             (QVELT
                              (PROG2 (LETT #1# |n|)
                                  (QCDR #1#)
                                (|check_union2| (QEQCAR #1# 1)
                                                (|Record| (|:| |ty| (|Symbol|))
                                                          (|:| |control1|
                                                               (QREFELT $ 6))
                                                          (|:| |control2|
                                                               (QREFELT $ 6)))
                                                (|Union| (|:| |nul| #3="none")
                                                         (|:| |simple|
                                                              (|Record|
                                                               (|:| |ty|
                                                                    (|Symbol|))
                                                               (|:| |control1|
                                                                    (QREFELT $
                                                                             6))
                                                               (|:| |control2|
                                                                    (QREFELT $
                                                                             6))))
                                                         (|:| |compound|
                                                              (|Record|
                                                               (|:| |ty|
                                                                    (|Symbol|))
                                                               (|:| |parts|
                                                                    (|List|
                                                                     $)))))
                                                #1#))
                              1)
                             (QVELT
                              (PROG2 (LETT #1# |n|)
                                  (QCDR #1#)
                                (|check_union2| (QEQCAR #1# 1)
                                                (|Record| (|:| |ty| (|Symbol|))
                                                          (|:| |control1|
                                                               (QREFELT $ 6))
                                                          (|:| |control2|
                                                               (QREFELT $ 6)))
                                                (|Union| (|:| |nul| #3#)
                                                         (|:| |simple|
                                                              (|Record|
                                                               (|:| |ty|
                                                                    (|Symbol|))
                                                               (|:| |control1|
                                                                    (QREFELT $
                                                                             6))
                                                               (|:| |control2|
                                                                    (QREFELT $
                                                                             6))))
                                                         (|:| |compound|
                                                              (|Record|
                                                               (|:| |ty|
                                                                    (|Symbol|))
                                                               (|:| |parts|
                                                                    (|List|
                                                                     $)))))
                                                #1#))
                              2)
                             (QREFELT $ 23))
                            (QREFELT $ 49)))
                     (GO #4=#:G491))))
                  (EXIT
                   (QVELT
                    (PROG2 (LETT #1# |n|)
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 1)
                                      (|Record| (|:| |ty| (|Symbol|))
                                                (|:| |control1| (QREFELT $ 6))
                                                (|:| |control2| (QREFELT $ 6)))
                                      (|Union| (|:| |nul| #3#)
                                               (|:| |simple|
                                                    (|Record|
                                                     (|:| |ty| (|Symbol|))
                                                     (|:| |control1|
                                                          (QREFELT $ 6))
                                                     (|:| |control2|
                                                          (QREFELT $ 6))))
                                               (|:| |compound|
                                                    (|Record|
                                                     (|:| |ty| (|Symbol|))
                                                     (|:| |parts|
                                                          (|List| $)))))
                                      #1#))
                    1))))
                #4# (EXIT #2#)))) 

(SDEFUN |SBOUND;getMax;$PT;14| ((|n| $) ($ PT))
        (SPROG ((#1=#:G399 NIL) (#2=#:G497 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |n| (QREFELT $ 30))
                    (PROGN
                     (LETT #2#
                           (SPADCALL
                            (SPADCALL
                             (QVELT
                              (PROG2 (LETT #1# |n|)
                                  (QCDR #1#)
                                (|check_union2| (QEQCAR #1# 1)
                                                (|Record| (|:| |ty| (|Symbol|))
                                                          (|:| |control1|
                                                               (QREFELT $ 6))
                                                          (|:| |control2|
                                                               (QREFELT $ 6)))
                                                (|Union| (|:| |nul| #3="none")
                                                         (|:| |simple|
                                                              (|Record|
                                                               (|:| |ty|
                                                                    (|Symbol|))
                                                               (|:| |control1|
                                                                    (QREFELT $
                                                                             6))
                                                               (|:| |control2|
                                                                    (QREFELT $
                                                                             6))))
                                                         (|:| |compound|
                                                              (|Record|
                                                               (|:| |ty|
                                                                    (|Symbol|))
                                                               (|:| |parts|
                                                                    (|List|
                                                                     $)))))
                                                #1#))
                              1)
                             (QVELT
                              (PROG2 (LETT #1# |n|)
                                  (QCDR #1#)
                                (|check_union2| (QEQCAR #1# 1)
                                                (|Record| (|:| |ty| (|Symbol|))
                                                          (|:| |control1|
                                                               (QREFELT $ 6))
                                                          (|:| |control2|
                                                               (QREFELT $ 6)))
                                                (|Union| (|:| |nul| #3#)
                                                         (|:| |simple|
                                                              (|Record|
                                                               (|:| |ty|
                                                                    (|Symbol|))
                                                               (|:| |control1|
                                                                    (QREFELT $
                                                                             6))
                                                               (|:| |control2|
                                                                    (QREFELT $
                                                                             6))))
                                                         (|:| |compound|
                                                              (|Record|
                                                               (|:| |ty|
                                                                    (|Symbol|))
                                                               (|:| |parts|
                                                                    (|List|
                                                                     $)))))
                                                #1#))
                              2)
                             (QREFELT $ 24))
                            (QREFELT $ 49)))
                     (GO #4=#:G496))))
                  (EXIT
                   (QVELT
                    (PROG2 (LETT #1# |n|)
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 1)
                                      (|Record| (|:| |ty| (|Symbol|))
                                                (|:| |control1| (QREFELT $ 6))
                                                (|:| |control2| (QREFELT $ 6)))
                                      (|Union| (|:| |nul| #3#)
                                               (|:| |simple|
                                                    (|Record|
                                                     (|:| |ty| (|Symbol|))
                                                     (|:| |control1|
                                                          (QREFELT $ 6))
                                                     (|:| |control2|
                                                          (QREFELT $ 6))))
                                               (|:| |compound|
                                                    (|Record|
                                                     (|:| |ty| (|Symbol|))
                                                     (|:| |parts|
                                                          (|List| $)))))
                                      #1#))
                    2))))
                #4# (EXIT #2#)))) 

(SDEFUN |SBOUND;getCentre;$PT;15| ((|n| $) ($ PT))
        (SPROG ((#1=#:G399 NIL) (#2=#:G502 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |n| (QREFELT $ 30))
                    (PROGN
                     (LETT #2#
                           (QVELT
                            (PROG2 (LETT #1# |n|)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 1)
                                              (|Record| (|:| |ty| (|Symbol|))
                                                        (|:| |control1|
                                                             (QREFELT $ 6))
                                                        (|:| |control2|
                                                             (QREFELT $ 6)))
                                              (|Union| (|:| |nul| #3="none")
                                                       (|:| |simple|
                                                            (|Record|
                                                             (|:| |ty|
                                                                  (|Symbol|))
                                                             (|:| |control1|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |control2|
                                                                  (QREFELT $
                                                                           6))))
                                                       (|:| |compound|
                                                            (|Record|
                                                             (|:| |ty|
                                                                  (|Symbol|))
                                                             (|:| |parts|
                                                                  (|List|
                                                                   $)))))
                                              #1#))
                            1))
                     (GO #4=#:G501))))
                  (EXIT
                   (SPADCALL
                    (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 40)) (QREFELT $ 41))
                    (SPADCALL
                     (QVELT
                      (PROG2 (LETT #1# |n|)
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 1)
                                        (|Record| (|:| |ty| (|Symbol|))
                                                  (|:| |control1|
                                                       (QREFELT $ 6))
                                                  (|:| |control2|
                                                       (QREFELT $ 6)))
                                        (|Union| (|:| |nul| #3#)
                                                 (|:| |simple|
                                                      (|Record|
                                                       (|:| |ty| (|Symbol|))
                                                       (|:| |control1|
                                                            (QREFELT $ 6))
                                                       (|:| |control2|
                                                            (QREFELT $ 6))))
                                                 (|:| |compound|
                                                      (|Record|
                                                       (|:| |ty| (|Symbol|))
                                                       (|:| |parts|
                                                            (|List| $)))))
                                        #1#))
                      1)
                     (QVELT
                      (PROG2 (LETT #1# |n|)
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 1)
                                        (|Record| (|:| |ty| (|Symbol|))
                                                  (|:| |control1|
                                                       (QREFELT $ 6))
                                                  (|:| |control2|
                                                       (QREFELT $ 6)))
                                        (|Union| (|:| |nul| #3#)
                                                 (|:| |simple|
                                                      (|Record|
                                                       (|:| |ty| (|Symbol|))
                                                       (|:| |control1|
                                                            (QREFELT $ 6))
                                                       (|:| |control2|
                                                            (QREFELT $ 6))))
                                                 (|:| |compound|
                                                      (|Record|
                                                       (|:| |ty| (|Symbol|))
                                                       (|:| |parts|
                                                            (|List| $)))))
                                        #1#))
                      2)
                     (QREFELT $ 24))
                    (QREFELT $ 42)))))
                #4# (EXIT #2#)))) 

(SDEFUN |SBOUND;link;2$L;16| ((|m| $) (|n| $) ($ |List| PT))
        (SPROG ((|bn| (PT)) (|bm| (PT)))
               (SEQ
                (LETT |bm|
                      (SPADCALL |m| (SPADCALL |n| (QREFELT $ 50))
                                (QREFELT $ 46)))
                (LETT |bn|
                      (SPADCALL |n| (SPADCALL |m| (QREFELT $ 50))
                                (QREFELT $ 46)))
                (EXIT (LIST |bm| |bn|))))) 

(SDEFUN |SBOUND;coerce;$Of;17| ((|n| $) ($ |OutputForm|))
        (SPROG
         ((|sub| (|OutputForm|)) (#1=#:G515 NIL) (#2=#:G400 NIL) (|x| NIL)
          (#3=#:G514 NIL) (#4=#:G513 NIL) (#5=#:G399 NIL) (|s| (|OutputForm|))
          (|ty| (|OutputForm|)))
         (SEQ
          (EXIT
           (SEQ (LETT |ty| (SPADCALL '|none | (QREFELT $ 55)))
                (COND
                 ((QEQCAR |n| 1)
                  (LETT |ty| (SPADCALL (QVELT (CDR |n|) 0) (QREFELT $ 56)))))
                (COND
                 ((QEQCAR |n| 2)
                  (LETT |ty| (SPADCALL (QCAR (CDR |n|)) (QREFELT $ 56)))))
                (LETT |s|
                      (SPADCALL (SPADCALL '|bound | (QREFELT $ 55)) |ty|
                                (QREFELT $ 57)))
                (COND ((QEQCAR |n| 0) (PROGN (LETT #4# |s|) (GO #6=#:G512))))
                (COND
                 ((QEQCAR |n| 1)
                  (PROGN
                   (LETT #4#
                         (SPADCALL
                          (LIST |s| (SPADCALL ":" (QREFELT $ 59))
                                (SPADCALL
                                 (QVELT
                                  (PROG2 (LETT #5# |n|)
                                      (QCDR #5#)
                                    (|check_union2| (QEQCAR #5# 1)
                                                    (|Record|
                                                     (|:| |ty| (|Symbol|))
                                                     (|:| |control1|
                                                          (QREFELT $ 6))
                                                     (|:| |control2|
                                                          (QREFELT $ 6)))
                                                    (|Union|
                                                     (|:| |nul| #7="none")
                                                     (|:| |simple|
                                                          (|Record|
                                                           (|:| |ty|
                                                                (|Symbol|))
                                                           (|:| |control1|
                                                                (QREFELT $ 6))
                                                           (|:| |control2|
                                                                (QREFELT $
                                                                         6))))
                                                     (|:| |compound|
                                                          (|Record|
                                                           (|:| |ty|
                                                                (|Symbol|))
                                                           (|:| |parts|
                                                                (|List| $)))))
                                                    #5#))
                                  1)
                                 (QREFELT $ 60))
                                (SPADCALL '-> (QREFELT $ 55))
                                (SPADCALL
                                 (QVELT
                                  (PROG2 (LETT #5# |n|)
                                      (QCDR #5#)
                                    (|check_union2| (QEQCAR #5# 1)
                                                    (|Record|
                                                     (|:| |ty| (|Symbol|))
                                                     (|:| |control1|
                                                          (QREFELT $ 6))
                                                     (|:| |control2|
                                                          (QREFELT $ 6)))
                                                    (|Union| (|:| |nul| #7#)
                                                             (|:| |simple|
                                                                  (|Record|
                                                                   (|:| |ty|
                                                                        (|Symbol|))
                                                                   (|:|
                                                                    |control1|
                                                                    (QREFELT $
                                                                             6))
                                                                   (|:|
                                                                    |control2|
                                                                    (QREFELT $
                                                                             6))))
                                                             (|:| |compound|
                                                                  (|Record|
                                                                   (|:| |ty|
                                                                        (|Symbol|))
                                                                   (|:| |parts|
                                                                        (|List|
                                                                         $)))))
                                                    #5#))
                                  2)
                                 (QREFELT $ 60)))
                          (QREFELT $ 61)))
                   (GO #6#))))
                (LETT |sub|
                      (SPADCALL
                       (PROGN
                        (LETT #3# NIL)
                        (SEQ (LETT |x| NIL)
                             (LETT #1#
                                   (QCDR
                                    (PROG2 (LETT #2# |n|)
                                        (QCDR #2#)
                                      (|check_union2| (QEQCAR #2# 2)
                                                      (|Record|
                                                       (|:| |ty| (|Symbol|))
                                                       (|:| |parts|
                                                            (|List| $)))
                                                      (|Union| (|:| |nul| #7#)
                                                               (|:| |simple|
                                                                    (|Record|
                                                                     (|:| |ty|
                                                                          (|Symbol|))
                                                                     (|:|
                                                                      |control1|
                                                                      (QREFELT
                                                                       $ 6))
                                                                     (|:|
                                                                      |control2|
                                                                      (QREFELT
                                                                       $ 6))))
                                                               (|:| |compound|
                                                                    (|Record|
                                                                     (|:| |ty|
                                                                          (|Symbol|))
                                                                     (|:|
                                                                      |parts|
                                                                      (|List|
                                                                       $)))))
                                                      #2#))))
                             G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #3#
                                     (CONS (SPADCALL |x| (QREFELT $ 62))
                                           #3#))))
                             (LETT #1# (CDR #1#)) (GO G190) G191
                             (EXIT (NREVERSE #3#))))
                       (QREFELT $ 63)))
                (EXIT
                 (SPADCALL (LIST |s| (SPADCALL '|:| (QREFELT $ 55)) |sub|)
                           (QREFELT $ 61)))))
          #6# (EXIT #4#)))) 

(DECLAIM (NOTINLINE |SBoundary;|)) 

(DEFUN |SBoundary| (#1=#:G516)
  (SPROG NIL
         (PROG (#2=#:G517)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|SBoundary|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|SBoundary;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|SBoundary|)))))))))) 

(DEFUN |SBoundary;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|SBoundary| DV$1))
          (LETT $ (GETREFV 64))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|SBoundary| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Union| (|:| |nul| "none")
                             (|:| |simple|
                                  (|Record| (|:| |ty| (|Symbol|))
                                            (|:| |control1| |#1|)
                                            (|:| |control2| |#1|)))
                             (|:| |compound|
                                  (|Record| (|:| |ty| (|Symbol|))
                                            (|:| |parts| (|List| $))))))
          $))) 

(MAKEPROP '|SBoundary| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              |SBOUND;nullBoundary;$;1| (0 . |min|) (6 . |max|)
              |SBOUND;boxBoundary;2PT$;2| |SBOUND;ellipseBoundary;2PT$;3|
              (|List| $) |SBOUND;union;L$;4| |SBOUND;intersection;L$;5|
              (|NonNegativeInteger|) (|List| $$) (12 . |#|) (17 . |first|)
              |SBOUND;sunion;3$;6| (|Integer|) (22 . |elt|) (28 . -) (34 . +)
              |SBOUND;extendToPoint;$PT$;7| |SBOUND;getMin;$PT;13|
              |SBOUND;getMax;$PT;14| (|Boolean|) |SBOUND;containsPoint?;$PTB;8|
              |SBOUND;isEllipse?;$B;11| (|DoubleFloat|) (40 . |screenCoordX|)
              (45 . |screenCoordY|) (50 . >) (56 . |inBounds?|) (63 . |sqrt|)
              (68 . |svec|) (|PositiveInteger|) (|Float|) (74 . |float|)
              (81 . |coerce|) (86 . *) (|Fraction| 21) (92 . |Zero|) (96 . ~=)
              |SBOUND;lineIntersect;$2PT;9| |SBOUND;isNull?;$B;10|
              |SBOUND;isBox?;$B;12| (102 . |toPoint|) |SBOUND;getCentre;$PT;15|
              (|List| 6) |SBOUND;link;2$L;16| (|Symbol|) (|OutputForm|)
              (107 . |outputForm|) (112 . |coerce|) (117 . |hconcat|)
              (|String|) (123 . |message|) (128 . |coerce|) (133 . |hconcat|)
              |SBOUND;coerce;$Of;17| (138 . |bracket|))
           '#(|union| 143 |sunion| 148 |nullBoundary| 154 |link| 158
              |lineIntersect| 164 |isNull?| 170 |isEllipse?| 175 |isBox?| 180
              |intersection| 185 |getMin| 190 |getMax| 195 |getCentre| 200
              |extendToPoint| 205 |ellipseBoundary| 211 |containsPoint?| 217
              |coerce| 223 |boxBoundary| 228)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|nullBoundary| ($$)) T)
                                   '((|boxBoundary| ($$ |#1| |#1|)) T)
                                   '((|ellipseBoundary| ($$ |#1| |#1|)) T)
                                   '((|union| ($$ (|List| $$))) T)
                                   '((|intersection| ($$ (|List| $$))) T)
                                   '((|sunion| ($$ $$ $$)) T)
                                   '((|extendToPoint| ($$ $$ |#1|)) T)
                                   '((|containsPoint?| ((|Boolean|) $$ |#1|))
                                     T)
                                   '((|lineIntersect| (|#1| $$ |#1|)) T)
                                   '((|isNull?| ((|Boolean|) $$)) T)
                                   '((|isEllipse?| ((|Boolean|) $$)) T)
                                   '((|isBox?| ((|Boolean|) $$)) T)
                                   '((|getMin| (|#1| $$)) T)
                                   '((|getMax| (|#1| $$)) T)
                                   '((|getCentre| (|#1| $$)) T)
                                   '((|link| ((|List| |#1|) $$ $$)) T)
                                   '((|coerce| ((|OutputForm|) $$)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 63
                                            '(2 6 0 0 0 9 2 6 0 0 0 10 1 17 16
                                              0 18 1 17 2 0 19 2 17 2 0 21 22 2
                                              6 0 0 0 23 2 6 0 0 0 24 1 6 31 0
                                              32 1 6 31 0 33 2 31 28 0 0 34 3 6
                                              28 0 0 0 35 1 31 0 0 36 2 6 0 31
                                              31 37 3 39 0 21 21 38 40 1 39 31
                                              0 41 2 6 0 31 0 42 0 43 0 44 2 31
                                              28 0 0 45 1 6 0 0 49 1 54 0 53 55
                                              1 53 54 0 56 2 54 0 0 0 57 1 54 0
                                              58 59 1 6 54 0 60 1 54 0 13 61 1
                                              54 0 13 63 1 0 0 13 14 2 0 0 0 0
                                              20 0 0 0 8 2 0 51 0 0 52 2 0 6 0
                                              6 46 1 0 28 0 47 1 0 28 0 30 1 0
                                              28 0 48 1 0 0 13 15 1 0 6 0 26 1
                                              0 6 0 27 1 0 6 0 50 2 0 0 0 6 25
                                              2 0 0 6 6 12 2 0 28 0 6 29 1 0 54
                                              0 62 2 0 0 6 6 11)))))
           '|lookupComplete|)) 
