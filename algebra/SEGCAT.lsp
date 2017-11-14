
(DEFPARAMETER |SegmentCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |SegmentCategory;|)) 

(DEFPARAMETER |SegmentCategory;AL| 'NIL) 

(DEFUN |SegmentCategory| (#1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |SegmentCategory;AL|)) (CDR #2#))
     (T
      (SETQ |SegmentCategory;AL|
              (|cons5| (CONS #3# (SETQ #2# (|SegmentCategory;| #1#)))
                       |SegmentCategory;AL|))
      #2#)))) 

(DEFUN |SegmentCategory;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|SegmentCategory;CAT|)
                                    ('T
                                     (LETT |SegmentCategory;CAT|
                                           (|Join| (|Type|)
                                                   (|mkCategory|
                                                    '(((SEGMENT
                                                        ($ |t#1| |t#1|))
                                                       T)
                                                      ((BY ($ $ (|Integer|)))
                                                       T)
                                                      ((|lo| (|t#1| $)) T)
                                                      ((|hi| (|t#1| $)) T)
                                                      ((|low| (|t#1| $)) T)
                                                      ((|high| (|t#1| $)) T)
                                                      ((|incr| ((|Integer|) $))
                                                       T)
                                                      ((|segment|
                                                        ($ |t#1| |t#1|))
                                                       T)
                                                      ((|convert| ($ |t#1|)) T)
                                                      ((+ ($ |t#1| $))
                                                       (|has| |t#1|
                                                              (|AbelianSemiGroup|)))
                                                      ((+ ($ $ |t#1|))
                                                       (|has| |t#1|
                                                              (|AbelianSemiGroup|)))
                                                      ((- ($ $ |t#1|))
                                                       (|has| |t#1|
                                                              (|AbelianGroup|))))
                                                    '(((|SetCategory|)
                                                       (|has| |t#1|
                                                              (|SetCategory|)))
                                                      ((|ConvertibleTo|
                                                        (|InputForm|))
                                                       (|has| |t#1|
                                                              (|ConvertibleTo|
                                                               (|InputForm|)))))
                                                    '((|Integer|)) NIL))
                                           . #2=(|SegmentCategory|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|SegmentCategory| (|devaluate| |t#1|)))))) 
