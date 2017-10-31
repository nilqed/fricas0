
(SDEFUN |OC-;characteristic;Nni;1| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 9))) 

(SDEFUN |OC-;conjugate;2S;2| ((|x| S) ($ S))
        (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 13))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 14)) (QREFELT $ 13))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 13))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 16)) (QREFELT $ 13))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 17)) (QREFELT $ 13))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 18)) (QREFELT $ 13))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 19)) (QREFELT $ 13))
                  (QREFELT $ 20))) 

(SDEFUN |OC-;map;M2S;3| ((|fn| |Mapping| R R) (|x| S) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 11)) |fn|)
                  (SPADCALL (SPADCALL |x| (QREFELT $ 12)) |fn|)
                  (SPADCALL (SPADCALL |x| (QREFELT $ 14)) |fn|)
                  (SPADCALL (SPADCALL |x| (QREFELT $ 15)) |fn|)
                  (SPADCALL (SPADCALL |x| (QREFELT $ 16)) |fn|)
                  (SPADCALL (SPADCALL |x| (QREFELT $ 17)) |fn|)
                  (SPADCALL (SPADCALL |x| (QREFELT $ 18)) |fn|)
                  (SPADCALL (SPADCALL |x| (QREFELT $ 19)) |fn|) (QREFELT $ 20))) 

(SDEFUN |OC-;norm;SR;4| ((|x| S) ($ R))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL
            (SPADCALL
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                         (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 24))
               (SPADCALL (SPADCALL |x| (QREFELT $ 12))
                         (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 24))
               (QREFELT $ 25))
              (SPADCALL (SPADCALL |x| (QREFELT $ 14))
                        (SPADCALL |x| (QREFELT $ 14)) (QREFELT $ 24))
              (QREFELT $ 25))
             (SPADCALL (SPADCALL |x| (QREFELT $ 15))
                       (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 24))
             (QREFELT $ 25))
            (SPADCALL (SPADCALL |x| (QREFELT $ 16))
                      (SPADCALL |x| (QREFELT $ 16)) (QREFELT $ 24))
            (QREFELT $ 25))
           (SPADCALL (SPADCALL |x| (QREFELT $ 17))
                     (SPADCALL |x| (QREFELT $ 17)) (QREFELT $ 24))
           (QREFELT $ 25))
          (SPADCALL (SPADCALL |x| (QREFELT $ 18)) (SPADCALL |x| (QREFELT $ 18))
                    (QREFELT $ 24))
          (QREFELT $ 25))
         (SPADCALL (SPADCALL |x| (QREFELT $ 19)) (SPADCALL |x| (QREFELT $ 19))
                   (QREFELT $ 24))
         (QREFELT $ 25))) 

