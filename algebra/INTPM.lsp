
(SDEFUN |INTPM;mkalist|
        ((|res| (|PatternMatchResult| (|Integer|) F))
         (% (|AssociationList| (|Symbol|) F)))
        (SPADCALL (SPADCALL |res| (QREFELT % 52)) (QREFELT % 54))) 

(SDEFUN |INTPM;splitConstant;FSR;2|
        ((|f| (F)) (|x| (|Symbol|))
         (% (|Record| (|:| |const| F) (|:| |nconst| F))))
        (SPROG
         ((#1=#:G56 NIL) (|rec| (|Record| (|:| |const| F) (|:| |nconst| F)))
          (|vv| (|Record| (|:| |val| F) (|:| |exponent| (|Integer|))))
          (|v|
           (|Union| (|Record| (|:| |val| F) (|:| |exponent| (|Integer|)))
                    #2="failed"))
          (|cc| (F)) (#3=#:G58 NIL) (|g| NIL) (|nc| (F))
          (|u| (|Union| (|List| F) #2#)) (#4=#:G57 NIL))
         (SEQ
          (EXIT
           (COND
            ((NULL (SPADCALL |x| (SPADCALL |f| (QREFELT % 23)) (QREFELT % 55)))
             (CONS |f| (|spadConstant| % 43)))
            ('T
             (COND
              ((QEQCAR (SPADCALL |f| (QREFELT % 58)) 0)
               (CONS (|spadConstant| % 43) |f|))
              (#5='T
               (SEQ (LETT |u| (SPADCALL |f| (QREFELT % 60)))
                    (EXIT
                     (COND
                      ((QEQCAR |u| 0)
                       (SEQ (LETT |cc| (LETT |nc| (|spadConstant| % 43)))
                            (SEQ (LETT |g| NIL) (LETT #4# (QCDR |u|)) G190
                                 (COND
                                  ((OR (ATOM #4#)
                                       (PROGN (LETT |g| (CAR #4#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |rec|
                                        (SPADCALL |g| |x| (QREFELT % 62)))
                                  (LETT |cc|
                                        (SPADCALL |cc| (QCAR |rec|)
                                                  (QREFELT % 63)))
                                  (EXIT
                                   (LETT |nc|
                                         (SPADCALL |nc| (QCDR |rec|)
                                                   (QREFELT % 63)))))
                                 (LETT #4# (CDR #4#)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT (CONS |cc| |nc|))))
                      (#5#
                       (SEQ (LETT |u| (SPADCALL |f| (QREFELT % 64)))
                            (EXIT
                             (COND
                              ((QEQCAR |u| 0)
                               (SEQ
                                (LETT |rec|
                                      (SPADCALL (|SPADfirst| (QCDR |u|)) |x|
                                                (QREFELT % 62)))
                                (LETT |cc| (QCAR |rec|))
                                (LETT |nc| (QCDR |rec|))
                                (SEQ (LETT |g| NIL) (LETT #3# (CDR (QCDR |u|)))
                                     G190
                                     (COND
                                      ((OR (ATOM #3#)
                                           (PROGN (LETT |g| (CAR #3#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |rec|
                                            (SPADCALL |g| |x| (QREFELT % 62)))
                                      (EXIT
                                       (COND
                                        ((SPADCALL (QCDR |rec|) |nc|
                                                   (QREFELT % 65))
                                         (LETT |cc|
                                               (SPADCALL |cc| (QCAR |rec|)
                                                         (QREFELT % 66))))
                                        ((SPADCALL (QCDR |rec|)
                                                   (SPADCALL |nc|
                                                             (QREFELT % 67))
                                                   (QREFELT % 65))
                                         (LETT |cc|
                                               (SPADCALL |cc| (QCAR |rec|)
                                                         (QREFELT % 68))))
                                        ('T
                                         (PROGN
                                          (LETT #1#
                                                (CONS (|spadConstant| % 43)
                                                      |f|))
                                          (GO #6=#:G55))))))
                                     (LETT #3# (CDR #3#)) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT (CONS |cc| |nc|))))
                              (#5#
                               (SEQ
                                (SEQ (LETT |v| (SPADCALL |f| (QREFELT % 71)))
                                     (EXIT
                                      (COND
                                       ((QEQCAR |v| 0)
                                        (SEQ (LETT |vv| (QCDR |v|))
                                             (EXIT
                                              (COND
                                               ((SPADCALL (QCDR |vv|) 1
                                                          (QREFELT % 72))
                                                (SEQ
                                                 (LETT |rec|
                                                       (SPADCALL (QCAR |vv|)
                                                                 |x|
                                                                 (QREFELT %
                                                                          62)))
                                                 (EXIT
                                                  (PROGN
                                                   (LETT #1#
                                                         (CONS
                                                          (SPADCALL
                                                           (QCAR |rec|)
                                                           (QCDR |vv|)
                                                           (QREFELT % 73))
                                                          (SPADCALL
                                                           (QCDR |rec|)
                                                           (QCDR |vv|)
                                                           (QREFELT % 73))))
                                                   (GO #6#))))))))))))
                                (EXIT
                                 (|error|
                                  "splitConstant: should not happen"))))))))))))))))
          #6# (EXIT #1#)))) 

(SDEFUN |INTPM;formula1|
        ((|f| (F)) (|x| (|Symbol|)) (|t| (F)) (|cc| (F))
         (% (|Union| F "failed")))
        (SPROG
         ((#1=#:G88 NIL) (|mmi| (|Integer|)) (|mm| (F)) (#2=#:G92 NIL)
          (|sgz| #3=(|Union| (|Integer|) "failed")) (|z| (F)) (|sgs| #3#)
          (|ms| (F)) (|mw| (F)) (|l| (|List| F)))
         (SEQ
          (COND
           ((NULL (LETT |l| (|INTPM;match1| |f| |x| |t| |cc| %)))
            (CONS 1 "failed"))
           (#4='T
            (SEQ
             (EXIT
              (SEQ (LETT |mw| (|SPADfirst| |l|))
                   (COND
                    ((SPADCALL (LETT |ms| (SPADCALL |l| (QREFELT % 75)))
                               (QREFELT % 76))
                     (EXIT (CONS 1 #5="failed")))
                    (#4#
                     (SEQ (LETT |sgs| (SPADCALL |ms| (QREFELT % 78)))
                          (EXIT
                           (COND
                            ((QEQCAR |sgs| 1)
                             (PROGN
                              (LETT #2# (CONS 1 #5#))
                              (GO #6=#:G89))))))))
                   (SEQ
                    (LETT |sgz|
                          (SPADCALL
                           (LETT |z|
                                 (SPADCALL
                                  (SPADCALL |mw| (|spadConstant| % 43)
                                            (QREFELT % 66))
                                  |ms| (QREFELT % 45)))
                           (QREFELT % 78)))
                    (EXIT
                     (COND
                      ((OR (QEQCAR |sgz| 1) (< (QCDR |sgz|) 0))
                       (PROGN (LETT #2# (CONS 1 "failed")) (GO #6#))))))
                   (LETT |mmi|
                         (SPADCALL (LETT |mm| (SPADCALL |l| (QREFELT % 79)))
                                   (QREFELT % 80)))
                   (EXIT
                    (CONS 0
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (QCDR |sgs|)
                                      (SPADCALL |l| (QREFELT % 81))
                                      (QREFELT % 82))
                            (SPADCALL |ms| (- (- |mmi|) 1) (QREFELT % 73))
                            (QREFELT % 63))
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 18))
                                       (QREFELT % 83))
                             |x|
                             (PROG1 (LETT #1# |mmi|)
                               (|check_subtype2| (>= #1# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #1#))
                             (QREFELT % 85))
                            (LIST (SPADCALL |x| (QREFELT % 87))) (LIST |z|)
                            (QREFELT % 90))
                           (QREFELT % 63))))))
             #6# (EXIT #2#))))))) 

(SDEFUN |INTPM;match1|
        ((|f| (F)) (|x| (|Symbol|)) (|t| (F)) (|cc| (F)) (% (|List| F)))
        (SPROG
         ((|l| (|AssociationList| (|Symbol|) F))
          (|res| (|PatternMatchResult| (|Integer|) F)) (|pat| (F))
          (|res0| (|PatternMatchResult| (|Integer|) F)))
         (SEQ (LETT |res0| (SPADCALL (QREFELT % 91)))
              (LETT |pat|
                    (SPADCALL
                     (SPADCALL |cc|
                               (SPADCALL (SPADCALL |t| (QREFELT % 92))
                                         (QREFELT % 39) (QREFELT % 93))
                               (QREFELT % 63))
                     (SPADCALL
                      (SPADCALL (SPADCALL |t| (QREFELT % 32) (QREFELT % 93))
                                (QREFELT % 67))
                      (QREFELT % 94))
                     (QREFELT % 63)))
              (COND
               ((NULL
                 (SPADCALL
                  (LETT |res|
                        (SPADCALL |f| (SPADCALL |pat| (QREFELT % 96)) |res0|
                                  (QREFELT % 98)))
                  (QREFELT % 99)))
                (EXIT
                 (SEQ (LETT |l| (|INTPM;mkalist| |res| %))
                      (EXIT
                       (LIST (|spadConstant| % 100)
                             (SPADCALL |l| (QREFELT % 13) (QREFELT % 101))
                             (SPADCALL |l| (QREFELT % 14) (QREFELT % 101))
                             (SPADCALL |l| (QREFELT % 15)
                                       (QREFELT % 101))))))))
              (LETT |pat|
                    (SPADCALL
                     (SPADCALL |cc|
                               (SPADCALL |t| (QREFELT % 29) (QREFELT % 93))
                               (QREFELT % 63))
                     (SPADCALL
                      (SPADCALL (SPADCALL |t| (QREFELT % 32) (QREFELT % 93))
                                (QREFELT % 67))
                      (QREFELT % 94))
                     (QREFELT % 63)))
              (COND
               ((NULL
                 (SPADCALL
                  (LETT |res|
                        (SPADCALL |f| (SPADCALL |pat| (QREFELT % 96)) |res0|
                                  (QREFELT % 98)))
                  (QREFELT % 99)))
                (EXIT
                 (SEQ (LETT |l| (|INTPM;mkalist| |res| %))
                      (EXIT
                       (LIST (SPADCALL |l| (QREFELT % 12) (QREFELT % 101))
                             (|spadConstant| % 100)
                             (SPADCALL |l| (QREFELT % 14) (QREFELT % 101))
                             (SPADCALL |l| (QREFELT % 15)
                                       (QREFELT % 101))))))))
              (LETT |pat|
                    (SPADCALL
                     (SPADCALL |cc|
                               (SPADCALL |t| (QREFELT % 29) (QREFELT % 93))
                               (QREFELT % 45))
                     (SPADCALL
                      (SPADCALL (SPADCALL |t| (QREFELT % 32) (QREFELT % 93))
                                (QREFELT % 67))
                      (QREFELT % 94))
                     (QREFELT % 63)))
              (COND
               ((NULL
                 (SPADCALL
                  (LETT |res|
                        (SPADCALL |f| (SPADCALL |pat| (QREFELT % 96)) |res0|
                                  (QREFELT % 98)))
                  (QREFELT % 99)))
                (EXIT
                 (SEQ (LETT |l| (|INTPM;mkalist| |res| %))
                      (EXIT
                       (LIST
                        (SPADCALL (SPADCALL |l| (QREFELT % 12) (QREFELT % 101))
                                  (QREFELT % 67))
                        (|spadConstant| % 100)
                        (SPADCALL |l| (QREFELT % 14) (QREFELT % 101))
                        (SPADCALL |l| (QREFELT % 15) (QREFELT % 101))))))))
              (LETT |pat|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL |cc|
                                (SPADCALL |t| (QREFELT % 29) (QREFELT % 93))
                                (QREFELT % 63))
                      (SPADCALL (SPADCALL |t| (QREFELT % 92)) (QREFELT % 39)
                                (QREFELT % 93))
                      (QREFELT % 63))
                     (SPADCALL
                      (SPADCALL (SPADCALL |t| (QREFELT % 32) (QREFELT % 93))
                                (QREFELT % 67))
                      (QREFELT % 94))
                     (QREFELT % 63)))
              (COND
               ((NULL
                 (SPADCALL
                  (LETT |res|
                        (SPADCALL |f| (SPADCALL |pat| (QREFELT % 96)) |res0|
                                  (QREFELT % 98)))
                  (QREFELT % 99)))
                (EXIT
                 (SEQ (LETT |l| (|INTPM;mkalist| |res| %))
                      (EXIT
                       (LIST (SPADCALL |l| (QREFELT % 12) (QREFELT % 101))
                             (SPADCALL |l| (QREFELT % 13) (QREFELT % 101))
                             (SPADCALL |l| (QREFELT % 14) (QREFELT % 101))
                             (SPADCALL |l| (QREFELT % 15)
                                       (QREFELT % 101))))))))
              (LETT |pat|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL |cc|
                                (SPADCALL |t| (QREFELT % 29) (QREFELT % 93))
                                (QREFELT % 45))
                      (SPADCALL (SPADCALL |t| (QREFELT % 92)) (QREFELT % 39)
                                (QREFELT % 93))
                      (QREFELT % 63))
                     (SPADCALL
                      (SPADCALL (SPADCALL |t| (QREFELT % 32) (QREFELT % 93))
                                (QREFELT % 67))
                      (QREFELT % 94))
                     (QREFELT % 63)))
              (COND
               ((NULL
                 (SPADCALL
                  (LETT |res|
                        (SPADCALL |f| (SPADCALL |pat| (QREFELT % 96)) |res0|
                                  (QREFELT % 98)))
                  (QREFELT % 99)))
                (EXIT
                 (SEQ (LETT |l| (|INTPM;mkalist| |res| %))
                      (EXIT
                       (LIST
                        (SPADCALL (SPADCALL |l| (QREFELT % 12) (QREFELT % 101))
                                  (QREFELT % 67))
                        (SPADCALL |l| (QREFELT % 13) (QREFELT % 101))
                        (SPADCALL |l| (QREFELT % 14) (QREFELT % 101))
                        (SPADCALL |l| (QREFELT % 15) (QREFELT % 101))))))))
              (EXIT NIL)))) 

(SDEFUN |INTPM;pmintegrate;FS2OcU;5|
        ((|f| (F)) (|x| (|Symbol|)) (|a| (|OrderedCompletion| F))
         (|b| (|OrderedCompletion| F)) (% (|Union| F "failed")))
        (SPROG NIL
               (SEQ
                (COND
                 ((EQL (SPADCALL |a| (QREFELT % 104)) 0)
                  (COND
                   ((SPADCALL (SPADCALL |a| (QREFELT % 105)) (QREFELT % 76))
                    (COND
                     ((EQL (SPADCALL |b| (QREFELT % 104)) 1)
                      (EXIT
                       (|INTPM;formula1| |f| |x|
                        (SPADCALL (SPADCALL |x| (QREFELT % 18))
                                  (QREFELT % 106))
                        (SPADCALL (QREFELT % 21)
                                  (CONS #'|INTPM;pmintegrate;FS2OcU;5!0|
                                        (VECTOR % |x|))
                                  (QREFELT % 28))
                        %))))))))
                (EXIT (CONS 1 "failed"))))) 

(SDEFUN |INTPM;pmintegrate;FS2OcU;5!0| ((|x1| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT % 107)))))) 

(DECLAIM (NOTINLINE |PatternMatchIntegration;|)) 

(DEFUN |PatternMatchIntegration;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (SEQ
          (PROGN
           (LETT DV$1 (|devaluate| |#1|))
           (LETT DV$2 (|devaluate| |#2|))
           (LETT |dv$| (LIST '|PatternMatchIntegration| DV$1 DV$2))
           (LETT % (GETREFV 110))
           (QSETREFV % 0 |dv$|)
           (QSETREFV % 3
                     (LETT |pv$|
                           (|buildPredVector| 0 0
                                              (LIST
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|ConvertibleTo|
                                                                 (|Pattern|
                                                                  (|Integer|))))
                                                (|HasCategory| |#1|
                                                               '(|PatternMatchable|
                                                                 (|Integer|)))
                                                (|HasCategory| |#2|
                                                               '(|SpecialFunctionCategory|)))))))
           (|haddProp| |$ConstructorCache| '|PatternMatchIntegration|
                       (LIST DV$1 DV$2) (CONS 1 %))
           (|stuffDomainSlots| %)
           (QSETREFV % 6 |#1|)
           (QSETREFV % 7 |#2|)
           (SETF |pv$| (QREFELT % 3))
           (QSETREFV % 10 (SPADCALL (QREFELT % 9)))
           (QSETREFV % 12 (SPADCALL (QREFELT % 10) (QREFELT % 11)))
           (QSETREFV % 13 (SPADCALL (QREFELT % 10) (QREFELT % 11)))
           (QSETREFV % 14 (SPADCALL (QREFELT % 10) (QREFELT % 11)))
           (QSETREFV % 15 (SPADCALL (QREFELT % 10) (QREFELT % 11)))
           (QSETREFV % 16 (SPADCALL (QREFELT % 10) (QREFELT % 11)))
           (QSETREFV % 17 (SPADCALL (QREFELT % 10) (QREFELT % 11)))
           (QSETREFV % 21
                     (SPADCALL (SPADCALL (QREFELT % 15) (QREFELT % 18))
                               (QREFELT % 20)))
           (QSETREFV % 29
                     (SPADCALL
                      (SPADCALL (SPADCALL (QREFELT % 12) (QREFELT % 18))
                                (QREFELT % 20))
                      (CONS #'|PatternMatchIntegration!0| %) (QREFELT % 28)))
           (QSETREFV % 32
                     (SPADCALL
                      (SPADCALL (SPADCALL (QREFELT % 14) (QREFELT % 18))
                                (QREFELT % 20))
                      (CONS #'|PatternMatchIntegration!1| %) (QREFELT % 28)))
           (QSETREFV % 39
                     (SPADCALL
                      (SPADCALL (SPADCALL (QREFELT % 13) (QREFELT % 18))
                                (QREFELT % 20))
                      (CONS #'|PatternMatchIntegration!2| %) (QREFELT % 28)))
           (QSETREFV % 42 (SPADCALL (SPADCALL (QREFELT % 40)) (QREFELT % 41)))
           (QSETREFV % 46
                     (SPADCALL (|spadConstant| % 43)
                               (SPADCALL 2 (QREFELT % 44)) (QREFELT % 45)))
           (QSETREFV % 47
                     (SPADCALL
                      (SPADCALL (SPADCALL (QREFELT % 40))
                                (SPADCALL 2 (QREFELT % 44)) (QREFELT % 45))
                      (QREFELT % 41)))
           (QSETREFV % 48
                     (SPADCALL
                      (SPADCALL (SPADCALL 2 (QREFELT % 44))
                                (SPADCALL (QREFELT % 40)) (QREFELT % 45))
                      (QREFELT % 41)))
           (COND
            ((|HasCategory| |#1| '(|ConvertibleTo| (|Pattern| (|Integer|))))
             (COND
              ((|HasCategory| |#1| '(|PatternMatchable| (|Integer|)))
               (COND
                ((|HasCategory| |#2| '(|SpecialFunctionCategory|))
                 (PROGN
                  (QSETREFV % 109
                            (CONS
                             (|dispatchFunction| |INTPM;pmintegrate;FS2OcU;5|)
                             %)))))))))
           %)))) 

(DEFUN |PatternMatchIntegration| (&REST #1=#:G117)
  (SPROG NIL
         (PROG (#2=#:G118)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PatternMatchIntegration|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PatternMatchIntegration;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PatternMatchIntegration|)))))))))) 

(DEFUN |PatternMatchIntegration!2| (|x1| %)
  (SPROG ((|zz| NIL))
         (SEQ (LETT |zz| (SPADCALL |x1| (QREFELT % 34)))
              (EXIT
               (COND
                ((QEQCAR |zz| 0)
                 (SPADCALL (QCDR |zz|) (|spadConstant| % 37)
                           (QREFELT % 38)))))))) 

(DEFUN |PatternMatchIntegration!1| (|x1| %)
  (COND
   ((SPADCALL (SPADCALL |x1| (QREFELT % 23)) (QREFELT % 25))
    (SPADCALL |x1| (QREFELT % 31))))) 

(DEFUN |PatternMatchIntegration!0| (|x1| %)
  (SPADCALL (SPADCALL |x1| (QREFELT % 23)) (QREFELT % 25))) 

(MAKEPROP '|PatternMatchIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Symbol|)
              (0 . |new|) '|pm| (4 . |new|) '|pmw| '|pmm| '|pms| '|pmc| '|pma|
              '|pmb| (9 . |coerce|) (|FunctionSpaceAssertions| 6 7)
              (14 . |optional|) '|c| (|List| 8) (19 . |variables|) (|Boolean|)
              (24 . |empty?|) (|Mapping| 24 7)
              (|FunctionSpaceAttachPredicates| 6 7 7) (29 . |suchThat|) '|w|
              (|TrigonometricManipulations| 6 7) (35 . |real?|) '|s|
              (|Union| 36 '#1="failed") (40 . |retractIfCan|) (45 . |Zero|)
              (|Integer|) (49 . |Zero|) (53 . >=) '|m| (59 . |pi|)
              (63 . |sqrt|) '|spi| (68 . |One|) (72 . |coerce|) (77 . /)
              '|half| '|spio2| '|s2opi|
              (|Record| (|:| |key| 8) (|:| |entry| 7)) (|List| 49)
              (|PatternMatchResult| 36 7) (83 . |destruct|)
              (|AssociationList| 8 7) (88 . |construct|) (93 . |member?|)
              (99 . |One|) (|Union| (|Kernel| %) '#1#) (103 . |retractIfCan|)
              (|Union| 89 '#2="failed") (108 . |isTimes|)
              (|Record| (|:| |const| 7) (|:| |nconst| 7))
              |INTPM;splitConstant;FSR;2| (113 . *) (119 . |isPlus|) (124 . =)
              (130 . +) (136 . -) (141 . -)
              (|Record| (|:| |val| %) (|:| |exponent| 36)) (|Union| 69 '#2#)
              (147 . |isPower|) (152 . ~=) (158 . ^) (|List| 7) (164 . |third|)
              (169 . |zero?|) (|ElementaryFunctionSign| 6 7) (174 . |sign|)
              (179 . |second|) (184 . |retract|) (189 . |last|) (194 . *)
              (200 . |Gamma|) (|NonNegativeInteger|) (205 . |differentiate|)
              (|Kernel| 7) (212 . |kernel|) (|List| (|Kernel| %)) (|List| %)
              (217 . |eval|) (224 . |new|) (228 . |log|) (233 . ^)
              (239 . |exp|) (|Pattern| 36) (244 . |convert|)
              (|PatternMatchResult| 36 %) (249 . |patternMatch|)
              (256 . |failed?|) (261 . |Zero|) (265 . |elt|) (|SingleInteger|)
              (|OrderedCompletion| 7) (271 . |whatInfinity|) (276 . |retract|)
              (281 . |constant|) (286 . |freeOf?|) (|Union| 7 '#3="failed")
              (292 . |pmintegrate|))
           '#(|splitConstant| 300 |pmintegrate| 306) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|splitConstant|
                                 ((|Record| (|:| |const| |#2|)
                                            (|:| |nconst| |#2|))
                                  |#2| (|Symbol|)))
                                T)
                              '((|pmintegrate|
                                 ((|Union| |#2| #3#) |#2| (|Symbol|)
                                  (|OrderedCompletion| |#2|)
                                  (|OrderedCompletion| |#2|)))
                                (AND (|has| 7 (|SpecialFunctionCategory|))
                                     (|has| 6 (|PatternMatchable| 36))
                                     (|has| 6 (|ConvertibleTo| 95)))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 109
                                            '(0 8 0 9 1 8 0 0 11 1 7 0 8 18 1
                                              19 7 7 20 1 7 22 0 23 1 22 24 0
                                              25 2 27 7 7 26 28 1 30 24 7 31 1
                                              7 33 0 34 0 6 0 35 0 36 0 37 2 36
                                              24 0 0 38 0 7 0 40 1 7 0 0 41 0 7
                                              0 43 1 7 0 36 44 2 7 0 0 0 45 1
                                              51 50 0 52 1 53 0 50 54 2 22 24 8
                                              0 55 0 6 0 56 1 7 57 0 58 1 7 59
                                              0 60 2 7 0 0 0 63 1 7 59 0 64 2 7
                                              24 0 0 65 2 7 0 0 0 66 1 7 0 0 67
                                              2 7 0 0 0 68 1 7 70 0 71 2 36 24
                                              0 0 72 2 7 0 0 36 73 1 74 7 0 75
                                              1 7 24 0 76 1 77 33 7 78 1 74 7 0
                                              79 1 7 36 0 80 1 74 7 0 81 2 7 0
                                              36 0 82 1 7 0 0 83 3 7 0 0 8 84
                                              85 1 86 0 8 87 3 7 0 0 88 89 90 0
                                              51 0 91 1 7 0 0 92 2 7 0 0 0 93 1
                                              7 0 0 94 1 7 95 0 96 3 7 97 0 95
                                              97 98 1 51 24 0 99 0 7 0 100 2 53
                                              7 0 8 101 1 103 102 0 104 1 103 7
                                              0 105 1 19 7 7 106 2 7 24 0 8 107
                                              4 0 108 7 8 103 103 109 2 0 61 7
                                              8 62 4 1 108 7 8 103 103 109)))))
           '|lookupComplete|)) 
