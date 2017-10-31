
(SDEFUN |GBEUCLID;euclideanGroebner;2L;1|
        ((|Pol| |List| |Dpol|) ($ |List| |Dpol|))
        (|GBEUCLID;eminGbasis| (|GBEUCLID;strongGbasis| |Pol| 0 0 $) $)) 

(SDEFUN |GBEUCLID;euclideanGroebner;LSL;2|
        ((|Pol| |List| |Dpol|) (|xx1| |String|) ($ |List| |Dpol|))
        (SEQ
         (COND
          ((EQUAL |xx1| "redcrit")
           (|GBEUCLID;eminGbasis| (|GBEUCLID;strongGbasis| |Pol| 1 0 $) $))
          ((EQUAL |xx1| "info")
           (|GBEUCLID;eminGbasis| (|GBEUCLID;strongGbasis| |Pol| 2 1 $) $))
          ('T
           (SEQ (SPADCALL "   " (QREFELT $ 14))
                (SPADCALL "WARNING: options are - redcrit and/or info - "
                          (QREFELT $ 14))
                (SPADCALL "         you didn't type them correct"
                          (QREFELT $ 14))
                (SPADCALL "         please try again" (QREFELT $ 14))
                (SPADCALL "   " (QREFELT $ 14)) (EXIT NIL)))))) 

