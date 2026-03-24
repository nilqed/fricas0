
(PUT '|BITST;starts;L%;1| '|SPADreplace| 'LIST) 

(SDEFUN |BITST;starts;L%;1| ((|index| (|List| (|Boolean|))) (% (%)))
        (LIST |index|)) 

(SDEFUN |BITST;starts;S%;2| ((|str| (|String|)) (% (%)))
        (SPROG
         ((|res| (|List| (|Boolean|))) (#1=#:G11 NIL) (|c| NIL)
          (|cs| (|List| (|Character|))))
         (SEQ (LETT |res| NIL) (LETT |cs| (SPADCALL |str| (QREFELT % 11)))
              (SEQ (LETT |c| NIL) (LETT #1# |cs|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     ((|eql_SI| |c| (|STR_to_CHAR| "0"))
                      (LETT |res| (SPADCALL |res| NIL (QREFELT % 13)))))
                    (EXIT
                     (COND
                      ((|eql_SI| |c| (|STR_to_CHAR| "1"))
                       (LETT |res| (SPADCALL |res| 'T (QREFELT % 13)))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (LIST |res|))))) 

(SDEFUN |BITST;/\\;3%;3| ((|a| (%)) (|b| (%)) (% (%)))
        (SPROG ((|res| (|List| (|List| (|Boolean|)))))
               (SEQ (LETT |res| (SPADCALL |a| |b| (QREFELT % 16)))
                    (EXIT |res|)))) 

(SDEFUN |BITST;\\/;3%;4| ((|a| (%)) (|b| (%)) (% (%)))
        (SPROG ((|res| (|List| (|List| (|Boolean|)))))
               (SEQ (LETT |res| (SPADCALL |a| |b| (QREFELT % 16)))
                    (EXIT |res|)))) 

(PUT '|BITST;hash| '|SPADreplace| '(XLAM (|s|) 0)) 

(SDEFUN |BITST;hash| ((|s| (%)) (% (|SingleInteger|))) 0) 

(SDEFUN |BITST;=;2%B;6| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG
         ((#1=#:G23 NIL) (#2=#:G24 NIL) (|i| NIL)
          (|len| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (LENGTH |x|) (LENGTH |y|) (QREFELT % 20))
              (PROGN (LETT #1# NIL) (GO #3=#:G22))))
            (LETT |len| (LENGTH |x|))
            (SEQ (LETT |i| 1) (LETT #2# |len|) G190
                 (COND ((|greater_SI| |i| #2#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |x| |i| (QREFELT % 21))
                               (SPADCALL |y| |i| (QREFELT % 21))
                               (QREFELT % 22))
                     (PROGN (LETT #1# NIL) (GO #3#))))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #3# (EXIT #1#)))) 

(SDEFUN |BITST;~=;2%B;7| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (NULL (SPADCALL |x| |y| (QREFELT % 23)))) 

(SDEFUN |BITST;coerce;%Of;8| ((|s| (%)) (% (|OutputForm|)))
        (SPROG
         ((|cs| (|List| (|OutputForm|))) (|c| (|OutputForm|))
          (|r| (|List| #1=(|OutputForm|))) (|ro| #1#) (#2=#:G35 NIL) (|x| NIL)
          (#3=#:G34 NIL) (|row| NIL))
         (SEQ (LETT |cs| NIL)
              (SEQ (LETT |row| NIL) (LETT #3# |s|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |row| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |r| (LIST (SPADCALL "starts:" (QREFELT % 26))))
                        (SEQ (LETT |x| NIL) (LETT #2# |row|) G190
                             (COND
                              ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ (LETT |ro| (SPADCALL "0" (QREFELT % 26)))
                                  (COND
                                   (|x|
                                    (LETT |ro| (SPADCALL "1" (QREFELT % 26)))))
                                  (EXIT
                                   (LETT |r|
                                         (SPADCALL |r| |ro| (QREFELT % 28)))))
                             (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                        (LETT |c| (SPADCALL |r| (QREFELT % 30)))
                        (EXIT (LETT |cs| (SPADCALL |cs| |c| (QREFELT % 28)))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |cs| (QREFELT % 31)))))) 

(DECLAIM (NOTINLINE |BitStreamFrame;|)) 

(DEFUN |BitStreamFrame;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|BitStreamFrame|))
          (LETT % (GETREFV 33))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|BitStreamFrame| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6 (|List| (|List| (|Boolean|))))
          %))) 

(DEFUN |BitStreamFrame| ()
  (SPROG NIL
         (PROG (#1=#:G37)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|BitStreamFrame|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|BitStreamFrame|
                             (LIST (CONS NIL (CONS 1 (|BitStreamFrame;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|BitStreamFrame|)))))))))) 

(MAKEPROP '|BitStreamFrame| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|List| 12) |BITST;starts;L%;1|
              (|List| (|Character|)) (|String|) (0 . |entries|) (|Boolean|)
              (5 . |concat|) |BITST;starts;S%;2| (|List| 7) (11 . |concat|)
              |BITST;/\\;3%;3| |BITST;\\/;3%;4| (|Integer|) (17 . ~=)
              (23 . |elt|) (29 . ~=) |BITST;=;2%B;6| |BITST;~=;2%B;7|
              (|OutputForm|) (35 . |message|) (|List| 25) (40 . |concat|)
              (|List| %) (46 . |hconcat|) (51 . |vconcat|)
              |BITST;coerce;%Of;8|)
           '#(~= 56 |starts| 62 |latex| 72 |coerce| 77 |\\/| 82 = 88 |/\\| 94)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0))
                 (CONS '#(NIL NIL NIL |SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|Lattice|) (|JoinSemilattice|) (|MeetSemilattice|)
                           (|SetCategory|) (|CoercibleTo| 25) (|BasicType|))
                        (|makeByteWordVec2| 32
                                            '(1 10 9 0 11 2 7 0 0 12 13 2 15 0
                                              0 0 16 2 19 12 0 0 20 2 6 7 0 19
                                              21 2 7 12 0 0 22 1 25 0 10 26 2
                                              27 0 0 25 28 1 25 0 29 30 1 25 0
                                              29 31 2 0 12 0 0 24 1 0 0 10 14 1
                                              0 0 7 8 1 0 10 0 1 1 0 25 0 32 2
                                              0 0 0 0 18 2 0 12 0 0 23 2 0 0 0
                                              0 17)))))
           '|lookupComplete|)) 
