
(PUT '|BITST;starts;L$;1| '|SPADreplace| 'LIST) 

(SDEFUN |BITST;starts;L$;1| ((|index| |List| (|Boolean|)) ($ $)) (LIST |index|)) 

(SDEFUN |BITST;starts;S$;2| ((|str| |String|) ($ $))
        (SPROG
         ((|res| (|List| (|Boolean|))) (#1=#:G719 NIL) (|c| NIL)
          (|cs| (|List| (|Character|))))
         (SEQ (LETT |res| NIL . #2=(|BITST;starts;S$;2|))
              (LETT |cs| (SPADCALL |str| (QREFELT $ 11)) . #2#)
              (SEQ (LETT |c| NIL . #2#) (LETT #1# |cs| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     ((|eql_SI| |c| (|STR_to_CHAR| "0"))
                      (LETT |res| (SPADCALL |res| NIL (QREFELT $ 13)) . #2#)))
                    (EXIT
                     (COND
                      ((|eql_SI| |c| (|STR_to_CHAR| "1"))
                       (LETT |res| (SPADCALL |res| 'T (QREFELT $ 13))
                             . #2#)))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (LIST |res|))))) 

(SDEFUN |BITST;/\\;3$;3| ((|a| $) (|b| $) ($ $))
        (SPROG ((|res| (|List| (|List| (|Boolean|)))))
               (SEQ
                (LETT |res| (SPADCALL |a| |b| (QREFELT $ 16)) |BITST;/\\;3$;3|)
                (EXIT |res|)))) 

(SDEFUN |BITST;\\/;3$;4| ((|a| $) (|b| $) ($ $))
        (SPROG ((|res| (|List| (|List| (|Boolean|)))))
               (SEQ
                (LETT |res| (SPADCALL |a| |b| (QREFELT $ 16)) |BITST;\\/;3$;4|)
                (EXIT |res|)))) 

(PUT '|BITST;hash;$Si;5| '|SPADreplace| '(XLAM (|s|) 0)) 

(SDEFUN |BITST;hash;$Si;5| ((|s| $) ($ |SingleInteger|)) 0) 

(SDEFUN |BITST;latex;$S;6| ((|n| $) ($ |String|))
        (SPROG ((|s| (|String|)))
               (SEQ (LETT |s| "" |BITST;latex;$S;6|) (EXIT |s|)))) 

(SDEFUN |BITST;=;2$B;7| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G732 NIL) (#2=#:G733 NIL) (|i| NIL)
          (|len| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (LENGTH |x|) (LENGTH |y|) (QREFELT $ 23))
              (PROGN (LETT #1# NIL . #3=(|BITST;=;2$B;7|)) (GO #4=#:G731))))
            (LETT |len| (LENGTH |x|) . #3#)
            (SEQ (LETT |i| 1 . #3#) (LETT #2# |len| . #3#) G190
                 (COND ((|greater_SI| |i| #2#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |x| |i| (QREFELT $ 25))
                               (SPADCALL |y| |i| (QREFELT $ 25))
                               (QREFELT $ 26))
                     (PROGN (LETT #1# NIL . #3#) (GO #4#))))))
                 (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #4# (EXIT #1#)))) 

(SDEFUN |BITST;~=;2$B;8| ((|x| $) (|y| $) ($ |Boolean|))
        (NULL (SPADCALL |x| |y| (QREFELT $ 27)))) 

(SDEFUN |BITST;coerce;$Of;9| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|cs| (|List| (|OutputForm|))) (|c| (|OutputForm|))
          (|r| (|List| (|OutputForm|))) (|ro| (|OutputForm|)) (#1=#:G742 NIL)
          (|x| NIL) (#2=#:G741 NIL) (|row| NIL))
         (SEQ (LETT |cs| NIL . #3=(|BITST;coerce;$Of;9|))
              (SEQ (LETT |row| NIL . #3#) (LETT #2# |s| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |row| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ (LETT |r| (LIST "starts:") . #3#)
                        (SEQ (LETT |x| NIL . #3#) (LETT #1# |row| . #3#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ (LETT |ro| "0" . #3#)
                                  (COND (|x| (LETT |ro| "1" . #3#)))
                                  (EXIT
                                   (LETT |r| (SPADCALL |r| |ro| (QREFELT $ 31))
                                         . #3#)))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |c| (SPADCALL |r| (QREFELT $ 33)) . #3#)
                        (EXIT
                         (LETT |cs| (SPADCALL |cs| |c| (QREFELT $ 31)) . #3#)))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |cs| (QREFELT $ 34)))))) 

(DECLAIM (NOTINLINE |BitStreamFrame;|)) 

(DEFUN |BitStreamFrame| ()
  (SPROG NIL
         (PROG (#1=#:G744)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|BitStreamFrame|)
                    . #2=(|BitStreamFrame|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|BitStreamFrame|
                             (LIST (CONS NIL (CONS 1 (|BitStreamFrame;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|BitStreamFrame|)))))))))) 

(DEFUN |BitStreamFrame;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|BitStreamFrame|) . #1=(|BitStreamFrame|))
          (LETT $ (GETREFV 37) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|BitStreamFrame| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6 (|List| (|List| (|Boolean|))))
          $))) 

(MAKEPROP '|BitStreamFrame| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|List| 12) |BITST;starts;L$;1|
              (|List| (|Character|)) (|String|) (0 . |entries|) (|Boolean|)
              (5 . |concat|) |BITST;starts;S$;2| (|List| 7) (11 . |concat|)
              |BITST;/\\;3$;3| |BITST;\\/;3$;4| (|SingleInteger|)
              |BITST;hash;$Si;5| |BITST;latex;$S;6| (|NonNegativeInteger|)
              (17 . ~=) (|Integer|) (23 . |elt|) (29 . ~=) |BITST;=;2$B;7|
              |BITST;~=;2$B;8| (|OutputForm|) (|List| 29) (35 . |concat|)
              (|List| $) (41 . |hconcat|) (46 . |vconcat|) |BITST;coerce;$Of;9|
              (|HashState|))
           '#(~= 51 |starts| 57 |latex| 67 |hashUpdate!| 72 |hash| 78 |coerce|
              83 |\\/| 88 = 94 |/\\| 100)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0))
                 (CONS '#(NIL NIL NIL |SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|Lattice|) (|MeetSemilattice|) (|JoinSemilattice|)
                           (|SetCategory|) (|BasicType|) (|CoercibleTo| 29))
                        (|makeByteWordVec2| 36
                                            '(1 10 9 0 11 2 7 0 0 12 13 2 15 0
                                              0 0 16 2 22 12 0 0 23 2 6 7 0 24
                                              25 2 7 12 0 0 26 2 30 0 0 29 31 1
                                              29 0 32 33 1 29 0 32 34 2 0 12 0
                                              0 28 1 0 0 7 8 1 0 0 10 14 1 0 10
                                              0 21 2 0 36 36 0 1 1 0 19 0 20 1
                                              0 29 0 35 2 0 0 0 0 18 2 0 12 0 0
                                              27 2 0 0 0 0 17)))))
           '|lookupComplete|)) 

(MAKEPROP '|BitStreamFrame| 'NILADIC T) 
