
(SDEFUN |XPBWPOLY;outForm|
        ((|t| |Record| (|:| |k| (|PoincareBirkhoffWittLyndonBasis| |VarSet|))
          (|:| |c| R))
         ($ |OutputForm|))
        (COND
         ((SPADCALL (QCDR |t|) (|spadConstant| $ 9) (QREFELT $ 11))
          (SPADCALL (QCAR |t|) (QREFELT $ 14)))
         ((SPADCALL (QCAR |t|) (|spadConstant| $ 15) (QREFELT $ 16))
          (SPADCALL (QCDR |t|) (QREFELT $ 17)))
         ('T
          (SPADCALL (SPADCALL (QCDR |t|) (QREFELT $ 17))
                    (SPADCALL (QCAR |t|) (QREFELT $ 14)) (QREFELT $ 18))))) 

(SDEFUN |XPBWPOLY;prod1|
        ((|b| |PoincareBirkhoffWittLyndonBasis| |VarSet|) (|p| $) ($ $))
        (SPROG
         ((#1=#:G712 NIL) (#2=#:G711 ($)) (#3=#:G713 ($)) (#4=#:G717 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|XPBWPOLY;prod1|))
           (SEQ (LETT |t| NIL . #5#) (LETT #4# |p| . #5#) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (QCDR |t|)
                                   (|XPBWPOLY;prod| |b| (QCAR |t|) $)
                                   (QREFELT $ 19))
                         . #5#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 20)) . #5#))
                    ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 21))))))) 

(SDEFUN |XPBWPOLY;prod2|
        ((|p| $) (|b| |PoincareBirkhoffWittLyndonBasis| |VarSet|) ($ $))
        (SPROG
         ((#1=#:G719 NIL) (#2=#:G718 ($)) (#3=#:G720 ($)) (#4=#:G722 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|XPBWPOLY;prod2|))
           (SEQ (LETT |t| NIL . #5#) (LETT #4# |p| . #5#) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (QCDR |t|)
                                   (|XPBWPOLY;prod| (QCAR |t|) |b| $)
                                   (QREFELT $ 19))
                         . #5#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 20)) . #5#))
                    ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 21))))))) 