(SDEFUN |OC-;=;2SB;5| ((|x| S) (|y| S) ($ |Boolean|))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 11)) (SPADCALL |y| (QREFELT $ 11))
                    (QREFELT $ 28))
          (COND
           ((SPADCALL (SPADCALL |x| (QREFELT $ 12))
                      (SPADCALL |y| (QREFELT $ 12)) (QREFELT $ 28))
            (COND
             ((SPADCALL (SPADCALL |x| (QREFELT $ 14))
                        (SPADCALL |y| (QREFELT $ 14)) (QREFELT $ 28))
              (COND
               ((SPADCALL (SPADCALL |x| (QREFELT $ 15))
                          (SPADCALL |y| (QREFELT $ 15)) (QREFELT $ 28))
                (COND
                 ((SPADCALL (SPADCALL |x| (QREFELT $ 16))
                            (SPADCALL |y| (QREFELT $ 16)) (QREFELT $ 28))
                  (COND
                   ((SPADCALL (SPADCALL |x| (QREFELT $ 17))
                              (SPADCALL |y| (QREFELT $ 17)) (QREFELT $ 28))
                    (COND
                     ((SPADCALL (SPADCALL |x| (QREFELT $ 18))
                                (SPADCALL |y| (QREFELT $ 18)) (QREFELT $ 28))
                      (SPADCALL (SPADCALL |x| (QREFELT $ 19))
                                (SPADCALL |y| (QREFELT $ 19)) (QREFELT $ 28)))
                     (#1='T NIL)))
                   (#1# NIL)))
                 (#1# NIL)))
               (#1# NIL)))
             (#1# NIL)))
           (#1# NIL)))
         (#1# NIL))) 

(SDEFUN |OC-;+;3S;6| ((|x| S) (|y| S) ($ S))
        (SPADCALL
         (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (SPADCALL |y| (QREFELT $ 11))
                   (QREFELT $ 25))
         (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (SPADCALL |y| (QREFELT $ 12))
                   (QREFELT $ 25))
         (SPADCALL (SPADCALL |x| (QREFELT $ 14)) (SPADCALL |y| (QREFELT $ 14))
                   (QREFELT $ 25))
         (SPADCALL (SPADCALL |x| (QREFELT $ 15)) (SPADCALL |y| (QREFELT $ 15))
                   (QREFELT $ 25))
         (SPADCALL (SPADCALL |x| (QREFELT $ 16)) (SPADCALL |y| (QREFELT $ 16))
                   (QREFELT $ 25))
         (SPADCALL (SPADCALL |x| (QREFELT $ 17)) (SPADCALL |y| (QREFELT $ 17))
                   (QREFELT $ 25))
         (SPADCALL (SPADCALL |x| (QREFELT $ 18)) (SPADCALL |y| (QREFELT $ 18))
                   (QREFELT $ 25))
         (SPADCALL (SPADCALL |x| (QREFELT $ 19)) (SPADCALL |y| (QREFELT $ 19))
                   (QREFELT $ 25))
         (QREFELT $ 20))) 

(SDEFUN |OC-;-;2S;7| ((|x| S) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 13))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 13))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 14)) (QREFELT $ 13))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 13))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 16)) (QREFELT $ 13))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 17)) (QREFELT $ 13))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 18)) (QREFELT $ 13))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 19)) (QREFELT $ 13))
                  (QREFELT $ 20))) 

(SDEFUN |OC-;*;R2S;8| ((|r| R) (|x| S) ($ S))
        (SPADCALL (SPADCALL |r| (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 24))
                  (SPADCALL |r| (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 24))
                  (SPADCALL |r| (SPADCALL |x| (QREFELT $ 14)) (QREFELT $ 24))
                  (SPADCALL |r| (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 24))
                  (SPADCALL |r| (SPADCALL |x| (QREFELT $ 16)) (QREFELT $ 24))
                  (SPADCALL |r| (SPADCALL |x| (QREFELT $ 17)) (QREFELT $ 24))
                  (SPADCALL |r| (SPADCALL |x| (QREFELT $ 18)) (QREFELT $ 24))
                  (SPADCALL |r| (SPADCALL |x| (QREFELT $ 19)) (QREFELT $ 24))
                  (QREFELT $ 20))) 

(SDEFUN |OC-;*;I2S;9| ((|n| |Integer|) (|x| S) ($ S))
        (SPADCALL (SPADCALL |n| (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 34))
                  (SPADCALL |n| (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 34))
                  (SPADCALL |n| (SPADCALL |x| (QREFELT $ 14)) (QREFELT $ 34))
                  (SPADCALL |n| (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 34))
                  (SPADCALL |n| (SPADCALL |x| (QREFELT $ 16)) (QREFELT $ 34))
                  (SPADCALL |n| (SPADCALL |x| (QREFELT $ 17)) (QREFELT $ 34))
                  (SPADCALL |n| (SPADCALL |x| (QREFELT $ 18)) (QREFELT $ 34))
                  (SPADCALL |n| (SPADCALL |x| (QREFELT $ 19)) (QREFELT $ 34))
                  (QREFELT $ 20))) 

(SDEFUN |OC-;coerce;RS;10| ((|r| R) ($ S))
        (SPADCALL |r| (|spadConstant| $ 36) (|spadConstant| $ 36)
                  (|spadConstant| $ 36) (|spadConstant| $ 36)
                  (|spadConstant| $ 36) (|spadConstant| $ 36)
                  (|spadConstant| $ 36) (QREFELT $ 20))) 

(SDEFUN |OC-;coerce;IS;11| ((|n| |Integer|) ($ S))
        (SPADCALL (SPADCALL |n| (QREFELT $ 38)) (|spadConstant| $ 36)
                  (|spadConstant| $ 36) (|spadConstant| $ 36)
                  (|spadConstant| $ 36) (|spadConstant| $ 36)
                  (|spadConstant| $ 36) (|spadConstant| $ 36) (QREFELT $ 20))) 

