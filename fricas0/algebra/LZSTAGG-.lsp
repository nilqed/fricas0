
(SDEFUN |LZSTAGG-;=;2AB;1| ((|x| A) (|y| A) ($ |Boolean|))
        (SEQ
         (COND ((SPADCALL |x| |y| (QREFELT $ 9)) 'T)
               (#1='T
                (SEQ
                 (COND
                  ((SPADCALL |x| (QREFELT $ 10))
                   (COND
                    ((SPADCALL |y| (QREFELT $ 10))
                     (EXIT
                      (SPADCALL (SPADCALL |x| (QREFELT $ 12))
                                (SPADCALL |y| (QREFELT $ 12))
                                (QREFELT $ 13)))))))
                 (COND
                  ((SPADCALL |x| (QREFELT $ 14))
                   (COND
                    ((SPADCALL |y| (QREFELT $ 14))
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL |x| (QREFELT $ 15))
                                  (SPADCALL |y| (QREFELT $ 15)) (QREFELT $ 16))
                        (EQ (SPADCALL |x| (QREFELT $ 17))
                            (SPADCALL |y| (QREFELT $ 17))))
                       (#1# NIL)))))))
                 (EXIT NIL)))))) 

(SDEFUN |LZSTAGG-;less?;ANniB;2|
        ((|x| A) (|n| |NonNegativeInteger|) ($ |Boolean|))
        (SPROG ((#1=#:G816 NIL))
               (COND ((EQL |n| 0) NIL) ((SPADCALL |x| (QREFELT $ 19)) 'T)
                     ('T
                      (SPADCALL (SPADCALL |x| (QREFELT $ 17))
                                (PROG1
                                    (LETT #1# (- |n| 1)
                                          |LZSTAGG-;less?;ANniB;2|)
                                  (|check_subtype2| (>= #1# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #1#))
                                (QREFELT $ 21)))))) 

(SDEFUN |LZSTAGG-;more?;ANniB;3|
        ((|x| A) (|n| |NonNegativeInteger|) ($ |Boolean|))
        (SPROG ((#1=#:G819 NIL))
               (COND ((SPADCALL |x| (QREFELT $ 19)) NIL) ((EQL |n| 0) 'T)
                     ('T
                      (SPADCALL (SPADCALL |x| (QREFELT $ 17))
                                (PROG1
                                    (LETT #1# (- |n| 1)
                                          |LZSTAGG-;more?;ANniB;3|)
                                  (|check_subtype2| (>= #1# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #1#))
                                (QREFELT $ 23)))))) 

(SDEFUN |LZSTAGG-;size?;ANniB;4|
        ((|x| A) (|n| |NonNegativeInteger|) ($ |Boolean|))
        (SPROG ((#1=#:G822 NIL))
               (COND ((SPADCALL |x| (QREFELT $ 19)) (EQL |n| 0))
                     ('T
                      (SPADCALL (SPADCALL |x| (QREFELT $ 17))
                                (PROG1
                                    (LETT #1# (- |n| 1)
                                          |LZSTAGG-;size?;ANniB;4|)
                                  (|check_subtype2| (>= #1# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #1#))
                                (QREFELT $ 25)))))) 

(SDEFUN |LZSTAGG-;#;ANni;5| ((|x| A) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G834 NIL) (|y| (A)) (#2=#:G835 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |y| |x| . #3=(|LZSTAGG-;#;ANni;5|))
                      (EXIT
                       (SEQ (LETT |i| 0 . #3#) G190 NIL
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL |y| (QREFELT $ 27))
                                (PROGN (LETT #2# |i| . #3#) (GO #4=#:G833)))
                               ((SPADCALL |y| (QREFELT $ 28))
                                (|error| "#: infinite stream"))
                               ('T
                                (SEQ
                                 (EXIT
                                  (SEQ
                                   (LETT |y| (SPADCALL |y| (QREFELT $ 17))
                                         . #3#)
                                   (COND
                                    ((ODDP |i|)
                                     (LETT |x| (SPADCALL |x| (QREFELT $ 17))
                                           . #3#)))
                                   (EXIT
                                    (COND
                                     ((SPADCALL |x| |y| (QREFELT $ 9))
                                      (PROGN
                                       (LETT #1# (|error| "#: infinite stream")
                                             . #3#)
                                       (GO #5=#:G828)))))))
                                 #5# (EXIT #1#))))))
                            (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                            (EXIT NIL)))))
                #4# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;any?;MAB;6|
        ((|f| |Mapping| (|Boolean|) S) (|x| A) ($ |Boolean|))
        (SPROG ((#1=#:G845 NIL) (#2=#:G846 NIL) (|y| (A)) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |y| |x| . #3=(|LZSTAGG-;any?;MAB;6|))
                      (EXIT
                       (SEQ (LETT |i| 0 . #3#) G190 NIL
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL |y| (QREFELT $ 27))
                                (PROGN (LETT #2# NIL . #3#) (GO #4=#:G844)))
                               ((SPADCALL |y| (QREFELT $ 28))
                                (|error| "any?: infinite stream"))
                               ((SPADCALL (SPADCALL |y| (QREFELT $ 15)) |f|)
                                (PROGN (LETT #2# 'T . #3#) (GO #4#)))
                               ('T
                                (SEQ
                                 (EXIT
                                  (SEQ
                                   (LETT |y| (SPADCALL |y| (QREFELT $ 17))
                                         . #3#)
                                   (COND
                                    ((ODDP |i|)
                                     (LETT |x| (SPADCALL |x| (QREFELT $ 17))
                                           . #3#)))
                                   (EXIT
                                    (COND
                                     ((SPADCALL |x| |y| (QREFELT $ 9))
                                      (PROGN
                                       (LETT #1#
                                             (PROGN
                                              (LETT #2# NIL . #3#)
                                              (GO #4#))
                                             . #3#)
                                       (GO #5=#:G837)))))))
                                 #5# (EXIT #1#))))))
                            (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                            (EXIT NIL)))))
                #4# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;every?;MAB;7|
        ((|f| |Mapping| (|Boolean|) S) (|x| A) ($ |Boolean|))
        (SPROG ((#1=#:G855 NIL) (#2=#:G856 NIL) (|y| (A)) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |y| |x| . #3=(|LZSTAGG-;every?;MAB;7|))
                      (EXIT
                       (SEQ (LETT |i| 0 . #3#) G190 NIL
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL |y| (QREFELT $ 27))
                                (PROGN (LETT #2# 'T . #3#) (GO #4=#:G854)))
                               ((SPADCALL |y| (QREFELT $ 28))
                                (|error| "every?: infinite stream"))
                               ('T
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((NULL
                                     (SPADCALL (SPADCALL |y| (QREFELT $ 15))
                                               |f|))
                                    (PROGN (LETT #2# NIL . #3#) (GO #4#)))
                                   ('T
                                    (SEQ
                                     (LETT |y| (SPADCALL |y| (QREFELT $ 17))
                                           . #3#)
                                     (COND
                                      ((ODDP |i|)
                                       (LETT |x| (SPADCALL |x| (QREFELT $ 17))
                                             . #3#)))
                                     (EXIT
                                      (COND
                                       ((SPADCALL |x| |y| (QREFELT $ 9))
                                        (PROGN
                                         (LETT #1#
                                               (PROGN
                                                (LETT #2# 'T . #3#)
                                                (GO #4#))
                                               . #3#)
                                         (GO #5=#:G849)))))))))
                                 #5# (EXIT #1#))))))
                            (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                            (EXIT NIL)))))
                #4# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;entries;AL;8| ((|x| A) ($ |List| S))
        (SPROG
         ((#1=#:G864 NIL) (|y| (A)) (|l| (|List| S)) (#2=#:G865 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |y| |x| . #3=(|LZSTAGG-;entries;AL;8|))
                (LETT |l| NIL . #3#)
                (EXIT
                 (SEQ (LETT |i| 0 . #3#) G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |y| (QREFELT $ 27))
                          (PROGN
                           (LETT #2# (NREVERSE |l|) . #3#)
                           (GO #4=#:G863)))
                         ((SPADCALL |y| (QREFELT $ 28))
                          (|error| "infinite stream"))
                         ('T
                          (SEQ
                           (EXIT
                            (SEQ
                             (LETT |l| (CONS (SPADCALL |y| (QREFELT $ 15)) |l|)
                                   . #3#)
                             (LETT |y| (SPADCALL |y| (QREFELT $ 17)) . #3#)
                             (COND
                              ((ODDP |i|)
                               (LETT |x| (SPADCALL |x| (QREFELT $ 17)) . #3#)))
                             (EXIT
                              (COND
                               ((SPADCALL |x| |y| (QREFELT $ 9))
                                (PROGN
                                 (LETT #1# (|error| "infinite stream") . #3#)
                                 (GO #5=#:G858)))))))
                           #5# (EXIT #1#))))))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT NIL)))))
          #4# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;construct;LA;9| ((|l| |List| S) ($ A))
        (COND ((NULL |l|) (SPADCALL (QREFELT $ 34)))
              ('T
               (SPADCALL (|SPADfirst| |l|) (SPADCALL (CDR |l|) (QREFELT $ 35))
                         (QREFELT $ 36))))) 

(SDEFUN |LZSTAGG-;elt;AIS;10| ((|x| A) (|n| |Integer|) ($ S))
        (COND
         ((OR (< |n| 1) (SPADCALL |x| (QREFELT $ 19)))
          (|error| "elt: no such element"))
         ('T
          (COND ((EQL |n| 1) (SPADCALL |x| (QREFELT $ 15)))
                ('T
                 (SPADCALL (SPADCALL |x| (QREFELT $ 17)) (- |n| 1)
                           (QREFELT $ 39))))))) 

(SDEFUN |LZSTAGG-;elt;AI2S;11| ((|x| A) (|n| |Integer|) (|s| S) ($ S))
        (COND ((OR (< |n| 1) (SPADCALL |x| (QREFELT $ 19))) |s|)
              ('T
               (COND ((EQL |n| 1) (SPADCALL |x| (QREFELT $ 15)))
                     ('T
                      (SPADCALL (SPADCALL |x| (QREFELT $ 17)) (- |n| 1)
                                (QREFELT $ 39))))))) 

(SDEFUN |LZSTAGG-;indexx?| ((|n| |Integer|) (|x| A) ($ |Boolean|))
        (COND ((SPADCALL |x| (QREFELT $ 19)) NIL) ((EQL |n| 1) 'T)
              ('T
               (|LZSTAGG-;indexx?| (- |n| 1) (SPADCALL |x| (QREFELT $ 17)) $)))) 

(SDEFUN |LZSTAGG-;index?;IAB;13| ((|n| |Integer|) (|x| A) ($ |Boolean|))
        (COND ((< |n| 1) NIL) ('T (|LZSTAGG-;indexx?| |n| |x| $)))) 

(SDEFUN |LZSTAGG-;indices;AL;14| ((|x| A) ($ |List| (|Integer|)))
        (SPROG
         ((#1=#:G884 NIL) (|y| (A)) (|l| (|List| (|Integer|))) (#2=#:G885 NIL)
          (|i| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |y| |x| . #3=(|LZSTAGG-;indices;AL;14|))
                (LETT |l| NIL . #3#)
                (EXIT
                 (SEQ (LETT |i| 1 . #3#) G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |y| (QREFELT $ 27))
                          (PROGN
                           (LETT #2# (NREVERSE |l|) . #3#)
                           (GO #4=#:G883)))
                         ((SPADCALL |y| (QREFELT $ 28))
                          (|error| "indices: infinite stream"))
                         ('T
                          (SEQ
                           (EXIT
                            (SEQ (LETT |l| (CONS |i| |l|) . #3#)
                                 (LETT |y| (SPADCALL |y| (QREFELT $ 17)) . #3#)
                                 (COND
                                  ((ODDP |i|)
                                   (LETT |x| (SPADCALL |x| (QREFELT $ 17))
                                         . #3#)))
                                 (EXIT
                                  (COND
                                   ((SPADCALL |x| |y| (QREFELT $ 9))
                                    (PROGN
                                     (LETT #1#
                                           (|error| "indices: infinite stream")
                                           . #3#)
                                     (GO #5=#:G878)))))))
                           #5# (EXIT #1#))))))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT NIL)))))
          #4# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;maxIndex;AI;15| ((|x| A) ($ |Integer|))
        (SPROG ((#1=#:G894 NIL) (|y| (A)) (#2=#:G895 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |x| (QREFELT $ 19))
                   (|error| "maxIndex: no maximal index for empty stream"))
                  ('T
                   (SEQ
                    (LETT |y| (SPADCALL |x| (QREFELT $ 17))
                          . #3=(|LZSTAGG-;maxIndex;AI;15|))
                    (EXIT
                     (SEQ (LETT |i| 1 . #3#) G190 NIL
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |y| (QREFELT $ 27))
                              (PROGN (LETT #2# |i| . #3#) (GO #4=#:G893)))
                             ((SPADCALL |y| (QREFELT $ 28))
                              (|error| "maxIndex: infinite stream"))
                             ('T
                              (SEQ
                               (EXIT
                                (SEQ
                                 (LETT |y| (SPADCALL |y| (QREFELT $ 17)) . #3#)
                                 (COND
                                  ((ODDP |i|)
                                   (LETT |x| (SPADCALL |x| (QREFELT $ 17))
                                         . #3#)))
                                 (EXIT
                                  (COND
                                   ((SPADCALL |x| |y| (QREFELT $ 9))
                                    (PROGN
                                     (LETT #1#
                                           (|error|
                                            "maxIndex: infinite stream")
                                           . #3#)
                                     (GO #5=#:G887)))))))
                               #5# (EXIT #1#))))))
                          (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                          (EXIT NIL)))))))
                #4# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;minIndex;AI;16| ((|x| A) ($ |Integer|))
        (COND
         ((SPADCALL |x| (QREFELT $ 19))
          (|error| "minIndex: no minimal index for empty stream"))
         ('T 1))) 

(SDEFUN |LZSTAGG-;delete;AIA;17| ((|x| A) (|n| |Integer|) ($ A))
        (SPROG ((#1=#:G900 NIL) (#2=#:G899 NIL))
               (COND
                ((NULL (SPADCALL |n| |x| (QREFELT $ 47)))
                 (|error| "delete: index out of range"))
                ('T
                 (SPADCALL
                  (SPADCALL |x|
                            (PROG1
                                (LETT #2# (- |n| 1)
                                      . #3=(|LZSTAGG-;delete;AIA;17|))
                              (|check_subtype2| (>= #2# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #2#))
                            (QREFELT $ 48))
                  (SPADCALL |x|
                            (PROG1 (LETT #1# (+ (- |n| 1) 1) . #3#)
                              (|check_subtype2| (>= #1# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #1#))
                            (QREFELT $ 49))
                  (QREFELT $ 50)))))) 

(SDEFUN |LZSTAGG-;delete;AUsA;18|
        ((|x| A) (|seg| |UniversalSegment| (|Integer|)) ($ A))
        (SPROG
         ((#1=#:G910 NIL) (#2=#:G906 NIL) (#3=#:G905 NIL) (|high| (|Integer|))
          (|low| (|Integer|)))
         (SEQ
          (LETT |low| (SPADCALL |seg| (QREFELT $ 53))
                . #4=(|LZSTAGG-;delete;AUsA;18|))
          (EXIT
           (COND
            ((SPADCALL |seg| (QREFELT $ 54))
             (SEQ (LETT |high| (SPADCALL |seg| (QREFELT $ 55)) . #4#)
                  (EXIT
                   (COND ((< |high| |low|) (SPADCALL |x| (QREFELT $ 56)))
                         (#5='T
                          (SEQ
                           (COND
                            ((SPADCALL |low| |x| (QREFELT $ 47))
                             (COND
                              ((NULL (SPADCALL |high| |x| (QREFELT $ 47)))
                               (EXIT
                                (|error| #6="delete: index out of range")))))
                            (#5# (EXIT (|error| #6#))))
                           (EXIT
                            (SPADCALL
                             (SPADCALL |x|
                                       (PROG1 (LETT #3# (- |low| 1) . #4#)
                                         (|check_subtype2| (>= #3# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #3#))
                                       (QREFELT $ 48))
                             (SPADCALL |x|
                                       (PROG1
                                           (LETT #2# (+ (- |high| 1) 1) . #4#)
                                         (|check_subtype2| (>= #2# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #2#))
                                       (QREFELT $ 49))
                             (QREFELT $ 50)))))))))
            ((NULL (SPADCALL |low| |x| (QREFELT $ 47)))
             (|error| "delete: index out of range"))
            ('T
             (SPADCALL |x|
                       (PROG1 (LETT #1# (- |low| 1) . #4#)
                         (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #1#))
                       (QREFELT $ 48)))))))) 

(SDEFUN |LZSTAGG-;elt;AUsA;19|
        ((|x| A) (|seg| |UniversalSegment| (|Integer|)) ($ A))
        (SPROG
         ((#1=#:G921 NIL) (#2=#:G917 NIL) (#3=#:G916 NIL) (|high| (|Integer|))
          (|low| (|Integer|)))
         (SEQ
          (LETT |low| (SPADCALL |seg| (QREFELT $ 53))
                . #4=(|LZSTAGG-;elt;AUsA;19|))
          (EXIT
           (COND
            ((SPADCALL |seg| (QREFELT $ 54))
             (SEQ (LETT |high| (SPADCALL |seg| (QREFELT $ 55)) . #4#)
                  (EXIT
                   (COND ((< |high| |low|) (SPADCALL (QREFELT $ 34)))
                         (#5='T
                          (SEQ
                           (COND
                            ((SPADCALL |low| |x| (QREFELT $ 47))
                             (COND
                              ((NULL (SPADCALL |high| |x| (QREFELT $ 47)))
                               (EXIT (|error| #6="elt: index out of range")))))
                            (#5# (EXIT (|error| #6#))))
                           (EXIT
                            (SPADCALL
                             (SPADCALL |x|
                                       (PROG1 (LETT #3# (- |low| 1) . #4#)
                                         (|check_subtype2| (>= #3# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #3#))
                                       (QREFELT $ 49))
                             (PROG1 (LETT #2# (+ (- |high| |low|) 1) . #4#)
                               (|check_subtype2| (>= #2# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #2#))
                             (QREFELT $ 48)))))))))
            ((NULL (SPADCALL |low| |x| (QREFELT $ 47)))
             (|error| "elt: index out of range"))
            ('T
             (SPADCALL |x|
                       (PROG1 (LETT #1# (- |low| 1) . #4#)
                         (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #1#))
                       (QREFELT $ 49)))))))) 

(SDEFUN |LZSTAGG-;insert;SAIA;20| ((|s| S) (|x| A) (|n| |Integer|) ($ A))
        (SPROG ((|nn| (|NonNegativeInteger|)) (#1=#:G926 NIL))
               (SEQ
                (COND
                 ((NULL (SPADCALL |n| |x| (QREFELT $ 47)))
                  (|error| "insert: index out of range"))
                 ('T
                  (SEQ
                   (LETT |nn|
                         (PROG1
                             (LETT #1# (- |n| 1)
                                   . #2=(|LZSTAGG-;insert;SAIA;20|))
                           (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #1#))
                         . #2#)
                   (EXIT
                    (SPADCALL
                     (LIST (SPADCALL |x| |nn| (QREFELT $ 48))
                           (SPADCALL |s| (SPADCALL (QREFELT $ 34))
                                     (QREFELT $ 36))
                           (SPADCALL |x| |nn| (QREFELT $ 49)))
                     (QREFELT $ 60))))))))) 

(SDEFUN |LZSTAGG-;insert;2AIA;21| ((|y| A) (|x| A) (|n| |Integer|) ($ A))
        (SPROG ((|nn| (|NonNegativeInteger|)) (#1=#:G930 NIL))
               (SEQ
                (COND
                 ((NULL (SPADCALL |n| |x| (QREFELT $ 47)))
                  (|error| "insert: index out of range"))
                 ('T
                  (SEQ
                   (LETT |nn|
                         (PROG1
                             (LETT #1# (- |n| 1)
                                   . #2=(|LZSTAGG-;insert;2AIA;21|))
                           (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #1#))
                         . #2#)
                   (EXIT
                    (SPADCALL
                     (LIST (SPADCALL |x| |nn| (QREFELT $ 48)) |y|
                           (SPADCALL |x| |nn| (QREFELT $ 49)))
                     (QREFELT $ 60))))))))) 

(SDEFUN |LZSTAGG-;cycleElt| ((|x| A) ($ |Union| A "failed"))
        (SPADCALL |x| (QREFELT $ 65))) 

(SDEFUN |LZSTAGG-;cyclic?;AB;23| ((|x| A) ($ |Boolean|))
        (NULL (QEQCAR (|LZSTAGG-;cycleElt| |x| $) 1))) 

(SDEFUN |LZSTAGG-;child?;2AB;24| ((|x| A) (|y| A) ($ |Boolean|))
        (COND ((SPADCALL |y| (QREFELT $ 19)) (|error| "child: no children"))
              ('T (SPADCALL |x| (SPADCALL |y| (QREFELT $ 17)) (QREFELT $ 67))))) 

(SDEFUN |LZSTAGG-;children;AL;25| ((|x| A) ($ |List| A))
        (COND ((SPADCALL |x| (QREFELT $ 19)) (|error| "children: no children"))
              ('T (LIST (SPADCALL |x| (QREFELT $ 17)))))) 

(SDEFUN |LZSTAGG-;distance;2AI;26| ((|x| A) (|z| A) ($ |Integer|))
        (SPROG ((#1=#:G954 NIL) (|y| (A)) (#2=#:G955 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |y| |x| . #3=(|LZSTAGG-;distance;2AI;26|))
                      (EXIT
                       (SEQ (LETT |i| 0 . #3#) G190 NIL
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL |y| |z| (QREFELT $ 9))
                                (PROGN (LETT #2# |i| . #3#) (GO #4=#:G953)))
                               ('T
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((OR (SPADCALL |y| (QREFELT $ 27))
                                        (SPADCALL |y| (QREFELT $ 28)))
                                    (|error|
                                     "distance: 2nd arg not a descendent of the 1st"))
                                   ('T
                                    (SEQ
                                     (LETT |y| (SPADCALL |y| (QREFELT $ 17))
                                           . #3#)
                                     (COND
                                      ((ODDP |i|)
                                       (LETT |x| (SPADCALL |x| (QREFELT $ 17))
                                             . #3#)))
                                     (EXIT
                                      (COND
                                       ((SPADCALL |x| |y| (QREFELT $ 9))
                                        (PROGN
                                         (LETT #1#
                                               (|error|
                                                "distance: 2nd arg not a descendent of the 1st")
                                               . #3#)
                                         (GO #5=#:G949)))))))))
                                 #5# (EXIT #1#))))))
                            (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                            (EXIT NIL)))))
                #4# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;node?;2AB;27| ((|z| A) (|x| A) ($ |Boolean|))
        (SPROG ((#1=#:G963 NIL) (#2=#:G964 NIL) (|y| (A)) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |y| |x| . #3=(|LZSTAGG-;node?;2AB;27|))
                      (EXIT
                       (SEQ (LETT |i| 0 . #3#) G190 NIL
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL |z| |y| (QREFELT $ 67))
                                (PROGN (LETT #2# 'T . #3#) (GO #4=#:G962)))
                               ((SPADCALL |y| (QREFELT $ 27))
                                (PROGN (LETT #2# NIL . #3#) (GO #4#)))
                               ((SPADCALL |y| (QREFELT $ 28))
                                (|error| "node?: infinite stream"))
                               ('T
                                (SEQ
                                 (EXIT
                                  (SEQ
                                   (LETT |y| (SPADCALL |y| (QREFELT $ 17))
                                         . #3#)
                                   (COND
                                    ((ODDP |i|)
                                     (LETT |x| (SPADCALL |x| (QREFELT $ 17))
                                           . #3#)))
                                   (EXIT
                                    (COND
                                     ((SPADCALL |x| |y| (QREFELT $ 9))
                                      (PROGN
                                       (LETT #1#
                                             (PROGN
                                              (LETT #2# NIL . #3#)
                                              (GO #4#))
                                             . #3#)
                                       (GO #5=#:G957)))))))
                                 #5# (EXIT #1#))))))
                            (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                            (EXIT NIL)))))
                #4# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;nodes;AL;28| ((|x| A) ($ |List| A))
        (SPROG
         ((#1=#:G972 NIL) (|y| (A)) (|l| (|List| A)) (#2=#:G973 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |y| |x| . #3=(|LZSTAGG-;nodes;AL;28|))
                (LETT |l| NIL . #3#)
                (SEQ (LETT |i| 0 . #3#) G190 NIL
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |y| (QREFELT $ 27))
                         (PROGN
                          (LETT #2# (NREVERSE |l|) . #3#)
                          (GO #4=#:G971)))
                        ((SPADCALL |y| (QREFELT $ 28))
                         (|error| "nodes: infinite stream"))
                        ('T
                         (SEQ
                          (EXIT
                           (SEQ (LETT |l| (CONS |y| |l|) . #3#)
                                (LETT |y| (SPADCALL |y| (QREFELT $ 17)) . #3#)
                                (COND
                                 ((ODDP |i|)
                                  (LETT |x| (SPADCALL |x| (QREFELT $ 17))
                                        . #3#)))
                                (EXIT
                                 (COND
                                  ((SPADCALL |x| |y| (QREFELT $ 9))
                                   (PROGN
                                    (LETT #1#
                                          (|error| "nodes: infinite stream")
                                          . #3#)
                                    (GO #5=#:G966)))))))
                          #5# (EXIT #1#))))))
                     (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT |l|)))
          #4# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;leaf?;AB;29| ((|x| A) ($ |Boolean|))
        (SPADCALL (SPADCALL |x| (QREFELT $ 73)) (QREFELT $ 19))) 

(SDEFUN |LZSTAGG-;leaves;AL;30| ((|x| A) ($ |List| S))
        (SPROG ((#1=#:G983 NIL) (|y| (A)) (#2=#:G984 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |y| |x| . #3=(|LZSTAGG-;leaves;AL;30|))
                      (EXIT
                       (SEQ (LETT |i| 0 . #3#) G190 NIL
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL |y| (QREFELT $ 27))
                                (PROGN (LETT #2# NIL . #3#) (GO #4=#:G982)))
                               ((SPADCALL |y| (QREFELT $ 28))
                                (|error| "leaves$Stream: infinite stream"))
                               ((SPADCALL |y| (QREFELT $ 75))
                                (PROGN
                                 (LETT #2# (LIST (SPADCALL |y| (QREFELT $ 76)))
                                       . #3#)
                                 (GO #4#)))
                               ('T
                                (SEQ
                                 (EXIT
                                  (SEQ
                                   (LETT |y| (SPADCALL |y| (QREFELT $ 17))
                                         . #3#)
                                   (COND
                                    ((ODDP |i|)
                                     (LETT |x| (SPADCALL |x| (QREFELT $ 17))
                                           . #3#)))
                                   (EXIT
                                    (COND
                                     ((SPADCALL |x| |y| (QREFELT $ 9))
                                      (PROGN
                                       (LETT #1#
                                             (|error|
                                              "leaves$Stream: infinite stream")
                                             . #3#)
                                       (GO #5=#:G976)))))))
                                 #5# (EXIT #1#))))))
                            (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                            (EXIT NIL)))))
                #4# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;value;AS;31| ((|x| A) ($ S)) (SPADCALL |x| (QREFELT $ 78))) 

(SDEFUN |LZSTAGG-;computeCycleLength| ((|cycElt| A) ($ |NonNegativeInteger|))
        (SPADCALL |cycElt| (QREFELT $ 80))) 

(SDEFUN |LZSTAGG-;computeCycleEntry| ((|x| A) (|cycElt| A) ($ A))
        (SPADCALL |x| |cycElt| (QREFELT $ 81))) 

(SDEFUN |LZSTAGG-;cycleEntry;2A;34| ((|x| A) ($ A))
        (SPROG ((|cycElt| (|Union| A "failed")))
               (SEQ
                (LETT |cycElt| (|LZSTAGG-;cycleElt| |x| $)
                      |LZSTAGG-;cycleEntry;2A;34|)
                (EXIT
                 (COND
                  ((QEQCAR |cycElt| 1)
                   (|error| "cycleEntry: non-cyclic stream"))
                  ('T (|LZSTAGG-;computeCycleEntry| |x| (QCDR |cycElt|) $))))))) 

(SDEFUN |LZSTAGG-;cycleLength;ANni;35| ((|x| A) ($ |NonNegativeInteger|))
        (SPROG ((|cycElt| (|Union| A "failed")))
               (SEQ
                (LETT |cycElt| (|LZSTAGG-;cycleElt| |x| $)
                      |LZSTAGG-;cycleLength;ANni;35|)
                (EXIT
                 (COND
                  ((QEQCAR |cycElt| 1)
                   (|error| "cycleLength: non-cyclic stream"))
                  ('T (|LZSTAGG-;computeCycleLength| (QCDR |cycElt|) $))))))) 

(SDEFUN |LZSTAGG-;cycleTail;2A;36| ((|x| A) ($ A))
        (SPROG
         ((|z| (A)) (|y| (A)) (#1=#:G1007 NIL) (|cycElt| (|Union| A "failed")))
         (SEQ
          (EXIT
           (SEQ
            (LETT |cycElt| (|LZSTAGG-;cycleElt| |x| $)
                  . #2=(|LZSTAGG-;cycleTail;2A;36|))
            (EXIT
             (COND
              ((QEQCAR |cycElt| 1) (|error| "cycleTail: non-cyclic stream"))
              ('T
               (SEQ
                (LETT |y|
                      (LETT |x|
                            (|LZSTAGG-;computeCycleEntry| |x| (QCDR |cycElt|)
                             $)
                            . #2#)
                      . #2#)
                (LETT |z| (SPADCALL |x| (QREFELT $ 17)) . #2#)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |x| |z| (QREFELT $ 9))
                          (PROGN (LETT #1# |y| . #2#) (GO #3=#:G1006)))
                         ('T
                          (SEQ (LETT |y| |z| . #2#)
                               (EXIT
                                (LETT |z| (SPADCALL |z| (QREFELT $ 17))
                                      . #2#)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))))))
          #3# (EXIT #1#)))) 

(SDEFUN |LZSTAGG-;elt;AfirstS;37| ((|x| A) (T5 "first") ($ S))
        (SPADCALL |x| (QREFELT $ 78))) 

(SDEFUN |LZSTAGG-;first;ANniA;38| ((|x| A) (|n| |NonNegativeInteger|) ($ A))
        (SPROG ((#1=#:G1010 NIL))
               (COND
                ((OR (EQL |n| 0) (SPADCALL |x| (QREFELT $ 19)))
                 (SPADCALL (QREFELT $ 34)))
                ('T
                 (SPADCALL (SPADCALL |x| (QREFELT $ 15))
                           (SPADCALL (SPADCALL |x| (QREFELT $ 17))
                                     (PROG1
                                         (LETT #1# (- |n| 1)
                                               |LZSTAGG-;first;ANniA;38|)
                                       (|check_subtype2| (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #1#))
                                     (QREFELT $ 48))
                           (QREFELT $ 36)))))) 

(SDEFUN |LZSTAGG-;rest;2A;39| ((|x| A) ($ A))
        (COND
         ((SPADCALL |x| (QREFELT $ 19))
          (|error| "Can't take the rest of an empty stream."))
         ('T (SPADCALL |x| (QREFELT $ 17))))) 

(SDEFUN |LZSTAGG-;elt;ArestA;40| ((|x| A) (T6 "rest") ($ A))
        (SPADCALL |x| (QREFELT $ 73))) 

(SDEFUN |LZSTAGG-;rest;ANniA;41| ((|x| A) (|n| |NonNegativeInteger|) ($ A))
        (SPROG ((#1=#:G1017 NIL))
               (COND ((OR (EQL |n| 0) (SPADCALL |x| (QREFELT $ 19))) |x|)
                     ('T
                      (SPADCALL (SPADCALL |x| (QREFELT $ 17))
                                (PROG1
                                    (LETT #1# (- |n| 1)
                                          |LZSTAGG-;rest;ANniA;41|)
                                  (|check_subtype2| (>= #1# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #1#))
                                (QREFELT $ 49)))))) 

(SDEFUN |LZSTAGG-;last;AS;42| ((|x| A) ($ S))
        (SPROG
         ((#1=#:G1028 NIL) (|y2| (A)) (|y1| (A)) (#2=#:G1029 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (COND ((SPADCALL |x| (QREFELT $ 19)) (|error| "last: empty stream"))
                 ('T
                  (SEQ (LETT |y1| |x| . #3=(|LZSTAGG-;last;AS;42|))
                       (LETT |y2| (SPADCALL |x| (QREFELT $ 17)) . #3#)
                       (EXIT
                        (SEQ (LETT |i| 0 . #3#) G190 NIL
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |y2| (QREFELT $ 27))
                                 (PROGN
                                  (LETT #2# (SPADCALL |y1| (QREFELT $ 15))
                                        . #3#)
                                  (GO #4=#:G1027)))
                                ((SPADCALL |y2| (QREFELT $ 28))
                                 (|error| "last: infinite stream"))
                                ('T
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |y1| |y2| . #3#)
                                        (LETT |y2|
                                              (SPADCALL |y2| (QREFELT $ 17))
                                              . #3#)
                                        (COND
                                         ((ODDP |i|)
                                          (LETT |x|
                                                (SPADCALL |x| (QREFELT $ 17))
                                                . #3#)))
                                        (EXIT
                                         (COND
                                          ((SPADCALL |x| |y2| (QREFELT $ 9))
                                           (PROGN
                                            (LETT #1#
                                                  (|error|
                                                   "last: infinite stream")
                                                  . #3#)
                                            (GO #5=#:G1021)))))))
                                  #5# (EXIT #1#))))))
                             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                             (EXIT NIL)))))))
          #4# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;last;ANniA;43| ((|x| A) (|n| |NonNegativeInteger|) ($ A))
        (SPROG ((#1=#:G1030 NIL) (|m| (|NonNegativeInteger|)))
               (SEQ
                (COND
                 ((SPADCALL |x| (QREFELT $ 93))
                  (|error| "last: infinite stream"))
                 (#2='T
                  (SEQ
                   (LETT |m| (SPADCALL |x| (QREFELT $ 94))
                         . #3=(|LZSTAGG-;last;ANniA;43|))
                   (EXIT
                    (COND ((< |m| |n|) (|error| "last: index out of range"))
                          (#2#
                           (SPADCALL
                            (SPADCALL |x|
                                      (PROG1 (LETT #1# (- |m| |n|) . #3#)
                                        (|check_subtype2| (>= #1# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #1#))
                                      (QREFELT $ 49))
                            (QREFELT $ 56))))))))))) 

(SDEFUN |LZSTAGG-;elt;AlastS;44| ((|x| A) (T7 "last") ($ S))
        (SPADCALL |x| (QREFELT $ 96))) 

(SDEFUN |LZSTAGG-;tail;2A;45| ((|x| A) ($ A))
        (SPROG
         ((#1=#:G1043 NIL) (|y2| (A)) (|y1| (A)) (#2=#:G1044 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (COND ((SPADCALL |x| (QREFELT $ 19)) (|error| "tail: empty stream"))
                 ('T
                  (SEQ (LETT |y1| |x| . #3=(|LZSTAGG-;tail;2A;45|))
                       (LETT |y2| (SPADCALL |x| (QREFELT $ 17)) . #3#)
                       (EXIT
                        (SEQ (LETT |i| 0 . #3#) G190 NIL
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |y2| (QREFELT $ 27))
                                 (PROGN (LETT #2# |y1| . #3#) (GO #4=#:G1042)))
                                ((SPADCALL |y2| (QREFELT $ 28))
                                 (|error| "tail: infinite stream"))
                                ('T
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |y1| |y2| . #3#)
                                        (LETT |y2|
                                              (SPADCALL |y2| (QREFELT $ 17))
                                              . #3#)
                                        (COND
                                         ((ODDP |i|)
                                          (LETT |x|
                                                (SPADCALL |x| (QREFELT $ 17))
                                                . #3#)))
                                        (EXIT
                                         (COND
                                          ((SPADCALL |x| |y2| (QREFELT $ 9))
                                           (PROGN
                                            (LETT #1#
                                                  (|error|
                                                   "tail: infinite stream")
                                                  . #3#)
                                            (GO #5=#:G1036)))))))
                                  #5# (EXIT #1#))))))
                             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                             (EXIT NIL)))))))
          #4# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;possiblyInfinite?;AB;46| ((|x| A) ($ |Boolean|))
        (SPROG ((#1=#:G1052 NIL) (#2=#:G1053 NIL) (|y| (A)) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |y| |x| . #3=(|LZSTAGG-;possiblyInfinite?;AB;46|))
                      (EXIT
                       (SEQ (LETT |i| 0 . #3#) G190 NIL
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL |y| (QREFELT $ 27))
                                (PROGN (LETT #2# NIL . #3#) (GO #4=#:G1051)))
                               ((SPADCALL |y| (QREFELT $ 28))
                                (PROGN (LETT #2# 'T . #3#) (GO #4#)))
                               ('T
                                (SEQ
                                 (EXIT
                                  (SEQ
                                   (COND
                                    ((ODDP |i|)
                                     (LETT |x| (SPADCALL |x| (QREFELT $ 17))
                                           . #3#)))
                                   (LETT |y| (SPADCALL |y| (QREFELT $ 17))
                                         . #3#)
                                   (EXIT
                                    (COND
                                     ((SPADCALL |x| |y| (QREFELT $ 9))
                                      (PROGN
                                       (LETT #1#
                                             (PROGN
                                              (LETT #2# 'T . #3#)
                                              (GO #4#))
                                             . #3#)
                                       (GO #5=#:G1046)))))))
                                 #5# (EXIT #1#))))))
                            (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                            (EXIT NIL)))))
                #4# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;explicitlyFinite?;AB;47| ((|x| A) ($ |Boolean|))
        (NULL (SPADCALL |x| (QREFELT $ 93)))) 

(SDEFUN |LZSTAGG-;extend;AIA;48| ((|x| A) (|n| |Integer|) ($ A))
        (SPROG ((|y| (A)) (#1=#:G1060 NIL) (|i| NIL))
               (SEQ (LETT |y| |x| . #2=(|LZSTAGG-;extend;AIA;48|))
                    (SEQ (LETT |i| 1 . #2#) (LETT #1# |n| . #2#) G190
                         (COND
                          ((OR (|greater_SI| |i| #1#)
                               (NULL (NULL (SPADCALL |y| (QREFELT $ 19)))))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |y| (SPADCALL |y| (QREFELT $ 17)) . #2#)))
                         (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT |x|)))) 

(SDEFUN |LZSTAGG-;complete;2A;49| ((|x| A) ($ A))
        (SPROG ((|y| (A)))
               (SEQ (LETT |y| |x| . #1=(|LZSTAGG-;complete;2A;49|))
                    (SEQ G190
                         (COND
                          ((NULL (NULL (SPADCALL |y| (QREFELT $ 19))))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |y| (SPADCALL |y| (QREFELT $ 17)) . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |x|)))) 

(DECLAIM (NOTINLINE |LazyStreamAggregate&;|)) 

(DEFUN |LazyStreamAggregate&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|LazyStreamAggregate&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|LazyStreamAggregate&| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 105) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|HasCategory| |#2| '(|SetCategory|))
            (QSETREFV $ 18 (CONS (|dispatchFunction| |LZSTAGG-;=;2AB;1|) $))))
          (COND
           ((|HasCategory| |#2| '(|SetCategory|))
            (QSETREFV $ 68
                      (CONS (|dispatchFunction| |LZSTAGG-;child?;2AB;24|) $))))
          (COND
           ((|HasCategory| |#2| '(|SetCategory|))
            (QSETREFV $ 71
                      (CONS (|dispatchFunction| |LZSTAGG-;node?;2AB;27|) $))))
          (COND
           ((|HasCategory| |#1| '(|finiteAggregate|))
            (QSETREFV $ 95
                      (CONS (|dispatchFunction| |LZSTAGG-;last;ANniA;43|) $))))
          $))) 

(MAKEPROP '|LazyStreamAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Boolean|)
              (0 . |eq?|) (6 . |explicitlyFinite?|) (|List| 7) (11 . |entries|)
              (16 . =) (22 . |explicitEntries?|) (27 . |frst|) (32 . =)
              (38 . |rst|) (43 . =) (49 . |empty?|) (|NonNegativeInteger|)
              (54 . |less?|) |LZSTAGG-;less?;ANniB;2| (60 . |more?|)
              |LZSTAGG-;more?;ANniB;3| (66 . |size?|) |LZSTAGG-;size?;ANniB;4|
              (72 . |explicitlyEmpty?|) (77 . |lazy?|) |LZSTAGG-;#;ANni;5|
              (|Mapping| 8 7) |LZSTAGG-;any?;MAB;6| |LZSTAGG-;every?;MAB;7|
              |LZSTAGG-;entries;AL;8| (82 . |empty|) (86 . |construct|)
              (91 . |concat|) |LZSTAGG-;construct;LA;9| (|Integer|)
              (97 . |elt|) |LZSTAGG-;elt;AIS;10| |LZSTAGG-;elt;AI2S;11|
              |LZSTAGG-;index?;IAB;13| (|List| 38) |LZSTAGG-;indices;AL;14|
              |LZSTAGG-;maxIndex;AI;15| |LZSTAGG-;minIndex;AI;16|
              (103 . |index?|) (109 . |first|) (115 . |rest|) (121 . |concat|)
              |LZSTAGG-;delete;AIA;17| (|UniversalSegment| 38) (127 . |low|)
              (132 . |hasHi|) (137 . |high|) (142 . |copy|)
              |LZSTAGG-;delete;AUsA;18| |LZSTAGG-;elt;AUsA;19| (|List| $)
              (147 . |concat|) |LZSTAGG-;insert;SAIA;20|
              |LZSTAGG-;insert;2AIA;21| (|Union| 6 '"failed")
              (|CyclicStreamTools| 7 6) (152 . |cycleElt|)
              |LZSTAGG-;cyclic?;AB;23| (157 . =) (163 . |child?|)
              |LZSTAGG-;children;AL;25| |LZSTAGG-;distance;2AI;26|
              (169 . |node?|) |LZSTAGG-;nodes;AL;28| (175 . |rest|)
              |LZSTAGG-;leaf?;AB;29| (180 . |leaf?|) (185 . |value|)
              |LZSTAGG-;leaves;AL;30| (190 . |first|) |LZSTAGG-;value;AS;31|
              (195 . |computeCycleLength|) (200 . |computeCycleEntry|)
              |LZSTAGG-;cycleEntry;2A;34| |LZSTAGG-;cycleLength;ANni;35|
              |LZSTAGG-;cycleTail;2A;36| '"first" |LZSTAGG-;elt;AfirstS;37|
              |LZSTAGG-;first;ANniA;38| |LZSTAGG-;rest;2A;39| '"rest"
              |LZSTAGG-;elt;ArestA;40| |LZSTAGG-;rest;ANniA;41|
              |LZSTAGG-;last;AS;42| (206 . |possiblyInfinite?|) (211 . |#|)
              (216 . |last|) (222 . |last|) '"last" |LZSTAGG-;elt;AlastS;44|
              |LZSTAGG-;tail;2A;45| |LZSTAGG-;possiblyInfinite?;AB;46|
              |LZSTAGG-;explicitlyFinite?;AB;47| |LZSTAGG-;extend;AIA;48|
              |LZSTAGG-;complete;2A;49| '"value")
           '#(|value| 227 |tail| 232 |size?| 237 |rest| 243 |possiblyInfinite?|
              254 |nodes| 259 |node?| 264 |more?| 270 |minIndex| 276 |maxIndex|
              281 |less?| 286 |leaves| 292 |leaf?| 297 |last| 302 |insert| 313
              |indices| 327 |index?| 332 |first| 338 |extend| 344
              |explicitlyFinite?| 350 |every?| 355 |entries| 361 |elt| 366
              |distance| 403 |delete| 409 |cyclic?| 421 |cycleTail| 426
              |cycleLength| 431 |cycleEntry| 436 |construct| 441 |complete| 446
              |children| 451 |child?| 456 |any?| 462 = 468 |#| 474)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 103
                                                 '(2 6 8 0 0 9 1 6 8 0 10 1 6
                                                   11 0 12 2 11 8 0 0 13 1 6 8
                                                   0 14 1 6 7 0 15 2 7 8 0 0 16
                                                   1 6 0 0 17 2 0 8 0 0 18 1 6
                                                   8 0 19 2 6 8 0 20 21 2 6 8 0
                                                   20 23 2 6 8 0 20 25 1 6 8 0
                                                   27 1 6 8 0 28 0 6 0 34 1 6 0
                                                   11 35 2 6 0 7 0 36 2 6 7 0
                                                   38 39 2 6 8 38 0 47 2 6 0 0
                                                   20 48 2 6 0 0 20 49 2 6 0 0
                                                   0 50 1 52 38 0 53 1 52 8 0
                                                   54 1 52 38 0 55 1 6 0 0 56 1
                                                   6 0 59 60 1 64 63 6 65 2 6 8
                                                   0 0 67 2 0 8 0 0 68 2 0 8 0
                                                   0 71 1 6 0 0 73 1 6 8 0 75 1
                                                   6 7 0 76 1 6 7 0 78 1 64 20
                                                   6 80 2 64 6 6 6 81 1 6 8 0
                                                   93 1 6 20 0 94 2 0 0 0 20 95
                                                   1 6 7 0 96 1 0 7 0 79 1 0 0
                                                   0 99 2 0 8 0 20 26 2 0 0 0
                                                   20 91 1 0 0 0 88 1 0 8 0 100
                                                   1 0 59 0 72 2 0 8 0 0 71 2 0
                                                   8 0 20 24 1 0 38 0 46 1 0 38
                                                   0 45 2 0 8 0 20 22 1 0 11 0
                                                   77 1 0 8 0 74 2 0 0 0 20 95
                                                   1 0 7 0 92 3 0 0 0 0 38 62 3
                                                   0 0 7 0 38 61 1 0 43 0 44 2
                                                   0 8 38 0 42 2 0 0 0 20 87 2
                                                   0 0 0 38 102 1 0 8 0 101 2 0
                                                   8 30 0 32 1 0 11 0 33 3 0 7
                                                   0 38 7 41 2 0 7 0 38 40 2 0
                                                   0 0 52 58 2 0 7 0 97 98 2 0
                                                   0 0 89 90 2 0 7 0 85 86 2 0
                                                   38 0 0 70 2 0 0 0 38 51 2 0
                                                   0 0 52 57 1 0 8 0 66 1 0 0 0
                                                   84 1 0 20 0 83 1 0 0 0 82 1
                                                   0 0 11 37 1 0 0 0 103 1 0 59
                                                   0 69 2 0 8 0 0 68 2 0 8 30 0
                                                   31 2 0 8 0 0 18 1 0 20 0
                                                   29)))))
           '|lookupComplete|)) 