(SDEFUN |XPBWPOLY;prod11|
        ((|b| |PoincareBirkhoffWittLyndonBasis| |VarSet|) (|p| $)
         (|n| |NonNegativeInteger|) ($ $))
        (SPROG
         ((#1=#:G724 NIL) (#2=#:G723 ($)) (#3=#:G725 ($)) (#4=#:G728 NIL)
          (|t| NIL) (|limit| (|Integer|)))
         (SEQ
          (LETT |limit| (- |n| (SPADCALL |b| (QREFELT $ 23)))
                . #5=(|XPBWPOLY;prod11|))
          (EXIT
           (PROGN
            (LETT #1# NIL . #5#)
            (SEQ (LETT |t| NIL . #5#) (LETT #4# |p| . #5#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL (QCAR |t|) (QREFELT $ 23)) |limit|
                               (QREFELT $ 25))
                     (PROGN
                      (LETT #3#
                            (SPADCALL (QCDR |t|)
                                      (|XPBWPOLY;prod| |b| (QCAR |t|) $)
                                      (QREFELT $ 19))
                            . #5#)
                      (COND
                       (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 20)) . #5#))
                       ('T
                        (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))))
                 (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
            (COND (#1# #2#) ('T (|spadConstant| $ 21)))))))) 

(SDEFUN |XPBWPOLY;prod22|
        ((|p| $) (|b| |PoincareBirkhoffWittLyndonBasis| |VarSet|)
         (|n| |NonNegativeInteger|) ($ $))
        (SPROG
         ((#1=#:G730 NIL) (#2=#:G729 ($)) (#3=#:G731 ($)) (#4=#:G734 NIL)
          (|t| NIL) (|limit| (|Integer|)))
         (SEQ
          (LETT |limit| (- |n| (SPADCALL |b| (QREFELT $ 23)))
                . #5=(|XPBWPOLY;prod22|))
          (EXIT
           (PROGN
            (LETT #1# NIL . #5#)
            (SEQ (LETT |t| NIL . #5#) (LETT #4# |p| . #5#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL (QCAR |t|) (QREFELT $ 23)) |limit|
                               (QREFELT $ 25))
                     (PROGN
                      (LETT #3#
                            (SPADCALL (QCDR |t|)
                                      (|XPBWPOLY;prod| (QCAR |t|) |b| $)
                                      (QREFELT $ 19))
                            . #5#)
                      (COND
                       (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 20)) . #5#))
                       ('T
                        (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))))
                 (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
            (COND (#1# #2#) ('T (|spadConstant| $ 21)))))))) 

(SDEFUN |XPBWPOLY;prod|
        ((|g| |PoincareBirkhoffWittLyndonBasis| |VarSet|)
         (|d| |PoincareBirkhoffWittLyndonBasis| |VarSet|) ($ $))
        (COND
         ((SPADCALL |d| (|spadConstant| $ 15) (QREFELT $ 16))
          (SPADCALL (|spadConstant| $ 9) |g| (QREFELT $ 27)))
         ((SPADCALL |g| (|spadConstant| $ 15) (QREFELT $ 16))
          (SPADCALL (|spadConstant| $ 9) |d| (QREFELT $ 27)))
         ('T
          (|XPBWPOLY;process| (REVERSE (SPADCALL |g| (QREFELT $ 29)))
           (SPADCALL |d| (QREFELT $ 31)) (CDR (SPADCALL |d| (QREFELT $ 29)))
           $)))) 

(SDEFUN |XPBWPOLY;Dexpand|
        ((|b| |PoincareBirkhoffWittLyndonBasis| |VarSet|)
         ($ |XDistributedPolynomial| |VarSet| R))
        (SPROG
         ((#1=#:G741 NIL) (#2=#:G740 #3=(|XDistributedPolynomial| |VarSet| R))
          (#4=#:G742 #3#) (#5=#:G744 NIL) (|l| NIL))
         (SEQ
          (COND
           ((SPADCALL |b| (|spadConstant| $ 15) (QREFELT $ 16))
            (|spadConstant| $ 33))
           (#6='T
            (PROGN
             (LETT #1# NIL . #7=(|XPBWPOLY;Dexpand|))
             (SEQ (LETT |l| NIL . #7#)
                  (LETT #5# (SPADCALL |b| (QREFELT $ 29)) . #7#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |l| (CAR #5#) . #7#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4#
                           (SPADCALL (SPADCALL |l| (QREFELT $ 35))
                                     (QREFELT $ 36))
                           . #7#)
                     (COND
                      (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 37)) . #7#))
                      ('T (PROGN (LETT #2# #4# . #7#) (LETT #1# 'T . #7#)))))))
                  (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#6# (|spadConstant| $ 33))))))))) 

(SDEFUN |XPBWPOLY;Rexpand|
        ((|b| |PoincareBirkhoffWittLyndonBasis| |VarSet|)
         ($ |XRecursivePolynomial| |VarSet| R))
        (SPROG
         ((#1=#:G746 NIL) (#2=#:G745 #3=(|XRecursivePolynomial| |VarSet| R))
          (#4=#:G747 #3#) (#5=#:G749 NIL) (|l| NIL))
         (SEQ
          (COND
           ((SPADCALL |b| (|spadConstant| $ 15) (QREFELT $ 16))
            (|spadConstant| $ 39))
           (#6='T
            (PROGN
             (LETT #1# NIL . #7=(|XPBWPOLY;Rexpand|))
             (SEQ (LETT |l| NIL . #7#)
                  (LETT #5# (SPADCALL |b| (QREFELT $ 29)) . #7#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |l| (CAR #5#) . #7#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4#
                           (SPADCALL (SPADCALL |l| (QREFELT $ 35))
                                     (QREFELT $ 40))
                           . #7#)
                     (COND
                      (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 41)) . #7#))
                      ('T (PROGN (LETT #2# #4# . #7#) (LETT #1# 'T . #7#)))))))
                  (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#6# (|spadConstant| $ 39))))))))) 

(SDEFUN |XPBWPOLY;mirror1|
        ((|b| |PoincareBirkhoffWittLyndonBasis| |VarSet|) ($ $))
        (SPROG ((|lp| (|LiePolynomial| |VarSet| R)))
               (SEQ
                (COND
                 ((SPADCALL |b| (|spadConstant| $ 15) (QREFELT $ 16))
                  (|spadConstant| $ 26))
                 ('T
                  (SEQ
                   (LETT |lp|
                         (SPADCALL (SPADCALL |b| (QREFELT $ 31))
                                   (QREFELT $ 35))
                         . #1=(|XPBWPOLY;mirror1|))
                   (LETT |lp| (SPADCALL |lp| (QREFELT $ 42)) . #1#)
                   (EXIT
                    (SPADCALL
                     (|XPBWPOLY;mirror1| (SPADCALL |b| (QREFELT $ 43)) $)
                     (SPADCALL |lp| (QREFELT $ 44)) (QREFELT $ 45))))))))) 

(SDEFUN |XPBWPOLY;process|
        ((|gauche| |List| (|LyndonWord| |VarSet|)) (|x| |LyndonWord| |VarSet|)
         (|droite| |List| (|LyndonWord| |VarSet|)) ($ $))
        (SPROG
         ((|r2| ($)) (#1=#:G765 NIL) (#2=#:G764 ($)) (#3=#:G766 ($))
          (#4=#:G773 NIL) (|t| NIL) (|r1| ($)) (#5=#:G762 NIL) (#6=#:G761 ($))
          (#7=#:G763 ($)) (#8=#:G772 NIL) (#9=#:G759 NIL) (#10=#:G758 ($))
          (#11=#:G760 ($)) (#12=#:G771 NIL) (|fd| (|LyndonWord| |VarSet|))
          (|rd| (|List| (|LyndonWord| |VarSet|))) (#13=#:G755 NIL)
          (#14=#:G754 ($)) (#15=#:G756 ($)) (#16=#:G770 NIL)
          (|p| (|LiePolynomial| |VarSet| R)))
         (SEQ
          (COND
           ((NULL |gauche|)
            (SPADCALL (|spadConstant| $ 9) (CONS |x| |droite|) (QREFELT $ 27)))
           ((NULL (SPADCALL (|SPADfirst| |gauche|) |x| (QREFELT $ 46)))
            (SPADCALL (|spadConstant| $ 9)
                      (SPADCALL (REVERSE |gauche|) (CONS |x| |droite|)
                                (QREFELT $ 47))
                      (QREFELT $ 27)))
           ('T
            (SEQ
             (LETT |p| (SPADCALL (|SPADfirst| |gauche|) |x| (QREFELT $ 48))
                   . #17=(|XPBWPOLY;process|))
             (EXIT
              (COND
               ((NULL |droite|)
                (SEQ
                 (LETT |r1|
                       (PROGN
                        (LETT #13# NIL . #17#)
                        (SEQ (LETT |t| NIL . #17#)
                             (LETT #16# (SPADCALL |p| (QREFELT $ 51)) . #17#)
                             G190
                             (COND
                              ((OR (ATOM #16#)
                                   (PROGN (LETT |t| (CAR #16#) . #17#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (PROGN
                                (LETT #15#
                                      (SPADCALL (QCDR |t|)
                                                (|XPBWPOLY;process|
                                                 (CDR |gauche|) (QCAR |t|)
                                                 |droite| $)
                                                (QREFELT $ 19))
                                      . #17#)
                                (COND
                                 (#13#
                                  (LETT #14#
                                        (SPADCALL #14# #15# (QREFELT $ 20))
                                        . #17#))
                                 ('T
                                  (PROGN
                                   (LETT #14# #15# . #17#)
                                   (LETT #13# 'T . #17#)))))))
                             (LETT #16# (CDR #16#) . #17#) (GO G190) G191
                             (EXIT NIL))
                        (COND (#13# #14#) (#18='T (|spadConstant| $ 21))))
                       . #17#)
                 (LETT |r2|
                       (|XPBWPOLY;process| (CDR |gauche|) |x|
                        (SPADCALL (|SPADfirst| |gauche|) (QREFELT $ 52)) $)
                       . #17#)
                 (EXIT (SPADCALL |r1| |r2| (QREFELT $ 20)))))
               (#18#
                (SEQ (LETT |rd| (CDR |droite|) . #17#)
                     (LETT |fd| (|SPADfirst| |droite|) . #17#)
                     (LETT |r1|
                           (PROGN
                            (LETT #9# NIL . #17#)
                            (SEQ (LETT |t| NIL . #17#)
                                 (LETT #12# (SPADCALL |p| (QREFELT $ 51))
                                       . #17#)
                                 G190
                                 (COND
                                  ((OR (ATOM #12#)
                                       (PROGN
                                        (LETT |t| (CAR #12#) . #17#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #11#
                                          (SPADCALL (QCDR |t|)
                                                    (|XPBWPOLY;process|
                                                     (SPADCALL (QCAR |t|)
                                                               (QREFELT $ 52))
                                                     |fd| |rd| $)
                                                    (QREFELT $ 19))
                                          . #17#)
                                    (COND
                                     (#9#
                                      (LETT #10#
                                            (SPADCALL #10# #11# (QREFELT $ 20))
                                            . #17#))
                                     ('T
                                      (PROGN
                                       (LETT #10# #11# . #17#)
                                       (LETT #9# 'T . #17#)))))))
                                 (LETT #12# (CDR #12#) . #17#) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#9# #10#) (#18# (|spadConstant| $ 21))))
                           . #17#)
                     (LETT |r1|
                           (PROGN
                            (LETT #5# NIL . #17#)
                            (SEQ (LETT |t| NIL . #17#) (LETT #8# |r1| . #17#)
                                 G190
                                 (COND
                                  ((OR (ATOM #8#)
                                       (PROGN (LETT |t| (CAR #8#) . #17#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #7#
                                          (SPADCALL (QCDR |t|)
                                                    (|XPBWPOLY;process|
                                                     (CDR |gauche|)
                                                     (SPADCALL (QCAR |t|)
                                                               (QREFELT $ 31))
                                                     (CDR
                                                      (SPADCALL (QCAR |t|)
                                                                (QREFELT $
                                                                         29)))
                                                     $)
                                                    (QREFELT $ 19))
                                          . #17#)
                                    (COND
                                     (#5#
                                      (LETT #6#
                                            (SPADCALL #6# #7# (QREFELT $ 20))
                                            . #17#))
                                     ('T
                                      (PROGN
                                       (LETT #6# #7# . #17#)
                                       (LETT #5# 'T . #17#)))))))
                                 (LETT #8# (CDR #8#) . #17#) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#5# #6#) (#18# (|spadConstant| $ 21))))
                           . #17#)
                     (LETT |r2|
                           (|XPBWPOLY;process|
                            (LIST (|SPADfirst| |gauche|) |x|) |fd| |rd| $)
                           . #17#)
                     (LETT |r2|
                           (PROGN
                            (LETT #1# NIL . #17#)
                            (SEQ (LETT |t| NIL . #17#) (LETT #4# |r2| . #17#)
                                 G190
                                 (COND
                                  ((OR (ATOM #4#)
                                       (PROGN (LETT |t| (CAR #4#) . #17#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #3#
                                          (SPADCALL (QCDR |t|)
                                                    (|XPBWPOLY;process|
                                                     (CDR |gauche|)
                                                     (SPADCALL (QCAR |t|)
                                                               (QREFELT $ 31))
                                                     (CDR
                                                      (SPADCALL (QCAR |t|)
                                                                (QREFELT $
                                                                         29)))
                                                     $)
                                                    (QREFELT $ 19))
                                          . #17#)
                                    (COND
                                     (#1#
                                      (LETT #2#
                                            (SPADCALL #2# #3# (QREFELT $ 20))
                                            . #17#))
                                     ('T
                                      (PROGN
                                       (LETT #2# #3# . #17#)
                                       (LETT #1# 'T . #17#)))))))
                                 (LETT #4# (CDR #4#) . #17#) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#1# #2#) (#18# (|spadConstant| $ 21))))
                           . #17#)
                     (EXIT (SPADCALL |r1| |r2| (QREFELT $ 20))))))))))))) 

(SDEFUN |XPBWPOLY;One;$;11| (($ $))
        (SPADCALL (|spadConstant| $ 9) (|spadConstant| $ 15) (QREFELT $ 27))) 

(SDEFUN |XPBWPOLY;coerce;R$;12| ((|r| R) ($ $))
        (LIST (CONS (|spadConstant| $ 15) |r|))) 

(SDEFUN |XPBWPOLY;coerce;$Of;13| ((|p| $) ($ |OutputForm|))
        (SPROG ((|le| (|List| (|OutputForm|))) (#1=#:G781 NIL) (|rec| NIL))
               (SEQ
                (COND
                 ((NULL |p|) (SPADCALL (|spadConstant| $ 54) (QREFELT $ 17)))
                 ('T
                  (SEQ (LETT |le| NIL . #2=(|XPBWPOLY;coerce;$Of;13|))
                       (SEQ (LETT |rec| NIL . #2#) (LETT #1# |p| . #2#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |rec| (CAR #1#) . #2#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |le|
                                    (CONS (|XPBWPOLY;outForm| |rec| $) |le|)
                                    . #2#)))
                            (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT (SPADCALL (ELT $ 55) |le| (QREFELT $ 58))))))))) 

(SDEFUN |XPBWPOLY;coerce;VarSet$;14| ((|v| |VarSet|) ($ $))
        (SPADCALL (|spadConstant| $ 9) (SPADCALL |v| (QREFELT $ 60))
                  (QREFELT $ 27))) 

(SDEFUN |XPBWPOLY;coerce;Lp$;15| ((|p| |LiePolynomial| |VarSet| R) ($ $))
        (SPROG ((#1=#:G787 NIL) (|t| NIL) (#2=#:G786 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|XPBWPOLY;coerce;Lp$;15|))
                 (SEQ (LETT |t| NIL . #3#)
                      (LETT #1# (SPADCALL |p| (QREFELT $ 51)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (CONS (SPADCALL (QCAR |t|) (QREFELT $ 62))
                                     (QCDR |t|))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |XPBWPOLY;coerce;$Xdp;16|
        ((|p| $) ($ |XDistributedPolynomial| |VarSet| R))
        (SPROG
         ((#1=#:G789 NIL) (#2=#:G788 #3=(|XDistributedPolynomial| |VarSet| R))
          (#4=#:G790 #3#) (#5=#:G792 NIL) (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #6=(|XPBWPOLY;coerce;$Xdp;16|))
           (SEQ (LETT |t| NIL . #6#) (LETT #5# |p| . #6#) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |t| (CAR #5#) . #6#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4#
                         (SPADCALL (QCDR |t|) (|XPBWPOLY;Dexpand| (QCAR |t|) $)
                                   (QREFELT $ 63))
                         . #6#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 64)) . #6#))
                    ('T (PROGN (LETT #2# #4# . #6#) (LETT #1# 'T . #6#)))))))
                (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 65))))))) 

(SDEFUN |XPBWPOLY;coerce;$Xrp;17|
        ((|p| $) ($ |XRecursivePolynomial| |VarSet| R))
        (SPROG
         ((#1=#:G794 NIL) (#2=#:G793 #3=(|XRecursivePolynomial| |VarSet| R))
          (#4=#:G795 #3#) (#5=#:G797 NIL) (|t| NIL))
         (SEQ
          (COND
           ((SPADCALL |p| (|spadConstant| $ 21) (QREFELT $ 67))
            (|spadConstant| $ 68))
           (#6='T
            (PROGN
             (LETT #1# NIL . #7=(|XPBWPOLY;coerce;$Xrp;17|))
             (SEQ (LETT |t| NIL . #7#) (LETT #5# |p| . #7#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |t| (CAR #5#) . #7#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4#
                           (SPADCALL (QCDR |t|)
                                     (|XPBWPOLY;Rexpand| (QCAR |t|) $)
                                     (QREFELT $ 69))
                           . #7#)
                     (COND
                      (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 70)) . #7#))
                      ('T (PROGN (LETT #2# #4# . #7#) (LETT #1# 'T . #7#)))))))
                  (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#6# (|spadConstant| $ 68))))))))) 

(SDEFUN |XPBWPOLY;constant?;$B;18| ((|p| $) ($ |Boolean|))
        (COND ((NULL |p|) 'T)
              ('T
               (SPADCALL (SPADCALL |p| (QREFELT $ 72)) (|spadConstant| $ 15)
                         (QREFELT $ 16))))) 

(SDEFUN |XPBWPOLY;constant;$R;19| ((|p| $) ($ R))
        (COND
         ((OR (NULL |p|)
              (NULL
               (SPADCALL (QCAR (SPADCALL |p| '|last| (QREFELT $ 76)))
                         (|spadConstant| $ 15) (QREFELT $ 16))))
          (|spadConstant| $ 54))
         ('T (QCDR (SPADCALL |p| '|last| (QREFELT $ 76)))))) 

(SDEFUN |XPBWPOLY;quasiRegular?;$B;20| ((|p| $) ($ |Boolean|))
        (COND ((SPADCALL |p| (|spadConstant| $ 21) (QREFELT $ 67)) 'T)
              ('T
               (SPADCALL (QCAR (SPADCALL |p| '|last| (QREFELT $ 76)))
                         (|spadConstant| $ 15) (QREFELT $ 78))))) 

(SDEFUN |XPBWPOLY;quasiRegular;2$;21| ((|p| $) ($ $))
        (COND
         ((OR (SPADCALL |p| (|spadConstant| $ 21) (QREFELT $ 67))
              (NULL
               (SPADCALL (QCAR (SPADCALL |p| '|last| (QREFELT $ 76)))
                         (|spadConstant| $ 15) (QREFELT $ 16))))
          |p|)
         ('T (SPADCALL |p| (SPADCALL |p| (QREFELT $ 80)) (QREFELT $ 81))))) 

(SDEFUN |XPBWPOLY;*;3$;22| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((#1=#:G815 NIL) (#2=#:G814 ($)) (#3=#:G816 ($)) (#4=#:G819 NIL)
          (|t| NIL))
         (SEQ
          (COND
           ((SPADCALL |y| (|spadConstant| $ 21) (QREFELT $ 67))
            (|spadConstant| $ 21))
           (#5='T
            (PROGN
             (LETT #1# NIL . #6=(|XPBWPOLY;*;3$;22|))
             (SEQ (LETT |t| NIL . #6#) (LETT #4# |x| . #6#) G190
                  (COND
                   ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #6#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #3#
                           (SPADCALL (QCDR |t|)
                                     (|XPBWPOLY;prod1| (QCAR |t|) |y| $)
                                     (QREFELT $ 19))
                           . #6#)
                     (COND
                      (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 20)) . #6#))
                      ('T (PROGN (LETT #2# #3# . #6#) (LETT #1# 'T . #6#)))))))
                  (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#5# (|spadConstant| $ 21))))))))) 

(SDEFUN |XPBWPOLY;varList;$L;23| ((|p| $) ($ |List| |VarSet|))
        (SPROG
         ((|lv| #1=(|List| |VarSet|)) (#2=#:G821 NIL) (#3=#:G820 #1#)
          (#4=#:G822 #1#) (#5=#:G825 NIL) (|b| NIL))
         (SEQ
          (LETT |lv|
                (PROGN
                 (LETT #2# NIL . #6=(|XPBWPOLY;varList;$L;23|))
                 (SEQ (LETT |b| NIL . #6#) (LETT #5# |p| . #6#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |b| (CAR #5#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4# (SPADCALL (QCAR |b|) (QREFELT $ 84)) . #6#)
                         (COND
                          (#2#
                           (LETT #3# (SPADCALL #3# #4# (QREFELT $ 85)) . #6#))
                          ('T
                           (PROGN
                            (LETT #3# #4# . #6#)
                            (LETT #2# 'T . #6#)))))))
                      (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                 (COND (#2# #3#) ('T (|IdentityError| '|setUnion|))))
                . #6#)
          (EXIT (SPADCALL |lv| (QREFELT $ 86)))))) 

(SDEFUN |XPBWPOLY;degree;$Nni;24| ((|p| $) ($ |NonNegativeInteger|))
        (COND
         ((SPADCALL |p| (|spadConstant| $ 21) (QREFELT $ 67))
          (|error| "null polynomial"))
         ('T (SPADCALL (SPADCALL |p| (QREFELT $ 72)) (QREFELT $ 23))))) 

(SDEFUN |XPBWPOLY;trunc;$Nni$;25| ((|p| $) (|n| |NonNegativeInteger|) ($ $))
        (COND
         ((OR (SPADCALL |p| (|spadConstant| $ 21) (QREFELT $ 67))
              (NULL
               (SPADCALL (SPADCALL |p| (QREFELT $ 88)) |n| (QREFELT $ 89))))
          |p|)
         ('T (SPADCALL (SPADCALL |p| (QREFELT $ 90)) |n| (QREFELT $ 91))))) 

(SDEFUN |XPBWPOLY;product;2$Nni$;26|
        ((|x| $) (|y| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG
         ((#1=#:G830 NIL) (#2=#:G829 ($)) (#3=#:G831 ($)) (#4=#:G833 NIL)
          (|t| NIL))
         (SEQ
          (COND
           ((OR (SPADCALL |x| (|spadConstant| $ 21) (QREFELT $ 67))
                (SPADCALL |y| (|spadConstant| $ 21) (QREFELT $ 67)))
            (|spadConstant| $ 21))
           ('T
            (PROGN
             (LETT #1# NIL . #5=(|XPBWPOLY;product;2$Nni$;26|))
             (SEQ (LETT |t| NIL . #5#) (LETT #4# |x| . #5#) G190
                  (COND
                   ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #3#
                           (SPADCALL (QCDR |t|)
                                     (|XPBWPOLY;prod11| (QCAR |t|) |y| |n| $)
                                     (QREFELT $ 19))
                           . #5#)
                     (COND
                      (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 20)) . #5#))
                      ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                  (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) ('T (|spadConstant| $ 21))))))))) 

(SDEFUN |XPBWPOLY;exp;$Nni$;27| ((|p| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|r| ($)) (|s| ($)) (|k2| (R)) (|k1| (|Fraction| (|Integer|)))
          (#1=#:G843 NIL) (|i| NIL))
         (SEQ
          (COND
           ((SPADCALL |p| (|spadConstant| $ 21) (QREFELT $ 67))
            (|spadConstant| $ 26))
           ((NULL (SPADCALL |p| (QREFELT $ 79)))
            (|error| "a proper polynomial is required"))
           ('T
            (SEQ
             (LETT |s| (|spadConstant| $ 26) . #2=(|XPBWPOLY;exp;$Nni$;27|))
             (LETT |r| (|spadConstant| $ 26) . #2#)
             (SEQ (LETT |i| 1 . #2#) (LETT #1# |n| . #2#) G190
                  (COND ((|greater_SI| |i| #1#) (GO G191)))
                  (SEQ (LETT |k1| (SPADCALL 1 |i| (QREFELT $ 94)) . #2#)
                       (LETT |k2|
                             (SPADCALL |k1| (|spadConstant| $ 9)
                                       (QREFELT $ 95))
                             . #2#)
                       (LETT |s|
                             (SPADCALL |k2|
                                       (SPADCALL |p| |s| |n| (QREFELT $ 92))
                                       (QREFELT $ 19))
                             . #2#)
                       (EXIT
                        (LETT |r| (SPADCALL |r| |s| (QREFELT $ 20)) . #2#)))
                  (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
             (EXIT |r|))))))) 

(SDEFUN |XPBWPOLY;log;$Nni$;28| ((|p| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|r| ($)) (|s| ($)) (|k2| (R)) (|k1| (|Fraction| (|Integer|)))
          (#1=#:G849 NIL) (|i| NIL) (|p1| ($)))
         (SEQ
          (COND
           ((SPADCALL |p| (|spadConstant| $ 26) (QREFELT $ 67))
            (|spadConstant| $ 21))
           ('T
            (SEQ
             (LETT |p1| (SPADCALL (|spadConstant| $ 26) |p| (QREFELT $ 97))
                   . #2=(|XPBWPOLY;log;$Nni$;28|))
             (COND
              ((NULL (SPADCALL |p1| (QREFELT $ 79)))
               (EXIT (|error| "constant term <> 1, impossible log "))))
             (LETT |s| (SPADCALL (|spadConstant| $ 26) (QREFELT $ 98)) . #2#)
             (LETT |r| (|spadConstant| $ 21) . #2#)
             (SEQ (LETT |i| 1 . #2#) (LETT #1# |n| . #2#) G190
                  (COND ((|greater_SI| |i| #1#) (GO G191)))
                  (SEQ (LETT |k1| (SPADCALL 1 |i| (QREFELT $ 94)) . #2#)
                       (LETT |k2|
                             (SPADCALL |k1| (|spadConstant| $ 9)
                                       (QREFELT $ 95))
                             . #2#)
                       (LETT |s| (SPADCALL |p1| |s| |n| (QREFELT $ 92)) . #2#)
                       (EXIT
                        (LETT |r|
                              (SPADCALL (SPADCALL |k2| |s| (QREFELT $ 19)) |r|
                                        (QREFELT $ 20))
                              . #2#)))
                  (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
             (EXIT |r|))))))) 

(SDEFUN |XPBWPOLY;LiePolyIfCan;$U;29|
        ((|p| $) ($ |Union| (|LiePolynomial| |VarSet| R) "failed"))
        (SPROG
         ((|lt|
           (|List| (|Record| (|:| |k| (|LyndonWord| |VarSet|)) (|:| |c| R))))
          (#1=#:G866 NIL) (|t| NIL) (#2=#:G865 NIL) (#3=#:G854 NIL)
          (#4=#:G853 #5=(|Boolean|)) (#6=#:G855 #5#) (#7=#:G864 NIL))
         (SEQ
          (COND
           ((SPADCALL |p| (|spadConstant| $ 21) (QREFELT $ 67))
            (CONS 0 (|spadConstant| $ 100)))
           ((PROGN
             (LETT #3# NIL . #8=(|XPBWPOLY;LiePolyIfCan;$U;29|))
             (SEQ (LETT |t| NIL . #8#) (LETT #7# |p| . #8#) G190
                  (COND
                   ((OR (ATOM #7#) (PROGN (LETT |t| (CAR #7#) . #8#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #6# (SPADCALL (QCAR |t|) (QREFELT $ 101)) . #8#)
                     (COND (#3# (LETT #4# (COND (#4# #6#) ('T NIL)) . #8#))
                           ('T
                            (PROGN
                             (LETT #4# #6# . #8#)
                             (LETT #3# 'T . #8#)))))))
                  (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL))
             (COND (#3# #4#) (#9='T 'T)))
            (SEQ
             (LETT |lt|
                   (PROGN
                    (LETT #2# NIL . #8#)
                    (SEQ (LETT |t| NIL . #8#) (LETT #1# |p| . #8#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |t| (CAR #1#) . #8#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2#
                                 (CONS
                                  (CONS (SPADCALL (QCAR |t|) (QREFELT $ 102))
                                        (QCDR |t|))
                                  #2#)
                                 . #8#)))
                         (LETT #1# (CDR #1#) . #8#) (GO G190) G191
                         (EXIT (NREVERSE #2#))))
                   . #8#)
             (EXIT (CONS 0 |lt|))))
           (#9# (CONS 1 "failed")))))) 

(SDEFUN |XPBWPOLY;mirror;2$;30| ((|p| $) ($ $))
        (SPROG
         ((#1=#:G868 NIL) (#2=#:G867 ($)) (#3=#:G869 ($)) (#4=#:G871 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|XPBWPOLY;mirror;2$;30|))
           (SEQ (LETT |t| NIL . #5#) (LETT #4# |p| . #5#) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (QCDR |t|) (|XPBWPOLY;mirror1| (QCAR |t|) $)
                                   (QREFELT $ 19))
                         . #5#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 20)) . #5#))
                    ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 21))))))) 

(DECLAIM (NOTINLINE |XPBWPolynomial;|)) 

(DEFUN |XPBWPolynomial| (&REST #1=#:G885)
  (SPROG NIL
         (PROG (#2=#:G886)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|XPBWPolynomial|)
                                               '|domainEqualList|)
                    . #3=(|XPBWPolynomial|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |XPBWPolynomial;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|XPBWPolynomial|)))))))))) 

(DEFUN |XPBWPolynomial;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|XPBWPolynomial|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|XPBWPolynomial| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 121) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|noZeroDivisors|))
                                              (|HasCategory| |#2|
                                                             '(|CommutativeRing|))
                                              (|HasCategory| |#2|
                                                             '(|SemiRing|))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|OrderedAbelianMonoidSup|))
                                               (|HasCategory|
                                                (|PoincareBirkhoffWittLyndonBasis|
                                                 |#1|)
                                                '(|OrderedSet|)))
                                              (OR
                                               (|HasCategory| |#2|
                                                              '(|Comparable|))
                                               (AND
                                                (|HasCategory| |#2|
                                                               '(|OrderedAbelianMonoid|))
                                                (|HasCategory|
                                                 (|PoincareBirkhoffWittLyndonBasis|
                                                  |#1|)
                                                 '(|OrderedSet|)))
                                               (AND
                                                (|HasCategory| |#2|
                                                               '(|OrderedAbelianMonoidSup|))
                                                (|HasCategory|
                                                 (|PoincareBirkhoffWittLyndonBasis|
                                                  |#1|)
                                                 '(|OrderedSet|))))
                                              (OR
                                               (AND
                                                (|HasCategory| |#2|
                                                               '(|OrderedAbelianMonoid|))
                                                (|HasCategory|
                                                 (|PoincareBirkhoffWittLyndonBasis|
                                                  |#1|)
                                                 '(|OrderedSet|)))
                                               (AND
                                                (|HasCategory| |#2|
                                                               '(|OrderedAbelianMonoidSup|))
                                                (|HasCategory|
                                                 (|PoincareBirkhoffWittLyndonBasis|
                                                  |#1|)
                                                 '(|OrderedSet|))))
                                              (|HasCategory| |#2|
                                                             '(|Module|
                                                               (|Fraction|
                                                                (|Integer|))))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|XPBWPolynomial| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8
                    (|List|
                     (|Record|
                      (|:| |k| (|PoincareBirkhoffWittLyndonBasis| |#1|))
                      (|:| |c| |#2|))))
          (COND
           ((|testBitVector| |pv$| 7)
            (PROGN
             (QSETREFV $ 96
                       (CONS (|dispatchFunction| |XPBWPOLY;exp;$Nni$;27|) $))
             (QSETREFV $ 99
                       (CONS (|dispatchFunction| |XPBWPOLY;log;$Nni$;28|)
                             $)))))
          $))) 

(MAKEPROP '|XPBWPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|FreeModule| 7 13) (|local| |#1|)
              (|local| |#2|) '|Rep| (0 . |One|) (|Boolean|) (4 . =)
              (|OutputForm|) (|PoincareBirkhoffWittLyndonBasis| 6)
              (10 . |coerce|) (15 . |One|) (19 . =) (25 . |coerce|) (30 . *)
              (36 . *) (42 . +) (48 . |Zero|) (|NonNegativeInteger|)
              (52 . |length|) (|Integer|) (57 . <=)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |XPBWPOLY;One;$;11|) $))
              (63 . |monomial|) (|List| 30) (69 . |listOfTerms|)
              (|LyndonWord| 6) (74 . |first|) (|XDistributedPolynomial| 6 7)
              (79 . |One|) (|LiePolynomial| 6 7) (83 . |LiePoly|)
              (88 . |coerce|) (93 . *) (|XRecursivePolynomial| 6 7)
              (99 . |One|) (103 . |coerce|) (108 . *) (114 . |mirror|)
              (119 . |rest|) |XPBWPOLY;coerce;Lp$;15| |XPBWPOLY;*;3$;22|
              (124 . |lexico|) (130 . |append|) (136 . |construct|)
              (|Record| (|:| |k| 30) (|:| |c| 7)) (|List| 49)
              (142 . |listOfTerms|) (147 . |list|) |XPBWPOLY;coerce;R$;12|
              (152 . |Zero|) (156 . +) (|Mapping| 12 12 12) (|List| 12)
              (162 . |reduce|) |XPBWPOLY;coerce;$Of;13| (168 . |coerce|)
              |XPBWPOLY;coerce;VarSet$;14| (173 . |coerce|) (178 . *) (184 . +)
              (190 . |Zero|) |XPBWPOLY;coerce;$Xdp;16| (194 . =) (200 . |Zero|)
              (204 . *) (210 . +) |XPBWPOLY;coerce;$Xrp;17|
              (216 . |leadingSupport|) |XPBWPOLY;constant?;$B;18|
              (|Record| (|:| |k| 13) (|:| |c| 7)) '"last" (221 . |elt|)
              |XPBWPOLY;constant;$R;19| (227 . ~=)
              |XPBWPOLY;quasiRegular?;$B;20| (233 . |maxIndex|)
              (238 . |delete|) |XPBWPOLY;quasiRegular;2$;21| (|List| 6)
              (244 . |varList|) (249 . |setUnion|) (255 . |sort|)
              |XPBWPOLY;varList;$L;23| |XPBWPOLY;degree;$Nni;24| (260 . >)
              (266 . |reductum|) |XPBWPOLY;trunc;$Nni$;25|
              |XPBWPOLY;product;2$Nni$;26| (|Fraction| 24) (271 . /) (277 . *)
              (283 . |exp|) (289 . -) (295 . -) (300 . |log|) (306 . |Zero|)
              (310 . |retractable?|) (315 . |retract|) (|Union| 34 '"failed")
              |XPBWPOLY;LiePolyIfCan;$U;29| |XPBWPOLY;mirror;2$;30|
              (|Mapping| 7 13) (|Union| 13 '#1="failed") (|List| 74)
              (|List| 13) (|List| 7) (|List| $) (|FreeMonoid| 6)
              (|Mapping| 7 7) (|Record| (|:| |k| 112) (|:| |c| 7))
              (|Union| 112 '#1#) (|Union| $ '"failed") (|PositiveInteger|)
              (|String|) (|SingleInteger|) (|HashState|))
           '#(|varList| 320 |trunc| 325 |reductum| 331 |quasiRegular?| 336
              |quasiRegular| 341 |product| 346 |monomial| 353 |mirror| 359
              |log| 364 |leadingSupport| 370 |exp| 375 |degree| 381 |constant?|
              386 |constant| 391 |coerce| 396 |Zero| 426 |One| 430
              |LiePolyIfCan| 434 = 439 - 445 + 456 * 462)
           'NIL
           (CONS
            (|makeByteWordVec2| 6
                                '(0 0 0 0 2 0 2 0 0 4 0 0 0 0 0 4 0 6 0 0 6 0 0
                                  0 6 0 0 5 0 0 0 0 0 1 3 6))
            (CONS
             '#(NIL NIL NIL |FreeModuleCategory&| |Algebra&| NIL |Module&| NIL
                |Ring&| NIL NIL NIL NIL |Rng&| NIL NIL |AbelianGroup&| NIL NIL
                NIL NIL |AbelianMonoid&| |Monoid&| NIL |OrderedSet&|
                |SemiGroup&| |AbelianSemiGroup&| NIL |SetCategory&|
                |RetractableTo&| NIL |BasicType&| NIL NIL |RetractableTo&|
                |PartialOrder&|)
             (CONS
              '#((|XPolynomialsCat| 6 7) (|XFreeAlgebra| 6 7) (|XAlgebra| 7)
                 (|FreeModuleCategory| 7 (|PoincareBirkhoffWittLyndonBasis| 6))
                 (|Algebra| 7)
                 (|IndexedDirectProductCategory| 7
                                                 (|PoincareBirkhoffWittLyndonBasis|
                                                  6))
                 (|Module| 7) (|BiModule| 7 7) (|Ring|)
                 (|OrderedAbelianMonoidSup|) (|AbelianProductCategory| 7)
                 (|LeftModule| 7) (|RightModule| 7) (|Rng|) (|LeftModule| $$)
                 (|OrderedCancellationAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianMonoid|) (|CancellationAbelianMonoid|)
                 (|SemiRing|) (|OrderedAbelianSemiGroup|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|OrderedSet|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|Comparable|) (|SetCategory|)
                 (|RetractableTo| (|FreeMonoid| 6)) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 12) (|noZeroDivisors|)
                 (|RetractableTo| (|PoincareBirkhoffWittLyndonBasis| 6))
                 (|PartialOrder|))
              (|makeByteWordVec2| 105
                                  '(0 7 0 9 2 7 10 0 0 11 1 13 12 0 14 0 13 0
                                    15 2 13 10 0 0 16 1 7 12 0 17 2 12 0 0 0 18
                                    2 0 0 7 0 19 2 0 0 0 0 20 0 0 0 21 1 13 22
                                    0 23 2 24 10 0 0 25 2 0 0 7 13 27 1 13 28 0
                                    29 1 13 30 0 31 0 32 0 33 1 34 0 30 35 1 34
                                    32 0 36 2 32 0 0 0 37 0 38 0 39 1 34 38 0
                                    40 2 38 0 0 0 41 1 34 0 0 42 1 13 0 0 43 2
                                    30 10 0 0 46 2 28 0 0 0 47 2 34 0 30 30 48
                                    1 34 50 0 51 1 28 0 30 52 0 7 0 54 2 12 0 0
                                    0 55 2 57 12 56 0 58 1 13 0 6 60 1 13 0 30
                                    62 2 32 0 7 0 63 2 32 0 0 0 64 0 32 0 65 2
                                    0 10 0 0 67 0 38 0 68 2 38 0 7 0 69 2 38 0
                                    0 0 70 1 0 13 0 72 2 8 74 0 75 76 2 13 10 0
                                    0 78 1 8 24 0 80 2 8 0 0 24 81 1 13 83 0 84
                                    2 83 0 0 0 85 1 83 0 0 86 2 22 10 0 0 89 1
                                    0 0 0 90 2 93 0 24 24 94 2 7 0 93 0 95 2 0
                                    0 0 22 96 2 0 0 0 0 97 1 0 0 0 98 2 0 0 0
                                    22 99 0 34 0 100 1 13 10 0 101 1 13 30 0
                                    102 1 0 83 0 87 2 0 0 0 22 91 1 0 0 0 90 1
                                    0 10 0 79 1 0 0 0 82 3 0 0 0 0 22 92 2 0 0
                                    7 13 27 1 0 0 0 105 2 7 0 0 22 99 1 0 13 0
                                    72 2 7 0 0 22 96 1 0 22 0 88 1 0 10 0 73 1
                                    0 7 0 77 1 0 38 0 71 1 0 32 0 66 1 0 0 34
                                    44 1 0 0 6 61 1 0 0 7 53 1 0 12 0 59 0 0 0
                                    21 0 0 0 26 1 0 103 0 104 2 0 10 0 0 67 2 0
                                    0 0 0 97 1 0 0 0 98 2 0 0 0 0 20 2 0 0 7 0
                                    19 2 0 0 0 0 45)))))
           '|lookupIncomplete|)) 
