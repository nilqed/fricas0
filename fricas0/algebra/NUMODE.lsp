
(SDEFUN |NUMODE;rk4a;VI4FIMV;1|
        ((|ystart| |Vector| (|Float|)) (|nvar| . #1=(|Integer|))
         (|x1| . #2=(|Float|)) (|x2| |Float|) (|eps| |Float|) (|htry| |Float|)
         (|nstep| |Integer|)
         (|derivs| |Mapping| (|Void|) (|Vector| (|Float|)) (|Vector| (|Float|))
          (|Float|))
         ($ |Void|))
        (SPROG
         ((#3=#:G755 NIL) (|i| NIL) (#4=#:G751 NIL) (|x| #2#) (#5=#:G754 NIL)
          (#6=#:G753 NIL) (|iter| NIL) (#7=#:G752 NIL)
          (|outlist| (|List| (|OutputForm|))) (|m| #1#) (|tiny| (|Float|))
          (|step|
           (|Record| (|:| |to_try| (|Float|)) (|:| |did| (|Float|))
                     (|:| |next| (|Float|))))
          (|t6| #8=(|Vector| (|Float|))) (#9=#:G714 NIL) (|t5| #8#)
          (#10=#:G712 NIL) (|t4| #8#) (#11=#:G710 NIL) (|t3| #8#)
          (#12=#:G708 NIL) (|t2| #8#) (#13=#:G706 NIL) (|t1| #8#)
          (#14=#:G704 NIL) (|dydx| #8#) (#15=#:G702 NIL) (|yscal| #8#)
          (#16=#:G700 NIL) (|y| #8#) (#17=#:G698 NIL))
         (SEQ
          (LETT |y|
                (MAKEARR1
                 (PROG1 (LETT #17# |nvar| . #18=(|NUMODE;rk4a;VI4FIMV;1|))
                   (|check_subtype2| (>= #17# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #17#))
                 (SPADCALL 0 0 10 (QREFELT $ 10)))
                . #18#)
          (LETT |yscal|
                (MAKEARR1
                 (PROG1 (LETT #16# |nvar| . #18#)
                   (|check_subtype2| (>= #16# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #16#))
                 (SPADCALL 1 0 10 (QREFELT $ 10)))
                . #18#)
          (LETT |dydx|
                (MAKEARR1
                 (PROG1 (LETT #15# |nvar| . #18#)
                   (|check_subtype2| (>= #15# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #15#))
                 (SPADCALL 0 0 10 (QREFELT $ 10)))
                . #18#)
          (LETT |t1|
                (MAKEARR1
                 (PROG1 (LETT #14# |nvar| . #18#)
                   (|check_subtype2| (>= #14# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #14#))
                 (SPADCALL 0 0 10 (QREFELT $ 10)))
                . #18#)
          (LETT |t2|
                (MAKEARR1
                 (PROG1 (LETT #13# |nvar| . #18#)
                   (|check_subtype2| (>= #13# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #13#))
                 (SPADCALL 0 0 10 (QREFELT $ 10)))
                . #18#)
          (LETT |t3|
                (MAKEARR1
                 (PROG1 (LETT #12# |nvar| . #18#)
                   (|check_subtype2| (>= #12# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #12#))
                 (SPADCALL 0 0 10 (QREFELT $ 10)))
                . #18#)
          (LETT |t4|
                (MAKEARR1
                 (PROG1 (LETT #11# |nvar| . #18#)
                   (|check_subtype2| (>= #11# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #11#))
                 (SPADCALL 0 0 10 (QREFELT $ 10)))
                . #18#)
          (LETT |t5|
                (MAKEARR1
                 (PROG1 (LETT #10# |nvar| . #18#)
                   (|check_subtype2| (>= #10# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #10#))
                 (SPADCALL 0 0 10 (QREFELT $ 10)))
                . #18#)
          (LETT |t6|
                (MAKEARR1
                 (PROG1 (LETT #9# |nvar| . #18#)
                   (|check_subtype2| (>= #9# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #9#))
                 (SPADCALL 0 0 10 (QREFELT $ 10)))
                . #18#)
          (LETT |step|
                (VECTOR |htry| (SPADCALL 0 0 10 (QREFELT $ 10))
                        (SPADCALL 0 0 10 (QREFELT $ 10)))
                . #18#)
          (LETT |x| |x1| . #18#)
          (LETT |tiny|
                (SPADCALL (SPADCALL 10 0 10 (QREFELT $ 10))
                          (- (+ (SPADCALL (QREFELT $ 12)) 1)) (QREFELT $ 13))
                . #18#)
          (LETT |m| |nvar| . #18#)
          (LETT |outlist|
                (LIST (SPADCALL |x| (QREFELT $ 15))
                      (SPADCALL |x| (QREFELT $ 15))
                      (SPADCALL |x| (QREFELT $ 15)))
                . #18#)
          (LETT |eps|
                (SPADCALL (SPADCALL 1 0 10 (QREFELT $ 10)) |eps|
                          (QREFELT $ 16))
                . #18#)
          (SEQ (LETT |i| 1 . #18#) (LETT #7# |m| . #18#) G190
               (COND ((|greater_SI| |i| #7#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |y| |i| (SPADCALL |ystart| |i| (QREFELT $ 18))
                           (QREFELT $ 19))))
               (LETT |i| (|inc_SI| |i|) . #18#) (GO G190) G191 (EXIT NIL))
          (SEQ
           (EXIT
            (SEQ (LETT |iter| 1 . #18#) (LETT #6# |nstep| . #18#) G190
                 (COND ((|greater_SI| |iter| #6#) (GO G191)))
                 (SEQ (SPADCALL |dydx| |y| |x| |derivs|)
                      (COND
                       ((SPADCALL
                         (SPADCALL
                          (SPADCALL |x| (QVELT |step| 0) (QREFELT $ 20)) |x2|
                          (QREFELT $ 21))
                         (SPADCALL 0 0 10 (QREFELT $ 10)) (QREFELT $ 23))
                        (QSETVELT |step| 0
                                  (SPADCALL |x2| |x| (QREFELT $ 21)))))
                      (SEQ (LETT |i| 1 . #18#) (LETT #5# |m| . #18#) G190
                           (COND ((|greater_SI| |i| #5#) (GO G191)))
                           (SEQ
                            (EXIT
                             (SPADCALL |yscal| |i|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |y| |i| (QREFELT $ 18))
                                          (QREFELT $ 24))
                                         (SPADCALL
                                          (SPADCALL (QVELT |step| 0)
                                                    (SPADCALL |dydx| |i|
                                                              (QREFELT $ 18))
                                                    (QREFELT $ 25))
                                          (QREFELT $ 24))
                                         (QREFELT $ 20))
                                        |tiny| (QREFELT $ 20))
                                       (QREFELT $ 19))))
                           (LETT |i| (|inc_SI| |i|) . #18#) (GO G190) G191
                           (EXIT NIL))
                      (|NUMODE;rk4qclocal| |y| |dydx| |nvar| |x| |step| |eps|
                       |yscal| |derivs| |t1| |t2| |t3| |t4| |t5| |t6| $)
                      (LETT |x| (SPADCALL |x| (QVELT |step| 1) (QREFELT $ 20))
                            . #18#)
                      (COND
                       ((SPADCALL (SPADCALL |x| |x2| (QREFELT $ 21))
                                  (SPADCALL 0 0 10 (QREFELT $ 10))
                                  (QREFELT $ 26))
                        (PROGN (LETT #4# |$NoValue| . #18#) (GO #19=#:G732))))
                      (EXIT (QSETVELT |step| 0 (QVELT |step| 2))))
                 (LETT |iter| (|inc_SI| |iter|) . #18#) (GO G190) G191
                 (EXIT NIL)))
           #19# (EXIT #4#))
          (COND
           ((EQL |iter| (+ |nstep| 1))
            (SEQ (SPADCALL "ode: ERROR " (QREFELT $ 30))
                 (SPADCALL |outlist| 1 (SPADCALL |nstep| (QREFELT $ 31))
                           (QREFELT $ 33))
                 (SPADCALL |outlist| 2 " steps to small, last h = "
                           (QREFELT $ 33))
                 (SPADCALL |outlist| 3
                           (SPADCALL (QVELT |step| 1) (QREFELT $ 15))
                           (QREFELT $ 33))
                 (SPADCALL (SPADCALL |outlist| (QREFELT $ 35)) (QREFELT $ 36))
                 (EXIT
                  (SPADCALL " y= " (SPADCALL |y| (QREFELT $ 37))
                            (QREFELT $ 38))))))
          (EXIT
           (SEQ (LETT |i| 1 . #18#) (LETT #3# |m| . #18#) G190
                (COND ((|greater_SI| |i| #3#) (GO G191)))
                (SEQ
                 (EXIT
                  (SPADCALL |ystart| |i| (SPADCALL |y| |i| (QREFELT $ 18))
                            (QREFELT $ 19))))
                (LETT |i| (|inc_SI| |i|) . #18#) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |NUMODE;rk4qc;VIFRFVMV;2|
        ((|y| |Vector| (|Float|)) (|n| |Integer|) (|x| |Float|)
         (|step| |Record| (|:| |to_try| (|Float|)) (|:| |did| (|Float|))
          (|:| |next| (|Float|)))
         (|eps| |Float|) (|yscal| |Vector| (|Float|))
         (|derivs| |Mapping| (|Void|) (|Vector| (|Float|)) (|Vector| (|Float|))
          (|Float|))
         ($ |Void|))
        (SPROG
         ((|t7| #1=(|Vector| (|Float|))) (#2=#:G770 NIL) (|t6| #1#)
          (#3=#:G768 NIL) (|t5| #1#) (#4=#:G766 NIL) (|t4| #1#) (#5=#:G764 NIL)
          (|t3| #1#) (#6=#:G762 NIL) (|t2| #1#) (#7=#:G760 NIL) (|t1| #1#)
          (#8=#:G758 NIL))
         (SEQ
          (LETT |t1|
                (MAKEARR1
                 (PROG1 (LETT #8# |n| . #9=(|NUMODE;rk4qc;VIFRFVMV;2|))
                   (|check_subtype2| (>= #8# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #8#))
                 (SPADCALL 0 0 10 (QREFELT $ 10)))
                . #9#)
          (LETT |t2|
                (MAKEARR1
                 (PROG1 (LETT #7# |n| . #9#)
                   (|check_subtype2| (>= #7# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #7#))
                 (SPADCALL 0 0 10 (QREFELT $ 10)))
                . #9#)
          (LETT |t3|
                (MAKEARR1
                 (PROG1 (LETT #6# |n| . #9#)
                   (|check_subtype2| (>= #6# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #6#))
                 (SPADCALL 0 0 10 (QREFELT $ 10)))
                . #9#)
          (LETT |t4|
                (MAKEARR1
                 (PROG1 (LETT #5# |n| . #9#)
                   (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #5#))
                 (SPADCALL 0 0 10 (QREFELT $ 10)))
                . #9#)
          (LETT |t5|
                (MAKEARR1
                 (PROG1 (LETT #4# |n| . #9#)
                   (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #4#))
                 (SPADCALL 0 0 10 (QREFELT $ 10)))
                . #9#)
          (LETT |t6|
                (MAKEARR1
                 (PROG1 (LETT #3# |n| . #9#)
                   (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #3#))
                 (SPADCALL 0 0 10 (QREFELT $ 10)))
                . #9#)
          (LETT |t7|
                (MAKEARR1
                 (PROG1 (LETT #2# |n| . #9#)
                   (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #2#))
                 (SPADCALL 0 0 10 (QREFELT $ 10)))
                . #9#)
          (SPADCALL |t7| |y| |x| |derivs|)
          (LETT |eps|
                (SPADCALL (SPADCALL 1 0 10 (QREFELT $ 10)) |eps|
                          (QREFELT $ 16))
                . #9#)
          (EXIT
           (|NUMODE;rk4qclocal| |y| |t7| |n| |x| |step| |eps| |yscal| |derivs|
            |t1| |t2| |t3| |t4| |t5| |t6| $))))) 

(SDEFUN |NUMODE;rk4qc;VIFRFVM7VV;3|
        ((|y| |Vector| (|Float|)) (|n| |Integer|) (|x| |Float|)
         (|step| |Record| (|:| |to_try| (|Float|)) (|:| |did| (|Float|))
          (|:| |next| (|Float|)))
         (|eps| |Float|) (|yscal| |Vector| (|Float|))
         (|derivs| |Mapping| (|Void|) (|Vector| (|Float|)) (|Vector| (|Float|))
          (|Float|))
         (|t1| |Vector| (|Float|)) (|t2| |Vector| (|Float|))
         (|t3| |Vector| (|Float|)) (|t4| |Vector| (|Float|))
         (|t5| |Vector| (|Float|)) (|t6| |Vector| (|Float|))
         (|dydx| |Vector| (|Float|)) ($ |Void|))
        (SEQ (SPADCALL |dydx| |y| |x| |derivs|)
             (LETT |eps|
                   (SPADCALL (SPADCALL 1 0 10 (QREFELT $ 10)) |eps|
                             (QREFELT $ 16))
                   |NUMODE;rk4qc;VIFRFVM7VV;3|)
             (EXIT
              (|NUMODE;rk4qclocal| |y| |dydx| |n| |x| |step| |eps| |yscal|
               |derivs| |t1| |t2| |t3| |t4| |t5| |t6| $)))) 

(SDEFUN |NUMODE;rk4qclocal|
        ((|y| |Vector| (|Float|)) (|dydx| |Vector| (|Float|))
         (|n| . #1=(|Integer|)) (|x| . #2=(|Float|))
         (|step| |Record| (|:| |to_try| #3=(|Float|)) (|:| |did| (|Float|))
          (|:| |next| (|Float|)))
         (|eps| |Float|) (|yscal| |Vector| (|Float|))
         (|derivs| |Mapping| (|Void|) (|Vector| (|Float|)) (|Vector| (|Float|))
          (|Float|))
         (|t1| |Vector| (|Float|)) (|t2| |Vector| (|Float|))
         (|t3| |Vector| (|Float|)) (|ysav| |Vector| (|Float|))
         (|dysav| |Vector| (|Float|)) (|ytemp| |Vector| (|Float|)) ($ |Void|))
        (SPROG
         ((#4=#:G806 NIL) (|i| NIL) (#5=#:G803 NIL) (|h| #3#)
          (|errmax| #6=(|Float|)) (#7=#:G805 NIL) (|hh| (|Float|))
          (#8=#:G804 NIL) (|m| #1#) (|errcon| #6#) (|shrink| #9=(|Float|))
          (|grow| #9#) (|safety| #6#) (|fcor| (|Float|)) (|xsav| #2#))
         (SEQ (LETT |xsav| |x| . #10=(|NUMODE;rk4qclocal|))
              (LETT |h| (QVELT |step| 0) . #10#)
              (LETT |fcor|
                    (SPADCALL (SPADCALL 1 0 10 (QREFELT $ 10))
                              (SPADCALL 15 0 10 (QREFELT $ 10)) (QREFELT $ 16))
                    . #10#)
              (LETT |safety| (SPADCALL 9 -1 10 (QREFELT $ 10)) . #10#)
              (LETT |grow|
                    (SPADCALL (SPADCALL 20 -2 10 (QREFELT $ 10))
                              (QREFELT $ 44))
                    . #10#)
              (LETT |shrink|
                    (SPADCALL (SPADCALL 25 -2 10 (QREFELT $ 10))
                              (QREFELT $ 44))
                    . #10#)
              (LETT |errcon| (SPADCALL 6 -5 10 (QREFELT $ 10)) . #10#)
              (LETT |m| |n| . #10#)
              (SEQ (LETT |i| 1 . #10#) (LETT #8# |m| . #10#) G190
                   (COND ((|greater_SI| |i| #8#) (GO G191)))
                   (SEQ
                    (SPADCALL |dysav| |i| (SPADCALL |dydx| |i| (QREFELT $ 18))
                              (QREFELT $ 19))
                    (EXIT
                     (SPADCALL |ysav| |i| (SPADCALL |y| |i| (QREFELT $ 18))
                               (QREFELT $ 19))))
                   (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191 (EXIT NIL))
              (SEQ
               (EXIT
                (SEQ G190 NIL
                     (SEQ
                      (LETT |hh|
                            (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 10)) |h|
                                      (QREFELT $ 25))
                            . #10#)
                      (|NUMODE;rk4local| |ysav| |dysav| |n| |xsav| |hh| |ytemp|
                       |derivs| |t1| |t2| |t3| $)
                      (LETT |x| (SPADCALL |xsav| |hh| (QREFELT $ 20)) . #10#)
                      (SPADCALL |dydx| |ytemp| |x| |derivs|)
                      (|NUMODE;rk4local| |ytemp| |dydx| |n| |x| |hh| |y|
                       |derivs| |t1| |t2| |t3| $)
                      (LETT |x| (SPADCALL |xsav| |h| (QREFELT $ 20)) . #10#)
                      (|NUMODE;rk4local| |ysav| |dysav| |n| |xsav| |h| |ytemp|
                       |derivs| |t1| |t2| |t3| $)
                      (LETT |errmax| (SPADCALL 0 0 10 (QREFELT $ 10)) . #10#)
                      (SEQ (LETT |i| 1 . #10#) (LETT #7# |m| . #10#) G190
                           (COND ((|greater_SI| |i| #7#) (GO G191)))
                           (SEQ
                            (SPADCALL |ytemp| |i|
                                      (SPADCALL
                                       (SPADCALL |y| |i| (QREFELT $ 18))
                                       (SPADCALL |ytemp| |i| (QREFELT $ 18))
                                       (QREFELT $ 21))
                                      (QREFELT $ 19))
                            (EXIT
                             (LETT |errmax|
                                   (SPADCALL |errmax|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |ytemp| |i|
                                                         (QREFELT $ 18))
                                               (SPADCALL |yscal| |i|
                                                         (QREFELT $ 18))
                                               (QREFELT $ 16))
                                              (QREFELT $ 24))
                                             (QREFELT $ 45))
                                   . #10#)))
                           (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191
                           (EXIT NIL))
                      (LETT |errmax| (SPADCALL |errmax| |eps| (QREFELT $ 25))
                            . #10#)
                      (EXIT
                       (COND
                        ((SPADCALL |errmax| (SPADCALL 1 0 10 (QREFELT $ 10))
                                   (QREFELT $ 23))
                         (LETT |h|
                               (SPADCALL (SPADCALL |safety| |h| (QREFELT $ 25))
                                         (SPADCALL |errmax| |shrink|
                                                   (QREFELT $ 46))
                                         (QREFELT $ 25))
                               . #10#))
                        ('T
                         (SEQ (QSETVELT |step| 1 |h|)
                              (COND
                               ((SPADCALL |errmax| |errcon| (QREFELT $ 23))
                                (QSETVELT |step| 2
                                          (SPADCALL
                                           (SPADCALL |safety| |h|
                                                     (QREFELT $ 25))
                                           (SPADCALL |errmax| |grow|
                                                     (QREFELT $ 46))
                                           (QREFELT $ 25))))
                               ('T
                                (QSETVELT |step| 2
                                          (SPADCALL 4 |h| (QREFELT $ 47)))))
                              (EXIT
                               (PROGN
                                (LETT #5# |$NoValue| . #10#)
                                (GO #11=#:G799))))))))
                     NIL (GO G190) G191 (EXIT NIL)))
               #11# (EXIT #5#))
              (EXIT
               (SEQ (LETT |i| 1 . #10#) (LETT #4# |m| . #10#) G190
                    (COND ((|greater_SI| |i| #4#) (GO G191)))
                    (SEQ
                     (EXIT
                      (SPADCALL |y| |i|
                                (SPADCALL (SPADCALL |y| |i| (QREFELT $ 18))
                                          (SPADCALL
                                           (SPADCALL |ytemp| |i|
                                                     (QREFELT $ 18))
                                           |fcor| (QREFELT $ 25))
                                          (QREFELT $ 20))
                                (QREFELT $ 19))))
                    (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191
                    (EXIT NIL)))))) 

(SDEFUN |NUMODE;rk4f;VI2FIMV;5|
        ((|y| |Vector| (|Float|)) (|nvar| |Integer|) (|x1| . #1=(|Float|))
         (|x2| |Float|) (|nstep| |Integer|)
         (|derivs| |Mapping| (|Void|) (|Vector| (|Float|)) (|Vector| (|Float|))
          (|Float|))
         ($ |Void|))
        (SPROG
         ((|x| #1#) (#2=#:G824 NIL) (|i| NIL) (|h| (|Float|))
          (|ynew| #3=(|Vector| (|Float|))) (#4=#:G816 NIL) (|dydx| #3#)
          (#5=#:G814 NIL) (|dym| #3#) (#6=#:G812 NIL) (|dyt| #3#)
          (#7=#:G810 NIL) (|yt| #3#) (#8=#:G808 NIL))
         (SEQ
          (LETT |yt|
                (MAKEARR1
                 (PROG1 (LETT #8# |nvar| . #9=(|NUMODE;rk4f;VI2FIMV;5|))
                   (|check_subtype2| (>= #8# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #8#))
                 (SPADCALL 0 0 10 (QREFELT $ 10)))
                . #9#)
          (LETT |dyt|
                (MAKEARR1
                 (PROG1 (LETT #7# |nvar| . #9#)
                   (|check_subtype2| (>= #7# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #7#))
                 (SPADCALL 0 0 10 (QREFELT $ 10)))
                . #9#)
          (LETT |dym|
                (MAKEARR1
                 (PROG1 (LETT #6# |nvar| . #9#)
                   (|check_subtype2| (>= #6# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #6#))
                 (SPADCALL 0 0 10 (QREFELT $ 10)))
                . #9#)
          (LETT |dydx|
                (MAKEARR1
                 (PROG1 (LETT #5# |nvar| . #9#)
                   (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #5#))
                 (SPADCALL 0 0 10 (QREFELT $ 10)))
                . #9#)
          (LETT |ynew|
                (MAKEARR1
                 (PROG1 (LETT #4# |nvar| . #9#)
                   (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #4#))
                 (SPADCALL 0 0 10 (QREFELT $ 10)))
                . #9#)
          (LETT |h|
                (SPADCALL (SPADCALL |x2| |x1| (QREFELT $ 21))
                          (SPADCALL |nstep| (QREFELT $ 48)) (QREFELT $ 16))
                . #9#)
          (LETT |x| |x1| . #9#)
          (EXIT
           (SEQ (LETT |i| 1 . #9#) (LETT #2# |nstep| . #9#) G190
                (COND ((|greater_SI| |i| #2#) (GO G191)))
                (SEQ (SPADCALL |dydx| |y| |x| |derivs|)
                     (|NUMODE;rk4local| |y| |dydx| |nvar| |x| |h| |y| |derivs|
                      |yt| |dyt| |dym| $)
                     (EXIT (LETT |x| (SPADCALL |x| |h| (QREFELT $ 20)) . #9#)))
                (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |NUMODE;rk4;VI2FMV;6|
        ((|y| |Vector| (|Float|)) (|n| |Integer|) (|x| |Float|) (|h| |Float|)
         (|derivs| |Mapping| (|Void|) (|Vector| (|Float|)) (|Vector| (|Float|))
          (|Float|))
         ($ |Void|))
        (SPROG
         ((|t4| #1=(|Vector| (|Float|))) (#2=#:G832 NIL) (|t3| #1#)
          (#3=#:G830 NIL) (|t2| #1#) (#4=#:G828 NIL) (|t1| #1#)
          (#5=#:G826 NIL))
         (SEQ
          (LETT |t1|
                (MAKEARR1
                 (PROG1 (LETT #5# |n| . #6=(|NUMODE;rk4;VI2FMV;6|))
                   (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #5#))
                 (SPADCALL 0 0 10 (QREFELT $ 10)))
                . #6#)
          (LETT |t2|
                (MAKEARR1
                 (PROG1 (LETT #4# |n| . #6#)
                   (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #4#))
                 (SPADCALL 0 0 10 (QREFELT $ 10)))
                . #6#)
          (LETT |t3|
                (MAKEARR1
                 (PROG1 (LETT #3# |n| . #6#)
                   (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #3#))
                 (SPADCALL 0 0 10 (QREFELT $ 10)))
                . #6#)
          (LETT |t4|
                (MAKEARR1
                 (PROG1 (LETT #2# |n| . #6#)
                   (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #2#))
                 (SPADCALL 0 0 10 (QREFELT $ 10)))
                . #6#)
          (SPADCALL |t1| |y| |x| |derivs|)
          (EXIT
           (|NUMODE;rk4local| |y| |t1| |n| |x| |h| |y| |derivs| |t2| |t3| |t4|
            $))))) 

(SDEFUN |NUMODE;rk4;VI2FM4VV;7|
        ((|y| |Vector| (|Float|)) (|n| |Integer|) (|x| |Float|) (|h| |Float|)
         (|derivs| |Mapping| (|Void|) (|Vector| (|Float|)) (|Vector| (|Float|))
          (|Float|))
         (|t1| |Vector| (|Float|)) (|t2| |Vector| (|Float|))
         (|t3| |Vector| (|Float|)) (|t4| |Vector| (|Float|)) ($ |Void|))
        (SEQ (SPADCALL |t1| |y| |x| |derivs|)
             (EXIT
              (|NUMODE;rk4local| |y| |t1| |n| |x| |h| |y| |derivs| |t2| |t3|
               |t4| $)))) 

(SDEFUN |NUMODE;rk4local|
        ((|y| |Vector| (|Float|)) (|dydx| |Vector| (|Float|))
         (|n| . #1=(|Integer|)) (|x| |Float|) (|h| |Float|)
         (|yout| |Vector| (|Float|))
         (|derivs| |Mapping| (|Void|) (|Vector| (|Float|)) (|Vector| (|Float|))
          (|Float|))
         (|yt| |Vector| (|Float|)) (|dyt| |Vector| (|Float|))
         (|dym| |Vector| (|Float|)) ($ |Void|))
        (SPROG
         ((#2=#:G853 NIL) (|i| NIL) (#3=#:G852 NIL) (#4=#:G851 NIL)
          (#5=#:G850 NIL) (|m| #1#) (|xh| (|Float|)) (|h6| (|Float|))
          (|hh| (|Float|)))
         (SEQ
          (LETT |hh|
                (SPADCALL |h| (SPADCALL 5 -1 10 (QREFELT $ 10)) (QREFELT $ 25))
                . #6=(|NUMODE;rk4local|))
          (LETT |h6|
                (SPADCALL |h| (SPADCALL 6 0 10 (QREFELT $ 10)) (QREFELT $ 16))
                . #6#)
          (LETT |xh| (SPADCALL |x| |hh| (QREFELT $ 20)) . #6#)
          (LETT |m| |n| . #6#)
          (SEQ (LETT |i| 1 . #6#) (LETT #5# |m| . #6#) G190
               (COND ((|greater_SI| |i| #5#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |yt| |i|
                           (SPADCALL (SPADCALL |y| |i| (QREFELT $ 18))
                                     (SPADCALL |hh|
                                               (SPADCALL |dydx| |i|
                                                         (QREFELT $ 18))
                                               (QREFELT $ 25))
                                     (QREFELT $ 20))
                           (QREFELT $ 19))))
               (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
          (SPADCALL |dyt| |yt| |xh| |derivs|)
          (SEQ (LETT |i| 1 . #6#) (LETT #4# |m| . #6#) G190
               (COND ((|greater_SI| |i| #4#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |yt| |i|
                           (SPADCALL (SPADCALL |y| |i| (QREFELT $ 18))
                                     (SPADCALL |hh|
                                               (SPADCALL |dyt| |i|
                                                         (QREFELT $ 18))
                                               (QREFELT $ 25))
                                     (QREFELT $ 20))
                           (QREFELT $ 19))))
               (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
          (SPADCALL |dym| |yt| |xh| |derivs|)
          (SEQ (LETT |i| 1 . #6#) (LETT #3# |m| . #6#) G190
               (COND ((|greater_SI| |i| #3#) (GO G191)))
               (SEQ
                (SPADCALL |yt| |i|
                          (SPADCALL (SPADCALL |y| |i| (QREFELT $ 18))
                                    (SPADCALL |h|
                                              (SPADCALL |dym| |i|
                                                        (QREFELT $ 18))
                                              (QREFELT $ 25))
                                    (QREFELT $ 20))
                          (QREFELT $ 19))
                (EXIT
                 (SPADCALL |dym| |i|
                           (SPADCALL (SPADCALL |dyt| |i| (QREFELT $ 18))
                                     (SPADCALL |dym| |i| (QREFELT $ 18))
                                     (QREFELT $ 20))
                           (QREFELT $ 19))))
               (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
          (SPADCALL |dyt| |yt| (SPADCALL |x| |h| (QREFELT $ 20)) |derivs|)
          (EXIT
           (SEQ (LETT |i| 1 . #6#) (LETT #2# |m| . #6#) G190
                (COND ((|greater_SI| |i| #2#) (GO G191)))
                (SEQ
                 (EXIT
                  (SPADCALL |yout| |i|
                            (SPADCALL (SPADCALL |y| |i| (QREFELT $ 18))
                                      (SPADCALL |h6|
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL |dydx| |i|
                                                            (QREFELT $ 18))
                                                  (SPADCALL
                                                   (SPADCALL 2 0 10
                                                             (QREFELT $ 10))
                                                   (SPADCALL |dym| |i|
                                                             (QREFELT $ 18))
                                                   (QREFELT $ 25))
                                                  (QREFELT $ 20))
                                                 (SPADCALL |dyt| |i|
                                                           (QREFELT $ 18))
                                                 (QREFELT $ 20))
                                                (QREFELT $ 25))
                                      (QREFELT $ 20))
                            (QREFELT $ 19))))
                (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL)))))) 

(DECLAIM (NOTINLINE |NumericalOrdinaryDifferentialEquations;|)) 

(DEFUN |NumericalOrdinaryDifferentialEquations| ()
  (SPROG NIL
         (PROG (#1=#:G855)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache|
                          '|NumericalOrdinaryDifferentialEquations|)
                    . #2=(|NumericalOrdinaryDifferentialEquations|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache|
                             '|NumericalOrdinaryDifferentialEquations|
                             (LIST
                              (CONS NIL
                                    (CONS 1
                                          (|NumericalOrdinaryDifferentialEquations;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|NumericalOrdinaryDifferentialEquations|)))))))))) 

(DEFUN |NumericalOrdinaryDifferentialEquations;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|NumericalOrdinaryDifferentialEquations|)
                . #1=(|NumericalOrdinaryDifferentialEquations|))
          (LETT $ (GETREFV 52) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache|
                      '|NumericalOrdinaryDifferentialEquations| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|NumericalOrdinaryDifferentialEquations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Float|) (0 . |Zero|) (|Integer|)
              (|PositiveInteger|) (4 . |float|) (11 . |One|) (15 . |digits|)
              (19 . ^) (|OutputForm|) (25 . |coerce|) (30 . /) (|Vector| 6)
              (36 . |elt|) (42 . |setelt!|) (49 . +) (55 . -) (|Boolean|)
              (61 . >) (67 . |abs|) (72 . *) (78 . >=) (|Void|) (|String|)
              (|OutputPackage|) (84 . |output|) (89 . |coerce|) (|List| 14)
              (94 . |setelt!|) (|List| $) (101 . |blankSeparate|)
              (106 . |output|) (111 . |coerce|) (116 . |output|)
              (|Mapping| 27 17 17 6) |NUMODE;rk4a;VI4FIMV;1|
              (|Record| (|:| |to_try| 6) (|:| |did| 6) (|:| |next| 6))
              |NUMODE;rk4qc;VIFRFVMV;2| |NUMODE;rk4qc;VIFRFVM7VV;3| (122 . -)
              (127 . |max|) (133 . ^) (139 . *) (145 . |coerce|)
              |NUMODE;rk4f;VI2FIMV;5| |NUMODE;rk4;VI2FMV;6|
              |NUMODE;rk4;VI2FM4VV;7|)
           '#(|rk4qc| 150 |rk4f| 179 |rk4a| 189 |rk4| 201) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 51
                                                 '(0 6 0 7 3 6 0 8 8 9 10 0 6 0
                                                   11 0 6 9 12 2 6 0 0 8 13 1 6
                                                   14 0 15 2 6 0 0 0 16 2 17 6
                                                   0 8 18 3 17 6 0 8 6 19 2 6 0
                                                   0 0 20 2 6 0 0 0 21 2 6 22 0
                                                   0 23 1 6 0 0 24 2 6 0 0 0 25
                                                   2 6 22 0 0 26 1 29 27 28 30
                                                   1 8 14 0 31 3 32 14 0 8 14
                                                   33 1 14 0 34 35 1 29 27 14
                                                   36 1 17 14 0 37 2 29 27 28
                                                   14 38 1 6 0 0 44 2 6 0 0 0
                                                   45 2 6 0 0 0 46 2 6 0 9 0 47
                                                   1 6 0 8 48 7 0 27 17 8 6 41
                                                   6 17 39 42 14 0 27 17 8 6 41
                                                   6 17 39 17 17 17 17 17 17 17
                                                   43 6 0 27 17 8 6 6 8 39 49 8
                                                   0 27 17 8 6 6 6 6 8 39 40 5
                                                   0 27 17 8 6 6 39 50 9 0 27
                                                   17 8 6 6 39 17 17 17 17
                                                   51)))))
           '|lookupComplete|)) 

(MAKEPROP '|NumericalOrdinaryDifferentialEquations| 'NILADIC T) 
