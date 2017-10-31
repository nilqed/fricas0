
(SDEFUN |INTPAR1;monologextint;LMMR;1|
        ((|lup| |List| UP)
         (|csolve| |Mapping| #1=(|List| (|Vector| (|Fraction| (|Integer|))))
          (|Matrix| F))
         (|rec1| |Mapping|
          #2=(|Record| (|:| |logands| #3=(|List| F))
                       (|:| |basis|
                            #4=(|List| (|Vector| (|Fraction| (|Integer|))))))
          (|List| F))
         ($ |Record| (|:| |logands| (|List| (|Fraction| UP)))
          (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|)))))))
        (SPROG
         ((#5=#:G749 NIL) (|i| NIL) (|j| NIL) (#6=#:G748 NIL)
          (|pv| (|Vector| (|Fraction| (|Integer|)))) (#7=#:G746 NIL)
          (|rbv| NIL) (#8=#:G747 NIL) (|bv| NIL)
          (|nl| (|List| (|Fraction| UP))) (#9=#:G745 NIL) (|le| NIL)
          (#10=#:G744 NIL) (|rbl| (|List| (|Vector| (|Fraction| (|Integer|)))))
          (#11=#:G743 NIL) (#12=#:G742 NIL) (|n3| (|NonNegativeInteger|))
          (|n2| (|NonNegativeInteger|)) (|n1| (|NonNegativeInteger|))
          (|bl| #4#) (|ll| #3#) (|#G11| #2#) (|nlc0| (|List| F))
          (#13=#:G741 NIL) (#14=#:G740 NIL) (|cb| #1#) (|rs1| (|Matrix| F))
          (|m1| (|Matrix| UP)) (|lup2| (|List| UP)) (#15=#:G738 NIL) (|p| NIL)
          (#16=#:G739 NIL) (|c0| NIL) (#17=#:G737 NIL) (|lc0| (|List| F))
          (#18=#:G736 NIL) (#19=#:G735 NIL) (|n0| (|NonNegativeInteger|)))
         (SEQ (LETT |n0| (LENGTH |lup|) . #20=(|INTPAR1;monologextint;LMMR;1|))
              (LETT |lc0|
                    (PROGN
                     (LETT #19# NIL . #20#)
                     (SEQ (LETT |p| NIL . #20#) (LETT #18# |lup| . #20#) G190
                          (COND
                           ((OR (ATOM #18#)
                                (PROGN (LETT |p| (CAR #18#) . #20#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #19#
                                  (CONS (SPADCALL |p| 0 (QREFELT $ 11)) #19#)
                                  . #20#)))
                          (LETT #18# (CDR #18#) . #20#) (GO G190) G191
                          (EXIT (NREVERSE #19#))))
                    . #20#)
              (LETT |lup2|
                    (PROGN
                     (LETT #17# NIL . #20#)
                     (SEQ (LETT |c0| NIL . #20#) (LETT #16# |lc0| . #20#)
                          (LETT |p| NIL . #20#) (LETT #15# |lup| . #20#) G190
                          (COND
                           ((OR (ATOM #15#)
                                (PROGN (LETT |p| (CAR #15#) . #20#) NIL)
                                (ATOM #16#)
                                (PROGN (LETT |c0| (CAR #16#) . #20#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #17#
                                  (CONS
                                   (SPADCALL |p| (SPADCALL |c0| (QREFELT $ 12))
                                             (QREFELT $ 13))
                                   #17#)
                                  . #20#)))
                          (LETT #15#
                                (PROG1 (CDR #15#)
                                  (LETT #16# (CDR #16#) . #20#))
                                . #20#)
                          (GO G190) G191 (EXIT (NREVERSE #17#))))
                    . #20#)
              (LETT |m1| (SPADCALL (LIST |lup2|) (QREFELT $ 16)) . #20#)
              (LETT |rs1| (SPADCALL |m1| (QREFELT $ 19)) . #20#)
              (LETT |cb| (SPADCALL |rs1| |csolve|) . #20#)
              (LETT |nlc0|
                    (PROGN
                     (LETT #14# NIL . #20#)
                     (SEQ (LETT |bv| NIL . #20#) (LETT #13# |cb| . #20#) G190
                          (COND
                           ((OR (ATOM #13#)
                                (PROGN (LETT |bv| (CAR #13#) . #20#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #14#
                                  (CONS (SPADCALL |bv| |lc0| (QREFELT $ 23))
                                        #14#)
                                  . #20#)))
                          (LETT #13# (CDR #13#) . #20#) (GO G190) G191
                          (EXIT (NREVERSE #14#))))
                    . #20#)
              (PROGN
               (LETT |#G11| (SPADCALL |nlc0| |rec1|) . #20#)
               (LETT |ll| (QCAR |#G11|) . #20#)
               (LETT |bl| (QCDR |#G11|) . #20#)
               |#G11|)
              (EXIT
               (COND ((NULL |bl|) (CONS NIL NIL))
                     ('T
                      (SEQ (LETT |n1| (LENGTH |cb|) . #20#)
                           (LETT |n2| (LENGTH |ll|) . #20#)
                           (LETT |n3| (+ |n0| |n2|) . #20#)
                           (LETT |rbl|
                                 (PROGN
                                  (LETT #12# NIL . #20#)
                                  (SEQ (LETT |bv| NIL . #20#)
                                       (LETT #11# |bl| . #20#) G190
                                       (COND
                                        ((OR (ATOM #11#)
                                             (PROGN
                                              (LETT |bv| (CAR #11#) . #20#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #12#
                                               (CONS
                                                (MAKEARR1 |n3|
                                                          (|spadConstant| $
                                                                          25))
                                                #12#)
                                               . #20#)))
                                       (LETT #11# (CDR #11#) . #20#) (GO G190)
                                       G191 (EXIT (NREVERSE #12#))))
                                 . #20#)
                           (LETT |nl|
                                 (PROGN
                                  (LETT #10# NIL . #20#)
                                  (SEQ (LETT |le| NIL . #20#)
                                       (LETT #9# |ll| . #20#) G190
                                       (COND
                                        ((OR (ATOM #9#)
                                             (PROGN
                                              (LETT |le| (CAR #9#) . #20#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #10#
                                               (CONS
                                                (SPADCALL
                                                 (SPADCALL |le| (QREFELT $ 12))
                                                 (QREFELT $ 27))
                                                #10#)
                                               . #20#)))
                                       (LETT #9# (CDR #9#) . #20#) (GO G190)
                                       G191 (EXIT (NREVERSE #10#))))
                                 . #20#)
                           (SEQ (LETT |bv| NIL . #20#) (LETT #8# |bl| . #20#)
                                (LETT |rbv| NIL . #20#) (LETT #7# |rbl| . #20#)
                                G190
                                (COND
                                 ((OR (ATOM #7#)
                                      (PROGN (LETT |rbv| (CAR #7#) . #20#) NIL)
                                      (ATOM #8#)
                                      (PROGN (LETT |bv| (CAR #8#) . #20#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (LETT |pv|
                                       (SPADCALL
                                        (SPADCALL |bv|
                                                  (SPADCALL 1 |n1|
                                                            (QREFELT $ 32))
                                                  (QREFELT $ 33))
                                        |cb| (QREFELT $ 36))
                                       . #20#)
                                 (SEQ (LETT |i| 1 . #20#)
                                      (LETT #6# |n0| . #20#) G190
                                      (COND ((|greater_SI| |i| #6#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SPADCALL |rbv| |i|
                                                  (SPADCALL |pv| |i|
                                                            (QREFELT $ 37))
                                                  (QREFELT $ 38))))
                                      (LETT |i| (|inc_SI| |i|) . #20#)
                                      (GO G190) G191 (EXIT NIL))
                                 (EXIT
                                  (SEQ (LETT |j| (+ |n1| 1) . #20#)
                                       (LETT |i| (+ |n0| 1) . #20#)
                                       (LETT #5# |n3| . #20#) G190
                                       (COND ((> |i| #5#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SPADCALL |rbv| |i|
                                                   (SPADCALL |bv| |j|
                                                             (QREFELT $ 37))
                                                   (QREFELT $ 38))))
                                       (LETT |i|
                                             (PROG1 (+ |i| 1)
                                               (LETT |j| (+ |j| 1) . #20#))
                                             . #20#)
                                       (GO G190) G191 (EXIT NIL))))
                                (LETT #7#
                                      (PROG1 (CDR #7#)
                                        (LETT #8# (CDR #8#) . #20#))
                                      . #20#)
                                (GO G190) G191 (EXIT NIL))
                           (EXIT (CONS |nl| |rbl|))))))))) 

(SDEFUN |INTPAR1;logextint;MMMMLR;2|
        ((|der| |Mapping| UP UP) (|ufactor| |Mapping| (|Factored| UP) UP)
         (|csolve| |Mapping| #1=(|List| (|Vector| (|Fraction| (|Integer|))))
          (|Matrix| F))
         (|rec| |Mapping|
          #2=(|Record| (|:| |logands| (|List| (|Fraction| UP)))
                       (|:| |basis|
                            (|List| (|Vector| (|Fraction| (|Integer|))))))
          (|List| UP))
         (|lg| |List| (|Fraction| UP))
         ($ |Record| (|:| |logands| #3=(|List| (|Fraction| UP)))
          (|:| |basis| #4=(|List| (|Vector| (|Fraction| (|Integer|)))))))
        (SPROG
         ((#5=#:G909 NIL) (|i| NIL) (#6=#:G910 NIL) (|j| NIL) (#7=#:G907 NIL)
          (#8=#:G908 NIL) (|pv| #9=(|Vector| (|Fraction| (|Integer|))))
          (#10=#:G906 NIL) (|bv1| #11=(|Vector| (|Fraction| (|Integer|))))
          (#12=#:G904 NIL) (|rbv| NIL) (#13=#:G905 NIL) (|bv| NIL)
          (|rbas| (|List| (|Vector| (|Fraction| (|Integer|)))))
          (#14=#:G903 NIL) (#15=#:G902 NIL) (|n6| (|NonNegativeInteger|))
          (|n5| #16=(|NonNegativeInteger|)) (|nlog| (|List| (|Fraction| UP)))
          (|rbasl1| (|List| (|Fraction| UP))) (#17=#:G901 NIL) (|up| NIL)
          (#18=#:G900 NIL) (|fbas| #4#) (|flog| #3#) (|#G54| #2#)
          (#19=#:G899 NIL) (|g| NIL) (#20=#:G898 NIL) (|n4| #16#)
          (|lg7| (|List| #21=(|Fraction| UP))) (#22=#:G897 NIL)
          (#23=#:G896 NIL) (|cb4e| (|List| #9#)) (#24=#:G895 NIL)
          (#25=#:G894 NIL) (|ncb2| (|List| #9#)) (#26=#:G893 NIL)
          (#27=#:G892 NIL) (|cb4| #1#) (|rs2| #28=(|Matrix| F))
          (|rs1| (|Matrix| UP)) (|m1| (|Matrix| (|Fraction| UP)))
          (|lg6| (|List| (|Fraction| UP))) (|lrf| (|List| (|Fraction| UP)))
          (|r| (UP)) (|q| (UP))
          (|#G50| #29=(|Record| (|:| |quotient| UP) (|:| |remainder| UP)))
          (|den| (UP)) (#30=#:G891 NIL) (|lg5| (|List| #31=(|Fraction| UP)))
          (#32=#:G889 NIL) (#33=#:G890 NIL) (|pc| NIL) (#34=#:G888 NIL)
          (|lg4| (|List| #31#)) (#35=#:G887 NIL) (|ghr| NIL) (#36=#:G886 NIL)
          (|nlpc| (|List| #21#)) (#37=#:G885 NIL) (#38=#:G884 NIL)
          (|ncb| (|List| #9#)) (#39=#:G883 NIL) (#40=#:G882 NIL)
          (|cb3e| (|List| #11#)) (#41=#:G881 NIL) (#42=#:G880 NIL)
          (|cb3| (|List| #11#)) (#43=#:G879 NIL) (#44=#:G878 NIL) (|cb2| #1#)
          (|rs3| #28#) (|lpc| (|List| (|Fraction| UP))) (|#G41| #29#)
          (|dbj| (UP)) (#45=#:G876 NIL) (#46=#:G877 NIL) (|bj| NIL)
          (#47=#:G874 NIL) (|num| NIL) (#48=#:G875 NIL) (|nl| (|List| UP))
          (|jl| (|List| (|Integer|))) (|fl| (|List| UP)) (|j0| (|Integer|))
          (|j1| (|Integer|)) (|sl1| #49=(|List| (|NonNegativeInteger|)))
          (#50=#:G872 NIL) (#51=#:G873 NIL) (|fj| NIL) (|fl1| (|List| UP))
          (#52=#:G870 NIL) (#53=#:G871 NIL) (|m3| (|Matrix| UP))
          (|n3| (|NonNegativeInteger|)) (|sl| #49#) (#54=#:G869 NIL)
          (#55=#:G868 NIL) (|basl1| (|List| UP))
          (|mbasfl| (|List| (|List| UP))) (#56=#:G867 NIL) (|frr| NIL)
          (#57=#:G866 NIL) (#58=#:G865 NIL) (|mbasp| NIL) (#59=#:G864 NIL)
          (|mbasl| (|List| UP)) (|n2| (|NonNegativeInteger|)) (|n1| #16#)
          (|m2| #60=(|Matrix| (|Integer|))) (|mbas| #61=(|Vector| UP))
          (|#G29| (|Record| (|:| |basis| #61#) (|:| |transform| #60#)))
          (|lden1| (|List| UP)) (#62=#:G863 NIL) (#63=#:G862 NIL)
          (|lg3| (|List| #21#)) (#64=#:G861 NIL) (#65=#:G860 NIL)
          (|lg2| (|List| #66=(|Fraction| UP))) (#67=#:G859 NIL)
          (#68=#:G858 NIL) (|cb| #1#) (|lg1| (|List| #69=(|Fraction| UP)))
          (#70=#:G857 NIL) (#71=#:G856 NIL)
          (|lghr|
           (|List|
            (|Record| (|:| |answer| #69#) (|:| |logpart| #66#)
                      (|:| |specpart| (|Fraction| UP)) (|:| |polypart| UP))))
          (#72=#:G855 NIL) (#73=#:G854 NIL) (|n0| #16#))
         (SEQ
          (COND ((NULL |lg|) (CONS NIL NIL))
                (#74='T
                 (SEQ
                  (LETT |n0| (LENGTH |lg|)
                        . #75=(|INTPAR1;logextint;MMMMLR;2|))
                  (LETT |lghr|
                        (PROGN
                         (LETT #73# NIL . #75#)
                         (SEQ (LETT |g| NIL . #75#) (LETT #72# |lg| . #75#)
                              G190
                              (COND
                               ((OR (ATOM #72#)
                                    (PROGN (LETT |g| (CAR #72#) . #75#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #73#
                                      (CONS (SPADCALL |g| |der| (QREFELT $ 48))
                                            #73#)
                                      . #75#)))
                              (LETT #72# (CDR #72#) . #75#) (GO G190) G191
                              (EXIT (NREVERSE #73#))))
                        . #75#)
                  (LETT |lg1|
                        (PROGN
                         (LETT #71# NIL . #75#)
                         (SEQ (LETT |ghr| NIL . #75#) (LETT #70# |lghr| . #75#)
                              G190
                              (COND
                               ((OR (ATOM #70#)
                                    (PROGN (LETT |ghr| (CAR #70#) . #75#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #71# (CONS (QVELT |ghr| 0) #71#)
                                      . #75#)))
                              (LETT #70# (CDR #70#) . #75#) (GO G190) G191
                              (EXIT (NREVERSE #71#))))
                        . #75#)
                  (LETT |m1| (SPADCALL (LIST |lg1|) (QREFELT $ 51)) . #75#)
                  (LETT |rs1| (SPADCALL |m1| (QREFELT $ 52)) . #75#)
                  (LETT |rs2| (SPADCALL |rs1| (QREFELT $ 19)) . #75#)
                  (LETT |cb| (SPADCALL |rs2| |csolve|) . #75#)
                  (LETT |lg2|
                        (PROGN
                         (LETT #68# NIL . #75#)
                         (SEQ (LETT |ghr| NIL . #75#) (LETT #67# |lghr| . #75#)
                              G190
                              (COND
                               ((OR (ATOM #67#)
                                    (PROGN (LETT |ghr| (CAR #67#) . #75#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #68# (CONS (QVELT |ghr| 1) #68#)
                                      . #75#)))
                              (LETT #67# (CDR #67#) . #75#) (GO G190) G191
                              (EXIT (NREVERSE #68#))))
                        . #75#)
                  (LETT |lg3|
                        (PROGN
                         (LETT #65# NIL . #75#)
                         (SEQ (LETT |bv| NIL . #75#) (LETT #64# |cb| . #75#)
                              G190
                              (COND
                               ((OR (ATOM #64#)
                                    (PROGN (LETT |bv| (CAR #64#) . #75#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #65#
                                      (CONS
                                       (SPADCALL |bv| |lg2| (QREFELT $ 54))
                                       #65#)
                                      . #75#)))
                              (LETT #64# (CDR #64#) . #75#) (GO G190) G191
                              (EXIT (NREVERSE #65#))))
                        . #75#)
                  (LETT |lden1|
                        (PROGN
                         (LETT #63# NIL . #75#)
                         (SEQ (LETT |g| NIL . #75#) (LETT #62# |lg3| . #75#)
                              G190
                              (COND
                               ((OR (ATOM #62#)
                                    (PROGN (LETT |g| (CAR #62#) . #75#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #63#
                                      (CONS (SPADCALL |g| (QREFELT $ 55)) #63#)
                                      . #75#)))
                              (LETT #62# (CDR #62#) . #75#) (GO G190) G191
                              (EXIT (NREVERSE #63#))))
                        . #75#)
                  (PROGN
                   (LETT |#G29|
                         (SPADCALL (SPADCALL |lden1| (QREFELT $ 57))
                                   (QREFELT $ 60))
                         . #75#)
                   (LETT |mbas| (QCAR |#G29|) . #75#)
                   (LETT |m2| (QCDR |#G29|) . #75#)
                   |#G29|)
                  (LETT |n1| (LENGTH |lg3|) . #75#)
                  (LETT |n2| (QVSIZE |mbas|) . #75#)
                  (LETT |mbasl| (SPADCALL |mbas| (QREFELT $ 61)) . #75#)
                  (LETT |mbasfl|
                        (PROGN
                         (LETT #59# NIL . #75#)
                         (SEQ (LETT |mbasp| NIL . #75#)
                              (LETT #58# |mbasl| . #75#) G190
                              (COND
                               ((OR (ATOM #58#)
                                    (PROGN
                                     (LETT |mbasp| (CAR #58#) . #75#)
                                     NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #59#
                                      (CONS
                                       (PROGN
                                        (LETT #57# NIL . #75#)
                                        (SEQ (LETT |frr| NIL . #75#)
                                             (LETT #56#
                                                   (SPADCALL
                                                    (SPADCALL |mbasp|
                                                              |ufactor|)
                                                    (QREFELT $ 65))
                                                   . #75#)
                                             G190
                                             (COND
                                              ((OR (ATOM #56#)
                                                   (PROGN
                                                    (LETT |frr| (CAR #56#)
                                                          . #75#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #57#
                                                     (CONS (QCAR |frr|) #57#)
                                                     . #75#)))
                                             (LETT #56# (CDR #56#) . #75#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #57#))))
                                       #59#)
                                      . #75#)))
                              (LETT #58# (CDR #58#) . #75#) (GO G190) G191
                              (EXIT (NREVERSE #59#))))
                        . #75#)
                  (LETT |basl1|
                        (SPADCALL (ELT $ 68) |mbasfl| NIL (QREFELT $ 70))
                        . #75#)
                  (LETT |sl|
                        (PROGN
                         (LETT #55# NIL . #75#)
                         (SEQ (LETT |fl1| NIL . #75#)
                              (LETT #54# |mbasfl| . #75#) G190
                              (COND
                               ((OR (ATOM #54#)
                                    (PROGN (LETT |fl1| (CAR #54#) . #75#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #55# (CONS (LENGTH |fl1|) #55#) . #75#)))
                              (LETT #54# (CDR #54#) . #75#) (GO G190) G191
                              (EXIT (NREVERSE #55#))))
                        . #75#)
                  (LETT |n3| (SPADCALL (ELT $ 75) |sl| 0 (QREFELT $ 78))
                        . #75#)
                  (LETT |m3|
                        (MAKE_MATRIX1 |n3| (+ |n1| |n3|) (|spadConstant| $ 9))
                        . #75#)
                  (SEQ (LETT |g| NIL . #75#) (LETT #53# |lg3| . #75#)
                       (LETT |i| 1 . #75#) (LETT #52# |n1| . #75#) G190
                       (COND
                        ((OR (|greater_SI| |i| #52#) (ATOM #53#)
                             (PROGN (LETT |g| (CAR #53#) . #75#) NIL))
                         (GO G191)))
                       (SEQ (LETT |fl| NIL . #75#) (LETT |jl| NIL . #75#)
                            (LETT |sl1| |sl| . #75#) (LETT |fl1| NIL . #75#)
                            (LETT |j0| 1 . #75#) (LETT |j1| 0 . #75#)
                            (SEQ (LETT |fj| NIL . #75#)
                                 (LETT #51# |basl1| . #75#) (LETT |j| 1 . #75#)
                                 (LETT #50# |n3| . #75#) G190
                                 (COND
                                  ((OR (|greater_SI| |j| #50#) (ATOM #51#)
                                       (PROGN
                                        (LETT |fj| (CAR #51#) . #75#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ (LETT |j1| (+ |j1| 1) . #75#)
                                      (COND
                                       ((SPADCALL |j1| (|SPADfirst| |sl1|)
                                                  (QREFELT $ 80))
                                        (SEQ (LETT |sl1| (CDR |sl1|) . #75#)
                                             (LETT |j1| 0 . #75#)
                                             (EXIT
                                              (LETT |j0| (+ |j0| 1) . #75#)))))
                                      (EXIT
                                       (COND
                                        ((EQL
                                          (SPADCALL |m2| |j0| |i|
                                                    (QREFELT $ 82))
                                          1)
                                         (SEQ
                                          (LETT |fl| (CONS |fj| |fl|) . #75#)
                                          (EXIT
                                           (LETT |jl| (CONS |j| |jl|)
                                                 . #75#)))))))
                                 (LETT |j|
                                       (PROG1 (|inc_SI| |j|)
                                         (LETT #51# (CDR #51#) . #75#))
                                       . #75#)
                                 (GO G190) G191 (EXIT NIL))
                            (LETT |nl|
                                  (SPADCALL (SPADCALL |g| (QREFELT $ 83)) |fl|
                                            (QREFELT $ 85))
                                  . #75#)
                            (EXIT
                             (SEQ (LETT |j| NIL . #75#) (LETT #48# |jl| . #75#)
                                  (LETT |num| NIL . #75#)
                                  (LETT #47# |nl| . #75#) G190
                                  (COND
                                   ((OR (ATOM #47#)
                                        (PROGN
                                         (LETT |num| (CAR #47#) . #75#)
                                         NIL)
                                        (ATOM #48#)
                                        (PROGN
                                         (LETT |j| (CAR #48#) . #75#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SPADCALL |m3| |j| |i| |num|
                                              (QREFELT $ 86))))
                                  (LETT #47#
                                        (PROG1 (CDR #47#)
                                          (LETT #48# (CDR #48#) . #75#))
                                        . #75#)
                                  (GO G190) G191 (EXIT NIL))))
                       (LETT |i|
                             (PROG1 (|inc_SI| |i|)
                               (LETT #53# (CDR #53#) . #75#))
                             . #75#)
                       (GO G190) G191 (EXIT NIL))
                  (LETT |lpc| NIL . #75#)
                  (SEQ (LETT |bj| NIL . #75#) (LETT #46# |basl1| . #75#)
                       (LETT |j| 1 . #75#) (LETT #45# |n3| . #75#) G190
                       (COND
                        ((OR (|greater_SI| |j| #45#) (ATOM #46#)
                             (PROGN (LETT |bj| (CAR #46#) . #75#) NIL))
                         (GO G191)))
                       (SEQ (LETT |dbj| (SPADCALL |bj| |der|) . #75#)
                            (PROGN
                             (LETT |#G41| (SPADCALL |dbj| |bj| (QREFELT $ 88))
                                   . #75#)
                             (LETT |q| (QCAR |#G41|) . #75#)
                             (LETT |r| (QCDR |#G41|) . #75#)
                             |#G41|)
                            (SPADCALL |m3| |j| (+ |n1| |j|) |r| (QREFELT $ 86))
                            (EXIT
                             (LETT |lpc|
                                   (CONS (SPADCALL |q| (QREFELT $ 27)) |lpc|)
                                   . #75#)))
                       (LETT |j|
                             (PROG1 (|inc_SI| |j|)
                               (LETT #46# (CDR #46#) . #75#))
                             . #75#)
                       (GO G190) G191 (EXIT NIL))
                  (LETT |lpc| (NREVERSE |lpc|) . #75#)
                  (LETT |rs3| (SPADCALL |m3| (QREFELT $ 19)) . #75#)
                  (LETT |cb2| (SPADCALL |rs3| |csolve|) . #75#)
                  (LETT |cb3|
                        (PROGN
                         (LETT #44# NIL . #75#)
                         (SEQ (LETT |bv| NIL . #75#) (LETT #43# |cb2| . #75#)
                              G190
                              (COND
                               ((OR (ATOM #43#)
                                    (PROGN (LETT |bv| (CAR #43#) . #75#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #44#
                                      (CONS
                                       (SPADCALL |bv|
                                                 (SPADCALL 1 |n1|
                                                           (QREFELT $ 32))
                                                 (QREFELT $ 33))
                                       #44#)
                                      . #75#)))
                              (LETT #43# (CDR #43#) . #75#) (GO G190) G191
                              (EXIT (NREVERSE #44#))))
                        . #75#)
                  (LETT |cb3e|
                        (PROGN
                         (LETT #42# NIL . #75#)
                         (SEQ (LETT |bv| NIL . #75#) (LETT #41# |cb2| . #75#)
                              G190
                              (COND
                               ((OR (ATOM #41#)
                                    (PROGN (LETT |bv| (CAR #41#) . #75#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #42#
                                      (CONS
                                       (SPADCALL |bv|
                                                 (SPADCALL (+ |n1| 1)
                                                           (+ |n1| |n3|)
                                                           (QREFELT $ 32))
                                                 (QREFELT $ 33))
                                       #42#)
                                      . #75#)))
                              (LETT #41# (CDR #41#) . #75#) (GO G190) G191
                              (EXIT (NREVERSE #42#))))
                        . #75#)
                  (LETT |ncb|
                        (PROGN
                         (LETT #40# NIL . #75#)
                         (SEQ (LETT |bv| NIL . #75#) (LETT #39# |cb3| . #75#)
                              G190
                              (COND
                               ((OR (ATOM #39#)
                                    (PROGN (LETT |bv| (CAR #39#) . #75#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #40#
                                      (CONS (SPADCALL |bv| |cb| (QREFELT $ 36))
                                            #40#)
                                      . #75#)))
                              (LETT #39# (CDR #39#) . #75#) (GO G190) G191
                              (EXIT (NREVERSE #40#))))
                        . #75#)
                  (LETT |nlpc|
                        (PROGN
                         (LETT #38# NIL . #75#)
                         (SEQ (LETT |bv| NIL . #75#) (LETT #37# |cb3e| . #75#)
                              G190
                              (COND
                               ((OR (ATOM #37#)
                                    (PROGN (LETT |bv| (CAR #37#) . #75#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #38#
                                      (CONS
                                       (SPADCALL |bv| |lpc| (QREFELT $ 54))
                                       #38#)
                                      . #75#)))
                              (LETT #37# (CDR #37#) . #75#) (GO G190) G191
                              (EXIT (NREVERSE #38#))))
                        . #75#)
                  (LETT |lg4|
                        (PROGN
                         (LETT #36# NIL . #75#)
                         (SEQ (LETT |ghr| NIL . #75#) (LETT #35# |lghr| . #75#)
                              G190
                              (COND
                               ((OR (ATOM #35#)
                                    (PROGN (LETT |ghr| (CAR #35#) . #75#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #36#
                                      (CONS
                                       (SPADCALL
                                        (SPADCALL (QVELT |ghr| 3)
                                                  (QREFELT $ 27))
                                        (QVELT |ghr| 2) (QREFELT $ 71))
                                       #36#)
                                      . #75#)))
                              (LETT #35# (CDR #35#) . #75#) (GO G190) G191
                              (EXIT (NREVERSE #36#))))
                        . #75#)
                  (LETT |lg5|
                        (PROGN
                         (LETT #34# NIL . #75#)
                         (SEQ (LETT |pc| NIL . #75#) (LETT #33# |nlpc| . #75#)
                              (LETT |bv| NIL . #75#) (LETT #32# |ncb| . #75#)
                              G190
                              (COND
                               ((OR (ATOM #32#)
                                    (PROGN (LETT |bv| (CAR #32#) . #75#) NIL)
                                    (ATOM #33#)
                                    (PROGN (LETT |pc| (CAR #33#) . #75#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #34#
                                      (CONS
                                       (SPADCALL
                                        (SPADCALL |bv| |lg4| (QREFELT $ 54))
                                        |pc| (QREFELT $ 71))
                                       #34#)
                                      . #75#)))
                              (LETT #32#
                                    (PROG1 (CDR #32#)
                                      (LETT #33# (CDR #33#) . #75#))
                                    . #75#)
                              (GO G190) G191 (EXIT (NREVERSE #34#))))
                        . #75#)
                  (LETT |lrf| NIL . #75#) (LETT |lg6| NIL . #75#)
                  (SEQ (LETT |g| NIL . #75#) (LETT #30# |lg5| . #75#) G190
                       (COND
                        ((OR (ATOM #30#)
                             (PROGN (LETT |g| (CAR #30#) . #75#) NIL))
                         (GO G191)))
                       (SEQ (LETT |den| (SPADCALL |g| (QREFELT $ 55)) . #75#)
                            (PROGN
                             (LETT |#G50|
                                   (SPADCALL (SPADCALL |g| (QREFELT $ 83))
                                             |den| (QREFELT $ 88))
                                   . #75#)
                             (LETT |q| (QCAR |#G50|) . #75#)
                             (LETT |r| (QCDR |#G50|) . #75#)
                             |#G50|)
                            (LETT |lrf|
                                  (CONS (SPADCALL |r| |den| (QREFELT $ 89))
                                        |lrf|)
                                  . #75#)
                            (EXIT
                             (LETT |lg6|
                                   (CONS (SPADCALL |q| (QREFELT $ 27)) |lg6|)
                                   . #75#)))
                       (LETT #30# (CDR #30#) . #75#) (GO G190) G191 (EXIT NIL))
                  (LETT |lrf| (NREVERSE |lrf|) . #75#)
                  (LETT |lg6| (NREVERSE |lg6|) . #75#)
                  (LETT |m1| (SPADCALL (LIST |lrf|) (QREFELT $ 51)) . #75#)
                  (LETT |rs1| (SPADCALL |m1| (QREFELT $ 52)) . #75#)
                  (LETT |rs2| (SPADCALL |rs1| (QREFELT $ 19)) . #75#)
                  (LETT |cb4| (SPADCALL |rs2| |csolve|) . #75#)
                  (LETT |ncb2|
                        (PROGN
                         (LETT #27# NIL . #75#)
                         (SEQ (LETT |bv| NIL . #75#) (LETT #26# |cb4| . #75#)
                              G190
                              (COND
                               ((OR (ATOM #26#)
                                    (PROGN (LETT |bv| (CAR #26#) . #75#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #27#
                                      (CONS
                                       (SPADCALL |bv| |ncb| (QREFELT $ 36))
                                       #27#)
                                      . #75#)))
                              (LETT #26# (CDR #26#) . #75#) (GO G190) G191
                              (EXIT (NREVERSE #27#))))
                        . #75#)
                  (LETT |cb4e|
                        (PROGN
                         (LETT #25# NIL . #75#)
                         (SEQ (LETT |bv| NIL . #75#) (LETT #24# |cb4| . #75#)
                              G190
                              (COND
                               ((OR (ATOM #24#)
                                    (PROGN (LETT |bv| (CAR #24#) . #75#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #25#
                                      (CONS
                                       (SPADCALL |bv| |cb3e| (QREFELT $ 36))
                                       #25#)
                                      . #75#)))
                              (LETT #24# (CDR #24#) . #75#) (GO G190) G191
                              (EXIT (NREVERSE #25#))))
                        . #75#)
                  (LETT |lg7|
                        (PROGN
                         (LETT #23# NIL . #75#)
                         (SEQ (LETT |bv| NIL . #75#) (LETT #22# |cb4| . #75#)
                              G190
                              (COND
                               ((OR (ATOM #22#)
                                    (PROGN (LETT |bv| (CAR #22#) . #75#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #23#
                                      (CONS
                                       (SPADCALL |bv| |lg6| (QREFELT $ 54))
                                       #23#)
                                      . #75#)))
                              (LETT #22# (CDR #22#) . #75#) (GO G190) G191
                              (EXIT (NREVERSE #23#))))
                        . #75#)
                  (LETT |n4| (LENGTH |lg7|) . #75#)
                  (PROGN
                   (LETT |#G54|
                         (SPADCALL
                          (PROGN
                           (LETT #20# NIL . #75#)
                           (SEQ (LETT |g| NIL . #75#) (LETT #19# |lg7| . #75#)
                                G190
                                (COND
                                 ((OR (ATOM #19#)
                                      (PROGN (LETT |g| (CAR #19#) . #75#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #20#
                                        (CONS (SPADCALL |g| (QREFELT $ 90))
                                              #20#)
                                        . #75#)))
                                (LETT #19# (CDR #19#) . #75#) (GO G190) G191
                                (EXIT (NREVERSE #20#))))
                          |rec|)
                         . #75#)
                   (LETT |flog| (QCAR |#G54|) . #75#)
                   (LETT |fbas| (QCDR |#G54|) . #75#)
                   |#G54|)
                  (EXIT
                   (COND ((NULL |fbas|) (CONS NIL NIL))
                         (#74#
                          (SEQ
                           (LETT |rbasl1|
                                 (PROGN
                                  (LETT #18# NIL . #75#)
                                  (SEQ (LETT |up| NIL . #75#)
                                       (LETT #17# |basl1| . #75#) G190
                                       (COND
                                        ((OR (ATOM #17#)
                                             (PROGN
                                              (LETT |up| (CAR #17#) . #75#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #18#
                                               (CONS
                                                (SPADCALL |up| (QREFELT $ 27))
                                                #18#)
                                               . #75#)))
                                       (LETT #17# (CDR #17#) . #75#) (GO G190)
                                       G191 (EXIT (NREVERSE #18#))))
                                 . #75#)
                           (LETT |nlog|
                                 (SPADCALL |rbasl1| |flog| (QREFELT $ 67))
                                 . #75#)
                           (LETT |n5| (LENGTH |flog|) . #75#)
                           (LETT |n6| (+ (+ |n0| |n3|) |n5|) . #75#)
                           (LETT |rbas|
                                 (PROGN
                                  (LETT #15# NIL . #75#)
                                  (SEQ (LETT |bv| NIL . #75#)
                                       (LETT #14# |fbas| . #75#) G190
                                       (COND
                                        ((OR (ATOM #14#)
                                             (PROGN
                                              (LETT |bv| (CAR #14#) . #75#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #15#
                                               (CONS
                                                (MAKEARR1 |n6|
                                                          (|spadConstant| $
                                                                          25))
                                                #15#)
                                               . #75#)))
                                       (LETT #14# (CDR #14#) . #75#) (GO G190)
                                       G191 (EXIT (NREVERSE #15#))))
                                 . #75#)
                           (SEQ (LETT |bv| NIL . #75#)
                                (LETT #13# |fbas| . #75#)
                                (LETT |rbv| NIL . #75#)
                                (LETT #12# |rbas| . #75#) G190
                                (COND
                                 ((OR (ATOM #12#)
                                      (PROGN
                                       (LETT |rbv| (CAR #12#) . #75#)
                                       NIL)
                                      (ATOM #13#)
                                      (PROGN
                                       (LETT |bv| (CAR #13#) . #75#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (LETT |bv1|
                                       (SPADCALL |bv|
                                                 (SPADCALL 1 |n4|
                                                           (QREFELT $ 32))
                                                 (QREFELT $ 33))
                                       . #75#)
                                 (LETT |pv|
                                       (SPADCALL |bv1| |ncb2| (QREFELT $ 36))
                                       . #75#)
                                 (SEQ (LETT |i| 1 . #75#)
                                      (LETT #10# |n0| . #75#) G190
                                      (COND
                                       ((|greater_SI| |i| #10#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SPADCALL |rbv| |i|
                                                  (SPADCALL |pv| |i|
                                                            (QREFELT $ 37))
                                                  (QREFELT $ 38))))
                                      (LETT |i| (|inc_SI| |i|) . #75#)
                                      (GO G190) G191 (EXIT NIL))
                                 (LETT |pv|
                                       (SPADCALL |bv1| |cb4e| (QREFELT $ 36))
                                       . #75#)
                                 (SEQ (LETT |j| 1 . #75#)
                                      (LETT #8# |n3| . #75#)
                                      (LETT |i| (+ |n0| 1) . #75#)
                                      (LETT #7# (+ |n0| |n3|) . #75#) G190
                                      (COND
                                       ((OR (> |i| #7#) (|greater_SI| |j| #8#))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SPADCALL |rbv| |i|
                                                  (SPADCALL |pv| |j|
                                                            (QREFELT $ 37))
                                                  (QREFELT $ 38))))
                                      (LETT |i|
                                            (PROG1 (+ |i| 1)
                                              (LETT |j| (|inc_SI| |j|) . #75#))
                                            . #75#)
                                      (GO G190) G191 (EXIT NIL))
                                 (EXIT
                                  (SEQ (LETT |j| (+ |n4| 1) . #75#)
                                       (LETT #6# (+ |n4| |n5|) . #75#)
                                       (LETT |i| (+ (+ |n0| |n3|) 1) . #75#)
                                       (LETT #5# |n6| . #75#) G190
                                       (COND
                                        ((OR (> |i| #5#) (> |j| #6#))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SPADCALL |rbv| |i|
                                                   (SPADCALL |bv| |j|
                                                             (QREFELT $ 37))
                                                   (QREFELT $ 38))))
                                       (LETT |i|
                                             (PROG1 (+ |i| 1)
                                               (LETT |j| (+ |j| 1) . #75#))
                                             . #75#)
                                       (GO G190) G191 (EXIT NIL))))
                                (LETT #12#
                                      (PROG1 (CDR #12#)
                                        (LETT #13# (CDR #13#) . #75#))
                                      . #75#)
                                (GO G190) G191 (EXIT NIL))
                           (EXIT (CONS |nlog| |rbas|)))))))))))) 

(SDEFUN |INTPAR1;RF_to_GP| ((|f| |Fraction| UP) ($ |LaurentPolynomial| F UP))
        (SPROG ((#1=#:G914 NIL))
               (PROG2
                   (LETT #1#
                         (SPADCALL
                          (SPADCALL (SPADCALL |f| (QREFELT $ 83))
                                    (QREFELT $ 95))
                          (SPADCALL (SPADCALL |f| (QREFELT $ 55))
                                    (QREFELT $ 95))
                          (QREFELT $ 97))
                         |INTPAR1;RF_to_GP|)
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0)
                                 (|LaurentPolynomial| (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                 (|Union|
                                  (|LaurentPolynomial| (QREFELT $ 6)
                                                       (QREFELT $ 7))
                                  "failed")
                                 #1#)))) 

(SDEFUN |INTPAR1;primextint;MMMLL;4|
        ((|der| |Mapping| UP UP)
         (|ext| |Mapping|
          (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| F))
         (|csolve| |Mapping| (|List| (|Vector| F)) (|Matrix| F))
         (|lg| |List| (|Fraction| UP))
         ($ |List|
          (|Record| (|:| |ratpart| (|Fraction| UP))
                    (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#1=#:G998 NIL) (|bv| NIL) (#2=#:G999 NIL) (|ba| NIL) (#3=#:G997 NIL)
          (|nlba| (|List| (|Fraction| UP))) (#4=#:G995 NIL) (#5=#:G996 NIL)
          (#6=#:G994 NIL) (|lba| (|List| (|Fraction| UP)))
          (|cb| (|List| (|Vector| F))) (#7=#:G992 NIL) (|be| NIL)
          (#8=#:G993 NIL) (#9=#:G991 NIL) (|cba| (|List| F)) (#10=#:G990 NIL)
          (#11=#:G989 NIL) (|ncb| (|List| (|Vector| F))) (#12=#:G988 NIL)
          (#13=#:G987 NIL) (|cb0| (|List| (|Vector| F))) (#14=#:G986 NIL)
          (#15=#:G985 NIL) (|n1p| (|NonNegativeInteger|))
          (|b2|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (|lgj1| (|List| F)) (|ff| (F)) (#16=#:G983 NIL) (#17=#:G984 NIL)
          (|aa| NIL) (|lgj| (|List| F)) (|gij| (F)) (|gi| (UP))
          (#18=#:G982 NIL) (|i| NIL) (|n1| (|NonNegativeInteger|)) (|j| NIL)
          (#19=#:G981 NIL) (#20=#:G980 NIL) (|dk| (F))
          (|d| (|NonNegativeInteger|)) (|ldg| (|List| (|NonNegativeInteger|)))
          (#21=#:G979 NIL) (|g2| NIL) (#22=#:G978 NIL) (|vg2| (|Vector| UP))
          (|lg2| (|List| UP)) (#23=#:G977 NIL) (|ghr| NIL) (#24=#:G976 NIL)
          (#25=#:G975 NIL) (#26=#:G974 NIL)
          (|a1l| (|List| #27=(|Fraction| UP))) (#28=#:G973 NIL)
          (#29=#:G972 NIL) (|rs2| (|Matrix| F)) (|rs1| (|Matrix| UP))
          (|m1| (|Matrix| (|Fraction| UP)))
          (|lg1| (|List| #30=(|Fraction| UP))) (#31=#:G971 NIL)
          (#32=#:G970 NIL)
          (|lghr|
           (|List|
            (|Record| (|:| |answer| #27#) (|:| |logpart| #30#)
                      (|:| |specpart| (|Fraction| UP)) (|:| |polypart| UP))))
          (#33=#:G969 NIL) (|g| NIL) (#34=#:G968 NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (COND ((NULL |lg|) NIL)
                ('T
                 (SEQ
                  (LETT |n| (LENGTH |lg|) . #35=(|INTPAR1;primextint;MMMLL;4|))
                  (LETT |lghr|
                        (PROGN
                         (LETT #34# NIL . #35#)
                         (SEQ (LETT |g| NIL . #35#) (LETT #33# |lg| . #35#)
                              G190
                              (COND
                               ((OR (ATOM #33#)
                                    (PROGN (LETT |g| (CAR #33#) . #35#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #34#
                                      (CONS (SPADCALL |g| |der| (QREFELT $ 48))
                                            #34#)
                                      . #35#)))
                              (LETT #33# (CDR #33#) . #35#) (GO G190) G191
                              (EXIT (NREVERSE #34#))))
                        . #35#)
                  (LETT |lg1|
                        (PROGN
                         (LETT #32# NIL . #35#)
                         (SEQ (LETT |ghr| NIL . #35#) (LETT #31# |lghr| . #35#)
                              G190
                              (COND
                               ((OR (ATOM #31#)
                                    (PROGN (LETT |ghr| (CAR #31#) . #35#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #32# (CONS (QVELT |ghr| 1) #32#)
                                      . #35#)))
                              (LETT #31# (CDR #31#) . #35#) (GO G190) G191
                              (EXIT (NREVERSE #32#))))
                        . #35#)
                  (LETT |m1| (SPADCALL (LIST |lg1|) (QREFELT $ 51)) . #35#)
                  (LETT |rs1| (SPADCALL |m1| (QREFELT $ 52)) . #35#)
                  (LETT |rs2| (SPADCALL |rs1| (QREFELT $ 19)) . #35#)
                  (LETT |cb| (SPADCALL |rs2| |csolve|) . #35#)
                  (LETT |a1l|
                        (PROGN
                         (LETT #29# NIL . #35#)
                         (SEQ (LETT |ghr| NIL . #35#) (LETT #28# |lghr| . #35#)
                              G190
                              (COND
                               ((OR (ATOM #28#)
                                    (PROGN (LETT |ghr| (CAR #28#) . #35#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #29# (CONS (QVELT |ghr| 0) #29#)
                                      . #35#)))
                              (LETT #28# (CDR #28#) . #35#) (GO G190) G191
                              (EXIT (NREVERSE #29#))))
                        . #35#)
                  (LETT |lba|
                        (PROGN
                         (LETT #26# NIL . #35#)
                         (SEQ (LETT |bv| NIL . #35#) (LETT #25# |cb| . #35#)
                              G190
                              (COND
                               ((OR (ATOM #25#)
                                    (PROGN (LETT |bv| (CAR #25#) . #35#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #26# (CONS (|spadConstant| $ 98) #26#)
                                      . #35#)))
                              (LETT #25# (CDR #25#) . #35#) (GO G190) G191
                              (EXIT (NREVERSE #26#))))
                        . #35#)
                  (LETT |lg2|
                        (PROGN
                         (LETT #24# NIL . #35#)
                         (SEQ (LETT |ghr| NIL . #35#) (LETT #23# |lghr| . #35#)
                              G190
                              (COND
                               ((OR (ATOM #23#)
                                    (PROGN (LETT |ghr| (CAR #23#) . #35#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #24# (CONS (QVELT |ghr| 3) #24#)
                                      . #35#)))
                              (LETT #23# (CDR #23#) . #35#) (GO G190) G191
                              (EXIT (NREVERSE #24#))))
                        . #35#)
                  (LETT |vg2| (SPADCALL |lg2| (QREFELT $ 57)) . #35#)
                  (LETT |ldg|
                        (PROGN
                         (LETT #22# NIL . #35#)
                         (SEQ (LETT |g2| NIL . #35#) (LETT #21# |lg2| . #35#)
                              G190
                              (COND
                               ((OR (ATOM #21#)
                                    (PROGN (LETT |g2| (CAR #21#) . #35#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #22#
                                      (CONS (SPADCALL |g2| (QREFELT $ 99))
                                            #22#)
                                      . #35#)))
                              (LETT #21# (CDR #21#) . #35#) (GO G190) G191
                              (EXIT (NREVERSE #22#))))
                        . #35#)
                  (LETT |d| (SPADCALL (ELT $ 100) |ldg| (QREFELT $ 101))
                        . #35#)
                  (LETT |dk|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 28) 1 (QREFELT $ 102))
                          |der|)
                         (QREFELT $ 103))
                        . #35#)
                  (LETT |cba|
                        (PROGN
                         (LETT #20# NIL . #35#)
                         (SEQ (LETT |bv| NIL . #35#) (LETT #19# |cb| . #35#)
                              G190
                              (COND
                               ((OR (ATOM #19#)
                                    (PROGN (LETT |bv| (CAR #19#) . #35#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #20# (CONS (|spadConstant| $ 8) #20#)
                                      . #35#)))
                              (LETT #19# (CDR #19#) . #35#) (GO G190) G191
                              (EXIT (NREVERSE #20#))))
                        . #35#)
                  (SEQ (LETT |j| |d| . #35#) G190 (COND ((< |j| 0) (GO G191)))
                       (SEQ (LETT |n1| (LENGTH |cb|) . #35#)
                            (LETT |lgj| NIL . #35#)
                            (SEQ (LETT |i| 1 . #35#) (LETT #18# |n| . #35#)
                                 G190
                                 (COND ((|greater_SI| |i| #18#) (GO G191)))
                                 (SEQ
                                  (LETT |gi|
                                        (SPADCALL |vg2| |i| (QREFELT $ 104))
                                        . #35#)
                                  (LETT |gij| (|spadConstant| $ 8) . #35#)
                                  (COND
                                   ((EQL (SPADCALL |gi| (QREFELT $ 99)) |j|)
                                    (SEQ
                                     (LETT |gij|
                                           (SPADCALL |gi| (QREFELT $ 105))
                                           . #35#)
                                     (EXIT
                                      (SPADCALL |vg2| |i|
                                                (SPADCALL |gi| (QREFELT $ 106))
                                                (QREFELT $ 107))))))
                                  (EXIT
                                   (LETT |lgj| (CONS |gij| |lgj|) . #35#)))
                                 (LETT |i| (|inc_SI| |i|) . #35#) (GO G190)
                                 G191 (EXIT NIL))
                            (LETT |lgj| (NREVERSE |lgj|) . #35#)
                            (LETT |lgj1| NIL . #35#)
                            (SEQ (LETT |aa| NIL . #35#)
                                 (LETT #17# |cba| . #35#)
                                 (LETT |bv| NIL . #35#) (LETT #16# |cb| . #35#)
                                 G190
                                 (COND
                                  ((OR (ATOM #16#)
                                       (PROGN
                                        (LETT |bv| (CAR #16#) . #35#)
                                        NIL)
                                       (ATOM #17#)
                                       (PROGN
                                        (LETT |aa| (CAR #17#) . #35#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |ff|
                                        (SPADCALL
                                         (SPADCALL |bv| |lgj| (QREFELT $ 109))
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL (+ |j| 1) (QREFELT $ 110))
                                           |dk| (QREFELT $ 111))
                                          |aa| (QREFELT $ 111))
                                         (QREFELT $ 112))
                                        . #35#)
                                  (EXIT
                                   (LETT |lgj1| (CONS |ff| |lgj1|) . #35#)))
                                 (LETT #16#
                                       (PROG1 (CDR #16#)
                                         (LETT #17# (CDR #17#) . #35#))
                                       . #35#)
                                 (GO G190) G191 (EXIT NIL))
                            (LETT |lgj1| (NREVERSE |lgj1|) . #35#)
                            (LETT |b2| (SPADCALL (CONS |dk| |lgj1|) |ext|)
                                  . #35#)
                            (LETT |n1p| (+ |n1| 1) . #35#)
                            (LETT |cb0|
                                  (PROGN
                                   (LETT #15# NIL . #35#)
                                   (SEQ (LETT |be| NIL . #35#)
                                        (LETT #14# |b2| . #35#) G190
                                        (COND
                                         ((OR (ATOM #14#)
                                              (PROGN
                                               (LETT |be| (CAR #14#) . #35#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #15#
                                                (CONS
                                                 (SPADCALL (QCDR |be|)
                                                           (SPADCALL 2 |n1p|
                                                                     (QREFELT $
                                                                              32))
                                                           (QREFELT $ 113))
                                                 #15#)
                                                . #35#)))
                                        (LETT #14# (CDR #14#) . #35#) (GO G190)
                                        G191 (EXIT (NREVERSE #15#))))
                                  . #35#)
                            (LETT |ncb|
                                  (PROGN
                                   (LETT #13# NIL . #35#)
                                   (SEQ (LETT |bv| NIL . #35#)
                                        (LETT #12# |cb0| . #35#) G190
                                        (COND
                                         ((OR (ATOM #12#)
                                              (PROGN
                                               (LETT |bv| (CAR #12#) . #35#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #13#
                                                (CONS
                                                 (SPADCALL |bv| |cb|
                                                           (QREFELT $ 115))
                                                 #13#)
                                                . #35#)))
                                        (LETT #12# (CDR #12#) . #35#) (GO G190)
                                        G191 (EXIT (NREVERSE #13#))))
                                  . #35#)
                            (LETT |cba|
                                  (PROGN
                                   (LETT #11# NIL . #35#)
                                   (SEQ (LETT |be| NIL . #35#)
                                        (LETT #10# |b2| . #35#) G190
                                        (COND
                                         ((OR (ATOM #10#)
                                              (PROGN
                                               (LETT |be| (CAR #10#) . #35#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #11# (CONS (QCAR |be|) #11#)
                                                . #35#)))
                                        (LETT #10# (CDR #10#) . #35#) (GO G190)
                                        G191 (EXIT (NREVERSE #11#))))
                                  . #35#)
                            (LETT |nlba|
                                  (PROGN
                                   (LETT #9# NIL . #35#)
                                   (SEQ (LETT |bv| NIL . #35#)
                                        (LETT #8# |cb0| . #35#)
                                        (LETT |be| NIL . #35#)
                                        (LETT #7# |b2| . #35#) G190
                                        (COND
                                         ((OR (ATOM #7#)
                                              (PROGN
                                               (LETT |be| (CAR #7#) . #35#)
                                               NIL)
                                              (ATOM #8#)
                                              (PROGN
                                               (LETT |bv| (CAR #8#) . #35#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #9#
                                                (CONS
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |bv| |lba|
                                                             (QREFELT $ 116))
                                                   (SPADCALL
                                                    (SPADCALL (QCAR |be|) |j|
                                                              (QREFELT $ 102))
                                                    (QREFELT $ 27))
                                                   (QREFELT $ 71))
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL (QCDR |be|) 1
                                                               (QREFELT $ 117))
                                                     (SPADCALL (+ |j| 1)
                                                               (QREFELT $ 110))
                                                     (QREFELT $ 118))
                                                    (+ |j| 1) (QREFELT $ 102))
                                                   (QREFELT $ 27))
                                                  (QREFELT $ 71))
                                                 #9#)
                                                . #35#)))
                                        (LETT #7#
                                              (PROG1 (CDR #7#)
                                                (LETT #8# (CDR #8#) . #35#))
                                              . #35#)
                                        (GO G190) G191 (EXIT (NREVERSE #9#))))
                                  . #35#)
                            (LETT |cb| |ncb| . #35#)
                            (EXIT (LETT |lba| |nlba| . #35#)))
                       (LETT |j| (+ |j| -1) . #35#) (GO G190) G191 (EXIT NIL))
                  (LETT |nlba|
                        (PROGN
                         (LETT #6# NIL . #35#)
                         (SEQ (LETT |ba| NIL . #35#) (LETT #5# |lba| . #35#)
                              (LETT |bv| NIL . #35#) (LETT #4# |cb| . #35#)
                              G190
                              (COND
                               ((OR (ATOM #4#)
                                    (PROGN (LETT |bv| (CAR #4#) . #35#) NIL)
                                    (ATOM #5#)
                                    (PROGN (LETT |ba| (CAR #5#) . #35#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #6#
                                      (CONS
                                       (SPADCALL |ba|
                                                 (SPADCALL |bv| |a1l|
                                                           (QREFELT $ 116))
                                                 (QREFELT $ 119))
                                       #6#)
                                      . #35#)))
                              (LETT #4#
                                    (PROG1 (CDR #4#)
                                      (LETT #5# (CDR #5#) . #35#))
                                    . #35#)
                              (GO G190) G191 (EXIT (NREVERSE #6#))))
                        . #35#)
                  (EXIT
                   (PROGN
                    (LETT #3# NIL . #35#)
                    (SEQ (LETT |ba| NIL . #35#) (LETT #2# |nlba| . #35#)
                         (LETT |bv| NIL . #35#) (LETT #1# |cb| . #35#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |bv| (CAR #1#) . #35#) NIL)
                               (ATOM #2#)
                               (PROGN (LETT |ba| (CAR #2#) . #35#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT (LETT #3# (CONS (CONS |ba| |bv|) #3#) . #35#)))
                         (LETT #1#
                               (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #35#))
                               . #35#)
                         (GO G190) G191 (EXIT (NREVERSE #3#))))))))))) 

(SDEFUN |INTPAR1;expextint;MMMLL;5|
        ((|der| |Mapping| UP UP)
         (|rde| |Mapping|
          (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|Integer|) (|List| F))
         (|csolve| |Mapping| (|List| (|Vector| F)) (|Matrix| F))
         (|lg| |List| (|Fraction| UP))
         ($ |List|
          (|Record| (|:| |ratpart| (|Fraction| UP))
                    (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#1=#:G1074 NIL) (|bv| NIL) (#2=#:G1075 NIL) (|bar| NIL)
          (#3=#:G1073 NIL) (|lbar| (|List| (|Fraction| UP))) (#4=#:G1071 NIL)
          (#5=#:G1072 NIL) (|ba| NIL) (#6=#:G1070 NIL) (|j| #7=(|Integer|))
          (|lba| (|List| (|LaurentPolynomial| F UP)))
          (|cb| (|List| (|Vector| F)))
          (|nlba| (|List| #8=(|LaurentPolynomial| F UP))) (#9=#:G1069 NIL)
          (|be| NIL) (#10=#:G1068 NIL) (|ncb| (|List| (|Vector| F)))
          (#11=#:G1067 NIL) (#12=#:G1066 NIL) (#13=#:G1049 NIL)
          (|b2|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (|lgj1| (|List| F)) (|ff| (F)) (#14=#:G1065 NIL) (|lgj| (|List| F))
          (#15=#:G1048 NIL) (|gij| (F)) (|last_iter| (|Boolean|))
          (|gi| (|LaurentPolynomial| F UP)) (#16=#:G1064 NIL) (|i| NIL)
          (|n1| (|NonNegativeInteger|)) (|cba| (|List| F)) (#17=#:G1063 NIL)
          (#18=#:G1062 NIL) (|d| #7#) (|ldg| (|List| (|Integer|)))
          (#19=#:G1061 NIL) (|g2| NIL) (#20=#:G1060 NIL)
          (|vg2| (|Vector| (|LaurentPolynomial| F UP))) (|lg2| (|List| #8#))
          (#21=#:G1059 NIL) (|ghr| NIL) (#22=#:G1058 NIL) (#23=#:G1057 NIL)
          (#24=#:G1056 NIL) (|a1l| (|List| #25=(|Fraction| UP)))
          (#26=#:G1055 NIL) (#27=#:G1054 NIL) (|rs2| (|Matrix| F))
          (|rs1| (|Matrix| UP)) (|m1| (|Matrix| (|Fraction| UP)))
          (|lg1| (|List| #28=(|Fraction| UP))) (#29=#:G1053 NIL)
          (#30=#:G1052 NIL)
          (|lghr|
           (|List|
            (|Record| (|:| |answer| #25#) (|:| |logpart| #28#)
                      (|:| |specpart| (|Fraction| UP)) (|:| |polypart| UP))))
          (#31=#:G1051 NIL) (|g| NIL) (#32=#:G1050 NIL))
         (SEQ
          (EXIT
           (COND ((NULL |lg|) NIL)
                 ('T
                  (SEQ
                   (LETT |lghr|
                         (PROGN
                          (LETT #32# NIL . #33=(|INTPAR1;expextint;MMMLL;5|))
                          (SEQ (LETT |g| NIL . #33#) (LETT #31# |lg| . #33#)
                               G190
                               (COND
                                ((OR (ATOM #31#)
                                     (PROGN (LETT |g| (CAR #31#) . #33#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #32#
                                       (CONS
                                        (SPADCALL |g| |der| (QREFELT $ 48))
                                        #32#)
                                       . #33#)))
                               (LETT #31# (CDR #31#) . #33#) (GO G190) G191
                               (EXIT (NREVERSE #32#))))
                         . #33#)
                   (LETT |lg1|
                         (PROGN
                          (LETT #30# NIL . #33#)
                          (SEQ (LETT |ghr| NIL . #33#)
                               (LETT #29# |lghr| . #33#) G190
                               (COND
                                ((OR (ATOM #29#)
                                     (PROGN
                                      (LETT |ghr| (CAR #29#) . #33#)
                                      NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #30# (CONS (QVELT |ghr| 1) #30#)
                                       . #33#)))
                               (LETT #29# (CDR #29#) . #33#) (GO G190) G191
                               (EXIT (NREVERSE #30#))))
                         . #33#)
                   (LETT |m1| (SPADCALL (LIST |lg1|) (QREFELT $ 51)) . #33#)
                   (LETT |rs1| (SPADCALL |m1| (QREFELT $ 52)) . #33#)
                   (LETT |rs2| (SPADCALL |rs1| (QREFELT $ 19)) . #33#)
                   (LETT |cb| (SPADCALL |rs2| |csolve|) . #33#)
                   (LETT |a1l|
                         (PROGN
                          (LETT #27# NIL . #33#)
                          (SEQ (LETT |ghr| NIL . #33#)
                               (LETT #26# |lghr| . #33#) G190
                               (COND
                                ((OR (ATOM #26#)
                                     (PROGN
                                      (LETT |ghr| (CAR #26#) . #33#)
                                      NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #27# (CONS (QVELT |ghr| 0) #27#)
                                       . #33#)))
                               (LETT #26# (CDR #26#) . #33#) (GO G190) G191
                               (EXIT (NREVERSE #27#))))
                         . #33#)
                   (LETT |lba|
                         (PROGN
                          (LETT #24# NIL . #33#)
                          (SEQ (LETT |bv| NIL . #33#) (LETT #23# |cb| . #33#)
                               G190
                               (COND
                                ((OR (ATOM #23#)
                                     (PROGN (LETT |bv| (CAR #23#) . #33#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #24# (CONS (|spadConstant| $ 126) #24#)
                                       . #33#)))
                               (LETT #23# (CDR #23#) . #33#) (GO G190) G191
                               (EXIT (NREVERSE #24#))))
                         . #33#)
                   (LETT |lg2|
                         (PROGN
                          (LETT #22# NIL . #33#)
                          (SEQ (LETT |ghr| NIL . #33#)
                               (LETT #21# |lghr| . #33#) G190
                               (COND
                                ((OR (ATOM #21#)
                                     (PROGN
                                      (LETT |ghr| (CAR #21#) . #33#)
                                      NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #22#
                                       (CONS
                                        (SPADCALL
                                         (SPADCALL (QVELT |ghr| 3)
                                                   (QREFELT $ 95))
                                         (|INTPAR1;RF_to_GP| (QVELT |ghr| 2) $)
                                         (QREFELT $ 127))
                                        #22#)
                                       . #33#)))
                               (LETT #21# (CDR #21#) . #33#) (GO G190) G191
                               (EXIT (NREVERSE #22#))))
                         . #33#)
                   (LETT |vg2| (SPADCALL |lg2| (QREFELT $ 130)) . #33#)
                   (LETT |ldg|
                         (PROGN
                          (LETT #20# NIL . #33#)
                          (SEQ (LETT |g2| NIL . #33#) (LETT #19# |lg2| . #33#)
                               G190
                               (COND
                                ((OR (ATOM #19#)
                                     (PROGN (LETT |g2| (CAR #19#) . #33#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #20#
                                       (CONS (SPADCALL |g2| (QREFELT $ 131))
                                             #20#)
                                       . #33#)))
                               (LETT #19# (CDR #19#) . #33#) (GO G190) G191
                               (EXIT (NREVERSE #20#))))
                         . #33#)
                   (LETT |d| (SPADCALL (ELT $ 132) |ldg| (QREFELT $ 135))
                         . #33#)
                   (LETT |cba|
                         (PROGN
                          (LETT #18# NIL . #33#)
                          (SEQ (LETT |bv| NIL . #33#) (LETT #17# |cb| . #33#)
                               G190
                               (COND
                                ((OR (ATOM #17#)
                                     (PROGN (LETT |bv| (CAR #17#) . #33#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #18# (CONS (|spadConstant| $ 8) #18#)
                                       . #33#)))
                               (LETT #17# (CDR #17#) . #33#) (GO G190) G191
                               (EXIT (NREVERSE #18#))))
                         . #33#)
                   (LETT |j| |d| . #33#)
                   (SEQ
                    (EXIT
                     (SEQ G190 NIL
                          (SEQ (LETT |last_iter| 'T . #33#)
                               (LETT |n1| (LENGTH |cb|) . #33#)
                               (LETT |lgj| NIL . #33#)
                               (SEQ (LETT |i| 1 . #33#)
                                    (LETT #16# (QVSIZE |vg2|) . #33#) G190
                                    (COND ((|greater_SI| |i| #16#) (GO G191)))
                                    (SEQ
                                     (LETT |gi|
                                           (SPADCALL |vg2| |i| (QREFELT $ 136))
                                           . #33#)
                                     (LETT |gij| (|spadConstant| $ 8) . #33#)
                                     (COND
                                      ((SPADCALL |gi| (|spadConstant| $ 126)
                                                 (QREFELT $ 137))
                                       (SEQ (LETT |last_iter| NIL . #33#)
                                            (EXIT
                                             (COND
                                              ((EQL
                                                (SPADCALL |gi| (QREFELT $ 131))
                                                |j|)
                                               (SEQ
                                                (LETT |gij|
                                                      (SPADCALL |gi|
                                                                (QREFELT $
                                                                         138))
                                                      . #33#)
                                                (EXIT
                                                 (SPADCALL |vg2| |i|
                                                           (SPADCALL |gi|
                                                                     (QREFELT $
                                                                              139))
                                                           (QREFELT $
                                                                    140))))))))))
                                     (EXIT
                                      (LETT |lgj| (CONS |gij| |lgj|) . #33#)))
                                    (LETT |i| (|inc_SI| |i|) . #33#) (GO G190)
                                    G191 (EXIT NIL))
                               (EXIT
                                (COND
                                 (|last_iter|
                                  (PROGN
                                   (LETT #15# |$NoValue| . #33#)
                                   (GO #34=#:G1041)))
                                 ('T
                                  (SEQ (LETT |lgj| (NREVERSE |lgj|) . #33#)
                                       (LETT |lgj1| NIL . #33#)
                                       (SEQ (LETT |bv| NIL . #33#)
                                            (LETT #14# |cb| . #33#) G190
                                            (COND
                                             ((OR (ATOM #14#)
                                                  (PROGN
                                                   (LETT |bv| (CAR #14#)
                                                         . #33#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (LETT |ff|
                                                   (SPADCALL |bv| |lgj|
                                                             (QREFELT $ 109))
                                                   . #33#)
                                             (EXIT
                                              (LETT |lgj1| (CONS |ff| |lgj1|)
                                                    . #33#)))
                                            (LETT #14# (CDR #14#) . #33#)
                                            (GO G190) G191 (EXIT NIL))
                                       (LETT |lgj1| (NREVERSE |lgj1|) . #33#)
                                       (LETT |b2| (SPADCALL |j| |lgj1| |rde|)
                                             . #33#)
                                       (EXIT
                                        (COND
                                         ((NULL |b2|)
                                          (PROGN
                                           (LETT #13# NIL . #33#)
                                           (GO #35=#:G1047)))
                                         ('T
                                          (SEQ
                                           (LETT |ncb|
                                                 (PROGN
                                                  (LETT #12# NIL . #33#)
                                                  (SEQ (LETT |be| NIL . #33#)
                                                       (LETT #11# |b2| . #33#)
                                                       G190
                                                       (COND
                                                        ((OR (ATOM #11#)
                                                             (PROGN
                                                              (LETT |be|
                                                                    (CAR #11#)
                                                                    . #33#)
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #12#
                                                               (CONS
                                                                (SPADCALL
                                                                 (QCDR |be|)
                                                                 |cb|
                                                                 (QREFELT $
                                                                          115))
                                                                #12#)
                                                               . #33#)))
                                                       (LETT #11# (CDR #11#)
                                                             . #33#)
                                                       (GO G190) G191
                                                       (EXIT (NREVERSE #12#))))
                                                 . #33#)
                                           (LETT |nlba|
                                                 (PROGN
                                                  (LETT #10# NIL . #33#)
                                                  (SEQ (LETT |be| NIL . #33#)
                                                       (LETT #9# |b2| . #33#)
                                                       G190
                                                       (COND
                                                        ((OR (ATOM #9#)
                                                             (PROGN
                                                              (LETT |be|
                                                                    (CAR #9#)
                                                                    . #33#)
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #10#
                                                               (CONS
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (QCDR |be|)
                                                                  |lba|
                                                                  (QREFELT $
                                                                           141))
                                                                 (SPADCALL
                                                                  (QCAR |be|)
                                                                  |j|
                                                                  (QREFELT $
                                                                           142))
                                                                 (QREFELT $
                                                                          127))
                                                                #10#)
                                                               . #33#)))
                                                       (LETT #9# (CDR #9#)
                                                             . #33#)
                                                       (GO G190) G191
                                                       (EXIT (NREVERSE #10#))))
                                                 . #33#)
                                           (LETT |cb| |ncb| . #33#)
                                           (LETT |lba| |nlba| . #33#)
                                           (EXIT
                                            (LETT |j| (- |j| 1)
                                                  . #33#)))))))))))
                          NIL (GO G190) G191 (EXIT NIL)))
                    #34# (EXIT #15#))
                   (LETT |lbar|
                         (PROGN
                          (LETT #6# NIL . #33#)
                          (SEQ (LETT |ba| NIL . #33#) (LETT #5# |lba| . #33#)
                               (LETT |bv| NIL . #33#) (LETT #4# |cb| . #33#)
                               G190
                               (COND
                                ((OR (ATOM #4#)
                                     (PROGN (LETT |bv| (CAR #4#) . #33#) NIL)
                                     (ATOM #5#)
                                     (PROGN (LETT |ba| (CAR #5#) . #33#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #6#
                                       (CONS
                                        (SPADCALL
                                         (SPADCALL |ba| (QREFELT $ 143))
                                         (SPADCALL |bv| |a1l| (QREFELT $ 116))
                                         (QREFELT $ 119))
                                        #6#)
                                       . #33#)))
                               (LETT #4#
                                     (PROG1 (CDR #4#)
                                       (LETT #5# (CDR #5#) . #33#))
                                     . #33#)
                               (GO G190) G191 (EXIT (NREVERSE #6#))))
                         . #33#)
                   (EXIT
                    (PROGN
                     (LETT #3# NIL . #33#)
                     (SEQ (LETT |bar| NIL . #33#) (LETT #2# |lbar| . #33#)
                          (LETT |bv| NIL . #33#) (LETT #1# |cb| . #33#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |bv| (CAR #1#) . #33#) NIL)
                                (ATOM #2#)
                                (PROGN (LETT |bar| (CAR #2#) . #33#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3# (CONS (CONS |bar| |bv|) #3#) . #33#)))
                          (LETT #1#
                                (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #33#))
                                . #33#)
                          (GO G190) G191 (EXIT (NREVERSE #3#)))))))))
          #35# (EXIT #13#)))) 

(SDEFUN |INTPAR1;diffextint1|
        ((|trim| |Mapping| UP (|Fraction| UP))
         (|ext| |Mapping|
          #1=(|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| UP))
         (|csolve| |Mapping| #2=(|List| (|Vector| F)) (|Matrix| F))
         (|lg| |List| (|Fraction| UP))
         ($ |List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#3=#:G1091 NIL) (|re| NIL) (#4=#:G1090 NIL) (|res1| #1#)
          (|lup1| (|List| UP)) (#5=#:G1089 NIL) (|bv| NIL) (#6=#:G1088 NIL)
          (|cb| #2#) (|rs2| (|Matrix| F)) (|rs1| (|Matrix| UP))
          (|m1| (|Matrix| (|Fraction| UP))) (|lg1| (|List| (|Fraction| UP)))
          (#7=#:G1086 NIL) (|g| NIL) (#8=#:G1087 NIL) (|up| NIL)
          (#9=#:G1085 NIL) (|lup| (|List| UP)) (#10=#:G1084 NIL)
          (#11=#:G1083 NIL))
         (SEQ
          (LETT |lup|
                (PROGN
                 (LETT #11# NIL . #12=(|INTPAR1;diffextint1|))
                 (SEQ (LETT |g| NIL . #12#) (LETT #10# |lg| . #12#) G190
                      (COND
                       ((OR (ATOM #10#)
                            (PROGN (LETT |g| (CAR #10#) . #12#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #11# (CONS (SPADCALL |g| |trim|) #11#) . #12#)))
                      (LETT #10# (CDR #10#) . #12#) (GO G190) G191
                      (EXIT (NREVERSE #11#))))
                . #12#)
          (LETT |lg1|
                (PROGN
                 (LETT #9# NIL . #12#)
                 (SEQ (LETT |up| NIL . #12#) (LETT #8# |lup| . #12#)
                      (LETT |g| NIL . #12#) (LETT #7# |lg| . #12#) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |g| (CAR #7#) . #12#) NIL)
                            (ATOM #8#)
                            (PROGN (LETT |up| (CAR #8#) . #12#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #9#
                              (CONS
                               (SPADCALL |g| (SPADCALL |up| (QREFELT $ 27))
                                         (QREFELT $ 119))
                               #9#)
                              . #12#)))
                      (LETT #7# (PROG1 (CDR #7#) (LETT #8# (CDR #8#) . #12#))
                            . #12#)
                      (GO G190) G191 (EXIT (NREVERSE #9#))))
                . #12#)
          (LETT |m1| (SPADCALL (LIST |lg1|) (QREFELT $ 51)) . #12#)
          (LETT |rs1| (SPADCALL |m1| (QREFELT $ 52)) . #12#)
          (LETT |rs2| (SPADCALL |rs1| (QREFELT $ 19)) . #12#)
          (LETT |cb| (SPADCALL |rs2| |csolve|) . #12#)
          (LETT |lup1|
                (PROGN
                 (LETT #6# NIL . #12#)
                 (SEQ (LETT |bv| NIL . #12#) (LETT #5# |cb| . #12#) G190
                      (COND
                       ((OR (ATOM #5#)
                            (PROGN (LETT |bv| (CAR #5#) . #12#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6#
                              (CONS (SPADCALL |bv| |lup| (QREFELT $ 146)) #6#)
                              . #12#)))
                      (LETT #5# (CDR #5#) . #12#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #12#)
          (LETT |res1| (SPADCALL |lup1| |ext|) . #12#)
          (EXIT
           (PROGN
            (LETT #4# NIL . #12#)
            (SEQ (LETT |re| NIL . #12#) (LETT #3# |res1| . #12#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |re| (CAR #3#) . #12#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #4#
                         (CONS
                          (CONS (QCAR |re|)
                                (SPADCALL (QCDR |re|) |cb| (QREFELT $ 115)))
                          #4#)
                         . #12#)))
                 (LETT #3# (CDR #3#) . #12#) (GO G190) G191
                 (EXIT (NREVERSE #4#)))))))) 

(SDEFUN |INTPAR1;lin_part| ((|f| |Fraction| UP) ($ UP))
        (SPROG ((|p| (UP)))
               (SEQ
                (LETT |p|
                      (SPADCALL (SPADCALL |f| (QREFELT $ 83))
                                (SPADCALL |f| (QREFELT $ 55)) (QREFELT $ 147))
                      |INTPAR1;lin_part|)
                (EXIT
                 (SPADCALL
                  (SPADCALL (SPADCALL |p| 1 (QREFELT $ 11)) 1 (QREFELT $ 102))
                  (SPADCALL (SPADCALL |p| 0 (QREFELT $ 11)) (QREFELT $ 12))
                  (QREFELT $ 74)))))) 

(SDEFUN |INTPAR1;diffextint;MMLL;8|
        ((|ext| |Mapping|
          (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| UP))
         (|csolve| |Mapping| (|List| (|Vector| F)) (|Matrix| F))
         (|lg| |List| (|Fraction| UP))
         ($ |List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
        (|INTPAR1;diffextint1| (CONS #'|INTPAR1;diffextint;MMLL;8!0| $) |ext|
         |csolve| |lg| $)) 

(SDEFUN |INTPAR1;diffextint;MMLL;8!0| ((|x| NIL) ($ NIL))
        (|INTPAR1;lin_part| |x| $)) 

(SDEFUN |INTPAR1;coeff0| ((|f| |Fraction| UP) ($ UP))
        (SPROG ((|p| (UP)))
               (SEQ
                (LETT |p|
                      (SPADCALL (SPADCALL |f| (QREFELT $ 83))
                                (SPADCALL |f| (QREFELT $ 55)) (QREFELT $ 147))
                      |INTPAR1;coeff0|)
                (EXIT
                 (SPADCALL (SPADCALL |p| 0 (QREFELT $ 11)) (QREFELT $ 12)))))) 

(SDEFUN |INTPAR1;unkextint;MMLL;10|
        ((|ext| |Mapping|
          (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| F))
         (|csolve| |Mapping| (|List| (|Vector| F)) (|Matrix| F))
         (|lg| |List| (|Fraction| UP))
         ($ |List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((|ext1|
           (|Mapping|
            (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
            (|List| UP))))
         (SEQ
          (LETT |ext1| (CONS #'|INTPAR1;unkextint;MMLL;10!0| (VECTOR |ext| $))
                |INTPAR1;unkextint;MMLL;10|)
          (EXIT
           (|INTPAR1;diffextint1| (CONS #'|INTPAR1;unkextint;MMLL;10!1| $)
            |ext1| |csolve| |lg| $))))) 

(SDEFUN |INTPAR1;unkextint;MMLL;10!1| ((|x| NIL) ($ NIL))
        (|INTPAR1;coeff0| |x| $)) 

(SDEFUN |INTPAR1;unkextint;MMLL;10!0| ((|lup| NIL) ($$ NIL))
        (PROG ($ |ext|)
          (LETT $ (QREFELT $$ 1) . #1=(|INTPAR1;unkextint;MMLL;10|))
          (LETT |ext| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|lf| NIL) (#2=#:G1106 NIL) (|p| NIL) (#3=#:G1105 NIL))
                   (SEQ
                    (LETT |lf|
                          (PROGN
                           (LETT #3# NIL NIL)
                           (SEQ (LETT |p| NIL NIL) (LETT #2# |lup| NIL) G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |p| (CAR #2#) NIL) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #3#
                                        (CONS (SPADCALL |p| (QREFELT $ 103))
                                              #3#)
                                        NIL)))
                                (LETT #2# (CDR #2#) NIL) (GO G190) G191
                                (EXIT (NREVERSE #3#))))
                          NIL)
                    (EXIT (SPADCALL |lf| |ext|)))))))) 

(DECLAIM (NOTINLINE |ParametricTranscendentalIntegration;|)) 

(DEFUN |ParametricTranscendentalIntegration| (&REST #1=#:G1112)
  (SPROG NIL
         (PROG (#2=#:G1113)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ParametricTranscendentalIntegration|)
                                               '|domainEqualList|)
                    . #3=(|ParametricTranscendentalIntegration|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |ParametricTranscendentalIntegration;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ParametricTranscendentalIntegration|)))))))))) 

(DEFUN |ParametricTranscendentalIntegration;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|ParametricTranscendentalIntegration|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|ParametricTranscendentalIntegration| DV$1 DV$2)
                . #1#)
          (LETT $ (GETREFV 152) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache|
                      '|ParametricTranscendentalIntegration| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|ParametricTranscendentalIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |Zero|) (4 . |Zero|) (|NonNegativeInteger|)
              (8 . |coefficient|) (14 . |coerce|) (19 . -) (|List| 40)
              (|Matrix| 7) (25 . |matrix|) (|Matrix| 6) (|Matrix| $)
              (30 . |reducedSystem|) (|Vector| 24) (|List| 6)
              (|LinearCombinationUtilities| 6 7) (35 . |lin_comb|)
              (|Fraction| 30) (41 . |Zero|) (|Fraction| 7) (45 . |coerce|)
              (50 . |One|) (54 . |One|) (|Integer|) (|UniversalSegment| 30)
              (58 . SEGMENT) (64 . |elt|) (|List| 20)
              (|LinearCombinationUtilities| 24
                                            (|SparseUnivariatePolynomial| 24))
              (70 . |lin_comb|) (76 . |elt|) (82 . |setelt!|)
              (|Record| (|:| |logands| 53) (|:| |basis| 34)) (|List| 7)
              (|Mapping| 34 17) (|Record| (|:| |logands| 21) (|:| |basis| 34))
              (|Mapping| 42 21) |INTPAR1;monologextint;LMMR;1|
              (|Record| (|:| |answer| 26) (|:| |logpart| 26)
                        (|:| |specpart| 26) (|:| |polypart| 7))
              (|Mapping| 7 7) (|TranscendentalHermiteIntegration| 6 7)
              (89 . |HermiteIntegrate|) (|List| 53) (|Matrix| 26)
              (95 . |matrix|) (100 . |reducedSystem|) (|List| 26)
              (105 . |lin_comb|) (111 . |denom|) (|Vector| 7) (116 . |vector|)
              (|Record| (|:| |basis| 56) (|:| |transform| 81)) (|GcdBasis| 7)
              (121 . |gcdDecomposition|) (126 . |entries|)
              (|Record| (|:| |factor| 7) (|:| |exponent| 30)) (|List| 62)
              (|Factored| 7) (131 . |factors|) (136 . |concat|)
              (142 . |concat|) (148 . |concat|) (|Mapping| 40 40 40)
              (154 . |reduce|) (161 . +) (167 . +) (173 . +) (179 . +)
              (185 . +) (|Mapping| 10 10 10) (|List| 10) (191 . |reduce|)
              (|Boolean|) (198 . >) (|Matrix| 30) (204 . |elt|) (211 . |numer|)
              (|PartialFractionUtilities| 6 7) (216 . |decompose|)
              (222 . |setelt!|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (230 . |divide|) (236 . /) (242 . |retract|) (|Mapping| 64 7)
              (|Mapping| 39 40) |INTPAR1;logextint;MMMMLR;2|
              (|LaurentPolynomial| 6 7) (247 . |coerce|) (|Union| $ '"failed")
              (252 . |exquo|) (258 . |Zero|) (262 . |degree|) (267 . |max|)
              (273 . |reduce|) (279 . |monomial|) (285 . |retract|)
              (290 . |elt|) (296 . |leadingCoefficient|) (301 . |reductum|)
              (306 . |setelt!|) (|Vector| 6) (313 . |lin_comb|)
              (319 . |coerce|) (324 . *) (330 . +) (336 . |elt|) (|List| 108)
              (342 . |lin_comb|) (348 . |lin_comb|) (354 . |elt|) (360 . /)
              (366 . -) (|Record| (|:| |ratpart| 26) (|:| |coeffs| 108))
              (|List| 120) (|Record| (|:| |ratpart| 6) (|:| |coeffs| 108))
              (|Mapping| 148 21) (|Mapping| 114 17)
              |INTPAR1;primextint;MMMLL;4| (372 . |Zero|) (376 . +) (|List| 94)
              (|Vector| 94) (382 . |vector|) (387 . |degree|) (392 . |max|)
              (|Mapping| 30 30 30) (|List| 30) (398 . |reduce|) (404 . |elt|)
              (410 . ~=) (416 . |leadingCoefficient|) (421 . |reductum|)
              (426 . |setelt!|) (433 . |lin_comb|) (439 . |monomial|)
              (445 . |convert|) (|Mapping| 148 30 21)
              |INTPAR1;expextint;MMMLL;5| (450 . |lin_comb|) (456 . |quo|)
              (|List| 122) (|Mapping| 148 40) |INTPAR1;diffextint;MMLL;8|
              |INTPAR1;unkextint;MMLL;10|)
           '#(|unkextint| 462 |primextint| 469 |monologextint| 477 |logextint|
              484 |expextint| 493 |diffextint| 501)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 151
                                                 '(0 6 0 8 0 7 0 9 2 7 6 0 10
                                                   11 1 7 0 6 12 2 7 0 0 0 13 1
                                                   15 0 14 16 1 7 17 18 19 2 22
                                                   6 20 21 23 0 24 0 25 1 26 0
                                                   7 27 0 6 0 28 0 7 0 29 2 31
                                                   0 30 30 32 2 20 0 0 31 33 2
                                                   35 20 20 34 36 2 20 24 0 30
                                                   37 3 20 24 0 30 24 38 2 47
                                                   45 26 46 48 1 50 0 49 51 1
                                                   26 15 18 52 2 22 26 20 53 54
                                                   1 26 7 0 55 1 56 0 40 57 1
                                                   59 58 56 60 1 56 40 0 61 1
                                                   64 63 0 65 2 20 0 0 0 66 2
                                                   53 0 0 0 67 2 40 0 0 0 68 3
                                                   14 40 69 0 40 70 2 26 0 0 0
                                                   71 2 24 0 0 0 72 2 20 0 0 0
                                                   73 2 7 0 0 0 74 2 10 0 0 0
                                                   75 3 77 10 76 0 10 78 2 30
                                                   79 0 0 80 3 81 30 0 30 30 82
                                                   1 26 7 0 83 2 84 40 7 40 85
                                                   4 15 7 0 30 30 7 86 2 7 87 0
                                                   0 88 2 26 0 7 7 89 1 26 7 0
                                                   90 1 94 0 7 95 2 94 96 0 0
                                                   97 0 26 0 98 1 7 10 0 99 2
                                                   10 0 0 0 100 2 77 10 76 0
                                                   101 2 7 0 6 10 102 1 7 6 0
                                                   103 2 56 7 0 30 104 1 7 6 0
                                                   105 1 7 0 0 106 3 56 7 0 30
                                                   7 107 2 22 6 108 21 109 1 6
                                                   0 30 110 2 6 0 0 0 111 2 6 0
                                                   0 0 112 2 108 0 0 31 113 2
                                                   22 108 108 114 115 2 22 26
                                                   108 53 116 2 108 6 0 30 117
                                                   2 6 0 0 0 118 2 26 0 0 0 119
                                                   0 94 0 126 2 94 0 0 0 127 1
                                                   129 0 128 130 1 94 30 0 131
                                                   2 30 0 0 0 132 2 134 30 133
                                                   0 135 2 129 94 0 30 136 2 94
                                                   79 0 0 137 1 94 6 0 138 1 94
                                                   0 0 139 3 129 94 0 30 94 140
                                                   2 22 94 108 128 141 2 94 0 6
                                                   30 142 1 94 26 0 143 2 22 7
                                                   108 40 146 2 7 0 0 0 147 3 0
                                                   148 123 124 53 151 4 0 121
                                                   46 123 124 53 125 3 0 39 40
                                                   41 43 44 5 0 39 46 91 41 92
                                                   53 93 4 0 121 46 144 124 53
                                                   145 3 0 148 149 124 53
                                                   150)))))
           '|lookupComplete|)) 
