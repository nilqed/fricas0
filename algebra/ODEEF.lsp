
(SDEFUN |ODEEF;solve;EBoSU;1|
        ((|diffeq| |Equation| F) (|y| |BasicOperator|) (|x| |Symbol|)
         ($ |Union| (|Record| (|:| |particular| F) (|:| |basis| (|List| F))) F
          "failed"))
        (SPADCALL
         (SPADCALL (SPADCALL |diffeq| (QREFELT $ 9))
                   (SPADCALL |diffeq| (QREFELT $ 10)) (QREFELT $ 11))
         |y| |x| (QREFELT $ 16))) 

(SDEFUN |ODEEF;solve;LLSU;2|
        ((|leq| |List| (|Equation| F)) (|lop| |List| (|BasicOperator|))
         (|x| |Symbol|)
         ($ |Union|
          (|Record| (|:| |particular| (|Vector| F))
                    (|:| |basis| (|List| (|Vector| F))))
          "failed"))
        (SPROG ((#1=#:G724 NIL) (|eq| NIL) (#2=#:G723 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|ODEEF;solve;LLSU;2|))
                  (SEQ (LETT |eq| NIL . #3#) (LETT #1# |leq| . #3#) G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |eq| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (SPADCALL (SPADCALL |eq| (QREFELT $ 9))
                                          (SPADCALL |eq| (QREFELT $ 10))
                                          (QREFELT $ 11))
                                #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 |lop| |x| (QREFELT $ 22))))) 

(SDEFUN |ODEEF;solve;EBoELU;3|
        ((|diffeq| |Equation| F) (|y| |BasicOperator|) (|center| |Equation| F)
         (|y0| |List| F) ($ |Union| F "failed"))
        (SPADCALL
         (SPADCALL (SPADCALL |diffeq| (QREFELT $ 9))
                   (SPADCALL |diffeq| (QREFELT $ 10)) (QREFELT $ 11))
         |y| |center| |y0| (QREFELT $ 26))) 

(SDEFUN |ODEEF;solve;MSU;4|
        ((|m| |Matrix| F) (|x| |Symbol|)
         ($ |Union| (|List| (|Vector| F)) "failed"))
        (SPROG
         ((|u|
           (|Union|
            (|Record| (|:| |particular| (|Vector| F))
                      (|:| |basis| (|List| (|Vector| F))))
            "failed")))
         (SEQ
          (LETT |u|
                (SPADCALL |m| (MAKEARR1 (ANROWS |m|) (|spadConstant| $ 28)) |x|
                          (QREFELT $ 31))
                |ODEEF;solve;MSU;4|)
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T (CONS 0 (QCDR (QCDR |u|))))))))) 

(SDEFUN |ODEEF;solve;MVSU;5|
        ((|m| |Matrix| F) (|v| |Vector| F) (|x| |Symbol|)
         ($ |Union|
          (|Record| (|:| |particular| (|Vector| F))
                    (|:| |basis| (|List| (|Vector| F))))
          "failed"))
        (SPROG
         ((#1=#:G769 NIL) (|i| NIL) (#2=#:G768 NIL)
          (|rec|
           (|Record| (|:| |particular| (|Vector| F))
                     (|:| |basis| (|Matrix| F))))
          (|uu|
           (|Union|
            (|Record| (|:| |particular| (|Vector| F))
                      (|:| |basis| (|Matrix| F)))
            #3="failed"))
          (|Lx| (|LinearOrdinaryDifferentialOperatorCategory| F)))
         (SEQ
          (LETT |Lx|
                (|LinearOrdinaryDifferentialOperator| (QREFELT $ 7)
                                                      (SPADCALL |x|
                                                                (QREFELT $
                                                                         36)))
                . #4=(|ODEEF;solve;MVSU;5|))
          (LETT |uu|
                (SPADCALL |m| |v|
                          (CONS #'|ODEEF;solve;MVSU;5!0| (VECTOR |Lx| $ |x|))
                          (|compiledLookupCheck| '|solve|
                                                 (LIST
                                                  (LIST '|Union|
                                                        (LIST '|Record|
                                                              (LIST '|:|
                                                                    '|particular|
                                                                    (LIST
                                                                     '|Vector|
                                                                     (|devaluate|
                                                                      (ELT $
                                                                           7))))
                                                              (LIST '|:|
                                                                    '|basis|
                                                                    (LIST
                                                                     '|Matrix|
                                                                     (|devaluate|
                                                                      (ELT $
                                                                           7)))))
                                                        '#3#)
                                                  (LIST '|Matrix|
                                                        (|devaluate|
                                                         (ELT $ 7)))
                                                  (LIST '|Vector|
                                                        (|devaluate|
                                                         (ELT $ 7)))
                                                  (LIST '|Mapping|
                                                        (LIST '|Union|
                                                              (LIST '|Record|
                                                                    (LIST '|:|
                                                                          '|particular|
                                                                          (|devaluate|
                                                                           (ELT
                                                                            $
                                                                            7)))
                                                                    (LIST '|:|
                                                                          '|basis|
                                                                          (LIST
                                                                           '|List|
                                                                           (|devaluate|
                                                                            (ELT
                                                                             $
                                                                             7)))))
                                                              '"failed")
                                                        (|devaluate| |Lx|)
                                                        (|devaluate|
                                                         (ELT $ 7))))
                                                 (|SystemODESolver| (ELT $ 7)
                                                                    |Lx|)))
                . #4#)
          (EXIT
           (COND ((QEQCAR |uu| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |rec| (QCDR |uu|) . #4#)
                       (EXIT
                        (CONS 0
                              (CONS (QCAR |rec|)
                                    (PROGN
                                     (LETT #2# NIL . #4#)
                                     (SEQ (LETT |i| 1 . #4#)
                                          (LETT #1# (ANCOLS (QCDR |rec|))
                                                . #4#)
                                          G190
                                          (COND
                                           ((|greater_SI| |i| #1#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #2#
                                                  (CONS
                                                   (SPADCALL (QCDR |rec|) |i|
                                                             (QREFELT $ 38))
                                                   #2#)
                                                  . #4#)))
                                          (LETT |i| (|inc_SI| |i|) . #4#)
                                          (GO G190) G191
                                          (EXIT (NREVERSE #2#)))))))))))))) 

(SDEFUN |ODEEF;solve;MVSU;5!0| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|x| $ |Lx|)
          (LETT |x| (QREFELT $$ 2) . #1=(|ODEEF;solve;MVSU;5|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |Lx| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |z1| |z2| |x|
                      (|compiledLookupCheck| '|solve|
                                             (LIST
                                              (LIST '|Union|
                                                    (LIST '|Record|
                                                          (LIST '|:|
                                                                '|particular|
                                                                (|devaluate|
                                                                 (ELT $ 7)))
                                                          (LIST '|:| '|basis|
                                                                (LIST '|List|
                                                                      (|devaluate|
                                                                       (ELT $
                                                                            7)))))
                                                    '"failed")
                                              (|devaluate| |Lx|)
                                              (|devaluate| (ELT $ 7))
                                              (LIST '|Symbol|))
                                             (|ElementaryFunctionLODESolver|
                                              (ELT $ 6) (ELT $ 7) |Lx|))))))) 

(SDEFUN |ODEEF;solve;FBoELU;6|
        ((|diffeq| F) (|y| |BasicOperator|) (|center| |Equation| F)
         (|y0| |List| F) ($ |Union| F "failed"))
        (SPROG
         ((|p| #1=(|SparseUnivariatePolynomial| F)) (|op| (|Lx|))
          (|Lx| (|LinearOrdinaryDifferentialOperatorCategory| F))
          (|rec|
           (|Record| (|:| |left| (|SparseUnivariatePolynomial| F))
                     (|:| |right| F)))
          (|u| (|Union| F "failed"))
          (|rc| (|Record| (|:| |dx| F) (|:| |dy| F)))
          (|ur|
           (|Union| (|Record| (|:| |left| #1#) (|:| |right| F))
                    (|Record| (|:| |dx| F) (|:| |dy| F))))
          (|kx| (|Kernel| F)) (|x| (|Symbol|)) (|a| (F)))
         (SEQ
          (LETT |a| (SPADCALL |center| (QREFELT $ 10))
                . #2=(|ODEEF;solve;FBoELU;6|))
          (LETT |kx|
                (SPADCALL
                 (LETT |x|
                       (SPADCALL (SPADCALL |center| (QREFELT $ 9))
                                 (QREFELT $ 39))
                       . #2#)
                 (QREFELT $ 41))
                . #2#)
          (LETT |ur| (|ODEEF;parseODE| |diffeq| |y| |x| $) . #2#)
          (EXIT
           (COND
            ((QEQCAR |ur| 1)
             (COND
              ((NULL (EQL (LENGTH |y0|) 1))
               (|error| "solve: more than one initial condition!"))
              ('T
               (SEQ (LETT |rc| (QCDR |ur|) . #2#)
                    (LETT |u|
                          (SPADCALL (QCAR |rc|) (QCDR |rc|) |y| |x|
                                    (QREFELT $ 44))
                          . #2#)
                    (EXIT
                     (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                           (#3='T
                            (CONS 0
                                  (SPADCALL (QCDR |u|)
                                            (SPADCALL (QCDR |u|)
                                                      (LIST |kx|
                                                            (SPADCALL
                                                             (SPADCALL |y|
                                                                       (SPADCALL
                                                                        |x|
                                                                        (QREFELT
                                                                         $ 45))
                                                                       (QREFELT
                                                                        $ 46))
                                                             (QREFELT $ 48)))
                                                      (LIST |a|
                                                            (|SPADfirst| |y0|))
                                                      (QREFELT $ 51))
                                            (QREFELT $ 11))))))))))
            (#3#
             (SEQ (LETT |rec| (QCDR |ur|) . #2#) (LETT |p| (QCAR |rec|) . #2#)
                  (LETT |Lx|
                        (|LinearOrdinaryDifferentialOperator| (QREFELT $ 7)
                                                              (SPADCALL |x|
                                                                        (QREFELT
                                                                         $
                                                                         36)))
                        . #2#)
                  (LETT |op|
                        (SPADCALL
                         (|compiledLookupCheck| '|Zero| (LIST '$) |Lx|))
                        . #2#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL |p| (|spadConstant| $ 54) (QREFELT $ 56)))
                         (GO G191)))
                       (SEQ
                        (LETT |op|
                              (SPADCALL |op|
                                        (SPADCALL (SPADCALL |p| (QREFELT $ 57))
                                                  (SPADCALL |p| (QREFELT $ 59))
                                                  (|compiledLookupCheck|
                                                   '|monomial|
                                                   (LIST '$
                                                         (|devaluate|
                                                          (ELT $ 7))
                                                         (LIST
                                                          '|NonNegativeInteger|))
                                                   |Lx|))
                                        (|compiledLookupCheck| '+
                                                               (LIST '$ '$ '$)
                                                               |Lx|))
                              . #2#)
                        (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 60)) . #2#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (SPADCALL |op| (QCDR |rec|) |x| |a| |y0|
                             (|compiledLookupCheck| '|solve|
                                                    (LIST
                                                     (LIST '|Union|
                                                           (|devaluate|
                                                            (ELT $ 7))
                                                           '"failed")
                                                     (|devaluate| |Lx|)
                                                     (|devaluate| (ELT $ 7))
                                                     (LIST '|Symbol|)
                                                     (|devaluate| (ELT $ 7))
                                                     (LIST '|List|
                                                           (|devaluate|
                                                            (ELT $ 7))))
                                                    (|ElementaryFunctionLODESolver|
                                                     (ELT $ 6) (ELT $ 7)
                                                     |Lx|))))))))))) 

(SDEFUN |ODEEF;solve;LLSU;7|
        ((|leq| |List| F) (|lop| |List| (|BasicOperator|)) (|x| |Symbol|)
         ($ |Union|
          (|Record| (|:| |particular| (|Vector| F))
                    (|:| |basis| (|List| (|Vector| F))))
          "failed"))
        (SPROG
         ((|rec| (|Record| (|:| |mat| (|Matrix| F)) (|:| |vec| (|Vector| F))))
          (|u|
           (|Union|
            (|Record| (|:| |mat| (|Matrix| F)) (|:| |vec| (|Vector| F)))
            "failed")))
         (SEQ
          (LETT |u| (|ODEEF;parseSYS| |leq| |lop| |x| $)
                . #1=(|ODEEF;solve;LLSU;7|))
          (EXIT
           (COND
            ((QEQCAR |u| 0)
             (SEQ (LETT |rec| (QCDR |u|) . #1#)
                  (EXIT
                   (SPADCALL (QCAR |rec|) (QCDR |rec|) |x| (QREFELT $ 31)))))
            ('T (|error| "solve: not a first order linear system"))))))) 

(SDEFUN |ODEEF;solve;FBoSU;8|
        ((|diffeq| F) (|y| |BasicOperator|) (|x| |Symbol|)
         ($ |Union| (|Record| (|:| |particular| F) (|:| |basis| (|List| F))) F
          "failed"))
        (SPROG
         ((|uuu|
           (|Union| (|Record| (|:| |particular| F) (|:| |basis| (|List| F)))
                    #1="failed"))
          (|p| #2=(|SparseUnivariatePolynomial| F)) (|op| (|Lx|))
          (|Lx| (|LinearOrdinaryDifferentialOperatorCategory| F))
          (|rec|
           (|Record| (|:| |left| (|SparseUnivariatePolynomial| F))
                     (|:| |right| F)))
          (|uu| (|Union| F "failed"))
          (|rc| (|Record| (|:| |dx| F) (|:| |dy| F)))
          (|u|
           (|Union| (|Record| (|:| |left| #2#) (|:| |right| F))
                    (|Record| (|:| |dx| F) (|:| |dy| F)))))
         (SEQ
          (LETT |u| (|ODEEF;parseODE| |diffeq| |y| |x| $)
                . #3=(|ODEEF;solve;FBoSU;8|))
          (EXIT
           (COND
            ((QEQCAR |u| 1)
             (SEQ (LETT |rc| (QCDR |u|) . #3#)
                  (LETT |uu|
                        (SPADCALL (QCAR |rc|) (QCDR |rc|) |y| |x|
                                  (QREFELT $ 44))
                        . #3#)
                  (EXIT
                   (COND ((QEQCAR |uu| 1) (CONS 2 "failed"))
                         (#4='T (CONS 1 (QCDR |uu|)))))))
            (#4#
             (SEQ (LETT |rec| (QCDR |u|) . #3#) (LETT |p| (QCAR |rec|) . #3#)
                  (LETT |Lx|
                        (|LinearOrdinaryDifferentialOperator| (QREFELT $ 7)
                                                              (SPADCALL |x|
                                                                        (QREFELT
                                                                         $
                                                                         36)))
                        . #3#)
                  (LETT |op|
                        (SPADCALL
                         (|compiledLookupCheck| '|Zero| (LIST '$) |Lx|))
                        . #3#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL |p| (|spadConstant| $ 54) (QREFELT $ 56)))
                         (GO G191)))
                       (SEQ
                        (LETT |op|
                              (SPADCALL |op|
                                        (SPADCALL (SPADCALL |p| (QREFELT $ 57))
                                                  (SPADCALL |p| (QREFELT $ 59))
                                                  (|compiledLookupCheck|
                                                   '|monomial|
                                                   (LIST '$
                                                         (|devaluate|
                                                          (ELT $ 7))
                                                         (LIST
                                                          '|NonNegativeInteger|))
                                                   |Lx|))
                                        (|compiledLookupCheck| '+
                                                               (LIST '$ '$ '$)
                                                               |Lx|))
                              . #3#)
                        (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 60)) . #3#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (LETT |uuu|
                        (SPADCALL |op| (QCDR |rec|) |x|
                                  (|compiledLookupCheck| '|solve|
                                                         (LIST
                                                          (LIST '|Union|
                                                                (LIST '|Record|
                                                                      (LIST
                                                                       '|:|
                                                                       '|particular|
                                                                       (|devaluate|
                                                                        (ELT $
                                                                             7)))
                                                                      (LIST
                                                                       '|:|
                                                                       '|basis|
                                                                       (LIST
                                                                        '|List|
                                                                        (|devaluate|
                                                                         (ELT $
                                                                              7)))))
                                                                '#1#)
                                                          (|devaluate| |Lx|)
                                                          (|devaluate|
                                                           (ELT $ 7))
                                                          (LIST '|Symbol|))
                                                         (|ElementaryFunctionLODESolver|
                                                          (ELT $ 6) (ELT $ 7)
                                                          |Lx|)))
                        . #3#)
                  (EXIT
                   (COND ((QEQCAR |uuu| 1) (CONS 2 "failed"))
                         (#4# (CONS 0 (QCDR |uuu|)))))))))))) 

(SDEFUN |ODEEF;parseSYS|
        ((|eqs| |List| F) (|ly| |List| (|BasicOperator|)) (|x| |Symbol|)
         ($ |Union|
          (|Record| (|:| |mat| (|Matrix| F)) (|:| |vec| (|Vector| F)))
          "failed"))
        (SPROG
         ((|rec|
           (|Record| (|:| |index| (|Integer|)) (|:| |row| (|Vector| F))
                     (|:| |rh| F)))
          (#1=#:G842 NIL)
          (|u|
           (|Union|
            (|Record| (|:| |index| (|Integer|)) (|:| |row| (|Vector| F))
                      (|:| |rh| F))
            "failed"))
          (#2=#:G849 NIL) (|eq| NIL) (|lk1| (|List| (|Kernel| F)))
          (#3=#:G848 NIL) (|f| NIL) (#4=#:G847 NIL)
          (|lk0| (|List| (|Kernel| F))) (#5=#:G846 NIL) (#6=#:G845 NIL)
          (|lf| (|List| F)) (#7=#:G844 NIL) (|y| NIL) (#8=#:G843 NIL)
          (|xx| (F)) (|v| (|Vector| F)) (|m| (|Matrix| F))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (LETT |n| (LENGTH |eqs|) . #9=(|ODEEF;parseSYS|))
                       (LENGTH |ly|) (QREFELT $ 61))
             (CONS 1 "failed"))
            ('T
             (SEQ (LETT |m| (MAKE_MATRIX1 |n| |n| (|spadConstant| $ 28)) . #9#)
                  (LETT |v| (MAKEARR1 |n| (|spadConstant| $ 28)) . #9#)
                  (LETT |xx| (SPADCALL |x| (QREFELT $ 45)) . #9#)
                  (LETT |lf|
                        (PROGN
                         (LETT #8# NIL . #9#)
                         (SEQ (LETT |y| NIL . #9#) (LETT #7# |ly| . #9#) G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |y| (CAR #7#) . #9#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #8#
                                      (CONS (SPADCALL |y| |xx| (QREFELT $ 46))
                                            #8#)
                                      . #9#)))
                              (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                              (EXIT (NREVERSE #8#))))
                        . #9#)
                  (LETT |lk0|
                        (PROGN
                         (LETT #6# NIL . #9#)
                         (SEQ (LETT |f| NIL . #9#) (LETT #5# |lf| . #9#) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |f| (CAR #5#) . #9#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #6#
                                      (CONS (SPADCALL |f| (QREFELT $ 48)) #6#)
                                      . #9#)))
                              (LETT #5# (CDR #5#) . #9#) (GO G190) G191
                              (EXIT (NREVERSE #6#))))
                        . #9#)
                  (LETT |lk1|
                        (PROGN
                         (LETT #4# NIL . #9#)
                         (SEQ (LETT |f| NIL . #9#) (LETT #3# |lf| . #9#) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |f| (CAR #3#) . #9#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #4#
                                      (CONS
                                       (SPADCALL
                                        (SPADCALL |f| |x| (QREFELT $ 62))
                                        (QREFELT $ 48))
                                       #4#)
                                      . #9#)))
                              (LETT #3# (CDR #3#) . #9#) (GO G190) G191
                              (EXIT (NREVERSE #4#))))
                        . #9#)
                  (SEQ (LETT |eq| NIL . #9#) (LETT #2# |eqs| . #9#) G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |eq| (CAR #2#) . #9#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |u|
                              (|ODEEF;parseSYSeq| |eq| |lk0| |lk1| |lf| |x| $)
                              . #9#)
                        (EXIT
                         (COND
                          ((QEQCAR |u| 1)
                           (PROGN
                            (LETT #1# (CONS 1 "failed") . #9#)
                            (GO #10=#:G841)))
                          ('T
                           (SEQ (LETT |rec| (QCDR |u|) . #9#)
                                (SPADCALL |m| (QVELT |rec| 0) (QVELT |rec| 1)
                                          (QREFELT $ 63))
                                (EXIT
                                 (SPADCALL |v| (QVELT |rec| 0) (QVELT |rec| 2)
                                           (QREFELT $ 64))))))))
                       (LETT #2# (CDR #2#) . #9#) (GO G190) G191 (EXIT NIL))
                  (EXIT (CONS 0 (CONS |m| |v|)))))))
          #10# (EXIT #1#)))) 

(SDEFUN |ODEEF;parseSYSeq|
        ((|eq| F) (|l0| |List| (|Kernel| F)) (|l1| |List| (|Kernel| F))
         (|lf| |List| F) (|x| |Symbol|)
         ($ |Union|
          (|Record| (|:| |index| (|Integer|)) (|:| |row| (|Vector| F))
                    (|:| |rh| F))
          "failed"))
        (SPROG
         ((|ci| (F)) (#1=#:G874 NIL) (|y| NIL) (|i| NIL) (|v| (|Vector| F))
          (|c| (F)) (|n| (|Integer|)) (|k| (|Kernel| F))
          (|l| (|List| (|Kernel| F))) (#2=#:G873 NIL) (#3=#:G872 NIL))
         (SEQ
          (LETT |l|
                (PROGN
                 (LETT #3# NIL . #4=(|ODEEF;parseSYSeq|))
                 (SEQ (LETT |k| NIL . #4#)
                      (LETT #2#
                            (SPADCALL (SPADCALL |eq| (QREFELT $ 65)) |x|
                                      (QREFELT $ 68))
                            . #4#)
                      G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#) . #4#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |k| '|%diff| (QREFELT $ 69))
                          (LETT #3# (CONS |k| #3#) . #4#)))))
                      (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                      (EXIT (NREVERSE #3#))))
                . #4#)
          (COND
           ((OR (OR (NULL |l|) (NULL (NULL (CDR |l|))))
                (ZEROP
                 (LETT |n|
                       (SPADCALL (LETT |k| (|SPADfirst| |l|) . #4#) |l1|
                                 (QREFELT $ 71))
                       . #4#)))
            (EXIT (CONS 1 "failed"))))
          (LETT |c| (|ODEEF;getfreelincoeff1| |eq| |k| |lf| $) . #4#)
          (LETT |eq|
                (SPADCALL |eq|
                          (SPADCALL |c| (SPADCALL |k| (QREFELT $ 72))
                                    (QREFELT $ 73))
                          (QREFELT $ 11))
                . #4#)
          (LETT |v| (MAKEARR1 (LENGTH |l0|) (|spadConstant| $ 28)) . #4#)
          (SEQ (LETT |i| 1 . #4#) (LETT |y| NIL . #4#) (LETT #1# |l0| . #4#)
               G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |y| (CAR #1#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |ci| (|ODEEF;getfreelincoeff1| |eq| |y| |lf| $) . #4#)
                (SPADCALL |v| |i|
                          (SPADCALL (SPADCALL |ci| |c| (QREFELT $ 74))
                                    (QREFELT $ 75))
                          (QREFELT $ 64))
                (EXIT
                 (LETT |eq|
                       (SPADCALL |eq|
                                 (SPADCALL |ci| (SPADCALL |y| (QREFELT $ 72))
                                           (QREFELT $ 73))
                                 (QREFELT $ 11))
                       . #4#)))
               (LETT #1# (PROG1 (CDR #1#) (LETT |i| (|inc_SI| |i|) . #4#))
                     . #4#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (CONS 0 (VECTOR |n| |v| (SPADCALL |eq| (QREFELT $ 75)))))))) 

(SDEFUN |ODEEF;parseODE|
        ((|diffeq| F) (|y| |BasicOperator|) (|x| |Symbol|)
         ($ |Union|
          (|Record| (|:| |left| (|SparseUnivariatePolynomial| F))
                    (|:| |right| F))
          (|Record| (|:| |dx| F) (|:| |dy| F))))
        (SPROG
         ((|eqrhs| (F)) (|d| (F)) (|u| (|Union| F "failed")) (|k| (|Kernel| F))
          (|l| (|List| (|Kernel| F))) (|ny| (|Symbol|)) (|c| (F)) (|f| (F))
          (#1=#:G900 NIL) (|i| NIL) (|n| (|NonNegativeInteger|))
          (#2=#:G883 NIL) (|m| (|NonNegativeInteger|)) (#3=#:G899 NIL))
         (SEQ
          (LETT |f| (SPADCALL |y| (SPADCALL |x| (QREFELT $ 45)) (QREFELT $ 46))
                . #4=(|ODEEF;parseODE|))
          (LETT |l| (LIST (SPADCALL |f| (QREFELT $ 48))) . #4#)
          (LETT |n| 2 . #4#)
          (SEQ (LETT |k| NIL . #4#)
               (LETT #3#
                     (SPADCALL (SPADCALL |diffeq| (QREFELT $ 65)) |x|
                               (QREFELT $ 68))
                     . #4#)
               G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |k| '|%diff| (QREFELT $ 69))
                   (SEQ (LETT |m| (SPADCALL |k| (QREFELT $ 76)) . #4#)
                        (EXIT
                         (COND
                          ((SPADCALL |m| |n| (QREFELT $ 77))
                           (LETT |n| |m| . #4#)))))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (LETT |n|
                (PROG1 (LETT #2# (- |n| 2) . #4#)
                  (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #2#))
                . #4#)
          (SEQ (LETT |i| 1 . #4#) (LETT #1# |n| . #4#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |l|
                       (CONS
                        (SPADCALL
                         (LETT |f| (SPADCALL |f| |x| (QREFELT $ 62)) . #4#)
                         (QREFELT $ 48))
                        |l|)
                       . #4#)))
               (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
          (SEQ G190
               (COND
                ((NULL
                  (COND ((NULL |l|) NIL)
                        ('T
                         (SPADCALL
                          (LETT |c|
                                (|ODEEF;getlincoeff| |diffeq|
                                 (LETT |k| (|SPADfirst| |l|) . #4#) $)
                                . #4#)
                          (QREFELT $ 78)))))
                 (GO G191)))
               (SEQ (EXIT (LETT |l| (CDR |l|) . #4#))) NIL (GO G190) G191
               (EXIT NIL))
          (COND
           ((OR (NULL |l|) (NULL (CDR |l|)))
            (EXIT (|error| "parseODE: equation has order 0"))))
          (LETT |diffeq|
                (SPADCALL |diffeq|
                          (SPADCALL |c| (SPADCALL |k| (QREFELT $ 72))
                                    (QREFELT $ 73))
                          (QREFELT $ 11))
                . #4#)
          (LETT |ny| (SPADCALL |y| (QREFELT $ 79)) . #4#)
          (LETT |l| (CDR |l|) . #4#)
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |k| (QREFELT $ 76)) 3 (QREFELT $ 77))
             (CONS 0
                   (|ODEEF;parseLODE| |diffeq| |l|
                    (SPADCALL |c| (LENGTH |l|) (QREFELT $ 80)) |ny| $)))
            (#5='T
             (SEQ
              (LETT |u|
                    (|ODEEF;getcoeff| |diffeq|
                     (LETT |k| (|SPADfirst| |l|) . #4#) $)
                    . #4#)
              (EXIT
               (COND ((QEQCAR |u| 1) (CONS 1 (CONS |diffeq| |c|)))
                     (#5#
                      (SEQ
                       (LETT |eqrhs|
                             (SPADCALL
                              (SPADCALL (LETT |d| (QCDR |u|) . #4#)
                                        (SPADCALL |k| (QREFELT $ 72))
                                        (QREFELT $ 73))
                              |diffeq| (QREFELT $ 11))
                             . #4#)
                       (COND
                        ((SPADCALL |eqrhs| |ny| (QREFELT $ 81))
                         (COND
                          ((SPADCALL |c| |ny| (QREFELT $ 81))
                           (COND
                            ((SPADCALL |d| |ny| (QREFELT $ 81))
                             (EXIT
                              (CONS 0
                                    (CONS
                                     (SPADCALL (SPADCALL |c| 1 (QREFELT $ 80))
                                               (SPADCALL |d| (QREFELT $ 83))
                                               (QREFELT $ 84))
                                     |eqrhs|)))))))))
                       (EXIT (CONS 1 (CONS |diffeq| |c|)))))))))))))) 

(SDEFUN |ODEEF;parseLODE|
        ((|diffeq| F) (|l| |List| (|Kernel| F))
         (|p| |SparseUnivariatePolynomial| F) (|y| |Symbol|)
         ($ |Record| (|:| |left| (|SparseUnivariatePolynomial| F))
          (|:| |right| F)))
        (SPROG
         ((|d| (|Integer|)) (#1=#:G903 NIL) (|c| (F)) (#2=#:G908 NIL)
          (|k| NIL))
         (SEQ
          (COND
           ((NULL (SPADCALL (SPADCALL |p| (QREFELT $ 57)) |y| (QREFELT $ 81)))
            (|error| "parseLODE: not a linear ordinary differential equation"))
           ('T
            (SEQ
             (LETT |d| (- (SPADCALL |p| (QREFELT $ 59)) 1)
                   . #3=(|ODEEF;parseLODE|))
             (SEQ (LETT |k| NIL . #3#) (LETT #2# |l| . #3#) G190
                  (COND
                   ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (LETT |p|
                         (SPADCALL |p|
                                   (SPADCALL
                                    (LETT |c|
                                          (|ODEEF;getfreelincoeff| |diffeq| |k|
                                           |y| $)
                                          . #3#)
                                    (PROG1 (LETT #1# |d| . #3#)
                                      (|check_subtype2| (>= #1# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #1#))
                                    (QREFELT $ 80))
                                   (QREFELT $ 84))
                         . #3#)
                   (LETT |d| (- |d| 1) . #3#)
                   (EXIT
                    (LETT |diffeq|
                          (SPADCALL |diffeq|
                                    (SPADCALL |c| (SPADCALL |k| (QREFELT $ 72))
                                              (QREFELT $ 73))
                                    (QREFELT $ 11))
                          . #3#)))
                  (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
             (EXIT
              (COND
               ((SPADCALL |diffeq| |y| (QREFELT $ 81))
                (CONS |p| (SPADCALL |diffeq| (QREFELT $ 75))))
               ('T
                (|error|
                 "parseLODE: not a linear ordinary differential equation")))))))))) 

(SDEFUN |ODEEF;getfreelincoeff| ((|f| F) (|k| |Kernel| F) (|y| |Symbol|) ($ F))
        (SPROG ((|c| (F)))
               (COND
                ((SPADCALL
                  (LETT |c| (|ODEEF;getlincoeff| |f| |k| $)
                        |ODEEF;getfreelincoeff|)
                  |y| (QREFELT $ 81))
                 |c|)
                ('T
                 (|error|
                  "getfreelincoeff: not a linear ordinary differential equation"))))) 

(SDEFUN |ODEEF;getfreelincoeff1|
        ((|f| F) (|k| |Kernel| F) (|ly| |List| F) ($ F))
        (SPROG ((#1=#:G915 NIL) (#2=#:G916 NIL) (|y| NIL) (|c| (F)))
               (SEQ
                (LETT |c| (|ODEEF;getlincoeff| |f| |k| $)
                      . #3=(|ODEEF;getfreelincoeff1|))
                (SEQ
                 (EXIT
                  (SEQ (LETT |y| NIL . #3#) (LETT #2# |ly| . #3#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |y| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |c| |y| (QREFELT $ 85)))
                           (PROGN
                            (LETT #1#
                                  (|error|
                                   "getfreelincoeff: not a linear ordinary differential equation")
                                  . #3#)
                            (GO #4=#:G912))))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL)))
                 #4# (EXIT #1#))
                (EXIT |c|)))) 

(SDEFUN |ODEEF;getlincoeff| ((|f| F) (|k| |Kernel| F) ($ F))
        (SPROG ((|u| (|Union| F "failed")))
               (SEQ (LETT |u| (|ODEEF;getcoeff| |f| |k| $) |ODEEF;getlincoeff|)
                    (EXIT
                     (COND
                      ((QEQCAR |u| 1)
                       (|error|
                        "getlincoeff: not an appropriate ordinary differential equation"))
                      ('T (QCDR |u|))))))) 

(SDEFUN |ODEEF;getcoeff| ((|f| F) (|k| |Kernel| F) ($ |Union| F "failed"))
        (SPROG
         ((#1=#:G935 NIL)
          (|p|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (|r|
           (|Union| (|SparseMultivariatePolynomial| R (|Kernel| F)) "failed")))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |r|
                   (SPADCALL
                    (SPADCALL (SPADCALL |f| (QREFELT $ 87)) |k| (QREFELT $ 90))
                    (QREFELT $ 93))
                   . #2=(|ODEEF;getcoeff|))
             (EXIT
              (COND
               ((OR (QEQCAR |r| 1)
                    (SPADCALL
                     (SPADCALL
                      (LETT |p|
                            (SPADCALL (SPADCALL |f| (QREFELT $ 94)) |k|
                                      (QREFELT $ 90))
                            . #2#)
                      (QREFELT $ 95))
                     1 (QREFELT $ 77)))
                (PROGN (LETT #1# (CONS 1 "failed") . #2#) (GO #3=#:G933))))))
            (EXIT
             (CONS 0
                   (SPADCALL (SPADCALL |p| 1 (QREFELT $ 96)) (QCDR |r|)
                             (QREFELT $ 97))))))
          #3# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |ElementaryFunctionODESolver;|)) 

(DEFUN |ElementaryFunctionODESolver| (&REST #1=#:G936)
  (SPROG NIL
         (PROG (#2=#:G937)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ElementaryFunctionODESolver|)
                                               '|domainEqualList|)
                    . #3=(|ElementaryFunctionODESolver|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |ElementaryFunctionODESolver;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ElementaryFunctionODESolver|)))))))))) 

(DEFUN |ElementaryFunctionODESolver;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ElementaryFunctionODESolver|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|ElementaryFunctionODESolver| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 98) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ElementaryFunctionODESolver|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|ElementaryFunctionODESolver| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Equation| 7) (0 . |lhs|) (5 . |rhs|) (10 . -)
              (|Record| (|:| |particular| 7) (|:| |basis| 20))
              (|Union| 12 7 '"failed") (|BasicOperator|) (|Symbol|)
              |ODEEF;solve;FBoSU;8| |ODEEF;solve;EBoSU;1|
              (|Record| (|:| |particular| 30) (|:| |basis| (|List| 30)))
              (|Union| 18 '"failed") (|List| 7) (|List| 14)
              |ODEEF;solve;LLSU;7| (|List| 8) |ODEEF;solve;LLSU;2|
              (|Union| 7 '"failed") |ODEEF;solve;FBoELU;6|
              |ODEEF;solve;EBoELU;3| (16 . |Zero|) (|Matrix| 7) (|Vector| 7)
              |ODEEF;solve;MVSU;5| (|Union| (|List| 30) '"failed")
              |ODEEF;solve;MSU;4| (|Mapping| 7 7) (|ODEIntegration| 6 7)
              (20 . |diff|) (|Integer|) (25 . |column|) (31 . |retract|)
              (|Kernel| 7) (36 . |kernel|) (41 . |One|)
              (|NonLinearFirstOrderODESolver| 6 7) (45 . |solve|)
              (53 . |coerce|) (58 . |elt|) (|Kernel| $) (64 . |retract|)
              (|List| 47) (|List| $) (69 . |eval|) (76 . |Zero|)
              (|SparseUnivariatePolynomial| 7) (80 . |Zero|) (|Boolean|)
              (84 . ~=) (90 . |leadingCoefficient|) (|NonNegativeInteger|)
              (95 . |degree|) (100 . |reductum|) (105 . ~=)
              (111 . |differentiate|) (117 . |setRow!|) (124 . |setelt!|)
              (131 . |kernels|) (|List| 40) (|IntegrationTools| 6 7)
              (136 . |varselect|) (142 . |is?|) (148 . |first|)
              (153 . |position|) (159 . |coerce|) (164 . *) (170 . /) (176 . -)
              (181 . |height|) (186 . >) (192 . |zero?|) (197 . |name|)
              (202 . |monomial|) (208 . |freeOf?|) (214 . |One|)
              (218 . |coerce|) (223 . +) (229 . |freeOf?|)
              (|SparseMultivariatePolynomial| 6 47) (235 . |denom|)
              (|SparseUnivariatePolynomial| $)
              (|SparseMultivariatePolynomial| 6 40) (240 . |univariate|)
              (|Union| 89 '"failed") (|SparseUnivariatePolynomial| 89)
              (246 . |retractIfCan|) (251 . |numer|) (256 . |degree|)
              (261 . |coefficient|) (267 . /))
           '#(|solve| 273) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 97
                                                 '(1 8 7 0 9 1 8 7 0 10 2 7 0 0
                                                   0 11 0 7 0 28 1 35 34 15 36
                                                   2 29 30 0 37 38 1 7 15 0 39
                                                   1 40 0 15 41 0 6 0 42 4 43
                                                   25 7 7 14 15 44 1 7 0 15 45
                                                   2 7 0 14 0 46 1 7 47 0 48 3
                                                   7 0 0 49 50 51 0 6 0 52 0 53
                                                   0 54 2 53 55 0 0 56 1 53 7 0
                                                   57 1 53 58 0 59 1 53 0 0 60
                                                   2 58 55 0 0 61 2 7 0 0 15 62
                                                   3 29 0 0 37 30 63 3 30 7 0
                                                   37 7 64 1 7 49 0 65 2 67 66
                                                   66 15 68 2 40 55 0 15 69 1
                                                   66 40 0 70 2 66 37 40 0 71 1
                                                   7 0 47 72 2 7 0 0 0 73 2 7 0
                                                   0 0 74 1 7 0 0 75 1 40 58 0
                                                   76 2 58 55 0 0 77 1 7 55 0
                                                   78 1 14 15 0 79 2 53 0 7 58
                                                   80 2 7 55 0 15 81 0 7 0 82 1
                                                   53 0 7 83 2 53 0 0 0 84 2 7
                                                   55 0 0 85 1 7 86 0 87 2 89
                                                   88 0 40 90 1 92 91 0 93 1 7
                                                   86 0 94 1 92 58 0 95 2 92 89
                                                   0 58 96 2 7 0 86 86 97 2 0
                                                   32 29 15 33 3 0 19 29 30 15
                                                   31 3 0 19 20 21 15 22 3 0 19
                                                   23 21 15 24 3 0 13 7 14 15
                                                   16 3 0 13 8 14 15 17 4 0 25
                                                   7 14 8 20 26 4 0 25 8 14 8
                                                   20 27)))))
           '|lookupComplete|)) 
