
(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;1|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPADCALL |l| |degs| |kind| |sigma| |gen| |check| (QREFELT $ 17))) 

(SDEFUN |MODHPS;LLF_to_LPA;LILLIU;2|
        ((|l| |List| (|List| F)) (|sigma| |Integer|) (|vars| |List| (|Symbol|))
         (|points| |List| (|Integer|)) (|p| |Integer|)
         ($ |Union| (|List| (|U32Vector|)) "failed"))
        (SPADCALL |l| |sigma| |p| (QREFELT $ 24))) 

(SDEFUN |MODHPS;VSUPS_to_VPA;VLLIV;3|
        ((|v| |Vector| (|SparseUnivariatePolynomial| S))
         (|vars| |List| (|Symbol|)) (|points| |List| (|Integer|))
         (|p| |Integer|) ($ |Vector| (|U32Vector|)))
        (SPADCALL |v| |p| (QREFELT $ 29))) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;4|
        ((|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         (|l| |List| (|List| F)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Mapping| (|Union| #1# #2# #3#)
          (|List| (|SparseUnivariatePolynomial| S))))
        (SPROG NIL
               (COND ((SPADCALL |kind| '|diffHP| (QREFELT $ 33)) |check|)
                     ('T
                      (CONS #'|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;4!0|
                            (VECTOR |gen| |sigma| |l| $)))))) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;4!0| ((|x| NIL) ($$ NIL))
        (PROG ($ |l| |sigma| |gen|)
          (LETT $ (QREFELT $$ 3)
                . #1=(|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;4|))
          (LETT |l| (QREFELT $$ 2) . #1#)
          (LETT |sigma| (QREFELT $$ 1) . #1#)
          (LETT |gen| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|MODHPS;check_sol_mod_diff| (SPADCALL |x| (QREFELT $ 35)) |l|
             |sigma| |gen| '|dummy| NIL $))))) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;5|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPADCALL |l| |degs| |kind| |qvar| |sigma| |gen| |check|
                  (QREFELT $ 40))) 

(SDEFUN |MODHPS;LLF_to_LPA;LILLIU;6|
        ((|l| |List| (|List| F)) (|sigma| |Integer|) (|vars| |List| (|Symbol|))
         (|points| |List| (|Integer|)) (|p| |Integer|)
         ($ |Union| (|List| (|U32Vector|)) "failed"))
        (SPADCALL |l| |sigma| |vars| |points| |p| (QREFELT $ 41))) 

(SDEFUN |MODHPS;VSUPS_to_VPA;VLLIV;7|
        ((|v| |Vector| (|SparseUnivariatePolynomial| S))
         (|vars| |List| (|Symbol|)) (|points| |List| (|Integer|))
         (|p| |Integer|) ($ |Vector| (|U32Vector|)))
        (SPADCALL |v| |vars| |points| |p| (QREFELT $ 43))) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;8|
        ((|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         (|l| |List| (|List| F)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Mapping| (|Union| #1# #2# #3#)
          (|List| (|SparseUnivariatePolynomial| S))))
        (SPROG ((|vars| (|List| (|Symbol|))))
               (SEQ
                (COND
                 ((NULL (SPADCALL |kind| '|diffHP| (QREFELT $ 44)))
                  (COND
                   ((NULL (SPADCALL |kind| '|qdiffHP| (QREFELT $ 44)))
                    (COND
                     ((NULL (SPADCALL |kind| '|qmixed| (QREFELT $ 44)))
                      (EXIT |check|)))))))
                (LETT |vars|
                      (SPADCALL (SPADCALL |l| |kind| |qvar| (QREFELT $ 45))
                                (QREFELT $ 46))
                      |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;8|)
                (EXIT
                 (CONS #'|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;8!0|
                       (VECTOR |vars| |qvar| |gen| |sigma| |l| $)))))) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;8!0| ((|x| NIL) ($$ NIL))
        (PROG ($ |l| |sigma| |gen| |qvar| |vars|)
          (LETT $ (QREFELT $$ 5)
                . #1=(|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;8|))
          (LETT |l| (QREFELT $$ 4) . #1#)
          (LETT |sigma| (QREFELT $$ 3) . #1#)
          (LETT |gen| (QREFELT $$ 2) . #1#)
          (LETT |qvar| (QREFELT $$ 1) . #1#)
          (LETT |vars| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|MODHPS;check_sol_mod_diff| (SPADCALL |x| (QREFELT $ 35)) |l|
             |sigma| |gen| |qvar| |vars| $))))) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;9|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPADCALL |l| |degs| |kind| |sigma| |gen| |check| (QREFELT $ 50))) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;10| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;10|
        ((|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         (|l| |List| (|List| F)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Mapping| (|Union| #1# #2# #3#)
          (|List| (|SparseUnivariatePolynomial| S))))
        |check|) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;11|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPADCALL |l| |degs| |kind| |qvar| |sigma| |gen| |check|
                  (QREFELT $ 54))) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;12| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;12|
        ((|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         (|l| |List| (|List| F)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Mapping| (|Union| #1# #2# #3#)
          (|List| (|SparseUnivariatePolynomial| S))))
        |check|) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;13|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPROG
         ((#4=#:G840 NIL)
          (|pp|
           (|Union| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|)))
                    (|Boolean|)))
          (|checkPF|
           (|Mapping| (|Union| #1# #2# #3#)
                      (|List| (|SparseUnivariatePolynomial| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ (LETT |checkPF| |check| . #5=(|MODHPS;HP_solve;LL2SNniMMU;13|))
                (LETT |pp|
                      (SPADCALL |l| |degs| |kind| (QREFELT $ 56) |sigma| |gen|
                                |checkPF| (QREFELT $ 61))
                      . #5#)
                (EXIT
                 (COND
                  ((QEQCAR |pp| 0)
                   (PROGN
                    (LETT #4# (CONS 0 (QCDR |pp|)) . #5#)
                    (GO #6=#:G839)))
                  ('T
                   (PROGN (LETT #4# (CONS 1 (QCDR |pp|)) . #5#) (GO #6#)))))))
          #6# (EXIT #4#)))) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;14|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;15|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;16|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;17|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;18| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;18|
        ((|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         (|l| |List| (|List| F)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Mapping| (|Union| #1# #2# #3#)
          (|List| (|SparseUnivariatePolynomial| S))))
        |check|) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;19|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPROG
         ((#4=#:G883 NIL)
          (|pp|
           (|Union| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|)))
                    (|Boolean|)))
          (|checkPF|
           (|Mapping| (|Union| #1# #2# #3#)
                      (|List| (|SparseUnivariatePolynomial| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ (LETT |checkPF| |check| . #5=(|MODHPS;HP_solve;LL2SNniMMU;19|))
                (LETT |pp|
                      (SPADCALL |l| |degs| |kind| (QREFELT $ 56) |sigma| |gen|
                                |checkPF| (QREFELT $ 61))
                      . #5#)
                (EXIT
                 (COND
                  ((QEQCAR |pp| 0)
                   (PROGN
                    (LETT #4# (CONS 0 (QCDR |pp|)) . #5#)
                    (GO #6=#:G882)))
                  ('T
                   (PROGN (LETT #4# (CONS 1 (QCDR |pp|)) . #5#) (GO #6#)))))))
          #6# (EXIT #4#)))) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;20|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;21|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;22|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;23|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;24| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;24|
        ((|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         (|l| |List| (|List| F)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Mapping| (|Union| #1# #2# #3#)
          (|List| (|SparseUnivariatePolynomial| S))))
        |check|) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;25|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPADCALL |l| |degs| |kind| |qvar| |sigma| |gen| |check|
                  (QREFELT $ 54))) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;26| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;26|
        ((|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         (|l| |List| (|List| F)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Mapping| (|Union| #1# #2# #3#)
          (|List| (|SparseUnivariatePolynomial| S))))
        |check|) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;27|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPROG
         ((#4=#:G944 NIL)
          (|pp|
           (|Union| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|)))
                    (|Boolean|)))
          (|checkPF|
           (|Mapping| (|Union| #1# #2# #3#)
                      (|List| (|SparseUnivariatePolynomial| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ (LETT |checkPF| |check| . #5=(|MODHPS;HP_solve;LL2SNniMMU;27|))
                (LETT |pp|
                      (SPADCALL |l| |degs| |kind| (QREFELT $ 56) |sigma| |gen|
                                |checkPF| (QREFELT $ 61))
                      . #5#)
                (EXIT
                 (COND
                  ((QEQCAR |pp| 0)
                   (PROGN
                    (LETT #4# (CONS 0 (QCDR |pp|)) . #5#)
                    (GO #6=#:G943)))
                  ('T
                   (PROGN (LETT #4# (CONS 1 (QCDR |pp|)) . #5#) (GO #6#)))))))
          #6# (EXIT #4#)))) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;28|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;29|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;30|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;31|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;32| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;32|
        ((|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         (|l| |List| (|List| F)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Mapping| (|Union| #1# #2# #3#)
          (|List| (|SparseUnivariatePolynomial| S))))
        |check|) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;33|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPROG
         ((#4=#:G987 NIL)
          (|pp|
           (|Union| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|)))
                    (|Boolean|)))
          (|checkPF|
           (|Mapping| (|Union| #1# #2# #3#)
                      (|List| (|SparseUnivariatePolynomial| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ (LETT |checkPF| |check| . #5=(|MODHPS;HP_solve;LL2SNniMMU;33|))
                (LETT |pp|
                      (SPADCALL |l| |degs| |kind| (QREFELT $ 56) |sigma| |gen|
                                |checkPF| (QREFELT $ 61))
                      . #5#)
                (EXIT
                 (COND
                  ((QEQCAR |pp| 0)
                   (PROGN
                    (LETT #4# (CONS 0 (QCDR |pp|)) . #5#)
                    (GO #6=#:G986)))
                  ('T
                   (PROGN (LETT #4# (CONS 1 (QCDR |pp|)) . #5#) (GO #6#)))))))
          #6# (EXIT #4#)))) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;34|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;35|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;36|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;37|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;38| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;38|
        ((|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         (|l| |List| (|List| F)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Mapping| (|Union| #1# #2# #3#)
          (|List| (|SparseUnivariatePolynomial| S))))
        |check|) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;39|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPADCALL |l| |degs| |kind| |sigma| |gen| |check| (QREFELT $ 50))) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;40| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;40|
        ((|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         (|l| |List| (|List| F)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Mapping| (|Union| #1# #2# #3#)
          (|List| (|SparseUnivariatePolynomial| S))))
        |check|) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;41|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPADCALL |l| |degs| |kind| |qvar| |sigma| |gen| |check|
                  (QREFELT $ 54))) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;42| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;42|
        ((|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         (|l| |List| (|List| F)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Mapping| (|Union| #1# #2# #3#)
          (|List| (|SparseUnivariatePolynomial| S))))
        |check|) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;43|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPROG
         ((#4=#:G1066 NIL)
          (|pp|
           (|Union| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|)))
                    (|Boolean|)))
          (|checkPF|
           (|Mapping| (|Union| #1# #2# #3#)
                      (|List| (|SparseUnivariatePolynomial| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ (LETT |checkPF| |check| . #5=(|MODHPS;HP_solve;LL2SNniMMU;43|))
                (LETT |pp|
                      (SPADCALL |l| |degs| |kind| (QREFELT $ 56) |sigma| |gen|
                                |checkPF| (QREFELT $ 61))
                      . #5#)
                (EXIT
                 (COND
                  ((QEQCAR |pp| 0)
                   (PROGN
                    (LETT #4# (CONS 0 (QCDR |pp|)) . #5#)
                    (GO #6=#:G1065)))
                  ('T
                   (PROGN (LETT #4# (CONS 1 (QCDR |pp|)) . #5#) (GO #6#)))))))
          #6# (EXIT #4#)))) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;44|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;45|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;46|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;47|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;48| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;48|
        ((|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         (|l| |List| (|List| F)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Mapping| (|Union| #1# #2# #3#)
          (|List| (|SparseUnivariatePolynomial| S))))
        |check|) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;49|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPROG
         ((#4=#:G1109 NIL)
          (|pp|
           (|Union| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|)))
                    (|Boolean|)))
          (|checkPF|
           (|Mapping| (|Union| #1# #2# #3#)
                      (|List| (|SparseUnivariatePolynomial| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ (LETT |checkPF| |check| . #5=(|MODHPS;HP_solve;LL2SNniMMU;49|))
                (LETT |pp|
                      (SPADCALL |l| |degs| |kind| (QREFELT $ 56) |sigma| |gen|
                                |checkPF| (QREFELT $ 61))
                      . #5#)
                (EXIT
                 (COND
                  ((QEQCAR |pp| 0)
                   (PROGN
                    (LETT #4# (CONS 0 (QCDR |pp|)) . #5#)
                    (GO #6=#:G1108)))
                  ('T
                   (PROGN (LETT #4# (CONS 1 (QCDR |pp|)) . #5#) (GO #6#)))))))
          #6# (EXIT #4#)))) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;50|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;51|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;52|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;53|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;54| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;54|
        ((|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         (|l| |List| (|List| F)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Mapping| (|Union| #1# #2# #3#)
          (|List| (|SparseUnivariatePolynomial| S))))
        |check|) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;55|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPADCALL |l| |degs| |kind| |qvar| |sigma| |gen| |check|
                  (QREFELT $ 54))) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;56| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;56|
        ((|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         (|l| |List| (|List| F)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Mapping| (|Union| #1# #2# #3#)
          (|List| (|SparseUnivariatePolynomial| S))))
        |check|) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;57|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPROG
         ((#4=#:G1170 NIL)
          (|pp|
           (|Union| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|)))
                    (|Boolean|)))
          (|checkPF|
           (|Mapping| (|Union| #1# #2# #3#)
                      (|List| (|SparseUnivariatePolynomial| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ (LETT |checkPF| |check| . #5=(|MODHPS;HP_solve;LL2SNniMMU;57|))
                (LETT |pp|
                      (SPADCALL |l| |degs| |kind| (QREFELT $ 56) |sigma| |gen|
                                |checkPF| (QREFELT $ 61))
                      . #5#)
                (EXIT
                 (COND
                  ((QEQCAR |pp| 0)
                   (PROGN
                    (LETT #4# (CONS 0 (QCDR |pp|)) . #5#)
                    (GO #6=#:G1169)))
                  ('T
                   (PROGN (LETT #4# (CONS 1 (QCDR |pp|)) . #5#) (GO #6#)))))))
          #6# (EXIT #4#)))) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;58|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;59|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;60|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;61|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;62| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;62|
        ((|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         (|l| |List| (|List| F)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Mapping| (|Union| #1# #2# #3#)
          (|List| (|SparseUnivariatePolynomial| S))))
        |check|) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;63|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPROG
         ((#4=#:G1213 NIL)
          (|pp|
           (|Union| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|)))
                    (|Boolean|)))
          (|checkPF|
           (|Mapping| (|Union| #1# #2# #3#)
                      (|List| (|SparseUnivariatePolynomial| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ (LETT |checkPF| |check| . #5=(|MODHPS;HP_solve;LL2SNniMMU;63|))
                (LETT |pp|
                      (SPADCALL |l| |degs| |kind| (QREFELT $ 56) |sigma| |gen|
                                |checkPF| (QREFELT $ 61))
                      . #5#)
                (EXIT
                 (COND
                  ((QEQCAR |pp| 0)
                   (PROGN
                    (LETT #4# (CONS 0 (QCDR |pp|)) . #5#)
                    (GO #6=#:G1212)))
                  ('T
                   (PROGN (LETT #4# (CONS 1 (QCDR |pp|)) . #5#) (GO #6#)))))))
          #6# (EXIT #4#)))) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;64|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;65|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;66|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;67|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;68| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;68|
        ((|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         (|l| |List| (|List| F)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Mapping| (|Union| #1# #2# #3#)
          (|List| (|SparseUnivariatePolynomial| S))))
        |check|) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;69|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPADCALL |l| |degs| |kind| |qvar| |sigma| |gen| |check|
                  (QREFELT $ 40))) 

(SDEFUN |MODHPS;LLF_to_LPA;LILLIU;70|
        ((|l| |List| (|List| F)) (|sigma| |Integer|) (|vars| |List| (|Symbol|))
         (|points| |List| (|Integer|)) (|p| |Integer|)
         ($ |Union| (|List| (|U32Vector|)) "failed"))
        (SPADCALL |l| |sigma| |vars| |points| (QREFELT $ 56) (QREFELT $ 41))) 

(SDEFUN |MODHPS;VSUPS_to_VPA;VLLIV;71|
        ((|v| |Vector| (|SparseUnivariatePolynomial| S))
         (|vars| |List| (|Symbol|)) (|points| |List| (|Integer|))
         (|p| |Integer|) ($ |Vector| (|U32Vector|)))
        (SPADCALL |v| |vars| |points| (QREFELT $ 56) (QREFELT $ 43))) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;72|
        ((|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         (|l| |List| (|List| F)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Mapping| (|Union| #1# #2# #3#)
          (|List| (|SparseUnivariatePolynomial| S))))
        (SPROG ((|vars| (|List| (|Symbol|))))
               (SEQ
                (COND
                 ((NULL (SPADCALL |kind| '|diffHP| (QREFELT $ 44)))
                  (COND
                   ((NULL (SPADCALL |kind| '|qdiffHP| (QREFELT $ 44)))
                    (COND
                     ((NULL (SPADCALL |kind| '|qmixed| (QREFELT $ 44)))
                      (EXIT |check|)))))))
                (LETT |vars|
                      (SPADCALL (SPADCALL |l| |kind| |qvar| (QREFELT $ 45))
                                (QREFELT $ 46))
                      |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;72|)
                (EXIT
                 (CONS #'|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;72!0|
                       (VECTOR |vars| |qvar| |gen| |sigma| |l| $)))))) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;72!0| ((|x| NIL) ($$ NIL))
        (PROG ($ |l| |sigma| |gen| |qvar| |vars|)
          (LETT $ (QREFELT $$ 5)
                . #1=(|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;72|))
          (LETT |l| (QREFELT $$ 4) . #1#)
          (LETT |sigma| (QREFELT $$ 3) . #1#)
          (LETT |gen| (QREFELT $$ 2) . #1#)
          (LETT |qvar| (QREFELT $$ 1) . #1#)
          (LETT |vars| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|MODHPS;check_sol_mod_diff| (SPADCALL |x| (QREFELT $ 35)) |l|
             |sigma| |gen| |qvar| |vars| $))))) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;73|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPADCALL |l| |degs| |kind| |sigma| |gen| |check| (QREFELT $ 50))) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;74| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;74|
        ((|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         (|l| |List| (|List| F)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Mapping| (|Union| #1# #2# #3#)
          (|List| (|SparseUnivariatePolynomial| S))))
        |check|) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;75|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPADCALL |l| |degs| |kind| |qvar| |sigma| |gen| |check|
                  (QREFELT $ 54))) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;76| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;76|
        ((|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         (|l| |List| (|List| F)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Mapping| (|Union| #1# #2# #3#)
          (|List| (|SparseUnivariatePolynomial| S))))
        |check|) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;77|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPROG
         ((#4=#:G1323 NIL)
          (|pp|
           (|Union| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|)))
                    (|Boolean|)))
          (|checkPF|
           (|Mapping| (|Union| #1# #2# #3#)
                      (|List| (|SparseUnivariatePolynomial| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ (LETT |checkPF| |check| . #5=(|MODHPS;HP_solve;LL2SNniMMU;77|))
                (LETT |pp|
                      (SPADCALL |l| |degs| |kind| (QREFELT $ 56) |sigma| |gen|
                                |checkPF| (QREFELT $ 61))
                      . #5#)
                (EXIT
                 (COND
                  ((QEQCAR |pp| 0)
                   (PROGN
                    (LETT #4# (CONS 0 (QCDR |pp|)) . #5#)
                    (GO #6=#:G1322)))
                  ('T
                   (PROGN (LETT #4# (CONS 1 (QCDR |pp|)) . #5#) (GO #6#)))))))
          #6# (EXIT #4#)))) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;78|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;79|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;80|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;81|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;82| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;82|
        ((|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         (|l| |List| (|List| F)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Mapping| (|Union| #1# #2# #3#)
          (|List| (|SparseUnivariatePolynomial| S))))
        |check|) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;83|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPROG
         ((#4=#:G1366 NIL)
          (|pp|
           (|Union| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|)))
                    (|Boolean|)))
          (|checkPF|
           (|Mapping| (|Union| #1# #2# #3#)
                      (|List| (|SparseUnivariatePolynomial| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ (LETT |checkPF| |check| . #5=(|MODHPS;HP_solve;LL2SNniMMU;83|))
                (LETT |pp|
                      (SPADCALL |l| |degs| |kind| (QREFELT $ 56) |sigma| |gen|
                                |checkPF| (QREFELT $ 61))
                      . #5#)
                (EXIT
                 (COND
                  ((QEQCAR |pp| 0)
                   (PROGN
                    (LETT #4# (CONS 0 (QCDR |pp|)) . #5#)
                    (GO #6=#:G1365)))
                  ('T
                   (PROGN (LETT #4# (CONS 1 (QCDR |pp|)) . #5#) (GO #6#)))))))
          #6# (EXIT #4#)))) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;84|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;85|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;86|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;87|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;88| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;88|
        ((|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         (|l| |List| (|List| F)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Mapping| (|Union| #1# #2# #3#)
          (|List| (|SparseUnivariatePolynomial| S))))
        |check|) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;89|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPADCALL |l| |degs| |kind| |qvar| |sigma| |gen| |check|
                  (QREFELT $ 54))) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;90| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;90|
        ((|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         (|l| |List| (|List| F)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Mapping| (|Union| #1# #2# #3#)
          (|List| (|SparseUnivariatePolynomial| S))))
        |check|) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;91|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPROG
         ((#4=#:G1427 NIL)
          (|pp|
           (|Union| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|)))
                    (|Boolean|)))
          (|checkPF|
           (|Mapping| (|Union| #1# #2# #3#)
                      (|List| (|SparseUnivariatePolynomial| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ (LETT |checkPF| |check| . #5=(|MODHPS;HP_solve;LL2SNniMMU;91|))
                (LETT |pp|
                      (SPADCALL |l| |degs| |kind| (QREFELT $ 56) |sigma| |gen|
                                |checkPF| (QREFELT $ 61))
                      . #5#)
                (EXIT
                 (COND
                  ((QEQCAR |pp| 0)
                   (PROGN
                    (LETT #4# (CONS 0 (QCDR |pp|)) . #5#)
                    (GO #6=#:G1426)))
                  ('T
                   (PROGN (LETT #4# (CONS 1 (QCDR |pp|)) . #5#) (GO #6#)))))))
          #6# (EXIT #4#)))) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;92|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;93|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;94|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;95|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;96| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;96|
        ((|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         (|l| |List| (|List| F)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Mapping| (|Union| #1# #2# #3#)
          (|List| (|SparseUnivariatePolynomial| S))))
        |check|) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;97|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPROG
         ((#4=#:G1470 NIL)
          (|pp|
           (|Union| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|)))
                    (|Boolean|)))
          (|checkPF|
           (|Mapping| (|Union| #1# #2# #3#)
                      (|List| (|SparseUnivariatePolynomial| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ (LETT |checkPF| |check| . #5=(|MODHPS;HP_solve;LL2SNniMMU;97|))
                (LETT |pp|
                      (SPADCALL |l| |degs| |kind| (QREFELT $ 56) |sigma| |gen|
                                |checkPF| (QREFELT $ 61))
                      . #5#)
                (EXIT
                 (COND
                  ((QEQCAR |pp| 0)
                   (PROGN
                    (LETT #4# (CONS 0 (QCDR |pp|)) . #5#)
                    (GO #6=#:G1469)))
                  ('T
                   (PROGN (LETT #4# (CONS 1 (QCDR |pp|)) . #5#) (GO #6#)))))))
          #6# (EXIT #4#)))) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;98|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;99|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;100|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;101|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;102| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;102|
        ((|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         (|l| |List| (|List| F)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Mapping| (|Union| #1# #2# #3#)
          (|List| (|SparseUnivariatePolynomial| S))))
        |check|) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;103|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPADCALL |l| |degs| |kind| |sigma| |gen| |check| (QREFELT $ 50))) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;104| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;104|
        ((|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         (|l| |List| (|List| F)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Mapping| (|Union| #1# #2# #3#)
          (|List| (|SparseUnivariatePolynomial| S))))
        |check|) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;105|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPADCALL |l| |degs| |kind| |qvar| |sigma| |gen| |check|
                  (QREFELT $ 54))) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;106| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;106|
        ((|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         (|l| |List| (|List| F)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Mapping| (|Union| #1# #2# #3#)
          (|List| (|SparseUnivariatePolynomial| S))))
        |check|) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;107|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPROG
         ((#4=#:G1549 NIL)
          (|pp|
           (|Union| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|)))
                    (|Boolean|)))
          (|checkPF|
           (|Mapping| (|Union| #1# #2# #3#)
                      (|List| (|SparseUnivariatePolynomial| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |checkPF| |check| . #5=(|MODHPS;HP_solve;LL2SNniMMU;107|))
            (LETT |pp|
                  (SPADCALL |l| |degs| |kind| (QREFELT $ 56) |sigma| |gen|
                            |checkPF| (QREFELT $ 61))
                  . #5#)
            (EXIT
             (COND
              ((QEQCAR |pp| 0)
               (PROGN (LETT #4# (CONS 0 (QCDR |pp|)) . #5#) (GO #6=#:G1548)))
              ('T (PROGN (LETT #4# (CONS 1 (QCDR |pp|)) . #5#) (GO #6#)))))))
          #6# (EXIT #4#)))) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;108|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;109|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;110|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;111|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;112| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;112|
        ((|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         (|l| |List| (|List| F)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Mapping| (|Union| #1# #2# #3#)
          (|List| (|SparseUnivariatePolynomial| S))))
        |check|) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;113|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPROG
         ((#4=#:G1592 NIL)
          (|pp|
           (|Union| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|)))
                    (|Boolean|)))
          (|checkPF|
           (|Mapping| (|Union| #1# #2# #3#)
                      (|List| (|SparseUnivariatePolynomial| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |checkPF| |check| . #5=(|MODHPS;HP_solve;LL2SNniMMU;113|))
            (LETT |pp|
                  (SPADCALL |l| |degs| |kind| (QREFELT $ 56) |sigma| |gen|
                            |checkPF| (QREFELT $ 61))
                  . #5#)
            (EXIT
             (COND
              ((QEQCAR |pp| 0)
               (PROGN (LETT #4# (CONS 0 (QCDR |pp|)) . #5#) (GO #6=#:G1591)))
              ('T (PROGN (LETT #4# (CONS 1 (QCDR |pp|)) . #5#) (GO #6#)))))))
          #6# (EXIT #4#)))) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;114|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;115|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;116|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;117|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;118| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;118|
        ((|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         (|l| |List| (|List| F)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Mapping| (|Union| #1# #2# #3#)
          (|List| (|SparseUnivariatePolynomial| S))))
        |check|) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;119|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPADCALL |l| |degs| |kind| |qvar| |sigma| |gen| |check|
                  (QREFELT $ 54))) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;120| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;120|
        ((|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         (|l| |List| (|List| F)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Mapping| (|Union| #1# #2# #3#)
          (|List| (|SparseUnivariatePolynomial| S))))
        |check|) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;121|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPROG
         ((#4=#:G1653 NIL)
          (|pp|
           (|Union| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|)))
                    (|Boolean|)))
          (|checkPF|
           (|Mapping| (|Union| #1# #2# #3#)
                      (|List| (|SparseUnivariatePolynomial| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |checkPF| |check| . #5=(|MODHPS;HP_solve;LL2SNniMMU;121|))
            (LETT |pp|
                  (SPADCALL |l| |degs| |kind| (QREFELT $ 56) |sigma| |gen|
                            |checkPF| (QREFELT $ 61))
                  . #5#)
            (EXIT
             (COND
              ((QEQCAR |pp| 0)
               (PROGN (LETT #4# (CONS 0 (QCDR |pp|)) . #5#) (GO #6=#:G1652)))
              ('T (PROGN (LETT #4# (CONS 1 (QCDR |pp|)) . #5#) (GO #6#)))))))
          #6# (EXIT #4#)))) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;122|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;123|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;124|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;125|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;126| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;126|
        ((|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         (|l| |List| (|List| F)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Mapping| (|Union| #1# #2# #3#)
          (|List| (|SparseUnivariatePolynomial| S))))
        |check|) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;127|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPROG
         ((#4=#:G1696 NIL)
          (|pp|
           (|Union| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|)))
                    (|Boolean|)))
          (|checkPF|
           (|Mapping| (|Union| #1# #2# #3#)
                      (|List| (|SparseUnivariatePolynomial| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |checkPF| |check| . #5=(|MODHPS;HP_solve;LL2SNniMMU;127|))
            (LETT |pp|
                  (SPADCALL |l| |degs| |kind| (QREFELT $ 56) |sigma| |gen|
                            |checkPF| (QREFELT $ 61))
                  . #5#)
            (EXIT
             (COND
              ((QEQCAR |pp| 0)
               (PROGN (LETT #4# (CONS 0 (QCDR |pp|)) . #5#) (GO #6=#:G1695)))
              ('T (PROGN (LETT #4# (CONS 1 (QCDR |pp|)) . #5#) (GO #6#)))))))
          #6# (EXIT #4#)))) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;128|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;129|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;130|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHPS;HP_solve;LL2SNniMMU;131|
        ((|l| |List| (|List| F)) (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|qvar| |Symbol|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (CONS 1 'T)) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;132| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(SDEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;132|
        ((|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| S)))
         (|l| |List| (|List| F)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Mapping| (|Union| #1# #2# #3#)
          (|List| (|SparseUnivariatePolynomial| S))))
        |check|) 

(SDEFUN |MODHPS;check_sol_mod_diff|
        ((|resv| |Vector| (|SparseUnivariatePolynomial| S))
         (|list| |List| (|List| F)) (|sigma| |Integer|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|qvar| |Symbol|) (|vars| |List| (|Symbol|))
         ($ |Union| "good" "reject" "no_solution"))
        (SPROG
         ((#1=#:G1762 NIL) (|min_ord| #2=(|NonNegativeInteger|))
          (#3=#:G1760 NIL) (|delta| (|Integer|)) (|sigma0| #2#)
          (|pa| (|U32Vector|)) (#4=#:G1765 NIL) (|j| NIL) (|c0| (|Integer|))
          (#5=#:G1761 NIL) (|ord| #2#) (#6=#:G1764 NIL) (|i| NIL)
          (|nres| (|Vector| (|U32Vector|))) (|gv0| (|U32Vector|))
          (|gvl| (|List| (|U32Vector|)))
          (|gv0p| (|Union| (|List| (|U32Vector|)) "failed"))
          (|lpt| (|List| (|Integer|))) (|qval| (|Integer|)) (#7=#:G1763 NIL)
          (|var| NIL) (|ii| NIL) (|n0| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (LENGTH |list|) 1 (QREFELT $ 62))
             (|error| "check_sol_mod_diff: #list ~= 1"))
            (#8='T
             (SEQ
              (LETT |n0| (LENGTH (|SPADfirst| |list|))
                    . #9=(|MODHPS;check_sol_mod_diff|))
              (LETT |sigma0| (+ |n0| 2) . #9#) (LETT |min_ord| |sigma0| . #9#)
              (LETT |delta| (- |sigma0| |sigma|) . #9#)
              (EXIT
               (COND ((>= |delta| |sigma|) (|error| "delta too big"))
                     (#8#
                      (SEQ
                       (SEQ (LETT |ii| 1 . #9#) G190
                            (COND ((|greater_SI| |ii| 20) (GO G191)))
                            (SEQ
                             (SETELT $ 56
                                     (SPADCALL (+ (RANDOM 2000000) 2000000)
                                               (QREFELT $ 65)))
                             (LETT |lpt| NIL . #9#) (LETT |qval| 0 . #9#)
                             (SEQ (LETT |var| NIL . #9#)
                                  (LETT #7# |vars| . #9#) G190
                                  (COND
                                   ((OR (ATOM #7#)
                                        (PROGN
                                         (LETT |var| (CAR #7#) . #9#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (LETT |lpt|
                                         (CONS (RANDOM (QREFELT $ 56)) |lpt|)
                                         . #9#)
                                   (EXIT
                                    (COND
                                     ((EQUAL |var| |qvar|)
                                      (LETT |qval| (|SPADfirst| |lpt|)
                                            . #9#)))))
                                  (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                                  (EXIT NIL))
                             (LETT |lpt| (NREVERSE |lpt|) . #9#)
                             (LETT |gv0p|
                                   (SPADCALL |list| (+ |n0| |delta|) |vars|
                                             |lpt| (QREFELT $ 56)
                                             (QREFELT $ 26))
                                   . #9#)
                             (EXIT
                              (COND ((QEQCAR |gv0p| 1) "iterate")
                                    ('T
                                     (SEQ (LETT |gvl| (QCDR |gv0p|) . #9#)
                                          (EXIT
                                           (COND
                                            ((SPADCALL (LENGTH |gvl|) 1
                                                       (QREFELT $ 66))
                                             "check_sol_mod_diff: #gvl ~= 1")
                                            ('T
                                             (SEQ
                                              (LETT |gv0| (|SPADfirst| |gvl|)
                                                    . #9#)
                                              (LETT |nres|
                                                    (SPADCALL |resv| |vars|
                                                              |lpt|
                                                              (QREFELT $ 56)
                                                              (QREFELT $ 31))
                                                    . #9#)
                                              (LETT |pa|
                                                    (SPADCALL |nres| |gvl|
                                                              |gen| |sigma0|
                                                              |qval|
                                                              (QREFELT $ 56)
                                                              (QREFELT $ 69))
                                                    . #9#)
                                              (LETT |ord| |sigma0| . #9#)
                                              (SEQ
                                               (EXIT
                                                (SEQ (LETT |i| 0 . #9#)
                                                     (LETT #6# (- |sigma0| 1)
                                                           . #9#)
                                                     G190
                                                     (COND
                                                      ((|greater_SI| |i| #6#)
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (COND
                                                        ((SPADCALL
                                                          (ELT_U32 |pa| |i|) 0
                                                          (QREFELT $ 62))
                                                         (SEQ
                                                          (LETT |ord| |i|
                                                                . #9#)
                                                          (EXIT
                                                           (PROGN
                                                            (LETT #5#
                                                                  |$NoValue|
                                                                  . #9#)
                                                            (GO
                                                             #10=#:G1744))))))))
                                                     (LETT |i| (|inc_SI| |i|)
                                                           . #9#)
                                                     (GO G190) G191
                                                     (EXIT NIL)))
                                               #10# (EXIT #5#))
                                              (EXIT
                                               (COND
                                                ((< |ord| |sigma|)
                                                 (PROGN
                                                  (LETT #1#
                                                        (CONS 2 "no_solution")
                                                        . #9#)
                                                  (GO #11=#:G1759)))
                                                ((< |ord| |sigma0|)
                                                 (SEQ
                                                  (LETT |c0|
                                                        (ELT_U32 |pa| |ord|)
                                                        . #9#)
                                                  (SEQ
                                                   (EXIT
                                                    (SEQ (LETT |j| 0 . #9#)
                                                         (LETT #4#
                                                               (- |delta| 1)
                                                               . #9#)
                                                         G190
                                                         (COND
                                                          ((|greater_SI| |j|
                                                                         #4#)
                                                           (GO G191)))
                                                         (SEQ
                                                          (SETELT_U32 |gv0|
                                                                      (+ |n0|
                                                                         |j|)
                                                                      1)
                                                          (LETT |pa|
                                                                (SPADCALL
                                                                 |nres|
                                                                 (LIST |gv0|)
                                                                 |gen| |sigma0|
                                                                 |qval|
                                                                 (QREFELT $ 56)
                                                                 (QREFELT $
                                                                          69))
                                                                . #9#)
                                                          (EXIT
                                                           (COND
                                                            ((SPADCALL
                                                              (ELT_U32 |pa|
                                                                       |ord|)
                                                              |c0|
                                                              (QREFELT $ 62))
                                                             (SEQ
                                                              (LETT |sigma0|
                                                                    |ord|
                                                                    . #9#)
                                                              (LETT |delta|
                                                                    (- |sigma0|
                                                                       |sigma|)
                                                                    . #9#)
                                                              (EXIT
                                                               (PROGN
                                                                (LETT #3#
                                                                      |$NoValue|
                                                                      . #9#)
                                                                (GO
                                                                 #12=#:G1750)))))
                                                            ('T
                                                             (SETELT_U32 |gv0|
                                                                         (+
                                                                          |n0|
                                                                          |j|)
                                                                         0)))))
                                                         (LETT |j|
                                                               (|inc_SI| |j|)
                                                               . #9#)
                                                         (GO G190) G191
                                                         (EXIT NIL)))
                                                   #12# (EXIT #3#))
                                                  (EXIT
                                                   (COND
                                                    ((< |ord| |min_ord|)
                                                     (LETT |min_ord| |ord|
                                                           . #9#)))))))))))))))))
                            (LETT |ii| (|inc_SI| |ii|) . #9#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT
                        (COND
                         ((< |min_ord| |sigma0|)
                          (PROGN (LETT #1# (CONS 1 "reject") . #9#) (GO #11#)))
                         (#8#
                          (PROGN
                           (LETT #1# (CONS 0 "good") . #9#)
                           (GO #11#)))))))))))))
          #11# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |ModularHermitePadeSolver;|)) 

(DEFUN |ModularHermitePadeSolver| (&REST #1=#:G1766)
  (SPROG NIL
         (PROG (#2=#:G1767)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ModularHermitePadeSolver|)
                                               '|domainEqualList|)
                    . #3=(|ModularHermitePadeSolver|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ModularHermitePadeSolver;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ModularHermitePadeSolver|)))))))))) 

(DEFUN |ModularHermitePadeSolver;| (|#1| |#2|)
  (SPROG
   ((#1=#:G1678 NIL) (#2=#:G1676 NIL) (#3=#:G1635 NIL) (#4=#:G1633 NIL)
    (#5=#:G1574 NIL) (#6=#:G1572 NIL) (#7=#:G1531 NIL) (#8=#:G1529 NIL)
    (#9=#:G1452 NIL) (#10=#:G1450 NIL) (#11=#:G1409 NIL) (#12=#:G1407 NIL)
    (#13=#:G1348 NIL) (#14=#:G1346 NIL) (#15=#:G1305 NIL) (#16=#:G1303 NIL)
    (#17=#:G1195 NIL) (#18=#:G1193 NIL) (#19=#:G1152 NIL) (#20=#:G1150 NIL)
    (#21=#:G1091 NIL) (#22=#:G1089 NIL) (#23=#:G1048 NIL) (#24=#:G1046 NIL)
    (#25=#:G969 NIL) (#26=#:G967 NIL) (#27=#:G926 NIL) (#28=#:G924 NIL)
    (#29=#:G865 NIL) (#30=#:G863 NIL) (#31=#:G822 NIL) (#32=#:G820 NIL)
    (|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #33=(|ModularHermitePadeSolver|))
    (LETT DV$2 (|devaluate| |#2|) . #33#)
    (LETT |dv$| (LIST '|ModularHermitePadeSolver| DV$1 DV$2) . #33#)
    (LETT $ (GETREFV 72) . #33#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #33#))
    (|haddProp| |$ConstructorCache| '|ModularHermitePadeSolver|
                (LIST DV$1 DV$2) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|domainEqual| |#1| (|Fraction| (|Integer|)))
      (COND
       ((|domainEqual| |#2| (|Integer|))
        (PROGN
         (QSETREFV $ 21
                   (CONS (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;1|)
                         $))
         (QSETREFV $ 26
                   (CONS (|dispatchFunction| |MODHPS;LLF_to_LPA;LILLIU;2|) $))
         (QSETREFV $ 31
                   (CONS (|dispatchFunction| |MODHPS;VSUPS_to_VPA;VLLIV;3|) $))
         (QSETREFV $ 36
                   (CONS
                    (|dispatchFunction|
                     |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;4|)
                    $))))
       ((|domainEqual| |#1| (|Fraction| (|Polynomial| (|Integer|))))
        (COND
         ((|domainEqual| |#2| (|Polynomial| (|Integer|)))
          (PROGN
           (QSETREFV $ 21
                     (CONS (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;5|)
                           $))
           (QSETREFV $ 26
                     (CONS (|dispatchFunction| |MODHPS;LLF_to_LPA;LILLIU;6|)
                           $))
           (QSETREFV $ 31
                     (CONS (|dispatchFunction| |MODHPS;VSUPS_to_VPA;VLLIV;7|)
                           $))
           (QSETREFV $ 36
                     (CONS
                      (|dispatchFunction|
                       |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;8|)
                      $))))
         ((|domainEqual| |#1| (|AlgebraicNumber|))
          (COND
           ((|domainEqual| |#2| (|AlgebraicNumber|))
            (PROGN
             (QSETREFV $ 21
                       (CONS
                        (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;9|) $))
             (QSETREFV $ 36
                       (CONS
                        (|dispatchFunction|
                         |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;10|)
                        $))))
           ((|domainEqual| |#1|
                           (|Fraction| (|Polynomial| (|AlgebraicNumber|))))
            (COND
             ((|domainEqual| |#2| (|Polynomial| (|AlgebraicNumber|)))
              (PROGN
               (QSETREFV $ 21
                         (CONS
                          (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;11|)
                          $))
               (QSETREFV $ 36
                         (CONS
                          (|dispatchFunction|
                           |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;12|)
                          $))))
             ('T
              (PROGN
               (QSETREFV $ 56 (SPADCALL (QREFELT $ 55)))
               (COND
                ((SPADCALL (QREFELT $ 56) 0 (QREFELT $ 59))
                 (COND
                  ((< (QREFELT $ 56) 32000000)
                   (COND
                    ((|domainEqual| |#1|
                                    (|PrimeField|
                                     (PROG1 (LETT #32# (QREFELT $ 56) . #33#)
                                       (|check_subtype2| (> #32# 0)
                                                         '(|PositiveInteger|)
                                                         '(|NonNegativeInteger|)
                                                         #32#))))
                     (COND
                      ((|domainEqual| |#2|
                                      (|PrimeField|
                                       (PROG1 (LETT #31# (QREFELT $ 56) . #33#)
                                         (|check_subtype2| (> #31# 0)
                                                           '(|PositiveInteger|)
                                                           '(|NonNegativeInteger|)
                                                           #31#))))
                       (QSETREFV $ 21
                                 (CONS
                                  (|dispatchFunction|
                                   |MODHPS;HP_solve;LL2SNniMMU;13|)
                                  $)))
                      ('T
                       (QSETREFV $ 21
                                 (CONS
                                  (|dispatchFunction|
                                   |MODHPS;HP_solve;LL2SNniMMU;14|)
                                  $)))))
                    ('T
                     (QSETREFV $ 21
                               (CONS
                                (|dispatchFunction|
                                 |MODHPS;HP_solve;LL2SNniMMU;15|)
                                $)))))
                  ('T
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;16|)
                              $)))))
                ('T
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;17|)
                            $))))
               (QSETREFV $ 36
                         (CONS
                          (|dispatchFunction|
                           |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;18|)
                          $))))))
           ('T
            (PROGN
             (SETELT $ 56 (SPADCALL (QREFELT $ 55)))
             (COND
              ((SPADCALL (QREFELT $ 56) 0 (QREFELT $ 59))
               (COND
                ((< (QREFELT $ 56) 32000000)
                 (COND
                  ((|domainEqual| |#1|
                                  (|PrimeField|
                                   (PROG1 (LETT #30# (QREFELT $ 56) . #33#)
                                     (|check_subtype2| (> #30# 0)
                                                       '(|PositiveInteger|)
                                                       '(|NonNegativeInteger|)
                                                       #30#))))
                   (COND
                    ((|domainEqual| |#2|
                                    (|PrimeField|
                                     (PROG1 (LETT #29# (QREFELT $ 56) . #33#)
                                       (|check_subtype2| (> #29# 0)
                                                         '(|PositiveInteger|)
                                                         '(|NonNegativeInteger|)
                                                         #29#))))
                     (QSETREFV $ 21
                               (CONS
                                (|dispatchFunction|
                                 |MODHPS;HP_solve;LL2SNniMMU;19|)
                                $)))
                    ('T
                     (QSETREFV $ 21
                               (CONS
                                (|dispatchFunction|
                                 |MODHPS;HP_solve;LL2SNniMMU;20|)
                                $)))))
                  ('T
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;21|)
                              $)))))
                ('T
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;22|)
                            $)))))
              ('T
               (QSETREFV $ 21
                         (CONS
                          (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;23|)
                          $))))
             (QSETREFV $ 36
                       (CONS
                        (|dispatchFunction|
                         |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;24|)
                        $))))))
         ((|domainEqual| |#1| (|Fraction| (|Polynomial| (|AlgebraicNumber|))))
          (COND
           ((|domainEqual| |#2| (|Polynomial| (|AlgebraicNumber|)))
            (PROGN
             (QSETREFV $ 21
                       (CONS
                        (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;25|)
                        $))
             (QSETREFV $ 36
                       (CONS
                        (|dispatchFunction|
                         |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;26|)
                        $))))
           ('T
            (PROGN
             (SETELT $ 56 (SPADCALL (QREFELT $ 55)))
             (COND
              ((SPADCALL (QREFELT $ 56) 0 (QREFELT $ 59))
               (COND
                ((< (QREFELT $ 56) 32000000)
                 (COND
                  ((|domainEqual| |#1|
                                  (|PrimeField|
                                   (PROG1 (LETT #28# (QREFELT $ 56) . #33#)
                                     (|check_subtype2| (> #28# 0)
                                                       '(|PositiveInteger|)
                                                       '(|NonNegativeInteger|)
                                                       #28#))))
                   (COND
                    ((|domainEqual| |#2|
                                    (|PrimeField|
                                     (PROG1 (LETT #27# (QREFELT $ 56) . #33#)
                                       (|check_subtype2| (> #27# 0)
                                                         '(|PositiveInteger|)
                                                         '(|NonNegativeInteger|)
                                                         #27#))))
                     (QSETREFV $ 21
                               (CONS
                                (|dispatchFunction|
                                 |MODHPS;HP_solve;LL2SNniMMU;27|)
                                $)))
                    ('T
                     (QSETREFV $ 21
                               (CONS
                                (|dispatchFunction|
                                 |MODHPS;HP_solve;LL2SNniMMU;28|)
                                $)))))
                  ('T
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;29|)
                              $)))))
                ('T
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;30|)
                            $)))))
              ('T
               (QSETREFV $ 21
                         (CONS
                          (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;31|)
                          $))))
             (QSETREFV $ 36
                       (CONS
                        (|dispatchFunction|
                         |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;32|)
                        $))))))
         ('T
          (PROGN
           (SETELT $ 56 (SPADCALL (QREFELT $ 55)))
           (COND
            ((SPADCALL (QREFELT $ 56) 0 (QREFELT $ 59))
             (COND
              ((< (QREFELT $ 56) 32000000)
               (COND
                ((|domainEqual| |#1|
                                (|PrimeField|
                                 (PROG1 (LETT #26# (QREFELT $ 56) . #33#)
                                   (|check_subtype2| (> #26# 0)
                                                     '(|PositiveInteger|)
                                                     '(|NonNegativeInteger|)
                                                     #26#))))
                 (COND
                  ((|domainEqual| |#2|
                                  (|PrimeField|
                                   (PROG1 (LETT #25# (QREFELT $ 56) . #33#)
                                     (|check_subtype2| (> #25# 0)
                                                       '(|PositiveInteger|)
                                                       '(|NonNegativeInteger|)
                                                       #25#))))
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;33|)
                              $)))
                  ('T
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;34|)
                              $)))))
                ('T
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;35|)
                            $)))))
              ('T
               (QSETREFV $ 21
                         (CONS
                          (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;36|)
                          $)))))
            ('T
             (QSETREFV $ 21
                       (CONS
                        (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;37|)
                        $))))
           (QSETREFV $ 36
                     (CONS
                      (|dispatchFunction|
                       |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;38|)
                      $))))))
       ((|domainEqual| |#1| (|AlgebraicNumber|))
        (COND
         ((|domainEqual| |#2| (|AlgebraicNumber|))
          (PROGN
           (QSETREFV $ 21
                     (CONS (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;39|)
                           $))
           (QSETREFV $ 36
                     (CONS
                      (|dispatchFunction|
                       |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;40|)
                      $))))
         ((|domainEqual| |#1| (|Fraction| (|Polynomial| (|AlgebraicNumber|))))
          (COND
           ((|domainEqual| |#2| (|Polynomial| (|AlgebraicNumber|)))
            (PROGN
             (QSETREFV $ 21
                       (CONS
                        (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;41|)
                        $))
             (QSETREFV $ 36
                       (CONS
                        (|dispatchFunction|
                         |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;42|)
                        $))))
           ('T
            (PROGN
             (SETELT $ 56 (SPADCALL (QREFELT $ 55)))
             (COND
              ((SPADCALL (QREFELT $ 56) 0 (QREFELT $ 59))
               (COND
                ((< (QREFELT $ 56) 32000000)
                 (COND
                  ((|domainEqual| |#1|
                                  (|PrimeField|
                                   (PROG1 (LETT #24# (QREFELT $ 56) . #33#)
                                     (|check_subtype2| (> #24# 0)
                                                       '(|PositiveInteger|)
                                                       '(|NonNegativeInteger|)
                                                       #24#))))
                   (COND
                    ((|domainEqual| |#2|
                                    (|PrimeField|
                                     (PROG1 (LETT #23# (QREFELT $ 56) . #33#)
                                       (|check_subtype2| (> #23# 0)
                                                         '(|PositiveInteger|)
                                                         '(|NonNegativeInteger|)
                                                         #23#))))
                     (QSETREFV $ 21
                               (CONS
                                (|dispatchFunction|
                                 |MODHPS;HP_solve;LL2SNniMMU;43|)
                                $)))
                    ('T
                     (QSETREFV $ 21
                               (CONS
                                (|dispatchFunction|
                                 |MODHPS;HP_solve;LL2SNniMMU;44|)
                                $)))))
                  ('T
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;45|)
                              $)))))
                ('T
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;46|)
                            $)))))
              ('T
               (QSETREFV $ 21
                         (CONS
                          (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;47|)
                          $))))
             (QSETREFV $ 36
                       (CONS
                        (|dispatchFunction|
                         |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;48|)
                        $))))))
         ('T
          (PROGN
           (SETELT $ 56 (SPADCALL (QREFELT $ 55)))
           (COND
            ((SPADCALL (QREFELT $ 56) 0 (QREFELT $ 59))
             (COND
              ((< (QREFELT $ 56) 32000000)
               (COND
                ((|domainEqual| |#1|
                                (|PrimeField|
                                 (PROG1 (LETT #22# (QREFELT $ 56) . #33#)
                                   (|check_subtype2| (> #22# 0)
                                                     '(|PositiveInteger|)
                                                     '(|NonNegativeInteger|)
                                                     #22#))))
                 (COND
                  ((|domainEqual| |#2|
                                  (|PrimeField|
                                   (PROG1 (LETT #21# (QREFELT $ 56) . #33#)
                                     (|check_subtype2| (> #21# 0)
                                                       '(|PositiveInteger|)
                                                       '(|NonNegativeInteger|)
                                                       #21#))))
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;49|)
                              $)))
                  ('T
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;50|)
                              $)))))
                ('T
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;51|)
                            $)))))
              ('T
               (QSETREFV $ 21
                         (CONS
                          (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;52|)
                          $)))))
            ('T
             (QSETREFV $ 21
                       (CONS
                        (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;53|)
                        $))))
           (QSETREFV $ 36
                     (CONS
                      (|dispatchFunction|
                       |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;54|)
                      $))))))
       ((|domainEqual| |#1| (|Fraction| (|Polynomial| (|AlgebraicNumber|))))
        (COND
         ((|domainEqual| |#2| (|Polynomial| (|AlgebraicNumber|)))
          (PROGN
           (QSETREFV $ 21
                     (CONS (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;55|)
                           $))
           (QSETREFV $ 36
                     (CONS
                      (|dispatchFunction|
                       |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;56|)
                      $))))
         ('T
          (PROGN
           (SETELT $ 56 (SPADCALL (QREFELT $ 55)))
           (COND
            ((SPADCALL (QREFELT $ 56) 0 (QREFELT $ 59))
             (COND
              ((< (QREFELT $ 56) 32000000)
               (COND
                ((|domainEqual| |#1|
                                (|PrimeField|
                                 (PROG1 (LETT #20# (QREFELT $ 56) . #33#)
                                   (|check_subtype2| (> #20# 0)
                                                     '(|PositiveInteger|)
                                                     '(|NonNegativeInteger|)
                                                     #20#))))
                 (COND
                  ((|domainEqual| |#2|
                                  (|PrimeField|
                                   (PROG1 (LETT #19# (QREFELT $ 56) . #33#)
                                     (|check_subtype2| (> #19# 0)
                                                       '(|PositiveInteger|)
                                                       '(|NonNegativeInteger|)
                                                       #19#))))
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;57|)
                              $)))
                  ('T
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;58|)
                              $)))))
                ('T
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;59|)
                            $)))))
              ('T
               (QSETREFV $ 21
                         (CONS
                          (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;60|)
                          $)))))
            ('T
             (QSETREFV $ 21
                       (CONS
                        (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;61|)
                        $))))
           (QSETREFV $ 36
                     (CONS
                      (|dispatchFunction|
                       |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;62|)
                      $))))))
       ('T
        (PROGN
         (SETELT $ 56 (SPADCALL (QREFELT $ 55)))
         (COND
          ((SPADCALL (QREFELT $ 56) 0 (QREFELT $ 59))
           (COND
            ((< (QREFELT $ 56) 32000000)
             (COND
              ((|domainEqual| |#1|
                              (|PrimeField|
                               (PROG1 (LETT #18# (QREFELT $ 56) . #33#)
                                 (|check_subtype2| (> #18# 0)
                                                   '(|PositiveInteger|)
                                                   '(|NonNegativeInteger|)
                                                   #18#))))
               (COND
                ((|domainEqual| |#2|
                                (|PrimeField|
                                 (PROG1 (LETT #17# (QREFELT $ 56) . #33#)
                                   (|check_subtype2| (> #17# 0)
                                                     '(|PositiveInteger|)
                                                     '(|NonNegativeInteger|)
                                                     #17#))))
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;63|)
                            $)))
                ('T
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;64|)
                            $)))))
              ('T
               (QSETREFV $ 21
                         (CONS
                          (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;65|)
                          $)))))
            ('T
             (QSETREFV $ 21
                       (CONS
                        (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;66|)
                        $)))))
          ('T
           (QSETREFV $ 21
                     (CONS (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;67|)
                           $))))
         (QSETREFV $ 36
                   (CONS
                    (|dispatchFunction|
                     |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;68|)
                    $))))))
     ((|domainEqual| |#1| (|Fraction| (|Polynomial| (|Integer|))))
      (COND
       ((|domainEqual| |#2| (|Polynomial| (|Integer|)))
        (PROGN
         (QSETREFV $ 21
                   (CONS (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;69|)
                         $))
         (QSETREFV $ 26
                   (CONS (|dispatchFunction| |MODHPS;LLF_to_LPA;LILLIU;70|) $))
         (QSETREFV $ 31
                   (CONS (|dispatchFunction| |MODHPS;VSUPS_to_VPA;VLLIV;71|)
                         $))
         (QSETREFV $ 36
                   (CONS
                    (|dispatchFunction|
                     |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;72|)
                    $))))
       ((|domainEqual| |#1| (|AlgebraicNumber|))
        (COND
         ((|domainEqual| |#2| (|AlgebraicNumber|))
          (PROGN
           (QSETREFV $ 21
                     (CONS (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;73|)
                           $))
           (QSETREFV $ 36
                     (CONS
                      (|dispatchFunction|
                       |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;74|)
                      $))))
         ((|domainEqual| |#1| (|Fraction| (|Polynomial| (|AlgebraicNumber|))))
          (COND
           ((|domainEqual| |#2| (|Polynomial| (|AlgebraicNumber|)))
            (PROGN
             (QSETREFV $ 21
                       (CONS
                        (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;75|)
                        $))
             (QSETREFV $ 36
                       (CONS
                        (|dispatchFunction|
                         |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;76|)
                        $))))
           ('T
            (PROGN
             (SETELT $ 56 (SPADCALL (QREFELT $ 55)))
             (COND
              ((SPADCALL (QREFELT $ 56) 0 (QREFELT $ 59))
               (COND
                ((< (QREFELT $ 56) 32000000)
                 (COND
                  ((|domainEqual| |#1|
                                  (|PrimeField|
                                   (PROG1 (LETT #16# (QREFELT $ 56) . #33#)
                                     (|check_subtype2| (> #16# 0)
                                                       '(|PositiveInteger|)
                                                       '(|NonNegativeInteger|)
                                                       #16#))))
                   (COND
                    ((|domainEqual| |#2|
                                    (|PrimeField|
                                     (PROG1 (LETT #15# (QREFELT $ 56) . #33#)
                                       (|check_subtype2| (> #15# 0)
                                                         '(|PositiveInteger|)
                                                         '(|NonNegativeInteger|)
                                                         #15#))))
                     (QSETREFV $ 21
                               (CONS
                                (|dispatchFunction|
                                 |MODHPS;HP_solve;LL2SNniMMU;77|)
                                $)))
                    ('T
                     (QSETREFV $ 21
                               (CONS
                                (|dispatchFunction|
                                 |MODHPS;HP_solve;LL2SNniMMU;78|)
                                $)))))
                  ('T
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;79|)
                              $)))))
                ('T
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;80|)
                            $)))))
              ('T
               (QSETREFV $ 21
                         (CONS
                          (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;81|)
                          $))))
             (QSETREFV $ 36
                       (CONS
                        (|dispatchFunction|
                         |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;82|)
                        $))))))
         ('T
          (PROGN
           (SETELT $ 56 (SPADCALL (QREFELT $ 55)))
           (COND
            ((SPADCALL (QREFELT $ 56) 0 (QREFELT $ 59))
             (COND
              ((< (QREFELT $ 56) 32000000)
               (COND
                ((|domainEqual| |#1|
                                (|PrimeField|
                                 (PROG1 (LETT #14# (QREFELT $ 56) . #33#)
                                   (|check_subtype2| (> #14# 0)
                                                     '(|PositiveInteger|)
                                                     '(|NonNegativeInteger|)
                                                     #14#))))
                 (COND
                  ((|domainEqual| |#2|
                                  (|PrimeField|
                                   (PROG1 (LETT #13# (QREFELT $ 56) . #33#)
                                     (|check_subtype2| (> #13# 0)
                                                       '(|PositiveInteger|)
                                                       '(|NonNegativeInteger|)
                                                       #13#))))
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;83|)
                              $)))
                  ('T
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;84|)
                              $)))))
                ('T
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;85|)
                            $)))))
              ('T
               (QSETREFV $ 21
                         (CONS
                          (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;86|)
                          $)))))
            ('T
             (QSETREFV $ 21
                       (CONS
                        (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;87|)
                        $))))
           (QSETREFV $ 36
                     (CONS
                      (|dispatchFunction|
                       |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;88|)
                      $))))))
       ((|domainEqual| |#1| (|Fraction| (|Polynomial| (|AlgebraicNumber|))))
        (COND
         ((|domainEqual| |#2| (|Polynomial| (|AlgebraicNumber|)))
          (PROGN
           (QSETREFV $ 21
                     (CONS (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;89|)
                           $))
           (QSETREFV $ 36
                     (CONS
                      (|dispatchFunction|
                       |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;90|)
                      $))))
         ('T
          (PROGN
           (SETELT $ 56 (SPADCALL (QREFELT $ 55)))
           (COND
            ((SPADCALL (QREFELT $ 56) 0 (QREFELT $ 59))
             (COND
              ((< (QREFELT $ 56) 32000000)
               (COND
                ((|domainEqual| |#1|
                                (|PrimeField|
                                 (PROG1 (LETT #12# (QREFELT $ 56) . #33#)
                                   (|check_subtype2| (> #12# 0)
                                                     '(|PositiveInteger|)
                                                     '(|NonNegativeInteger|)
                                                     #12#))))
                 (COND
                  ((|domainEqual| |#2|
                                  (|PrimeField|
                                   (PROG1 (LETT #11# (QREFELT $ 56) . #33#)
                                     (|check_subtype2| (> #11# 0)
                                                       '(|PositiveInteger|)
                                                       '(|NonNegativeInteger|)
                                                       #11#))))
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;91|)
                              $)))
                  ('T
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;92|)
                              $)))))
                ('T
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;93|)
                            $)))))
              ('T
               (QSETREFV $ 21
                         (CONS
                          (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;94|)
                          $)))))
            ('T
             (QSETREFV $ 21
                       (CONS
                        (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;95|)
                        $))))
           (QSETREFV $ 36
                     (CONS
                      (|dispatchFunction|
                       |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;96|)
                      $))))))
       ('T
        (PROGN
         (SETELT $ 56 (SPADCALL (QREFELT $ 55)))
         (COND
          ((SPADCALL (QREFELT $ 56) 0 (QREFELT $ 59))
           (COND
            ((< (QREFELT $ 56) 32000000)
             (COND
              ((|domainEqual| |#1|
                              (|PrimeField|
                               (PROG1 (LETT #10# (QREFELT $ 56) . #33#)
                                 (|check_subtype2| (> #10# 0)
                                                   '(|PositiveInteger|)
                                                   '(|NonNegativeInteger|)
                                                   #10#))))
               (COND
                ((|domainEqual| |#2|
                                (|PrimeField|
                                 (PROG1 (LETT #9# (QREFELT $ 56) . #33#)
                                   (|check_subtype2| (> #9# 0)
                                                     '(|PositiveInteger|)
                                                     '(|NonNegativeInteger|)
                                                     #9#))))
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;97|)
                            $)))
                ('T
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;98|)
                            $)))))
              ('T
               (QSETREFV $ 21
                         (CONS
                          (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;99|)
                          $)))))
            ('T
             (QSETREFV $ 21
                       (CONS
                        (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;100|)
                        $)))))
          ('T
           (QSETREFV $ 21
                     (CONS
                      (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;101|)
                      $))))
         (QSETREFV $ 36
                   (CONS
                    (|dispatchFunction|
                     |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;102|)
                    $))))))
     ((|domainEqual| |#1| (|AlgebraicNumber|))
      (COND
       ((|domainEqual| |#2| (|AlgebraicNumber|))
        (PROGN
         (QSETREFV $ 21
                   (CONS (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;103|)
                         $))
         (QSETREFV $ 36
                   (CONS
                    (|dispatchFunction|
                     |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;104|)
                    $))))
       ((|domainEqual| |#1| (|Fraction| (|Polynomial| (|AlgebraicNumber|))))
        (COND
         ((|domainEqual| |#2| (|Polynomial| (|AlgebraicNumber|)))
          (PROGN
           (QSETREFV $ 21
                     (CONS
                      (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;105|) $))
           (QSETREFV $ 36
                     (CONS
                      (|dispatchFunction|
                       |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;106|)
                      $))))
         ('T
          (PROGN
           (SETELT $ 56 (SPADCALL (QREFELT $ 55)))
           (COND
            ((SPADCALL (QREFELT $ 56) 0 (QREFELT $ 59))
             (COND
              ((< (QREFELT $ 56) 32000000)
               (COND
                ((|domainEqual| |#1|
                                (|PrimeField|
                                 (PROG1 (LETT #8# (QREFELT $ 56) . #33#)
                                   (|check_subtype2| (> #8# 0)
                                                     '(|PositiveInteger|)
                                                     '(|NonNegativeInteger|)
                                                     #8#))))
                 (COND
                  ((|domainEqual| |#2|
                                  (|PrimeField|
                                   (PROG1 (LETT #7# (QREFELT $ 56) . #33#)
                                     (|check_subtype2| (> #7# 0)
                                                       '(|PositiveInteger|)
                                                       '(|NonNegativeInteger|)
                                                       #7#))))
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;107|)
                              $)))
                  ('T
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;108|)
                              $)))))
                ('T
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;109|)
                            $)))))
              ('T
               (QSETREFV $ 21
                         (CONS
                          (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;110|)
                          $)))))
            ('T
             (QSETREFV $ 21
                       (CONS
                        (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;111|)
                        $))))
           (QSETREFV $ 36
                     (CONS
                      (|dispatchFunction|
                       |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;112|)
                      $))))))
       ('T
        (PROGN
         (SETELT $ 56 (SPADCALL (QREFELT $ 55)))
         (COND
          ((SPADCALL (QREFELT $ 56) 0 (QREFELT $ 59))
           (COND
            ((< (QREFELT $ 56) 32000000)
             (COND
              ((|domainEqual| |#1|
                              (|PrimeField|
                               (PROG1 (LETT #6# (QREFELT $ 56) . #33#)
                                 (|check_subtype2| (> #6# 0)
                                                   '(|PositiveInteger|)
                                                   '(|NonNegativeInteger|)
                                                   #6#))))
               (COND
                ((|domainEqual| |#2|
                                (|PrimeField|
                                 (PROG1 (LETT #5# (QREFELT $ 56) . #33#)
                                   (|check_subtype2| (> #5# 0)
                                                     '(|PositiveInteger|)
                                                     '(|NonNegativeInteger|)
                                                     #5#))))
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;113|)
                            $)))
                ('T
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;114|)
                            $)))))
              ('T
               (QSETREFV $ 21
                         (CONS
                          (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;115|)
                          $)))))
            ('T
             (QSETREFV $ 21
                       (CONS
                        (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;116|)
                        $)))))
          ('T
           (QSETREFV $ 21
                     (CONS
                      (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;117|)
                      $))))
         (QSETREFV $ 36
                   (CONS
                    (|dispatchFunction|
                     |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;118|)
                    $))))))
     ((|domainEqual| |#1| (|Fraction| (|Polynomial| (|AlgebraicNumber|))))
      (COND
       ((|domainEqual| |#2| (|Polynomial| (|AlgebraicNumber|)))
        (PROGN
         (QSETREFV $ 21
                   (CONS (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;119|)
                         $))
         (QSETREFV $ 36
                   (CONS
                    (|dispatchFunction|
                     |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;120|)
                    $))))
       ('T
        (PROGN
         (SETELT $ 56 (SPADCALL (QREFELT $ 55)))
         (COND
          ((SPADCALL (QREFELT $ 56) 0 (QREFELT $ 59))
           (COND
            ((< (QREFELT $ 56) 32000000)
             (COND
              ((|domainEqual| |#1|
                              (|PrimeField|
                               (PROG1 (LETT #4# (QREFELT $ 56) . #33#)
                                 (|check_subtype2| (> #4# 0)
                                                   '(|PositiveInteger|)
                                                   '(|NonNegativeInteger|)
                                                   #4#))))
               (COND
                ((|domainEqual| |#2|
                                (|PrimeField|
                                 (PROG1 (LETT #3# (QREFELT $ 56) . #33#)
                                   (|check_subtype2| (> #3# 0)
                                                     '(|PositiveInteger|)
                                                     '(|NonNegativeInteger|)
                                                     #3#))))
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;121|)
                            $)))
                ('T
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;122|)
                            $)))))
              ('T
               (QSETREFV $ 21
                         (CONS
                          (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;123|)
                          $)))))
            ('T
             (QSETREFV $ 21
                       (CONS
                        (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;124|)
                        $)))))
          ('T
           (QSETREFV $ 21
                     (CONS
                      (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;125|)
                      $))))
         (QSETREFV $ 36
                   (CONS
                    (|dispatchFunction|
                     |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;126|)
                    $))))))
     ('T
      (PROGN
       (SETELT $ 56 (SPADCALL (QREFELT $ 55)))
       (COND
        ((SPADCALL (QREFELT $ 56) 0 (QREFELT $ 59))
         (COND
          ((< (QREFELT $ 56) 32000000)
           (COND
            ((|domainEqual| |#1|
                            (|PrimeField|
                             (PROG1 (LETT #2# (QREFELT $ 56) . #33#)
                               (|check_subtype2| (> #2# 0) '(|PositiveInteger|)
                                                 '(|NonNegativeInteger|)
                                                 #2#))))
             (COND
              ((|domainEqual| |#2|
                              (|PrimeField|
                               (PROG1 (LETT #1# (QREFELT $ 56) . #33#)
                                 (|check_subtype2| (> #1# 0)
                                                   '(|PositiveInteger|)
                                                   '(|NonNegativeInteger|)
                                                   #1#))))
               (QSETREFV $ 21
                         (CONS
                          (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;127|)
                          $)))
              ('T
               (QSETREFV $ 21
                         (CONS
                          (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;128|)
                          $)))))
            ('T
             (QSETREFV $ 21
                       (CONS
                        (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;129|)
                        $)))))
          ('T
           (QSETREFV $ 21
                     (CONS
                      (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;130|)
                      $)))))
        ('T
         (QSETREFV $ 21
                   (CONS (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;131|)
                         $))))
       (QSETREFV $ 36
                 (CONS
                  (|dispatchFunction|
                   |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;132|)
                  $)))))
    $))) 

(MAKEPROP '|ModularHermitePadeSolver| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Union| (|Matrix| (|SparseUnivariatePolynomial| 23)) 32)
              (|List| (|List| (|Fraction| 23))) (|List| 23) (|Symbol|)
              (|NonNegativeInteger|) (|Mapping| 27 68 23 23)
              (|Union| '"good" '"reject" '"no_solution")
              (|Mapping| 14 (|List| (|SparseUnivariatePolynomial| 23)))
              (|ModularHermitePade|) (0 . |HP_solve_I|)
              (|Union| (|Matrix| (|SparseUnivariatePolynomial| 7)) 32)
              (|List| (|List| 6)) (|Mapping| 14 34) (10 . |HP_solve|)
              (|Union| 68 '"failed") (|Integer|) (21 . |LLFI_to_LPA|)
              (|List| 11) (28 . |LLF_to_LPA|) (|Vector| 67)
              (|Vector| (|SparseUnivariatePolynomial| 23))
              (37 . |VSUPI_to_VPA|) (|Vector| (|SparseUnivariatePolynomial| 7))
              (43 . |VSUPS_to_VPA|) (|Boolean|) (51 . ~=)
              (|List| (|SparseUnivariatePolynomial| 7)) (57 . |vector|)
              (62 . |gen_Monte_Carlo_check|)
              (|Union|
               (|Matrix| (|SparseUnivariatePolynomial| (|Polynomial| 23))) 32)
              (|List| (|List| (|Fraction| (|Polynomial| 23))))
              (|Mapping| 14
                         (|List|
                          (|SparseUnivariatePolynomial| (|Polynomial| 23))))
              (72 . |HP_solve_P|) (83 . |LLFPI_to_LPA|)
              (|Vector| (|SparseUnivariatePolynomial| (|Polynomial| 23)))
              (92 . |VSUPPI_to_VPA|) (100 . =) (106 . |get_variables|)
              (113 . |reverse|)
              (|Union|
               (|Matrix| (|SparseUnivariatePolynomial| (|AlgebraicNumber|)))
               32)
              (|List| (|List| (|AlgebraicNumber|)))
              (|Mapping| 14
                         (|List|
                          (|SparseUnivariatePolynomial| (|AlgebraicNumber|))))
              (118 . |HP_solve_A|)
              (|Union|
               (|Matrix|
                (|SparseUnivariatePolynomial|
                 (|Polynomial| (|AlgebraicNumber|))))
               32)
              (|List| (|List| (|Fraction| (|Polynomial| (|AlgebraicNumber|)))))
              (|Mapping| 14
                         (|List|
                          (|SparseUnivariatePolynomial|
                           (|Polynomial| (|AlgebraicNumber|)))))
              (128 . |HP_solve_PA|) (139 . |characteristic|) '|p|
              (143 . |Zero|) (147 . |Zero|) (151 . >) (|List| 10)
              (157 . |HP_solve_M|) (168 . ~=) (174 . |random|)
              (|IntegerPrimesPackage| 23) (178 . |nextPrime|) (183 . ~=)
              (|U32Vector|) (|List| 67) (189 . |check_sol1a|) (199 . |One|)
              (203 . |One|))
           '#(|gen_Monte_Carlo_check| 207 |VSUPS_to_VPA| 217 |LLF_to_LPA| 225
              |HP_solve| 234)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 71
                                                 '(6 16 8 9 10 11 12 13 15 17 7
                                                   0 18 19 10 11 11 12 13 20 21
                                                   3 16 22 9 23 23 24 5 0 22 19
                                                   23 25 10 23 26 2 16 27 28 23
                                                   29 4 0 27 30 25 10 23 31 2
                                                   11 32 0 0 33 1 30 0 34 35 6
                                                   0 20 20 19 11 11 12 13 36 7
                                                   16 37 38 10 11 11 12 13 39
                                                   40 5 16 22 38 23 25 10 23 41
                                                   4 16 27 42 25 10 23 43 2 11
                                                   32 0 0 44 3 16 25 38 11 11
                                                   45 1 25 0 0 46 6 16 47 48 10
                                                   11 12 13 49 50 7 16 51 52 10
                                                   11 11 12 13 53 54 0 6 12 55
                                                   0 6 0 57 0 7 0 58 2 12 32 0
                                                   0 59 7 16 8 60 10 11 23 12
                                                   13 15 61 2 23 32 0 0 62 0 32
                                                   0 63 1 64 23 23 65 2 12 32 0
                                                   0 66 6 16 67 27 68 13 23 23
                                                   23 69 0 6 0 70 0 7 0 71 6 0
                                                   20 20 19 11 11 12 13 36 4 0
                                                   27 30 25 10 23 31 5 0 22 19
                                                   23 25 10 23 26 7 0 18 19 10
                                                   11 11 12 13 20 21)))))
           '|lookupComplete|)) 
