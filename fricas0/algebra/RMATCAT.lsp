
(DEFPARAMETER |RectangularMatrixCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |RectangularMatrixCategory;|)) 

(DEFPARAMETER |RectangularMatrixCategory;AL| 'NIL) 

(DEFUN |RectangularMatrixCategory| (&REST #1=#:G699)
  (LET (#2=#:G700)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluateList| #1#)
                       |RectangularMatrixCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |RectangularMatrixCategory;AL|
              (|cons5|
               (CONS #3# (SETQ #2# (APPLY #'|RectangularMatrixCategory;| #1#)))
               |RectangularMatrixCategory;AL|))
      #2#)))) 

(DEFUN |RectangularMatrixCategory;| (|t#1| |t#2| |t#3| |t#4| |t#5|)
  (SPROG ((#1=#:G698 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2| |t#3| |t#4| |t#5|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)
                                (|devaluate| |t#3|) (|devaluate| |t#4|)
                                (|devaluate| |t#5|)))
                    (COND (|RectangularMatrixCategory;CAT|)
                          ('T
                           (LETT |RectangularMatrixCategory;CAT|
                                 (|Join| (|BiModule| '|t#3| '|t#3|)
                                         (|HomogeneousAggregate| '|t#3|)
                                         (|finiteAggregate|)
                                         (|mkCategory|
                                          '(((|matrix|
                                              ($ (|List| (|List| |t#3|))))
                                             T)
                                            ((|square?| ((|Boolean|) $)) T)
                                            ((|diagonal?| ((|Boolean|) $)) T)
                                            ((|symmetric?| ((|Boolean|) $)) T)
                                            ((|antisymmetric?| ((|Boolean|) $))
                                             (|has| |t#3| (|AbelianGroup|)))
                                            ((|antisymmetric?| ((|Boolean|) $))
                                             T)
                                            ((|minRowIndex| ((|Integer|) $)) T)
                                            ((|maxRowIndex| ((|Integer|) $)) T)
                                            ((|minColIndex| ((|Integer|) $)) T)
                                            ((|maxColIndex| ((|Integer|) $)) T)
                                            ((|nrows|
                                              ((|NonNegativeInteger|) $))
                                             T)
                                            ((|ncols|
                                              ((|NonNegativeInteger|) $))
                                             T)
                                            ((|listOfLists|
                                              ((|List| (|List| |t#3|)) $))
                                             T)
                                            ((|elt|
                                              (|t#3| $ (|Integer|)
                                               (|Integer|)))
                                             T)
                                            ((|qelt|
                                              (|t#3| $ (|Integer|)
                                               (|Integer|)))
                                             T)
                                            ((|elt|
                                              (|t#3| $ (|Integer|) (|Integer|)
                                               |t#3|))
                                             T)
                                            ((|row| (|t#4| $ (|Integer|))) T)
                                            ((|column| (|t#5| $ (|Integer|)))
                                             T)
                                            ((|map|
                                              ($ (|Mapping| |t#3| |t#3|) $))
                                             T)
                                            ((|map|
                                              ($ (|Mapping| |t#3| |t#3| |t#3|)
                                               $ $))
                                             T)
                                            ((|exquo|
                                              ((|Union| $ "failed") $ |t#3|))
                                             (|has| |t#3| (|IntegralDomain|)))
                                            ((/ ($ $ |t#3|))
                                             (|has| |t#3| (|Field|)))
                                            ((|rowEchelon| ($ $))
                                             (|has| |t#3| (|EuclideanDomain|)))
                                            ((|columnSpace| ((|List| |t#5|) $))
                                             (|has| |t#3| (|EuclideanDomain|)))
                                            ((|rank|
                                              ((|NonNegativeInteger|) $))
                                             (|has| |t#3| (|IntegralDomain|)))
                                            ((|nullity|
                                              ((|NonNegativeInteger|) $))
                                             (|has| |t#3| (|IntegralDomain|)))
                                            ((|nullSpace| ((|List| |t#5|) $))
                                             (|has| |t#3| (|IntegralDomain|))))
                                          '(((|Finite|)
                                             (|has| |t#3| (|Finite|)))
                                            ((|Module| |t#3|)
                                             (|has| |t#3|
                                                    (|CommutativeRing|))))
                                          '((|List| |t#5|)
                                            (|NonNegativeInteger|) (|Integer|)
                                            (|List| (|List| |t#3|))
                                            (|Boolean|))
                                          NIL))
                                 . #2=(|RectangularMatrixCategory|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|RectangularMatrixCategory| (|devaluate| |t#1|)
                         (|devaluate| |t#2|) (|devaluate| |t#3|)
                         (|devaluate| |t#4|) (|devaluate| |t#5|)))))) 