(SDEFUN |GBEUCLID;euclideanGroebner;L2SL;3|
        ((|Pol| |List| |Dpol|) (|xx1| |String|) (|xx2| |String|)
         ($ |List| |Dpol|))
        (SEQ
         (COND
          ((EQUAL |xx1| "redcrit")
           (COND
            ((EQUAL |xx2| "info")
             (EXIT
              (|GBEUCLID;eminGbasis| (|GBEUCLID;strongGbasis| |Pol| 1 1 $) $)))
            ((EQUAL |xx1| #1="info")
             (COND
              ((EQUAL |xx2| #2="redcrit")
               (EXIT
                (|GBEUCLID;eminGbasis| (|GBEUCLID;strongGbasis| |Pol| 1 1 $)
                 $)))))))
          ((EQUAL |xx1| #1#)
           (COND
            ((EQUAL |xx2| #2#)
             (EXIT
              (|GBEUCLID;eminGbasis| (|GBEUCLID;strongGbasis| |Pol| 1 1 $)
               $))))))
         (COND
          ((EQUAL |xx1| "redcrit")
           (COND
            ((EQUAL |xx2| "redcrit")
             (EXIT
              (|GBEUCLID;eminGbasis| (|GBEUCLID;strongGbasis| |Pol| 1 0 $)
               $))))))
         (COND
          ((EQUAL |xx1| "info")
           (COND
            ((EQUAL |xx2| "info")
             (EXIT
              (|GBEUCLID;eminGbasis| (|GBEUCLID;strongGbasis| |Pol| 2 1 $)
               $))))))
         (SPADCALL "   " (QREFELT $ 14))
         (SPADCALL "WARNING:  options are - redcrit and/or info - "
                   (QREFELT $ 14))
         (SPADCALL "          you didn't type them correct" (QREFELT $ 14))
         (SPADCALL "          please try again " (QREFELT $ 14))
         (SPADCALL "   " (QREFELT $ 14)) (EXIT NIL))) 

(SDEFUN |GBEUCLID;strongGbasis|
        ((|Pol| |List| |Dpol|) (|xx1| |Integer|) (|xx2| . #1=(|Integer|))
         ($ |List| |Dpol|))
        (SPROG
         ((|xx| #1#) (|ala| (|Integer|)) (H (|List| |Dpol|))
          (D
           (|List|
            (|Record| (|:| |lcmfij| |Expon|) (|:| |lcmcij| |Dom|)
                      (|:| |poli| |Dpol|) (|:| |polj| |Dpol|))))
          (|dd1|
           (|List|
            (|Record| (|:| |lcmfij| |Expon|) (|:| |lcmcij| |Dom|)
                      (|:| |poli| |Dpol|) (|:| |polj| |Dpol|))))
          (#2=#:G796 NIL) (|x| NIL) (#3=#:G795 NIL) (|leh| (|Dom|))
          (|e| (|Expon|)) (|eh| (|Dpol|)) (|ep| (|Dpol|))
          (D0
           (|Record| (|:| |lcmfij| |Expon|) (|:| |lcmcij| |Dom|)
                     (|:| |poli| |Dpol|) (|:| |polj| |Dpol|)))
          (#4=#:G794 NIL) (#5=#:G793 NIL) (|lch| (|Dom|)) (|en| (|Expon|))
          (|Pol1| (|List| |Dpol|)) (|h| (|Dpol|)))
         (SEQ
          (LETT |Pol1|
                (SPADCALL (CONS #'|GBEUCLID;strongGbasis!0| $) |Pol|
                          (QREFELT $ 25))
                . #6=(|GBEUCLID;strongGbasis|))
          (LETT |Pol| (LIST (|SPADfirst| |Pol1|)) . #6#) (LETT H |Pol| . #6#)
          (LETT |Pol1| (CDR |Pol1|) . #6#) (LETT D NIL . #6#)
          (SEQ G190 (COND ((NULL |Pol1|) (GO G191)))
               (SEQ (LETT |h| (|SPADfirst| |Pol1|) . #6#)
                    (LETT |Pol1| (CDR |Pol1|) . #6#)
                    (LETT |en| (SPADCALL |h| (QREFELT $ 18)) . #6#)
                    (LETT |lch| (SPADCALL |h| (QREFELT $ 22)) . #6#)
                    (LETT |dd1|
                          (PROGN
                           (LETT #5# NIL . #6#)
                           (SEQ (LETT |x| NIL . #6#) (LETT #4# |Pol| . #6#)
                                G190
                                (COND
                                 ((OR (ATOM #4#)
                                      (PROGN (LETT |x| (CAR #4#) . #6#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #5#
                                        (CONS
                                         (VECTOR
                                          (SPADCALL
                                           (SPADCALL |x| (QREFELT $ 18)) |en|
                                           (QREFELT $ 26))
                                          (SPADCALL
                                           (SPADCALL |x| (QREFELT $ 22)) |lch|
                                           (QREFELT $ 27))
                                          |x| |h|)
                                         #5#)
                                        . #6#)))
                                (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                                (EXIT (NREVERSE #5#))))
                          . #6#)
                    (LETT D
                          (|GBEUCLID;updatD|
                           (|GBEUCLID;ecritMTondd1|
                            (SPADCALL (CONS #'|GBEUCLID;strongGbasis!1| $)
                                      |dd1| (QREFELT $ 32))
                            $)
                           (|GBEUCLID;ecritBonD| |h| D $) $)
                          . #6#)
                    (LETT |Pol| (CONS |h| (|GBEUCLID;eupdatF| |h| |Pol| $))
                          . #6#)
                    (COND
                     ((SPADCALL |en| (SPADCALL (|SPADfirst| H) (QREFELT $ 18))
                                (QREFELT $ 21))
                      (COND
                       ((SPADCALL (SPADCALL |h| (QREFELT $ 22))
                                  (SPADCALL (|SPADfirst| H) (QREFELT $ 22))
                                  (QREFELT $ 33))
                        (EXIT " go to top of while ")))))
                    (LETT H
                          (|GBEUCLID;updatH| |h| H
                           (|GBEUCLID;crithdelH| |h| H $) (LIST |h|) $)
                          . #6#)
                    (EXIT
                     (LETT H
                           (SPADCALL (CONS #'|GBEUCLID;strongGbasis!2| $) H
                                     (QREFELT $ 25))
                           . #6#)))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT D
                (SPADCALL (CONS #'|GBEUCLID;strongGbasis!3| $) D
                          (QREFELT $ 32))
                . #6#)
          (LETT |xx| |xx2| . #6#)
          (SEQ G190 (COND ((NULL D) (GO G191)))
               (SEQ (LETT D0 (|SPADfirst| D) . #6#)
                    (LETT |ep| (|GBEUCLID;esPol| D0 $) . #6#)
                    (LETT D (CDR D) . #6#)
                    (LETT |eh|
                          (|GBEUCLID;ecredPol| (|GBEUCLID;eRed| |ep| H H $) H
                           $)
                          . #6#)
                    (COND ((EQL |xx1| 1) (|GBEUCLID;prinshINFO| |eh| $)))
                    (EXIT
                     (COND
                      ((SPADCALL |eh| (|spadConstant| $ 38) (QREFELT $ 39))
                       (SEQ
                        (COND
                         ((EQL |xx2| 1)
                          (SEQ
                           (LETT |ala|
                                 (|GBEUCLID;prindINFO| D0 |ep| |eh| (LENGTH H)
                                  (LENGTH D) |xx| $)
                                 . #6#)
                           (EXIT (LETT |xx| 2 . #6#)))))
                        (EXIT " go to top of while ")))
                      ('T
                       (SEQ (LETT |eh| (SPADCALL |eh| (QREFELT $ 40)) . #6#)
                            (LETT |e| (SPADCALL |eh| (QREFELT $ 18)) . #6#)
                            (LETT |leh| (SPADCALL |eh| (QREFELT $ 22)) . #6#)
                            (LETT |dd1|
                                  (PROGN
                                   (LETT #3# NIL . #6#)
                                   (SEQ (LETT |x| NIL . #6#)
                                        (LETT #2# |Pol| . #6#) G190
                                        (COND
                                         ((OR (ATOM #2#)
                                              (PROGN
                                               (LETT |x| (CAR #2#) . #6#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #3#
                                                (CONS
                                                 (VECTOR
                                                  (SPADCALL
                                                   (SPADCALL |x|
                                                             (QREFELT $ 18))
                                                   |e| (QREFELT $ 26))
                                                  (SPADCALL
                                                   (SPADCALL |x|
                                                             (QREFELT $ 22))
                                                   |leh| (QREFELT $ 27))
                                                  |x| |eh|)
                                                 #3#)
                                                . #6#)))
                                        (LETT #2# (CDR #2#) . #6#) (GO G190)
                                        G191 (EXIT (NREVERSE #3#))))
                                  . #6#)
                            (LETT D
                                  (|GBEUCLID;updatD|
                                   (|GBEUCLID;ecritMTondd1|
                                    (SPADCALL
                                     (CONS #'|GBEUCLID;strongGbasis!4| $) |dd1|
                                     (QREFELT $ 32))
                                    $)
                                   (|GBEUCLID;ecritBonD| |eh| D $) $)
                                  . #6#)
                            (LETT |Pol|
                                  (CONS |eh| (|GBEUCLID;eupdatF| |eh| |Pol| $))
                                  . #6#)
                            (COND
                             ((|GBEUCLID;ecrithinH| |eh| H $)
                              (COND
                               ((SPADCALL |e|
                                          (SPADCALL (|SPADfirst| H)
                                                    (QREFELT $ 18))
                                          (QREFELT $ 21))
                                (COND
                                 ((SPADCALL (SPADCALL |eh| (QREFELT $ 22))
                                            (SPADCALL (|SPADfirst| H)
                                                      (QREFELT $ 22))
                                            (QREFELT $ 33))
                                  (EXIT
                                   (SEQ
                                    (COND
                                     ((EQL |xx2| 1)
                                      (SEQ
                                       (LETT |ala|
                                             (|GBEUCLID;prindINFO| D0 |ep| |eh|
                                              (LENGTH H) (LENGTH D) |xx| $)
                                             . #6#)
                                       (EXIT (LETT |xx| 2 . #6#)))))
                                    (EXIT #7=" go to top of while "))))))))
                             ('T
                              (EXIT
                               (SEQ
                                (COND
                                 ((EQL |xx2| 1)
                                  (SEQ
                                   (LETT |ala|
                                         (|GBEUCLID;prindINFO| D0 |ep| |eh|
                                          (LENGTH H) (LENGTH D) |xx| $)
                                         . #6#)
                                   (EXIT (LETT |xx| 2 . #6#)))))
                                (EXIT #7#)))))
                            (LETT H
                                  (|GBEUCLID;updatH| |eh| H
                                   (|GBEUCLID;crithdelH| |eh| H $) (LIST |eh|)
                                   $)
                                  . #6#)
                            (LETT H
                                  (SPADCALL
                                   (CONS #'|GBEUCLID;strongGbasis!5| $) H
                                   (QREFELT $ 25))
                                  . #6#)
                            (EXIT
                             (COND
                              ((EQL |xx2| 1)
                               (SEQ
                                (LETT |ala|
                                      (|GBEUCLID;prindINFO| D0 |ep| |eh|
                                       (LENGTH H) (LENGTH D) |xx| $)
                                      . #6#)
                                (LETT |xx| 2 . #6#)
                                (EXIT " go to top of while "))))))))))
               NIL (GO G190) G191 (EXIT NIL))
          (COND
           ((EQL |xx2| 1)
            (SEQ (|GBEUCLID;prinpolINFO| |Pol| $)
                 (EXIT
                  (SPADCALL "    THE GROEBNER BASIS over EUCLIDEAN DOMAIN"
                            (QREFELT $ 14))))))
          (COND
           ((EQL |xx1| 1)
            (COND
             ((SPADCALL |xx2| 1 (QREFELT $ 42))
              (SPADCALL "    THE GROEBNER BASIS over EUCLIDEAN DOMAIN"
                        (QREFELT $ 14))))))
          (EXIT H)))) 

(SDEFUN |GBEUCLID;strongGbasis!5| ((|z1| NIL) (|z2| NIL) ($ NIL))
        (COND
         ((SPADCALL (SPADCALL |z1| (QREFELT $ 18))
                    (SPADCALL |z2| (QREFELT $ 18)) (QREFELT $ 20))
          'T)
         ((SPADCALL (SPADCALL |z1| (QREFELT $ 18))
                    (SPADCALL |z2| (QREFELT $ 18)) (QREFELT $ 21))
          (SPADCALL (SPADCALL |z2| (QREFELT $ 22))
                    (SPADCALL |z1| (QREFELT $ 22)) (QREFELT $ 23)))
         ('T NIL))) 

(SDEFUN |GBEUCLID;strongGbasis!4| ((|z1| NIL) (|z2| NIL) ($ NIL))
        (COND ((SPADCALL (QVELT |z1| 0) (QVELT |z2| 0) (QREFELT $ 28)) 'T)
              ((SPADCALL (QVELT |z1| 0) (QVELT |z2| 0) (QREFELT $ 21))
               (SPADCALL (QVELT |z1| 1) (QVELT |z2| 1) (QREFELT $ 23)))
              ('T NIL))) 

(SDEFUN |GBEUCLID;strongGbasis!3| ((|z1| NIL) (|z2| NIL) ($ NIL))
        (COND ((SPADCALL (QVELT |z1| 0) (QVELT |z2| 0) (QREFELT $ 28)) 'T)
              ((SPADCALL (QVELT |z1| 0) (QVELT |z2| 0) (QREFELT $ 21))
               (SPADCALL (QVELT |z1| 1) (QVELT |z2| 1) (QREFELT $ 23)))
              ('T NIL))) 

(SDEFUN |GBEUCLID;strongGbasis!2| ((|z1| NIL) (|z2| NIL) ($ NIL))
        (COND
         ((SPADCALL (SPADCALL |z1| (QREFELT $ 18))
                    (SPADCALL |z2| (QREFELT $ 18)) (QREFELT $ 20))
          'T)
         ((SPADCALL (SPADCALL |z1| (QREFELT $ 18))
                    (SPADCALL |z2| (QREFELT $ 18)) (QREFELT $ 21))
          (SPADCALL (SPADCALL |z2| (QREFELT $ 22))
                    (SPADCALL |z1| (QREFELT $ 22)) (QREFELT $ 23)))
         ('T NIL))) 

(SDEFUN |GBEUCLID;strongGbasis!1| ((|z1| NIL) (|z2| NIL) ($ NIL))
        (COND ((SPADCALL (QVELT |z1| 0) (QVELT |z2| 0) (QREFELT $ 28)) 'T)
              ((SPADCALL (QVELT |z1| 0) (QVELT |z2| 0) (QREFELT $ 21))
               (SPADCALL (QVELT |z1| 1) (QVELT |z2| 1) (QREFELT $ 23)))
              ('T NIL))) 

(SDEFUN |GBEUCLID;strongGbasis!0| ((|z1| NIL) (|z2| NIL) ($ NIL))
        (COND
         ((SPADCALL (SPADCALL |z1| (QREFELT $ 18))
                    (SPADCALL |z2| (QREFELT $ 18)) (QREFELT $ 20))
          'T)
         ((SPADCALL (SPADCALL |z1| (QREFELT $ 18))
                    (SPADCALL |z2| (QREFELT $ 18)) (QREFELT $ 21))
          (SPADCALL (SPADCALL |z2| (QREFELT $ 22))
                    (SPADCALL |z1| (QREFELT $ 22)) (QREFELT $ 23)))
         ('T NIL))) 

(SDEFUN |GBEUCLID;ecritMondd1|
        ((|e| |Expon|) (|c| |Dom|)
         (D2 |List|
          (|Record| (|:| |lcmfij| |Expon|) (|:| |lcmcij| |Dom|)
                    (|:| |poli| |Dpol|) (|:| |polj| |Dpol|)))
         ($ |List|
          (|Record| (|:| |lcmfij| |Expon|) (|:| |lcmcij| |Dom|)
                    (|:| |poli| |Dpol|) (|:| |polj| |Dpol|))))
        (SPROG
         ((|x|
           (|Record| (|:| |lcmfij| |Expon|) (|:| |lcmcij| |Dom|)
                     (|:| |poli| |Dpol|) (|:| |polj| |Dpol|))))
         (SEQ
          (COND ((NULL D2) NIL)
                (#1='T
                 (SEQ (LETT |x| (|SPADfirst| D2) |GBEUCLID;ecritMondd1|)
                      (EXIT
                       (COND
                        ((|GBEUCLID;ecritM| |e| |c| (QVELT |x| 0)
                          (SPADCALL (SPADCALL (QVELT |x| 2) (QREFELT $ 22))
                                    (SPADCALL (QVELT |x| 3) (QREFELT $ 22))
                                    (QREFELT $ 27))
                          $)
                         (|GBEUCLID;ecritMondd1| |e| |c| (CDR D2) $))
                        (#1#
                         (CONS |x|
                               (|GBEUCLID;ecritMondd1| |e| |c| (CDR D2)
                                $))))))))))) 

(SDEFUN |GBEUCLID;ecredPol| ((|h| |Dpol|) (F |List| |Dpol|) ($ |Dpol|))
        (SPROG ((|h0| (|Dpol|)))
               (SEQ
                (LETT |h0| (|spadConstant| $ 38) . #1=(|GBEUCLID;ecredPol|))
                (EXIT
                 (COND ((NULL F) |h|)
                       ('T
                        (SEQ
                         (SEQ G190
                              (COND
                               ((NULL
                                 (SPADCALL |h| (|spadConstant| $ 38)
                                           (QREFELT $ 43)))
                                (GO G191)))
                              (SEQ
                               (LETT |h0|
                                     (SPADCALL |h0|
                                               (SPADCALL
                                                (SPADCALL |h| (QREFELT $ 22))
                                                (SPADCALL |h| (QREFELT $ 18))
                                                (QREFELT $ 44))
                                               (QREFELT $ 45))
                                     . #1#)
                               (EXIT
                                (LETT |h|
                                      (|GBEUCLID;eRed|
                                       (SPADCALL |h| (QREFELT $ 46)) F F $)
                                      . #1#)))
                              NIL (GO G190) G191 (EXIT NIL))
                         (EXIT |h0|)))))))) 

(SDEFUN |GBEUCLID;ecritMTondd1|
        ((|dd1| |List|
          (|Record| (|:| |lcmfij| |Expon|) (|:| |lcmcij| |Dom|)
                    (|:| |poli| |Dpol|) (|:| |polj| |Dpol|)))
         ($ |List|
          (|Record| (|:| |lcmfij| |Expon|) (|:| |lcmcij| |Dom|)
                    (|:| |poli| |Dpol|) (|:| |polj| |Dpol|))))
        (SPROG
         ((|f2|
           #1=(|Record| (|:| |lcmfij| |Expon|) (|:| |lcmcij| |Dom|)
                        (|:| |poli| |Dpol|) (|:| |polj| |Dpol|)))
          (|r1|
           (|List|
            (|Record| (|:| |lcmfij| |Expon|) (|:| |lcmcij| |Dom|)
                      (|:| |poli| |Dpol|) (|:| |polj| |Dpol|))))
          (|e1| (|Expon|)) (|cT1| (|Boolean|)) (|s1| (|NonNegativeInteger|))
          (|f1| #1#))
         (SEQ
          (COND ((NULL |dd1|) NIL)
                (#2='T
                 (SEQ
                  (LETT |f1| (|SPADfirst| |dd1|)
                        . #3=(|GBEUCLID;ecritMTondd1|))
                  (LETT |s1| (LENGTH |dd1|) . #3#)
                  (LETT |cT1| (|GBEUCLID;ecritT| |f1| $) . #3#)
                  (COND ((EQL |s1| 1) (COND (|cT1| (EXIT NIL)))))
                  (EXIT
                   (COND ((EQL |s1| 1) |dd1|)
                         (#2#
                          (SEQ (LETT |e1| (QVELT |f1| 0) . #3#)
                               (LETT |r1| (CDR |dd1|) . #3#)
                               (LETT |f2| (|SPADfirst| |r1|) . #3#)
                               (COND
                                ((SPADCALL |e1| (QVELT |f2| 0) (QREFELT $ 21))
                                 (COND
                                  ((SPADCALL (QVELT |f1| 1) (QVELT |f2| 1)
                                             (QREFELT $ 33))
                                   (EXIT
                                    (COND
                                     (|cT1|
                                      (|GBEUCLID;ecritMTondd1|
                                       (CONS |f1| (CDR |r1|)) $))
                                     (#2#
                                      (|GBEUCLID;ecritMTondd1| |r1| $))))))))
                               (LETT |dd1|
                                     (|GBEUCLID;ecritMondd1| |e1|
                                      (QVELT |f1| 1) |r1| $)
                                     . #3#)
                               (EXIT
                                (COND (|cT1| (|GBEUCLID;ecritMTondd1| |dd1| $))
                                      (#2#
                                       (CONS |f1|
                                             (|GBEUCLID;ecritMTondd1| |dd1|
                                              $))))))))))))))) 

(SDEFUN |GBEUCLID;ecritBonD|
        ((|h| |Dpol|)
         (D |List|
          (|Record| (|:| |lcmfij| |Expon|) (|:| |lcmcij| |Dom|)
                    (|:| |poli| |Dpol|) (|:| |polj| |Dpol|)))
         ($ |List|
          (|Record| (|:| |lcmfij| |Expon|) (|:| |lcmcij| |Dom|)
                    (|:| |poli| |Dpol|) (|:| |polj| |Dpol|))))
        (SPROG
         ((|x2| (|Dpol|)) (|x1| (|Dpol|))
          (|x|
           (|Record| (|:| |lcmfij| |Expon|) (|:| |lcmcij| |Dom|)
                     (|:| |poli| |Dpol|) (|:| |polj| |Dpol|))))
         (SEQ
          (COND ((NULL D) NIL)
                (#1='T
                 (SEQ (LETT |x| (|SPADfirst| D) . #2=(|GBEUCLID;ecritBonD|))
                      (LETT |x1| (QVELT |x| 2) . #2#)
                      (LETT |x2| (QVELT |x| 3) . #2#)
                      (EXIT
                       (COND
                        ((|GBEUCLID;ecritB| (SPADCALL |h| (QREFELT $ 18))
                          (SPADCALL |h| (QREFELT $ 22))
                          (SPADCALL |x1| (QREFELT $ 18))
                          (SPADCALL |x1| (QREFELT $ 22))
                          (SPADCALL |x2| (QREFELT $ 18))
                          (SPADCALL |x2| (QREFELT $ 22)) $)
                         (|GBEUCLID;ecritBonD| |h| (CDR D) $))
                        (#1#
                         (CONS |x|
                               (|GBEUCLID;ecritBonD| |h| (CDR D) $))))))))))) 

(SDEFUN |GBEUCLID;eupdatF| ((|h| |Dpol|) (F |List| |Dpol|) ($ |List| |Dpol|))
        (SPROG ((|f1| (|Dpol|)))
               (SEQ
                (COND ((NULL F) NIL)
                      (#1='T
                       (SEQ (LETT |f1| (|SPADfirst| F) |GBEUCLID;eupdatF|)
                            (EXIT
                             (COND
                              ((|GBEUCLID;ecritM| (SPADCALL |h| (QREFELT $ 18))
                                (SPADCALL |h| (QREFELT $ 22))
                                (SPADCALL |f1| (QREFELT $ 18))
                                (SPADCALL |f1| (QREFELT $ 22)) $)
                               (|GBEUCLID;eupdatF| |h| (CDR F) $))
                              (#1#
                               (CONS |f1|
                                     (|GBEUCLID;eupdatF| |h| (CDR F)
                                      $))))))))))) 

(SDEFUN |GBEUCLID;updatH|
        ((|h| |Dpol|) (H |List| |Dpol|) (|Hh| |List| |Dpol|)
         (|Hhh| |List| |Dpol|) ($ |List| |Dpol|))
        (SPROG
         ((|hp| (|Dpol|)) (|hpp| (|List| |Dpol|)) (#1=#:G817 NIL)
          (|plc|
           (|Record| (|:| |coef1| |Dom|) (|:| |coef2| |Dom|)
                     (|:| |generator| |Dom|)))
          (|hlcm| (|Expon|)) (|h1| (|Dpol|)))
         (SEQ
          (COND ((NULL H) (SPADCALL |Hh| |Hhh| (QREFELT $ 47)))
                ('T
                 (SEQ (LETT |h1| (|SPADfirst| H) . #2=(|GBEUCLID;updatH|))
                      (LETT |hlcm|
                            (SPADCALL (SPADCALL |h1| (QREFELT $ 18))
                                      (SPADCALL |h| (QREFELT $ 18))
                                      (QREFELT $ 26))
                            . #2#)
                      (LETT |plc|
                            (SPADCALL (SPADCALL |h| (QREFELT $ 22))
                                      (SPADCALL |h1| (QREFELT $ 22))
                                      (QREFELT $ 49))
                            . #2#)
                      (LETT |hp|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (QVELT |plc| 0)
                                        (PROG2
                                            (LETT #1#
                                                  (SPADCALL |hlcm|
                                                            (SPADCALL |h|
                                                                      (QREFELT
                                                                       $ 18))
                                                            (QREFELT $ 51))
                                                  . #2#)
                                            (QCDR #1#)
                                          (|check_union2| (QEQCAR #1# 0)
                                                          (QREFELT $ 7)
                                                          (|Union|
                                                           (QREFELT $ 7)
                                                           #3="failed")
                                                          #1#))
                                        (QREFELT $ 44))
                              |h| (QREFELT $ 52))
                             (SPADCALL
                              (SPADCALL (QVELT |plc| 1)
                                        (PROG2
                                            (LETT #1#
                                                  (SPADCALL |hlcm|
                                                            (SPADCALL |h1|
                                                                      (QREFELT
                                                                       $ 18))
                                                            (QREFELT $ 51))
                                                  . #2#)
                                            (QCDR #1#)
                                          (|check_union2| (QEQCAR #1# 0)
                                                          (QREFELT $ 7)
                                                          (|Union|
                                                           (QREFELT $ 7) #3#)
                                                          #1#))
                                        (QREFELT $ 44))
                              |h1| (QREFELT $ 52))
                             (QREFELT $ 45))
                            . #2#)
                      (COND
                       ((|GBEUCLID;ecrithinH| |hp| |Hh| $)
                        (COND
                         ((|GBEUCLID;ecrithinH| |hp| |Hhh| $)
                          (EXIT
                           (SEQ
                            (LETT |hpp| (SPADCALL (CDR H) |Hh| (QREFELT $ 47))
                                  . #2#)
                            (LETT |hp|
                                  (|GBEUCLID;ecredPol|
                                   (|GBEUCLID;eRed| |hp| |hpp| |hpp| $) |hpp|
                                   $)
                                  . #2#)
                            (EXIT
                             (|GBEUCLID;updatH| |h| (CDR H)
                              (|GBEUCLID;crithdelH| |hp| |Hh| $)
                              (CONS |hp| (|GBEUCLID;crithdelH| |hp| |Hhh| $))
                              $))))))))
                      (EXIT (|GBEUCLID;updatH| |h| (CDR H) |Hh| |Hhh| $)))))))) 

(SDEFUN |GBEUCLID;crithdelH| ((|h| |Dpol|) (H |List| |Dpol|) ($ |List| |Dpol|))
        (SPROG
         ((#1=#:G826 NIL)
          (|plc|
           (|Record| (|:| |coef1| |Dom|) (|:| |coef2| |Dom|)
                     (|:| |generator| |Dom|)))
          (|dh| (|Expon|)) (|dh1| (|Expon|)) (|h1| (|Dpol|)))
         (SEQ
          (COND ((NULL H) NIL)
                (#2='T
                 (SEQ (LETT |h1| (|SPADfirst| H) . #3=(|GBEUCLID;crithdelH|))
                      (LETT |dh1| (SPADCALL |h1| (QREFELT $ 18)) . #3#)
                      (LETT |dh| (SPADCALL |h| (QREFELT $ 18)) . #3#)
                      (EXIT
                       (COND
                        ((|GBEUCLID;ecritM| |dh| (SPADCALL |h| (QREFELT $ 22))
                          |dh1| (SPADCALL |h1| (QREFELT $ 22)) $)
                         (|GBEUCLID;crithdelH| |h| (CDR H) $))
                        ((SPADCALL |dh1| (SPADCALL |dh| |dh1| (QREFELT $ 26))
                                   (QREFELT $ 21))
                         (SEQ
                          (LETT |plc|
                                (SPADCALL (SPADCALL |h1| (QREFELT $ 22))
                                          (SPADCALL |h| (QREFELT $ 22))
                                          (QREFELT $ 49))
                                . #3#)
                          (EXIT
                           (CONS
                            (SPADCALL
                             (SPADCALL (QVELT |plc| 0) |h1| (QREFELT $ 53))
                             (SPADCALL
                              (SPADCALL (QVELT |plc| 1)
                                        (PROG2
                                            (LETT #1#
                                                  (SPADCALL |dh1| |dh|
                                                            (QREFELT $ 51))
                                                  . #3#)
                                            (QCDR #1#)
                                          (|check_union2| (QEQCAR #1# 0)
                                                          (QREFELT $ 7)
                                                          (|Union|
                                                           (QREFELT $ 7)
                                                           "failed")
                                                          #1#))
                                        (QREFELT $ 44))
                              |h| (QREFELT $ 52))
                             (QREFELT $ 45))
                            (|GBEUCLID;crithdelH| |h| (CDR H) $)))))
                        (#2#
                         (CONS |h1|
                               (|GBEUCLID;crithdelH| |h| (CDR H) $))))))))))) 

(SDEFUN |GBEUCLID;eminGbasis| ((F |List| |Dpol|) ($ . #1=(|List| |Dpol|)))
        (SPROG ((|newbas| #1#))
               (SEQ
                (COND ((NULL F) NIL)
                      ('T
                       (SEQ
                        (LETT |newbas| (|GBEUCLID;eminGbasis| (CDR F) $)
                              |GBEUCLID;eminGbasis|)
                        (EXIT
                         (CONS (|GBEUCLID;ecredPol| (|SPADfirst| F) |newbas| $)
                               |newbas|)))))))) 

(SDEFUN |GBEUCLID;ecrithinH| ((|h| |Dpol|) (H |List| |Dpol|) ($ |Boolean|))
        (SPROG ((|h1| (|Dpol|)))
               (SEQ
                (COND ((NULL H) 'T)
                      (#1='T
                       (SEQ (LETT |h1| (|SPADfirst| H) |GBEUCLID;ecrithinH|)
                            (EXIT
                             (COND
                              ((|GBEUCLID;ecritM|
                                (SPADCALL |h1| (QREFELT $ 18))
                                (SPADCALL |h1| (QREFELT $ 22))
                                (SPADCALL |h| (QREFELT $ 18))
                                (SPADCALL |h| (QREFELT $ 22)) $)
                               NIL)
                              (#1# (|GBEUCLID;ecrithinH| |h| (CDR H) $)))))))))) 

(SDEFUN |GBEUCLID;esPol|
        ((|p| |Record| (|:| |lcmfij| |Expon|) (|:| |lcmcij| |Dom|)
          (|:| |poli| |Dpol|) (|:| |polj| |Dpol|))
         ($ |Dpol|))
        (SPROG
         ((#1=#:G840 NIL) (#2=#:G837 NIL) (|lij| (|Dom|)) (|fj| (|Dpol|))
          (|fi| (|Dpol|)) (|Tij| (|Expon|)))
         (SEQ (LETT |Tij| (QVELT |p| 0) . #3=(|GBEUCLID;esPol|))
              (LETT |fi| (QVELT |p| 2) . #3#) (LETT |fj| (QVELT |p| 3) . #3#)
              (LETT |lij|
                    (SPADCALL (SPADCALL |fi| (QREFELT $ 22))
                              (SPADCALL |fj| (QREFELT $ 22)) (QREFELT $ 27))
                    . #3#)
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL |fi| (QREFELT $ 46))
                          (SPADCALL
                           (PROG2
                               (LETT #2#
                                     (SPADCALL |lij|
                                               (SPADCALL |fi| (QREFELT $ 22))
                                               (QREFELT $ 54))
                                     . #3#)
                               (QCDR #2#)
                             (|check_union2| (QEQCAR #2# 0) (QREFELT $ 6)
                                             (|Union| (QREFELT $ 6)
                                                      #4="failed")
                                             #2#))
                           (PROG2
                               (LETT #1#
                                     (SPADCALL |Tij|
                                               (SPADCALL |fi| (QREFELT $ 18))
                                               (QREFELT $ 51))
                                     . #3#)
                               (QCDR #1#)
                             (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                             (|Union| (QREFELT $ 7)
                                                      #5="failed")
                                             #1#))
                           (QREFELT $ 44))
                          (QREFELT $ 52))
                (SPADCALL (SPADCALL |fj| (QREFELT $ 46))
                          (SPADCALL
                           (PROG2
                               (LETT #2#
                                     (SPADCALL |lij|
                                               (SPADCALL |fj| (QREFELT $ 22))
                                               (QREFELT $ 54))
                                     . #3#)
                               (QCDR #2#)
                             (|check_union2| (QEQCAR #2# 0) (QREFELT $ 6)
                                             (|Union| (QREFELT $ 6) #4#) #2#))
                           (PROG2
                               (LETT #1#
                                     (SPADCALL |Tij|
                                               (SPADCALL |fj| (QREFELT $ 18))
                                               (QREFELT $ 51))
                                     . #3#)
                               (QCDR #1#)
                             (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                             (|Union| (QREFELT $ 7) #5#) #1#))
                           (QREFELT $ 44))
                          (QREFELT $ 52))
                (QREFELT $ 55)))))) 

(SDEFUN |GBEUCLID;eRed|
        ((|s| |Dpol|) (H |List| |Dpol|) (|Hh| |List| |Dpol|) ($ |Dpol|))
        (SPROG
         ((|q1| (|Dom|))
          (|sdf1| (|Record| (|:| |quotient| |Dom|) (|:| |remainder| |Dom|)))
          (#1=#:G852 NIL) (|e| (|Union| |Expon| "failed")) (|ls| (|Dom|))
          (|lf1| (|Dom|)) (|ds| (|Expon|)) (|f1| (|Dpol|)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL |s| (|spadConstant| $ 38) (QREFELT $ 39)) (NULL H))
             |s|)
            ('T
             (SEQ (LETT |f1| (|SPADfirst| H) . #2=(|GBEUCLID;eRed|))
                  (LETT |ds| (SPADCALL |s| (QREFELT $ 18)) . #2#)
                  (LETT |lf1| (SPADCALL |f1| (QREFELT $ 22)) . #2#)
                  (LETT |ls| (SPADCALL |s| (QREFELT $ 22)) . #2#)
                  (SEQ
                   (LETT |e|
                         (SPADCALL |ds| (SPADCALL |f1| (QREFELT $ 18))
                                   (QREFELT $ 51))
                         . #2#)
                   (EXIT
                    (COND
                     ((OR (QEQCAR |e| 1) (SPADCALL |ls| |lf1| (QREFELT $ 23)))
                      (PROGN
                       (LETT #1# (|GBEUCLID;eRed| |s| (CDR H) |Hh| $) . #2#)
                       (GO #3=#:G850))))))
                  (LETT |sdf1| (SPADCALL |ls| |lf1| (QREFELT $ 57)) . #2#)
                  (LETT |q1| (QCAR |sdf1|) . #2#)
                  (EXIT
                   (COND
                    ((SPADCALL (QCDR |sdf1|) (|spadConstant| $ 36)
                               (QREFELT $ 33))
                     (|GBEUCLID;eRed|
                      (SPADCALL (SPADCALL |s| (QREFELT $ 46))
                                (SPADCALL
                                 (SPADCALL |q1| (QCDR |e|) (QREFELT $ 44))
                                 (SPADCALL |f1| (QREFELT $ 46)) (QREFELT $ 52))
                                (QREFELT $ 55))
                      |Hh| |Hh| $))
                    ('T
                     (|GBEUCLID;eRed|
                      (SPADCALL |s|
                                (SPADCALL
                                 (SPADCALL |q1| (QCDR |e|) (QREFELT $ 44)) |f1|
                                 (QREFELT $ 52))
                                (QREFELT $ 55))
                      (CDR H) |Hh| $))))))))
          #3# (EXIT #1#)))) 

(SDEFUN |GBEUCLID;ecritT|
        ((|p| |Record| (|:| |lcmfij| |Expon|) (|:| |lcmcij| |Dom|)
          (|:| |poli| |Dpol|) (|:| |polj| |Dpol|))
         ($ |Boolean|))
        (SPROG ((|cj| (|Dom|)) (|ci| (|Dom|)) (|pj| (|Dpol|)) (|pi| (|Dpol|)))
               (SEQ (LETT |pi| (QVELT |p| 2) . #1=(|GBEUCLID;ecritT|))
                    (LETT |pj| (QVELT |p| 3) . #1#)
                    (LETT |ci| (SPADCALL |pi| (QREFELT $ 22)) . #1#)
                    (LETT |cj| (SPADCALL |pj| (QREFELT $ 22)) . #1#)
                    (EXIT
                     (COND
                      ((SPADCALL (QVELT |p| 0)
                                 (SPADCALL (SPADCALL |pi| (QREFELT $ 18))
                                           (SPADCALL |pj| (QREFELT $ 18))
                                           (QREFELT $ 58))
                                 (QREFELT $ 21))
                       (SPADCALL (QVELT |p| 1)
                                 (SPADCALL |ci| |cj| (QREFELT $ 59))
                                 (QREFELT $ 33)))
                      ('T NIL)))))) 

(SDEFUN |GBEUCLID;ecritM|
        ((|e1| |Expon|) (|c1| |Dom|) (|e2| |Expon|) (|c2| |Dom|) ($ |Boolean|))
        (SPROG ((#1=#:G865 NIL) (|en| (|Union| |Expon| "failed")))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (LETT |en| (SPADCALL |e2| |e1| (QREFELT $ 51))
                         . #2=(|GBEUCLID;ecritM|))
                   (EXIT
                    (COND
                     ((OR (QEQCAR |en| 1)
                          (QEQCAR (SPADCALL |c2| |c1| (QREFELT $ 54)) 1))
                      (PROGN (LETT #1# NIL . #2#) (GO #3=#:G863))))))
                  (EXIT 'T)))
                #3# (EXIT #1#)))) 

(SDEFUN |GBEUCLID;ecritB|
        ((|eh| |Expon|) (|ch| |Dom|) (|ei| |Expon|) (|ci| |Dom|) (|ek| |Expon|)
         (|ck| |Dom|) ($ |Boolean|))
        (SPROG ((|cik| (|Dom|)) (|eik| (|Expon|)))
               (SEQ
                (LETT |eik| (SPADCALL |ei| |ek| (QREFELT $ 26))
                      . #1=(|GBEUCLID;ecritB|))
                (LETT |cik| (SPADCALL |ci| |ck| (QREFELT $ 27)) . #1#)
                (EXIT
                 (COND
                  ((|GBEUCLID;ecritM| |eh| |ch| |eik| |cik| $)
                   (COND
                    ((|GBEUCLID;ecritM| |eik| |cik|
                      (SPADCALL |ei| |eh| (QREFELT $ 26))
                      (SPADCALL |ci| |ch| (QREFELT $ 27)) $)
                     NIL)
                    (#2='T
                     (NULL
                      (|GBEUCLID;ecritM| |eik| |cik|
                       (SPADCALL |ek| |eh| (QREFELT $ 26))
                       (SPADCALL |ck| |ch| (QREFELT $ 27)) $)))))
                  (#2# NIL)))))) 

(SDEFUN |GBEUCLID;euclideanNormalForm;DpolLDpol;19|
        ((|p1| |Dpol|) (|lp| |List| |Dpol|) ($ |Dpol|))
        (|GBEUCLID;eRed| |p1| |lp| |lp| $)) 

(SDEFUN |GBEUCLID;sortin|
        ((|p1| |Dpol|) (|lp| |List| |Dpol|) ($ |List| |Dpol|))
        (SPROG ((|ep1| (|Expon|)) (|elf1| (|Expon|)) (|f1| (|Dpol|)))
               (SEQ
                (COND ((NULL |lp|) (LIST |p1|))
                      ('T
                       (SEQ
                        (LETT |f1| (|SPADfirst| |lp|) . #1=(|GBEUCLID;sortin|))
                        (LETT |elf1| (SPADCALL |f1| (QREFELT $ 18)) . #1#)
                        (LETT |ep1| (SPADCALL |p1| (QREFELT $ 18)) . #1#)
                        (COND
                         ((SPADCALL |elf1| |ep1| (QREFELT $ 28))
                          (EXIT
                           (CONS |f1| (|GBEUCLID;sortin| |p1| (CDR |lp|) $))))
                         ((SPADCALL |elf1| |ep1| (QREFELT $ 21))
                          (COND
                           ((SPADCALL (SPADCALL |f1| (QREFELT $ 22))
                                      (SPADCALL |p1| (QREFELT $ 22))
                                      (QREFELT $ 23))
                            (EXIT
                             (CONS |f1|
                                   (|GBEUCLID;sortin| |p1| (CDR |lp|) $)))))))
                        (EXIT (CONS |p1| |lp|)))))))) 

(SDEFUN |GBEUCLID;updatD|
        ((D1 |List|
          (|Record| (|:| |lcmfij| |Expon|) (|:| |lcmcij| |Dom|)
                    (|:| |poli| |Dpol|) (|:| |polj| |Dpol|)))
         (D2 |List|
          (|Record| (|:| |lcmfij| |Expon|) (|:| |lcmcij| |Dom|)
                    (|:| |poli| |Dpol|) (|:| |polj| |Dpol|)))
         ($ |List|
          (|Record| (|:| |lcmfij| |Expon|) (|:| |lcmcij| |Dom|)
                    (|:| |poli| |Dpol|) (|:| |polj| |Dpol|))))
        (SPROG
         ((|dl2|
           #1=(|Record| (|:| |lcmfij| |Expon|) (|:| |lcmcij| |Dom|)
                        (|:| |poli| |Dpol|) (|:| |polj| |Dpol|)))
          (|dl1| #1#))
         (SEQ
          (COND ((NULL D1) D2) ((NULL D2) D1)
                (#2='T
                 (SEQ (LETT |dl1| (|SPADfirst| D1) . #3=(|GBEUCLID;updatD|))
                      (LETT |dl2| (|SPADfirst| D2) . #3#)
                      (EXIT
                       (COND
                        ((SPADCALL (QVELT |dl1| 0) (QVELT |dl2| 0)
                                   (QREFELT $ 28))
                         (CONS |dl1| (|GBEUCLID;updatD| (CDR D1) D2 $)))
                        (#2#
                         (CONS |dl2| (|GBEUCLID;updatD| D1 (CDR D2) $))))))))))) 

(SDEFUN |GBEUCLID;lepol| ((|p1| |Dpol|) ($ |Integer|))
        (SPROG ((|n| (|Integer|)))
               (SEQ (LETT |n| 0 . #1=(|GBEUCLID;lepol|))
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |p1| (|spadConstant| $ 38)
                                      (QREFELT $ 43)))
                           (GO G191)))
                         (SEQ (LETT |n| (+ |n| 1) . #1#)
                              (EXIT
                               (LETT |p1| (SPADCALL |p1| (QREFELT $ 46))
                                     . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |n|)))) 

(SDEFUN |GBEUCLID;prinb| ((|n| |Integer|) ($ |Void|))
        (SPROG ((#1=#:G882 NIL) (|i| NIL))
               (SEQ (LETT |i| 1 . #2=(|GBEUCLID;prinb|)) (LETT #1# |n| . #2#)
                    G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                    (SEQ (EXIT (SPADCALL "    " (QREFELT $ 61))))
                    (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL)))) 

(SDEFUN |GBEUCLID;prinshINFO| ((|h| |Dpol|) ($ |Void|))
        (SEQ (|GBEUCLID;prinb| 2 $)
             (SPADCALL " reduced Critpair - Polynom :" (QREFELT $ 61))
             (|GBEUCLID;prinb| 2 $)
             (SPADCALL (SPADCALL |h| (QREFELT $ 62)) (QREFELT $ 14))
             (EXIT (|GBEUCLID;prinb| 2 $)))) 

(SDEFUN |GBEUCLID;prindINFO|
        ((|cp| |Record| (|:| |lcmfij| |Expon|) (|:| |lcmcij| |Dom|)
          (|:| |poli| |Dpol|) (|:| |polj| |Dpol|))
         (|ps| |Dpol|) (|ph| |Dpol|) (|i1| |Integer|) (|i2| |Integer|)
         (|n| |Integer|) ($ |Integer|))
        (SPROG
         ((|ll|
           (|List|
            (|Record| (|:| |ci| |Dpol|) (|:| |tci| (|Integer|))
                      (|:| |cj| |Dpol|) (|:| |tcj| (|Integer|))
                      (|:| |c| |Dpol|) (|:| |tc| (|Integer|)) (|:| |rc| |Dpol|)
                      (|:| |trc| (|Integer|)) (|:| |tH| (|Integer|))
                      (|:| |tD| (|Integer|)))))
          (|a| (|Dom|)) (|cpj| (|Dpol|)) (|cpi| (|Dpol|)))
         (SEQ (LETT |cpi| (QVELT |cp| 2) . #1=(|GBEUCLID;prindINFO|))
              (LETT |cpj| (QVELT |cp| 3) . #1#)
              (COND
               ((EQL |n| 1)
                (SEQ (|GBEUCLID;prinb| 1 $)
                     (SPADCALL "you choose option  -info-  " (QREFELT $ 61))
                     (SPADCALL
                      "abbrev. for the following information strings are"
                      (QREFELT $ 61))
                     (SPADCALL
                      "  ci  =>  Leading monomial  for critpair calculation"
                      (QREFELT $ 61))
                     (SPADCALL "  tci =>  Number of terms of polynomial i"
                               (QREFELT $ 61))
                     (SPADCALL
                      "  cj  =>  Leading monomial  for critpair calculation"
                      (QREFELT $ 61))
                     (SPADCALL "  tcj =>  Number of terms of polynomial j"
                               (QREFELT $ 61))
                     (SPADCALL
                      "  c   =>  Leading monomial of critpair polynomial"
                      (QREFELT $ 61))
                     (SPADCALL
                      "  tc  =>  Number of terms of critpair polynomial"
                      (QREFELT $ 61))
                     (SPADCALL
                      "  rc  =>  Leading monomial of redcritpair polynomial"
                      (QREFELT $ 61))
                     (SPADCALL
                      "  trc =>  Number of terms of redcritpair polynomial"
                      (QREFELT $ 61))
                     (SPADCALL
                      "  tF  =>  Number of polynomials in reduction list F"
                      (QREFELT $ 61))
                     (SPADCALL "  tD  =>  Number of critpairs still to do"
                               (QREFELT $ 61))
                     (|GBEUCLID;prinb| 4 $) (EXIT (LETT |n| 2 . #1#)))))
              (|GBEUCLID;prinb| 1 $) (LETT |a| (|spadConstant| $ 34) . #1#)
              (EXIT
               (COND
                ((SPADCALL |ph| (|spadConstant| $ 38) (QREFELT $ 39))
                 (COND
                  ((SPADCALL |ps| (|spadConstant| $ 38) (QREFELT $ 39))
                   (SEQ
                    (LETT |ll|
                          (LIST
                           (VECTOR
                            (SPADCALL |a| (SPADCALL |cpi| (QREFELT $ 18))
                                      (QREFELT $ 44))
                            (|GBEUCLID;lepol| |cpi| $)
                            (SPADCALL |a| (SPADCALL |cpj| (QREFELT $ 18))
                                      (QREFELT $ 44))
                            (|GBEUCLID;lepol| |cpj| $) |ps| 0 |ph| 0 |i1|
                            |i2|))
                          . #1#)
                    (SPADCALL (SPADCALL |ll| (QREFELT $ 65)) (QREFELT $ 14))
                    (|GBEUCLID;prinb| 1 $) (EXIT |n|)))
                  (#2='T
                   (SEQ
                    (LETT |ll|
                          (LIST
                           (VECTOR
                            (SPADCALL |a| (SPADCALL |cpi| (QREFELT $ 18))
                                      (QREFELT $ 44))
                            (|GBEUCLID;lepol| |cpi| $)
                            (SPADCALL |a| (SPADCALL |cpj| (QREFELT $ 18))
                                      (QREFELT $ 44))
                            (|GBEUCLID;lepol| |cpj| $)
                            (SPADCALL |a| (SPADCALL |ps| (QREFELT $ 18))
                                      (QREFELT $ 44))
                            (|GBEUCLID;lepol| |ps| $) |ph| 0 |i1| |i2|))
                          . #1#)
                    (SPADCALL (SPADCALL |ll| (QREFELT $ 65)) (QREFELT $ 14))
                    (|GBEUCLID;prinb| 1 $) (EXIT |n|)))))
                (#2#
                 (SEQ
                  (LETT |ll|
                        (LIST
                         (VECTOR
                          (SPADCALL |a| (SPADCALL |cpi| (QREFELT $ 18))
                                    (QREFELT $ 44))
                          (|GBEUCLID;lepol| |cpi| $)
                          (SPADCALL |a| (SPADCALL |cpj| (QREFELT $ 18))
                                    (QREFELT $ 44))
                          (|GBEUCLID;lepol| |cpj| $)
                          (SPADCALL |a| (SPADCALL |ps| (QREFELT $ 18))
                                    (QREFELT $ 44))
                          (|GBEUCLID;lepol| |ps| $)
                          (SPADCALL |a| (SPADCALL |ph| (QREFELT $ 18))
                                    (QREFELT $ 44))
                          (|GBEUCLID;lepol| |ph| $) |i1| |i2|))
                        . #1#)
                  (SPADCALL (SPADCALL |ll| (QREFELT $ 65)) (QREFELT $ 14))
                  (|GBEUCLID;prinb| 1 $) (EXIT |n|)))))))) 

(SDEFUN |GBEUCLID;prinpolINFO| ((|pl| |List| |Dpol|) ($ |Void|))
        (SPROG ((|n| (|Integer|)))
               (SEQ (LETT |n| (LENGTH |pl|) |GBEUCLID;prinpolINFO|)
                    (|GBEUCLID;prinb| 1 $)
                    (EXIT
                     (COND
                      ((EQL |n| 1)
                       (SEQ
                        (SPADCALL "  There is 1  Groebner Basis Polynomial "
                                  (QREFELT $ 14))
                        (EXIT (|GBEUCLID;prinb| 2 $))))
                      ('T
                       (SEQ (SPADCALL "  There are " (QREFELT $ 14))
                            (|GBEUCLID;prinb| 1 $)
                            (SPADCALL (SPADCALL |n| (QREFELT $ 66))
                                      (QREFELT $ 14))
                            (|GBEUCLID;prinb| 1 $)
                            (SPADCALL "  Groebner Basis Polynomials. "
                                      (QREFELT $ 14))
                            (EXIT (|GBEUCLID;prinb| 2 $))))))))) 

(DECLAIM (NOTINLINE |EuclideanGroebnerBasisPackage;|)) 

(DEFUN |EuclideanGroebnerBasisPackage| (&REST #1=#:G898)
  (SPROG NIL
         (PROG (#2=#:G899)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|EuclideanGroebnerBasisPackage|)
                                               '|domainEqualList|)
                    . #3=(|EuclideanGroebnerBasisPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |EuclideanGroebnerBasisPackage;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|EuclideanGroebnerBasisPackage|)))))))))) 

(DEFUN |EuclideanGroebnerBasisPackage;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|EuclideanGroebnerBasisPackage|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|EuclideanGroebnerBasisPackage| DV$1 DV$2 DV$3 DV$4)
          . #1#)
    (LETT $ (GETREFV 67) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|EuclideanGroebnerBasisPackage|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|EuclideanGroebnerBasisPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|List| 9)
              |GBEUCLID;euclideanGroebner;2L;1| (|Void|) (|OutputForm|)
              (0 . |print|) (|String|) |GBEUCLID;euclideanGroebner;LSL;2|
              |GBEUCLID;euclideanGroebner;L2SL;3| (5 . |degree|) (|Boolean|)
              (10 . >) (16 . =) (22 . |leadingCoefficient|) (27 . |sizeLess?|)
              (|Mapping| 19 9 9) (33 . |sort|) (39 . |sup|) (45 . |lcm|)
              (51 . <)
              (|Record| (|:| |lcmfij| 7) (|:| |lcmcij| 6) (|:| |poli| 9)
                        (|:| |polj| 9))
              (|Mapping| 19 29 29) (|List| 29) (57 . |sort|) (63 . =)
              (69 . |One|) (73 . |One|) (77 . |Zero|) (81 . |Zero|)
              (85 . |Zero|) (89 . =) (95 . |unitCanonical|) (|Integer|)
              (100 . ~=) (106 . ~=) (112 . |monomial|) (118 . +)
              (124 . |reductum|) (129 . |append|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (135 . |extendedEuclidean|) (|Union| $ '"failed")
              (141 . |subtractIfCan|) (147 . *) (153 . *) (159 . |exquo|)
              (165 . -) (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (171 . |divide|) (177 . +) (183 . *)
              |GBEUCLID;euclideanNormalForm;DpolLDpol;19|
              (189 . |messagePrint|) (194 . |coerce|)
              (|Record| (|:| |ci| 9) (|:| |tci| 41) (|:| |cj| 9) (|:| |tcj| 41)
                        (|:| |c| 9) (|:| |tc| 41) (|:| |rc| 9) (|:| |trc| 41)
                        (|:| |tH| 41) (|:| |tD| 41))
              (|List| 63) (199 . |coerce|) (204 . |coerce|))
           '#(|euclideanNormalForm| 209 |euclideanGroebner| 215) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 66
                                                 '(1 13 12 0 14 1 9 7 0 18 2 7
                                                   19 0 0 20 2 7 19 0 0 21 1 9
                                                   6 0 22 2 6 19 0 0 23 2 10 0
                                                   24 0 25 2 7 0 0 0 26 2 6 0 0
                                                   0 27 2 7 19 0 0 28 2 31 0 30
                                                   0 32 2 6 19 0 0 33 0 6 0 34
                                                   0 9 0 35 0 6 0 36 0 7 0 37 0
                                                   9 0 38 2 9 19 0 0 39 1 9 0 0
                                                   40 2 41 19 0 0 42 2 9 19 0 0
                                                   43 2 9 0 6 7 44 2 9 0 0 0 45
                                                   1 9 0 0 46 2 10 0 0 0 47 2 6
                                                   48 0 0 49 2 7 50 0 0 51 2 9
                                                   0 0 0 52 2 9 0 6 0 53 2 6 50
                                                   0 0 54 2 9 0 0 0 55 2 6 56 0
                                                   0 57 2 7 0 0 0 58 2 6 0 0 0
                                                   59 1 13 12 15 61 1 9 13 0 62
                                                   1 64 13 0 65 1 41 13 0 66 2
                                                   0 9 9 10 60 1 0 10 10 11 3 0
                                                   10 10 15 15 17 2 0 10 10 15
                                                   16)))))
           '|lookupComplete|)) 
