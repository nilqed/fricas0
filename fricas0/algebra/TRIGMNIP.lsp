
(SDEFUN |TRIGMNIP;K2KG|
        ((|k| |Kernel| F) ($ |Kernel| (|Expression| (|Complex| R))))
        (SPADCALL
         (SPADCALL
          (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT $ 18))) (QREFELT $ 21))
          (QREFELT $ 22))
         (QREFELT $ 24))) 

(SDEFUN |TRIGMNIP;real?;FB;2| ((|f| F) ($ |Boolean|))
        (NULL (QCAR (|TRIGMNIP;complexKernels| |f| $)))) 

(SDEFUN |TRIGMNIP;real;2F;3| ((|f| F) ($ F))
        (SPADCALL (SPADCALL |f| (QREFELT $ 28)) (QREFELT $ 29))) 

(SDEFUN |TRIGMNIP;imag;2F;4| ((|f| F) ($ F))
        (SPADCALL (SPADCALL |f| (QREFELT $ 28)) (QREFELT $ 31))) 

(SDEFUN |TRIGMNIP;complexKernels|
        ((|f| F)
         ($ |Record| (|:| |ker| (|List| (|Kernel| F))) (|:| |val| (|List| F))))
        (SPROG
         ((|lv| (|List| F)) (|lk| (|List| (|Kernel| F)))
          (|u| (|Union| F "failed")) (#1=#:G740 NIL) (|k| NIL))
         (SEQ (LETT |lk| NIL . #2=(|TRIGMNIP;complexKernels|))
              (LETT |lv| NIL . #2#)
              (SEQ (LETT |k| NIL . #2#)
                   (LETT #1# (SPADCALL |f| (QREFELT $ 34)) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (LETT |u| (|TRIGMNIP;kcomplex| |k| $) . #2#)
                        (EXIT
                         (COND
                          ((QEQCAR |u| 0)
                           (SEQ (LETT |lk| (CONS |k| |lk|) . #2#)
                                (EXIT
                                 (LETT |lv| (CONS (QCDR |u|) |lv|) . #2#)))))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |lk| |lv|))))) 

(SDEFUN |TRIGMNIP;kcomplex| ((|k| |Kernel| F) ($ |Union| F "failed"))
        (SPROG
         ((#1=#:G758 NIL) (|u| (|Union| (|Integer|) "failed")) (|a| (F))
          (#2=#:G757 NIL) (|n| (F)) (|arg| (|List| F))
          (|op| (|BasicOperator|)))
         (SEQ
          (LETT |op| (SPADCALL |k| (QREFELT $ 36)) . #3=(|TRIGMNIP;kcomplex|))
          (EXIT
           (COND
            ((SPADCALL |k| '|nthRoot| (QREFELT $ 38))
             (SEQ
              (EXIT
               (SEQ (LETT |arg| (SPADCALL |k| (QREFELT $ 18)) . #3#)
                    (COND
                     ((SPADCALL
                       (SPADCALL
                        (LETT |n| (SPADCALL |arg| (QREFELT $ 39)) . #3#)
                        (QREFELT $ 41))
                       (QREFELT $ 42))
                      (SEQ
                       (LETT |u| (SPADCALL (|SPADfirst| |arg|) (QREFELT $ 45))
                             . #3#)
                       (EXIT
                        (COND
                         ((QEQCAR |u| 0)
                          (COND
                           ((< (QCDR |u|) 0)
                            (PROGN
                             (LETT #2#
                                   (CONS 0
                                         (SPADCALL
                                          (SPADCALL |op| (QREFELT $ 12)
                                                    (SPADCALL |n|
                                                              (SPADCALL 2
                                                                        (QREFELT
                                                                         $ 48))
                                                              (QREFELT $ 49))
                                                    (QREFELT $ 50))
                                          (SPADCALL |op|
                                                    (SPADCALL
                                                     (|SPADfirst| |arg|)
                                                     (QREFELT $ 10))
                                                    |n| (QREFELT $ 50))
                                          (QREFELT $ 14)))
                                   . #3#)
                             (GO #4=#:G751))))))))))
                    (EXIT (CONS 1 "failed"))))
              #4# (EXIT #2#)))
            ('T
             (SEQ
              (EXIT
               (SEQ
                (COND
                 ((SPADCALL |k| '|log| (QREFELT $ 38))
                  (SEQ
                   (LETT |u|
                         (SPADCALL
                          (LETT |a| (|SPADfirst| (SPADCALL |k| (QREFELT $ 18)))
                                . #3#)
                          (QREFELT $ 45))
                         . #3#)
                   (EXIT
                    (COND
                     ((QEQCAR |u| 0)
                      (COND
                       ((< (QCDR |u|) 0)
                        (PROGN
                         (LETT #1#
                               (CONS 0
                                     (SPADCALL
                                      (SPADCALL |op|
                                                (SPADCALL |a| (QREFELT $ 10))
                                                (QREFELT $ 51))
                                      (QREFELT $ 15) (QREFELT $ 52)))
                               . #3#)
                         (GO #5=#:G754))))))))))
                (EXIT (CONS 1 "failed"))))
              #5# (EXIT #1#)))))))) 

(SDEFUN |TRIGMNIP;complexForm;FC;7| ((|f| F) ($ |Complex| F))
        (SPROG
         ((|l|
           (|Record| (|:| |ker| (|List| (|Kernel| F)))
                     (|:| |val| (|List| F)))))
         (COND
          ((NULL
            (QCAR
             (LETT |l| (|TRIGMNIP;complexKernels| |f| $)
                   |TRIGMNIP;complexForm;FC;7|)))
           (SPADCALL |f| (|spadConstant| $ 47) (QREFELT $ 53)))
          ('T
           (SPADCALL
            (|TRIGMNIP;locexplogs|
             (SPADCALL |f| (QCAR |l|) (QCDR |l|) (QREFELT $ 55)) $)
            (QREFELT $ 56)))))) 

(SDEFUN |TRIGMNIP;locexplogs| ((|f| F) ($ |Expression| (|Complex| R)))
        (SPROG ((|g| (F)))
               (COND
                ((SPADCALL
                  (CONS #'|TRIGMNIP;locexplogs!0| (VECTOR $ (QREFELT $ 8)))
                  (SPADCALL
                   (LETT |g| (SPADCALL |f| (QREFELT $ 59))
                         |TRIGMNIP;locexplogs|)
                   (QREFELT $ 61))
                  (QREFELT $ 63))
                 (|TRIGMNIP;localexplogs| |f| |g| $))
                ('T (SPADCALL |g| (QREFELT $ 21)))))) 

(SDEFUN |TRIGMNIP;locexplogs!0| ((|x| NIL) ($$ NIL))
        (PROG (RTRIG $)
          (LETT RTRIG (QREFELT $$ 1) . #1=(|TRIGMNIP;locexplogs|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| RTRIG (QREFELT $ 57)))))) 

(SDEFUN |TRIGMNIP;complexNormalize;FSF;9| ((|f| F) (|x| |Symbol|) ($ F))
        (SPROG ((#1=#:G772 NIL) (|g| (F)) (|k| NIL) (#2=#:G771 NIL))
               (SEQ
                (COND
                 ((SPADCALL
                   (CONS #'|TRIGMNIP;complexNormalize;FSF;9!0|
                         (VECTOR (QREFELT $ 8) $))
                   (PROGN
                    (LETT #2# NIL . #3=(|TRIGMNIP;complexNormalize;FSF;9|))
                    (SEQ (LETT |k| NIL . #3#)
                         (LETT #1#
                               (SPADCALL
                                (LETT |g| (SPADCALL |f| |x| (QREFELT $ 64))
                                      . #3#)
                                (QREFELT $ 34))
                               . #3#)
                         G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |x|
                                       (SPADCALL (SPADCALL |k| (QREFELT $ 65))
                                                 (QREFELT $ 67))
                                       (QREFELT $ 68))
                             (LETT #2# (CONS |k| #2#) . #3#)))))
                         (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                         (EXIT (NREVERSE #2#))))
                   (QREFELT $ 71))
                  (SPADCALL
                   (QVELT
                    (SPADCALL (|TRIGMNIP;localexplogs| |f| |g| $) |x|
                              (QREFELT $ 74))
                    0)
                   (QREFELT $ 75)))
                 ('T (QVELT (SPADCALL |g| |x| (QREFELT $ 77)) 0)))))) 

(SDEFUN |TRIGMNIP;complexNormalize;FSF;9!0| ((|y| NIL) ($$ NIL))
        (PROG ($ RTRIG)
          (LETT $ (QREFELT $$ 1) . #1=(|TRIGMNIP;complexNormalize;FSF;9|))
          (LETT RTRIG (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |y| (QREFELT $ 36)) RTRIG (QREFELT $ 57)))))) 

(SDEFUN |TRIGMNIP;complexNormalize;2F;10| ((|f| F) ($ F))
        (SPROG
         ((|g| (F)) (|h| (|Expression| (|Complex| R)))
          (|l| (|List| (|Symbol|))))
         (SEQ
          (LETT |l|
                (SPADCALL
                 (LETT |g| (SPADCALL |f| (QREFELT $ 59))
                       . #1=(|TRIGMNIP;complexNormalize;2F;10|))
                 (QREFELT $ 67))
                . #1#)
          (EXIT
           (COND
            ((SPADCALL
              (CONS #'|TRIGMNIP;complexNormalize;2F;10!0|
                    (VECTOR $ (QREFELT $ 8)))
              (SPADCALL |g| (QREFELT $ 61)) (QREFELT $ 63))
             (SEQ (LETT |h| (|TRIGMNIP;localexplogs| |f| |g| $) . #1#)
                  (LETT |h| (QVELT (SPADCALL |h| NIL (QREFELT $ 79)) 0) . #1#)
                  (EXIT (SPADCALL |h| (QREFELT $ 75)))))
            ('T
             (SEQ (LETT |g| (QVELT (SPADCALL |g| NIL (QREFELT $ 80)) 0) . #1#)
                  (EXIT |g|)))))))) 

(SDEFUN |TRIGMNIP;complexNormalize;2F;10!0| ((|x| NIL) ($$ NIL))
        (PROG (RTRIG $)
          (LETT RTRIG (QREFELT $$ 1) . #1=(|TRIGMNIP;complexNormalize;2F;10|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| RTRIG (QREFELT $ 57)))))) 

(SDEFUN |TRIGMNIP;complexElementary;FSF;11| ((|f| F) (|x| |Symbol|) ($ F))
        (SPROG ((#1=#:G785 NIL) (|g| (F)) (|k| NIL) (#2=#:G784 NIL))
               (SEQ
                (COND
                 ((SPADCALL
                   (CONS #'|TRIGMNIP;complexElementary;FSF;11!0|
                         (VECTOR (QREFELT $ 8) $))
                   (PROGN
                    (LETT #2# NIL . #3=(|TRIGMNIP;complexElementary;FSF;11|))
                    (SEQ (LETT |k| NIL . #3#)
                         (LETT #1#
                               (SPADCALL
                                (LETT |g| (SPADCALL |f| |x| (QREFELT $ 64))
                                      . #3#)
                                (QREFELT $ 34))
                               . #3#)
                         G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |x|
                                       (SPADCALL (SPADCALL |k| (QREFELT $ 65))
                                                 (QREFELT $ 67))
                                       (QREFELT $ 68))
                             (LETT #2# (CONS |k| #2#) . #3#)))))
                         (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                         (EXIT (NREVERSE #2#))))
                   (QREFELT $ 71))
                  (SPADCALL (|TRIGMNIP;localexplogs| |f| |g| $)
                            (QREFELT $ 75)))
                 ('T |g|))))) 

(SDEFUN |TRIGMNIP;complexElementary;FSF;11!0| ((|y| NIL) ($$ NIL))
        (PROG ($ RTRIG)
          (LETT $ (QREFELT $$ 1) . #1=(|TRIGMNIP;complexElementary;FSF;11|))
          (LETT RTRIG (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |y| (QREFELT $ 36)) RTRIG (QREFELT $ 57)))))) 

(SDEFUN |TRIGMNIP;complexElementary;2F;12| ((|f| F) ($ F))
        (SPROG ((|g| (F)))
               (COND
                ((SPADCALL
                  (CONS #'|TRIGMNIP;complexElementary;2F;12!0|
                        (VECTOR $ (QREFELT $ 8)))
                  (SPADCALL
                   (LETT |g| (SPADCALL |f| (QREFELT $ 59))
                         |TRIGMNIP;complexElementary;2F;12|)
                   (QREFELT $ 61))
                  (QREFELT $ 63))
                 (SPADCALL (|TRIGMNIP;localexplogs| |f| |g| $) (QREFELT $ 75)))
                ('T |g|)))) 

(SDEFUN |TRIGMNIP;complexElementary;2F;12!0| ((|x| NIL) ($$ NIL))
        (PROG (RTRIG $)
          (LETT RTRIG (QREFELT $$ 1) . #1=(|TRIGMNIP;complexElementary;2F;12|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| RTRIG (QREFELT $ 57)))))) 

(SDEFUN |TRIGMNIP;localexplogs|
        ((|f| F) (|g| F) ($ |Expression| (|Complex| R)))
        (SPROG ((#1=#:G793 NIL) (|k| NIL) (#2=#:G792 NIL))
               (SEQ
                (SPADCALL (SPADCALL |g| (QREFELT $ 21))
                          (PROGN
                           (LETT #2# NIL . #3=(|TRIGMNIP;localexplogs|))
                           (SEQ (LETT |k| NIL . #3#)
                                (LETT #1# (SPADCALL |f| (QREFELT $ 34)) . #3#)
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((COND
                                     ((SPADCALL |k| '|tan| (QREFELT $ 38)) 'T)
                                     ('T (SPADCALL |k| '|cot| (QREFELT $ 38))))
                                    (LETT #2#
                                          (CONS (|TRIGMNIP;K2KG| |k| $) #2#)
                                          . #3#)))))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 85))))) 

(SDEFUN |TRIGMNIP;trigs;2F;14| ((|f| F) ($ F))
        (SPROG ((|g| (|Complex| F)))
               (SEQ
                (COND ((SPADCALL |f| (QREFELT $ 26)) |f|)
                      ('T
                       (SEQ
                        (LETT |g|
                              (SPADCALL (SPADCALL |f| (QREFELT $ 21))
                                        (QREFELT $ 56))
                              |TRIGMNIP;trigs;2F;14|)
                        (EXIT
                         (SPADCALL (SPADCALL |g| (QREFELT $ 29))
                                   (SPADCALL (QREFELT $ 12)
                                             (SPADCALL |g| (QREFELT $ 31))
                                             (QREFELT $ 14))
                                   (QREFELT $ 52))))))))) 

(DECLAIM (NOTINLINE |TrigonometricManipulations;|)) 

(DEFUN |TrigonometricManipulations| (&REST #1=#:G797)
  (SPROG NIL
         (PROG (#2=#:G798)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|TrigonometricManipulations|)
                                               '|domainEqualList|)
                    . #3=(|TrigonometricManipulations|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |TrigonometricManipulations;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|TrigonometricManipulations|)))))))))) 

(DEFUN |TrigonometricManipulations;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|TrigonometricManipulations|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|TrigonometricManipulations| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 87) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|TrigonometricManipulations|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 '|rtrig|)
          (QSETREFV $ 12
                    (SPADCALL (SPADCALL (|spadConstant| $ 9) (QREFELT $ 10))
                              (QREFELT $ 11)))
          (QSETREFV $ 15
                    (SPADCALL (SPADCALL (QREFELT $ 13)) (QREFELT $ 12)
                              (QREFELT $ 14)))
          $))) 

(MAKEPROP '|TrigonometricManipulations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'RTRIG
              (0 . |One|) (4 . -) (9 . |sqrt|) '|s1| (14 . |pi|) (18 . *)
              '|ipi| (|List| 7) (|Kernel| 7) (24 . |argument|)
              (|Expression| (|Complex| 6))
              (|InnerTrigonometricManipulations| 6 7 19) (29 . F2FG)
              (34 . |tan|) (|Kernel| $) (39 . |retract|) (|Boolean|)
              |TRIGMNIP;real?;FB;2| (|Complex| 7) |TRIGMNIP;complexForm;FC;7|
              (44 . |real|) |TRIGMNIP;real;2F;3| (49 . |imag|)
              |TRIGMNIP;imag;2F;4| (|List| 23) (54 . |tower|) (|BasicOperator|)
              (59 . |operator|) (|Symbol|) (64 . |is?|) (70 . |second|)
              (|Integer|) (75 . |retract|) (80 . |even?|)
              (|Union| 40 '"failed") (|ElementaryFunctionSign| 6 7)
              (85 . |sign|) (90 . |Zero|) (94 . |Zero|) (98 . |coerce|)
              (103 . /) (109 . |elt|) (116 . |elt|) (122 . +) (128 . |complex|)
              (|List| $) (134 . |eval|) (141 . |explogs2trigs|) (146 . |has?|)
              (|ElementaryFunctionStructurePackage| 6 7)
              (152 . |realElementary|) (|List| 35) (157 . |operators|)
              (|Mapping| 25 35) (162 . |any?|) (168 . |realElementary|)
              (174 . |coerce|) (|List| 37) (179 . |variables|)
              (184 . |member?|) (|Mapping| 25 17) (|List| 17) (190 . |any?|)
              (|Record| (|:| |func| 19) (|:| |kers| 84)
                        (|:| |vals| (|List| 19)))
              (|ElementaryFunctionStructurePackage| (|Complex| 6) 19)
              (196 . |rischNormalize|) (202 . FG2F)
              (|Record| (|:| |func| 7) (|:| |kers| 70) (|:| |vals| 16))
              (207 . |rischNormalize|) |TRIGMNIP;complexNormalize;FSF;9|
              (213 . |rischNormalize|) (219 . |rischNormalize|)
              |TRIGMNIP;complexNormalize;2F;10|
              |TRIGMNIP;complexElementary;FSF;11|
              |TRIGMNIP;complexElementary;2F;12| (|List| (|Kernel| 19))
              (225 . |trigs2explogs|) |TRIGMNIP;trigs;2F;14|)
           '#(|trigs| 231 |real?| 236 |real| 241 |imag| 246 |complexNormalize|
              251 |complexForm| 262 |complexElementary| 267)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 86
                                                 '(0 7 0 9 1 7 0 0 10 1 7 0 0
                                                   11 0 7 0 13 2 7 0 0 0 14 1
                                                   17 16 0 18 1 20 19 7 21 1 19
                                                   0 0 22 1 19 23 0 24 1 27 7 0
                                                   29 1 27 7 0 31 1 7 33 0 34 1
                                                   17 35 0 36 2 17 25 0 37 38 1
                                                   16 7 0 39 1 7 40 0 41 1 40
                                                   25 0 42 1 44 43 7 45 0 6 0
                                                   46 0 7 0 47 1 7 0 40 48 2 7
                                                   0 0 0 49 3 7 0 35 0 0 50 2 7
                                                   0 35 0 51 2 7 0 0 0 52 2 27
                                                   0 7 7 53 3 7 0 0 33 54 55 1
                                                   20 27 19 56 2 35 25 0 37 57
                                                   1 58 7 7 59 1 7 60 0 61 2 60
                                                   25 62 0 63 2 58 7 7 37 64 1
                                                   7 0 23 65 1 7 66 0 67 2 66
                                                   25 37 0 68 2 70 25 69 0 71 2
                                                   73 72 19 37 74 1 20 7 19 75
                                                   2 58 76 7 37 77 2 73 72 19
                                                   66 79 2 58 76 7 66 80 2 20
                                                   19 19 84 85 1 0 7 7 86 1 0
                                                   25 7 26 1 0 7 7 30 1 0 7 7
                                                   32 2 0 7 7 37 78 1 0 7 7 81
                                                   1 0 27 7 28 2 0 7 7 37 82 1
                                                   0 7 7 83)))))
           '|lookupComplete|)) 
