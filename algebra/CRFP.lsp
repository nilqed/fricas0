
(SDEFUN |CRFP;complexZeros;UPRL;1|
        ((|p| UP) (|eps| R) ($ |List| (|Complex| R)))
        (SPROG
         ((#1=#:G737 NIL) (|linfac| NIL) (#2=#:G736 NIL)
          (|facs| (|Factored| UP)) (|eps0| (R)))
         (SEQ
          (LETT |eps0|
                (SPADCALL |eps|
                          (SPADCALL (QREFELT $ 27)
                                    (SPADCALL |p| (QREFELT $ 31))
                                    (QREFELT $ 32))
                          (QREFELT $ 14))
                . #3=(|CRFP;complexZeros;UPRL;1|))
          (LETT |facs| (SPADCALL |p| |eps0| (QREFELT $ 34)) . #3#)
          (EXIT
           (PROGN
            (LETT #2# NIL . #3#)
            (SEQ (LETT |linfac| NIL . #3#)
                 (LETT #1# (SPADCALL |facs| (QREFELT $ 37)) . #3#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |linfac| (CAR #1#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2#
                         (CONS
                          (SPADCALL (SPADCALL (QCAR |linfac|) 0 (QREFELT $ 39))
                                    (QREFELT $ 40))
                          #2#)
                         . #3#)))
                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |CRFP;complexZeros;UPL;2| ((|p| UP) ($ |List| (|Complex| R)))
        (SPADCALL |p| (QREFELT $ 15) (QREFELT $ 42))) 

(SDEFUN |CRFP;setErrorBound;2R;3| ((|r| R) ($ R))
        (SPROG ((|lof| (|List| (|OutputForm|))) (|rd| (|Integer|)))
               (SEQ
                (COND
                 ((SPADCALL |r| (|spadConstant| $ 44) (QREFELT $ 47))
                  (|error| "setErrorBound: need error bound greater 0"))
                 ('T
                  (SEQ (SETELT $ 15 |r|)
                       (COND
                        ((|HasCategory| (QREFELT $ 6)
                                        (LIST '|QuotientFieldCategory|
                                              '(|Integer|)))
                         (SEQ
                          (LETT |rd|
                                (SPADCALL
                                 (SPADCALL (|spadConstant| $ 12) |r|
                                           (QREFELT $ 14))
                                 (QREFELT $ 48))
                                . #1=(|CRFP;setErrorBound;2R;3|))
                          (SETELT $ 9 (* (* |rd| |rd|) 10))
                          (LETT |lof|
                                (LIST
                                 (SPADCALL
                                  "setErrorBound: internal digits set to"
                                  (QREFELT $ 18))
                                 (SPADCALL (QREFELT $ 9) (QREFELT $ 49)))
                                . #1#)
                          (EXIT
                           (SPADCALL (SPADCALL |lof| (QREFELT $ 51))
                                     (QREFELT $ 53))))))
                       (SPADCALL "setErrorBound: internal error bound set to"
                                 (QREFELT $ 54))
                       (EXIT (QREFELT $ 15)))))))) 

(SDEFUN |CRFP;pleskenSplit;UPRBF;4|
        ((|poly| UP) (|eps| R) (|info| |Boolean|) ($ |Factored| UP))
        (SPROG
         ((|fp| (|Factored| UP)) (#1=#:G768 NIL) (|fac| NIL)
          (|notFoundSplit| (|Boolean|))
          (|split| (|Record| (|:| |factors| (|List| UP)) (|:| |error| R)))
          (|splits|
           (|List| (|Record| (|:| |factors| (|List| UP)) (|:| |error| R))))
          (|tp| (UP)) (|psR| (|Rep|)) (|sR| (|Rep|)) (|nm| (R)) (|st| (UP))
          (|p| (UP)) (|qr| (|Record| (|:| |quotient| UP) (|:| |remainder| UP)))
          (|sP| (|Record| (|:| |start| UP) (|:| |factors| (|Factored| UP))))
          (|md| (|NonNegativeInteger|)))
         (SEQ
          (LETT |p| (|CRFP;makeMonic| |poly| $)
                . #2=(|CRFP;pleskenSplit;UPRBF;4|))
          (COND
           ((NULL (ZEROP (LETT |md| (SPADCALL |p| (QREFELT $ 56)) . #2#)))
            (SEQ
             (LETT |fp|
                   (SPADCALL (SPADCALL (|spadConstant| $ 57) 1 (QREFELT $ 58))
                             |md| (QREFELT $ 59))
                   . #2#)
             (EXIT
              (LETT |p|
                    (SPADCALL |p|
                              (SPADCALL (|spadConstant| $ 57) |md|
                                        (QREFELT $ 58))
                              (QREFELT $ 60))
                    . #2#)))))
          (LETT |sP| (SPADCALL |p| (QREFELT $ 62)) . #2#)
          (LETT |fp| (QCDR |sP|) . #2#)
          (COND
           ((NULL (SPADCALL |fp| (|spadConstant| $ 63) (QREFELT $ 64)))
            (SEQ
             (LETT |qr|
                   (SPADCALL |p|
                             (|CRFP;makeMonic| (SPADCALL |fp| (QREFELT $ 65))
                              $)
                             (QREFELT $ 67))
                   . #2#)
             (EXIT (LETT |p| (QCAR |qr|) . #2#)))))
          (LETT |st| (QCAR |sP|) . #2#)
          (EXIT
           (COND ((ZEROP (SPADCALL |st| (QREFELT $ 31))) |fp|)
                 ('T
                  (SEQ (SPADCALL |p| (QREFELT $ 68)) (LETT |nm| |eps| . #2#)
                       (LETT |sR| (SPADCALL |st| (QREFELT $ 69)) . #2#)
                       (LETT |psR|
                             (SPADCALL |sR| (SPADCALL |poly| (QREFELT $ 31))
                                       (QREFELT $ 70))
                             . #2#)
                       (LETT |notFoundSplit| 'T . #2#)
                       (SEQ G190 (COND ((NULL |notFoundSplit|) (GO G191)))
                            (SEQ
                             (LETT |psR|
                                   (SPADCALL
                                    (SPADCALL |psR| |psR| (QREFELT $ 71)) |sR|
                                    (QREFELT $ 71))
                                   . #2#)
                             (LETT |tp| (SPADCALL |psR| (QREFELT $ 72)) . #2#)
                             (EXIT
                              (COND
                               ((ZEROP (SPADCALL |tp| (QREFELT $ 31)))
                                (SEQ
                                 (COND
                                  (|info|
                                   (SPADCALL
                                    "we leave as we got constant factor"
                                    (QREFELT $ 54))))
                                 (EXIT (SPADCALL |poly| 1 (QREFELT $ 73)))))
                               ('T
                                (SEQ
                                 (LETT |splits|
                                       (SPADCALL |p| (|CRFP;makeMonic| |tp| $)
                                                 |info| (QREFELT $ 76))
                                       . #2#)
                                 (LETT |split|
                                       (SPADCALL
                                        (CONS (|function| |CRFP;min|) $)
                                        |splits| (QREFELT $ 78))
                                       . #2#)
                                 (EXIT
                                  (LETT |notFoundSplit|
                                        (SPADCALL |eps| (QCDR |split|)
                                                  (QREFELT $ 47))
                                        . #2#)))))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (SEQ (LETT |fac| NIL . #2#)
                            (LETT #1# (QCAR |split|) . #2#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |fac| (CAR #1#) . #2#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |fp|
                                    (COND
                                     ((EQL (SPADCALL |fac| (QREFELT $ 31)) 1)
                                      (SPADCALL |fp|
                                                (SPADCALL |fac| 1
                                                          (QREFELT $ 73))
                                                (QREFELT $ 79)))
                                     ('T
                                      (SPADCALL |fp|
                                                (SPADCALL |fac| 1
                                                          (QREFELT $ 59))
                                                (QREFELT $ 79))))
                                    . #2#)))
                            (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |fp|)))))))) 

(SDEFUN |CRFP;startPolynomial;UPR;5|
        ((|p| UP)
         ($ |Record| (|:| |start| UP) (|:| |factors| (|Factored| UP))))
        (SPROG
         ((|po| (|Integer|)) (|maxq| (R)) (#1=#:G797 NIL) (|qq| (R)) (|rd| (R))
          (|r1| (R)) (#2=#:G801 NIL) (|q| NIL) (|j| NIL)
          (|sP| (|Record| (|:| |start| UP) (|:| |factors| (|Factored| UP))))
          (|fp| (|Factored| UP)) (|centerIsRoot| (|Boolean|)) (|pp| (UP))
          (|mD| (|NonNegativeInteger|)) (#3=#:G800 NIL) (|i| NIL)
          (|lp| (|List| UP)) (#4=#:G799 NIL) (|v| NIL) (#5=#:G798 NIL)
          (|listOfCenters| (|List| (|Complex| R))) (|startPoly| (UP))
          (|u| (|Complex| R)) (|eps| (R)))
         (SEQ
          (LETT |fp| (|spadConstant| $ 63) . #6=(|CRFP;startPolynomial;UPR;5|))
          (EXIT
           (COND
            ((EQL (SPADCALL |p| (QREFELT $ 31)) 1)
             (SEQ (LETT |p| (|CRFP;makeMonic| |p| $) . #6#)
                  (EXIT (CONS |p| (SPADCALL |p| 1 (QREFELT $ 59))))))
            (#7='T
             (SEQ
              (LETT |startPoly|
                    (SPADCALL (|spadConstant| $ 57) 1 (QREFELT $ 58)) . #6#)
              (LETT |eps| (QREFELT $ 29) . #6#)
              (LETT |r1| (SPADCALL |p| |eps| (QREFELT $ 81)) . #6#)
              (LETT |rd|
                    (SPADCALL (|spadConstant| $ 12)
                              (SPADCALL (SPADCALL |p| (QREFELT $ 82)) |eps|
                                        (QREFELT $ 81))
                              (QREFELT $ 14))
                    . #6#)
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |r1| |rd| (QREFELT $ 14))
                           (SPADCALL (SPADCALL 3 (QREFELT $ 11))
                                     (SPADCALL 2 (QREFELT $ 11))
                                     (QREFELT $ 14))
                           (QREFELT $ 83))
                 (CONS |startPoly| |fp|))
                (#7#
                 (SEQ (LETT |u| (SPADCALL |p| (QREFELT $ 84)) . #6#)
                      (LETT |startPoly|
                            (SPADCALL |startPoly|
                                      (SPADCALL |u| 0 (QREFELT $ 58))
                                      (QREFELT $ 85))
                            . #6#)
                      (LETT |p|
                            (|CRFP;shift| |p| (SPADCALL |u| (QREFELT $ 40)) $)
                            . #6#)
                      (LETT |r1| (SPADCALL |p| |eps| (QREFELT $ 81)) . #6#)
                      (LETT |startPoly|
                            (SPADCALL |startPoly|
                                      (SPADCALL |r1| (QREFELT $ 86))
                                      (QREFELT $ 87))
                            . #6#)
                      (LETT |listOfCenters|
                            (LIST
                             (SPADCALL |r1| (|spadConstant| $ 44)
                                       (QREFELT $ 88))
                             (SPADCALL (|spadConstant| $ 44) |r1|
                                       (QREFELT $ 88))
                             (SPADCALL (SPADCALL |r1| (QREFELT $ 89))
                                       (|spadConstant| $ 44) (QREFELT $ 88))
                             (SPADCALL (|spadConstant| $ 44)
                                       (SPADCALL |r1| (QREFELT $ 89))
                                       (QREFELT $ 88)))
                            . #6#)
                      (LETT |lp|
                            (PROGN
                             (LETT #5# NIL . #6#)
                             (SEQ (LETT |v| NIL . #6#)
                                  (LETT #4# |listOfCenters| . #6#) G190
                                  (COND
                                   ((OR (ATOM #4#)
                                        (PROGN (LETT |v| (CAR #4#) . #6#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #5#
                                          (CONS (|CRFP;shift| |p| |v| $) #5#)
                                          . #6#)))
                                  (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                                  (EXIT (NREVERSE #5#))))
                            . #6#)
                      (LETT |centerIsRoot| NIL . #6#)
                      (SEQ (LETT |i| 1 . #6#)
                           (LETT #3# (SPADCALL |lp| (QREFELT $ 91)) . #6#) G190
                           (COND ((|greater_SI| |i| #3#) (GO G191)))
                           (SEQ
                            (LETT |mD|
                                  (SPADCALL (SPADCALL |lp| |i| (QREFELT $ 92))
                                            (QREFELT $ 56))
                                  . #6#)
                            (EXIT
                             (COND
                              ((SPADCALL |mD| 0 (QREFELT $ 93))
                               (SEQ
                                (LETT |pp|
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| $ 57) 1
                                                 (QREFELT $ 58))
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |listOfCenters| |i|
                                                   (QREFELT $ 94))
                                         |u| (QREFELT $ 95))
                                        0 (QREFELT $ 58))
                                       (QREFELT $ 85))
                                      . #6#)
                                (LETT |centerIsRoot| 'T . #6#)
                                (EXIT
                                 (LETT |fp|
                                       (SPADCALL |fp|
                                                 (SPADCALL |pp| |mD|
                                                           (QREFELT $ 59))
                                                 (QREFELT $ 79))
                                       . #6#)))))))
                           (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (COND
                        (|centerIsRoot|
                         (SEQ
                          (LETT |p|
                                (SPADCALL (|CRFP;shift| |p| |u| $)
                                          (SPADCALL |fp| (QREFELT $ 65))
                                          (QREFELT $ 60))
                                . #6#)
                          (EXIT
                           (COND
                            ((ZEROP (SPADCALL |p| (QREFELT $ 31)))
                             (CONS |p| |fp|))
                            (#7#
                             (SEQ
                              (LETT |sP| (SPADCALL |p| (QREFELT $ 62)) . #6#)
                              (EXIT (CONS (QCAR |sP|) |fp|))))))))
                        (#7#
                         (SEQ (LETT |po| 1 . #6#)
                              (LETT |maxq| (|spadConstant| $ 12) . #6#)
                              (SEQ
                               (EXIT
                                (SEQ (LETT |j| 1 . #6#) (LETT |q| NIL . #6#)
                                     (LETT #2# |lp| . #6#) G190
                                     (COND
                                      ((OR (ATOM #2#)
                                           (PROGN
                                            (LETT |q| (CAR #2#) . #6#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |r1|
                                            (SPADCALL |q| |eps| (QREFELT $ 81))
                                            . #6#)
                                      (LETT |rd|
                                            (SPADCALL (|spadConstant| $ 12)
                                                      (SPADCALL
                                                       (SPADCALL |q|
                                                                 (QREFELT $
                                                                          82))
                                                       |eps| (QREFELT $ 81))
                                                      (QREFELT $ 14))
                                            . #6#)
                                      (EXIT
                                       (COND
                                        ((SPADCALL
                                          (LETT |qq|
                                                (SPADCALL |r1| |rd|
                                                          (QREFELT $ 14))
                                                . #6#)
                                          (SPADCALL (SPADCALL 3 (QREFELT $ 11))
                                                    (SPADCALL 2 (QREFELT $ 11))
                                                    (QREFELT $ 14))
                                          (QREFELT $ 83))
                                         (SEQ (LETT |po| |j| . #6#)
                                              (EXIT
                                               (PROGN
                                                (LETT #1# |$NoValue| . #6#)
                                                (GO #8=#:G791)))))
                                        ('T
                                         (SEQ
                                          (COND
                                           ((EQL |j| 1)
                                            (LETT |maxq| |qq| . #6#)))
                                          (EXIT
                                           (COND
                                            ((SPADCALL |qq| |maxq|
                                                       (QREFELT $ 83))
                                             (SEQ (LETT |maxq| |qq| . #6#)
                                                  (EXIT
                                                   (LETT |po| |j|
                                                         . #6#)))))))))))
                                     (LETT #2#
                                           (PROG1 (CDR #2#)
                                             (LETT |j| (|inc_SI| |j|) . #6#))
                                           . #6#)
                                     (GO G190) G191 (EXIT NIL)))
                               #8# (EXIT #1#))
                              (EXIT
                               (CONS
                                (SPADCALL |startPoly|
                                          (SPADCALL
                                           (SPADCALL |listOfCenters| |po|
                                                     (QREFELT $ 94))
                                           0 (QREFELT $ 58))
                                          (QREFELT $ 85))
                                |fp|))))))))))))))))) 

(SDEFUN |CRFP;norm;UPR;6| ((|p| UP) ($ R))
        (SPROG ((|nm| (R)) (#1=#:G805 NIL) (|c| NIL))
               (SEQ (LETT |nm| (|spadConstant| $ 44) . #2=(|CRFP;norm;UPR;6|))
                    (SEQ (LETT |c| NIL . #2#)
                         (LETT #1# (SPADCALL |p| (QREFELT $ 96)) . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |c| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |nm|
                                 (SPADCALL |nm| (|CRFP;absC| |c| $)
                                           (QREFELT $ 97))
                                 . #2#)))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT |nm|)))) 

(SDEFUN |CRFP;pleskenSplit;UPRF;7| ((|poly| UP) (|eps| R) ($ |Factored| UP))
        (SPADCALL |poly| |eps| NIL (QREFELT $ 80))) 

(SDEFUN |CRFP;graeffe;2UP;8| ((|p| UP) ($ UP))
        (SPROG
         ((|aBack| #1=(|List| (|Complex| R))) (|gp| (UP)) (#2=#:G810 NIL)
          (|const| (|Integer|)) (|aBackCopy| #1#)
          (|aForthCopy| (|List| (|Complex| R))) (|sum| (|Complex| R))
          (#3=#:G817 NIL) (|aminus| NIL) (#4=#:G818 NIL) (|aplus| NIL)
          (|aForth| (|List| (|Complex| R))) (|ak| (|Complex| R))
          (#5=#:G816 NIL) (|k| NIL) (#6=#:G815 NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n| (SPADCALL |p| (QREFELT $ 31)) . #7=(|CRFP;graeffe;2UP;8|))
          (LETT |aForth| NIL . #7#)
          (SEQ (LETT |k| 0 . #7#) (LETT #6# |n| . #7#) G190
               (COND ((|greater_SI| |k| #6#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |aForth|
                       (CONS (SPADCALL |p| |k| (QREFELT $ 39)) |aForth|)
                       . #7#)))
               (LETT |k| (|inc_SI| |k|) . #7#) (GO G190) G191 (EXIT NIL))
          (LETT |aBack| NIL . #7#) (LETT |gp| (|spadConstant| $ 45) . #7#)
          (SEQ (LETT |k| 0 . #7#) (LETT #5# |n| . #7#) G190
               (COND ((|greater_SI| |k| #5#) (GO G191)))
               (SEQ (LETT |ak| (|SPADfirst| |aForth|) . #7#)
                    (LETT |aForth| (CDR |aForth|) . #7#)
                    (LETT |aForthCopy| |aForth| . #7#)
                    (LETT |aBackCopy| |aBack| . #7#)
                    (LETT |sum| (|spadConstant| $ 100) . #7#)
                    (LETT |const| -1 . #7#)
                    (SEQ (LETT |aplus| NIL . #7#) (LETT #4# |aForth| . #7#)
                         (LETT |aminus| NIL . #7#) (LETT #3# |aBack| . #7#)
                         G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |aminus| (CAR #3#) . #7#) NIL)
                               (ATOM #4#)
                               (PROGN (LETT |aplus| (CAR #4#) . #7#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |sum|
                                (SPADCALL |sum|
                                          (SPADCALL
                                           (SPADCALL |const| |aminus|
                                                     (QREFELT $ 101))
                                           |aplus| (QREFELT $ 102))
                                          (QREFELT $ 103))
                                . #7#)
                          (LETT |aForthCopy| (CDR |aForthCopy|) . #7#)
                          (LETT |aBackCopy| (CDR |aBackCopy|) . #7#)
                          (EXIT (LETT |const| (- |const|) . #7#)))
                         (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#) . #7#))
                               . #7#)
                         (GO G190) G191 (EXIT NIL))
                    (LETT |gp|
                          (SPADCALL |gp|
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |ak| |ak| (QREFELT $ 102))
                                      (SPADCALL 2 |sum| (QREFELT $ 104))
                                      (QREFELT $ 103))
                                     (PROG1 (LETT #2# (- |n| |k|) . #7#)
                                       (|check_subtype2| (>= #2# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #2#))
                                     (QREFELT $ 58))
                                    (QREFELT $ 105))
                          . #7#)
                    (EXIT (LETT |aBack| (CONS |ak| |aBack|) . #7#)))
               (LETT |k| (|inc_SI| |k|) . #7#) (GO G190) G191 (EXIT NIL))
          (EXIT |gp|)))) 

(SDEFUN |CRFP;rootRadius;UP2R;9| ((|p| UP) (|errorQuotient| R) ($ R))
        (SPROG
         ((|pp| (UP)) (|rR| (R)) (|expo| (|NonNegativeInteger|)) (|rho| (R))
          (|currentError| (R)) (|d| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((SPADCALL |errorQuotient| (|spadConstant| $ 12) (QREFELT $ 47))
            (|error| "rootRadius: second Parameter must be greater than 1"))
           ('T
            (SEQ (LETT |pp| |p| . #1=(|CRFP;rootRadius;UP2R;9|))
                 (LETT |rho|
                       (|CRFP;calculateScale| (|CRFP;makeMonic| |pp| $) $)
                       . #1#)
                 (LETT |rR| |rho| . #1#)
                 (LETT |pp|
                       (|CRFP;makeMonic|
                        (|CRFP;scale| |pp|
                         (SPADCALL |rho| (|spadConstant| $ 44) (QREFELT $ 88))
                         $)
                        $)
                       . #1#)
                 (LETT |expo| 1 . #1#)
                 (LETT |d| (SPADCALL |p| (QREFELT $ 31)) . #1#)
                 (LETT |currentError|
                       (|CRFP;nthRoot| (SPADCALL 2 (QREFELT $ 11)) 2 $) . #1#)
                 (LETT |currentError|
                       (SPADCALL (* |d| 20) |currentError| (QREFELT $ 107))
                       . #1#)
                 (SEQ G190
                      (COND
                       ((NULL
                         (SPADCALL |currentError| |errorQuotient|
                                   (QREFELT $ 108)))
                        (GO G191)))
                      (SEQ (LETT |pp| (SPADCALL |pp| (QREFELT $ 106)) . #1#)
                           (LETT |rho| (|CRFP;calculateScale| |pp| $) . #1#)
                           (LETT |expo| (SPADCALL 2 |expo| (QREFELT $ 109))
                                 . #1#)
                           (LETT |errorQuotient|
                                 (SPADCALL |errorQuotient| |errorQuotient|
                                           (QREFELT $ 110))
                                 . #1#)
                           (LETT |rR|
                                 (SPADCALL (|CRFP;nthRoot| |rho| |expo| $) |rR|
                                           (QREFELT $ 110))
                                 . #1#)
                           (EXIT
                            (LETT |pp|
                                  (|CRFP;makeMonic|
                                   (|CRFP;scale| |pp|
                                    (SPADCALL |rho| (|spadConstant| $ 44)
                                              (QREFELT $ 88))
                                    $)
                                   $)
                                  . #1#)))
                      NIL (GO G190) G191 (EXIT NIL))
                 (EXIT |rR|))))))) 

(SDEFUN |CRFP;rootRadius;UPR;10| ((|p| UP) ($ R))
        (SPADCALL |p|
                  (SPADCALL (|spadConstant| $ 12) (QREFELT $ 15)
                            (QREFELT $ 97))
                  (QREFELT $ 81))) 

(SDEFUN |CRFP;schwerpunkt;UPC;11| ((|p| UP) ($ |Complex| R))
        (SPROG
         ((|denom| (|Union| (|Complex| R) "failed")) (|nC| #1=(|Complex| R))
          (|lC| #1#) (|d| (|NonNegativeInteger|)))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT $ 112)) (|spadConstant| $ 100))
                ((ZEROP
                  (LETT |d| (SPADCALL |p| (QREFELT $ 31))
                        . #2=(|CRFP;schwerpunkt;UPC;11|)))
                 (|error|
                  "schwerpunkt: non-zero const. polynomial has no roots and no schwerpunkt"))
                (#3='T
                 (SEQ (LETT |lC| (SPADCALL |p| |d| (QREFELT $ 39)) . #2#)
                      (LETT |nC| (SPADCALL |p| (- |d| 1) (QREFELT $ 39)) . #2#)
                      (LETT |denom|
                            (SPADCALL
                             (SPADCALL (SPADCALL |d| (QREFELT $ 113)) |lC|
                                       (QREFELT $ 102))
                             (QREFELT $ 115))
                            . #2#)
                      (EXIT
                       (COND
                        ((QEQCAR |denom| 1)
                         (|error|
                          "schwerpunkt:          degree * leadingCoefficient not invertible in ring of coefficients"))
                        (#3#
                         (SPADCALL
                          (SPADCALL |nC| (QCDR |denom|) (QREFELT $ 102))
                          (QREFELT $ 40))))))))))) 

(SDEFUN |CRFP;reciprocalPolynomial;2UP;12| ((|p| UP) ($ UP))
        (SPROG
         ((|sol| (UP)) (|lm| (|List| UP)) (#1=#:G832 NIL) (#2=#:G840 NIL)
          (|i| NIL) (#3=#:G839 NIL) (|md| (|NonNegativeInteger|))
          (|d| (|NonNegativeInteger|)))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT $ 112)) (|spadConstant| $ 45))
                ('T
                 (SEQ
                  (LETT |d| (SPADCALL |p| (QREFELT $ 31))
                        . #4=(|CRFP;reciprocalPolynomial;2UP;12|))
                  (LETT |md| (+ |d| (SPADCALL |p| (QREFELT $ 56))) . #4#)
                  (LETT |lm|
                        (PROGN
                         (LETT #3# NIL . #4#)
                         (SEQ (LETT |i| 0 . #4#) (LETT #2# |d| . #4#) G190
                              (COND ((|greater_SI| |i| #2#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #3#
                                      (CONS
                                       (SPADCALL
                                        (SPADCALL |p| |i| (QREFELT $ 39))
                                        (PROG1 (LETT #1# (- |md| |i|) . #4#)
                                          (|check_subtype2| (>= #1# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #1#))
                                        (QREFELT $ 58))
                                       #3#)
                                      . #4#)))
                              (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                              (EXIT (NREVERSE #3#))))
                        . #4#)
                  (EXIT
                   (LETT |sol| (SPADCALL (ELT $ 105) |lm| (QREFELT $ 117))
                         . #4#)))))))) 

(SDEFUN |CRFP;divisorCascade;2UPBL;13|
        ((|p| UP) (|tp| UP) (|info| |Boolean|)
         ($ |List| (|Record| (|:| |factors| (|List| UP)) (|:| |error| R))))
        (SPROG
         ((|lof| (|List| (|OutputForm|)))
          (|lfae|
           (|List| (|Record| (|:| |factors| (|List| UP)) (|:| |error| R))))
          (|listOfFactors| (|List| UP)) (|nm| (R)) (|factor2| (UP))
          (|factor1| (UP))
          (|qr| (|Record| (|:| |quotient| UP) (|:| |remainder| UP)))
          (#1=#:G849 NIL) (|i| NIL))
         (SEQ (LETT |lfae| NIL . #2=(|CRFP;divisorCascade;2UPBL;13|))
              (SEQ (LETT |i| 1 . #2#)
                   (LETT #1# (SPADCALL |tp| (QREFELT $ 31)) . #2#) G190
                   (COND
                    ((OR (|greater_SI| |i| #1#)
                         (NULL
                          (SPADCALL (SPADCALL |tp| (QREFELT $ 31)) 0
                                    (QREFELT $ 93))))
                     (GO G191)))
                   (SEQ (LETT |qr| (SPADCALL |p| |tp| (QREFELT $ 67)) . #2#)
                        (LETT |factor1| |tp| . #2#)
                        (LETT |factor2| (|CRFP;makeMonic| (QCAR |qr|) $) . #2#)
                        (LETT |tp| (QCDR |qr|) . #2#)
                        (LETT |nm| (SPADCALL |tp| (QREFELT $ 98)) . #2#)
                        (LETT |listOfFactors| (CONS |factor2| NIL) . #2#)
                        (LETT |listOfFactors| (CONS |factor1| |listOfFactors|)
                              . #2#)
                        (LETT |lfae| (CONS (CONS |listOfFactors| |nm|) |lfae|)
                              . #2#)
                        (EXIT
                         (COND
                          (|info|
                           (SEQ (SPADCALL (QREFELT $ 19) (QREFELT $ 53))
                                (LETT |lof|
                                      (LIST
                                       (SPADCALL "error polynomial has degree "
                                                 (QREFELT $ 18))
                                       (SPADCALL (SPADCALL |tp| (QREFELT $ 31))
                                                 (QREFELT $ 118))
                                       (SPADCALL " and norm " (QREFELT $ 18))
                                       (SPADCALL |nm| (QREFELT $ 119)))
                                      . #2#)
                                (SPADCALL
                                 (SPADCALL (SPADCALL |lof| (QREFELT $ 51))
                                           (QREFELT $ 20))
                                 (QREFELT $ 53))
                                (LETT |lof|
                                      (LIST
                                       (SPADCALL "degrees of factors:"
                                                 (QREFELT $ 18))
                                       (SPADCALL
                                        (SPADCALL |factor1| (QREFELT $ 31))
                                        (QREFELT $ 118))
                                       (SPADCALL "  " (QREFELT $ 18))
                                       (SPADCALL
                                        (SPADCALL |factor2| (QREFELT $ 31))
                                        (QREFELT $ 118)))
                                      . #2#)
                                (EXIT
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |lof| (QREFELT $ 51))
                                            (QREFELT $ 20))
                                  (QREFELT $ 53))))))))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (COND (|info| (SPADCALL (QREFELT $ 19) (QREFELT $ 53))))
              (EXIT (REVERSE |lfae|))))) 

(SDEFUN |CRFP;divisorCascade;2UPL;14|
        ((|p| UP) (|tp| UP)
         ($ |List| (|Record| (|:| |factors| (|List| UP)) (|:| |error| R))))
        (SPADCALL |p| |tp| NIL (QREFELT $ 76))) 

(SDEFUN |CRFP;factor;UPRF;15| ((|poly| UP) (|eps| R) ($ |Factored| UP))
        (SPADCALL |poly| |eps| NIL (QREFELT $ 121))) 

(SDEFUN |CRFP;factor;UPF;16| ((|p| UP) ($ |Factored| UP))
        (SPADCALL |p| (QREFELT $ 15) (QREFELT $ 34))) 

(SDEFUN |CRFP;factor;UPRBF;17|
        ((|poly| UP) (|eps| R) (|info| |Boolean|) ($ |Factored| UP))
        (SPROG
         ((|listOfFactors|
           (|List| (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|)))))
          (|result| (|Factored| UP)) (|expOfFactor| (|Integer|))
          (|newFactor| (UP)) (#1=#:G866 NIL) (|rec| NIL)
          (|lof| (|List| (|OutputForm|))) (|split| (|Factored| UP))
          (|exponentOfp| (|Integer|)) (|p| (UP)) (|eps0| (R))
          (|d| (|NonNegativeInteger|)))
         (SEQ
          (LETT |result|
                (SPADCALL
                 (SPADCALL (SPADCALL |poly| (QREFELT $ 123)) 0 (QREFELT $ 58))
                 (QREFELT $ 124))
                . #2=(|CRFP;factor;UPRBF;17|))
          (LETT |d| (SPADCALL |poly| (QREFELT $ 31)) . #2#)
          (LETT |eps0|
                (SPADCALL |eps|
                          (SPADCALL (QREFELT $ 27) (QREFELT $ 27)
                                    (QREFELT $ 110))
                          (QREFELT $ 14))
                . #2#)
          (EXIT
           (COND ((EQL |d| 1) (SPADCALL |poly| 1 (QREFELT $ 59)))
                 ('T
                  (SEQ
                   (LETT |listOfFactors|
                         (SPADCALL (CONS (|CRFP;makeMonic| |poly| $) 1)
                                   (QREFELT $ 125))
                         . #2#)
                   (COND
                    (|info|
                     (SEQ
                      (LETT |lof|
                            (LIST (QREFELT $ 21) (QREFELT $ 22)
                                  (SPADCALL "list of Factors:" (QREFELT $ 18))
                                  (QREFELT $ 22)
                                  (SPADCALL |listOfFactors| (QREFELT $ 126))
                                  (QREFELT $ 21)
                                  (SPADCALL "list of Linear Factors:"
                                            (QREFELT $ 18))
                                  (QREFELT $ 22)
                                  (SPADCALL |result| (QREFELT $ 127))
                                  (QREFELT $ 22) (QREFELT $ 21))
                            . #2#)
                      (EXIT
                       (SPADCALL (SPADCALL |lof| (QREFELT $ 128))
                                 (QREFELT $ 53))))))
                   (SEQ G190
                        (COND ((NULL (NULL (NULL |listOfFactors|))) (GO G191)))
                        (SEQ
                         (LETT |p| (QCAR (|SPADfirst| |listOfFactors|)) . #2#)
                         (LETT |exponentOfp|
                               (QCDR (|SPADfirst| |listOfFactors|)) . #2#)
                         (LETT |listOfFactors| (CDR |listOfFactors|) . #2#)
                         (COND
                          (|info|
                           (SEQ
                            (LETT |lof|
                                  (LIST
                                   (SPADCALL
                                    "just now we try to split the polynomial:"
                                    (QREFELT $ 18))
                                   (SPADCALL |p| (QREFELT $ 129)))
                                  . #2#)
                            (EXIT
                             (SPADCALL (SPADCALL |lof| (QREFELT $ 128))
                                       (QREFELT $ 53))))))
                         (LETT |split|
                               (SPADCALL |p| |eps0| |info| (QREFELT $ 80))
                               . #2#)
                         (EXIT
                          (COND
                           ((EQL (SPADCALL |split| (QREFELT $ 130)) 1)
                            (SEQ
                             (LETT |lof|
                                   (LIST
                                    (SPADCALL "factor: couldn't split factor"
                                              (QREFELT $ 18))
                                    (SPADCALL (SPADCALL |p| (QREFELT $ 129))
                                              (QREFELT $ 20))
                                    (SPADCALL "with required error bound"
                                              (QREFELT $ 18)))
                                   . #2#)
                             (SPADCALL (SPADCALL |lof| (QREFELT $ 128))
                                       (QREFELT $ 53))
                             (EXIT
                              (LETT |result|
                                    (SPADCALL |result|
                                              (SPADCALL |p| |exponentOfp|
                                                        (QREFELT $ 73))
                                              (QREFELT $ 79))
                                    . #2#))))
                           ('T
                            (SEQ (LETT |rec| NIL . #2#)
                                 (LETT #1# (SPADCALL |split| (QREFELT $ 37))
                                       . #2#)
                                 G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN
                                        (LETT |rec| (CAR #1#) . #2#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ (LETT |newFactor| (QCAR |rec|) . #2#)
                                      (LETT |expOfFactor|
                                            (* |exponentOfp| (QCDR |rec|))
                                            . #2#)
                                      (EXIT
                                       (COND
                                        ((EQL
                                          (SPADCALL |newFactor| (QREFELT $ 31))
                                          1)
                                         (LETT |result|
                                               (SPADCALL |result|
                                                         (SPADCALL |newFactor|
                                                                   |expOfFactor|
                                                                   (QREFELT $
                                                                            73))
                                                         (QREFELT $ 79))
                                               . #2#))
                                        ('T
                                         (LETT |listOfFactors|
                                               (CONS
                                                (CONS |newFactor|
                                                      |expOfFactor|)
                                                |listOfFactors|)
                                               . #2#)))))
                                 (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                                 (EXIT NIL))))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT |result|)))))))) 

(SDEFUN |CRFP;absC| ((|c| |Complex| R) ($ R))
        (|CRFP;nthRoot| (SPADCALL |c| (QREFELT $ 131)) 2 $)) 

(SDEFUN |CRFP;absR| ((|r| R) ($ R))
        (COND
         ((SPADCALL |r| (|spadConstant| $ 44) (QREFELT $ 132))
          (SPADCALL |r| (QREFELT $ 89)))
         ('T |r|))) 

(SDEFUN |CRFP;min|
        ((|fae1| |Record| (|:| |factors| (|List| UP)) (|:| |error| R))
         (|fae2| |Record| (|:| |factors| (|List| UP)) (|:| |error| R))
         ($ |Record| (|:| |factors| (|List| UP)) (|:| |error| R)))
        (COND ((SPADCALL (QCDR |fae2|) (QCDR |fae1|) (QREFELT $ 132)) |fae2|)
              ('T |fae1|))) 

(SDEFUN |CRFP;calculateScale| ((|p| UP) ($ R))
        (SPROG
         ((|rho| (R)) (|maxi| (R)) (|locmax| (R)) (|ic| (R)) (|rc| (R))
          (|cof| (|Complex| R)) (|j| (|NonNegativeInteger|)) (#1=#:G881 NIL)
          (|mon| NIL) (|d| (|NonNegativeInteger|)))
         (SEQ
          (LETT |d| (SPADCALL |p| (QREFELT $ 31)) . #2=(|CRFP;calculateScale|))
          (LETT |maxi| (|spadConstant| $ 44) . #2#)
          (SEQ (LETT |mon| NIL . #2#)
               (LETT #1# (CDR (SPADCALL |p| (QREFELT $ 133))) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |mon| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |j| (- |d| (SPADCALL |mon| (QREFELT $ 31))) . #2#)
                    (LETT |cof| (SPADCALL |mon| (QREFELT $ 123)) . #2#)
                    (LETT |rc| (|CRFP;absR| (SPADCALL |cof| (QREFELT $ 134)) $)
                          . #2#)
                    (LETT |ic| (|CRFP;absR| (SPADCALL |cof| (QREFELT $ 135)) $)
                          . #2#)
                    (LETT |locmax| (SPADCALL |rc| |ic| (QREFELT $ 136)) . #2#)
                    (EXIT
                     (LETT |maxi|
                           (SPADCALL
                            (|CRFP;nthRoot|
                             (SPADCALL |locmax|
                                       (SPADCALL
                                        (SPADCALL |d| |j| (QREFELT $ 138))
                                        (QREFELT $ 11))
                                       (QREFELT $ 14))
                             |j| $)
                            |maxi| (QREFELT $ 136))
                           . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND
            ((SPADCALL |maxi| (|spadConstant| $ 44) (QREFELT $ 139))
             (|error| "Internal Error: scale cannot be 0"))
            (#3='T
             (SEQ (LETT |rho| (QREFELT $ 23) . #2#)
                  (EXIT
                   (COND
                    ((SPADCALL |rho| |maxi| (QREFELT $ 132))
                     (SEQ
                      (SEQ G190
                           (COND
                            ((NULL (SPADCALL |rho| |maxi| (QREFELT $ 132)))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |rho|
                                   (SPADCALL (QREFELT $ 27) |rho|
                                             (QREFELT $ 110))
                                   . #2#)))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT (SPADCALL |rho| (QREFELT $ 27) (QREFELT $ 14)))))
                    (#3#
                     (SEQ
                      (SEQ G190
                           (COND
                            ((NULL (SPADCALL |maxi| |rho| (QREFELT $ 132)))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |rho|
                                   (SPADCALL |rho| (QREFELT $ 27)
                                             (QREFELT $ 14))
                                   . #2#)))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (COND
                        ((SPADCALL |rho| (|spadConstant| $ 44) (QREFELT $ 139))
                         (QREFELT $ 23))
                        (#3# |rho|)))))))))))))) 

(SDEFUN |CRFP;makeMonic| ((|p| UP) ($ UP))
        (COND ((SPADCALL |p| (|spadConstant| $ 45) (QREFELT $ 140)) |p|)
              ('T
               (SPADCALL
                (SPADCALL (|spadConstant| $ 57) (SPADCALL |p| (QREFELT $ 31))
                          (QREFELT $ 58))
                (SPADCALL (SPADCALL |p| (QREFELT $ 141))
                          (SPADCALL |p| (QREFELT $ 123)) (QREFELT $ 87))
                (QREFELT $ 105))))) 

(SDEFUN |CRFP;scale| ((|p| UP) (|c| |Complex| R) ($ UP))
        (SPROG ((|eq| (|Equation| UP)))
               (SEQ
                (LETT |eq|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 57) 1 (QREFELT $ 58))
                       (SPADCALL |c| 1 (QREFELT $ 58)) (QREFELT $ 143))
                      |CRFP;scale|)
                (EXIT (SPADCALL |p| |eq| (QREFELT $ 145)))))) 

(SDEFUN |CRFP;shift| ((|p| UP) (|c| |Complex| R) ($ UP))
        (SPROG ((|eq| (|Equation| UP)) (|rhs| (UP)))
               (SEQ
                (LETT |rhs|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 57) 1 (QREFELT $ 58))
                       (SPADCALL |c| 0 (QREFELT $ 58)) (QREFELT $ 105))
                      . #1=(|CRFP;shift|))
                (LETT |eq|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 57) 1 (QREFELT $ 58)) |rhs|
                       (QREFELT $ 143))
                      . #1#)
                (EXIT (SPADCALL |p| |eq| (QREFELT $ 145)))))) 

(SDEFUN |CRFP;nthRoot| ((|r| R) (|n| |NonNegativeInteger|) ($ R))
        (SPROG ((|num| #1=(|Integer|)) (|den| #1#))
               (SEQ
                (COND
                 ((|HasCategory| (QREFELT $ 6) '(|RealNumberSystem|))
                  (SPADCALL |r| (SPADCALL 1 |n| (QREFELT $ 147))
                            (QREFELT $ 148)))
                 ((|HasCategory| (QREFELT $ 6)
                                 (LIST '|QuotientFieldCategory| '(|Integer|)))
                  (SEQ
                   (LETT |den|
                         (SPADCALL
                          (* (QREFELT $ 9) (SPADCALL |r| (QREFELT $ 149))) |n|
                          (QREFELT $ 151))
                         . #2=(|CRFP;nthRoot|))
                   (LETT |num|
                         (SPADCALL
                          (* (QREFELT $ 9) (SPADCALL |r| (QREFELT $ 152))) |n|
                          (QREFELT $ 151))
                         . #2#)
                   (EXIT (SPADCALL |num| |den| (QREFELT $ 153)))))
                 ('T (|error| "unimplemented")))))) 

(DECLAIM (NOTINLINE |ComplexRootFindingPackage;|)) 

(DEFUN |ComplexRootFindingPackage| (&REST #1=#:G889)
  (SPROG NIL
         (PROG (#2=#:G890)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ComplexRootFindingPackage|)
                                               '|domainEqualList|)
                    . #3=(|ComplexRootFindingPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ComplexRootFindingPackage;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ComplexRootFindingPackage|)))))))))) 

(DEFUN |ComplexRootFindingPackage;| (|#1| |#2|)
  (SPROG ((|a| NIL) (|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (SEQ
          (PROGN
           (LETT DV$1 (|devaluate| |#1|) . #1=(|ComplexRootFindingPackage|))
           (LETT DV$2 (|devaluate| |#2|) . #1#)
           (LETT |dv$| (LIST '|ComplexRootFindingPackage| DV$1 DV$2) . #1#)
           (LETT $ (GETREFV 154) . #1#)
           (QSETREFV $ 0 |dv$|)
           (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
           (|haddProp| |$ConstructorCache| '|ComplexRootFindingPackage|
                       (LIST DV$1 DV$2) (CONS 1 $))
           (|stuffDomainSlots| $)
           (QSETREFV $ 6 |#1|)
           (QSETREFV $ 7 |#2|)
           (SETF |pv$| (QREFELT $ 3))
           (QSETREFV $ 8 (|ModMonic| (|Complex| |#1|) |#2|))
           (QSETREFV $ 9 (EXPT 10 7))
           (QSETREFV $ 15
                     (SEQ (LETT |a| (SPADCALL 1000 (QREFELT $ 11)) . #1#)
                          (EXIT
                           (SPADCALL (|spadConstant| $ 12) |a|
                                     (QREFELT $ 14)))))
           (QSETREFV $ 19 (SPADCALL "  " (QREFELT $ 18)))
           (QSETREFV $ 21
                     (SPADCALL
                      (SPADCALL
                       "---------------------------------------------------"
                       (QREFELT $ 18))
                      (QREFELT $ 20)))
           (QSETREFV $ 22
                     (SPADCALL
                      (SPADCALL
                       "..................................................."
                       (QREFELT $ 18))
                      (QREFELT $ 20)))
           (QSETREFV $ 23 (|spadConstant| $ 12))
           (QSETREFV $ 26 (SPADCALL 2 (QREFELT $ 23) (QREFELT $ 25)))
           (QSETREFV $ 27 (SPADCALL 10 (QREFELT $ 23) (QREFELT $ 25)))
           (QSETREFV $ 28 (SPADCALL 11 (QREFELT $ 23) (QREFELT $ 25)))
           (QSETREFV $ 29
                     (SPADCALL (QREFELT $ 28) (QREFELT $ 27) (QREFELT $ 14)))
           $)))) 

(MAKEPROP '|ComplexRootFindingPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              '|globalDigits| (|Integer|) (0 . |coerce|) (5 . |One|)
              (9 . |One|) (13 . /) '|globalEps| (|String|) (|OutputForm|)
              (19 . |message|) '|emptyLine| (24 . |center|) '|dashes| '|dots|
              '|one| (|PositiveInteger|) (29 . *) '|two| '|ten| '|eleven|
              '|weakEps| (|NonNegativeInteger|) (35 . |degree|) (40 . ^)
              (|Factored| 7) |CRFP;factor;UPRF;15|
              (|Record| (|:| |factor| 7) (|:| |exponent| 10)) (|List| 35)
              (46 . |factors|) (|Complex| 6) (51 . |coefficient|) (57 . -)
              (|List| 38) |CRFP;complexZeros;UPRL;1| |CRFP;complexZeros;UPL;2|
              (62 . |Zero|) (66 . |Zero|) (|Boolean|) (70 . <=)
              (76 . |ceiling|) (81 . |coerce|) (|List| $) (86 . |hconcat|)
              (|Void|) (91 . |print|) (96 . |messagePrint|)
              |CRFP;setErrorBound;2R;3| (101 . |minimumDegree|) (106 . |One|)
              (110 . |monomial|) (116 . |irreducibleFactor|) (122 . |quo|)
              (|Record| (|:| |start| 7) (|:| |factors| 33))
              |CRFP;startPolynomial;UPR;5| (128 . |One|) (132 . =)
              (138 . |expand|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (143 . |divide|) (149 . |setPoly|) (154 . |coerce|) (159 . ^)
              (165 . *) (171 . |lift|) (176 . |nilFactor|)
              (|Record| (|:| |factors| 90) (|:| |error| 6)) (|List| 74)
              |CRFP;divisorCascade;2UPBL;13| (|Mapping| 74 74 74)
              (182 . |reduce|) (188 . *) |CRFP;pleskenSplit;UPRBF;4|
              |CRFP;rootRadius;UP2R;9| |CRFP;reciprocalPolynomial;2UP;12|
              (194 . >) |CRFP;schwerpunkt;UPC;11| (200 . -) (206 . |coerce|)
              (211 . /) (217 . |complex|) (223 . -) (|List| 7)
              (228 . |maxIndex|) (233 . |elt|) (239 . >) (245 . |elt|)
              (251 . -) (257 . |coefficients|) (262 . +) |CRFP;norm;UPR;6|
              |CRFP;pleskenSplit;UPRF;7| (268 . |Zero|) (272 . *) (278 . *)
              (284 . +) (290 . *) (296 . +) |CRFP;graeffe;2UP;8| (302 . *)
              (308 . >=) (314 . *) (320 . *) |CRFP;rootRadius;UPR;10|
              (326 . |zero?|) (331 . |coerce|) (|Union| $ '"failed")
              (336 . |recip|) (|Mapping| 7 7 7) (341 . |reduce|)
              (347 . |coerce|) (352 . |coerce|) |CRFP;divisorCascade;2UPL;14|
              |CRFP;factor;UPRBF;17| |CRFP;factor;UPF;16|
              (357 . |leadingCoefficient|) (362 . |coerce|) (367 . |list|)
              (372 . |coerce|) (377 . |coerce|) (382 . |vconcat|)
              (387 . |coerce|) (392 . |numberOfFactors|) (397 . |norm|)
              (402 . <) (408 . |monomials|) (413 . |real|) (418 . |imag|)
              (423 . |max|) (|IntegerCombinatoricFunctions| 10)
              (429 . |binomial|) (435 . =) (441 . =) (447 . |reductum|)
              (|Equation| 7) (452 . |equation|) (|Equation| $) (458 . |eval|)
              (|Fraction| 10) (464 . /) (470 . ^) (476 . |denom|)
              (|IntegerRoots| 10) (481 . |approxNthRoot|) (487 . |numer|)
              (492 . /))
           '#(|startPolynomial| 498 |setErrorBound| 503 |schwerpunkt| 508
              |rootRadius| 513 |reciprocalPolynomial| 524 |pleskenSplit| 529
              |norm| 542 |graeffe| 547 |factor| 552 |divisorCascade| 570
              |complexZeros| 583)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 153
                                                 '(1 6 0 10 11 0 6 0 12 0 7 0
                                                   13 2 6 0 0 0 14 1 17 0 16 18
                                                   1 17 0 0 20 2 6 0 24 0 25 1
                                                   7 30 0 31 2 6 0 0 30 32 1 33
                                                   36 0 37 2 7 38 0 30 39 1 38
                                                   0 0 40 0 6 0 44 0 7 0 45 2 6
                                                   46 0 0 47 1 6 10 0 48 1 10
                                                   17 0 49 1 17 0 50 51 1 17 52
                                                   0 53 1 17 52 16 54 1 7 30 0
                                                   56 0 38 0 57 2 7 0 38 30 58
                                                   2 33 0 7 10 59 2 7 0 0 0 60
                                                   0 33 0 63 2 33 46 0 0 64 1
                                                   33 7 0 65 2 7 66 0 0 67 1 8
                                                   7 7 68 1 8 0 7 69 2 8 0 0 30
                                                   70 2 8 0 0 0 71 1 8 7 0 72 2
                                                   33 0 7 10 73 2 75 74 77 0 78
                                                   2 33 0 0 0 79 2 6 46 0 0 83
                                                   2 7 0 0 0 85 1 38 0 6 86 2 7
                                                   0 0 38 87 2 38 0 6 6 88 1 6
                                                   0 0 89 1 90 10 0 91 2 90 7 0
                                                   10 92 2 30 46 0 0 93 2 41 38
                                                   0 10 94 2 38 0 0 0 95 1 7 41
                                                   0 96 2 6 0 0 0 97 0 38 0 100
                                                   2 38 0 10 0 101 2 38 0 0 0
                                                   102 2 38 0 0 0 103 2 38 0 24
                                                   0 104 2 7 0 0 0 105 2 6 0 10
                                                   0 107 2 6 46 0 0 108 2 30 0
                                                   24 0 109 2 6 0 0 0 110 1 7
                                                   46 0 112 1 38 0 10 113 1 38
                                                   114 0 115 2 90 7 116 0 117 1
                                                   30 17 0 118 1 6 17 0 119 1 7
                                                   38 0 123 1 33 0 7 124 1 36 0
                                                   35 125 1 36 17 0 126 1 33 17
                                                   0 127 1 17 0 50 128 1 7 17 0
                                                   129 1 33 30 0 130 1 38 6 0
                                                   131 2 6 46 0 0 132 1 7 50 0
                                                   133 1 38 6 0 134 1 38 6 0
                                                   135 2 6 0 0 0 136 2 137 10
                                                   10 10 138 2 6 46 0 0 139 2 7
                                                   46 0 0 140 1 7 0 0 141 2 142
                                                   0 7 7 143 2 7 0 0 144 145 2
                                                   146 0 10 10 147 2 6 0 0 146
                                                   148 1 6 10 0 149 2 150 10 10
                                                   30 151 1 6 10 0 152 2 6 0 10
                                                   10 153 1 0 61 7 62 1 0 6 6
                                                   55 1 0 38 7 84 1 0 6 7 111 2
                                                   0 6 7 6 81 1 0 7 7 82 3 0 33
                                                   7 6 46 80 2 0 33 7 6 99 1 0
                                                   6 7 98 1 0 7 7 106 2 0 33 7
                                                   6 34 3 0 33 7 6 46 121 1 0
                                                   33 7 122 2 0 75 7 7 120 3 0
                                                   75 7 7 46 76 2 0 41 7 6 42 1
                                                   0 41 7 43)))))
           '|lookupComplete|)) 
