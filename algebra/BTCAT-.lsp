
(SDEFUN |BTCAT-;copy;2A;1| ((|t| A) ($ A))
        (COND ((SPADCALL |t| (QREFELT $ 9)) (SPADCALL (QREFELT $ 10)))
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |t| (QREFELT $ 11)) (QREFELT $ 12))
                (SPADCALL |t| (QREFELT $ 13))
                (SPADCALL (SPADCALL |t| (QREFELT $ 14)) (QREFELT $ 12))
                (QREFELT $ 15))))) 

(SDEFUN |BTCAT-;map;M2A;2| ((|f| |Mapping| S S) (|t| A) ($ A))
        (COND ((SPADCALL |t| (QREFELT $ 9)) (SPADCALL (QREFELT $ 10)))
              ('T
               (SPADCALL
                (SPADCALL |f| (SPADCALL |t| (QREFELT $ 11)) (QREFELT $ 18))
                (SPADCALL (SPADCALL |t| (QREFELT $ 13)) |f|)
                (SPADCALL |f| (SPADCALL |t| (QREFELT $ 14)) (QREFELT $ 18))
                (QREFELT $ 15))))) 

(SDEFUN |BTCAT-;map!;M2A;3| ((|f| |Mapping| S S) (|t| A) ($ A))
        (SEQ
         (COND ((SPADCALL |t| (QREFELT $ 9)) |t|)
               ('T
                (SEQ
                 (SPADCALL |t| '|value|
                           (SPADCALL (SPADCALL |t| '|value| (QREFELT $ 21))
                                     |f|)
                           (QREFELT $ 22))
                 (SPADCALL |f| (SPADCALL |t| (QREFELT $ 11)) (QREFELT $ 23))
                 (SPADCALL |f| (SPADCALL |t| (QREFELT $ 14)) (QREFELT $ 23))
                 (EXIT |t|)))))) 

(SDEFUN |BTCAT-;#;ANni;4| ((|t| A) ($ |NonNegativeInteger|))
        (|BTCAT-;treeCount| |t| 0 $)) 

(SDEFUN |BTCAT-;treeCount|
        ((|t| A) (|k| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SEQ
         (COND ((SPADCALL |t| (QREFELT $ 9)) |k|)
               ('T
                (SEQ (LETT |k| (+ |k| 1) . #1=(|BTCAT-;treeCount|))
                     (COND
                      ((EQL |k| 5)
                       (COND
                        ((SPADCALL |t| (QREFELT $ 27))
                         (EXIT (|error| "cyclic binary tree"))))))
                     (LETT |k|
                           (|BTCAT-;treeCount| (SPADCALL |t| (QREFELT $ 11))
                            |k| $)
                           . #1#)
                     (EXIT
                      (|BTCAT-;treeCount| (SPADCALL |t| (QREFELT $ 14)) |k|
                       $))))))) 

(SDEFUN |BTCAT-;distance1| ((|t1| A) (|t2| A) ($ . #1=(|Integer|)))
        (SPROG
         ((#2=#:G741 NIL) (#3=#:G740 #1#) (#4=#:G742 #1#) (#5=#:G748 NIL)
          (#6=#:G690 NIL) (|u| (|List| #1#)) (|n| #1#) (#7=#:G747 NIL)
          (|t| NIL) (#8=#:G746 NIL))
         (SEQ
          (COND ((SPADCALL |t1| |t2| (QREFELT $ 28)) 0)
                ((SPADCALL |t2| (QREFELT $ 9)) -1)
                (#9='T
                 (SEQ
                  (LETT |u|
                        (PROGN
                         (LETT #8# NIL . #10=(|BTCAT-;distance1|))
                         (SEQ (LETT |t| NIL . #10#)
                              (LETT #7# (SPADCALL |t2| (QREFELT $ 30)) . #10#)
                              G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |t| (CAR #7#) . #10#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((>=
                                   (LETT |n| (|BTCAT-;distance1| |t1| |t| $)
                                         . #10#)
                                   0)
                                  (LETT #8# (CONS |n| #8#) . #10#)))))
                              (LETT #7# (CDR #7#) . #10#) (GO G190) G191
                              (EXIT (NREVERSE #8#))))
                        . #10#)
                  (EXIT
                   (COND
                    ((SPADCALL (LENGTH |u|) 0 (QREFELT $ 32))
                     (+ 1
                        (PROGN
                         (LETT #2# NIL . #10#)
                         (SEQ (LETT #6# NIL . #10#) (LETT #5# |u| . #10#) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT #6# (CAR #5#) . #10#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #4# #6# . #10#)
                                 (COND (#2# (LETT #3# (MIN #3# #4#) . #10#))
                                       ('T
                                        (PROGN
                                         (LETT #3# #4# . #10#)
                                         (LETT #2# 'T . #10#)))))))
                              (LETT #5# (CDR #5#) . #10#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#2# #3#) (#9# (|IdentityError| '|min|))))))
                    (#9# -1))))))))) 

(SDEFUN |BTCAT-;distance;2AI;7| ((|t1| A) (|t2| A) ($ |Integer|))
        (SPROG ((|n| (|Integer|)))
               (SEQ
                (LETT |n| (|BTCAT-;distance1| |t1| |t2| $)
                      |BTCAT-;distance;2AI;7|)
                (EXIT
                 (COND ((>= |n| 0) |n|)
                       ('T (|BTCAT-;distance1| |t2| |t1| $))))))) 

(SDEFUN |BTCAT-;hashUpdate!;HsAHs;8|
        ((|s| |HashState|) (|t| A) ($ |HashState|))
        (SEQ
         (COND ((SPADCALL |t| (QREFELT $ 9)) |s|)
               ('T
                (SEQ
                 (LETT |s|
                       (SPADCALL |s| (SPADCALL |t| (QREFELT $ 13))
                                 (QREFELT $ 35))
                       . #1=(|BTCAT-;hashUpdate!;HsAHs;8|))
                 (LETT |s|
                       (SPADCALL |s| (SPADCALL |t| (QREFELT $ 11))
                                 (QREFELT $ 36))
                       . #1#)
                 (EXIT
                  (SPADCALL |s| (SPADCALL |t| (QREFELT $ 14))
                            (QREFELT $ 36)))))))) 

(DECLAIM (NOTINLINE |BinaryTreeCategory&;|)) 

(DEFUN |BinaryTreeCategory&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|BinaryTreeCategory&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|BinaryTreeCategory&| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 38) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|BinaryTreeCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Boolean|)
              (0 . |empty?|) (5 . |empty|) (9 . |left|) (14 . |copy|)
              (19 . |value|) (24 . |right|) (29 . |node|) |BTCAT-;copy;2A;1|
              (|Mapping| 7 7) (36 . |map|) |BTCAT-;map;M2A;2| '"value"
              (42 . |elt|) (48 . |setelt!|) (55 . |map!|) |BTCAT-;map!;M2A;3|
              (|NonNegativeInteger|) |BTCAT-;#;ANni;4| (61 . |cyclic?|)
              (66 . =) (|List| $) (72 . |children|) (|Integer|) (77 . >)
              |BTCAT-;distance;2AI;7| (|HashState|) (83 . |hashUpdate!|)
              (89 . |hashUpdate!|) |BTCAT-;hashUpdate!;HsAHs;8|)
           '#(|map!| 95 |map| 101 |hashUpdate!| 107 |distance| 113 |copy| 119
              |#| 124)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 37
                                                 '(1 6 8 0 9 0 6 0 10 1 6 0 0
                                                   11 1 6 0 0 12 1 6 7 0 13 1 6
                                                   0 0 14 3 6 0 0 7 0 15 2 6 0
                                                   17 0 18 2 6 7 0 20 21 3 6 7
                                                   0 20 7 22 2 6 0 17 0 23 1 6
                                                   8 0 27 2 6 8 0 0 28 1 6 29 0
                                                   30 2 31 8 0 0 32 2 7 34 34 0
                                                   35 2 6 34 34 0 36 2 0 0 17 0
                                                   24 2 0 0 17 0 19 2 0 34 34 0
                                                   37 2 0 31 0 0 33 1 0 0 0 16
                                                   1 0 25 0 26)))))
           '|lookupComplete|)) 
