
(SDEFUN |SCNP;namedPoints;LL$;1|
        ((|ptin| |List| PT) (|nmin| |List| (|String|)) ($ $))
        (CONS 0 (CONS |ptin| |nmin|))) 

(SDEFUN |SCNP;namedPoints;LL$;2|
        ((|scin| |List| (|Scene| PT)) (|nmin| |List| (|String|)) ($ $))
        (CONS 1 (CONS |scin| |nmin|))) 

(SDEFUN |SCNP;namedBranch;LL$;3|
        ((|chin| |List| $) (|nmin| |List| (|String|)) ($ $))
        (CONS 2 (CONS |chin| |nmin|))) 

(SDEFUN |SCNP;isPointLeaf?;$B;4| ((|n| $) ($ |Boolean|))
        (SPROG ((#1=#:G733 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((QEQCAR |n| 0)
                    (PROGN
                     (LETT #1# 'T |SCNP;isPointLeaf?;$B;4|)
                     (GO #2=#:G732))))
                  (EXIT 'NIL)))
                #2# (EXIT #1#)))) 

(SDEFUN |SCNP;isNodeLeaf?;$B;5| ((|n| $) ($ |Boolean|))
        (SPROG ((#1=#:G736 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((QEQCAR |n| 1)
                    (PROGN
                     (LETT #1# 'T |SCNP;isNodeLeaf?;$B;5|)
                     (GO #2=#:G735))))
                  (EXIT 'NIL)))
                #2# (EXIT #1#)))) 

(SDEFUN |SCNP;isNodeBranch?;$B;6| ((|n| $) ($ |Boolean|))
        (SPROG ((#1=#:G739 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((QEQCAR |n| 2)
                    (PROGN
                     (LETT #1# 'T |SCNP;isNodeBranch?;$B;6|)
                     (GO #2=#:G738))))
                  (EXIT 'NIL)))
                #2# (EXIT #1#)))) 

(SDEFUN |SCNP;getNames;$L;7| ((|n| $) ($ |List| (|String|)))
        (SPROG ((#1=#:G713 NIL) (#2=#:G743 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((QEQCAR |n| 0)
                    (PROGN
                     (LETT #2# (QCDR (CDR |n|)) . #3=(|SCNP;getNames;$L;7|))
                     (GO #4=#:G742))))
                  (EXIT
                   (QCDR
                    (PROG2 (LETT #1# |n| . #3#)
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 2)
                                      (|Record| (|:| |ch| (|List| $))
                                                (|:| |listHNM|
                                                     (|List| (|String|))))
                                      (|Union|
                                       (|:| |pt|
                                            (|Record|
                                             (|:| |listPT|
                                                  (|List| (QREFELT $ 6)))
                                             (|:| |listNM|
                                                  (|List| (|String|)))))
                                       (|:| |nd|
                                            (|Record|
                                             (|:| |listND|
                                                  (|List|
                                                   (|Scene| (QREFELT $ 6))))
                                             (|:| |listNM|
                                                  (|List| (|String|)))))
                                       (|:| |br|
                                            (|Record| (|:| |ch| (|List| $))
                                                      (|:| |listHNM|
                                                           (|List|
                                                            (|String|))))))
                                      #1#))))))
                #4# (EXIT #2#)))) 

(SDEFUN |SCNP;findPoint;$SPT;8| ((|n| $) (|ptName| |String|) ($ PT))
        (SPROG
         ((#1=#:G769 NIL) (#2=#:G711 NIL) (|s| (|String|)) (#3=#:G770 NIL)
          (|sNum| NIL) (|fst| ($)) (|c| (|List| $)) (#4=#:G713 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |n| (QREFELT $ 18))
              (SEQ
               (LETT |c|
                     (QCAR
                      (PROG2 (LETT #4# |n| . #5=(|SCNP;findPoint;$SPT;8|))
                          (QCDR #4#)
                        (|check_union2| (QEQCAR #4# 2)
                                        (|Record| (|:| |ch| (|List| $))
                                                  (|:| |listHNM|
                                                       (|List| (|String|))))
                                        (|Union|
                                         (|:| |pt|
                                              (|Record|
                                               (|:| |listPT|
                                                    (|List| (QREFELT $ 6)))
                                               (|:| |listNM|
                                                    (|List| (|String|)))))
                                         (|:| |nd|
                                              (|Record|
                                               (|:| |listND|
                                                    (|List|
                                                     (|Scene| (QREFELT $ 6))))
                                               (|:| |listNM|
                                                    (|List| (|String|)))))
                                         (|:| |br|
                                              (|Record| (|:| |ch| (|List| $))
                                                        (|:| |listHNM|
                                                             (|List|
                                                              (|String|))))))
                                        #4#)))
                     . #5#)
               (COND
                ((SPADCALL |c| NIL (QREFELT $ 21))
                 (PROGN
                  (LETT #1# (SPADCALL 0 0 (QREFELT $ 23)) . #5#)
                  (GO #6=#:G768))))
               (LETT |fst| (SPADCALL |c| (QREFELT $ 24)) . #5#)
               (COND
                ((SPADCALL |fst| (QREFELT $ 17))
                 (PROGN
                  (LETT #1# (SPADCALL 0 0 (QREFELT $ 23)) . #5#)
                  (GO #6#))))
               (EXIT
                (PROGN
                 (LETT #1# (SPADCALL |fst| |ptName| (QREFELT $ 26)) . #5#)
                 (GO #6#))))))
            (SEQ (LETT |sNum| 1 . #5#)
                 (LETT #3#
                       (LENGTH
                        (QCDR
                         (PROG2 (LETT #2# |n| . #5#)
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 0)
                                           (|Record|
                                            (|:| |listPT|
                                                 (|List| (QREFELT $ 6)))
                                            (|:| |listNM| (|List| (|String|))))
                                           (|Union|
                                            (|:| |pt|
                                                 (|Record|
                                                  (|:| |listPT|
                                                       (|List| (QREFELT $ 6)))
                                                  (|:| |listNM|
                                                       (|List| (|String|)))))
                                            (|:| |nd|
                                                 (|Record|
                                                  (|:| |listND|
                                                       (|List|
                                                        (|Scene|
                                                         (QREFELT $ 6))))
                                                  (|:| |listNM|
                                                       (|List| (|String|)))))
                                            (|:| |br|
                                                 (|Record|
                                                  (|:| |ch| (|List| $))
                                                  (|:| |listHNM|
                                                       (|List| (|String|))))))
                                           #2#))))
                       . #5#)
                 G190 (COND ((|greater_SI| |sNum| #3#) (GO G191)))
                 (SEQ
                  (LETT |s|
                        (SPADCALL
                         (QCDR
                          (PROG2 (LETT #2# |n| . #5#)
                              (QCDR #2#)
                            (|check_union2| (QEQCAR #2# 0)
                                            (|Record|
                                             (|:| |listPT|
                                                  (|List| (QREFELT $ 6)))
                                             (|:| |listNM|
                                                  (|List| (|String|))))
                                            (|Union|
                                             (|:| |pt|
                                                  (|Record|
                                                   (|:| |listPT|
                                                        (|List| (QREFELT $ 6)))
                                                   (|:| |listNM|
                                                        (|List| (|String|)))))
                                             (|:| |nd|
                                                  (|Record|
                                                   (|:| |listND|
                                                        (|List|
                                                         (|Scene|
                                                          (QREFELT $ 6))))
                                                   (|:| |listNM|
                                                        (|List| (|String|)))))
                                             (|:| |br|
                                                  (|Record|
                                                   (|:| |ch| (|List| $))
                                                   (|:| |listHNM|
                                                        (|List| (|String|))))))
                                            #2#)))
                         |sNum| (QREFELT $ 27))
                        . #5#)
                  (EXIT
                   (COND
                    ((EQUAL |s| |ptName|)
                     (PROGN
                      (LETT #1#
                            (SPADCALL
                             (QCAR
                              (PROG2 (LETT #2# |n| . #5#)
                                  (QCDR #2#)
                                (|check_union2| (QEQCAR #2# 0)
                                                (|Record|
                                                 (|:| |listPT|
                                                      (|List| (QREFELT $ 6)))
                                                 (|:| |listNM|
                                                      (|List| (|String|))))
                                                (|Union|
                                                 (|:| |pt|
                                                      (|Record|
                                                       (|:| |listPT|
                                                            (|List|
                                                             (QREFELT $ 6)))
                                                       (|:| |listNM|
                                                            (|List|
                                                             (|String|)))))
                                                 (|:| |nd|
                                                      (|Record|
                                                       (|:| |listND|
                                                            (|List|
                                                             (|Scene|
                                                              (QREFELT $ 6))))
                                                       (|:| |listNM|
                                                            (|List|
                                                             (|String|)))))
                                                 (|:| |br|
                                                      (|Record|
                                                       (|:| |ch| (|List| $))
                                                       (|:| |listHNM|
                                                            (|List|
                                                             (|String|))))))
                                                #2#)))
                             |sNum| (QREFELT $ 28))
                            . #5#)
                      (GO #6#))))))
                 (LETT |sNum| (|inc_SI| |sNum|) . #5#) (GO G190) G191
                 (EXIT NIL))
            (EXIT (SPADCALL 0 0 (QREFELT $ 23)))))
          #6# (EXIT #1#)))) 

(SDEFUN |SCNP;addPoints!;$S2$;9| ((|n| $) (|ptName| |String|) (|pts| $) ($ $))
        (SPROG ((#1=#:G713 NIL))
               (SEQ
                (COND
                 ((NULL (SPADCALL |n| (QREFELT $ 18)))
                  (|error| "can only add points to branch")))
                (PROGN
                 (RPLACA
                  #2=(PROG2 (LETT #1# |n| . #3=(|SCNP;addPoints!;$S2$;9|))
                         (QCDR #1#)
                       (|check_union2| (QEQCAR #1# 2)
                                       (|Record| (|:| |ch| (|List| $))
                                                 (|:| |listHNM|
                                                      (|List| (|String|))))
                                       (|Union|
                                        (|:| |pt|
                                             (|Record|
                                              (|:| |listPT|
                                                   (|List| (QREFELT $ 6)))
                                              (|:| |listNM|
                                                   (|List| (|String|)))))
                                        (|:| |nd|
                                             (|Record|
                                              (|:| |listND|
                                                   (|List|
                                                    (|Scene| (QREFELT $ 6))))
                                              (|:| |listNM|
                                                   (|List| (|String|)))))
                                        (|:| |br|
                                             (|Record| (|:| |ch| (|List| $))
                                                       (|:| |listHNM|
                                                            (|List|
                                                             (|String|))))))
                                       #1#))
                  (SPADCALL
                   (QCAR
                    (PROG2 (LETT #1# |n| . #3#)
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 2)
                                      (|Record| (|:| |ch| (|List| $))
                                                (|:| |listHNM|
                                                     (|List| (|String|))))
                                      (|Union|
                                       (|:| |pt|
                                            (|Record|
                                             (|:| |listPT|
                                                  (|List| (QREFELT $ 6)))
                                             (|:| |listNM|
                                                  (|List| (|String|)))))
                                       (|:| |nd|
                                            (|Record|
                                             (|:| |listND|
                                                  (|List|
                                                   (|Scene| (QREFELT $ 6))))
                                             (|:| |listNM|
                                                  (|List| (|String|)))))
                                       (|:| |br|
                                            (|Record| (|:| |ch| (|List| $))
                                                      (|:| |listHNM|
                                                           (|List|
                                                            (|String|))))))
                                      #1#)))
                   |pts| (QREFELT $ 29)))
                 (QCAR #2#))
                (PROGN
                 (RPLACD
                  #4=(PROG2 (LETT #1# |n| . #3#)
                         (QCDR #1#)
                       (|check_union2| (QEQCAR #1# 2)
                                       (|Record| (|:| |ch| (|List| $))
                                                 (|:| |listHNM|
                                                      (|List| (|String|))))
                                       (|Union|
                                        (|:| |pt|
                                             (|Record|
                                              (|:| |listPT|
                                                   (|List| (QREFELT $ 6)))
                                              (|:| |listNM|
                                                   (|List| (|String|)))))
                                        (|:| |nd|
                                             (|Record|
                                              (|:| |listND|
                                                   (|List|
                                                    (|Scene| (QREFELT $ 6))))
                                              (|:| |listNM|
                                                   (|List| (|String|)))))
                                        (|:| |br|
                                             (|Record| (|:| |ch| (|List| $))
                                                       (|:| |listHNM|
                                                            (|List|
                                                             (|String|))))))
                                       #1#))
                  (SPADCALL
                   (QCDR
                    (PROG2 (LETT #1# |n| . #3#)
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 2)
                                      (|Record| (|:| |ch| (|List| $))
                                                (|:| |listHNM|
                                                     (|List| (|String|))))
                                      (|Union|
                                       (|:| |pt|
                                            (|Record|
                                             (|:| |listPT|
                                                  (|List| (QREFELT $ 6)))
                                             (|:| |listNM|
                                                  (|List| (|String|)))))
                                       (|:| |nd|
                                            (|Record|
                                             (|:| |listND|
                                                  (|List|
                                                   (|Scene| (QREFELT $ 6))))
                                             (|:| |listNM|
                                                  (|List| (|String|)))))
                                       (|:| |br|
                                            (|Record| (|:| |ch| (|List| $))
                                                      (|:| |listHNM|
                                                           (|List|
                                                            (|String|))))))
                                      #1#)))
                   |ptName| (QREFELT $ 30)))
                 (QCDR #4#))
                (EXIT |pts|)))) 

(SDEFUN |SCNP;addNode!;$SS$;10|
        ((|n| $) (|ptName| |String|) (|sc| |Scene| PT) ($ $))
        (SPROG
         ((#1=#:G712 NIL) (#2=#:G781 NIL) (#3=#:G713 NIL) (|fst| ($))
          (|c| (|List| $)) (|scnd| ($)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((NULL (SPADCALL |n| (QREFELT $ 17)))
              (SEQ
               (COND
                ((SPADCALL |n| (QREFELT $ 16))
                 (|error| "cannot mix def and named points")))
               (LETT |scnd|
                     (SPADCALL (LIST |sc|) (LIST |ptName|) (QREFELT $ 12))
                     . #4=(|SCNP;addNode!;$SS$;10|))
               (LETT |c|
                     (QCAR
                      (PROG2 (LETT #3# |n| . #4#)
                          (QCDR #3#)
                        (|check_union2| (QEQCAR #3# 2)
                                        (|Record| (|:| |ch| (|List| $))
                                                  (|:| |listHNM|
                                                       (|List| (|String|))))
                                        (|Union|
                                         (|:| |pt|
                                              (|Record|
                                               (|:| |listPT|
                                                    (|List| (QREFELT $ 6)))
                                               (|:| |listNM|
                                                    (|List| (|String|)))))
                                         (|:| |nd|
                                              (|Record|
                                               (|:| |listND|
                                                    (|List|
                                                     (|Scene| (QREFELT $ 6))))
                                               (|:| |listNM|
                                                    (|List| (|String|)))))
                                         (|:| |br|
                                              (|Record| (|:| |ch| (|List| $))
                                                        (|:| |listHNM|
                                                             (|List|
                                                              (|String|))))))
                                        #3#)))
                     . #4#)
               (COND
                ((SPADCALL |c| NIL (QREFELT $ 21))
                 (SEQ
                  (PROGN
                   (RPLACA
                    #5=(PROG2 (LETT #3# |n| . #4#)
                           (QCDR #3#)
                         (|check_union2| (QEQCAR #3# 2)
                                         (|Record| (|:| |ch| (|List| $))
                                                   (|:| |listHNM|
                                                        (|List| (|String|))))
                                         (|Union|
                                          (|:| |pt|
                                               (|Record|
                                                (|:| |listPT|
                                                     (|List| (QREFELT $ 6)))
                                                (|:| |listNM|
                                                     (|List| (|String|)))))
                                          (|:| |nd|
                                               (|Record|
                                                (|:| |listND|
                                                     (|List|
                                                      (|Scene| (QREFELT $ 6))))
                                                (|:| |listNM|
                                                     (|List| (|String|)))))
                                          (|:| |br|
                                               (|Record| (|:| |ch| (|List| $))
                                                         (|:| |listHNM|
                                                              (|List|
                                                               (|String|))))))
                                         #3#))
                    (LIST |scnd|))
                   (QCAR #5#))
                  (PROGN
                   (RPLACD
                    #6=(PROG2 (LETT #3# |n| . #4#)
                           (QCDR #3#)
                         (|check_union2| (QEQCAR #3# 2)
                                         (|Record| (|:| |ch| (|List| $))
                                                   (|:| |listHNM|
                                                        (|List| (|String|))))
                                         (|Union|
                                          (|:| |pt|
                                               (|Record|
                                                (|:| |listPT|
                                                     (|List| (QREFELT $ 6)))
                                                (|:| |listNM|
                                                     (|List| (|String|)))))
                                          (|:| |nd|
                                               (|Record|
                                                (|:| |listND|
                                                     (|List|
                                                      (|Scene| (QREFELT $ 6))))
                                                (|:| |listNM|
                                                     (|List| (|String|)))))
                                          (|:| |br|
                                               (|Record| (|:| |ch| (|List| $))
                                                         (|:| |listHNM|
                                                              (|List|
                                                               (|String|))))))
                                         #3#))
                    (LIST "useNames"))
                   (QCDR #6#))
                  (EXIT (PROGN (LETT #2# |scnd| . #4#) (GO #7=#:G780))))))
               (LETT |fst| (SPADCALL |c| (QREFELT $ 24)) . #4#)
               (COND
                ((SPADCALL |fst| (QREFELT $ 17))
                 (PROGN
                  (LETT #2# (SPADCALL |fst| |ptName| |sc| (QREFELT $ 33))
                        . #4#)
                  (GO #7#))))
               (PROGN
                (RPLACA
                 #8=(PROG2 (LETT #3# |n| . #4#)
                        (QCDR #3#)
                      (|check_union2| (QEQCAR #3# 2)
                                      (|Record| (|:| |ch| (|List| $))
                                                (|:| |listHNM|
                                                     (|List| (|String|))))
                                      (|Union|
                                       (|:| |pt|
                                            (|Record|
                                             (|:| |listPT|
                                                  (|List| (QREFELT $ 6)))
                                             (|:| |listNM|
                                                  (|List| (|String|)))))
                                       (|:| |nd|
                                            (|Record|
                                             (|:| |listND|
                                                  (|List|
                                                   (|Scene| (QREFELT $ 6))))
                                             (|:| |listNM|
                                                  (|List| (|String|)))))
                                       (|:| |br|
                                            (|Record| (|:| |ch| (|List| $))
                                                      (|:| |listHNM|
                                                           (|List|
                                                            (|String|))))))
                                      #3#))
                 (SPADCALL |c| |scnd| (QREFELT $ 29)))
                (QCAR #8#))
               (PROGN
                (RPLACD
                 #9=(PROG2 (LETT #3# |n| . #4#)
                        (QCDR #3#)
                      (|check_union2| (QEQCAR #3# 2)
                                      (|Record| (|:| |ch| (|List| $))
                                                (|:| |listHNM|
                                                     (|List| (|String|))))
                                      (|Union|
                                       (|:| |pt|
                                            (|Record|
                                             (|:| |listPT|
                                                  (|List| (QREFELT $ 6)))
                                             (|:| |listNM|
                                                  (|List| (|String|)))))
                                       (|:| |nd|
                                            (|Record|
                                             (|:| |listND|
                                                  (|List|
                                                   (|Scene| (QREFELT $ 6))))
                                             (|:| |listNM|
                                                  (|List| (|String|)))))
                                       (|:| |br|
                                            (|Record| (|:| |ch| (|List| $))
                                                      (|:| |listHNM|
                                                           (|List|
                                                            (|String|))))))
                                      #3#))
                 (SPADCALL
                  (QCDR
                   (PROG2 (LETT #3# |n| . #4#)
                       (QCDR #3#)
                     (|check_union2| (QEQCAR #3# 2)
                                     (|Record| (|:| |ch| (|List| $))
                                               (|:| |listHNM|
                                                    (|List| (|String|))))
                                     (|Union|
                                      (|:| |pt|
                                           (|Record|
                                            (|:| |listPT|
                                                 (|List| (QREFELT $ 6)))
                                            (|:| |listNM|
                                                 (|List| (|String|)))))
                                      (|:| |nd|
                                           (|Record|
                                            (|:| |listND|
                                                 (|List|
                                                  (|Scene| (QREFELT $ 6))))
                                            (|:| |listNM|
                                                 (|List| (|String|)))))
                                      (|:| |br|
                                           (|Record| (|:| |ch| (|List| $))
                                                     (|:| |listHNM|
                                                          (|List|
                                                           (|String|))))))
                                     #3#)))
                  "useNames" (QREFELT $ 30)))
                (QCDR #9#))
               (EXIT (PROGN (LETT #2# |scnd| . #4#) (GO #7#))))))
            (PROGN
             (RPLACA
              #10=(PROG2 (LETT #1# |n| . #4#)
                      (QCDR #1#)
                    (|check_union2| (QEQCAR #1# 1)
                                    (|Record|
                                     (|:| |listND|
                                          (|List| (|Scene| (QREFELT $ 6))))
                                     (|:| |listNM| (|List| (|String|))))
                                    (|Union|
                                     (|:| |pt|
                                          (|Record|
                                           (|:| |listPT|
                                                (|List| (QREFELT $ 6)))
                                           (|:| |listNM| (|List| (|String|)))))
                                     (|:| |nd|
                                          (|Record|
                                           (|:| |listND|
                                                (|List|
                                                 (|Scene| (QREFELT $ 6))))
                                           (|:| |listNM| (|List| (|String|)))))
                                     (|:| |br|
                                          (|Record| (|:| |ch| (|List| $))
                                                    (|:| |listHNM|
                                                         (|List|
                                                          (|String|))))))
                                    #1#))
              (SPADCALL
               (QCAR
                (PROG2 (LETT #1# |n| . #4#)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 1)
                                  (|Record|
                                   (|:| |listND|
                                        (|List| (|Scene| (QREFELT $ 6))))
                                   (|:| |listNM| (|List| (|String|))))
                                  (|Union|
                                   (|:| |pt|
                                        (|Record|
                                         (|:| |listPT| (|List| (QREFELT $ 6)))
                                         (|:| |listNM| (|List| (|String|)))))
                                   (|:| |nd|
                                        (|Record|
                                         (|:| |listND|
                                              (|List| (|Scene| (QREFELT $ 6))))
                                         (|:| |listNM| (|List| (|String|)))))
                                   (|:| |br|
                                        (|Record| (|:| |ch| (|List| $))
                                                  (|:| |listHNM|
                                                       (|List| (|String|))))))
                                  #1#)))
               |sc| (QREFELT $ 34)))
             (QCAR #10#))
            (PROGN
             (RPLACD
              #11=(PROG2 (LETT #1# |n| . #4#)
                      (QCDR #1#)
                    (|check_union2| (QEQCAR #1# 1)
                                    (|Record|
                                     (|:| |listND|
                                          (|List| (|Scene| (QREFELT $ 6))))
                                     (|:| |listNM| (|List| (|String|))))
                                    (|Union|
                                     (|:| |pt|
                                          (|Record|
                                           (|:| |listPT|
                                                (|List| (QREFELT $ 6)))
                                           (|:| |listNM| (|List| (|String|)))))
                                     (|:| |nd|
                                          (|Record|
                                           (|:| |listND|
                                                (|List|
                                                 (|Scene| (QREFELT $ 6))))
                                           (|:| |listNM| (|List| (|String|)))))
                                     (|:| |br|
                                          (|Record| (|:| |ch| (|List| $))
                                                    (|:| |listHNM|
                                                         (|List|
                                                          (|String|))))))
                                    #1#))
              (SPADCALL
               (QCDR
                (PROG2 (LETT #1# |n| . #4#)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 1)
                                  (|Record|
                                   (|:| |listND|
                                        (|List| (|Scene| (QREFELT $ 6))))
                                   (|:| |listNM| (|List| (|String|))))
                                  (|Union|
                                   (|:| |pt|
                                        (|Record|
                                         (|:| |listPT| (|List| (QREFELT $ 6)))
                                         (|:| |listNM| (|List| (|String|)))))
                                   (|:| |nd|
                                        (|Record|
                                         (|:| |listND|
                                              (|List| (|Scene| (QREFELT $ 6))))
                                         (|:| |listNM| (|List| (|String|)))))
                                   (|:| |br|
                                        (|Record| (|:| |ch| (|List| $))
                                                  (|:| |listHNM|
                                                       (|List| (|String|))))))
                                  #1#)))
               |ptName| (QREFELT $ 30)))
             (QCDR #11#))
            (EXIT |n|)))
          #7# (EXIT #2#)))) 

(SDEFUN |SCNP;findNode;$SS;11| ((|n| $) (|ptName| |String|) ($ |Scene| PT))
        (SPROG
         ((#1=#:G788 NIL) (#2=#:G712 NIL) (#3=#:G789 NIL) (|name| NIL)
          (#4=#:G790 NIL) (|namei| NIL) (|fst| ($)) (|c| (|List| $))
          (#5=#:G713 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((NULL (SPADCALL |n| (QREFELT $ 17)))
              (SEQ
               (COND
                ((SPADCALL |n| (QREFELT $ 16))
                 (|error| "cannot mix def and named points")))
               (LETT |c|
                     (QCAR
                      (PROG2 (LETT #5# |n| . #6=(|SCNP;findNode;$SS;11|))
                          (QCDR #5#)
                        (|check_union2| (QEQCAR #5# 2)
                                        (|Record| (|:| |ch| (|List| $))
                                                  (|:| |listHNM|
                                                       (|List| (|String|))))
                                        (|Union|
                                         (|:| |pt|
                                              (|Record|
                                               (|:| |listPT|
                                                    (|List| (QREFELT $ 6)))
                                               (|:| |listNM|
                                                    (|List| (|String|)))))
                                         (|:| |nd|
                                              (|Record|
                                               (|:| |listND|
                                                    (|List|
                                                     (|Scene| (QREFELT $ 6))))
                                               (|:| |listNM|
                                                    (|List| (|String|)))))
                                         (|:| |br|
                                              (|Record| (|:| |ch| (|List| $))
                                                        (|:| |listHNM|
                                                             (|List|
                                                              (|String|))))))
                                        #5#)))
                     . #6#)
               (COND
                ((SPADCALL |c| NIL (QREFELT $ 21))
                 (|error| "findNode - cant find")))
               (LETT |fst| (SPADCALL |c| (QREFELT $ 24)) . #6#)
               (EXIT
                (COND
                 ((SPADCALL |fst| (QREFELT $ 17))
                  (PROGN
                   (LETT #1# (SPADCALL |fst| |ptName| (QREFELT $ 35)) . #6#)
                   (GO #7=#:G787))))))))
            (SEQ (LETT |namei| 1 . #6#)
                 (LETT #4#
                       (LENGTH
                        (QCDR
                         (PROG2 (LETT #2# |n| . #6#)
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 1)
                                           (|Record|
                                            (|:| |listND|
                                                 (|List|
                                                  (|Scene| (QREFELT $ 6))))
                                            (|:| |listNM| (|List| (|String|))))
                                           (|Union|
                                            (|:| |pt|
                                                 (|Record|
                                                  (|:| |listPT|
                                                       (|List| (QREFELT $ 6)))
                                                  (|:| |listNM|
                                                       (|List| (|String|)))))
                                            (|:| |nd|
                                                 (|Record|
                                                  (|:| |listND|
                                                       (|List|
                                                        (|Scene|
                                                         (QREFELT $ 6))))
                                                  (|:| |listNM|
                                                       (|List| (|String|)))))
                                            (|:| |br|
                                                 (|Record|
                                                  (|:| |ch| (|List| $))
                                                  (|:| |listHNM|
                                                       (|List| (|String|))))))
                                           #2#))))
                       . #6#)
                 (LETT |name| NIL . #6#)
                 (LETT #3#
                       (QCDR
                        (PROG2 (LETT #2# |n| . #6#)
                            (QCDR #2#)
                          (|check_union2| (QEQCAR #2# 1)
                                          (|Record|
                                           (|:| |listND|
                                                (|List|
                                                 (|Scene| (QREFELT $ 6))))
                                           (|:| |listNM| (|List| (|String|))))
                                          (|Union|
                                           (|:| |pt|
                                                (|Record|
                                                 (|:| |listPT|
                                                      (|List| (QREFELT $ 6)))
                                                 (|:| |listNM|
                                                      (|List| (|String|)))))
                                           (|:| |nd|
                                                (|Record|
                                                 (|:| |listND|
                                                      (|List|
                                                       (|Scene|
                                                        (QREFELT $ 6))))
                                                 (|:| |listNM|
                                                      (|List| (|String|)))))
                                           (|:| |br|
                                                (|Record| (|:| |ch| (|List| $))
                                                          (|:| |listHNM|
                                                               (|List|
                                                                (|String|))))))
                                          #2#)))
                       . #6#)
                 G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |name| (CAR #3#) . #6#) NIL)
                       (|greater_SI| |namei| #4#))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((EQUAL |name| |ptName|)
                     (PROGN
                      (LETT #1#
                            (SPADCALL
                             (QCAR
                              (PROG2 (LETT #2# |n| . #6#)
                                  (QCDR #2#)
                                (|check_union2| (QEQCAR #2# 1)
                                                (|Record|
                                                 (|:| |listND|
                                                      (|List|
                                                       (|Scene|
                                                        (QREFELT $ 6))))
                                                 (|:| |listNM|
                                                      (|List| (|String|))))
                                                (|Union|
                                                 (|:| |pt|
                                                      (|Record|
                                                       (|:| |listPT|
                                                            (|List|
                                                             (QREFELT $ 6)))
                                                       (|:| |listNM|
                                                            (|List|
                                                             (|String|)))))
                                                 (|:| |nd|
                                                      (|Record|
                                                       (|:| |listND|
                                                            (|List|
                                                             (|Scene|
                                                              (QREFELT $ 6))))
                                                       (|:| |listNM|
                                                            (|List|
                                                             (|String|)))))
                                                 (|:| |br|
                                                      (|Record|
                                                       (|:| |ch| (|List| $))
                                                       (|:| |listHNM|
                                                            (|List|
                                                             (|String|))))))
                                                #2#)))
                             |namei| (QREFELT $ 36))
                            . #6#)
                      (GO #7#))))))
                 (LETT #3#
                       (PROG1 (CDR #3#)
                         (LETT |namei| (|inc_SI| |namei|) . #6#))
                       . #6#)
                 (GO G190) G191 (EXIT NIL))
            (EXIT (|error| "findNode - cant find"))))
          #7# (EXIT #1#)))) 

(SDEFUN |SCNP;toString;$S;12| ((|n| $) ($ |String|))
        (SPROG
         ((|s| (|String|)) (#1=#:G810 NIL) (|l1| NIL) (#2=#:G811 NIL)
          (|ptr| NIL) (#3=#:G808 NIL) (|lst| NIL) (#4=#:G809 NIL)
          (#5=#:G805 NIL) (|lenPT| (|NonNegativeInteger|))
          (|lenNM| (|NonNegativeInteger|)) (#6=#:G806 NIL) (#7=#:G807 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |s| "" . #8=(|SCNP;toString;$S;12|))
                (COND
                 ((QEQCAR |n| 0)
                  (SEQ (LETT |s| "pt:" . #8#)
                       (LETT |lenNM| (LENGTH (QCDR (CDR |n|))) . #8#)
                       (LETT |lenPT| (LENGTH (QCAR (CDR |n|))) . #8#)
                       (COND
                        ((SPADCALL |lenNM| |lenPT| (QREFELT $ 38))
                         (PROGN
                          (LETT #5#
                                (SPADCALL
                                 (LIST "string number:" (STRINGIMAGE |lenNM|)
                                       " ~= point number:"
                                       (STRINGIMAGE |lenPT|))
                                 (QREFELT $ 39))
                                . #8#)
                          (GO #9=#:G804))))
                       (EXIT
                        (SEQ (LETT |ptr| 1 . #8#)
                             (LETT #7# (LENGTH (QCDR (CDR |n|))) . #8#)
                             (LETT |lst| NIL . #8#)
                             (LETT #6# (QCDR (CDR |n|)) . #8#) G190
                             (COND
                              ((OR (ATOM #6#)
                                   (PROGN (LETT |lst| (CAR #6#) . #8#) NIL)
                                   (|greater_SI| |ptr| #7#))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |s|
                                     (COND
                                      ((EQL |ptr| 1)
                                       (SPADCALL
                                        (LIST |s| |lst| ":"
                                              (|mathObject2String|
                                               (SPADCALL (QCAR (CDR |n|)) |ptr|
                                                         (QREFELT $ 28))))
                                        (QREFELT $ 39)))
                                      ('T
                                       (SPADCALL
                                        (LIST |s| "," |lst| ":"
                                              (|mathObject2String|
                                               (SPADCALL (QCAR (CDR |n|)) |ptr|
                                                         (QREFELT $ 28))))
                                        (QREFELT $ 39))))
                                     . #8#)))
                             (LETT #6#
                                   (PROG1 (CDR #6#)
                                     (LETT |ptr| (|inc_SI| |ptr|) . #8#))
                                   . #8#)
                             (GO G190) G191 (EXIT NIL))))))
                (COND
                 ((QEQCAR |n| 1)
                  (SEQ (LETT |s| "nd:" . #8#)
                       (LETT |lenNM| (LENGTH (QCDR (CDR |n|))) . #8#)
                       (LETT |lenPT| (LENGTH (QCAR (CDR |n|))) . #8#)
                       (COND
                        ((SPADCALL |lenNM| |lenPT| (QREFELT $ 38))
                         (PROGN
                          (LETT #5#
                                (SPADCALL
                                 (LIST "string number:" (STRINGIMAGE |lenNM|)
                                       " ~= point number:"
                                       (STRINGIMAGE |lenPT|))
                                 (QREFELT $ 39))
                                . #8#)
                          (GO #9#))))
                       (EXIT
                        (SEQ (LETT |ptr| 1 . #8#)
                             (LETT #4# (LENGTH (QCDR (CDR |n|))) . #8#)
                             (LETT |lst| NIL . #8#)
                             (LETT #3# (QCDR (CDR |n|)) . #8#) G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |lst| (CAR #3#) . #8#) NIL)
                                   (|greater_SI| |ptr| #4#))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |s|
                                     (COND
                                      ((EQL |ptr| 1)
                                       (SPADCALL (LIST |s| |lst|)
                                                 (QREFELT $ 39)))
                                      ('T
                                       (SPADCALL (LIST |s| "," |lst|)
                                                 (QREFELT $ 39))))
                                     . #8#)))
                             (LETT #3#
                                   (PROG1 (CDR #3#)
                                     (LETT |ptr| (|inc_SI| |ptr|) . #8#))
                                   . #8#)
                             (GO G190) G191 (EXIT NIL))))))
                (COND
                 ((QEQCAR |n| 2)
                  (SEQ (LETT |s| "br:" . #8#)
                       (EXIT
                        (SEQ (LETT |ptr| 1 . #8#)
                             (LETT #2# (LENGTH (QCDR (CDR |n|))) . #8#)
                             (LETT |l1| NIL . #8#)
                             (LETT #1# (QCDR (CDR |n|)) . #8#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |l1| (CAR #1#) . #8#) NIL)
                                   (|greater_SI| |ptr| #2#))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |s|
                                     (COND
                                      ((EQL |ptr| 1)
                                       (SPADCALL
                                        (LIST |s| |l1| "("
                                              (SPADCALL
                                               (SPADCALL (QCAR (CDR |n|)) |ptr|
                                                         (QREFELT $ 40))
                                               (QREFELT $ 41))
                                              ")")
                                        (QREFELT $ 39)))
                                      ('T
                                       (SPADCALL
                                        (LIST |s| "," |l1| "("
                                              (SPADCALL
                                               (SPADCALL (QCAR (CDR |n|)) |ptr|
                                                         (QREFELT $ 40))
                                               (QREFELT $ 41))
                                              ")")
                                        (QREFELT $ 39))))
                                     . #8#)))
                             (LETT #1#
                                   (PROG1 (CDR #1#)
                                     (LETT |ptr| (|inc_SI| |ptr|) . #8#))
                                   . #8#)
                             (GO G190) G191 (EXIT NIL))))))
                (EXIT |s|)))
          #9# (EXIT #5#)))) 

(PUT '|SCNP;hash;$Si;13| '|SPADreplace| '(XLAM (|s|) 0)) 

(SDEFUN |SCNP;hash;$Si;13| ((|s| $) ($ |SingleInteger|)) 0) 

(PUT '|SCNP;latex;$S;14| '|SPADreplace|
     '(XLAM (|s|) "\\mbox{\\bf Unimplemented}")) 

(SDEFUN |SCNP;latex;$S;14| ((|s| $) ($ |String|)) "\\mbox{\\bf Unimplemented}") 

(SDEFUN |SCNP;=;2$B;15| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G825 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((QEQCAR |x| 0)
                    (COND
                     ((QEQCAR |y| 0)
                      (COND
                       ((SPADCALL (QCAR (CDR |x|)) (QCAR (CDR |y|))
                                  (QREFELT $ 45))
                        (COND
                         ((SPADCALL (QCDR (CDR |x|)) (QCDR (CDR |y|))
                                    (QREFELT $ 46))
                          (PROGN
                           (LETT #1# 'T . #2=(|SCNP;=;2$B;15|))
                           (GO #3=#:G824))))))))))
                  (COND
                   ((QEQCAR |x| 1)
                    (COND
                     ((QEQCAR |y| 1)
                      (COND
                       ((SPADCALL (QCDR (CDR |x|)) (QCDR (CDR |y|))
                                  (QREFELT $ 46))
                        (PROGN (LETT #1# 'T . #2#) (GO #3#))))))))
                  (COND
                   ((QEQCAR |x| 2)
                    (COND
                     ((QEQCAR |y| 2)
                      (COND
                       ((SPADCALL (QCAR (CDR |x|)) (QCAR (CDR |y|))
                                  (QREFELT $ 21))
                        (COND
                         ((SPADCALL (QCDR (CDR |x|)) (QCDR (CDR |y|))
                                    (QREFELT $ 46))
                          (PROGN (LETT #1# 'T . #2#) (GO #3#))))))))))
                  (EXIT NIL)))
                #3# (EXIT #1#)))) 

(SDEFUN |SCNP;~=;2$B;16| ((|x| $) (|y| $) ($ |Boolean|))
        (NULL (SPADCALL |x| |y| (QREFELT $ 47)))) 

(SDEFUN |SCNP;coerce;$Of;17| ((|n| $) ($ |OutputForm|))
        (SPROG
         ((|s| (|OutputForm|)) (#1=#:G846 NIL) (|l1| NIL) (#2=#:G847 NIL)
          (|ptr| NIL) (#3=#:G844 NIL) (|lst| NIL) (#4=#:G845 NIL)
          (#5=#:G841 NIL) (|lenPT| (|NonNegativeInteger|))
          (|lenNM| (|NonNegativeInteger|)) (#6=#:G842 NIL) (#7=#:G843 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |s| "" . #8=(|SCNP;coerce;$Of;17|))
                (COND
                 ((QEQCAR |n| 0)
                  (SEQ (LETT |s| "pt:" . #8#)
                       (LETT |lenNM| (LENGTH (QCDR (CDR |n|))) . #8#)
                       (LETT |lenPT| (LENGTH (QCAR (CDR |n|))) . #8#)
                       (COND
                        ((SPADCALL |lenNM| |lenPT| (QREFELT $ 38))
                         (PROGN
                          (LETT #5#
                                (SPADCALL
                                 (LIST "string number:"
                                       (SPADCALL |lenNM| (QREFELT $ 50))
                                       " ~= point number:"
                                       (SPADCALL |lenPT| (QREFELT $ 50)))
                                 (QREFELT $ 51))
                                . #8#)
                          (GO #9=#:G840))))
                       (EXIT
                        (SEQ (LETT |ptr| 1 . #8#)
                             (LETT #7# (LENGTH (QCDR (CDR |n|))) . #8#)
                             (LETT |lst| NIL . #8#)
                             (LETT #6# (QCDR (CDR |n|)) . #8#) G190
                             (COND
                              ((OR (ATOM #6#)
                                   (PROGN (LETT |lst| (CAR #6#) . #8#) NIL)
                                   (|greater_SI| |ptr| #7#))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |s|
                                     (COND
                                      ((EQL |ptr| 1)
                                       (SPADCALL
                                        (LIST |s|
                                              (SPADCALL |lst| (QREFELT $ 52))
                                              ":"
                                              (SPADCALL
                                               (SPADCALL (QCAR (CDR |n|)) |ptr|
                                                         (QREFELT $ 28))
                                               (QREFELT $ 53)))
                                        (QREFELT $ 51)))
                                      ('T
                                       (SPADCALL
                                        (LIST |s| ","
                                              (SPADCALL |lst| (QREFELT $ 52))
                                              ":"
                                              (SPADCALL
                                               (SPADCALL (QCAR (CDR |n|)) |ptr|
                                                         (QREFELT $ 28))
                                               (QREFELT $ 53)))
                                        (QREFELT $ 51))))
                                     . #8#)))
                             (LETT #6#
                                   (PROG1 (CDR #6#)
                                     (LETT |ptr| (|inc_SI| |ptr|) . #8#))
                                   . #8#)
                             (GO G190) G191 (EXIT NIL))))))
                (COND
                 ((QEQCAR |n| 1)
                  (SEQ (LETT |s| "nd:" . #8#)
                       (LETT |lenNM| (LENGTH (QCDR (CDR |n|))) . #8#)
                       (LETT |lenPT| (LENGTH (QCAR (CDR |n|))) . #8#)
                       (COND
                        ((SPADCALL |lenNM| |lenPT| (QREFELT $ 38))
                         (PROGN
                          (LETT #5#
                                (SPADCALL
                                 (LIST "string number:"
                                       (SPADCALL |lenNM| (QREFELT $ 50))
                                       " ~= point number:"
                                       (SPADCALL |lenPT| (QREFELT $ 50)))
                                 (QREFELT $ 51))
                                . #8#)
                          (GO #9#))))
                       (EXIT
                        (SEQ (LETT |ptr| 1 . #8#)
                             (LETT #4# (LENGTH (QCDR (CDR |n|))) . #8#)
                             (LETT |lst| NIL . #8#)
                             (LETT #3# (QCDR (CDR |n|)) . #8#) G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |lst| (CAR #3#) . #8#) NIL)
                                   (|greater_SI| |ptr| #4#))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |s|
                                     (COND
                                      ((EQL |ptr| 1)
                                       (SPADCALL
                                        (LIST |s|
                                              (SPADCALL |lst| (QREFELT $ 52)))
                                        (QREFELT $ 51)))
                                      ('T
                                       (SPADCALL
                                        (LIST |s| ","
                                              (SPADCALL |lst| (QREFELT $ 52)))
                                        (QREFELT $ 51))))
                                     . #8#)))
                             (LETT #3#
                                   (PROG1 (CDR #3#)
                                     (LETT |ptr| (|inc_SI| |ptr|) . #8#))
                                   . #8#)
                             (GO G190) G191 (EXIT NIL))))))
                (COND
                 ((QEQCAR |n| 2)
                  (SEQ (LETT |s| "br:" . #8#)
                       (EXIT
                        (SEQ (LETT |ptr| 1 . #8#)
                             (LETT #2# (LENGTH (QCDR (CDR |n|))) . #8#)
                             (LETT |l1| NIL . #8#)
                             (LETT #1# (QCDR (CDR |n|)) . #8#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |l1| (CAR #1#) . #8#) NIL)
                                   (|greater_SI| |ptr| #2#))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |s|
                                     (COND
                                      ((EQL |ptr| 1)
                                       (SPADCALL
                                        (LIST |s|
                                              (SPADCALL |l1| (QREFELT $ 52))
                                              "("
                                              (SPADCALL
                                               (SPADCALL (QCAR (CDR |n|)) |ptr|
                                                         (QREFELT $ 40))
                                               (QREFELT $ 54))
                                              ")")
                                        (QREFELT $ 51)))
                                      ('T
                                       (SPADCALL
                                        (LIST |s| ","
                                              (SPADCALL |l1| (QREFELT $ 52))
                                              "("
                                              (SPADCALL
                                               (SPADCALL (QCAR (CDR |n|)) |ptr|
                                                         (QREFELT $ 40))
                                               (QREFELT $ 54))
                                              ")")
                                        (QREFELT $ 51))))
                                     . #8#)))
                             (LETT #1#
                                   (PROG1 (CDR #1#)
                                     (LETT |ptr| (|inc_SI| |ptr|) . #8#))
                                   . #8#)
                             (GO G190) G191 (EXIT NIL))))))
                (EXIT |s|)))
          #9# (EXIT #5#)))) 

(DECLAIM (NOTINLINE |SceneNamedPoints;|)) 

(DEFUN |SceneNamedPoints| (#1=#:G848)
  (SPROG NIL
         (PROG (#2=#:G849)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|SceneNamedPoints|)
                                               '|domainEqualList|)
                    . #3=(|SceneNamedPoints|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|SceneNamedPoints;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|SceneNamedPoints|)))))))))) 

(DEFUN |SceneNamedPoints;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|SceneNamedPoints|))
          (LETT |dv$| (LIST '|SceneNamedPoints| DV$1) . #1#)
          (LETT $ (GETREFV 56) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|SceneNamedPoints| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Union|
                     (|:| |pt|
                          (|Record| (|:| |listPT| (|List| |#1|))
                                    (|:| |listNM| (|List| (|String|)))))
                     (|:| |nd|
                          (|Record| (|:| |listND| (|List| (|Scene| |#1|)))
                                    (|:| |listNM| (|List| (|String|)))))
                     (|:| |br|
                          (|Record| (|:| |ch| (|List| $))
                                    (|:| |listHNM| (|List| (|String|)))))))
          $))) 

(MAKEPROP '|SceneNamedPoints| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 6)
              (|List| 25) |SCNP;namedPoints;LL$;1| (|List| 32)
              |SCNP;namedPoints;LL$;2| (|List| $) |SCNP;namedBranch;LL$;3|
              (|Boolean|) |SCNP;isPointLeaf?;$B;4| |SCNP;isNodeLeaf?;$B;5|
              |SCNP;isNodeBranch?;$B;6| |SCNP;getNames;$L;7| (|List| $$)
              (0 . =) (|Integer|) (6 . |sipnt|) (12 . |first|) (|String|)
              |SCNP;findPoint;$SPT;8| (17 . |elt|) (23 . |elt|) (29 . |concat|)
              (35 . |concat|) |SCNP;addPoints!;$S2$;9| (|Scene| 6)
              |SCNP;addNode!;$SS$;10| (41 . |concat|) |SCNP;findNode;$SS;11|
              (47 . |elt|) (|NonNegativeInteger|) (53 . ~=) (59 . |concat|)
              (64 . |elt|) |SCNP;toString;$S;12| (|SingleInteger|)
              |SCNP;hash;$Si;13| |SCNP;latex;$S;14| (70 . =) (76 . =)
              |SCNP;=;2$B;15| |SCNP;~=;2$B;16| (|OutputForm|) (82 . |coerce|)
              (87 . |hconcat|) (92 . |coerce|) (97 . |coerce|)
              |SCNP;coerce;$Of;17| (|HashState|))
           '#(~= 102 |toString| 108 |namedPoints| 113 |namedBranch| 125 |latex|
              131 |isPointLeaf?| 136 |isNodeLeaf?| 141 |isNodeBranch?| 146
              |hashUpdate!| 151 |hash| 157 |getNames| 162 |findPoint| 167
              |findNode| 173 |coerce| 179 |addPoints!| 184 |addNode!| 191 =
              198)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 49))
                        (|makeByteWordVec2| 55
                                            '(2 20 15 0 0 21 2 6 0 22 22 23 1
                                              20 2 0 24 2 9 25 0 22 27 2 8 6 0
                                              22 28 2 20 0 0 2 29 2 9 0 0 25 30
                                              2 11 0 0 32 34 2 11 32 0 22 36 2
                                              37 15 0 0 38 1 25 0 13 39 2 20 2
                                              0 22 40 2 8 15 0 0 45 2 9 15 0 0
                                              46 1 37 49 0 50 1 49 0 13 51 1 25
                                              49 0 52 1 6 49 0 53 2 0 15 0 0 48
                                              1 0 25 0 41 2 0 0 11 9 12 2 0 0 8
                                              9 10 2 0 0 13 9 14 1 0 25 0 44 1
                                              0 15 0 16 1 0 15 0 17 1 0 15 0 18
                                              2 0 55 55 0 1 1 0 42 0 43 1 0 9 0
                                              19 2 0 6 0 25 26 2 0 32 0 25 35 1
                                              0 49 0 54 3 0 0 0 25 0 31 3 0 0 0
                                              25 32 33 2 0 15 0 0 47)))))
           '|lookupComplete|)) 