(SDEFUN |OC-;zero?;SB;12| ((|x| S) ($ |Boolean|))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 40))
          (COND
           ((SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 40))
            (COND
             ((SPADCALL (SPADCALL |x| (QREFELT $ 14)) (QREFELT $ 40))
              (COND
               ((SPADCALL (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 40))
                (COND
                 ((SPADCALL (SPADCALL |x| (QREFELT $ 16)) (QREFELT $ 40))
                  (COND
                   ((SPADCALL (SPADCALL |x| (QREFELT $ 17)) (QREFELT $ 40))
                    (COND
                     ((SPADCALL (SPADCALL |x| (QREFELT $ 18)) (QREFELT $ 40))
                      (SPADCALL (SPADCALL |x| (QREFELT $ 19)) (QREFELT $ 40)))
                     (#1='T NIL)))
                   (#1# NIL)))
                 (#1# NIL)))
               (#1# NIL)))
             (#1# NIL)))
           (#1# NIL)))
         (#1# NIL))) 

(SDEFUN |OC-;retract;SR;13| ((|x| S) ($ R))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 40))
           (COND
            ((SPADCALL (SPADCALL |x| (QREFELT $ 14)) (QREFELT $ 40))
             (COND
              ((SPADCALL (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 40))
               (COND
                ((SPADCALL (SPADCALL |x| (QREFELT $ 16)) (QREFELT $ 40))
                 (COND
                  ((SPADCALL (SPADCALL |x| (QREFELT $ 17)) (QREFELT $ 40))
                   (COND
                    ((SPADCALL (SPADCALL |x| (QREFELT $ 18)) (QREFELT $ 40))
                     (COND
                      ((NULL
                        (SPADCALL (SPADCALL |x| (QREFELT $ 19))
                                  (QREFELT $ 40)))
                       (EXIT (|error| #1="Cannot retract octonion.")))))
                    (#2='T (EXIT (|error| #1#)))))
                  (#2# (EXIT (|error| #1#)))))
                (#2# (EXIT (|error| #1#)))))
              (#2# (EXIT (|error| #1#)))))
            (#2# (EXIT (|error| #1#)))))
          (#2# (EXIT (|error| #1#))))
         (EXIT (SPADCALL |x| (QREFELT $ 11))))) 

(SDEFUN |OC-;retractIfCan;SU;14| ((|x| S) ($ |Union| R "failed"))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 40))
           (COND
            ((SPADCALL (SPADCALL |x| (QREFELT $ 14)) (QREFELT $ 40))
             (COND
              ((SPADCALL (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 40))
               (COND
                ((SPADCALL (SPADCALL |x| (QREFELT $ 16)) (QREFELT $ 40))
                 (COND
                  ((SPADCALL (SPADCALL |x| (QREFELT $ 17)) (QREFELT $ 40))
                   (COND
                    ((SPADCALL (SPADCALL |x| (QREFELT $ 18)) (QREFELT $ 40))
                     (COND
                      ((NULL
                        (SPADCALL (SPADCALL |x| (QREFELT $ 19))
                                  (QREFELT $ 40)))
                       (EXIT (CONS 1 #1="failed")))))
                    (#2='T (EXIT (CONS 1 #1#)))))
                  (#2# (EXIT (CONS 1 #1#)))))
                (#2# (EXIT (CONS 1 #1#)))))
              (#2# (EXIT (CONS 1 #1#)))))
            (#2# (EXIT (CONS 1 #1#)))))
          (#2# (EXIT (CONS 1 #1#))))
         (EXIT (CONS 0 (SPADCALL |x| (QREFELT $ 11)))))) 

(SDEFUN |OC-;coerce;SOf;15| ((|x| S) ($ |OutputForm|))
        (SPROG ((|part| (|OutputForm|)) (|z| (|OutputForm|)) (|y| (S)))
               (SEQ
                (COND
                 ((SPADCALL |x| (QREFELT $ 45))
                  (SPADCALL (|spadConstant| $ 36) (QREFELT $ 47)))
                 ((NULL
                   (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 40)))
                  (SEQ
                   (LETT |y|
                         (SPADCALL (|spadConstant| $ 36)
                                   (SPADCALL |x| (QREFELT $ 12))
                                   (SPADCALL |x| (QREFELT $ 14))
                                   (SPADCALL |x| (QREFELT $ 15))
                                   (SPADCALL |x| (QREFELT $ 16))
                                   (SPADCALL |x| (QREFELT $ 17))
                                   (SPADCALL |x| (QREFELT $ 18))
                                   (SPADCALL |x| (QREFELT $ 19))
                                   (QREFELT $ 20))
                         . #1=(|OC-;coerce;SOf;15|))
                   (EXIT
                    (COND
                     ((SPADCALL |y| (QREFELT $ 45))
                      (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 47)))
                     (#2='T
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 47))
                       (SPADCALL |y| (QREFELT $ 48)) (QREFELT $ 49)))))))
                 ((NULL
                   (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 40)))
                  (SEQ
                   (LETT |y|
                         (SPADCALL (|spadConstant| $ 36) (|spadConstant| $ 36)
                                   (SPADCALL |x| (QREFELT $ 14))
                                   (SPADCALL |x| (QREFELT $ 15))
                                   (SPADCALL |x| (QREFELT $ 16))
                                   (SPADCALL |x| (QREFELT $ 17))
                                   (SPADCALL |x| (QREFELT $ 18))
                                   (SPADCALL |x| (QREFELT $ 19))
                                   (QREFELT $ 20))
                         . #1#)
                   (LETT |z|
                         (SEQ
                          (LETT |part| (SPADCALL '|i| (QREFELT $ 51)) . #1#)
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |x| (QREFELT $ 12))
                                       (|spadConstant| $ 52) (QREFELT $ 28))
                             |part|)
                            (#2#
                             (SPADCALL
                              (SPADCALL (SPADCALL |x| (QREFELT $ 12))
                                        (QREFELT $ 47))
                              |part| (QREFELT $ 53))))))
                         . #1#)
                   (EXIT
                    (COND ((SPADCALL |y| (QREFELT $ 45)) |z|)
                          (#2#
                           (SPADCALL |z| (SPADCALL |y| (QREFELT $ 48))
                                     (QREFELT $ 49)))))))
                 ((NULL
                   (SPADCALL (SPADCALL |x| (QREFELT $ 14)) (QREFELT $ 40)))
                  (SEQ
                   (LETT |y|
                         (SPADCALL (|spadConstant| $ 36) (|spadConstant| $ 36)
                                   (|spadConstant| $ 36)
                                   (SPADCALL |x| (QREFELT $ 15))
                                   (SPADCALL |x| (QREFELT $ 16))
                                   (SPADCALL |x| (QREFELT $ 17))
                                   (SPADCALL |x| (QREFELT $ 18))
                                   (SPADCALL |x| (QREFELT $ 19))
                                   (QREFELT $ 20))
                         . #1#)
                   (LETT |z|
                         (SEQ
                          (LETT |part| (SPADCALL '|j| (QREFELT $ 51)) . #1#)
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |x| (QREFELT $ 14))
                                       (|spadConstant| $ 52) (QREFELT $ 28))
                             |part|)
                            (#2#
                             (SPADCALL
                              (SPADCALL (SPADCALL |x| (QREFELT $ 14))
                                        (QREFELT $ 47))
                              |part| (QREFELT $ 53))))))
                         . #1#)
                   (EXIT
                    (COND ((SPADCALL |y| (QREFELT $ 45)) |z|)
                          (#2#
                           (SPADCALL |z| (SPADCALL |y| (QREFELT $ 48))
                                     (QREFELT $ 49)))))))
                 ((NULL
                   (SPADCALL (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 40)))
                  (SEQ
                   (LETT |y|
                         (SPADCALL (|spadConstant| $ 36) (|spadConstant| $ 36)
                                   (|spadConstant| $ 36) (|spadConstant| $ 36)
                                   (SPADCALL |x| (QREFELT $ 16))
                                   (SPADCALL |x| (QREFELT $ 17))
                                   (SPADCALL |x| (QREFELT $ 18))
                                   (SPADCALL |x| (QREFELT $ 19))
                                   (QREFELT $ 20))
                         . #1#)
                   (LETT |z|
                         (SEQ
                          (LETT |part| (SPADCALL '|k| (QREFELT $ 51)) . #1#)
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |x| (QREFELT $ 15))
                                       (|spadConstant| $ 52) (QREFELT $ 28))
                             |part|)
                            (#2#
                             (SPADCALL
                              (SPADCALL (SPADCALL |x| (QREFELT $ 15))
                                        (QREFELT $ 47))
                              |part| (QREFELT $ 53))))))
                         . #1#)
                   (EXIT
                    (COND ((SPADCALL |y| (QREFELT $ 45)) |z|)
                          (#2#
                           (SPADCALL |z| (SPADCALL |y| (QREFELT $ 48))
                                     (QREFELT $ 49)))))))
                 ((NULL
                   (SPADCALL (SPADCALL |x| (QREFELT $ 16)) (QREFELT $ 40)))
                  (SEQ
                   (LETT |y|
                         (SPADCALL (|spadConstant| $ 36) (|spadConstant| $ 36)
                                   (|spadConstant| $ 36) (|spadConstant| $ 36)
                                   (|spadConstant| $ 36)
                                   (SPADCALL |x| (QREFELT $ 17))
                                   (SPADCALL |x| (QREFELT $ 18))
                                   (SPADCALL |x| (QREFELT $ 19))
                                   (QREFELT $ 20))
                         . #1#)
                   (LETT |z|
                         (SEQ (LETT |part| (SPADCALL 'E (QREFELT $ 51)) . #1#)
                              (EXIT
                               (COND
                                ((SPADCALL (SPADCALL |x| (QREFELT $ 16))
                                           (|spadConstant| $ 52)
                                           (QREFELT $ 28))
                                 |part|)
                                (#2#
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |x| (QREFELT $ 16))
                                            (QREFELT $ 47))
                                  |part| (QREFELT $ 53))))))
                         . #1#)
                   (EXIT
                    (COND ((SPADCALL |y| (QREFELT $ 45)) |z|)
                          (#2#
                           (SPADCALL |z| (SPADCALL |y| (QREFELT $ 48))
                                     (QREFELT $ 49)))))))
                 ((NULL
                   (SPADCALL (SPADCALL |x| (QREFELT $ 17)) (QREFELT $ 40)))
                  (SEQ
                   (LETT |y|
                         (SPADCALL (|spadConstant| $ 36) (|spadConstant| $ 36)
                                   (|spadConstant| $ 36) (|spadConstant| $ 36)
                                   (|spadConstant| $ 36) (|spadConstant| $ 36)
                                   (SPADCALL |x| (QREFELT $ 18))
                                   (SPADCALL |x| (QREFELT $ 19))
                                   (QREFELT $ 20))
                         . #1#)
                   (LETT |z|
                         (SEQ (LETT |part| (SPADCALL 'I (QREFELT $ 51)) . #1#)
                              (EXIT
                               (COND
                                ((SPADCALL (SPADCALL |x| (QREFELT $ 17))
                                           (|spadConstant| $ 52)
                                           (QREFELT $ 28))
                                 |part|)
                                (#2#
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |x| (QREFELT $ 17))
                                            (QREFELT $ 47))
                                  |part| (QREFELT $ 53))))))
                         . #1#)
                   (EXIT
                    (COND ((SPADCALL |y| (QREFELT $ 45)) |z|)
                          (#2#
                           (SPADCALL |z| (SPADCALL |y| (QREFELT $ 48))
                                     (QREFELT $ 49)))))))
                 ((NULL
                   (SPADCALL (SPADCALL |x| (QREFELT $ 18)) (QREFELT $ 40)))
                  (SEQ
                   (LETT |y|
                         (SPADCALL (|spadConstant| $ 36) (|spadConstant| $ 36)
                                   (|spadConstant| $ 36) (|spadConstant| $ 36)
                                   (|spadConstant| $ 36) (|spadConstant| $ 36)
                                   (|spadConstant| $ 36)
                                   (SPADCALL |x| (QREFELT $ 19))
                                   (QREFELT $ 20))
                         . #1#)
                   (LETT |z|
                         (SEQ (LETT |part| (SPADCALL 'J (QREFELT $ 51)) . #1#)
                              (EXIT
                               (COND
                                ((SPADCALL (SPADCALL |x| (QREFELT $ 18))
                                           (|spadConstant| $ 52)
                                           (QREFELT $ 28))
                                 |part|)
                                (#2#
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |x| (QREFELT $ 18))
                                            (QREFELT $ 47))
                                  |part| (QREFELT $ 53))))))
                         . #1#)
                   (EXIT
                    (COND ((SPADCALL |y| (QREFELT $ 45)) |z|)
                          (#2#
                           (SPADCALL |z| (SPADCALL |y| (QREFELT $ 48))
                                     (QREFELT $ 49)))))))
                 ('T
                  (SEQ (LETT |part| (SPADCALL 'K (QREFELT $ 51)) . #1#)
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |x| (QREFELT $ 19))
                                    (|spadConstant| $ 52) (QREFELT $ 28))
                          |part|)
                         (#2#
                          (SPADCALL
                           (SPADCALL (SPADCALL |x| (QREFELT $ 19))
                                     (QREFELT $ 47))
                           |part| (QREFELT $ 53))))))))))) 

(SDEFUN |OC-;inv;2S;16| ((|x| S) ($ S))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 55)) (|spadConstant| $ 36)
                    (QREFELT $ 28))
          (|error| "This octonion is not invertible."))
         ('T
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 55)) (QREFELT $ 56))
                    (SPADCALL |x| (QREFELT $ 57)) (QREFELT $ 58))))) 

(SDEFUN |OC-;convert;SIf;17| ((|x| S) ($ |InputForm|))
        (SPROG ((|l| (|List| (|InputForm|))))
               (SEQ
                (LETT |l|
                      (LIST (SPADCALL '|octon| (QREFELT $ 61))
                            (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                                      (QREFELT $ 62))
                            (SPADCALL (SPADCALL |x| (QREFELT $ 12))
                                      (QREFELT $ 62))
                            (SPADCALL (SPADCALL |x| (QREFELT $ 14))
                                      (QREFELT $ 62))
                            (SPADCALL (SPADCALL |x| (QREFELT $ 15))
                                      (QREFELT $ 62))
                            (SPADCALL (SPADCALL |x| (QREFELT $ 16))
                                      (QREFELT $ 62))
                            (SPADCALL (SPADCALL |x| (QREFELT $ 17))
                                      (QREFELT $ 62))
                            (SPADCALL (SPADCALL |x| (QREFELT $ 18))
                                      (QREFELT $ 62))
                            (SPADCALL (SPADCALL |x| (QREFELT $ 19))
                                      (QREFELT $ 62)))
                      |OC-;convert;SIf;17|)
                (EXIT (SPADCALL |l| (QREFELT $ 64)))))) 

(SDEFUN |OC-;<;2SB;18| ((|x| S) (|y| S) ($ |Boolean|))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 11)) (SPADCALL |y| (QREFELT $ 11))
                    (QREFELT $ 28))
          (COND
           ((SPADCALL (SPADCALL |x| (QREFELT $ 12))
                      (SPADCALL |y| (QREFELT $ 12)) (QREFELT $ 28))
            (COND
             ((SPADCALL (SPADCALL |x| (QREFELT $ 14))
                        (SPADCALL |y| (QREFELT $ 14)) (QREFELT $ 28))
              (COND
               ((SPADCALL (SPADCALL |x| (QREFELT $ 15))
                          (SPADCALL |y| (QREFELT $ 15)) (QREFELT $ 28))
                (COND
                 ((SPADCALL (SPADCALL |x| (QREFELT $ 16))
                            (SPADCALL |y| (QREFELT $ 16)) (QREFELT $ 28))
                  (COND
                   ((SPADCALL (SPADCALL |x| (QREFELT $ 17))
                              (SPADCALL |y| (QREFELT $ 17)) (QREFELT $ 28))
                    (COND
                     ((SPADCALL (SPADCALL |x| (QREFELT $ 18))
                                (SPADCALL |y| (QREFELT $ 18)) (QREFELT $ 28))
                      (SPADCALL (SPADCALL |x| (QREFELT $ 19))
                                (SPADCALL |y| (QREFELT $ 19)) (QREFELT $ 66)))
                     (#1='T
                      (SPADCALL (SPADCALL |x| (QREFELT $ 18))
                                (SPADCALL |y| (QREFELT $ 18))
                                (QREFELT $ 66)))))
                   (#1#
                    (SPADCALL (SPADCALL |x| (QREFELT $ 17))
                              (SPADCALL |y| (QREFELT $ 17)) (QREFELT $ 66)))))
                 (#1#
                  (SPADCALL (SPADCALL |x| (QREFELT $ 16))
                            (SPADCALL |y| (QREFELT $ 16)) (QREFELT $ 66)))))
               (#1#
                (SPADCALL (SPADCALL |x| (QREFELT $ 15))
                          (SPADCALL |y| (QREFELT $ 15)) (QREFELT $ 66)))))
             (#1#
              (SPADCALL (SPADCALL |x| (QREFELT $ 14))
                        (SPADCALL |y| (QREFELT $ 14)) (QREFELT $ 66)))))
           (#1#
            (SPADCALL (SPADCALL |x| (QREFELT $ 12))
                      (SPADCALL |y| (QREFELT $ 12)) (QREFELT $ 66)))))
         (#1#
          (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (SPADCALL |y| (QREFELT $ 11))
                    (QREFELT $ 66))))) 

(SDEFUN |OC-;abs;SR;19| ((|x| S) ($ R))
        (SPADCALL (SPADCALL |x| (QREFELT $ 55)) (QREFELT $ 68))) 

(SDEFUN |OC-;rational?;SB;20| ((|x| S) ($ |Boolean|))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 40))
          (COND
           ((SPADCALL (SPADCALL |x| (QREFELT $ 14)) (QREFELT $ 40))
            (COND
             ((SPADCALL (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 40))
              (COND
               ((SPADCALL (SPADCALL |x| (QREFELT $ 16)) (QREFELT $ 40))
                (COND
                 ((SPADCALL (SPADCALL |x| (QREFELT $ 17)) (QREFELT $ 40))
                  (COND
                   ((SPADCALL (SPADCALL |x| (QREFELT $ 18)) (QREFELT $ 40))
                    (SPADCALL (SPADCALL |x| (QREFELT $ 19)) (QREFELT $ 40)))
                   (#1='T NIL)))
                 (#1# NIL)))
               (#1# NIL)))
             (#1# NIL)))
           (#1# NIL)))
         (#1# NIL))) 

(SDEFUN |OC-;rational;SF;21| ((|x| S) ($ |Fraction| (|Integer|)))
        (COND
         ((SPADCALL |x| (QREFELT $ 71))
          (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 73)))
         ('T (|error| "Not a rational number")))) 

(SDEFUN |OC-;rationalIfCan;SU;22|
        ((|x| S) ($ |Union| (|Fraction| (|Integer|)) "failed"))
        (COND
         ((SPADCALL |x| (QREFELT $ 71))
          (CONS 0 (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 73))))
         ('T (CONS 1 "failed")))) 

(DECLAIM (NOTINLINE |OctonionCategory&;|)) 

(DEFUN |OctonionCategory&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|OctonionCategory&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|OctonionCategory&| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 79) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2| '(|Field|))
                                              (|HasCategory| |#2|
                                                             '(|IntegerNumberSystem|))
                                              (|HasCategory| |#2|
                                                             '(|RealNumberSystem|))
                                              (|HasCategory| |#2|
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| |#2|
                                                             '(|CharacteristicZero|))
                                              (|HasCategory| |#2|
                                                             '(|ConvertibleTo|
                                                               (|InputForm|)))
                                              (|HasCategory| |#2|
                                                             '(|OrderedSet|))
                                              (|HasCategory| |#2|
                                                             '(|Finite|))))
                          . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV $ 59 (CONS (|dispatchFunction| |OC-;inv;2S;16|) $))))
          (COND
           ((|testBitVector| |pv$| 6)
            (QSETREFV $ 65
                      (CONS (|dispatchFunction| |OC-;convert;SIf;17|) $))))
          (COND
           ((|testBitVector| |pv$| 7)
            (QSETREFV $ 67 (CONS (|dispatchFunction| |OC-;<;2SB;18|) $))))
          (COND
           ((|testBitVector| |pv$| 3)
            (QSETREFV $ 69 (CONS (|dispatchFunction| |OC-;abs;SR;19|) $))))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV $ 70
                       (CONS (|dispatchFunction| |OC-;rational?;SB;20|) $))
             (QSETREFV $ 74 (CONS (|dispatchFunction| |OC-;rational;SF;21|) $))
             (QSETREFV $ 76
                       (CONS (|dispatchFunction| |OC-;rationalIfCan;SU;22|)
                             $)))))
          $))) 

(MAKEPROP '|OctonionCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|NonNegativeInteger|) (0 . |characteristic|)
              |OC-;characteristic;Nni;1| (4 . |real|) (9 . |imagi|) (14 . -)
              (19 . |imagj|) (24 . |imagk|) (29 . |imagE|) (34 . |imagI|)
              (39 . |imagJ|) (44 . |imagK|) (49 . |octon|) |OC-;conjugate;2S;2|
              (|Mapping| 7 7) |OC-;map;M2S;3| (61 . *) (67 . +) |OC-;norm;SR;4|
              (|Boolean|) (73 . =) |OC-;=;2SB;5| |OC-;+;3S;6| |OC-;-;2S;7|
              |OC-;*;R2S;8| (|Integer|) (79 . *) |OC-;*;I2S;9| (85 . |Zero|)
              |OC-;coerce;RS;10| (89 . |coerce|) |OC-;coerce;IS;11|
              (94 . |zero?|) |OC-;zero?;SB;12| |OC-;retract;SR;13|
              (|Union| 7 '"failed") |OC-;retractIfCan;SU;14| (99 . |zero?|)
              (|OutputForm|) (104 . |coerce|) (109 . |coerce|) (114 . +)
              (|Symbol|) (120 . |coerce|) (125 . |One|) (129 . *)
              |OC-;coerce;SOf;15| (135 . |norm|) (140 . |inv|)
              (145 . |conjugate|) (150 . *) (156 . |inv|) (|InputForm|)
              (161 . |convert|) (166 . |convert|) (|List| $) (171 . |convert|)
              (176 . |convert|) (181 . <) (187 . <) (193 . |sqrt|)
              (198 . |abs|) (203 . |rational?|) (208 . |rational?|)
              (|Fraction| 33) (213 . |rational|) (218 . |rational|)
              (|Union| 72 '"failed") (223 . |rationalIfCan|)
              (|Union| 33 '"failed") (|PositiveInteger|))
           '#(|zero?| 228 |retractIfCan| 233 |retract| 238 |rationalIfCan| 243
              |rational?| 248 |rational| 253 |norm| 258 |map| 263 |inv| 269
              |convert| 274 |conjugate| 279 |coerce| 284 |characteristic| 299
              |abs| 303 = 308 < 314 - 320 + 325 * 331)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 76
                                                 '(0 7 8 9 1 6 7 0 11 1 6 7 0
                                                   12 1 7 0 0 13 1 6 7 0 14 1 6
                                                   7 0 15 1 6 7 0 16 1 6 7 0 17
                                                   1 6 7 0 18 1 6 7 0 19 8 6 0
                                                   7 7 7 7 7 7 7 7 20 2 7 0 0 0
                                                   24 2 7 0 0 0 25 2 7 27 0 0
                                                   28 2 7 0 33 0 34 0 7 0 36 1
                                                   7 0 33 38 1 7 27 0 40 1 6 27
                                                   0 45 1 7 46 0 47 1 6 46 0 48
                                                   2 46 0 0 0 49 1 50 46 0 51 0
                                                   7 0 52 2 46 0 0 0 53 1 6 7 0
                                                   55 1 7 0 0 56 1 6 0 0 57 2 6
                                                   0 7 0 58 1 0 0 0 59 1 60 0
                                                   50 61 1 7 60 0 62 1 60 0 63
                                                   64 1 0 60 0 65 2 7 27 0 0 66
                                                   2 0 27 0 0 67 1 7 0 0 68 1 0
                                                   7 0 69 1 0 27 0 70 1 6 27 0
                                                   71 1 7 72 0 73 1 0 72 0 74 1
                                                   0 75 0 76 1 0 27 0 41 1 0 43
                                                   0 44 1 0 7 0 42 1 0 75 0 76
                                                   1 0 27 0 70 1 0 72 0 74 1 0
                                                   7 0 26 2 0 0 22 0 23 1 0 0 0
                                                   59 1 0 60 0 65 1 0 0 0 21 1
                                                   0 0 7 37 1 0 0 33 39 1 0 46
                                                   0 54 0 0 8 10 1 0 7 0 69 2 0
                                                   27 0 0 29 2 0 27 0 0 67 1 0
                                                   0 0 31 2 0 0 0 0 30 2 0 0 7
                                                   0 32 2 0 0 33 0 35)))))
           '|lookupComplete|)) 
