
(SDEFUN |GUESSEB;ord1| ((|x| |List| (|Integer|)) (|i| |Integer|) ($ |Integer|))
        (SPROG
         ((#1=#:G757 NIL) (|k| NIL) (#2=#:G756 NIL) (#3=#:G755 NIL) (|j| NIL)
          (#4=#:G754 NIL) (#5=#:G753 NIL) (#6=#:G752 NIL) (|n| (|Integer|)))
         (SEQ (LETT |n| (- (- (LENGTH |x|) 3) |i|) . #7=(|GUESSEB;ord1|))
              (EXIT
               (+
                (* (SPADCALL |x| (+ |n| 1) (QREFELT $ 15))
                   (SPADCALL (ELT $ 16)
                             (PROGN
                              (LETT #6# NIL . #7#)
                              (SEQ (LETT |j| 1 . #7#) (LETT #5# |n| . #7#) G190
                                   (COND ((|greater_SI| |j| #5#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #6#
                                           (CONS
                                            (SPADCALL |x| |j| (QREFELT $ 15))
                                            #6#)
                                           . #7#)))
                                   (LETT |j| (|inc_SI| |j|) . #7#) (GO G190)
                                   G191 (EXIT (NREVERSE #6#))))
                             0 (QREFELT $ 18)))
                (SPADCALL 2
                          (SPADCALL (ELT $ 16)
                                    (PROGN
                                     (LETT #4# NIL . #7#)
                                     (SEQ (LETT |j| 1 . #7#)
                                          (LETT #3# |n| . #7#) G190
                                          (COND
                                           ((|greater_SI| |j| #3#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #4#
                                                  (CONS
                                                   (SPADCALL (ELT $ 16)
                                                             (PROGN
                                                              (LETT #2# NIL
                                                                    . #7#)
                                                              (SEQ
                                                               (LETT |k| 1
                                                                     . #7#)
                                                               (LETT #1#
                                                                     (- |j| 1)
                                                                     . #7#)
                                                               G190
                                                               (COND
                                                                ((|greater_SI|
                                                                  |k| #1#)
                                                                 (GO G191)))
                                                               (SEQ
                                                                (EXIT
                                                                 (LETT #2#
                                                                       (CONS
                                                                        (*
                                                                         (SPADCALL
                                                                          |x|
                                                                          |k|
                                                                          (QREFELT
                                                                           $
                                                                           15))
                                                                         (SPADCALL
                                                                          |x|
                                                                          |j|
                                                                          (QREFELT
                                                                           $
                                                                           15)))
                                                                        #2#)
                                                                       . #7#)))
                                                               (LETT |k|
                                                                     (|inc_SI|
                                                                      |k|)
                                                                     . #7#)
                                                               (GO G190) G191
                                                               (EXIT
                                                                (NREVERSE
                                                                 #2#))))
                                                             0 (QREFELT $ 18))
                                                   #4#)
                                                  . #7#)))
                                          (LETT |j| (|inc_SI| |j|) . #7#)
                                          (GO G190) G191
                                          (EXIT (NREVERSE #4#))))
                                    0 (QREFELT $ 18))
                          (QREFELT $ 20))))))) 

(SDEFUN |GUESSEB;ord2| ((|x| |List| (|Integer|)) (|i| |Integer|) ($ |Integer|))
        (SPROG ((#1=#:G765 NIL) (|j| NIL) (#2=#:G764 NIL) (|n| (|Integer|)))
               (SEQ
                (COND
                 ((ZEROP |i|)
                  (SEQ
                   (LETT |n| (- (- (LENGTH |x|) 3) |i|) . #3=(|GUESSEB;ord2|))
                   (EXIT
                    (+ (|GUESSEB;ord1| |x| |i| $)
                       (*
                        (SPADCALL (ELT $ 16)
                                  (PROGN
                                   (LETT #2# NIL . #3#)
                                   (SEQ (LETT |j| 1 . #3#) (LETT #1# |n| . #3#)
                                        G190
                                        (COND
                                         ((|greater_SI| |j| #1#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #2#
                                                (CONS
                                                 (SPADCALL |x| |j|
                                                           (QREFELT $ 15))
                                                 #2#)
                                                . #3#)))
                                        (LETT |j| (|inc_SI| |j|) . #3#)
                                        (GO G190) G191 (EXIT (NREVERSE #2#))))
                                  0 (QREFELT $ 18))
                        (- (SPADCALL |x| (+ |n| 2) (QREFELT $ 15))
                           (SPADCALL |x| (+ |n| 1) (QREFELT $ 15))))))))
                 ('T (|GUESSEB;ord1| |x| |i| $)))))) 

(SDEFUN |GUESSEB;deg1| ((|x| |List| (|Integer|)) (|i| |Integer|) ($ |Integer|))
        (SPROG
         ((#1=#:G782 NIL) (|k| NIL) (#2=#:G781 NIL) (#3=#:G780 NIL) (|j| NIL)
          (#4=#:G779 NIL) (#5=#:G778 NIL) (#6=#:G777 NIL) (|m| (|Integer|)))
         (SEQ (LETT |m| (- (LENGTH |x|) 3) . #7=(|GUESSEB;deg1|))
              (EXIT
               (+
                (+
                 (*
                  (+
                   (+ (SPADCALL |x| (+ |m| 3) (QREFELT $ 15))
                      (SPADCALL |x| (+ |m| 1) (QREFELT $ 15)))
                   (SPADCALL |x| (+ 1 |i|) (QREFELT $ 15)))
                  (SPADCALL (ELT $ 16)
                            (PROGN
                             (LETT #6# NIL . #7#)
                             (SEQ (LETT |j| (+ 2 |i|) . #7#)
                                  (LETT #5# |m| . #7#) G190
                                  (COND ((> |j| #5#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #6#
                                          (CONS
                                           (SPADCALL |x| |j| (QREFELT $ 15))
                                           #6#)
                                          . #7#)))
                                  (LETT |j| (+ |j| 1) . #7#) (GO G190) G191
                                  (EXIT (NREVERSE #6#))))
                            0 (QREFELT $ 18)))
                 (* (SPADCALL |x| (+ |m| 3) (QREFELT $ 15))
                    (SPADCALL |x| (+ |m| 1) (QREFELT $ 15))))
                (SPADCALL 2
                          (SPADCALL (ELT $ 16)
                                    (PROGN
                                     (LETT #4# NIL . #7#)
                                     (SEQ (LETT |j| (+ 2 |i|) . #7#)
                                          (LETT #3# |m| . #7#) G190
                                          (COND ((> |j| #3#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #4#
                                                  (CONS
                                                   (SPADCALL (ELT $ 16)
                                                             (PROGN
                                                              (LETT #2# NIL
                                                                    . #7#)
                                                              (SEQ
                                                               (LETT |k|
                                                                     (+ 2 |i|)
                                                                     . #7#)
                                                               (LETT #1#
                                                                     (- |j| 1)
                                                                     . #7#)
                                                               G190
                                                               (COND
                                                                ((> |k| #1#)
                                                                 (GO G191)))
                                                               (SEQ
                                                                (EXIT
                                                                 (LETT #2#
                                                                       (CONS
                                                                        (*
                                                                         (SPADCALL
                                                                          |x|
                                                                          |k|
                                                                          (QREFELT
                                                                           $
                                                                           15))
                                                                         (SPADCALL
                                                                          |x|
                                                                          |j|
                                                                          (QREFELT
                                                                           $
                                                                           15)))
                                                                        #2#)
                                                                       . #7#)))
                                                               (LETT |k|
                                                                     (+ |k| 1)
                                                                     . #7#)
                                                               (GO G190) G191
                                                               (EXIT
                                                                (NREVERSE
                                                                 #2#))))
                                                             0 (QREFELT $ 18))
                                                   #4#)
                                                  . #7#)))
                                          (LETT |j| (+ |j| 1) . #7#) (GO G190)
                                          G191 (EXIT (NREVERSE #4#))))
                                    0 (QREFELT $ 18))
                          (QREFELT $ 20))))))) 

(SDEFUN |GUESSEB;deg2| ((|x| |List| (|Integer|)) (|i| |Integer|) ($ |Integer|))
        (SPROG ((#1=#:G789 NIL) (|j| NIL) (#2=#:G788 NIL) (|m| (|Integer|)))
               (SEQ (LETT |m| (- (LENGTH |x|) 3) . #3=(|GUESSEB;deg2|))
                    (EXIT
                     (+ (|GUESSEB;deg1| |x| |i| $)
                        (*
                         (+ (SPADCALL |x| (+ |m| 3) (QREFELT $ 15))
                            (SPADCALL (ELT $ 16)
                                      (PROGN
                                       (LETT #2# NIL . #3#)
                                       (SEQ (LETT |j| (+ 2 |i|) . #3#)
                                            (LETT #1# |m| . #3#) G190
                                            (COND ((> |j| #1#) (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #2#
                                                    (CONS
                                                     (SPADCALL |x| |j|
                                                               (QREFELT $ 15))
                                                     #2#)
                                                    . #3#)))
                                            (LETT |j| (+ |j| 1) . #3#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #2#))))
                                      0 (QREFELT $ 18)))
                         (- (SPADCALL |x| (+ |m| 2) (QREFELT $ 15))
                            (SPADCALL |x| (+ |m| 1) (QREFELT $ 15))))))))) 

(SDEFUN |GUESSEB;checkResult|
        ((|res| EXPRR) (|n| |Symbol|) (|l| |Integer|) (|list| |List| F)
         ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G796 NIL) (#2=#:G791 NIL) (|num| (EXPRR)) (#3=#:G790 NIL)
          (|den| (EXPRR)) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| |l| . #4=(|GUESSEB;checkResult|)) G190
                 (COND ((< |i| 1) (GO G191)))
                 (SEQ
                  (LETT |den|
                        (SPADCALL (SPADCALL |res| (QREFELT $ 21))
                                  (SPADCALL |n| (QREFELT $ 23))
                                  (SPADCALL (- |i| 1) (QREFELT $ 24))
                                  (QREFELT $ 25))
                        . #4#)
                  (COND
                   ((SPADCALL |den| (|spadConstant| $ 28) (QREFELT $ 30))
                    (PROGN
                     (LETT #1#
                           (PROG1 (LETT #3# |i| . #4#)
                             (|check_subtype2| (>= #3# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #3#))
                           . #4#)
                     (GO #5=#:G795))))
                  (LETT |num|
                        (SPADCALL (SPADCALL |res| (QREFELT $ 31))
                                  (SPADCALL |n| (QREFELT $ 23))
                                  (SPADCALL (- |i| 1) (QREFELT $ 24))
                                  (QREFELT $ 25))
                        . #4#)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |list| |i| (QREFELT $ 33))
                               (SPADCALL (SPADCALL |num| |den| (QREFELT $ 34))
                                         (QREFELT $ 9))
                               (QREFELT $ 35))
                     (PROGN
                      (LETT #1#
                            (PROG1 (LETT #2# |i| . #4#)
                              (|check_subtype2| (>= #2# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #2#))
                            . #4#)
                      (GO #5#))))))
                 (LETT |i| (+ |i| -1) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT 0)))
          #5# (EXIT #1#)))) 

(SDEFUN |GUESSEB;SUPS2SUPF|
        ((|p| |SparseUnivariatePolynomial| S)
         ($ |SparseUnivariatePolynomial| F))
        (COND ((|domainEqual| (QREFELT $ 6) (QREFELT $ 7)) |p|)
              ((|domainEqual| (QREFELT $ 6) (|Fraction| (QREFELT $ 7)))
               (SPADCALL (ELT $ 37) |p| (QREFELT $ 42)))
              ('T
               (|error|
                (SPADCALL
                 "Guess: type parameter F should be either equal to S or"
                 " equal to Fraction S" (QREFELT $ 44)))))) 

(SDEFUN |GUESSEB;F2FPOLYS|
        ((|p| F)
         ($ |Fraction|
          (|SparseMultivariatePolynomial| S
                                          (|OrderedVariableList|
                                           (|construct| '|a1| 'A)))))
        (COND
         ((|domainEqual| (QREFELT $ 6) (QREFELT $ 7))
          (SPADCALL (SPADCALL |p| (QREFELT $ 46)) (QREFELT $ 48)))
         ((|domainEqual| (QREFELT $ 6) (|Fraction| (QREFELT $ 7)))
          (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 49)) (QREFELT $ 51))
                    (SPADCALL (SPADCALL |p| (QREFELT $ 52)) (QREFELT $ 51))
                    (QREFELT $ 54)))
         ('T
          (|error|
           (SPADCALL "Guess: type parameter F should be either equal to S or"
                     " equal to Fraction S" (QREFELT $ 44)))))) 

(SDEFUN |GUESSEB;SUPF2EXPRR|
        ((|xx| |Symbol|) (|p| |SparseUnivariatePolynomial| F) ($ EXPRR))
        (COND ((SPADCALL |p| (QREFELT $ 55)) (|spadConstant| $ 28))
              ('T
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL |p| (QREFELT $ 56)) (QREFELT $ 10))
                 (SPADCALL (SPADCALL |xx| (QREFELT $ 23))
                           (SPADCALL |p| (QREFELT $ 58)) (QREFELT $ 59))
                 (QREFELT $ 60))
                (|GUESSEB;SUPF2EXPRR| |xx| (SPADCALL |p| (QREFELT $ 61)) $)
                (QREFELT $ 62))))) 

(SDEFUN |GUESSEB;FSUPF2EXPRR|
        ((|xx| |Symbol|) (|p| |Fraction| (|SparseUnivariatePolynomial| F))
         ($ EXPRR))
        (SPADCALL (|GUESSEB;SUPF2EXPRR| |xx| (SPADCALL |p| (QREFELT $ 64)) $)
                  (|GUESSEB;SUPF2EXPRR| |xx| (SPADCALL |p| (QREFELT $ 65)) $)
                  (QREFELT $ 34))) 

(SDEFUN |GUESSEB;POLYS2POLYF|
        ((|p| |SparseMultivariatePolynomial| S
          (|OrderedVariableList| (|construct| '|a1| 'A)))
         ($ |SparseMultivariatePolynomial| F
          (|OrderedVariableList| (|construct| '|a1| 'A))))
        (COND ((|domainEqual| (QREFELT $ 6) (QREFELT $ 7)) |p|)
              ((|domainEqual| (QREFELT $ 6) (|Fraction| (QREFELT $ 7)))
               (SPADCALL (ELT $ 37) |p| (QREFELT $ 67)))
              ('T
               (|error|
                (SPADCALL
                 "Guess: type parameter F should be either equal to S or"
                 " equal to Fraction S" (QREFELT $ 44)))))) 

(SDEFUN |GUESSEB;SUPPOLYS2SUPF|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| S
                                          (|OrderedVariableList|
                                           (|construct| '|a1| 'A))))
         (|a1v| F) (|Av| F) ($ |SparseUnivariatePolynomial| F))
        (SPROG
         ((|lc|
           (|SparseMultivariatePolynomial| F
                                           (|OrderedVariableList|
                                            (|construct| '|a1| 'A)))))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT $ 69)) (|spadConstant| $ 70))
                ('T
                 (SEQ
                  (LETT |lc|
                        (|GUESSEB;POLYS2POLYF| (SPADCALL |p| (QREFELT $ 71)) $)
                        |GUESSEB;SUPPOLYS2SUPF|)
                  (EXIT
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL |lc|
                                (LIST (SPADCALL 1 (QREFELT $ 73))
                                      (SPADCALL 2 (QREFELT $ 73)))
                                (LIST |a1v| |Av|) (QREFELT $ 75))
                      (QREFELT $ 76))
                     (SPADCALL |p| (QREFELT $ 77)) (QREFELT $ 78))
                    (|GUESSEB;SUPPOLYS2SUPF| (SPADCALL |p| (QREFELT $ 79))
                     |a1v| |Av| $)
                    (QREFELT $ 80))))))))) 

(SDEFUN |GUESSEB;SUPFPOLYS2FSUPPOLYS|
        ((|p| |SparseUnivariatePolynomial|
          (|Fraction|
           (|SparseMultivariatePolynomial| S
                                           (|OrderedVariableList|
                                            (|construct| '|a1| 'A)))))
         ($ |Fraction|
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| S
                                           (|OrderedVariableList|
                                            (|construct| '|a1| 'A))))))
        (SPROG
         ((|pden|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| S
                                            (|OrderedVariableList|
                                             (|construct| '|a1| 'A)))))
          (|pnum|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| S
                                            (|OrderedVariableList|
                                             (|construct| '|a1| 'A)))))
          (|cden|
           (|Record|
            (|:| |num|
                 (|SparseUnivariatePolynomial|
                  (|Fraction|
                   (|SparseMultivariatePolynomial| S
                                                   (|OrderedVariableList|
                                                    (|construct| '|a1| 'A))))))
            (|:| |den|
                 (|SparseMultivariatePolynomial| S
                                                 (|OrderedVariableList|
                                                  (|construct| '|a1| 'A)))))))
         (SEQ
          (LETT |cden| (SPADCALL |p| (QREFELT $ 84))
                . #1=(|GUESSEB;SUPFPOLYS2FSUPPOLYS|))
          (LETT |pnum|
                (SPADCALL
                 (CONS #'|GUESSEB;SUPFPOLYS2FSUPPOLYS!0| (VECTOR $ |cden|)) |p|
                 (QREFELT $ 89))
                . #1#)
          (LETT |pden| (SPADCALL (QCDR |cden|) (QREFELT $ 90)) . #1#)
          (EXIT (SPADCALL |pnum| |pden| (QREFELT $ 92)))))) 

(SDEFUN |GUESSEB;SUPFPOLYS2FSUPPOLYS!0| ((|z1| NIL) ($$ NIL))
        (PROG (|cden| $)
          (LETT |cden| (QREFELT $$ 1) . #1=(|GUESSEB;SUPFPOLYS2FSUPPOLYS|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |z1| (QCDR |cden|) (QREFELT $ 85))
                      (QREFELT $ 86)))))) 

(PUT '|GUESSEB;defaultD| '|SPADreplace| '(XLAM (|expr|) |expr|)) 

(SDEFUN |GUESSEB;defaultD| ((|expr| EXPRR) ($ EXPRR)) |expr|) 

(SDEFUN |GUESSEB;DN2DL| ((DN |Mapping| EXPRR EXPRR) (|i| |Integer|) ($ F))
        (SPADCALL (SPADCALL (SPADCALL |i| (QREFELT $ 24)) DN) (QREFELT $ 9))) 

(SDEFUN |GUESSEB;evalResultant|
        ((|p1| |SparseMultivariatePolynomial| S
          (|OrderedVariableList| (|construct| '|a1| 'A)))
         (|p2| |SparseMultivariatePolynomial| S
          (|OrderedVariableList| (|construct| '|a1| 'A)))
         (|o| |Integer|) (|d| |Integer|)
         (|va1| |OrderedVariableList| (|construct| '|a1| 'A))
         (|vA| |OrderedVariableList| (|construct| '|a1| 'A)) ($ |List| S))
        (SPROG
         ((|res| (|List| S)) (#1=#:G826 NIL) (#2=#:G824 NIL) (|lead| (S))
          (#3=#:G822 NIL) (#4=#:G820 NIL) (|d2atk| #5=(|NonNegativeInteger|))
          (|d1atk| #5#) (|p2atk| #6=(|SparseUnivariatePolynomial| S))
          (|p1atk| #6#) (#7=#:G832 NIL) (|k| NIL)
          (|d2| #8=(|NonNegativeInteger|)) (|d1| #8#))
         (SEQ (LETT |res| NIL . #9=(|GUESSEB;evalResultant|))
              (LETT |d1| (SPADCALL |p1| |va1| (QREFELT $ 93)) . #9#)
              (LETT |d2| (SPADCALL |p2| |va1| (QREFELT $ 93)) . #9#)
              (SEQ (LETT |k| 1 . #9#) (LETT #7# (+ (- |d| |o|) 1) . #9#) G190
                   (COND ((|greater_SI| |k| #7#) (GO G191)))
                   (SEQ
                    (LETT |p1atk|
                          (SPADCALL
                           (SPADCALL |p1| |vA| (SPADCALL |k| (QREFELT $ 94))
                                     (QREFELT $ 95))
                           (QREFELT $ 96))
                          . #9#)
                    (LETT |p2atk|
                          (SPADCALL
                           (SPADCALL |p2| |vA| (SPADCALL |k| (QREFELT $ 94))
                                     (QREFELT $ 95))
                           (QREFELT $ 96))
                          . #9#)
                    (LETT |d1atk| (SPADCALL |p1atk| (QREFELT $ 97)) . #9#)
                    (LETT |d2atk| (SPADCALL |p2atk| (QREFELT $ 97)) . #9#)
                    (COND
                     ((< |d2atk| |d2|)
                      (COND
                       ((< |d1atk| |d1|)
                        (LETT |lead| (|spadConstant| $ 27) . #9#))
                       ('T
                        (LETT |lead|
                              (SPADCALL (SPADCALL |p1atk| (QREFELT $ 98))
                                        (PROG1
                                            (LETT #4# (- |d2| |d2atk|) . #9#)
                                          (|check_subtype2| (>= #4# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #4#))
                                        (QREFELT $ 99))
                              . #9#))))
                     ((< |d1atk| |d1|)
                      (LETT |lead|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 12) (QREFELT $ 100))
                              |d2| (QREFELT $ 99))
                             (SPADCALL (SPADCALL |p2atk| (QREFELT $ 98))
                                       (PROG1 (LETT #3# (- |d1| |d1atk|) . #9#)
                                         (|check_subtype2| (>= #3# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #3#))
                                       (QREFELT $ 99))
                             (QREFELT $ 101))
                            . #9#))
                     ('T (LETT |lead| (|spadConstant| $ 12) . #9#)))
                    (EXIT
                     (COND
                      ((SPADCALL |lead| (QREFELT $ 102))
                       (LETT |res| (CONS (|spadConstant| $ 27) |res|) . #9#))
                      ('T
                       (LETT |res|
                             (CONS
                              (SPADCALL |lead|
                                        (PROG2
                                            (LETT #1#
                                                  (SPADCALL
                                                   (SPADCALL |p1atk| |p2atk|
                                                             (QREFELT $ 103))
                                                   (SPADCALL
                                                    (SPADCALL |k|
                                                              (QREFELT $ 94))
                                                    (PROG1 (LETT #2# |o| . #9#)
                                                      (|check_subtype2|
                                                       (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #2#))
                                                    (QREFELT $ 99))
                                                   (QREFELT $ 105))
                                                  . #9#)
                                            (QCDR #1#)
                                          (|check_union2| (QEQCAR #1# 0)
                                                          (QREFELT $ 7)
                                                          (|Union|
                                                           (QREFELT $ 7)
                                                           "failed")
                                                          #1#))
                                        (QREFELT $ 101))
                              |res|)
                             . #9#)))))
                   (LETT |k| (|inc_SI| |k|) . #9#) (GO G190) G191 (EXIT NIL))
              (EXIT (REVERSE |res|))))) 

(SDEFUN |GUESSEB;p_subst|
        ((|xm| |Integer|) (|i| |Integer|)
         (|va1| |OrderedVariableList| (|construct| '|a1| 'A))
         (|vA| |OrderedVariableList| (|construct| '|a1| 'A))
         (|basis| |Mapping| EXPRR EXPRR)
         ($ |Fraction|
          (|SparseMultivariatePolynomial| S
                                          (|OrderedVariableList|
                                           (|construct| '|a1| 'A)))))
        (SPADCALL (SPADCALL (SPADCALL |vA| (QREFELT $ 106)) (QREFELT $ 107))
                  (SPADCALL
                   (SPADCALL (SPADCALL |va1| (QREFELT $ 106)) (QREFELT $ 107))
                   (|GUESSEB;F2FPOLYS|
                    (SPADCALL (|GUESSEB;DN2DL| |basis| |i| $)
                              (|GUESSEB;DN2DL| |basis| |xm| $) (QREFELT $ 108))
                    $)
                   (QREFELT $ 109))
                  (QREFELT $ 110))) 

(SDEFUN |GUESSEB;p2_subst|
        ((|xm| |Integer|) (|i| |Symbol|) (|a1v| F) (|Av| F)
         (|basis| |Mapping| EXPRR EXPRR) ($ EXPRR))
        (SPADCALL (SPADCALL |Av| (QREFELT $ 10))
                  (SPADCALL (SPADCALL |a1v| (QREFELT $ 10))
                            (SPADCALL
                             (SPADCALL (SPADCALL |i| (QREFELT $ 23)) |basis|)
                             (SPADCALL (SPADCALL |xm| (QREFELT $ 24)) |basis|)
                             (QREFELT $ 111))
                            (QREFELT $ 60))
                  (QREFELT $ 62))) 

(SDEFUN |GUESSEB;guessExpRatAux|
        ((|xx| |Symbol|) (|list| |List| F) (|basis| |Mapping| EXPRR EXPRR)
         (|xValues| |List| (|Integer|)) (|options| |List| (|GuessOption|))
         ($ |List| EXPRR))
        (SPROG
         ((#1=#:G904 NIL) (|res| (|List| EXPRR)) (|res4| (EXPRR))
          (|denr| #2=(|SparseUnivariatePolynomial| F)) (|numr| #2#)
          (|ri1|
           (|Fraction|
            (|SparseUnivariatePolynomial|
             (|SparseMultivariatePolynomial| S
                                             (|OrderedVariableList|
                                              (|construct| '|a1| 'A))))))
          (|t2|
           #3=(|SparseMultivariatePolynomial| F
                                              (|OrderedVariableList|
                                               (|construct| '|a1| 'A))))
          (|t1| #3#) (|a1v| (F)) (#4=#:G911 NIL) (|g| NIL)
          (|evalPoly|
           (|SparseMultivariatePolynomial| F
                                           (|OrderedVariableList|
                                            (|construct| '|a1| 'A))))
          (|Av| (F)) (#5=#:G910 NIL) (|f| NIL)
          (|res3| (|SparseUnivariatePolynomial| F))
          (|res2| #6=(|SparseUnivariatePolynomial| S)) (|res1| #6#)
          (|d2| (|Integer|)) (|o2| (|Integer|)) (|d1| (|Integer|))
          (|o1| (|Integer|)) (|n| (|Integer|))
          (|poly3|
           #7=(|SparseMultivariatePolynomial| S
                                              (|OrderedVariableList|
                                               (|construct| '|a1| 'A))))
          (|poly2| #7#) (|poly1| #7#)
          (|ri|
           (|Fraction|
            (|SparseUnivariatePolynomial|
             (|Fraction|
              (|SparseMultivariatePolynomial| S
                                              (|OrderedVariableList|
                                               (|construct| '|a1| 'A)))))))
          (#8=#:G880 NIL) (#9=#:G909 NIL) (|i| NIL) (|maxDeg| (|Integer|))
          (|maxD| (|Union| (|NonNegativeInteger|) "arbitrary"))
          (|y3|
           #10=(|Fraction|
                (|SparseMultivariatePolynomial| S
                                                (|OrderedVariableList|
                                                 (|construct| '|a1| 'A)))))
          (|y2| #10#) (|y1| #10#)
          (|ylist|
           (|List|
            (|Fraction|
             (|SparseMultivariatePolynomial| S
                                             (|OrderedVariableList|
                                              (|construct| '|a1| 'A))))))
          (#11=#:G908 NIL) (#12=#:G907 NIL)
          (|y| (|Mapping| #10# (|NonNegativeInteger|)))
          (|x3|
           #13=(|Fraction|
                (|SparseMultivariatePolynomial| S
                                                (|OrderedVariableList|
                                                 (|construct| '|a1| 'A)))))
          (|x2| #13#) (|x1| #13#) (|xlist| (|List| #13#)) (#14=#:G906 NIL)
          (#15=#:G905 NIL) (|len| (|NonNegativeInteger|)) (#16=#:G854 NIL)
          (A #17=(|OrderedVariableList| (|construct| '|a1| 'A))) (|a1| #17#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |a1| (SPADCALL 1 (QREFELT $ 73))
                  . #18=(|GUESSEB;guessExpRatAux|))
            (LETT A (SPADCALL 2 (QREFELT $ 73)) . #18#)
            (LETT |len| (LENGTH |list|) . #18#)
            (COND ((< |len| 4) (PROGN (LETT #1# NIL . #18#) (GO #19=#:G903)))
                  (#20='T
                   (LETT |len|
                         (PROG1 (LETT #16# (- |len| 3) . #18#)
                           (|check_subtype2| (>= #16# 0)
                                             '(|NonNegativeInteger|)
                                             '(|Integer|) #16#))
                         . #18#)))
            (LETT |xlist|
                  (PROGN
                   (LETT #15# NIL . #18#)
                   (SEQ (LETT |i| 1 . #18#) (LETT #14# |len| . #18#) G190
                        (COND ((|greater_SI| |i| #14#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #15#
                                (CONS
                                 (|GUESSEB;F2FPOLYS|
                                  (|GUESSEB;DN2DL| |basis|
                                   (SPADCALL |xValues| |i| (QREFELT $ 15)) $)
                                  $)
                                 #15#)
                                . #18#)))
                        (LETT |i| (|inc_SI| |i|) . #18#) (GO G190) G191
                        (EXIT (NREVERSE #15#))))
                  . #18#)
            (LETT |x1|
                  (|GUESSEB;F2FPOLYS|
                   (|GUESSEB;DN2DL| |basis|
                    (SPADCALL |xValues| (+ |len| 1) (QREFELT $ 15)) $)
                   $)
                  . #18#)
            (LETT |x2|
                  (|GUESSEB;F2FPOLYS|
                   (|GUESSEB;DN2DL| |basis|
                    (SPADCALL |xValues| (+ |len| 2) (QREFELT $ 15)) $)
                   $)
                  . #18#)
            (LETT |x3|
                  (|GUESSEB;F2FPOLYS|
                   (|GUESSEB;DN2DL| |basis|
                    (SPADCALL |xValues| (+ |len| 3) (QREFELT $ 15)) $)
                   $)
                  . #18#)
            (LETT |y|
                  (CONS #'|GUESSEB;guessExpRatAux!0|
                        (VECTOR |basis| A |a1| |xValues| $ |list|))
                  . #18#)
            (LETT |ylist|
                  (PROGN
                   (LETT #12# NIL . #18#)
                   (SEQ (LETT |i| 1 . #18#) (LETT #11# |len| . #18#) G190
                        (COND ((|greater_SI| |i| #11#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #12# (CONS (SPADCALL |i| |y|) #12#) . #18#)))
                        (LETT |i| (|inc_SI| |i|) . #18#) (GO G190) G191
                        (EXIT (NREVERSE #12#))))
                  . #18#)
            (LETT |y1| (SPADCALL (+ |len| 1) |y|) . #18#)
            (LETT |y2| (SPADCALL (+ |len| 2) |y|) . #18#)
            (LETT |y3| (SPADCALL (+ |len| 3) |y|) . #18#)
            (LETT |res| NIL . #18#)
            (SEQ (LETT |maxD| (SPADCALL |options| (QREFELT $ 118)) . #18#)
                 (EXIT
                  (COND
                   ((QEQCAR |maxD| 0)
                    (LETT |maxDeg| (MIN (QCDR |maxD|) (- |len| 1)) . #18#))
                   (#20# (LETT |maxDeg| (- |len| 1) . #18#)))))
            (SEQ (LETT |i| 0 . #18#) (LETT #9# |maxDeg| . #18#) G190
                 (COND ((|greater_SI| |i| #9#) (GO G191)))
                 (SEQ
                  (COND
                   ((SPADCALL |options| (QREFELT $ 119))
                    (SPADCALL
                     (SPADCALL "Guess: degree ExpRat "
                               (SPADCALL |i| (QREFELT $ 121)) (QREFELT $ 122))
                     (QREFELT $ 125))))
                  (COND
                   ((SPADCALL |options| (QREFELT $ 119))
                    (SEQ (SPADCALL "sys date +%s" (QREFELT $ 127))
                         (EXIT
                          (SPADCALL "Guess: interpolating..."
                                    (QREFELT $ 125))))))
                  (LETT |ri|
                        (SPADCALL |xlist| |ylist|
                                  (PROG1 (LETT #8# (- (- |len| 1) |i|) . #18#)
                                    (|check_subtype2| (>= #8# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #8#))
                                  (QREFELT $ 131))
                        . #18#)
                  (COND
                   ((SPADCALL |options| (QREFELT $ 119))
                    (SPADCALL "Guess: polynomials..." (QREFELT $ 125))))
                  (LETT |poly1|
                        (SPADCALL
                         (SPADCALL (SPADCALL |ri| |x1| (QREFELT $ 133)) |y1|
                                   (QREFELT $ 134))
                         (QREFELT $ 135))
                        . #18#)
                  (LETT |poly2|
                        (SPADCALL
                         (SPADCALL (SPADCALL |ri| |x2| (QREFELT $ 133)) |y2|
                                   (QREFELT $ 134))
                         (QREFELT $ 135))
                        . #18#)
                  (LETT |poly3|
                        (SPADCALL
                         (SPADCALL (SPADCALL |ri| |x3| (QREFELT $ 133)) |y3|
                                   (QREFELT $ 134))
                         (QREFELT $ 135))
                        . #18#)
                  (LETT |n| (- |len| |i|) . #18#)
                  (LETT |o1| (|GUESSEB;ord1| |xValues| |i| $) . #18#)
                  (LETT |d1| (|GUESSEB;deg1| |xValues| |i| $) . #18#)
                  (LETT |o2| (|GUESSEB;ord2| |xValues| |i| $) . #18#)
                  (LETT |d2| (|GUESSEB;deg2| |xValues| |i| $) . #18#)
                  (COND
                   ((SPADCALL |options| (QREFELT $ 119))
                    (SPADCALL "Guess: interpolating resultants..."
                              (QREFELT $ 125))))
                  (LETT |res1|
                        (SPADCALL
                         (|GUESSEB;evalResultant| |poly1| |poly3| |o1| |d1|
                          |a1| A $)
                         (QREFELT $ 138))
                        . #18#)
                  (LETT |res2|
                        (SPADCALL
                         (|GUESSEB;evalResultant| |poly2| |poly3| |o2| |d2|
                          |a1| A $)
                         (QREFELT $ 138))
                        . #18#)
                  (COND
                   ((SPADCALL |options| (QREFELT $ 119))
                    (SPADCALL "Guess: computing gcd..." (QREFELT $ 125))))
                  (LETT |res3|
                        (|GUESSEB;SUPS2SUPF|
                         (SPADCALL (SPADCALL |res1| |res2| (QREFELT $ 139))
                                   (QREFELT $ 140))
                         $)
                        . #18#)
                  (COND
                   ((SPADCALL |options| (QREFELT $ 119))
                    (SPADCALL "Guess: solving..." (QREFELT $ 125))))
                  (SEQ (LETT |f| NIL . #18#)
                       (LETT #5#
                             (SPADCALL (SPADCALL |res3| (QREFELT $ 143))
                                       (QREFELT $ 146))
                             . #18#)
                       G190
                       (COND
                        ((OR (ATOM #5#)
                             (PROGN (LETT |f| (CAR #5#) . #18#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((EQL (SPADCALL (QCAR |f|) (QREFELT $ 58)) 1)
                           (SEQ
                            (LETT |Av|
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL (QCAR |f|) 0 (QREFELT $ 147))
                                    (SPADCALL (QCAR |f|) (QREFELT $ 56))
                                    (QREFELT $ 148))
                                   (QREFELT $ 149))
                                  . #18#)
                            (LETT |evalPoly|
                                  (SPADCALL (|GUESSEB;POLYS2POLYF| |poly3| $) A
                                            |Av| (QREFELT $ 150))
                                  . #18#)
                            (COND
                             ((SPADCALL |evalPoly| (QREFELT $ 151))
                              (LETT |evalPoly|
                                    (SPADCALL (|GUESSEB;POLYS2POLYF| |poly1| $)
                                              A |Av| (QREFELT $ 150))
                                    . #18#)))
                            (EXIT
                             (SEQ (LETT |g| NIL . #18#)
                                  (LETT #4#
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |evalPoly| (QREFELT $ 152))
                                          (QREFELT $ 143))
                                         (QREFELT $ 146))
                                        . #18#)
                                  G190
                                  (COND
                                   ((OR (ATOM #4#)
                                        (PROGN
                                         (LETT |g| (CAR #4#) . #18#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((EQL (SPADCALL (QCAR |g|) (QREFELT $ 58))
                                           1)
                                      (SEQ
                                       (LETT |a1v|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL (QCAR |g|) 0
                                                         (QREFELT $ 147))
                                               (SPADCALL (QCAR |g|)
                                                         (QREFELT $ 56))
                                               (QREFELT $ 148))
                                              (QREFELT $ 149))
                                             . #18#)
                                       (LETT |t1|
                                             (SPADCALL
                                              (|GUESSEB;POLYS2POLYF| |poly1| $)
                                              (LIST |a1| A) (LIST |a1v| |Av|)
                                              (QREFELT $ 75))
                                             . #18#)
                                       (COND
                                        ((NULL (SPADCALL |t1| (QREFELT $ 151)))
                                         (EXIT "iterate")))
                                       (LETT |t2|
                                             (SPADCALL
                                              (|GUESSEB;POLYS2POLYF| |poly2| $)
                                              (LIST |a1| A) (LIST |a1v| |Av|)
                                              (QREFELT $ 75))
                                             . #18#)
                                       (EXIT
                                        (COND
                                         ((SPADCALL |t2| (QREFELT $ 151))
                                          (SEQ
                                           (LETT |ri1|
                                                 (SPADCALL
                                                  (|GUESSEB;SUPFPOLYS2FSUPPOLYS|
                                                   (SPADCALL |ri|
                                                             (QREFELT $ 153))
                                                   $)
                                                  (|GUESSEB;SUPFPOLYS2FSUPPOLYS|
                                                   (SPADCALL |ri|
                                                             (QREFELT $ 154))
                                                   $)
                                                  (QREFELT $ 155))
                                                 . #18#)
                                           (LETT |numr|
                                                 (|GUESSEB;SUPPOLYS2SUPF|
                                                  (SPADCALL |ri1|
                                                            (QREFELT $ 156))
                                                  |a1v| |Av| $)
                                                 . #18#)
                                           (LETT |denr|
                                                 (|GUESSEB;SUPPOLYS2SUPF|
                                                  (SPADCALL |ri1|
                                                            (QREFELT $ 157))
                                                  |a1v| |Av| $)
                                                 . #18#)
                                           (EXIT
                                            (COND
                                             ((SPADCALL |denr| (QREFELT $ 55))
                                              (COND
                                               ((SPADCALL |numr|
                                                          (QREFELT $ 55))
                                                (COND
                                                 ((SPADCALL |options|
                                                            (QREFELT $ 119))
                                                  (SPADCALL
                                                   "Guess: numerator and denominator vanish!"
                                                   (QREFELT $ 158)))))))
                                             ('T
                                              (SEQ
                                               (LETT |res4|
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (|GUESSEB;FSUPF2EXPRR|
                                                        |xx|
                                                        (SPADCALL |numr| |denr|
                                                                  (QREFELT $
                                                                           159))
                                                        $)
                                                       (SPADCALL |xx|
                                                                 (QREFELT $
                                                                          161))
                                                       (SPADCALL
                                                        (SPADCALL |xx|
                                                                  (QREFELT $
                                                                           23))
                                                        |basis|)
                                                       (QREFELT $ 163))
                                                      (SPADCALL
                                                       (|GUESSEB;p2_subst|
                                                        (SPADCALL |xValues|
                                                                  (QREFELT $
                                                                           112))
                                                        |xx| |a1v| |Av| |basis|
                                                        $)
                                                       (SPADCALL |xx|
                                                                 (QREFELT $
                                                                          23))
                                                       (QREFELT $ 164))
                                                      (QREFELT $ 60))
                                                     . #18#)
                                               (EXIT
                                                (LETT |res| (CONS |res4| |res|)
                                                      . #18#)))))))))))))))
                                  (LETT #4# (CDR #4#) . #18#) (GO G190) G191
                                  (EXIT NIL))))))))
                       (LETT #5# (CDR #5#) . #18#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND
                    ((NULL (NULL |res|))
                     (COND
                      ((SPADCALL |options| (QREFELT $ 165))
                       (PROGN (LETT #1# |res| . #18#) (GO #19#))))))))
                 (LETT |i| (|inc_SI| |i|) . #18#) (GO G190) G191 (EXIT NIL))
            (EXIT |res|)))
          #19# (EXIT #1#)))) 

(SDEFUN |GUESSEB;guessExpRatAux!0| ((|z1| NIL) ($$ NIL))
        (PROG (|list| $ |xValues| |a1| A |basis|)
          (LETT |list| (QREFELT $$ 5) . #1=(|GUESSEB;guessExpRatAux|))
          (LETT $ (QREFELT $$ 4) . #1#)
          (LETT |xValues| (QREFELT $$ 3) . #1#)
          (LETT |a1| (QREFELT $$ 2) . #1#)
          (LETT A (QREFELT $$ 1) . #1#)
          (LETT |basis| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (|GUESSEB;F2FPOLYS| (SPADCALL |list| |z1| (QREFELT $ 33)) $)
             (SPADCALL
              (|GUESSEB;p_subst| (SPADCALL |xValues| (QREFELT $ 112))
               (SPADCALL |xValues| |z1| (QREFELT $ 15)) |a1| A |basis| $)
              (SPADCALL (SPADCALL |xValues| |z1| (QREFELT $ 15))
                        (QREFELT $ 113))
              (QREFELT $ 114))
             (QREFELT $ 109)))))) 

(SDEFUN |GUESSEB;guessExpRatAux0|
        ((|list| |List| F) (|basis| |Mapping| EXPRR EXPRR)
         (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG
         ((|res| (|List| EXPRR)) (#1=#:G929 NIL) (|f| NIL) (#2=#:G928 NIL)
          (|xValues| (|List| (|Integer|))) (|newlist| (|List| F))
          (|i| (|Integer|)) (#3=#:G927 NIL) (|x| NIL) (|zeros| (EXPRR))
          (#4=#:G926 NIL) (|shortlist| (|List| F)) (#5=#:G914 NIL)
          (#6=#:G925 NIL) (|len| (|Integer|)) (|xx| (|Symbol|)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((ZEROP (SPADCALL |options| (QREFELT $ 166)))
              (|error| "Guess: guessExpRat does not support zero safety")))
            (LETT |xx| (SPADCALL |options| (QREFELT $ 167))
                  . #7=(|GUESSEB;guessExpRatAux0|))
            (LETT |len| (LENGTH |list|) . #7#)
            (COND
             ((< (+ (- |len| (SPADCALL |options| (QREFELT $ 166))) 1) 0)
              (PROGN (LETT #6# NIL . #7#) (GO #8=#:G924))))
            (LETT |shortlist|
                  (SPADCALL |list|
                            (PROG1
                                (LETT #5#
                                      (+
                                       (- |len|
                                          (SPADCALL |options| (QREFELT $ 166)))
                                       1)
                                      . #7#)
                              (|check_subtype2| (>= #5# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #5#))
                            (QREFELT $ 168))
                  . #7#)
            (LETT |zeros| (|spadConstant| $ 169) . #7#) (LETT |i| -1 . #7#)
            (SEQ (LETT |x| NIL . #7#) (LETT #4# |shortlist| . #7#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#) . #7#) NIL))
                   (GO G191)))
                 (SEQ (LETT |i| (+ |i| 1) . #7#)
                      (EXIT
                       (COND
                        ((SPADCALL |x| (|spadConstant| $ 26) (QREFELT $ 170))
                         (LETT |zeros|
                               (SPADCALL |zeros|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |xx| (QREFELT $ 23))
                                           |basis|)
                                          (SPADCALL
                                           (SPADCALL |i| (QREFELT $ 24))
                                           |basis|)
                                          (QREFELT $ 111))
                                         (QREFELT $ 60))
                               . #7#)))))
                 (LETT #4# (CDR #4#) . #7#) (GO G190) G191 (EXIT NIL))
            (LETT |i| -1 . #7#)
            (SEQ (LETT |x| NIL . #7#) (LETT #3# |shortlist| . #7#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #7#) NIL))
                   (GO G191)))
                 (SEQ (LETT |i| (+ |i| 1) . #7#)
                      (EXIT
                       (COND
                        ((SPADCALL |x| (|spadConstant| $ 26) (QREFELT $ 35))
                         (SEQ
                          (LETT |newlist|
                                (CONS
                                 (SPADCALL |x|
                                           (SPADCALL
                                            (SPADCALL |zeros|
                                                      (SPADCALL |xx|
                                                                (QREFELT $ 23))
                                                      (SPADCALL |i|
                                                                (QREFELT $ 24))
                                                      (QREFELT $ 25))
                                            (QREFELT $ 9))
                                           (QREFELT $ 148))
                                 |newlist|)
                                . #7#)
                          (EXIT
                           (LETT |xValues| (CONS |i| |xValues|) . #7#)))))))
                 (LETT #3# (CDR #3#) . #7#) (GO G190) G191 (EXIT NIL))
            (LETT |newlist| (REVERSE |newlist|) . #7#)
            (LETT |xValues| (REVERSE |xValues|) . #7#)
            (LETT |res|
                  (PROGN
                   (LETT #2# NIL . #7#)
                   (SEQ (LETT |f| NIL . #7#)
                        (LETT #1#
                              (|GUESSEB;guessExpRatAux| |xx| |newlist| |basis|
                               |xValues| |options| $)
                              . #7#)
                        G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |f| (CAR #1#) . #7#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS
                                 (SPADCALL
                                  (SPADCALL |zeros| |f| (QREFELT $ 60))
                                  (SPADCALL |xx| (QREFELT $ 23))
                                  (SPADCALL |xx| (QREFELT $ 23))
                                  (QREFELT $ 25))
                                 #2#)
                                . #7#)))
                        (LETT #1# (CDR #1#) . #7#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  . #7#)
            (EXIT
             (SPADCALL
              (CONS #'|GUESSEB;guessExpRatAux0!0|
                    (VECTOR |options| $ |list| |len| |xx|))
              |res| (QREFELT $ 175)))))
          #8# (EXIT #6#)))) 

(SDEFUN |GUESSEB;guessExpRatAux0!0| ((|z1| NIL) ($$ NIL))
        (PROG (|xx| |len| |list| $ |options|)
          (LETT |xx| (QREFELT $$ 4) . #1=(|GUESSEB;guessExpRatAux0|))
          (LETT |len| (QREFELT $$ 3) . #1#)
          (LETT |list| (QREFELT $$ 2) . #1#)
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |options| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (|GUESSEB;checkResult| |z1| |xx| |len| |list| $)
                      (SPADCALL |len| (SPADCALL |options| (QREFELT $ 166))
                                (QREFELT $ 171))
                      (QREFELT $ 172)))))) 

(SDEFUN |GUESSEB;guessExpRat;LLL;20|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (|GUESSEB;guessExpRatAux0| |list|
         (CONS (|function| |GUESSEB;defaultD|) $) |options| $)) 

(SDEFUN |GUESSEB;guessExpRat;SM;21|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPROG NIL (CONS #'|GUESSEB;guessExpRat;SM;21!1| (VECTOR |q| $)))) 

(SDEFUN |GUESSEB;guessExpRat;SM;21!1| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1) . #1=(|GUESSEB;guessExpRat;SM;21|))
          (LETT |q| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (|GUESSEB;guessExpRatAux0| |z1|
                    (CONS #'|GUESSEB;guessExpRat;SM;21!0| (VECTOR $ |q|)) |z2|
                    $)))))) 

(SDEFUN |GUESSEB;guessExpRat;SM;21!0| ((|i1| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |q| (QREFELT $ 23)) |i1| (QREFELT $ 164)))))) 

(SDEFUN |GUESSEB;binExt|
        ((|i| |Integer|) (|va1| |OrderedVariableList| (|construct| '|a1| 'A))
         (|vA| |OrderedVariableList| (|construct| '|a1| 'A))
         ($ |Fraction|
          (|SparseMultivariatePolynomial| S
                                          (|OrderedVariableList|
                                           (|construct| '|a1| 'A)))))
        (SPROG
         ((|num|
           (|SparseMultivariatePolynomial| S
                                           (|OrderedVariableList|
                                            (|construct| '|a1| 'A))))
          (|numl|
           (|List|
            (|SparseMultivariatePolynomial| S
                                            (|OrderedVariableList|
                                             (|construct| '|a1| 'A)))))
          (#1=#:G942 NIL) (|l| NIL) (#2=#:G941 NIL))
         (SEQ
          (LETT |numl|
                (PROGN
                 (LETT #2# NIL . #3=(|GUESSEB;binExt|))
                 (SEQ (LETT |l| 0 . #3#) (LETT #1# (- |i| 1) . #3#) G190
                      (COND ((|greater_SI| |l| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL
                                (SPADCALL (SPADCALL |vA| (QREFELT $ 106))
                                          (SPADCALL |i|
                                                    (SPADCALL |va1|
                                                              (QREFELT $ 106))
                                                    (QREFELT $ 179))
                                          (QREFELT $ 180))
                                (SPADCALL |l| (QREFELT $ 181)) (QREFELT $ 182))
                               #2#)
                              . #3#)))
                      (LETT |l| (|inc_SI| |l|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (LETT |num|
                (SPADCALL (ELT $ 183) |numl| (|spadConstant| $ 184)
                          (QREFELT $ 187))
                . #3#)
          (EXIT
           (SPADCALL |num|
                     (SPADCALL (SPADCALL |i| (QREFELT $ 188)) (QREFELT $ 181))
                     (QREFELT $ 54)))))) 

(SDEFUN |GUESSEB;binExtEXPR| ((|i| |Symbol|) (|a1v| F) (|Av| F) ($ EXPRR))
        (SPADCALL
         (SPADCALL (SPADCALL |Av| (QREFELT $ 10))
                   (SPADCALL (SPADCALL |a1v| (QREFELT $ 10))
                             (SPADCALL |i| (QREFELT $ 23)) (QREFELT $ 60))
                   (QREFELT $ 62))
         (SPADCALL |i| (QREFELT $ 23)) (QREFELT $ 189))) 

(SDEFUN |GUESSEB;guessBinRatAux|
        ((|xx| |Symbol|) (|list| |List| F) (|basis| |Mapping| EXPRR EXPRR)
         (|ext| |Mapping|
          (|Fraction|
           (|SparseMultivariatePolynomial| S
                                           (|OrderedVariableList|
                                            (|construct| '|a1| 'A))))
          (|Integer|) (|OrderedVariableList| (|construct| '|a1| 'A))
          (|OrderedVariableList| (|construct| '|a1| 'A)))
         (|extEXPR| |Mapping| EXPRR (|Symbol|) F F)
         (|xValues| |List| (|Integer|)) (|options| |List| (|GuessOption|))
         ($ |List| EXPRR))
        (SPROG
         ((#1=#:G974 NIL) (|res| (|List| EXPRR)) (|res4| (EXPRR))
          (|denr| #2=(|SparseUnivariatePolynomial| F)) (|numr| #2#)
          (|ri1|
           (|Fraction|
            (|SparseUnivariatePolynomial|
             (|SparseMultivariatePolynomial| S
                                             (|OrderedVariableList|
                                              (|construct| '|a1| 'A))))))
          (|t2|
           #3=(|SparseMultivariatePolynomial| F
                                              (|OrderedVariableList|
                                               (|construct| '|a1| 'A))))
          (|t1| #3#) (|a1v| (F)) (#4=#:G981 NIL) (|g| NIL)
          (|evalPoly|
           (|SparseMultivariatePolynomial| F
                                           (|OrderedVariableList|
                                            (|construct| '|a1| 'A))))
          (|Av| (F)) (#5=#:G980 NIL) (|f| NIL)
          (|res3| (|SparseUnivariatePolynomial| F))
          (|res2| #6=(|SparseUnivariatePolynomial| S)) (|res1| #6#)
          (|n| (|Integer|))
          (|poly3|
           #7=(|SparseMultivariatePolynomial| S
                                              (|OrderedVariableList|
                                               (|construct| '|a1| 'A))))
          (|poly2| #7#) (|poly1| #7#)
          (|ri|
           (|Fraction|
            (|SparseUnivariatePolynomial|
             (|Fraction|
              (|SparseMultivariatePolynomial| S
                                              (|OrderedVariableList|
                                               (|construct| '|a1| 'A)))))))
          (#8=#:G956 NIL) (#9=#:G979 NIL) (|i| NIL) (|maxDeg| (|Integer|))
          (|maxD| (|Union| (|NonNegativeInteger|) "arbitrary"))
          (|y3|
           #10=(|Fraction|
                (|SparseMultivariatePolynomial| S
                                                (|OrderedVariableList|
                                                 (|construct| '|a1| 'A)))))
          (|y2| #10#) (|y1| #10#)
          (|ylist|
           (|List|
            (|Fraction|
             (|SparseMultivariatePolynomial| S
                                             (|OrderedVariableList|
                                              (|construct| '|a1| 'A))))))
          (#11=#:G978 NIL) (#12=#:G977 NIL)
          (|y| (|Mapping| #10# (|NonNegativeInteger|)))
          (|x3|
           #13=(|Fraction|
                (|SparseMultivariatePolynomial| S
                                                (|OrderedVariableList|
                                                 (|construct| '|a1| 'A)))))
          (|x2| #13#) (|x1| #13#) (|xlist| (|List| #13#)) (#14=#:G976 NIL)
          (#15=#:G975 NIL) (|len| (|NonNegativeInteger|)) (#16=#:G944 NIL)
          (A #17=(|OrderedVariableList| (|construct| '|a1| 'A))) (|a1| #17#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |a1| (SPADCALL 1 (QREFELT $ 73))
                  . #18=(|GUESSEB;guessBinRatAux|))
            (LETT A (SPADCALL 2 (QREFELT $ 73)) . #18#)
            (LETT |len| (LENGTH |list|) . #18#)
            (COND ((< |len| 4) (PROGN (LETT #1# NIL . #18#) (GO #19=#:G973)))
                  (#20='T
                   (LETT |len|
                         (PROG1 (LETT #16# (- |len| 3) . #18#)
                           (|check_subtype2| (>= #16# 0)
                                             '(|NonNegativeInteger|)
                                             '(|Integer|) #16#))
                         . #18#)))
            (LETT |xlist|
                  (PROGN
                   (LETT #15# NIL . #18#)
                   (SEQ (LETT |i| 1 . #18#) (LETT #14# |len| . #18#) G190
                        (COND ((|greater_SI| |i| #14#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #15#
                                (CONS
                                 (|GUESSEB;F2FPOLYS|
                                  (|GUESSEB;DN2DL| |basis|
                                   (SPADCALL |xValues| |i| (QREFELT $ 15)) $)
                                  $)
                                 #15#)
                                . #18#)))
                        (LETT |i| (|inc_SI| |i|) . #18#) (GO G190) G191
                        (EXIT (NREVERSE #15#))))
                  . #18#)
            (LETT |x1|
                  (|GUESSEB;F2FPOLYS|
                   (|GUESSEB;DN2DL| |basis|
                    (SPADCALL |xValues| (+ |len| 1) (QREFELT $ 15)) $)
                   $)
                  . #18#)
            (LETT |x2|
                  (|GUESSEB;F2FPOLYS|
                   (|GUESSEB;DN2DL| |basis|
                    (SPADCALL |xValues| (+ |len| 2) (QREFELT $ 15)) $)
                   $)
                  . #18#)
            (LETT |x3|
                  (|GUESSEB;F2FPOLYS|
                   (|GUESSEB;DN2DL| |basis|
                    (SPADCALL |xValues| (+ |len| 3) (QREFELT $ 15)) $)
                   $)
                  . #18#)
            (LETT |y|
                  (CONS #'|GUESSEB;guessBinRatAux!0|
                        (VECTOR |ext| A |a1| |xValues| $ |list|))
                  . #18#)
            (LETT |ylist|
                  (PROGN
                   (LETT #12# NIL . #18#)
                   (SEQ (LETT |i| 1 . #18#) (LETT #11# |len| . #18#) G190
                        (COND ((|greater_SI| |i| #11#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #12# (CONS (SPADCALL |i| |y|) #12#) . #18#)))
                        (LETT |i| (|inc_SI| |i|) . #18#) (GO G190) G191
                        (EXIT (NREVERSE #12#))))
                  . #18#)
            (LETT |y1| (SPADCALL (+ |len| 1) |y|) . #18#)
            (LETT |y2| (SPADCALL (+ |len| 2) |y|) . #18#)
            (LETT |y3| (SPADCALL (+ |len| 3) |y|) . #18#)
            (LETT |res| NIL . #18#)
            (SEQ (LETT |maxD| (SPADCALL |options| (QREFELT $ 118)) . #18#)
                 (EXIT
                  (COND
                   ((QEQCAR |maxD| 0)
                    (LETT |maxDeg| (MIN (QCDR |maxD|) (- |len| 1)) . #18#))
                   (#20# (LETT |maxDeg| (- |len| 1) . #18#)))))
            (SEQ (LETT |i| 0 . #18#) (LETT #9# |maxDeg| . #18#) G190
                 (COND ((|greater_SI| |i| #9#) (GO G191)))
                 (SEQ
                  (LETT |ri|
                        (SPADCALL |xlist| |ylist|
                                  (PROG1 (LETT #8# (- (- |len| 1) |i|) . #18#)
                                    (|check_subtype2| (>= #8# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #8#))
                                  (QREFELT $ 131))
                        . #18#)
                  (LETT |poly1|
                        (SPADCALL
                         (SPADCALL (SPADCALL |ri| |x1| (QREFELT $ 133)) |y1|
                                   (QREFELT $ 134))
                         (QREFELT $ 135))
                        . #18#)
                  (LETT |poly2|
                        (SPADCALL
                         (SPADCALL (SPADCALL |ri| |x2| (QREFELT $ 133)) |y2|
                                   (QREFELT $ 134))
                         (QREFELT $ 135))
                        . #18#)
                  (LETT |poly3|
                        (SPADCALL
                         (SPADCALL (SPADCALL |ri| |x3| (QREFELT $ 133)) |y3|
                                   (QREFELT $ 134))
                         (QREFELT $ 135))
                        . #18#)
                  (LETT |n| (- |len| |i|) . #18#)
                  (LETT |res1|
                        (SPADCALL
                         (SPADCALL |poly1| |poly3| |a1| (QREFELT $ 191))
                         (QREFELT $ 96))
                        . #18#)
                  (LETT |res2|
                        (SPADCALL
                         (SPADCALL |poly2| |poly3| |a1| (QREFELT $ 191))
                         (QREFELT $ 96))
                        . #18#)
                  (COND
                   ((SPADCALL |options| (QREFELT $ 119))
                    (SPADCALL "Guess: computing gcd..." (QREFELT $ 125))))
                  (LETT |res3|
                        (|GUESSEB;SUPS2SUPF|
                         (SPADCALL (SPADCALL |res1| |res2| (QREFELT $ 139))
                                   (QREFELT $ 140))
                         $)
                        . #18#)
                  (SEQ (LETT |f| NIL . #18#)
                       (LETT #5#
                             (SPADCALL (SPADCALL |res3| (QREFELT $ 143))
                                       (QREFELT $ 146))
                             . #18#)
                       G190
                       (COND
                        ((OR (ATOM #5#)
                             (PROGN (LETT |f| (CAR #5#) . #18#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((EQL (SPADCALL (QCAR |f|) (QREFELT $ 58)) 1)
                           (SEQ
                            (LETT |Av|
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL (QCAR |f|) 0 (QREFELT $ 147))
                                    (SPADCALL (QCAR |f|) (QREFELT $ 56))
                                    (QREFELT $ 148))
                                   (QREFELT $ 149))
                                  . #18#)
                            (LETT |evalPoly|
                                  (SPADCALL (|GUESSEB;POLYS2POLYF| |poly3| $) A
                                            |Av| (QREFELT $ 150))
                                  . #18#)
                            (COND
                             ((SPADCALL |evalPoly| (QREFELT $ 151))
                              (LETT |evalPoly|
                                    (SPADCALL (|GUESSEB;POLYS2POLYF| |poly1| $)
                                              A |Av| (QREFELT $ 150))
                                    . #18#)))
                            (EXIT
                             (SEQ (LETT |g| NIL . #18#)
                                  (LETT #4#
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |evalPoly| (QREFELT $ 152))
                                          (QREFELT $ 143))
                                         (QREFELT $ 146))
                                        . #18#)
                                  G190
                                  (COND
                                   ((OR (ATOM #4#)
                                        (PROGN
                                         (LETT |g| (CAR #4#) . #18#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((EQL (SPADCALL (QCAR |g|) (QREFELT $ 58))
                                           1)
                                      (SEQ
                                       (LETT |a1v|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL (QCAR |g|) 0
                                                         (QREFELT $ 147))
                                               (SPADCALL (QCAR |g|)
                                                         (QREFELT $ 56))
                                               (QREFELT $ 148))
                                              (QREFELT $ 149))
                                             . #18#)
                                       (LETT |t1|
                                             (SPADCALL
                                              (|GUESSEB;POLYS2POLYF| |poly1| $)
                                              (LIST |a1| A) (LIST |a1v| |Av|)
                                              (QREFELT $ 75))
                                             . #18#)
                                       (COND
                                        ((NULL (SPADCALL |t1| (QREFELT $ 151)))
                                         (EXIT "iterate")))
                                       (LETT |t2|
                                             (SPADCALL
                                              (|GUESSEB;POLYS2POLYF| |poly2| $)
                                              (LIST |a1| A) (LIST |a1v| |Av|)
                                              (QREFELT $ 75))
                                             . #18#)
                                       (EXIT
                                        (COND
                                         ((SPADCALL |t2| (QREFELT $ 151))
                                          (SEQ
                                           (LETT |ri1|
                                                 (SPADCALL
                                                  (|GUESSEB;SUPFPOLYS2FSUPPOLYS|
                                                   (SPADCALL |ri|
                                                             (QREFELT $ 153))
                                                   $)
                                                  (|GUESSEB;SUPFPOLYS2FSUPPOLYS|
                                                   (SPADCALL |ri|
                                                             (QREFELT $ 154))
                                                   $)
                                                  (QREFELT $ 155))
                                                 . #18#)
                                           (LETT |numr|
                                                 (|GUESSEB;SUPPOLYS2SUPF|
                                                  (SPADCALL |ri1|
                                                            (QREFELT $ 156))
                                                  |a1v| |Av| $)
                                                 . #18#)
                                           (LETT |denr|
                                                 (|GUESSEB;SUPPOLYS2SUPF|
                                                  (SPADCALL |ri1|
                                                            (QREFELT $ 157))
                                                  |a1v| |Av| $)
                                                 . #18#)
                                           (EXIT
                                            (COND
                                             ((SPADCALL |denr| (QREFELT $ 55))
                                              (COND
                                               ((SPADCALL |numr|
                                                          (QREFELT $ 55))
                                                (COND
                                                 ((SPADCALL |options|
                                                            (QREFELT $ 119))
                                                  (SPADCALL
                                                   "Guess: numerator and denominator vanish!"
                                                   (QREFELT $ 158)))))))
                                             ('T
                                              (SEQ
                                               (LETT |res4|
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (|GUESSEB;FSUPF2EXPRR|
                                                        |xx|
                                                        (SPADCALL |numr| |denr|
                                                                  (QREFELT $
                                                                           159))
                                                        $)
                                                       (SPADCALL |xx|
                                                                 (QREFELT $
                                                                          161))
                                                       (SPADCALL
                                                        (SPADCALL |xx|
                                                                  (QREFELT $
                                                                           23))
                                                        |basis|)
                                                       (QREFELT $ 163))
                                                      (SPADCALL |xx| |a1v| |Av|
                                                                |extEXPR|)
                                                      (QREFELT $ 60))
                                                     . #18#)
                                               (EXIT
                                                (LETT |res| (CONS |res4| |res|)
                                                      . #18#)))))))))))))))
                                  (LETT #4# (CDR #4#) . #18#) (GO G190) G191
                                  (EXIT NIL))))))))
                       (LETT #5# (CDR #5#) . #18#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND
                    ((NULL (NULL |res|))
                     (COND
                      ((SPADCALL |options| (QREFELT $ 165))
                       (PROGN (LETT #1# |res| . #18#) (GO #19#))))))))
                 (LETT |i| (|inc_SI| |i|) . #18#) (GO G190) G191 (EXIT NIL))
            (EXIT |res|)))
          #19# (EXIT #1#)))) 

(SDEFUN |GUESSEB;guessBinRatAux!0| ((|z1| NIL) ($$ NIL))
        (PROG (|list| $ |xValues| |a1| A |ext|)
          (LETT |list| (QREFELT $$ 5) . #1=(|GUESSEB;guessBinRatAux|))
          (LETT $ (QREFELT $$ 4) . #1#)
          (LETT |xValues| (QREFELT $$ 3) . #1#)
          (LETT |a1| (QREFELT $$ 2) . #1#)
          (LETT A (QREFELT $$ 1) . #1#)
          (LETT |ext| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (|GUESSEB;F2FPOLYS| (SPADCALL |list| |z1| (QREFELT $ 33)) $)
             (SPADCALL (SPADCALL |xValues| |z1| (QREFELT $ 15)) |a1| A |ext|)
             (QREFELT $ 190)))))) 

(SDEFUN |GUESSEB;guessBinRatAux0|
        ((|list| |List| F) (|basis| |Mapping| EXPRR EXPRR)
         (|ext| |Mapping|
          (|Fraction|
           (|SparseMultivariatePolynomial| S
                                           (|OrderedVariableList|
                                            (|construct| '|a1| 'A))))
          (|Integer|) (|OrderedVariableList| (|construct| '|a1| 'A))
          (|OrderedVariableList| (|construct| '|a1| 'A)))
         (|extEXPR| |Mapping| EXPRR (|Symbol|) F F)
         (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG
         ((|res| (|List| EXPRR)) (#1=#:G1005 NIL) (|f| NIL) (#2=#:G1004 NIL)
          (|xValues| (|List| (|Integer|))) (|newlist| (|List| F))
          (|i| (|Integer|)) (#3=#:G1003 NIL) (|x| NIL) (|zeros| (EXPRR))
          (#4=#:G1002 NIL) (|shortlist| (|List| F)) (#5=#:G984 NIL)
          (#6=#:G1001 NIL) (|len| (|Integer|)) (|xx| (|Symbol|)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((ZEROP (SPADCALL |options| (QREFELT $ 166)))
              (|error| "Guess: guessBinRat does not support zero safety")))
            (LETT |xx| (SPADCALL |options| (QREFELT $ 167))
                  . #7=(|GUESSEB;guessBinRatAux0|))
            (LETT |len| (LENGTH |list|) . #7#)
            (COND
             ((< (+ (- |len| (SPADCALL |options| (QREFELT $ 166))) 1) 0)
              (PROGN (LETT #6# NIL . #7#) (GO #8=#:G1000))))
            (LETT |shortlist|
                  (SPADCALL |list|
                            (PROG1
                                (LETT #5#
                                      (+
                                       (- |len|
                                          (SPADCALL |options| (QREFELT $ 166)))
                                       1)
                                      . #7#)
                              (|check_subtype2| (>= #5# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #5#))
                            (QREFELT $ 168))
                  . #7#)
            (LETT |zeros| (|spadConstant| $ 169) . #7#) (LETT |i| -1 . #7#)
            (SEQ (LETT |x| NIL . #7#) (LETT #4# |shortlist| . #7#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#) . #7#) NIL))
                   (GO G191)))
                 (SEQ (LETT |i| (+ |i| 1) . #7#)
                      (EXIT
                       (COND
                        ((SPADCALL |x| (|spadConstant| $ 26) (QREFELT $ 170))
                         (LETT |zeros|
                               (SPADCALL |zeros|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |xx| (QREFELT $ 23))
                                           |basis|)
                                          (SPADCALL
                                           (SPADCALL |i| (QREFELT $ 24))
                                           |basis|)
                                          (QREFELT $ 111))
                                         (QREFELT $ 60))
                               . #7#)))))
                 (LETT #4# (CDR #4#) . #7#) (GO G190) G191 (EXIT NIL))
            (LETT |i| -1 . #7#)
            (SEQ (LETT |x| NIL . #7#) (LETT #3# |shortlist| . #7#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #7#) NIL))
                   (GO G191)))
                 (SEQ (LETT |i| (+ |i| 1) . #7#)
                      (EXIT
                       (COND
                        ((SPADCALL |x| (|spadConstant| $ 26) (QREFELT $ 35))
                         (SEQ
                          (LETT |newlist|
                                (CONS
                                 (SPADCALL |x|
                                           (SPADCALL
                                            (SPADCALL |zeros|
                                                      (SPADCALL |xx|
                                                                (QREFELT $ 23))
                                                      (SPADCALL |i|
                                                                (QREFELT $ 24))
                                                      (QREFELT $ 25))
                                            (QREFELT $ 9))
                                           (QREFELT $ 148))
                                 |newlist|)
                                . #7#)
                          (EXIT
                           (LETT |xValues| (CONS |i| |xValues|) . #7#)))))))
                 (LETT #3# (CDR #3#) . #7#) (GO G190) G191 (EXIT NIL))
            (LETT |newlist| (REVERSE |newlist|) . #7#)
            (LETT |xValues| (REVERSE |xValues|) . #7#)
            (LETT |res|
                  (PROGN
                   (LETT #2# NIL . #7#)
                   (SEQ (LETT |f| NIL . #7#)
                        (LETT #1#
                              (|GUESSEB;guessBinRatAux| |xx| |newlist| |basis|
                               |ext| |extEXPR| |xValues| |options| $)
                              . #7#)
                        G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |f| (CAR #1#) . #7#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS
                                 (SPADCALL
                                  (SPADCALL |zeros| |f| (QREFELT $ 60))
                                  (SPADCALL |xx| (QREFELT $ 23))
                                  (SPADCALL |xx| (QREFELT $ 23))
                                  (QREFELT $ 25))
                                 #2#)
                                . #7#)))
                        (LETT #1# (CDR #1#) . #7#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  . #7#)
            (EXIT
             (SPADCALL
              (CONS #'|GUESSEB;guessBinRatAux0!0|
                    (VECTOR |options| $ |list| |len| |xx|))
              |res| (QREFELT $ 175)))))
          #8# (EXIT #6#)))) 

(SDEFUN |GUESSEB;guessBinRatAux0!0| ((|z1| NIL) ($$ NIL))
        (PROG (|xx| |len| |list| $ |options|)
          (LETT |xx| (QREFELT $$ 4) . #1=(|GUESSEB;guessBinRatAux0|))
          (LETT |len| (QREFELT $$ 3) . #1#)
          (LETT |list| (QREFELT $$ 2) . #1#)
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |options| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (|GUESSEB;checkResult| |z1| |xx| |len| |list| $)
                      (SPADCALL |len| (SPADCALL |options| (QREFELT $ 166))
                                (QREFELT $ 171))
                      (QREFELT $ 172)))))) 

(SDEFUN |GUESSEB;guessBinRat;LLL;26|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (|GUESSEB;guessBinRatAux0| |list|
         (CONS (|function| |GUESSEB;defaultD|) $)
         (CONS (|function| |GUESSEB;binExt|) $)
         (CONS (|function| |GUESSEB;binExtEXPR|) $) |options| $)) 

(SDEFUN |GUESSEB;qD| ((|q| |Symbol|) ($ |Mapping| EXPRR EXPRR))
        (SPROG NIL (CONS #'|GUESSEB;qD!0| (VECTOR $ |q|)))) 

(SDEFUN |GUESSEB;qD!0| ((|z1| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) . #1=(|GUESSEB;qD|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |q| (QREFELT $ 23)) |z1| (QREFELT $ 164)))))) 

(SDEFUN |GUESSEB;qBinExtAux|
        ((|q| |Symbol|) (|i| |Integer|)
         (|va1| |OrderedVariableList| (|construct| '|a1| 'A))
         (|vA| |OrderedVariableList| (|construct| '|a1| 'A))
         ($ |Fraction|
          (|SparseMultivariatePolynomial| S
                                          (|OrderedVariableList|
                                           (|construct| '|a1| 'A)))))
        (SPROG
         ((|fl|
           (|List|
            (|Fraction|
             (|SparseMultivariatePolynomial| S
                                             (|OrderedVariableList|
                                              (|construct| '|a1| 'A))))))
          (#1=#:G1022 NIL) (|l| NIL) (#2=#:G1021 NIL))
         (SEQ
          (LETT |fl|
                (PROGN
                 (LETT #2# NIL . #3=(|GUESSEB;qBinExtAux|))
                 (SEQ (LETT |l| 1 . #3#) (LETT #1# |i| . #3#) G190
                      (COND ((|greater_SI| |l| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 193)
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |va1| (QREFELT $ 106))
                                             (QREFELT $ 107))
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |vA| (QREFELT $ 106))
                                              (QREFELT $ 107))
                                             (- |i| 1) (QREFELT $ 114))
                                            (QREFELT $ 109))
                                           (SPADCALL
                                            (|GUESSEB;F2FPOLYS|
                                             (SPADCALL |q| (QREFELT $ 194)) $)
                                            |l| (QREFELT $ 114))
                                           (QREFELT $ 109))
                                          (QREFELT $ 134))
                                (SPADCALL (|spadConstant| $ 193)
                                          (SPADCALL
                                           (|GUESSEB;F2FPOLYS|
                                            (SPADCALL |q| (QREFELT $ 194)) $)
                                           |l| (QREFELT $ 114))
                                          (QREFELT $ 134))
                                (QREFELT $ 190))
                               #2#)
                              . #3#)))
                      (LETT |l| (|inc_SI| |l|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT
           (SPADCALL (ELT $ 109) |fl| (|spadConstant| $ 193)
                     (QREFELT $ 196)))))) 

(SDEFUN |GUESSEB;qBinExt|
        ((|q| |Symbol|)
         ($ |Mapping|
          (|Fraction|
           (|SparseMultivariatePolynomial| S
                                           (|OrderedVariableList|
                                            (|construct| '|a1| 'A))))
          (|Integer|) (|OrderedVariableList| (|construct| '|a1| 'A))
          (|OrderedVariableList| (|construct| '|a1| 'A))))
        (SPROG NIL (CONS #'|GUESSEB;qBinExt!0| (VECTOR $ |q|)))) 

(SDEFUN |GUESSEB;qBinExt!0| ((|z1| NIL) (|z2| NIL) (|z3| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) . #1=(|GUESSEB;qBinExt|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|GUESSEB;qBinExtAux| |q| |z1| |z2| |z3| $))))) 

(SDEFUN |GUESSEB;qBinExtEXPRaux|
        ((|q| |Symbol|) (|i| |Symbol|) (|a1v| F) (|Av| F) ($ EXPRR))
        (SPROG ((|l| (|Symbol|)))
               (SEQ (LETT |l| '|l| |GUESSEB;qBinExtEXPRaux|)
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 169)
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |a1v| (QREFELT $ 10))
                                            (SPADCALL
                                             (SPADCALL |Av| (QREFELT $ 10))
                                             (SPADCALL
                                              (SPADCALL |i| (QREFELT $ 23))
                                              (|spadConstant| $ 169)
                                              (QREFELT $ 111))
                                             (QREFELT $ 164))
                                            (QREFELT $ 60))
                                  (SPADCALL (SPADCALL |q| (QREFELT $ 23))
                                            (SPADCALL |l| (QREFELT $ 23))
                                            (QREFELT $ 164))
                                  (QREFELT $ 60))
                                 (QREFELT $ 111))
                       (SPADCALL (|spadConstant| $ 169)
                                 (SPADCALL (SPADCALL |q| (QREFELT $ 23))
                                           (SPADCALL |l| (QREFELT $ 23))
                                           (QREFELT $ 164))
                                 (QREFELT $ 111))
                       (QREFELT $ 34))
                      (SPADCALL |l|
                                (SPADCALL (|spadConstant| $ 169)
                                          (SPADCALL |i| (QREFELT $ 23))
                                          (QREFELT $ 198))
                                (QREFELT $ 200))
                      (QREFELT $ 202)))))) 

(SDEFUN |GUESSEB;qBinExtEXPR|
        ((|q| |Symbol|) ($ |Mapping| EXPRR (|Symbol|) F F))
        (SPROG NIL (CONS #'|GUESSEB;qBinExtEXPR!0| (VECTOR $ |q|)))) 

(SDEFUN |GUESSEB;qBinExtEXPR!0| ((|z1| NIL) (|z2| NIL) (|z3| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) . #1=(|GUESSEB;qBinExtEXPR|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|GUESSEB;qBinExtEXPRaux| |q| |z1| |z2| |z3| $))))) 

(SDEFUN |GUESSEB;guessBinRat;SM;32|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPROG NIL (CONS #'|GUESSEB;guessBinRat;SM;32!0| (VECTOR $ |q|)))) 

(SDEFUN |GUESSEB;guessBinRat;SM;32!0| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) . #1=(|GUESSEB;guessBinRat;SM;32|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESSEB;guessBinRatAux0| |z1| (|GUESSEB;qD| |q| $)
             (|GUESSEB;qBinExt| |q| $) (|GUESSEB;qBinExtEXPR| |q| $) |z2| $))))) 

(DECLAIM (NOTINLINE |GuessExpBin;|)) 

(DEFUN |GuessExpBin| (&REST #1=#:G1038)
  (SPROG NIL
         (PROG (#2=#:G1039)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|GuessExpBin|)
                                               '|domainEqualList|)
                    . #3=(|GuessExpBin|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |GuessExpBin;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|GuessExpBin|)))))))))) 

(DEFUN |GuessExpBin;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|GuessExpBin|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT DV$5 (|devaluate| |#5|) . #1#)
    (LETT |dv$| (LIST '|GuessExpBin| DV$1 DV$2 DV$3 DV$4 DV$5) . #1#)
    (LETT $ (GETREFV 204) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2|
                                                        '(|RetractableTo|
                                                          (|Symbol|))))))
                    . #1#))
    (|haddProp| |$ConstructorCache| '|GuessExpBin|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Symbol|)))
      (COND
       ((|HasCategory| |#2| '(|RetractableTo| (|Symbol|)))
        (QSETREFV $ 178
                  (CONS (|dispatchFunction| |GUESSEB;guessExpRat;SM;21|)
                        $))))))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Symbol|)))
      (COND
       ((|HasCategory| |#2| '(|RetractableTo| (|Symbol|)))
        (PROGN
         (QSETREFV $ 203
                   (CONS (|dispatchFunction| |GUESSEB;guessBinRat;SM;32|)
                         $)))))))
    $))) 

(MAKEPROP '|GuessExpBin| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (0 . |One|)
              (4 . |One|) (|Integer|) (|List| 13) (8 . |elt|) (14 . +)
              (|Mapping| 13 13 13) (20 . |reduce|) (|PositiveInteger|) (27 . *)
              (33 . |denominator|) (|Symbol|) (38 . |coerce|) (43 . |coerce|)
              (48 . |eval|) (55 . |Zero|) (59 . |Zero|) (63 . |Zero|)
              (|Boolean|) (67 . =) (73 . |numerator|) (|List| 6) (78 . |elt|)
              (84 . /) (90 . ~=) (|Fraction| 7) (96 . |coerce|)
              (|SparseUnivariatePolynomial| 6) (|Mapping| 6 7)
              (|SparseUnivariatePolynomial| 7)
              (|SparseUnivariatePolynomialFunctions2| 7 6) (101 . |map|)
              (|String|) (107 . |elt|) (|SparseMultivariatePolynomial| 6 72)
              (113 . |coerce|) (|Fraction| 45) (118 . |coerce|) (123 . |numer|)
              (|SparseMultivariatePolynomial| 7 72) (128 . |coerce|)
              (133 . |denom|) (|Fraction| 50) (138 . /) (144 . |zero?|)
              (149 . |leadingCoefficient|) (|NonNegativeInteger|)
              (154 . |degree|) (159 . ^) (165 . *) (171 . |reductum|) (176 . +)
              (|Fraction| 38) (182 . |numer|) (187 . |denom|)
              (|MPolyCatFunctions2| 72 (|IndexedExponents| 72)
                                    (|IndexedExponents| 72) 7 6 50 45)
              (192 . |map|) (|SparseUnivariatePolynomial| 50) (198 . |zero?|)
              (203 . |Zero|) (207 . |leadingCoefficient|)
              (|OrderedVariableList| (NRTEVAL (LIST '|a1| 'A))) (212 . |index|)
              (|List| 72) (217 . |eval|) (224 . |retract|) (229 . |degree|)
              (234 . |monomial|) (240 . |reductum|) (245 . +)
              (|Record| (|:| |num| 82) (|:| |den| 50))
              (|SparseUnivariatePolynomial| 53)
              (|UnivariatePolynomialCommonDenominator| 50 53 82)
              (251 . |splitDenominator|) (256 . *) (262 . |retract|)
              (|Mapping| 50 53) (|SparseUnivariatePolynomialFunctions2| 53 50)
              (267 . |map|) (273 . |coerce|) (|Fraction| 68) (278 . /)
              (284 . |degree|) (290 . |coerce|) (295 . |eval|)
              (302 . |univariate|) (307 . |degree|)
              (312 . |leadingCoefficient|) (317 . ^) (323 . -) (328 . *)
              (334 . |zero?|) (339 . |resultant|) (|Union| $ '"failed")
              (345 . |exquo|) (351 . |coerce|) (356 . |coerce|) (361 . -)
              (367 . *) (373 . +) (379 . -) (385 . |last|) (390 . -) (395 . ^)
              (|Union| 57 '"arbitrary") (|List| (|GuessOption|))
              (|GuessOptionFunctions0|) (401 . |maxDegree|) (406 . |debug|)
              (|OutputForm|) (411 . |coerce|) (416 . |hconcat|) (|Void|)
              (|OutputPackage|) (422 . |output|) (|MoreSystemCommands|)
              (427 . |systemCommand|) (|Fraction| 82) (|List| 53)
              (|FractionFreeFastGaussian| 53 82) (432 . |interpolate|)
              (|Fraction| $) (439 . |elt|) (445 . -) (451 . |numer|) (|List| 7)
              (|NewtonInterpolation| 7) (456 . |newton|) (461 . |gcd|)
              (467 . |primitivePart|) (|Factored| 38)
              (|GeneralizedMultivariateFactorize| (|SingletonAsOrderedSet|) 57
                                                  6 6 38)
              (472 . |factor|) (|Record| (|:| |factor| 38) (|:| |exponent| 13))
              (|List| 144) (477 . |factors|) (482 . |coefficient|) (488 . /)
              (494 . -) (499 . |eval|) (506 . |zero?|) (511 . |univariate|)
              (516 . |numer|) (521 . |denom|) (526 . /) (532 . |numer|)
              (537 . |denom|) (542 . |output|) (547 . /) (|Kernel| 8)
              (553 . |kernel|) (|Kernel| $) (558 . |eval|) (565 . ^)
              (571 . |one|) (576 . |safety|) (581 . |indexName|)
              (586 . |first|) (592 . |One|) (596 . =) (602 . -) (608 . <)
              (|Mapping| 29 8) (|List| 8) (614 . |select|)
              |GUESSEB;guessExpRat;LLL;20| (|Mapping| 174 32 116)
              (620 . |guessExpRat|) (625 . *) (631 . +) (637 . |coerce|)
              (642 . -) (648 . *) (654 . |One|) (|Mapping| 50 50 50)
              (|List| 50) (658 . |reduce|) (665 . |factorial|)
              (670 . |binomial|) (676 . /) (682 . |resultant|)
              |GUESSEB;guessBinRat;LLL;26| (689 . |One|) (693 . |coerce|)
              (|Mapping| 53 53 53) (698 . |reduce|) (|Segment| 8)
              (705 . SEGMENT) (|SegmentBinding| 8) (711 . |equation|)
              (|SegmentBinding| $) (717 . |product|) (723 . |guessBinRat|))
           '#(|guessExpRat| 728 |guessBinRat| 739) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 203
                                                 '(0 6 0 11 0 7 0 12 2 14 13 0
                                                   13 15 2 13 0 0 0 16 3 14 13
                                                   17 0 13 18 2 13 0 19 0 20 1
                                                   8 0 0 21 1 8 0 22 23 1 8 0
                                                   13 24 3 8 0 0 0 0 25 0 6 0
                                                   26 0 7 0 27 0 8 0 28 2 8 29
                                                   0 0 30 1 8 0 0 31 2 32 6 0
                                                   13 33 2 8 0 0 0 34 2 6 29 0
                                                   0 35 1 36 0 7 37 2 41 38 39
                                                   40 42 2 43 0 0 0 44 1 45 0 6
                                                   46 1 47 0 45 48 1 36 7 0 49
                                                   1 50 0 7 51 1 36 7 0 52 2 53
                                                   0 50 50 54 1 38 29 0 55 1 38
                                                   6 0 56 1 38 57 0 58 2 8 0 0
                                                   57 59 2 8 0 0 0 60 1 38 0 0
                                                   61 2 8 0 0 0 62 1 63 38 0 64
                                                   1 63 38 0 65 2 66 45 39 50
                                                   67 1 68 29 0 69 0 38 0 70 1
                                                   68 50 0 71 1 72 0 19 73 3 45
                                                   0 0 74 32 75 1 45 6 0 76 1
                                                   68 57 0 77 2 38 0 6 57 78 1
                                                   68 0 0 79 2 38 0 0 0 80 1 83
                                                   81 82 84 2 53 0 0 50 85 1 53
                                                   50 0 86 2 88 68 87 82 89 1
                                                   68 0 50 90 2 91 0 68 68 92 2
                                                   50 57 0 72 93 1 7 0 13 94 3
                                                   50 0 0 72 7 95 1 50 40 0 96
                                                   1 40 57 0 97 1 40 7 0 98 2 7
                                                   0 0 57 99 1 7 0 0 100 2 7 0
                                                   0 0 101 1 7 29 0 102 2 40 7
                                                   0 0 103 2 7 104 0 0 105 1 50
                                                   0 72 106 1 53 0 50 107 2 6 0
                                                   0 0 108 2 53 0 0 0 109 2 53
                                                   0 0 0 110 2 8 0 0 0 111 1 14
                                                   13 0 112 1 13 0 0 113 2 53 0
                                                   0 13 114 1 117 115 116 118 1
                                                   117 29 116 119 1 57 120 0
                                                   121 2 120 0 0 0 122 1 124
                                                   123 120 125 1 126 123 43 127
                                                   3 130 128 129 129 57 131 2
                                                   82 53 132 53 133 2 53 0 0 0
                                                   134 1 53 50 0 135 1 137 40
                                                   136 138 2 40 0 0 0 139 1 40
                                                   0 0 140 1 142 141 38 143 1
                                                   141 145 0 146 2 38 6 0 57
                                                   147 2 6 0 0 0 148 1 6 0 0
                                                   149 3 45 0 0 72 6 150 1 45
                                                   29 0 151 1 45 38 0 152 1 128
                                                   82 0 153 1 128 82 0 154 2 91
                                                   0 0 0 155 1 91 68 0 156 1 91
                                                   68 0 157 1 124 123 43 158 2
                                                   63 0 38 38 159 1 160 0 22
                                                   161 3 8 0 0 162 0 163 2 8 0
                                                   0 0 164 1 117 29 116 165 1
                                                   117 57 116 166 1 117 22 116
                                                   167 2 32 0 0 57 168 0 8 0
                                                   169 2 6 29 0 0 170 2 13 0 0
                                                   0 171 2 13 29 0 0 172 2 174
                                                   0 173 0 175 1 0 177 22 178 2
                                                   50 0 13 0 179 2 50 0 0 0 180
                                                   1 50 0 13 181 2 50 0 0 0 182
                                                   2 50 0 0 0 183 0 50 0 184 3
                                                   186 50 185 0 50 187 1 13 0 0
                                                   188 2 8 0 0 0 189 2 53 0 0 0
                                                   190 3 50 0 0 0 72 191 0 53 0
                                                   193 1 6 0 22 194 3 129 53
                                                   195 0 53 196 2 197 0 8 8 198
                                                   2 199 0 22 197 200 2 8 0 0
                                                   201 202 1 0 177 22 203 1 1
                                                   177 22 178 2 0 174 32 116
                                                   176 1 1 177 22 203 2 0 174
                                                   32 116 192)))))
           '|lookupComplete|)) 
