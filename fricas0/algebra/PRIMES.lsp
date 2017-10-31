
(SDEFUN |PRIMES;primes;2IL;1| ((|m| I) (|n| I) ($ |List| I))
        (SPROG
         ((|ll| (|List| I)) (#1=#:G738 NIL) (|k| NIL) (#2=#:G737 NIL)
          (|m0| (I)))
         (SEQ
          (COND
           ((SPADCALL |m| (|spadConstant| $ 34) (QREFELT $ 36))
            (LETT |m| (|spadConstant| $ 11) . #3=(|PRIMES;primes;2IL;1|))))
          (LETT |m0| |m| . #3#)
          (COND
           ((OR (SPADCALL |n| (QREFELT $ 17) (QREFELT $ 36))
                (SPADCALL |n| |m| (QREFELT $ 36)))
            (EXIT NIL)))
          (COND
           ((SPADCALL |m| (QREFELT $ 37))
            (LETT |m| (SPADCALL |m| (|spadConstant| $ 11) (QREFELT $ 38))
                  . #3#)))
          (LETT |ll|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |k| (SPADCALL |m| (QREFELT $ 39)) . #3#)
                      (LETT #1# (SPADCALL |n| (QREFELT $ 39)) . #3#) G190
                      (COND ((> |k| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |k| (QREFELT $ 8))
                                    (QREFELT $ 40))
                          (LETT #2# (CONS (SPADCALL |k| (QREFELT $ 8)) #2#)
                                . #3#)))))
                      (LETT |k| (+ |k| 2) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT
           (COND
            ((SPADCALL |m0| (QREFELT $ 17) (QREFELT $ 41))
             (CONS (QREFELT $ 17) |ll|))
            ('T |ll|)))))) 

(SDEFUN |PRIMES;rabinProvesCompositeSmall|
        ((|p| I) (|n| I) (|nm1| I) (|q| I) (|k| |NonNegativeInteger|)
         ($ |Boolean|))
        (SPROG
         ((#1=#:G745 NIL) (#2=#:G744 NIL) (|t| (I)) (|oldt| (I))
          (#3=#:G746 NIL) (|j| NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |t| (SPADCALL |p| |q| |n| (QREFELT $ 44))
                  . #4=(|PRIMES;rabinProvesCompositeSmall|))
            (COND
             ((NULL (SPADCALL |t| (|spadConstant| $ 11) (QREFELT $ 45)))
              (COND
               ((NULL (SPADCALL |t| |nm1| (QREFELT $ 45)))
                (SEQ
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1 . #4#) (LETT #3# (- |k| 1) . #4#) G190
                        (COND ((|greater_SI| |j| #3#) (GO G191)))
                        (SEQ (LETT |oldt| |t| . #4#)
                             (LETT |t| (SPADCALL |t| |t| |n| (QREFELT $ 46))
                                   . #4#)
                             (EXIT
                              (COND
                               ((SPADCALL |t| (|spadConstant| $ 11)
                                          (QREFELT $ 45))
                                (PROGN (LETT #1# 'T . #4#) (GO #5=#:G743)))
                               ((SPADCALL |t| |nm1| (QREFELT $ 45))
                                (PROGN
                                 (LETT #2# |$NoValue| . #4#)
                                 (GO #6=#:G740))))))
                        (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                        (EXIT NIL)))
                  #6# (EXIT #2#))
                 (EXIT
                  (COND
                   ((NULL (SPADCALL |t| |nm1| (QREFELT $ 45)))
                    (PROGN (LETT #1# 'T . #4#) (GO #5#))))))))))
            (EXIT NIL)))
          #5# (EXIT #1#)))) 

(SDEFUN |PRIMES;rabinProvesComposite|
        ((|p| I) (|n| I) (|nm1| I) (|q| I) (|k| |NonNegativeInteger|)
         ($ |Boolean|))
        (SPROG
         ((#1=#:G754 NIL) (#2=#:G753 NIL) (|t| (I)) (|oldt| (I))
          (#3=#:G755 NIL) (|j| NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |t| (SPADCALL |p| |q| |n| (QREFELT $ 44))
                  . #4=(|PRIMES;rabinProvesComposite|))
            (COND
             ((SPADCALL |t| |nm1| (QREFELT $ 45))
              (SPADCALL (QREFELT $ 33) 1
                        (+ (SPADCALL (QREFELT $ 33) 1 (QREFELT $ 47)) 1)
                        (QREFELT $ 48))))
            (COND
             ((NULL (SPADCALL |t| (|spadConstant| $ 11) (QREFELT $ 45)))
              (COND
               ((NULL (SPADCALL |t| |nm1| (QREFELT $ 45)))
                (SEQ
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1 . #4#) (LETT #3# (- |k| 1) . #4#) G190
                        (COND ((|greater_SI| |j| #3#) (GO G191)))
                        (SEQ (LETT |oldt| |t| . #4#)
                             (LETT |t| (SPADCALL |t| |t| |n| (QREFELT $ 46))
                                   . #4#)
                             (EXIT
                              (COND
                               ((SPADCALL |t| (|spadConstant| $ 11)
                                          (QREFELT $ 45))
                                (PROGN (LETT #1# 'T . #4#) (GO #5=#:G752)))
                               ((SPADCALL |t| |nm1| (QREFELT $ 45))
                                (SEQ
                                 (SETELT $ 29
                                         (SPADCALL (QREFELT $ 29) |oldt|
                                                   (QREFELT $ 49)))
                                 (SPADCALL (QREFELT $ 33) (+ |j| 1)
                                           (+
                                            (SPADCALL (QREFELT $ 33) (+ |j| 1)
                                                      (QREFELT $ 47))
                                            1)
                                           (QREFELT $ 48))
                                 (EXIT
                                  (PROGN
                                   (LETT #2# |$NoValue| . #4#)
                                   (GO #6=#:G749))))))))
                        (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                        (EXIT NIL)))
                  #6# (EXIT #2#))
                 (EXIT
                  (COND
                   ((NULL (SPADCALL |t| |nm1| (QREFELT $ 45)))
                    (PROGN (LETT #1# 'T . #4#) (GO #5#))))))))))
            (EXIT
             (COND
              ((SPADCALL (SPADCALL (QREFELT $ 29) (QREFELT $ 50)) 2
                         (QREFELT $ 51))
               'T)
              ('T NIL)))))
          #5# (EXIT #1#)))) 

(SDEFUN |PRIMES;prime?;IB;4| ((|n| I) ($ |Boolean|))
        (SPROG
         ((#1=#:G795 NIL) (#2=#:G798 NIL) (|probablySafe| (I))
          (|currPrime| (I)) (#3=#:G797 NIL) (|n9| (I)) (#4=#:G796 NIL)
          (#5=#:G799 NIL) (|i| NIL) (|mn| (|Integer|)) (|q| (I)) (|k| NIL)
          (|nm1| (I)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |n| (SPADCALL (|spadConstant| $ 11) (QREFELT $ 52))
                        (QREFELT $ 36))
              (LETT |n| (SPADCALL |n| (QREFELT $ 52))
                    . #6=(|PRIMES;prime?;IB;4|))))
            (EXIT
             (COND ((SPADCALL |n| (QREFELT $ 17) (QREFELT $ 36)) NIL)
                   ((SPADCALL |n| (QREFELT $ 13) (QREFELT $ 36))
                    (SPADCALL |n| (QREFELT $ 9) (QREFELT $ 53)))
                   (#7='T
                    (COND
                     ((NULL
                       (SPADCALL (SPADCALL |n| (QREFELT $ 12) (QREFELT $ 54))
                                 (|spadConstant| $ 11) (QREFELT $ 45)))
                      NIL)
                     ((SPADCALL |n| (QREFELT $ 16) (QREFELT $ 36)) 'T)
                     (#7#
                      (SEQ
                       (LETT |nm1|
                             (SPADCALL |n| (|spadConstant| $ 11)
                                       (QREFELT $ 55))
                             . #6#)
                       (LETT |q| (SPADCALL |nm1| (QREFELT $ 17) (QREFELT $ 56))
                             . #6#)
                       (SEQ (LETT |k| 1 . #6#) G190
                            (COND
                             ((NULL (NULL (SPADCALL |q| (QREFELT $ 57))))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |q|
                                    (SPADCALL |q| (QREFELT $ 17)
                                              (QREFELT $ 56))
                                    . #6#)))
                            (LETT |k| (|inc_SI| |k|) . #6#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT
                        (COND
                         ((SPADCALL |n| (QREFELT $ 26) (QREFELT $ 36))
                          (COND
                           ((OR
                             (|PRIMES;rabinProvesCompositeSmall|
                              (SPADCALL 2 (QREFELT $ 8)) |n| |nm1| |q| |k| $)
                             (|PRIMES;rabinProvesCompositeSmall|
                              (SPADCALL 3 (QREFELT $ 8)) |n| |nm1| |q| |k| $))
                            (PROGN (LETT #2# NIL . #6#) (GO #8=#:G794)))
                           ((SPADCALL |n| (QREFELT $ 20) (QREFELT $ 36))
                            (COND
                             ((OR
                               (|PRIMES;rabinProvesCompositeSmall|
                                (SPADCALL 5 (QREFELT $ 8)) |n| |nm1| |q| |k| $)
                               (SPADCALL |n| (QREFELT $ 19) (QREFELT $ 53)))
                              (PROGN (LETT #2# NIL . #6#) (GO #8#)))
                             ('T 'T)))
                           (#7#
                            (COND
                             ((|PRIMES;rabinProvesCompositeSmall|
                               (SPADCALL 7 (QREFELT $ 8)) |n| |nm1| |q| |k| $)
                              (PROGN (LETT #2# NIL . #6#) (GO #8#)))
                             ((SPADCALL |n| (QREFELT $ 23) (QREFELT $ 36))
                              (COND
                               ((OR
                                 (|PRIMES;rabinProvesCompositeSmall|
                                  (SPADCALL 10 (QREFELT $ 8)) |n| |nm1| |q| |k|
                                  $)
                                 (SPADCALL |n| (QREFELT $ 21) (QREFELT $ 53)))
                                (PROGN (LETT #2# NIL . #6#) (GO #8#)))
                               ('T 'T)))
                             (#7#
                              (COND
                               ((OR
                                 (|PRIMES;rabinProvesCompositeSmall|
                                  (SPADCALL 5 (QREFELT $ 8)) |n| |nm1| |q| |k|
                                  $)
                                 (|PRIMES;rabinProvesCompositeSmall|
                                  (SPADCALL 11 (QREFELT $ 8)) |n| |nm1| |q| |k|
                                  $))
                                (PROGN (LETT #2# NIL . #6#) (GO #8#)))
                               ((SPADCALL |n| (QREFELT $ 25) (QREFELT $ 36))
                                (COND
                                 ((SPADCALL |n| (QREFELT $ 24) (QREFELT $ 53))
                                  (PROGN (LETT #2# NIL . #6#) (GO #8#)))
                                 (#7# 'T)))
                               (#7#
                                (COND
                                 ((OR
                                   (|PRIMES;rabinProvesCompositeSmall|
                                    (SPADCALL 13 (QREFELT $ 8)) |n| |nm1| |q|
                                    |k| $)
                                   (|PRIMES;rabinProvesCompositeSmall|
                                    (SPADCALL 17 (QREFELT $ 8)) |n| |nm1| |q|
                                    |k| $))
                                  (PROGN (LETT #2# NIL . #6#) (GO #8#)))
                                 ('T 'T)))))))))
                         (#7#
                          (SEQ
                           (EXIT
                            (SEQ (SETELT $ 29 (SPADCALL (QREFELT $ 28)))
                                 (SETELT $ 33 (SPADCALL |k| 0 (QREFELT $ 32)))
                                 (LETT |mn|
                                       (SPADCALL (QREFELT $ 9) (QREFELT $ 58))
                                       . #6#)
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |i| (+ |mn| 1) . #6#)
                                        (LETT #5# (+ |mn| 10) . #6#) G190
                                        (COND ((> |i| #5#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((|PRIMES;rabinProvesComposite|
                                             (SPADCALL (QREFELT $ 9) |i|
                                                       (QREFELT $ 59))
                                             |n| |nm1| |q| |k| $)
                                            (PROGN
                                             (LETT #4#
                                                   (PROGN
                                                    (LETT #2# NIL . #6#)
                                                    (GO #8#))
                                                   . #6#)
                                             (GO #9=#:G781))))))
                                        (LETT |i| (+ |i| 1) . #6#) (GO G190)
                                        G191 (EXIT NIL)))
                                  #9# (EXIT #4#))
                                 (COND
                                  ((SPADCALL |q| (|spadConstant| $ 11)
                                             (QREFELT $ 60))
                                   (COND
                                    ((SPADCALL
                                      (SPADCALL (SPADCALL 3 |n| (QREFELT $ 61))
                                                (|spadConstant| $ 11)
                                                (QREFELT $ 38))
                                      (QREFELT $ 63))
                                     (EXIT NIL)))))
                                 (SEQ
                                  (LETT |n9|
                                        (SPADCALL |n|
                                                  (SPADCALL 9 (QREFELT $ 8))
                                                  (QREFELT $ 64))
                                        . #6#)
                                  (EXIT
                                   (COND
                                    ((OR
                                      (SPADCALL |n9| (|spadConstant| $ 11)
                                                (QREFELT $ 45))
                                      (SPADCALL |n9|
                                                (SPADCALL (|spadConstant| $ 11)
                                                          (QREFELT $ 52))
                                                (QREFELT $ 45)))
                                     (COND
                                      ((SPADCALL
                                        (SPADCALL
                                         (SPADCALL 8 |n| (QREFELT $ 61))
                                         (|spadConstant| $ 11) (QREFELT $ 38))
                                        (QREFELT $ 63))
                                       (PROGN
                                        (LETT #3# NIL . #6#)
                                        (GO #10=#:G790))))))))
                                 (LETT |currPrime|
                                       (SPADCALL (QREFELT $ 9) (+ |mn| 10)
                                                 (QREFELT $ 59))
                                       . #6#)
                                 (LETT |probablySafe| (QREFELT $ 18) . #6#)
                                 (SEQ G190
                                      (COND
                                       ((NULL
                                         (COND
                                          ((EQL
                                            (SPADCALL (QREFELT $ 33) |k|
                                                      (QREFELT $ 47))
                                            0)
                                           'T)
                                          ('T
                                           (SPADCALL |n| |probablySafe|
                                                     (QREFELT $ 60)))))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ
                                         (LETT |currPrime|
                                               (SPADCALL |currPrime|
                                                         (QREFELT $ 65))
                                               . #6#)
                                         (LETT |probablySafe|
                                               (SPADCALL |probablySafe|
                                                         (SPADCALL 100
                                                                   (QREFELT $
                                                                            8))
                                                         (QREFELT $ 10))
                                               . #6#)
                                         (EXIT
                                          (COND
                                           ((|PRIMES;rabinProvesComposite|
                                             |currPrime| |n| |nm1| |q| |k| $)
                                            (PROGN
                                             (LETT #1#
                                                   (PROGN
                                                    (LETT #2# NIL . #6#)
                                                    (GO #8#))
                                                   . #6#)
                                             (GO #11=#:G788)))))))
                                       #11# (EXIT #1#))
                                      NIL (GO G190) G191 (EXIT NIL))
                                 (EXIT 'T)))
                           #10# (EXIT #3#)))))))))))))
          #8# (EXIT #2#)))) 

(SDEFUN |PRIMES;nextPrime;2I;5| ((|n| I) ($ I))
        (SEQ
         (COND ((SPADCALL |n| (QREFELT $ 17) (QREFELT $ 36)) (QREFELT $ 17))
               (#1='T
                (SEQ
                 (COND
                  ((SPADCALL |n| (QREFELT $ 57))
                   (LETT |n| (SPADCALL |n| (QREFELT $ 17) (QREFELT $ 38))
                         . #2=(|PRIMES;nextPrime;2I;5|)))
                  (#1#
                   (LETT |n|
                         (SPADCALL |n| (|spadConstant| $ 11) (QREFELT $ 38))
                         . #2#)))
                 (SEQ G190
                      (COND
                       ((NULL (NULL (SPADCALL |n| (QREFELT $ 40)))) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT |n| (SPADCALL |n| (QREFELT $ 17) (QREFELT $ 38))
                              . #2#)))
                      NIL (GO G190) G191 (EXIT NIL))
                 (EXIT |n|)))))) 

(SDEFUN |PRIMES;prevPrime;2I;6| ((|n| I) ($ I))
        (SEQ
         (COND
          ((SPADCALL |n| (SPADCALL 3 (QREFELT $ 8)) (QREFELT $ 36))
           (|error| "no primes less than 2"))
          ((SPADCALL |n| (SPADCALL 3 (QREFELT $ 8)) (QREFELT $ 45))
           (QREFELT $ 17))
          (#1='T
           (SEQ
            (COND
             ((SPADCALL |n| (QREFELT $ 57))
              (LETT |n| (SPADCALL |n| (QREFELT $ 17) (QREFELT $ 55))
                    . #2=(|PRIMES;prevPrime;2I;6|)))
             (#1#
              (LETT |n| (SPADCALL |n| (|spadConstant| $ 11) (QREFELT $ 55))
                    . #2#)))
            (SEQ G190
                 (COND ((NULL (NULL (SPADCALL |n| (QREFELT $ 40)))) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |n| (SPADCALL |n| (QREFELT $ 17) (QREFELT $ 55))
                         . #2#)))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT |n|)))))) 

(DECLAIM (NOTINLINE |IntegerPrimesPackage;|)) 

(DEFUN |IntegerPrimesPackage| (#1=#:G811)
  (SPROG NIL
         (PROG (#2=#:G812)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|IntegerPrimesPackage|)
                                               '|domainEqualList|)
                    . #3=(|IntegerPrimesPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|IntegerPrimesPackage;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|IntegerPrimesPackage|)))))))))) 

(DEFUN |IntegerPrimesPackage;| (|#1|)
  (SPROG
   ((#1=#:G726 NIL) (#2=#:G725 NIL) (#3=#:G727 NIL) (#4=#:G810 NIL)
    (#5=#:G690 NIL) (|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (SEQ
    (PROGN
     (LETT DV$1 (|devaluate| |#1|) . #6=(|IntegerPrimesPackage|))
     (LETT |dv$| (LIST '|IntegerPrimesPackage| DV$1) . #6#)
     (LETT $ (GETREFV 67) . #6#)
     (QSETREFV $ 0 |dv$|)
     (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #6#))
     (|haddProp| |$ConstructorCache| '|IntegerPrimesPackage| (LIST DV$1)
                 (CONS 1 $))
     (|stuffDomainSlots| $)
     (QSETREFV $ 6 |#1|)
     (SETF |pv$| (QREFELT $ 3))
     (QSETREFV $ 9
               (LIST (SPADCALL 2 (QREFELT $ 8)) (SPADCALL 3 (QREFELT $ 8))
                     (SPADCALL 5 (QREFELT $ 8)) (SPADCALL 7 (QREFELT $ 8))
                     (SPADCALL 11 (QREFELT $ 8)) (SPADCALL 13 (QREFELT $ 8))
                     (SPADCALL 17 (QREFELT $ 8)) (SPADCALL 19 (QREFELT $ 8))
                     (SPADCALL 23 (QREFELT $ 8)) (SPADCALL 29 (QREFELT $ 8))
                     (SPADCALL 31 (QREFELT $ 8)) (SPADCALL 37 (QREFELT $ 8))
                     (SPADCALL 41 (QREFELT $ 8)) (SPADCALL 43 (QREFELT $ 8))
                     (SPADCALL 47 (QREFELT $ 8)) (SPADCALL 53 (QREFELT $ 8))
                     (SPADCALL 59 (QREFELT $ 8)) (SPADCALL 61 (QREFELT $ 8))
                     (SPADCALL 67 (QREFELT $ 8)) (SPADCALL 71 (QREFELT $ 8))
                     (SPADCALL 73 (QREFELT $ 8)) (SPADCALL 79 (QREFELT $ 8))
                     (SPADCALL 83 (QREFELT $ 8)) (SPADCALL 89 (QREFELT $ 8))
                     (SPADCALL 97 (QREFELT $ 8)) (SPADCALL 101 (QREFELT $ 8))
                     (SPADCALL 103 (QREFELT $ 8)) (SPADCALL 107 (QREFELT $ 8))
                     (SPADCALL 109 (QREFELT $ 8)) (SPADCALL 113 (QREFELT $ 8))
                     (SPADCALL 127 (QREFELT $ 8)) (SPADCALL 131 (QREFELT $ 8))
                     (SPADCALL 137 (QREFELT $ 8)) (SPADCALL 139 (QREFELT $ 8))
                     (SPADCALL 149 (QREFELT $ 8)) (SPADCALL 151 (QREFELT $ 8))
                     (SPADCALL 157 (QREFELT $ 8)) (SPADCALL 163 (QREFELT $ 8))
                     (SPADCALL 167 (QREFELT $ 8)) (SPADCALL 173 (QREFELT $ 8))
                     (SPADCALL 179 (QREFELT $ 8)) (SPADCALL 181 (QREFELT $ 8))
                     (SPADCALL 191 (QREFELT $ 8)) (SPADCALL 193 (QREFELT $ 8))
                     (SPADCALL 197 (QREFELT $ 8)) (SPADCALL 199 (QREFELT $ 8))
                     (SPADCALL 211 (QREFELT $ 8)) (SPADCALL 223 (QREFELT $ 8))
                     (SPADCALL 227 (QREFELT $ 8)) (SPADCALL 229 (QREFELT $ 8))
                     (SPADCALL 233 (QREFELT $ 8)) (SPADCALL 239 (QREFELT $ 8))
                     (SPADCALL 241 (QREFELT $ 8)) (SPADCALL 251 (QREFELT $ 8))
                     (SPADCALL 257 (QREFELT $ 8)) (SPADCALL 263 (QREFELT $ 8))
                     (SPADCALL 269 (QREFELT $ 8)) (SPADCALL 271 (QREFELT $ 8))
                     (SPADCALL 277 (QREFELT $ 8)) (SPADCALL 281 (QREFELT $ 8))
                     (SPADCALL 283 (QREFELT $ 8)) (SPADCALL 293 (QREFELT $ 8))
                     (SPADCALL 307 (QREFELT $ 8)) (SPADCALL 311 (QREFELT $ 8))
                     (SPADCALL 313 (QREFELT $ 8))))
     (QSETREFV $ 12
               (PROGN
                (LETT #1# NIL . #6#)
                (SEQ (LETT #5# NIL . #6#) (LETT #4# (QREFELT $ 9) . #6#) G190
                     (COND
                      ((OR (ATOM #4#) (PROGN (LETT #5# (CAR #4#) . #6#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (PROGN
                        (LETT #3# #5# . #6#)
                        (COND
                         (#1#
                          (LETT #2# (SPADCALL #2# #3# (QREFELT $ 10)) . #6#))
                         ('T
                          (PROGN (LETT #2# #3# . #6#) (LETT #1# 'T . #6#)))))))
                     (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
                (COND (#1# #2#) ('T (|spadConstant| $ 11)))))
     (QSETREFV $ 13 (SPADCALL 317 (QREFELT $ 8)))
     (QSETREFV $ 16 (SPADCALL (QREFELT $ 13) 2 (QREFELT $ 15)))
     (QSETREFV $ 17 (SPADCALL 2 (QREFELT $ 8)))
     (QSETREFV $ 18 (SPADCALL (SPADCALL 10 (QREFELT $ 8)) 20 (QREFELT $ 15)))
     (QSETREFV $ 19
               (LIST (SPADCALL 25326001 (QREFELT $ 8))
                     (SPADCALL 161304001 (QREFELT $ 8))
                     (SPADCALL 960946321 (QREFELT $ 8))
                     (SPADCALL 1157839381 (QREFELT $ 8))
                     (SPADCALL 3697278427 (QREFELT $ 8))
                     (SPADCALL 5764643587 (QREFELT $ 8))
                     (SPADCALL 6770862367 (QREFELT $ 8))
                     (SPADCALL 14386156093 (QREFELT $ 8))
                     (SPADCALL 15579919981 (QREFELT $ 8))
                     (SPADCALL 18459366157 (QREFELT $ 8))
                     (SPADCALL 19887974881 (QREFELT $ 8))
                     (SPADCALL 21276028621 (QREFELT $ 8))))
     (QSETREFV $ 20 (SPADCALL 27716349961 (QREFELT $ 8)))
     (QSETREFV $ 21
               (LIST (SPADCALL 3215031751 (QREFELT $ 8))
                     (SPADCALL 118670087467 (QREFELT $ 8))
                     (SPADCALL 128282461501 (QREFELT $ 8))
                     (SPADCALL 354864744877 (QREFELT $ 8))
                     (SPADCALL 546348519181 (QREFELT $ 8))
                     (SPADCALL 602248359169 (QREFELT $ 8))
                     (SPADCALL 669094855201 (QREFELT $ 8))))
     (QSETREFV $ 23 (SPADCALL (SPADCALL 10 12 (QREFELT $ 22)) (QREFELT $ 8)))
     (QSETREFV $ 24
               (LIST (SPADCALL 2152302898747 (QREFELT $ 8))
                     (SPADCALL 3474749660383 (QREFELT $ 8))))
     (QSETREFV $ 25 (SPADCALL (SPADCALL 10 13 (QREFELT $ 22)) (QREFELT $ 8)))
     (QSETREFV $ 26 (SPADCALL 341550071728321 (QREFELT $ 8)))
     (QSETREFV $ 29 (SPADCALL (QREFELT $ 28)))
     (QSETREFV $ 33 (SPADCALL 1 0 (QREFELT $ 32)))
     $)))) 

(MAKEPROP '|IntegerPrimesPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Integer|) (0 . |coerce|)
              '|smallPrimes| (5 . *) (11 . |One|) '|productSmallPrimes|
              '|nextSmallPrime| (|PositiveInteger|) (15 . ^)
              '|nextSmallPrimeSquared| '|two| '|tenPowerTwenty|
              '|PomeranceList| '|PomeranceLimit| '|PinchList| (21 . ^)
              '|PinchLimit| '|PinchList2| '|PinchLimit2| '|JaeschkeLimit|
              (|Set| 6) (27 . |empty|) '|rootsMinus1| (|NonNegativeInteger|)
              (|Vector| 30) (31 . |new|) '|count2Order| (37 . |Zero|)
              (|Boolean|) (41 . <) (47 . |even?|) (52 . +) (58 . |convert|)
              |PRIMES;prime?;IB;4| (63 . <=) (|List| 6) |PRIMES;primes;2IL;1|
              (69 . |powmod|) (76 . =) (82 . |mulmod|) (89 . |elt|)
              (95 . |setelt!|) (102 . |union|) (108 . |#|) (113 . >) (119 . -)
              (124 . |member?|) (130 . |gcd|) (136 . -) (142 . |quo|)
              (148 . |odd?|) (153 . |minIndex|) (158 . |elt|) (164 . >)
              (170 . *) (|IntegerRoots| 6) (176 . |perfectSquare?|)
              (181 . |rem|) |PRIMES;nextPrime;2I;5| |PRIMES;prevPrime;2I;6|)
           '#(|primes| 187 |prime?| 193 |prevPrime| 198 |nextPrime| 203) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 66
                                                 '(1 6 0 7 8 2 6 0 0 0 10 0 6 0
                                                   11 2 6 0 0 14 15 2 14 0 0 14
                                                   22 0 27 0 28 2 31 0 30 30 32
                                                   0 6 0 34 2 6 35 0 0 36 1 6
                                                   35 0 37 2 6 0 0 0 38 1 6 7 0
                                                   39 2 6 35 0 0 41 3 6 0 0 0 0
                                                   44 2 6 35 0 0 45 3 6 0 0 0 0
                                                   46 2 31 30 0 7 47 3 31 30 0
                                                   7 30 48 2 27 0 0 6 49 1 27
                                                   30 0 50 2 30 35 0 0 51 1 6 0
                                                   0 52 2 42 35 6 0 53 2 6 0 0
                                                   0 54 2 6 0 0 0 55 2 6 0 0 0
                                                   56 1 6 35 0 57 1 42 7 0 58 2
                                                   42 6 0 7 59 2 6 35 0 0 60 2
                                                   6 0 14 0 61 1 62 35 6 63 2 6
                                                   0 0 0 64 2 0 42 6 6 43 1 0
                                                   35 6 40 1 0 6 6 66 1 0 6 6
                                                   65)))))
           '|lookupComplete|)) 
