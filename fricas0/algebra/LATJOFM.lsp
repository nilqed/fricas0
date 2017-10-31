
(SDEFUN |LATJOFM;proposition| ((|s| |String|) ($ $))
        (LIST (LIST (CONS 1 (LIST |s|))))) 

(SDEFUN |LATJOFM;logicT;$;2| (($ $)) (LIST (LIST (CONS 0 (LIST 'T))))) 

(SDEFUN |LATJOFM;logicF;$;3| (($ $)) (LIST (LIST (CONS 0 (LIST 'F))))) 

(PUT '|LATJOFM;emptyLattice;$;4| '|SPADreplace| '(XLAM NIL NIL)) 

(SDEFUN |LATJOFM;emptyLattice;$;4| (($ $)) NIL) 

(SDEFUN |LATJOFM;variable;S$;5| ((|v| |String|) ($ $))
        (LIST (LIST (CONS 1 (LIST |v|))))) 

(SDEFUN |LATJOFM;latticeJoinOfMeets;U$;6|
        ((|e| |Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
          (|:| |var| (|Record| (|:| |str| (|String|)))))
         ($ $))
        (LIST (LIST |e|))) 

(PUT '|LATJOFM;empty?;$B;7| '|SPADreplace| 'NULL) 

(SDEFUN |LATJOFM;empty?;$B;7| ((|n| $) ($ |Boolean|)) (NULL |n|)) 

(SDEFUN |LATJOFM;/\\;3$;8| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|r|
           (|List|
            (|List|
             (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                      (|:| |var| (|Record| (|:| |str| (|String|))))))))
          (|term|
           (|List|
            (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                     (|:| |var| (|Record| (|:| |str| (|String|)))))))
          (|termRight|
           #1=(|List|
               (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                        (|:| |var| (|Record| (|:| |str| (|String|)))))))
          (|termLeft| #1#) (#2=#:G786 NIL) (|innerb| NIL) (#3=#:G785 NIL)
          (|innera| NIL) (#4=#:G784 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |a| (QREFELT $ 17))
              (PROGN (LETT #4# |b| . #5=(|LATJOFM;/\\;3$;8|)) (GO #6=#:G783))))
            (COND
             ((SPADCALL |b| (QREFELT $ 17))
              (PROGN (LETT #4# |a| . #5#) (GO #6#))))
            (LETT |r| NIL . #5#)
            (SEQ (LETT |innera| NIL . #5#) (LETT #3# |a| . #5#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |innera| (CAR #3#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |innerb| NIL . #5#) (LETT #2# |b| . #5#) G190
                        (COND
                         ((OR (ATOM #2#)
                              (PROGN (LETT |innerb| (CAR #2#) . #5#) NIL))
                          (GO G191)))
                        (SEQ (LETT |termLeft| |innera| . #5#)
                             (LETT |termRight| |innerb| . #5#)
                             (LETT |term|
                                   (SPADCALL |termLeft| |termRight|
                                             (QREFELT $ 19))
                                   . #5#)
                             (EXIT
                              (LETT |r| (SPADCALL |r| |term| (QREFELT $ 21))
                                    . #5#)))
                        (LETT #2# (CDR #2#) . #5#) (GO G190) G191 (EXIT NIL))))
                 (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
            (EXIT (SPADCALL |r| (QREFELT $ 22)))))
          #6# (EXIT #4#)))) 

(SDEFUN |LATJOFM;\\/;3$;9| ((|a| $) (|b| $) ($ $))
        (SPROG ((#1=#:G795 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |a| (QREFELT $ 17))
                    (PROGN
                     (LETT #1# |b| . #2=(|LATJOFM;\\/;3$;9|))
                     (GO #3=#:G794))))
                  (COND
                   ((SPADCALL |b| (QREFELT $ 17))
                    (PROGN (LETT #1# |a| . #2#) (GO #3#))))
                  (EXIT
                   (SPADCALL (SPADCALL |a| |b| (QREFELT $ 24))
                             (QREFELT $ 22)))))
                #3# (EXIT #1#)))) 

(SDEFUN |LATJOFM;meet;L$;10| ((|ln| |List| $) ($ $))
        (SPROG ((|r| ($)) (#1=#:G799 NIL) (|ele| NIL))
               (SEQ
                (LETT |r| (SPADCALL (QREFELT $ 9)) . #2=(|LATJOFM;meet;L$;10|))
                (SEQ (LETT |ele| NIL . #2#) (LETT #1# |ln| . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |ele| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |r| (SPADCALL |r| |ele| (QREFELT $ 23)) . #2#)))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |r|)))) 

(SDEFUN |LATJOFM;join;L$;11| ((|ln| |List| $) ($ $))
        (SPROG ((|r| ($)) (#1=#:G803 NIL) (|ele| NIL))
               (SEQ
                (LETT |r| (SPADCALL (QREFELT $ 9)) . #2=(|LATJOFM;join;L$;11|))
                (SEQ (LETT |ele| NIL . #2#) (LETT #1# |ln| . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |ele| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |r| (SPADCALL |r| |ele| (QREFELT $ 25)) . #2#)))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |r|)))) 

(SDEFUN |LATJOFM;equalElements|
        ((|a| |Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
          (|:| |var| (|Record| (|:| |str| (|String|)))))
         (|b| |Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
          (|:| |var| (|Record| (|:| |str| (|String|)))))
         ($ |Boolean|))
        (SPROG ((#1=#:G817 NIL) (#2=#:G806 NIL) (#3=#:G807 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((QEQCAR |a| 1)
                    (PROGN
                     (LETT #1#
                           (EQUAL (QCAR (CDR |a|))
                                  (QCAR
                                   (PROG2
                                       (LETT #3# |b|
                                             . #4=(|LATJOFM;equalElements|))
                                       (QCDR #3#)
                                     (|check_union2| (QEQCAR #3# 1)
                                                     (|Record|
                                                      (|:| |str| (|String|)))
                                                     (|Union|
                                                      (|:| |const|
                                                           (|Record|
                                                            (|:| |val|
                                                                 (|Symbol|))))
                                                      (|:| |var|
                                                           (|Record|
                                                            (|:| |str|
                                                                 (|String|)))))
                                                     #3#))))
                           . #4#)
                     (GO #5=#:G816))))
                  (COND
                   ((QEQCAR |a| 0)
                    (COND
                     ((QEQCAR |b| 0)
                      (PROGN
                       (LETT #1#
                             (EQUAL
                              (QCAR
                               (PROG2 (LETT #2# |a| . #4#)
                                   (QCDR #2#)
                                 (|check_union2| (QEQCAR #2# 0)
                                                 (|Record|
                                                  (|:| |val| (|Symbol|)))
                                                 (|Union|
                                                  (|:| |const|
                                                       (|Record|
                                                        (|:| |val|
                                                             (|Symbol|))))
                                                  (|:| |var|
                                                       (|Record|
                                                        (|:| |str|
                                                             (|String|)))))
                                                 #2#)))
                              (QCAR (CDR |b|)))
                             . #4#)
                       (GO #5#))))))
                  (EXIT NIL)))
                #5# (EXIT #1#)))) 

(SDEFUN |LATJOFM;removeDuplicatesInTerm|
        ((|n| |List|
          (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                   (|:| |var| (|Record| (|:| |str| (|String|))))))
         ($ |List|
          (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                   (|:| |var| (|Record| (|:| |str| (|String|)))))))
        (SPROG
         ((|r|
           (|List|
            (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                     (|:| |var| (|Record| (|:| |str| (|String|)))))))
          (|match| (|Boolean|)) (#1=#:G833 NIL) (|e2| NIL) (#2=#:G834 NIL)
          (|ne2| NIL) (#3=#:G831 NIL) (|e1| NIL) (#4=#:G832 NIL) (|ne1| NIL))
         (SEQ (LETT |r| NIL . #5=(|LATJOFM;removeDuplicatesInTerm|))
              (SEQ (LETT |ne1| 1 . #5#) (LETT #4# (LENGTH |n|) . #5#)
                   (LETT |e1| NIL . #5#) (LETT #3# |n| . #5#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |e1| (CAR #3#) . #5#) NIL)
                         (|greater_SI| |ne1| #4#))
                     (GO G191)))
                   (SEQ (LETT |match| NIL . #5#)
                        (SEQ (LETT |ne2| 1 . #5#) (LETT #2# (LENGTH |n|) . #5#)
                             (LETT |e2| NIL . #5#) (LETT #1# |n| . #5#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |e2| (CAR #1#) . #5#) NIL)
                                   (|greater_SI| |ne2| #2#))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |e1| |e2| (QREFELT $ 29))
                                 (COND
                                  ((< |ne1| |ne2|)
                                   (LETT |match| 'T . #5#)))))))
                             (LETT #1#
                                   (PROG1 (CDR #1#)
                                     (LETT |ne2| (|inc_SI| |ne2|) . #5#))
                                   . #5#)
                             (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((NULL |match|)
                           (LETT |r| (SPADCALL |r| |e1| (QREFELT $ 30))
                                 . #5#)))))
                   (LETT #3#
                         (PROG1 (CDR #3#) (LETT |ne1| (|inc_SI| |ne1|) . #5#))
                         . #5#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |r|)))) 

(SDEFUN |LATJOFM;equalTerms|
        ((|a| |List|
          (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                   (|:| |var| (|Record| (|:| |str| (|String|))))))
         (|b| |List|
          (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                   (|:| |var| (|Record| (|:| |str| (|String|))))))
         ($ |Boolean|))
        (SPROG
         ((#1=#:G850 NIL) (|found| (|Boolean|)) (#2=#:G852 NIL) (|b1| NIL)
          (#3=#:G851 NIL) (|a1| NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (LENGTH |a|) (LENGTH |b|) (QREFELT $ 32))
              (PROGN
               (LETT #1# NIL . #4=(|LATJOFM;equalTerms|))
               (GO #5=#:G849))))
            (SEQ (LETT |a1| NIL . #4#) (LETT #3# |a| . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |a1| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ (LETT |found| NIL . #4#)
                      (SEQ (LETT |b1| NIL . #4#) (LETT #2# |b| . #4#) G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |b1| (CAR #2#) . #4#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((|LATJOFM;equalElements| |a1| |b1| $)
                               (LETT |found| 'T . #4#)))))
                           (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (COND
                        ((NULL |found|)
                         (PROGN (LETT #1# NIL . #4#) (GO #5#))))))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #5# (EXIT #1#)))) 

(SDEFUN |LATJOFM;subTerm|
        ((|a| |List|
          (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                   (|:| |var| (|Record| (|:| |str| (|String|))))))
         (|b| |List|
          (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                   (|:| |var| (|Record| (|:| |str| (|String|))))))
         ($ |Boolean|))
        (SPROG
         ((#1=#:G868 NIL) (|found| (|Boolean|)) (#2=#:G870 NIL) (|b1| NIL)
          (#3=#:G869 NIL) (|a1| NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((>= (LENGTH |a|) (LENGTH |b|))
              (PROGN (LETT #1# NIL . #4=(|LATJOFM;subTerm|)) (GO #5=#:G867))))
            (SEQ (LETT |a1| NIL . #4#) (LETT #3# |a| . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |a1| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ (LETT |found| NIL . #4#)
                      (SEQ (LETT |b1| NIL . #4#) (LETT #2# |b| . #4#) G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |b1| (CAR #2#) . #4#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((|LATJOFM;equalElements| |a1| |b1| $)
                               (LETT |found| 'T . #4#)))))
                           (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (COND
                        ((NULL |found|)
                         (PROGN (LETT #1# NIL . #4#) (GO #5#))))))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #5# (EXIT #1#)))) 

(SDEFUN |LATJOFM;redux;2$;16| ((|n| $) ($ $))
        (SPROG
         ((|r|
           (|List|
            (|List|
             (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                      (|:| |var| (|Record| (|:| |str| (|String|))))))))
          (|modified| #1=(|Boolean|)) (|isSubTerm| #1#) (#2=#:G884 NIL)
          (|inner| NIL) (|match| #1#) (#3=#:G882 NIL) (#4=#:G883 NIL)
          (|innern| NIL)
          (|newinnerList|
           (|List|
            (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                     (|:| |var| (|Record| (|:| |str| (|String|)))))))
          (#5=#:G880 NIL) (|outer| NIL) (#6=#:G881 NIL) (|outern| NIL))
         (SEQ (LETT |r| NIL . #7=(|LATJOFM;redux;2$;16|))
              (LETT |modified| NIL . #7#)
              (SEQ (LETT |outern| 1 . #7#) (LETT #6# (LENGTH |n|) . #7#)
                   (LETT |outer| NIL . #7#) (LETT #5# |n| . #7#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |outer| (CAR #5#) . #7#) NIL)
                         (|greater_SI| |outern| #6#))
                     (GO G191)))
                   (SEQ
                    (LETT |newinnerList|
                          (|LATJOFM;removeDuplicatesInTerm| |outer| $) . #7#)
                    (COND
                     ((NULL (|LATJOFM;equalTerms| |newinnerList| |outer| $))
                      (LETT |modified| 'T . #7#)))
                    (LETT |match| NIL . #7#)
                    (SEQ (LETT |innern| 1 . #7#) (LETT #4# (LENGTH |n|) . #7#)
                         (LETT |inner| NIL . #7#) (LETT #3# |n| . #7#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |inner| (CAR #3#) . #7#) NIL)
                               (|greater_SI| |innern| #4#))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((|LATJOFM;equalTerms| |inner| |outer| $)
                             (COND
                              ((< |innern| |outern|)
                               (LETT |match| 'T . #7#)))))))
                         (LETT #3#
                               (PROG1 (CDR #3#)
                                 (LETT |innern| (|inc_SI| |innern|) . #7#))
                               . #7#)
                         (GO G190) G191 (EXIT NIL))
                    (LETT |isSubTerm| NIL . #7#)
                    (SEQ (LETT |inner| NIL . #7#) (LETT #2# |n| . #7#) G190
                         (COND
                          ((OR (ATOM #2#)
                               (PROGN (LETT |inner| (CAR #2#) . #7#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((|LATJOFM;subTerm| |inner| |outer| $)
                             (LETT |isSubTerm| 'T . #7#)))))
                         (LETT #2# (CDR #2#) . #7#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND
                      ((OR |match| |isSubTerm|) (LETT |modified| 'T . #7#))
                      ('T
                       (LETT |r| (SPADCALL |r| |newinnerList| (QREFELT $ 21))
                             . #7#)))))
                   (LETT #5#
                         (PROG1 (CDR #5#)
                           (LETT |outern| (|inc_SI| |outern|) . #7#))
                         . #7#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND (|modified| (SPADCALL |r| (QREFELT $ 22))) ('T |r|)))))) 

(PUT '|LATJOFM;factor;$L;17| '|SPADreplace| 'LIST) 

(SDEFUN |LATJOFM;factor;$L;17| ((|n| $) ($ |List| $)) (LIST |n|)) 

(PUT '|LATJOFM;removeDup| '|SPADreplace| '(XLAM (|a| |b|) |a|)) 

(SDEFUN |LATJOFM;removeDup| ((|a| |List| $) (|b| |List| $) ($ |List| $)) |a|) 

(PUT '|LATJOFM;deductions;2L;19| '|SPADreplace| '(XLAM (|ln|) |ln|)) 

(SDEFUN |LATJOFM;deductions;2L;19| ((|ln| |List| $) ($ |List| $)) |ln|) 

(PUT '|LATJOFM;opType;$S;20| '|SPADreplace| '(XLAM (|n|) 'OTHER)) 

(SDEFUN |LATJOFM;opType;$S;20| ((|n| $) ($ |Symbol|)) 'OTHER) 

(PUT '|LATJOFM;atom?;$B;21| '|SPADreplace| '(XLAM (|n|) NIL)) 

(SDEFUN |LATJOFM;atom?;$B;21| ((|n| $) ($ |Boolean|)) NIL) 

(PUT '|LATJOFM;value;$S;22| '|SPADreplace| '(XLAM (|n|) 'C)) 

(SDEFUN |LATJOFM;value;$S;22| ((|n| $) ($ |Symbol|)) 'C) 

(PUT '|LATJOFM;getChildren;$L;23| '|SPADreplace| 'LIST) 

(SDEFUN |LATJOFM;getChildren;$L;23| ((|n| $) ($ |List| $)) (LIST |n|)) 

(PUT '|LATJOFM;=;2$B;24| '|SPADreplace| '(XLAM (|a| |b|) NIL)) 

(SDEFUN |LATJOFM;=;2$B;24| ((|a| $) (|b| $) ($ |Boolean|)) NIL) 

(SDEFUN |LATJOFM;toString;$S;25| ((|n| $) ($ |String|))
        (SPROG ((|a| (|String|)))
               (SEQ
                (LETT |a| (STRCONC "(" (SPADCALL |n| (QREFELT $ 41)))
                      . #1=(|LATJOFM;toString;$S;25|))
                (LETT |a| (STRCONC |a| ")") . #1#) (EXIT |a|)))) 

(SDEFUN |LATJOFM;stringVarOrLit|
        ((|a| |Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
          (|:| |var| (|Record| (|:| |str| (|String|)))))
         ($ |String|))
        (SPROG ((#1=#:G899 NIL) (#2=#:G820 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((QEQCAR |a| 1)
                    (PROGN
                     (LETT #1# (QCAR (CDR |a|))
                           . #3=(|LATJOFM;stringVarOrLit|))
                     (GO #4=#:G898))))
                  (COND
                   ((QEQCAR |a| 0)
                    (SEQ
                     (COND
                      ((EQUAL
                        (QCAR
                         (PROG2 (LETT #2# |a| . #3#)
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 0)
                                           (|Record| (|:| |val| (|Symbol|)))
                                           (|Union|
                                            (|:| |const|
                                                 (|Record|
                                                  (|:| |val| (|Symbol|))))
                                            (|:| |var|
                                                 (|Record|
                                                  (|:| |str| (|String|)))))
                                           #2#)))
                        'T)
                       (PROGN (LETT #1# "T" . #3#) (GO #4#))))
                     (EXIT (PROGN (LETT #1# "F" . #3#) (GO #4#))))))
                  (EXIT "error")))
                #4# (EXIT #1#)))) 

(SDEFUN |LATJOFM;toStringUnwrapped;$S;27| ((|n| $) ($ |String|))
        (SPROG
         ((|r| (|String|)) (#1=#:G912 NIL) (|inner| NIL) (#2=#:G913 NIL)
          (|innern| NIL) (|innerList| (|List| (|String|))) (#3=#:G910 NIL)
          (|outer| NIL) (#4=#:G911 NIL) (|outern| NIL)
          (|outerList| (|List| (|String|))))
         (SEQ (LETT |outerList| NIL . #5=(|LATJOFM;toStringUnwrapped;$S;27|))
              (LETT |r| "" . #5#)
              (SEQ (LETT |outern| 1 . #5#) (LETT #4# (LENGTH |n|) . #5#)
                   (LETT |outer| NIL . #5#) (LETT #3# |n| . #5#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |outer| (CAR #3#) . #5#) NIL)
                         (|greater_SI| |outern| #4#))
                     (GO G191)))
                   (SEQ (LETT |innerList| NIL . #5#)
                        (SEQ (LETT |innern| 1 . #5#)
                             (LETT #2# (LENGTH |outer|) . #5#)
                             (LETT |inner| NIL . #5#) (LETT #1# |outer| . #5#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |inner| (CAR #1#) . #5#) NIL)
                                   (|greater_SI| |innern| #2#))
                               (GO G191)))
                             (SEQ
                              (LETT |r|
                                    (STRCONC |r|
                                             (|LATJOFM;stringVarOrLit| |inner|
                                              $))
                                    . #5#)
                              (EXIT
                               (COND
                                ((SPADCALL |innern| (LENGTH |outer|)
                                           (QREFELT $ 32))
                                 (LETT |r| (STRCONC |r| "/\\") . #5#)))))
                             (LETT #1#
                                   (PROG1 (CDR #1#)
                                     (LETT |innern| (|inc_SI| |innern|) . #5#))
                                   . #5#)
                             (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((SPADCALL |outern| (LENGTH |n|) (QREFELT $ 32))
                           (LETT |r| (STRCONC |r| ")\\/(") . #5#)))))
                   (LETT #3#
                         (PROG1 (CDR #3#)
                           (LETT |outern| (|inc_SI| |outern|) . #5#))
                         . #5#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |r|)))) 

(SDEFUN |LATJOFM;outputVarOrLit|
        ((|a| |Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
          (|:| |var| (|Record| (|:| |str| (|String|)))))
         ($ |OutputForm|))
        (SPROG ((#1=#:G916 NIL) (#2=#:G820 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((QEQCAR |a| 1)
                    (PROGN
                     (LETT #1# (SPADCALL (QCAR (CDR |a|)) (QREFELT $ 44))
                           . #3=(|LATJOFM;outputVarOrLit|))
                     (GO #4=#:G915))))
                  (COND
                   ((QEQCAR |a| 0)
                    (PROGN
                     (LETT #1#
                           (SPADCALL
                            (QCAR
                             (PROG2 (LETT #2# |a| . #3#)
                                 (QCDR #2#)
                               (|check_union2| (QEQCAR #2# 0)
                                               (|Record|
                                                (|:| |val| (|Symbol|)))
                                               (|Union|
                                                (|:| |const|
                                                     (|Record|
                                                      (|:| |val| (|Symbol|))))
                                                (|:| |var|
                                                     (|Record|
                                                      (|:| |str| (|String|)))))
                                               #2#)))
                            (QREFELT $ 45))
                           . #3#)
                     (GO #4#))))
                  (EXIT "error")))
                #4# (EXIT #1#)))) 

(SDEFUN |LATJOFM;coerce;$Of;29| ((|n| $) ($ |OutputForm|))
        (SPROG
         ((|r| (|OutputForm|)) (#1=#:G929 NIL) (|inner| NIL) (#2=#:G930 NIL)
          (|innern| NIL) (|innerList| (|List| (|OutputForm|))) (#3=#:G927 NIL)
          (|outer| NIL) (#4=#:G928 NIL) (|outern| NIL)
          (|outerList| (|List| (|OutputForm|))))
         (SEQ (LETT |outerList| NIL . #5=(|LATJOFM;coerce;$Of;29|))
              (LETT |r| "(" . #5#)
              (SEQ (LETT |outern| 1 . #5#) (LETT #4# (LENGTH |n|) . #5#)
                   (LETT |outer| NIL . #5#) (LETT #3# |n| . #5#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |outer| (CAR #3#) . #5#) NIL)
                         (|greater_SI| |outern| #4#))
                     (GO G191)))
                   (SEQ (LETT |innerList| NIL . #5#)
                        (SEQ (LETT |innern| 1 . #5#)
                             (LETT #2# (LENGTH |outer|) . #5#)
                             (LETT |inner| NIL . #5#) (LETT #1# |outer| . #5#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |inner| (CAR #1#) . #5#) NIL)
                                   (|greater_SI| |innern| #2#))
                               (GO G191)))
                             (SEQ
                              (LETT |r|
                                    (SPADCALL |r|
                                              (|LATJOFM;outputVarOrLit| |inner|
                                               $)
                                              (QREFELT $ 46))
                                    . #5#)
                              (EXIT
                               (COND
                                ((SPADCALL |innern| (LENGTH |outer|)
                                           (QREFELT $ 32))
                                 (LETT |r| (SPADCALL |r| "/\\" (QREFELT $ 46))
                                       . #5#)))))
                             (LETT #1#
                                   (PROG1 (CDR #1#)
                                     (LETT |innern| (|inc_SI| |innern|) . #5#))
                                   . #5#)
                             (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((SPADCALL |outern| (LENGTH |n|) (QREFELT $ 32))
                           (LETT |r| (SPADCALL |r| ")\\/(" (QREFELT $ 46))
                                 . #5#)))))
                   (LETT #3#
                         (PROG1 (CDR #3#)
                           (LETT |outern| (|inc_SI| |outern|) . #5#))
                         . #5#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |r| ")" (QREFELT $ 46)))))) 

(SDEFUN |LATJOFM;coerce;$Lmoj;30| ((|n| $) ($ |LatticeMeetOfJoins|))
        (SPROG
         ((|r| #1=(|LatticeMeetOfJoins|)) (|term| #1#)
          (|ele| (|LatticeMeetOfJoins|)) (#2=#:G941 NIL) (|inner| NIL)
          (#3=#:G942 NIL) (|innern| NIL) (#4=#:G939 NIL) (|outer| NIL)
          (#5=#:G940 NIL) (|outern| NIL))
         (SEQ
          (LETT |r| (SPADCALL (QREFELT $ 49)) . #6=(|LATJOFM;coerce;$Lmoj;30|))
          (SEQ (LETT |outern| 1 . #6#) (LETT #5# (LENGTH |n|) . #6#)
               (LETT |outer| NIL . #6#) (LETT #4# |n| . #6#) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |outer| (CAR #4#) . #6#) NIL)
                     (|greater_SI| |outern| #5#))
                 (GO G191)))
               (SEQ (LETT |term| (SPADCALL (QREFELT $ 49)) . #6#)
                    (SEQ (LETT |innern| 1 . #6#)
                         (LETT #3# (LENGTH |outer|) . #6#)
                         (LETT |inner| NIL . #6#) (LETT #2# |outer| . #6#) G190
                         (COND
                          ((OR (ATOM #2#)
                               (PROGN (LETT |inner| (CAR #2#) . #6#) NIL)
                               (|greater_SI| |innern| #3#))
                           (GO G191)))
                         (SEQ
                          (LETT |ele| (SPADCALL |inner| (QREFELT $ 50)) . #6#)
                          (EXIT
                           (LETT |term| (SPADCALL |term| |ele| (QREFELT $ 51))
                                 . #6#)))
                         (LETT #2#
                               (PROG1 (CDR #2#)
                                 (LETT |innern| (|inc_SI| |innern|) . #6#))
                               . #6#)
                         (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (LETT |r| (SPADCALL |r| |term| (QREFELT $ 52)) . #6#)))
               (LETT #4#
                     (PROG1 (CDR #4#)
                       (LETT |outern| (|inc_SI| |outern|) . #6#))
                     . #6#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |r|)))) 

(SDEFUN |LATJOFM;coerce;Lmoj$;31| ((|n1| |LatticeMeetOfJoins|) ($ $))
        (SPROG
         ((|r| ($)) (|term| ($)) (|ele| ($)) (#1=#:G953 NIL) (|inner| NIL)
          (#2=#:G954 NIL) (|innern| NIL) (#3=#:G951 NIL) (|outer| NIL)
          (#4=#:G952 NIL) (|outern| NIL)
          (|n|
           (|List|
            (|List|
             (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                      (|:| |var| (|Record| (|:| |str| (|String|)))))))))
         (SEQ
          (LETT |r| (SPADCALL (QREFELT $ 9)) . #5=(|LATJOFM;coerce;Lmoj$;31|))
          (LETT |n| |n1| . #5#)
          (SEQ (LETT |outern| 1 . #5#) (LETT #4# (LENGTH |n|) . #5#)
               (LETT |outer| NIL . #5#) (LETT #3# |n| . #5#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |outer| (CAR #3#) . #5#) NIL)
                     (|greater_SI| |outern| #4#))
                 (GO G191)))
               (SEQ (LETT |term| (SPADCALL (QREFELT $ 9)) . #5#)
                    (SEQ (LETT |innern| 1 . #5#)
                         (LETT #2# (LENGTH |outer|) . #5#)
                         (LETT |inner| NIL . #5#) (LETT #1# |outer| . #5#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |inner| (CAR #1#) . #5#) NIL)
                               (|greater_SI| |innern| #2#))
                           (GO G191)))
                         (SEQ
                          (LETT |ele| (SPADCALL |inner| (QREFELT $ 15)) . #5#)
                          (EXIT
                           (LETT |term| (SPADCALL |term| |ele| (QREFELT $ 25))
                                 . #5#)))
                         (LETT #1#
                               (PROG1 (CDR #1#)
                                 (LETT |innern| (|inc_SI| |innern|) . #5#))
                               . #5#)
                         (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (LETT |r| (SPADCALL |r| |term| (QREFELT $ 23)) . #5#)))
               (LETT #3#
                     (PROG1 (CDR #3#)
                       (LETT |outern| (|inc_SI| |outern|) . #5#))
                     . #5#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |r|)))) 

(DECLAIM (NOTINLINE |LatticeJoinOfMeets;|)) 

(DEFUN |LatticeJoinOfMeets| ()
  (SPROG NIL
         (PROG (#1=#:G956)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|LatticeJoinOfMeets|)
                    . #2=(|LatticeJoinOfMeets|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|LatticeJoinOfMeets|
                             (LIST
                              (CONS NIL (CONS 1 (|LatticeJoinOfMeets;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|LatticeJoinOfMeets|)))))))))) 

(DEFUN |LatticeJoinOfMeets;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|LatticeJoinOfMeets|) . #1=(|LatticeJoinOfMeets|))
          (LETT $ (GETREFV 57) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|LatticeJoinOfMeets| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|List|
                     (|List|
                      (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                               (|:| |var|
                                    (|Record| (|:| |str| (|String|))))))))
          $))) 

(MAKEPROP '|LatticeJoinOfMeets| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| |LATJOFM;logicT;$;2|
              |LATJOFM;logicF;$;3| |LATJOFM;emptyLattice;$;4| (|String|)
              |LATJOFM;variable;S$;5| (|Record| (|:| |val| 35))
              (|Record| (|:| |str| 10))
              (|Union| (|:| |const| 12) (|:| |var| 13))
              |LATJOFM;latticeJoinOfMeets;U$;6| (|Boolean|)
              |LATJOFM;empty?;$B;7| (|List| 14) (0 . |concat|) (|List| 18)
              (6 . |concat|) |LATJOFM;redux;2$;16| |LATJOFM;/\\;3$;8|
              (12 . |concat|) |LATJOFM;\\/;3$;9| (|List| $)
              |LATJOFM;meet;L$;10| |LATJOFM;join;L$;11| (18 . =)
              (24 . |concat|) (|NonNegativeInteger|) (30 . ~=)
              |LATJOFM;factor;$L;17| |LATJOFM;deductions;2L;19| (|Symbol|)
              |LATJOFM;opType;$S;20| |LATJOFM;atom?;$B;21|
              |LATJOFM;value;$S;22| |LATJOFM;getChildren;$L;23|
              |LATJOFM;=;2$B;24| |LATJOFM;toStringUnwrapped;$S;27|
              |LATJOFM;toString;$S;25| (|OutputForm|) (36 . |coerce|)
              (41 . |coerce|) (46 . |hconcat|) |LATJOFM;coerce;$Of;29|
              (|LatticeMeetOfJoins|) (52 . |emptyLattice|)
              (56 . |latticeMeetOfJoins|) (61 . |/\\|) (67 . |\\/|)
              |LATJOFM;coerce;$Lmoj;30| |LATJOFM;coerce;Lmoj$;31| (|HashState|)
              (|SingleInteger|))
           '#(~= 73 |variable| 79 |value| 84 |toStringUnwrapped| 89 |toString|
              94 |redux| 99 |opType| 104 |meet| 109 |logicT| 114 |logicF| 118
              |latticeJoinOfMeets| 122 |latex| 127 |join| 132 |hashUpdate!| 137
              |hash| 143 |getChildren| 148 |factor| 153 |emptyLattice| 158
              |empty?| 162 |deductions| 167 |coerce| 172 |atom?| 187 |_\|_| 192
              |\\/| 196 T$ 202 = 206 |/\\| 212)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(NIL NIL NIL NIL NIL NIL NIL NIL |SetCategory&|
                     |BasicType&| NIL)
                  (CONS
                   '#((|BoundedDistributiveLattice|) (|BoundedLattice|)
                      (|DistributiveLattice|) (|BoundedMeetSemilattice|)
                      (|Lattice|) (|BoundedJoinSemilattice|)
                      (|MeetSemilattice|) (|JoinSemilattice|) (|SetCategory|)
                      (|BasicType|) (|CoercibleTo| 43))
                   (|makeByteWordVec2| 56
                                       '(2 18 0 0 0 19 2 20 0 0 18 21 2 20 0 0
                                         0 24 2 14 16 0 0 29 2 18 0 0 14 30 2
                                         31 16 0 0 32 1 10 43 0 44 1 35 43 0 45
                                         2 43 0 0 0 46 0 48 0 49 1 48 0 14 50 2
                                         48 0 0 0 51 2 48 0 0 0 52 2 0 16 0 0 1
                                         1 0 0 10 11 1 0 35 0 38 1 0 10 0 41 1
                                         0 10 0 42 1 0 0 0 22 1 0 35 0 36 1 0 0
                                         26 27 0 0 0 7 0 0 0 8 1 0 0 14 15 1 0
                                         10 0 1 1 0 0 26 28 2 0 55 55 0 1 1 0
                                         56 0 1 1 0 26 0 39 1 0 26 0 33 0 0 0 9
                                         1 0 16 0 17 1 0 26 26 34 1 0 0 48 54 1
                                         0 48 0 53 1 0 43 0 47 1 0 16 0 37 0 0
                                         0 1 2 0 0 0 0 25 0 0 0 1 2 0 16 0 0 40
                                         2 0 0 0 0 23)))))
           '|lookupComplete|)) 

(MAKEPROP '|LatticeJoinOfMeets| 'NILADIC T) 
