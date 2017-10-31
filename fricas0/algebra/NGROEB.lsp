
(SDEFUN |NGROEB;lcmCo|
        ((|c1| |Dom|) (|c2| |Dom|)
         ($ |Record| (|:| |co1| |Dom|) (|:| |co2| |Dom|)))
        (SPROG
         ((|lcc|
           (|Record| (|:| |llcm_res| |Dom|) (|:| |coeff1| |Dom|)
                     (|:| |coeff2| |Dom|))))
         (SEQ (LETT |lcc| (SPADCALL |c1| |c2| (QREFELT $ 11)) |NGROEB;lcmCo|)
              (EXIT (CONS (QVELT |lcc| 1) (QVELT |lcc| 2)))))) 

(SDEFUN |NGROEB;virtualDegree;DpolNni;2|
        ((|p| |Dpol|) ($ |NonNegativeInteger|)) (SPADCALL |p| (QREFELT $ 13))) 

(PUT '|NGROEB;virtualDegree;DpolNni;3| '|SPADreplace| '(XLAM (|p|) 0)) 

(SDEFUN |NGROEB;virtualDegree;DpolNni;3|
        ((|p| |Dpol|) ($ |NonNegativeInteger|)) 0) 

(SDEFUN |NGROEB;critpOrder|
        ((|cp1| |Record| (|:| |lcmfij| |Expon|)
          (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
          (|:| |polj| |Dpol|))
         (|cp2| |Record| (|:| |lcmfij| |Expon|)
          (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
          (|:| |polj| |Dpol|))
         ($ |Boolean|))
        (COND ((< (QVELT |cp1| 1) (QVELT |cp2| 1)) 'T)
              ((< (QVELT |cp2| 1) (QVELT |cp1| 1)) NIL)
              ('T (SPADCALL (QVELT |cp1| 0) (QVELT |cp2| 0) (QREFELT $ 16))))) 

(SDEFUN |NGROEB;makeCrit|
        ((|sp1| |Record| (|:| |totdeg| (|NonNegativeInteger|))
          (|:| |pol| |Dpol|))
         (|p2| |Dpol|) (|totdeg2| |NonNegativeInteger|)
         ($ |Record| (|:| |lcmfij| |Expon|)
          (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
          (|:| |polj| |Dpol|)))
        (SPROG
         ((|tdeg| (|NonNegativeInteger|)) (|e2| (|Expon|)) (#1=#:G711 NIL)
          (|e1| (|Expon|)) (|deg| (|Expon|)) (|p1| (|Dpol|)))
         (SEQ (LETT |p1| (QCDR |sp1|) . #2=(|NGROEB;makeCrit|))
              (LETT |deg|
                    (SPADCALL (SPADCALL |p1| (QREFELT $ 17))
                              (SPADCALL |p2| (QREFELT $ 17)) (QREFELT $ 18))
                    . #2#)
              (LETT |e1|
                    (PROG2
                        (LETT #1#
                              (SPADCALL |deg| (SPADCALL |p1| (QREFELT $ 17))
                                        (QREFELT $ 20))
                              . #2#)
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                      (|Union| (QREFELT $ 7) #3="failed") #1#))
                    . #2#)
              (LETT |e2|
                    (PROG2
                        (LETT #1#
                              (SPADCALL |deg| (SPADCALL |p2| (QREFELT $ 17))
                                        (QREFELT $ 20))
                              . #2#)
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                      (|Union| (QREFELT $ 7) #3#) #1#))
                    . #2#)
              (LETT |tdeg|
                    (MAX
                     (+ (QCAR |sp1|)
                        (SPADCALL
                         (SPADCALL (|spadConstant| $ 21) |e1| (QREFELT $ 23))
                         (QREFELT $ 14)))
                     (+ |totdeg2|
                        (SPADCALL
                         (SPADCALL (|spadConstant| $ 21) |e2| (QREFELT $ 23))
                         (QREFELT $ 14))))
                    . #2#)
              (EXIT (VECTOR |deg| |tdeg| |p1| |p2|))))) 

(SDEFUN |NGROEB;gbasis| ((|Pol| |List| |Dpol|) ($ |List| |Dpol|))
        (SPROG
         ((#1=#:G765 NIL) (|x| NIL) (#2=#:G764 NIL) (|redPols| (|List| |Dpol|))
          (|basPols|
           (|List|
            (|Record| (|:| |totdeg| (|NonNegativeInteger|))
                      (|:| |pol| |Dpol|))))
          (D
           (|List|
            (|Record| (|:| |lcmfij| |Expon|)
                      (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                      (|:| |polj| |Dpol|))))
          (D1
           (|List|
            (|Record| (|:| |lcmfij| |Expon|)
                      (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                      (|:| |polj| |Dpol|))))
          (#3=#:G763 NIL) (#4=#:G762 NIL) (#5=#:G757 NIL) (|h| (|Dpol|))
          (|s| (|Dpol|))
          (D0
           (|Record| (|:| |lcmfij| |Expon|)
                     (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                     (|:| |polj| |Dpol|)))
          (#6=#:G761 NIL) (#7=#:G760 NIL) (#8=#:G759 NIL) (#9=#:G758 NIL)
          (|toth| (|NonNegativeInteger|)) (|Pol1| (|List| |Dpol|)))
         (SEQ
          (LETT |Pol1|
                (SPADCALL (CONS #'|NGROEB;gbasis!0| $) |Pol| (QREFELT $ 27))
                . #10=(|NGROEB;gbasis|))
          (LETT |basPols|
                (|NGROEB;updatF| (SPADCALL (|SPADfirst| |Pol1|) (QREFELT $ 28))
                 (SPADCALL (|SPADfirst| |Pol1|) (QREFELT $ 14)) NIL $)
                . #10#)
          (LETT |Pol1| (CDR |Pol1|) . #10#) (LETT D NIL . #10#)
          (SEQ G190 (COND ((NULL |Pol1|) (GO G191)))
               (SEQ
                (LETT |h| (SPADCALL (|SPADfirst| |Pol1|) (QREFELT $ 28))
                      . #10#)
                (LETT |Pol1| (CDR |Pol1|) . #10#)
                (LETT |toth| (SPADCALL |h| (QREFELT $ 14)) . #10#)
                (LETT D1
                      (PROGN
                       (LETT #9# NIL . #10#)
                       (SEQ (LETT |x| NIL . #10#) (LETT #8# |basPols| . #10#)
                            G190
                            (COND
                             ((OR (ATOM #8#)
                                  (PROGN (LETT |x| (CAR #8#) . #10#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #9#
                                    (CONS (|NGROEB;makeCrit| |x| |h| |toth| $)
                                          #9#)
                                    . #10#)))
                            (LETT #8# (CDR #8#) . #10#) (GO G190) G191
                            (EXIT (NREVERSE #9#))))
                      . #10#)
                (LETT D
                      (|NGROEB;updatD|
                       (SPADCALL (CONS (|function| |NGROEB;critpOrder|) $) D1
                                 (QREFELT $ 32))
                       D $)
                      . #10#)
                (EXIT
                 (LETT |basPols| (|NGROEB;updatF| |h| |toth| |basPols| $)
                       . #10#)))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT D
                (SPADCALL (CONS (|function| |NGROEB;critpOrder|) $) D
                          (QREFELT $ 32))
                . #10#)
          (LETT |redPols|
                (PROGN
                 (LETT #7# NIL . #10#)
                 (SEQ (LETT |x| NIL . #10#) (LETT #6# |basPols| . #10#) G190
                      (COND
                       ((OR (ATOM #6#) (PROGN (LETT |x| (CAR #6#) . #10#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #7# (CONS (QCDR |x|) #7#) . #10#)))
                      (LETT #6# (CDR #6#) . #10#) (GO G190) G191
                      (EXIT (NREVERSE #7#))))
                . #10#)
          (SEQ
           (EXIT
            (SEQ G190 (COND ((NULL D) (GO G191)))
                 (SEQ (LETT D0 (|SPADfirst| D) . #10#)
                      (LETT |s|
                            (SPADCALL (SPADCALL D0 (QREFELT $ 33))
                                      (QREFELT $ 28))
                            . #10#)
                      (LETT D (CDR D) . #10#)
                      (LETT |h|
                            (SPADCALL (SPADCALL |s| |redPols| (QREFELT $ 34))
                                      (QREFELT $ 28))
                            . #10#)
                      (EXIT
                       (COND
                        ((SPADCALL |h| (|spadConstant| $ 37) (QREFELT $ 38))
                         "iterate")
                        ((SPADCALL (SPADCALL |h| (QREFELT $ 17))
                                   (|spadConstant| $ 36) (QREFELT $ 39))
                         (SEQ (LETT D NIL . #10#)
                              (LETT |basPols| (|NGROEB;updatF| |h| 0 NIL $)
                                    . #10#)
                              (EXIT
                               (PROGN
                                (LETT #5# |$NoValue| . #10#)
                                (GO #11=#:G753)))))
                        ('T
                         (SEQ
                          (LETT D1
                                (PROGN
                                 (LETT #4# NIL . #10#)
                                 (SEQ (LETT |x| NIL . #10#)
                                      (LETT #3# |basPols| . #10#) G190
                                      (COND
                                       ((OR (ATOM #3#)
                                            (PROGN
                                             (LETT |x| (CAR #3#) . #10#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #4#
                                              (CONS
                                               (|NGROEB;makeCrit| |x| |h|
                                                (QVELT D0 1) $)
                                               #4#)
                                              . #10#)))
                                      (LETT #3# (CDR #3#) . #10#) (GO G190)
                                      G191 (EXIT (NREVERSE #4#))))
                                . #10#)
                          (LETT D
                                (|NGROEB;updatD|
                                 (SPADCALL
                                  (CONS (|function| |NGROEB;critpOrder|) $) D1
                                  (QREFELT $ 32))
                                 D $)
                                . #10#)
                          (LETT |basPols|
                                (|NGROEB;updatF| |h| (QVELT D0 1) |basPols| $)
                                . #10#)
                          (EXIT
                           (LETT |redPols|
                                 (SPADCALL |redPols| |h| (QREFELT $ 40))
                                 . #10#)))))))
                 NIL (GO G190) G191 (EXIT NIL)))
           #11# (EXIT #5#))
          (LETT |Pol|
                (PROGN
                 (LETT #2# NIL . #10#)
                 (SEQ (LETT |x| NIL . #10#) (LETT #1# |basPols| . #10#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #10#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QCDR |x|) #2#) . #10#)))
                      (LETT #1# (CDR #1#) . #10#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #10#)
          (EXIT |Pol|)))) 

(SDEFUN |NGROEB;gbasis!0| ((|z1| NIL) (|z2| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 17)) (SPADCALL |z2| (QREFELT $ 17))
                  (QREFELT $ 24))) 

(SDEFUN |NGROEB;minGbasis| ((F |List| |Dpol|) ($ . #1=(|List| |Dpol|)))
        (SPROG ((|newbas| #1#))
               (SEQ
                (COND ((NULL F) NIL)
                      ('T
                       (SEQ
                        (LETT |newbas| (|NGROEB;minGbasis| (CDR F) $)
                              |NGROEB;minGbasis|)
                        (EXIT
                         (CONS
                          (SPADCALL
                           (|NGROEB;credPol| (|SPADfirst| F) |newbas| $)
                           (QREFELT $ 28))
                          |newbas|)))))))) 

(SDEFUN |NGROEB;groebner;2L;8| ((F |List| |Dpol|) ($ |List| |Dpol|))
        (|NGROEB;minGbasis|
         (SPADCALL (CONS #'|NGROEB;groebner;2L;8!0| $) (|NGROEB;gbasis| F $)
                   (QREFELT $ 27))
         $)) 

(SDEFUN |NGROEB;groebner;2L;8!0| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x| (QREFELT $ 17)) (SPADCALL |y| (QREFELT $ 17))
                  (QREFELT $ 24))) 

(SDEFUN |NGROEB;sPol;RDpol;9|
        ((|p| |Record| (|:| |lcmfij| |Expon|)
          (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
          (|:| |polj| |Dpol|))
         ($ |Dpol|))
        (SPROG
         ((|cc| (|Record| (|:| |co1| |Dom|) (|:| |co2| |Dom|))) (|fj| (|Dpol|))
          (#1=#:G772 NIL) (|fi| (|Dpol|)) (|Tij| (|Expon|)))
         (SEQ (LETT |Tij| (QVELT |p| 0) . #2=(|NGROEB;sPol;RDpol;9|))
              (LETT |fi| (QVELT |p| 2) . #2#) (LETT |fj| (QVELT |p| 3) . #2#)
              (LETT |fi|
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 21)
                               (PROG2
                                   (LETT #1#
                                         (SPADCALL |Tij|
                                                   (SPADCALL |fi|
                                                             (QREFELT $ 17))
                                                   (QREFELT $ 20))
                                         . #2#)
                                   (QCDR #1#)
                                 (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                                 (|Union| (QREFELT $ 7)
                                                          #3="failed")
                                                 #1#))
                               (QREFELT $ 23))
                     |fi| (QREFELT $ 42))
                    . #2#)
              (LETT |fj|
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 21)
                               (PROG2
                                   (LETT #1#
                                         (SPADCALL |Tij|
                                                   (SPADCALL |fj|
                                                             (QREFELT $ 17))
                                                   (QREFELT $ 20))
                                         . #2#)
                                   (QCDR #1#)
                                 (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                                 (|Union| (QREFELT $ 7) #3#)
                                                 #1#))
                               (QREFELT $ 23))
                     |fj| (QREFELT $ 42))
                    . #2#)
              (LETT |cc|
                    (|NGROEB;lcmCo| (SPADCALL |fi| (QREFELT $ 43))
                     (SPADCALL |fj| (QREFELT $ 43)) $)
                    . #2#)
              (EXIT
               (SPADCALL (SPADCALL (QCAR |cc|) |fi| (QREFELT $ 44))
                         (SPADCALL (QCDR |cc|) |fj| (QREFELT $ 44))
                         (QREFELT $ 45)))))) 

(SDEFUN |NGROEB;redPo|
        ((|s| |Dpol|) (F . #1=(|List| |Dpol|))
         ($ |Record| (|:| |poly| |Dpol|) (|:| |mult| |Dom|)))
        (SPROG
         ((|m| (|Dom|)) (|cc| (|Record| (|:| |co1| |Dom|) (|:| |co2| |Dom|)))
          (|f2| (|Dpol|)) (|e| (|Union| |Expon| "failed")) (|d1| (|Expon|))
          (|s1| (|Expon|)) (|f1| (|Dpol|)) (|Fh| #1#))
         (SEQ (LETT |m| (|spadConstant| $ 21) . #2=(|NGROEB;redPo|))
              (LETT |Fh| F . #2#)
              (SEQ G190
                   (COND
                    ((NULL
                      (NULL
                       (OR (SPADCALL |s| (|spadConstant| $ 37) (QREFELT $ 38))
                           (NULL F))))
                     (GO G191)))
                   (SEQ (LETT |f1| (|SPADfirst| F) . #2#)
                        (LETT |s1| (SPADCALL |s| (QREFELT $ 17)) . #2#)
                        (LETT |d1| (SPADCALL |f1| (QREFELT $ 17)) . #2#)
                        (LETT |e| (SPADCALL |s1| |d1| (QREFELT $ 20)) . #2#)
                        (EXIT
                         (COND
                          ((QEQCAR |e| 0)
                           (SEQ
                            (LETT |f2|
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 21) (QCDR |e|)
                                             (QREFELT $ 23))
                                   |f1| (QREFELT $ 42))
                                  . #2#)
                            (LETT |cc|
                                  (|NGROEB;lcmCo| (SPADCALL |s| (QREFELT $ 43))
                                   (SPADCALL |f2| (QREFELT $ 43)) $)
                                  . #2#)
                            (LETT |s|
                                  (SPADCALL
                                   (SPADCALL (QCAR |cc|) |s| (QREFELT $ 44))
                                   (SPADCALL (QCDR |cc|) |f2| (QREFELT $ 44))
                                   (QREFELT $ 45))
                                  . #2#)
                            (COND
                             ((SPADCALL (SPADCALL |s| (QREFELT $ 17)) |s1|
                                        (QREFELT $ 39))
                              (SEQ
                               (SPADCALL "no progress in reduction"
                                         (QREFELT $ 48))
                               (SPADCALL (SPADCALL |s1| (QREFELT $ 49))
                                         (QREFELT $ 48))
                               (SPADCALL (SPADCALL |d1| (QREFELT $ 49))
                                         (QREFELT $ 48))
                               (SPADCALL (SPADCALL |e| (QREFELT $ 51))
                                         (QREFELT $ 48))
                               (SPADCALL
                                (SPADCALL (SPADCALL |f2| (QREFELT $ 17))
                                          (QREFELT $ 49))
                                (QREFELT $ 48))
                               (SPADCALL
                                (|coerceRe2E| |cc|
                                              (ELT
                                               (|Record|
                                                (|:| |co1| (QREFELT $ 6))
                                                (|:| |co2| (QREFELT $ 6)))
                                               0))
                                (QREFELT $ 48))
                               (SPADCALL (SPADCALL |s| (QREFELT $ 52))
                                         (QREFELT $ 48))
                               (EXIT (|error| "no progress in reduction")))))
                            (LETT |m| (SPADCALL |m| (QCAR |cc|) (QREFELT $ 53))
                                  . #2#)
                            (EXIT (LETT F |Fh| . #2#))))
                          ('T (LETT F (CDR F) . #2#)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |s| |m|))))) 

(SDEFUN |NGROEB;redPol;DpolLDpol;11|
        ((|s| |Dpol|) (F |List| |Dpol|) ($ |Dpol|))
        (|NGROEB;credPol| (QCAR (|NGROEB;redPo| |s| F $)) F $)) 

(SDEFUN |NGROEB;hMonic;2Dpol;12| ((|p| |Dpol|) ($ |Dpol|))
        (SPADCALL |p| (QREFELT $ 54))) 

(PUT '|NGROEB;hMonic;2Dpol;13| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |NGROEB;hMonic;2Dpol;13| ((|p| |Dpol|) ($ |Dpol|)) |p|) 

(SDEFUN |NGROEB;credPol| ((|h| |Dpol|) (F |List| |Dpol|) ($ |Dpol|))
        (SPROG
         ((|h0| (|Dpol|))
          (|hred| (|Record| (|:| |poly| |Dpol|) (|:| |mult| |Dom|))))
         (SEQ
          (COND ((NULL F) |h|)
                ('T
                 (SEQ
                  (LETT |h0|
                        (SPADCALL (SPADCALL |h| (QREFELT $ 43))
                                  (SPADCALL |h| (QREFELT $ 17)) (QREFELT $ 23))
                        . #1=(|NGROEB;credPol|))
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL
                           (LETT |h| (SPADCALL |h| (QREFELT $ 55)) . #1#)
                           (|spadConstant| $ 37) (QREFELT $ 56)))
                         (GO G191)))
                       (SEQ (LETT |hred| (|NGROEB;redPo| |h| F $) . #1#)
                            (LETT |h| (QCAR |hred|) . #1#)
                            (EXIT
                             (LETT |h0|
                                   (SPADCALL
                                    (SPADCALL (QCDR |hred|) |h0|
                                              (QREFELT $ 44))
                                    (SPADCALL (SPADCALL |h| (QREFELT $ 43))
                                              (SPADCALL |h| (QREFELT $ 17))
                                              (QREFELT $ 23))
                                    (QREFELT $ 57))
                                   . #1#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |h0|))))))) 

(SDEFUN |NGROEB;updatD|
        ((D1 |List|
          (|Record| (|:| |lcmfij| |Expon|)
                    (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                    (|:| |polj| |Dpol|)))
         (D2 |List|
          (|Record| (|:| |lcmfij| |Expon|)
                    (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                    (|:| |polj| |Dpol|)))
         ($ |List|
          (|Record| (|:| |lcmfij| |Expon|)
                    (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                    (|:| |polj| |Dpol|))))
        (SPROG
         ((|dl2|
           #1=(|Record| (|:| |lcmfij| |Expon|)
                        (|:| |totdeg| (|NonNegativeInteger|))
                        (|:| |poli| |Dpol|) (|:| |polj| |Dpol|)))
          (|dl1| #1#))
         (SEQ
          (COND ((NULL D1) D2) ((NULL D2) D1)
                (#2='T
                 (SEQ (LETT |dl1| (|SPADfirst| D1) . #3=(|NGROEB;updatD|))
                      (LETT |dl2| (|SPADfirst| D2) . #3#)
                      (EXIT
                       (COND
                        ((|NGROEB;critpOrder| |dl1| |dl2| $)
                         (CONS |dl1| (|NGROEB;updatD| (CDR D1) D2 $)))
                        (#2#
                         (CONS |dl2| (|NGROEB;updatD| D1 (CDR D2) $))))))))))) 

(SDEFUN |NGROEB;critM| ((|e1| |Expon|) (|e2| |Expon|) ($ |Boolean|))
        (SPROG ((|en| (|Union| |Expon| "failed")))
               (QEQCAR
                (LETT |en| (SPADCALL |e2| |e1| (QREFELT $ 20)) |NGROEB;critM|)
                0))) 

(SDEFUN |NGROEB;updatF|
        ((|h| |Dpol|) (|deg| |NonNegativeInteger|)
         (F |List|
          (|Record| (|:| |totdeg| (|NonNegativeInteger|)) (|:| |pol| |Dpol|)))
         ($ |List|
          (|Record| (|:| |totdeg| (|NonNegativeInteger|)) (|:| |pol| |Dpol|))))
        (SPROG
         ((|f1|
           (|Record| (|:| |totdeg| (|NonNegativeInteger|))
                     (|:| |pol| |Dpol|))))
         (SEQ
          (COND ((NULL F) (LIST (CONS |deg| |h|)))
                (#1='T
                 (SEQ (LETT |f1| (|SPADfirst| F) |NGROEB;updatF|)
                      (EXIT
                       (COND
                        ((|NGROEB;critM| (SPADCALL |h| (QREFELT $ 17))
                          (SPADCALL (QCDR |f1|) (QREFELT $ 17)) $)
                         (|NGROEB;updatF| |h| |deg| (CDR F) $))
                        (#1#
                         (CONS |f1|
                               (|NGROEB;updatF| |h| |deg| (CDR F) $))))))))))) 

(DECLAIM (NOTINLINE |NGroebnerPackage;|)) 

(DEFUN |NGroebnerPackage| (&REST #1=#:G810)
  (SPROG NIL
         (PROG (#2=#:G811)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|NGroebnerPackage|)
                                               '|domainEqualList|)
                    . #3=(|NGroebnerPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |NGroebnerPackage;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|NGroebnerPackage|)))))))))) 

(DEFUN |NGroebnerPackage;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|NGroebnerPackage|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|NGroebnerPackage| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 58) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|NGroebnerPackage|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|HasSignature| |#4|
                      (LIST '|totalDegree|
                            (LIST '(|NonNegativeInteger|) (|devaluate| |#4|))))
      (QSETREFV $ 14
                (CONS (|dispatchFunction| |NGROEB;virtualDegree;DpolNni;2|)
                      $)))
     ('T
      (QSETREFV $ 14
                (CONS (|dispatchFunction| |NGROEB;virtualDegree;DpolNni;3|)
                      $))))
    (COND
     ((|HasSignature| |#4|
                      (LIST '|primitivePart|
                            (LIST (|devaluate| |#4|) (|devaluate| |#4|))))
      (QSETREFV $ 28 (CONS (|dispatchFunction| |NGROEB;hMonic;2Dpol;12|) $)))
     ('T
      (QSETREFV $ 28 (CONS (|dispatchFunction| |NGROEB;hMonic;2Dpol;13|) $))))
    $))) 

(MAKEPROP '|NGroebnerPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (0 . |lcmCoef|) (|NonNegativeInteger|) (6 . |totalDegree|)
              (11 . |virtualDegree|) (|Boolean|) (16 . <) (22 . |degree|)
              (27 . |sup|) (|Union| $ '"failed") (33 . |subtractIfCan|)
              (39 . |One|) (43 . |One|) (47 . |monomial|) (53 . >)
              (|Mapping| 15 9 9) (|List| 9) (59 . |sort|) (65 . |hMonic|)
              (|Record| (|:| |lcmfij| 7) (|:| |totdeg| 12) (|:| |poli| 9)
                        (|:| |polj| 9))
              (|Mapping| 15 29 29) (|List| 29) (70 . |sort|)
              |NGROEB;sPol;RDpol;9| |NGROEB;redPol;DpolLDpol;11| (76 . |Zero|)
              (80 . |Zero|) (84 . |Zero|) (88 . =) (94 . =) (100 . |concat|)
              |NGROEB;groebner;2L;8| (106 . *) (112 . |leadingCoefficient|)
              (117 . *) (123 . -) (|Void|) (|OutputForm|) (129 . |print|)
              (134 . |coerce|) (|Union| 7 '"failed") (139 . |coerce|)
              (144 . |coerce|) (149 . *) (155 . |primitivePart|)
              (160 . |reductum|) (165 . ~=) (171 . +))
           '#(|virtualDegree| 177 |sPol| 182 |redPol| 187 |hMonic| 193
              |groebner| 198)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 57
                                                 '(2 6 10 0 0 11 1 9 12 0 13 1
                                                   0 12 9 14 2 7 15 0 0 16 1 9
                                                   7 0 17 2 7 0 0 0 18 2 7 19 0
                                                   0 20 0 6 0 21 0 9 0 22 2 9 0
                                                   6 7 23 2 7 15 0 0 24 2 26 0
                                                   25 0 27 1 0 9 9 28 2 31 0 30
                                                   0 32 0 6 0 35 0 7 0 36 0 9 0
                                                   37 2 9 15 0 0 38 2 7 15 0 0
                                                   39 2 26 0 0 9 40 2 9 0 0 0
                                                   42 1 9 6 0 43 2 9 0 6 0 44 2
                                                   9 0 0 0 45 1 47 46 0 48 1 7
                                                   47 0 49 1 50 47 0 51 1 9 47
                                                   0 52 2 6 0 0 0 53 1 9 0 0 54
                                                   1 9 0 0 55 2 9 15 0 0 56 2 9
                                                   0 0 0 57 1 0 12 9 14 1 0 9
                                                   29 33 2 0 9 9 26 34 1 0 9 9
                                                   28 1 0 26 26 41)))))
           '|lookupComplete|)) 
