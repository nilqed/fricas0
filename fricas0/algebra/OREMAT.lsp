
(SDEFUN |OREMAT;rowEchelon;2M;1| ((|m| |Matrix| LO) ($ |Matrix| LO))
        (QCAR (SPADCALL |m| (|spadConstant| $ 8) NIL (QREFELT $ 13)))) 

(SDEFUN |OREMAT;rowEchelon;MFLR;2|
        ((|m| |Matrix| LO) (|cc| F) (|lv| |List| (|Vector| F))
         ($ |Record| (|:| |mat| (|Matrix| LO))
          (|:| |vecs| (|List| (|Vector| F)))))
        (SPROG
         ((|i| (|Integer|)) (#1=#:G753 NIL) (|w| NIL) (#2=#:G752 NIL)
          (|k1| NIL) (|r| (LO)) (|q| (LO))
          (|#G18| (|Record| (|:| |quotient| LO) (|:| |remainder| LO)))
          (|mkj| (LO)) (#3=#:G751 NIL) (|k| NIL) (|elf2| (F)) (|elf1| (F))
          (#4=#:G750 NIL) (|el2| (LO)) (|el1| (LO)) (#5=#:G749 NIL) (|v| (LO))
          (|u| (LO)) (|d| (LO)) (|c| (LO)) (|mij| (LO))
          (|#G14|
           (|Record| (|:| |generator| LO) (|:| |coef1| LO) (|:| |coef2| LO)
                     (|:| |coefu| LO) (|:| |coefv| LO)))
          (#6=#:G748 NIL) (#7=#:G747 NIL) (|mm| (|Matrix| LO))
          (|dpiv| (|Integer|)) (|pivk| (|Integer|))
          (|dp1| (|NonNegativeInteger|)) (#8=#:G746 NIL) (#9=#:G741 NIL)
          (#10=#:G745 NIL) (|j| NIL) (#11=#:G744 NIL)
          (|nr| (|NonNegativeInteger|)) (|nc| (|NonNegativeInteger|))
          (|lw| (|List| (|Vector| F))) (#12=#:G743 NIL) (|vv| NIL)
          (#13=#:G742 NIL))
         (SEQ
          (LETT |mm| (SPADCALL |m| (QREFELT $ 15))
                . #14=(|OREMAT;rowEchelon;MFLR;2|))
          (LETT |lw|
                (PROGN
                 (LETT #13# NIL . #14#)
                 (SEQ (LETT |vv| NIL . #14#) (LETT #12# |lv| . #14#) G190
                      (COND
                       ((OR (ATOM #12#)
                            (PROGN (LETT |vv| (CAR #12#) . #14#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #13# (CONS (SPADCALL |vv| (QREFELT $ 17)) #13#)
                              . #14#)))
                      (LETT #12# (CDR #12#) . #14#) (GO G190) G191
                      (EXIT (NREVERSE #13#))))
                . #14#)
          (LETT |nc| (ANCOLS |mm|) . #14#) (LETT |nr| (ANROWS |mm|) . #14#)
          (SEQ (LETT |w| NIL . #14#) (LETT #11# |lw| . #14#) G190
               (COND
                ((OR (ATOM #11#) (PROGN (LETT |w| (CAR #11#) . #14#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (QVSIZE |w|) |nc| (QREFELT $ 20))
                   (|error|
                    "rowEchelon: elements of lv must have size = ncols(m)")))))
               (LETT #11# (CDR #11#) . #14#) (GO G190) G191 (EXIT NIL))
          (LETT |i| 1 . #14#)
          (SEQ
           (EXIT
            (SEQ (LETT |j| 1 . #14#) (LETT #10# |nc| . #14#) G190
                 (COND ((|greater_SI| |j| #10#) (GO G191)))
                 (SEQ
                  (COND
                   ((SPADCALL |i| |nr| (QREFELT $ 22))
                    (PROGN (LETT #9# |$NoValue| . #14#) (GO #15=#:G738))))
                  (LETT |pivk| -1 . #14#) (LETT |dpiv| -1 . #14#)
                  (SEQ (LETT |k| |i| . #14#) (LETT #8# |nr| . #14#) G190
                       (COND ((> |k| #8#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL
                            (SPADCALL
                             (LETT |mkj| (SPADCALL |mm| |k| |j| (QREFELT $ 25))
                                   . #14#)
                             (QREFELT $ 26)))
                           (SEQ
                            (LETT |dp1| (SPADCALL |mkj| (QREFELT $ 27)) . #14#)
                            (EXIT
                             (COND
                              ((OR (EQL |dpiv| -1) (< |dp1| |dpiv|))
                               (SEQ (LETT |mij| |mkj| . #14#)
                                    (LETT |pivk| |k| . #14#)
                                    (EXIT (LETT |dpiv| |dp1| . #14#)))))))))))
                       (LETT |k| (+ |k| 1) . #14#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND ((EQL |dpiv| -1) "iterate")
                         ('T
                          (SEQ
                           (LETT |mm| (SPADCALL |mm| |i| |pivk| (QREFELT $ 28))
                                 . #14#)
                           (SEQ (LETT |w| NIL . #14#) (LETT #7# |lw| . #14#)
                                G190
                                (COND
                                 ((OR (ATOM #7#)
                                      (PROGN (LETT |w| (CAR #7#) . #14#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SPADCALL |w| |i| |pivk| (QREFELT $ 30))))
                                (LETT #7# (CDR #7#) . #14#) (GO G190) G191
                                (EXIT NIL))
                           (SEQ (LETT |k| (+ |i| 1) . #14#)
                                (LETT #6# |nr| . #14#) G190
                                (COND ((> |k| #6#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((NULL
                                     (SPADCALL
                                      (LETT |mkj|
                                            (SPADCALL |mm| |k| |j|
                                                      (QREFELT $ 25))
                                            . #14#)
                                      (QREFELT $ 26)))
                                    (SEQ
                                     (PROGN
                                      (LETT |#G14|
                                            (SPADCALL |mij| |mkj|
                                                      (QREFELT $ 32))
                                            . #14#)
                                      (LETT |mij| (QVELT |#G14| 0) . #14#)
                                      (LETT |c| (QVELT |#G14| 1) . #14#)
                                      (LETT |d| (QVELT |#G14| 2) . #14#)
                                      (LETT |u| (QVELT |#G14| 3) . #14#)
                                      (LETT |v| (QVELT |#G14| 4) . #14#)
                                      |#G14|)
                                     (SEQ (LETT |k1| (+ |j| 1) . #14#)
                                          (LETT #5# |nc| . #14#) G190
                                          (COND ((> |k1| #5#) (GO G191)))
                                          (SEQ
                                           (LETT |el1|
                                                 (QAREF2O |mm| |i| |k1| 1 1)
                                                 . #14#)
                                           (LETT |el2|
                                                 (QAREF2O |mm| |k| |k1| 1 1)
                                                 . #14#)
                                           (QSETAREF2O |mm| |i| |k1|
                                                       (SPADCALL
                                                        (SPADCALL |c| |el1|
                                                                  (QREFELT $
                                                                           33))
                                                        (SPADCALL |d| |el2|
                                                                  (QREFELT $
                                                                           33))
                                                        (QREFELT $ 34))
                                                       1 1)
                                           (EXIT
                                            (QSETAREF2O |mm| |k| |k1|
                                                        (SPADCALL
                                                         (SPADCALL |u| |el1|
                                                                   (QREFELT $
                                                                            33))
                                                         (SPADCALL |v| |el2|
                                                                   (QREFELT $
                                                                            33))
                                                         (QREFELT $ 34))
                                                        1 1)))
                                          (LETT |k1| (+ |k1| 1) . #14#)
                                          (GO G190) G191 (EXIT NIL))
                                     (SEQ (LETT |w| NIL . #14#)
                                          (LETT #4# |lw| . #14#) G190
                                          (COND
                                           ((OR (ATOM #4#)
                                                (PROGN
                                                 (LETT |w| (CAR #4#) . #14#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (LETT |elf1| (QAREF1O |w| |i| 1)
                                                 . #14#)
                                           (LETT |elf2| (QAREF1O |w| |k| 1)
                                                 . #14#)
                                           (QSETAREF1O |w| |i|
                                                       (SPADCALL
                                                        (SPADCALL |c| |cc|
                                                                  |elf1|
                                                                  (QREFELT $
                                                                           35))
                                                        (SPADCALL |d| |cc|
                                                                  |elf2|
                                                                  (QREFELT $
                                                                           35))
                                                        (QREFELT $ 36))
                                                       1)
                                           (EXIT
                                            (QSETAREF1O |w| |k|
                                                        (SPADCALL
                                                         (SPADCALL |u| |cc|
                                                                   |elf1|
                                                                   (QREFELT $
                                                                            35))
                                                         (SPADCALL |v| |cc|
                                                                   |elf2|
                                                                   (QREFELT $
                                                                            35))
                                                         (QREFELT $ 36))
                                                        1)))
                                          (LETT #4# (CDR #4#) . #14#) (GO G190)
                                          G191 (EXIT NIL))
                                     (QSETAREF2O |mm| |i| |j| |mij| 1 1)
                                     (EXIT
                                      (QSETAREF2O |mm| |k| |j|
                                                  (|spadConstant| $ 9) 1
                                                  1)))))))
                                (LETT |k| (+ |k| 1) . #14#) (GO G190) G191
                                (EXIT NIL))
                           (SEQ (LETT |k| 1 . #14#) (LETT #3# (- |i| 1) . #14#)
                                G190 (COND ((|greater_SI| |k| #3#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((SPADCALL
                                     (LETT |mkj|
                                           (SPADCALL |mm| |k| |j|
                                                     (QREFELT $ 25))
                                           . #14#)
                                     (QREFELT $ 26))
                                    "iterate")
                                   ('T
                                    (SEQ
                                     (PROGN
                                      (LETT |#G18|
                                            (SPADCALL |mkj| |mij|
                                                      (QREFELT $ 38))
                                            . #14#)
                                      (LETT |q| (QCAR |#G18|) . #14#)
                                      (LETT |r| (QCDR |#G18|) . #14#)
                                      |#G18|)
                                     (QSETAREF2O |mm| |k| |j| |r| 1 1)
                                     (SEQ (LETT |k1| (+ |j| 1) . #14#)
                                          (LETT #2# |nc| . #14#) G190
                                          (COND ((> |k1| #2#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (QSETAREF2O |mm| |k| |k1|
                                                        (SPADCALL
                                                         (QAREF2O |mm| |k| |k1|
                                                                  1 1)
                                                         (SPADCALL |q|
                                                                   (QAREF2O
                                                                    |mm| |i|
                                                                    |k1| 1 1)
                                                                   (QREFELT $
                                                                            33))
                                                         (QREFELT $ 39))
                                                        1 1)))
                                          (LETT |k1| (+ |k1| 1) . #14#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (SEQ (LETT |w| NIL . #14#)
                                           (LETT #1# |lw| . #14#) G190
                                           (COND
                                            ((OR (ATOM #1#)
                                                 (PROGN
                                                  (LETT |w| (CAR #1#) . #14#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (QSETAREF1O |w| |k|
                                                         (SPADCALL
                                                          (QAREF1O |w| |k| 1)
                                                          (SPADCALL |q| |cc|
                                                                    (QAREF1O
                                                                     |w| |i| 1)
                                                                    (QREFELT $
                                                                             35))
                                                          (QREFELT $ 40))
                                                         1)))
                                           (LETT #1# (CDR #1#) . #14#)
                                           (GO G190) G191 (EXIT NIL))))))))
                                (LETT |k| (|inc_SI| |k|) . #14#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT (LETT |i| (+ |i| 1) . #14#)))))))
                 (LETT |j| (|inc_SI| |j|) . #14#) (GO G190) G191 (EXIT NIL)))
           #15# (EXIT #9#))
          (EXIT (CONS |mm| |lw|))))) 

(SDEFUN |OREMAT;triangular_solve|
        ((|m| |Matrix| LO) (|cc| F) (|lv| |List| (|Vector| F))
         (|solf| |Mapping|
          #1=(|Record|
              (|:| |particular|
                   #2=(|List|
                       (|Record| (|:| |ratpart| F)
                                 (|:| |coeffs| #3=(|Vector| F)))))
              (|:| |basis| (|List| F)))
          LO (|List| F))
         ($ |Union|
          (|Record|
           (|:| |particular|
                (|List|
                 (|Record| (|:| |ratpart| (|Vector| F))
                           (|:| |coeffs| (|Vector| F)))))
           (|:| |basis| (|List| (|Vector| F))))
          "failed"))
        (SPROG
         ((#4=#:G846 NIL) (|ba| NIL) (#5=#:G847 NIL) (|bv| #6=(|Vector| F))
          (#7=#:G845 NIL) (|bvl| (|List| (|Vector| F))) (|cba| (|List| #6#))
          (|cb| (|List| #6#)) (|ncba| (|List| (|Vector| F)))
          (|na| (|Vector| F)) (|ncb| (|List| (|Vector| F))) (#8=#:G844 NIL)
          (|k| NIL) (|nbcv2| #6#) (#9=#:G843 NIL) (|nbcv1| #6#)
          (#10=#:G841 NIL) (|j| NIL) (#11=#:G842 NIL) (|slj| NIL)
          (|nsl2| (|List| F)) (|nbvl| (|List| (|Vector| F))) (#12=#:G840 NIL)
          (|nbcv| #6#) (#13=#:G812 NIL) (#14=#:G811 NIL)
          (|nrl1| (|NonNegativeInteger|)) (#15=#:G839 NIL) (#16=#:G838 NIL)
          (|ss| (F)) (#17=#:G837 NIL) (|slk| NIL) (#18=#:G836 NIL)
          (|noff| (|NonNegativeInteger|)) (|cm2| (|Matrix| F))
          (|cm1| (|Matrix| F)) (#19=#:G835 NIL) (|ncv| NIL) (#20=#:G834 NIL)
          (|nsl1| (|List| F)) (#21=#:G833 NIL) (|pr| NIL) (#22=#:G832 NIL)
          (|ncvl| (|List| #3#)) (#23=#:G831 NIL) (#24=#:G830 NIL)
          (|nrl| (|NonNegativeInteger|)) (|prl| #2#) (#25=#:G829 NIL)
          (|be| NIL) (|resi| #1#) (|lvi| (|List| F)) (|lvi2| (|List| F))
          (|vvi| (F)) (#26=#:G828 NIL) (#27=#:G826 NIL) (#28=#:G827 NIL)
          (|lvi1| (|List| F)) (#29=#:G825 NIL) (#30=#:G824 NIL)
          (|nbas| #31=(|NonNegativeInteger|)) (|nlvi| (|NonNegativeInteger|))
          (#32=#:G823 NIL) (#33=#:G822 NIL) (|lvi0| (|List| F))
          (#34=#:G821 NIL) (|v| NIL) (#35=#:G820 NIL) (#36=#:G813 NIL)
          (|i| NIL) (#37=#:G818 NIL) (#38=#:G819 NIL) (#39=#:G817 NIL)
          (#40=#:G816 NIL) (#41=#:G815 NIL) (#42=#:G814 NIL) (|n| #31#)
          (|nr| (|NonNegativeInteger|)) (|nc| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |nc| (ANCOLS |m|) . #43=(|OREMAT;triangular_solve|))
                (LETT |nr| (ANROWS |m|) . #43#)
                (EXIT
                 (COND ((SPADCALL |nc| |nr| (QREFELT $ 41)) (CONS 1 "failed"))
                       ('T
                        (SEQ (LETT |n| (LENGTH |lv|) . #43#)
                             (LETT |bvl| NIL . #43#)
                             (LETT |cb|
                                   (PROGN
                                    (LETT #42# NIL . #43#)
                                    (SEQ (LETT |i| 1 . #43#)
                                         (LETT #41# |n| . #43#) G190
                                         (COND
                                          ((|greater_SI| |i| #41#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #42#
                                                 (CONS
                                                  (MAKEARR1 |n|
                                                            (|spadConstant| $
                                                                            8))
                                                  #42#)
                                                 . #43#)))
                                         (LETT |i| (|inc_SI| |i|) . #43#)
                                         (GO G190) G191
                                         (EXIT (NREVERSE #42#))))
                                   . #43#)
                             (LETT |cba|
                                   (PROGN
                                    (LETT #40# NIL . #43#)
                                    (SEQ (LETT |bv| NIL . #43#)
                                         (LETT #39# |cb| . #43#) G190
                                         (COND
                                          ((OR (ATOM #39#)
                                               (PROGN
                                                (LETT |bv| (CAR #39#) . #43#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #40#
                                                 (CONS
                                                  (MAKEARR1 |nc|
                                                            (|spadConstant| $
                                                                            8))
                                                  #40#)
                                                 . #43#)))
                                         (LETT #39# (CDR #39#) . #43#)
                                         (GO G190) G191
                                         (EXIT (NREVERSE #40#))))
                                   . #43#)
                             (SEQ (LETT |bv| NIL . #43#)
                                  (LETT #38# |cb| . #43#) (LETT |i| 1 . #43#)
                                  (LETT #37# |n| . #43#) G190
                                  (COND
                                   ((OR (|greater_SI| |i| #37#) (ATOM #38#)
                                        (PROGN
                                         (LETT |bv| (CAR #38#) . #43#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SPADCALL |bv| |i| (|spadConstant| $ 23)
                                              (QREFELT $ 42))))
                                  (LETT |i|
                                        (PROG1 (|inc_SI| |i|)
                                          (LETT #38# (CDR #38#) . #43#))
                                        . #43#)
                                  (GO G190) G191 (EXIT NIL))
                             (SEQ (LETT |i| |nc| . #43#) G190
                                  (COND ((< |i| 1) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL
                                       (SPADCALL |m| |i| |i| (QREFELT $ 25))
                                       (|spadConstant| $ 9) (QREFELT $ 43))
                                      (PROGN
                                       (LETT #36# (CONS 1 "failed") . #43#)
                                       (GO #44=#:G810)))
                                     ('T
                                      (SEQ
                                       (LETT |lvi0|
                                             (PROGN
                                              (LETT #35# NIL . #43#)
                                              (SEQ (LETT |v| NIL . #43#)
                                                   (LETT #34# |lv| . #43#) G190
                                                   (COND
                                                    ((OR (ATOM #34#)
                                                         (PROGN
                                                          (LETT |v| (CAR #34#)
                                                                . #43#)
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #35#
                                                           (CONS
                                                            (SPADCALL |v| |i|
                                                                      (QREFELT
                                                                       $ 44))
                                                            #35#)
                                                           . #43#)))
                                                   (LETT #34# (CDR #34#)
                                                         . #43#)
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #35#))))
                                             . #43#)
                                       (LETT |lvi1|
                                             (PROGN
                                              (LETT #33# NIL . #43#)
                                              (SEQ (LETT |bv| NIL . #43#)
                                                   (LETT #32# |cb| . #43#) G190
                                                   (COND
                                                    ((OR (ATOM #32#)
                                                         (PROGN
                                                          (LETT |bv| (CAR #32#)
                                                                . #43#)
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #33#
                                                           (CONS
                                                            (SPADCALL |bv|
                                                                      |lvi0|
                                                                      (QREFELT
                                                                       $ 47))
                                                            #33#)
                                                           . #43#)))
                                                   (LETT #32# (CDR #32#)
                                                         . #43#)
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #33#))))
                                             . #43#)
                                       (LETT |nlvi| (LENGTH |lvi1|) . #43#)
                                       (LETT |nbas| (LENGTH |bvl|) . #43#)
                                       (LETT |lvi1|
                                             (SPADCALL |lvi1|
                                                       (PROGN
                                                        (LETT #30# NIL . #43#)
                                                        (SEQ
                                                         (LETT |bv| NIL . #43#)
                                                         (LETT #29# |bvl|
                                                               . #43#)
                                                         G190
                                                         (COND
                                                          ((OR (ATOM #29#)
                                                               (PROGN
                                                                (LETT |bv|
                                                                      (CAR
                                                                       #29#)
                                                                      . #43#)
                                                                NIL))
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (LETT #30#
                                                                 (CONS
                                                                  (|spadConstant|
                                                                   $ 8)
                                                                  #30#)
                                                                 . #43#)))
                                                         (LETT #29# (CDR #29#)
                                                               . #43#)
                                                         (GO G190) G191
                                                         (EXIT
                                                          (NREVERSE #30#))))
                                                       (QREFELT $ 48))
                                             . #43#)
                                       (LETT |lvi2| NIL . #43#)
                                       (SEQ (LETT |vvi| NIL . #43#)
                                            (LETT #28# |lvi1| . #43#)
                                            (LETT |bv| NIL . #43#)
                                            (LETT #27#
                                                  (SPADCALL |cba| |bvl|
                                                            (QREFELT $ 49))
                                                  . #43#)
                                            G190
                                            (COND
                                             ((OR (ATOM #27#)
                                                  (PROGN
                                                   (LETT |bv| (CAR #27#)
                                                         . #43#)
                                                   NIL)
                                                  (ATOM #28#)
                                                  (PROGN
                                                   (LETT |vvi| (CAR #28#)
                                                         . #43#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (SEQ (LETT |j| (+ |i| 1) . #43#)
                                                  (LETT #26# |nc| . #43#) G190
                                                  (COND
                                                   ((> |j| #26#) (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |vvi|
                                                          (SPADCALL |vvi|
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      |m| |i|
                                                                      |j|
                                                                      (QREFELT
                                                                       $ 25))
                                                                     |cc|
                                                                     (SPADCALL
                                                                      |bv| |j|
                                                                      (QREFELT
                                                                       $ 44))
                                                                     (QREFELT $
                                                                              35))
                                                                    (QREFELT $
                                                                             40))
                                                          . #43#)))
                                                  (LETT |j| (+ |j| 1) . #43#)
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (LETT |lvi2| (CONS |vvi| |lvi2|)
                                                    . #43#)))
                                            (LETT #27#
                                                  (PROG1 (CDR #27#)
                                                    (LETT #28# (CDR #28#)
                                                          . #43#))
                                                  . #43#)
                                            (GO G190) G191 (EXIT NIL))
                                       (LETT |lvi| (NREVERSE |lvi2|) . #43#)
                                       (LETT |resi|
                                             (SPADCALL
                                              (SPADCALL |m| |i| |i|
                                                        (QREFELT $ 25))
                                              |lvi| |solf|)
                                             . #43#)
                                       (LETT |nbvl| NIL . #43#)
                                       (SEQ (LETT |be| NIL . #43#)
                                            (LETT #25# (QCDR |resi|) . #43#)
                                            G190
                                            (COND
                                             ((OR (ATOM #25#)
                                                  (PROGN
                                                   (LETT |be| (CAR #25#)
                                                         . #43#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (LETT |bv|
                                                   (MAKEARR1 |nc|
                                                             (|spadConstant| $
                                                                             8))
                                                   . #43#)
                                             (SPADCALL |bv| |i| |be|
                                                       (QREFELT $ 42))
                                             (EXIT
                                              (LETT |nbvl| (CONS |bv| |nbvl|)
                                                    . #43#)))
                                            (LETT #25# (CDR #25#) . #43#)
                                            (GO G190) G191 (EXIT NIL))
                                       (LETT |prl| (QCAR |resi|) . #43#)
                                       (LETT |nrl| (LENGTH |prl|) . #43#)
                                       (LETT |ncvl|
                                             (PROGN
                                              (LETT #24# NIL . #43#)
                                              (SEQ (LETT |pr| NIL . #43#)
                                                   (LETT #23# |prl| . #43#)
                                                   G190
                                                   (COND
                                                    ((OR (ATOM #23#)
                                                         (PROGN
                                                          (LETT |pr| (CAR #23#)
                                                                . #43#)
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #24#
                                                           (CONS (QCDR |pr|)
                                                                 #24#)
                                                           . #43#)))
                                                   (LETT #23# (CDR #23#)
                                                         . #43#)
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #24#))))
                                             . #43#)
                                       (LETT |nsl1|
                                             (PROGN
                                              (LETT #22# NIL . #43#)
                                              (SEQ (LETT |pr| NIL . #43#)
                                                   (LETT #21# |prl| . #43#)
                                                   G190
                                                   (COND
                                                    ((OR (ATOM #21#)
                                                         (PROGN
                                                          (LETT |pr| (CAR #21#)
                                                                . #43#)
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #22#
                                                           (CONS (QCAR |pr|)
                                                                 #22#)
                                                           . #43#)))
                                                   (LETT #21# (CDR #21#)
                                                         . #43#)
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #22#))))
                                             . #43#)
                                       (LETT |cm1|
                                             (SPADCALL
                                              (PROGN
                                               (LETT #20# NIL . #43#)
                                               (SEQ (LETT |ncv| NIL . #43#)
                                                    (LETT #19# |ncvl| . #43#)
                                                    G190
                                                    (COND
                                                     ((OR (ATOM #19#)
                                                          (PROGN
                                                           (LETT |ncv|
                                                                 (CAR #19#)
                                                                 . #43#)
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (LETT #20#
                                                            (CONS
                                                             (SPADCALL |ncv|
                                                                       (QREFELT
                                                                        $ 50))
                                                             #20#)
                                                            . #43#)))
                                                    (LETT #19# (CDR #19#)
                                                          . #43#)
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #20#))))
                                              (QREFELT $ 53))
                                             . #43#)
                                       (LETT |cm2|
                                             (SPADCALL
                                              (SPADCALL |cm1|
                                                        (SPADCALL |nrl|
                                                                  (|spadConstant|
                                                                   $ 23)
                                                                  (QREFELT $
                                                                           55))
                                                        (QREFELT $ 56))
                                              (QREFELT $ 57))
                                             . #43#)
                                       (LETT |nsl2| NIL . #43#)
                                       (LETT |noff| (+ (+ |nlvi| |nbas|) 1)
                                             . #43#)
                                       (SEQ (LETT |j| 1 . #43#)
                                            (LETT #18# |nrl| . #43#) G190
                                            (COND
                                             ((|greater_SI| |j| #18#)
                                              (GO G191)))
                                            (SEQ
                                             (LETT |ss| (|spadConstant| $ 8)
                                                   . #43#)
                                             (SEQ (LETT |slk| NIL . #43#)
                                                  (LETT #17# |nsl1| . #43#)
                                                  (LETT |k| |noff| . #43#) G190
                                                  (COND
                                                   ((OR (ATOM #17#)
                                                        (PROGN
                                                         (LETT |slk| (CAR #17#)
                                                               . #43#)
                                                         NIL))
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |ss|
                                                          (SPADCALL |ss|
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      |cm2| |j|
                                                                      |k|
                                                                      (QREFELT
                                                                       $ 58))
                                                                     |slk|
                                                                     (QREFELT $
                                                                              59))
                                                                    (QREFELT $
                                                                             36))
                                                          . #43#)))
                                                  (LETT |k|
                                                        (PROG1 (+ |k| 1)
                                                          (LETT #17# (CDR #17#)
                                                                . #43#))
                                                        . #43#)
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (LETT |nsl2| (CONS |ss| |nsl2|)
                                                    . #43#)))
                                            (LETT |j| (|inc_SI| |j|) . #43#)
                                            (GO G190) G191 (EXIT NIL))
                                       (LETT |nrl1| 0 . #43#)
                                       (SEQ
                                        (EXIT
                                         (SEQ (LETT |slj| NIL . #43#)
                                              (LETT #16# |nsl2| . #43#)
                                              (LETT |j| |nrl| . #43#) G190
                                              (COND
                                               ((OR (< |j| 1) (ATOM #16#)
                                                    (PROGN
                                                     (LETT |slj| (CAR #16#)
                                                           . #43#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (SEQ
                                                (EXIT
                                                 (SEQ (LETT |k| 1 . #43#)
                                                      (LETT #15# |nlvi| . #43#)
                                                      G190
                                                      (COND
                                                       ((|greater_SI| |k| #15#)
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (COND
                                                         ((SPADCALL
                                                           (SPADCALL |cm2| |j|
                                                                     |k|
                                                                     (QREFELT $
                                                                              58))
                                                           (|spadConstant| $ 8)
                                                           (QREFELT $ 60))
                                                          (SEQ
                                                           (LETT |nrl1| |j|
                                                                 . #43#)
                                                           (EXIT
                                                            (PROGN
                                                             (LETT #14#
                                                                   |$NoValue|
                                                                   . #43#)
                                                             (GO
                                                              #45=#:G794))))))))
                                                      (LETT |k| (|inc_SI| |k|)
                                                            . #43#)
                                                      (GO G190) G191
                                                      (EXIT NIL)))
                                                #45# (EXIT #14#))
                                               (EXIT
                                                (COND
                                                 ((SPADCALL |nrl1| 0
                                                            (QREFELT $ 20))
                                                  (PROGN
                                                   (LETT #13# |$NoValue|
                                                         . #43#)
                                                   (GO #46=#:G798)))
                                                 ('T
                                                  (SEQ
                                                   (LETT |nbcv|
                                                         (MAKEARR1 |nbas|
                                                                   (|spadConstant|
                                                                    $ 8))
                                                         . #43#)
                                                   (SEQ (LETT |k| 1 . #43#)
                                                        (LETT #12# |nbas|
                                                              . #43#)
                                                        G190
                                                        (COND
                                                         ((|greater_SI| |k|
                                                                        #12#)
                                                          (GO G191)))
                                                        (SEQ
                                                         (EXIT
                                                          (SPADCALL |nbcv| |k|
                                                                    (SPADCALL
                                                                     |cm2| |j|
                                                                     (+ |k|
                                                                        |nlvi|)
                                                                     (QREFELT $
                                                                              58))
                                                                    (QREFELT $
                                                                             42))))
                                                        (LETT |k|
                                                              (|inc_SI| |k|)
                                                              . #43#)
                                                        (GO G190) G191
                                                        (EXIT NIL))
                                                   (LETT |bv|
                                                         (SPADCALL |nbcv| |bvl|
                                                                   (QREFELT $
                                                                            61))
                                                         . #43#)
                                                   (SPADCALL |bv| |i| |slj|
                                                             (QREFELT $ 42))
                                                   (EXIT
                                                    (LETT |nbvl|
                                                          (CONS |bv| |nbvl|)
                                                          . #43#)))))))
                                              (LETT |j|
                                                    (PROG1 (+ |j| -1)
                                                      (LETT #16# (CDR #16#)
                                                            . #43#))
                                                    . #43#)
                                              (GO G190) G191 (EXIT NIL)))
                                        #46# (EXIT #13#))
                                       (LETT |nsl2| (NREVERSE |nsl2|) . #43#)
                                       (LETT |ncb| NIL . #43#)
                                       (LETT |ncba| NIL . #43#)
                                       (SEQ (LETT |slj| NIL . #43#)
                                            (LETT #11# |nsl2| . #43#)
                                            (LETT |j| 1 . #43#)
                                            (LETT #10# |nrl1| . #43#) G190
                                            (COND
                                             ((OR (|greater_SI| |j| #10#)
                                                  (ATOM #11#)
                                                  (PROGN
                                                   (LETT |slj| (CAR #11#)
                                                         . #43#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (LETT |nbcv1|
                                                   (MAKEARR1 |nbas|
                                                             (|spadConstant| $
                                                                             8))
                                                   . #43#)
                                             (SEQ (LETT |k| 1 . #43#)
                                                  (LETT #9# |nbas| . #43#) G190
                                                  (COND
                                                   ((|greater_SI| |k| #9#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (SPADCALL |nbcv1| |k|
                                                              (SPADCALL |cm2|
                                                                        |j|
                                                                        (+ |k|
                                                                           |nlvi|)
                                                                        (QREFELT
                                                                         $ 58))
                                                              (QREFELT $ 42))))
                                                  (LETT |k| (|inc_SI| |k|)
                                                        . #43#)
                                                  (GO G190) G191 (EXIT NIL))
                                             (LETT |nbcv2|
                                                   (MAKEARR1 |nlvi|
                                                             (|spadConstant| $
                                                                             8))
                                                   . #43#)
                                             (SEQ (LETT |k| 1 . #43#)
                                                  (LETT #8# |nlvi| . #43#) G190
                                                  (COND
                                                   ((|greater_SI| |k| #8#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (SPADCALL |nbcv2| |k|
                                                              (SPADCALL |cm2|
                                                                        |j| |k|
                                                                        (QREFELT
                                                                         $ 58))
                                                              (QREFELT $ 42))))
                                                  (LETT |k| (|inc_SI| |k|)
                                                        . #43#)
                                                  (GO G190) G191 (EXIT NIL))
                                             (LETT |bv|
                                                   (SPADCALL |nbcv2| |cb|
                                                             (QREFELT $ 61))
                                                   . #43#)
                                             (LETT |ncb| (CONS |bv| |ncb|)
                                                   . #43#)
                                             (LETT |na|
                                                   (SPADCALL |nbcv2| |cba|
                                                             (QREFELT $ 61))
                                                   . #43#)
                                             (LETT |na|
                                                   (SPADCALL |nbcv1| |na| |bvl|
                                                             (QREFELT $ 62))
                                                   . #43#)
                                             (SPADCALL |na| |i| |slj|
                                                       (QREFELT $ 42))
                                             (EXIT
                                              (LETT |ncba| (CONS |na| |ncba|)
                                                    . #43#)))
                                            (LETT |j|
                                                  (PROG1 (|inc_SI| |j|)
                                                    (LETT #11# (CDR #11#)
                                                          . #43#))
                                                  . #43#)
                                            (GO G190) G191 (EXIT NIL))
                                       (LETT |cb| (NREVERSE |ncb|) . #43#)
                                       (LETT |cba| (NREVERSE |ncba|) . #43#)
                                       (EXIT (LETT |bvl| |nbvl| . #43#)))))))
                                  (LETT |i| (+ |i| -1) . #43#) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT
                              (CONS 0
                                    (CONS
                                     (PROGN
                                      (LETT #7# NIL . #43#)
                                      (SEQ (LETT |bv| NIL . #43#)
                                           (LETT #5# |cb| . #43#)
                                           (LETT |ba| NIL . #43#)
                                           (LETT #4# |cba| . #43#) G190
                                           (COND
                                            ((OR (ATOM #4#)
                                                 (PROGN
                                                  (LETT |ba| (CAR #4#) . #43#)
                                                  NIL)
                                                 (ATOM #5#)
                                                 (PROGN
                                                  (LETT |bv| (CAR #5#) . #43#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #7#
                                                   (CONS (CONS |ba| |bv|) #7#)
                                                   . #43#)))
                                           (LETT #4#
                                                 (PROG1 (CDR #4#)
                                                   (LETT #5# (CDR #5#) . #43#))
                                                 . #43#)
                                           (GO G190) G191
                                           (EXIT (NREVERSE #7#))))
                                     |bvl|)))))))))
          #44# (EXIT #36#)))) 

(SDEFUN |OREMAT;solve;MFLMU;4|
        ((|m| |Matrix| LO) (|cc| F) (|lv| |List| (|Vector| F))
         (|solf| |Mapping|
          (|Record|
           (|:| |particular|
                (|List|
                 (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
           (|:| |basis| (|List| F)))
          LO (|List| F))
         ($ |Union|
          (|Record|
           (|:| |particular|
                (|List|
                 (|Record| (|:| |ratpart| (|Vector| F))
                           (|:| |coeffs| (|Vector| F)))))
           (|:| |basis| (|List| (|Vector| F))))
          "failed"))
        (SPROG
         ((|rec|
           (|Record| (|:| |mat| (|Matrix| LO))
                     (|:| |vecs| (|List| (|Vector| F))))))
         (SEQ
          (LETT |rec| (SPADCALL |m| |cc| |lv| (QREFELT $ 13))
                |OREMAT;solve;MFLMU;4|)
          (EXIT
           (|OREMAT;triangular_solve| (QCAR |rec|) |cc| (QCDR |rec|) |solf|
            $))))) 

(DECLAIM (NOTINLINE |OrePolynomialMatrixOperations;|)) 

(DEFUN |OrePolynomialMatrixOperations| (&REST #1=#:G862)
  (SPROG NIL
         (PROG (#2=#:G863)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|OrePolynomialMatrixOperations|)
                                               '|domainEqualList|)
                    . #3=(|OrePolynomialMatrixOperations|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |OrePolynomialMatrixOperations;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|OrePolynomialMatrixOperations|)))))))))) 

(DEFUN |OrePolynomialMatrixOperations;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|OrePolynomialMatrixOperations|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|OrePolynomialMatrixOperations| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 70) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|OrePolynomialMatrixOperations|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|OrePolynomialMatrixOperations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |Zero|) (4 . |Zero|)
              (|Record| (|:| |mat| 11) (|:| |vecs| 12)) (|Matrix| 7)
              (|List| 16) |OREMAT;rowEchelon;MFLR;2| |OREMAT;rowEchelon;2M;1|
              (8 . |copy|) (|Vector| 6) (13 . |copy|) (|Boolean|)
              (|NonNegativeInteger|) (18 . ~=) (|Integer|) (24 . >)
              (30 . |One|) (34 . |One|) (38 . |elt|) (45 . |zero?|)
              (50 . |degree|) (55 . |swapRows!|) (|Void|) (62 . |swap!|)
              (|Record| (|:| |generator| $) (|:| |coef1| $) (|:| |coef2| $)
                        (|:| |coefu| $) (|:| |coefv| $))
              (69 . |right_ext_ext_GCD|) (75 . *) (81 . +) (87 . |apply|)
              (94 . +) (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (100 . |rightDivide|) (106 . -) (112 . -) (118 . >)
              (124 . |setelt!|) (131 . =) (137 . |elt|) (|List| 6)
              (|LinearCombinationUtilities| 6 (|SparseUnivariatePolynomial| 6))
              (143 . |lin_comb|) (149 . |concat|) (155 . |concat|)
              (161 . |parts|) (|List| 45) (|Matrix| 6) (166 . |matrix|)
              (171 . |scalarMatrix|) (177 . |scalarMatrix|)
              (183 . |horizConcat|) (189 . |rowEchelon|) (194 . |elt|)
              (201 . *) (207 . ~=) (213 . |lin_comb|) (219 . |lin_comb!|)
              (|Record| (|:| |ratpart| 16) (|:| |coeffs| 16))
              (|Record| (|:| |particular| (|List| 63)) (|:| |basis| 12))
              (|Union| 64 '"failed")
              (|Record| (|:| |ratpart| 6) (|:| |coeffs| 16))
              (|Record| (|:| |particular| (|List| 66)) (|:| |basis| 45))
              (|Mapping| 67 7 45) |OREMAT;solve;MFLMU;4|)
           '#(|solve| 226 |rowEchelon| 234) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 69
                                                 '(0 6 0 8 0 7 0 9 1 11 0 0 15
                                                   1 16 0 0 17 2 19 18 0 0 20 2
                                                   21 18 0 0 22 0 6 0 23 0 7 0
                                                   24 3 11 7 0 21 21 25 1 7 18
                                                   0 26 1 7 19 0 27 3 11 0 0 21
                                                   21 28 3 16 29 0 21 21 30 2 7
                                                   31 0 0 32 2 7 0 0 0 33 2 7 0
                                                   0 0 34 3 7 6 0 6 6 35 2 6 0
                                                   0 0 36 2 7 37 0 0 38 2 7 0 0
                                                   0 39 2 6 0 0 0 40 2 19 18 0
                                                   0 41 3 16 6 0 21 6 42 2 7 18
                                                   0 0 43 2 16 6 0 21 44 2 46 6
                                                   16 45 47 2 45 0 0 0 48 2 12
                                                   0 0 0 49 1 16 45 0 50 1 52 0
                                                   51 53 2 11 0 19 7 54 2 52 0
                                                   19 6 55 2 52 0 0 0 56 1 52 0
                                                   0 57 3 52 6 0 21 21 58 2 6 0
                                                   0 0 59 2 6 18 0 0 60 2 46 16
                                                   16 12 61 3 46 16 16 16 12 62
                                                   4 0 65 11 6 12 68 69 1 0 11
                                                   11 14 3 0 10 11 6 12 13)))))
           '|lookupComplete|)) 
