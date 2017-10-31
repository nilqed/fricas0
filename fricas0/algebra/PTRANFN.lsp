
(DECLAIM (NOTINLINE |PartialTranscendentalFunctions;|)) 

(DEFPARAMETER |PartialTranscendentalFunctions;AL| 'NIL) 

(DEFUN |PartialTranscendentalFunctions| (#1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluate| #1#)
                       |PartialTranscendentalFunctions;AL|))
      (CDR #2#))
     (T
      (SETQ |PartialTranscendentalFunctions;AL|
              (|cons5|
               (CONS #3# (SETQ #2# (|PartialTranscendentalFunctions;| #1#)))
               |PartialTranscendentalFunctions;AL|))
      #2#)))) 

(DEFUN |PartialTranscendentalFunctions;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (|Join|
                               (|mkCategory|
                                '(((|nthRootIfCan|
                                    ((|Union| |t#1| "failed") |t#1|
                                     (|NonNegativeInteger|)))
                                   T)
                                  ((|expIfCan|
                                    ((|Union| |t#1| "failed") |t#1|))
                                   T)
                                  ((|logIfCan|
                                    ((|Union| |t#1| "failed") |t#1|))
                                   T)
                                  ((|sinIfCan|
                                    ((|Union| |t#1| "failed") |t#1|))
                                   T)
                                  ((|cosIfCan|
                                    ((|Union| |t#1| "failed") |t#1|))
                                   T)
                                  ((|tanIfCan|
                                    ((|Union| |t#1| "failed") |t#1|))
                                   T)
                                  ((|cotIfCan|
                                    ((|Union| |t#1| "failed") |t#1|))
                                   T)
                                  ((|secIfCan|
                                    ((|Union| |t#1| "failed") |t#1|))
                                   T)
                                  ((|cscIfCan|
                                    ((|Union| |t#1| "failed") |t#1|))
                                   T)
                                  ((|asinIfCan|
                                    ((|Union| |t#1| "failed") |t#1|))
                                   T)
                                  ((|acosIfCan|
                                    ((|Union| |t#1| "failed") |t#1|))
                                   T)
                                  ((|atanIfCan|
                                    ((|Union| |t#1| "failed") |t#1|))
                                   T)
                                  ((|acotIfCan|
                                    ((|Union| |t#1| "failed") |t#1|))
                                   T)
                                  ((|asecIfCan|
                                    ((|Union| |t#1| "failed") |t#1|))
                                   T)
                                  ((|acscIfCan|
                                    ((|Union| |t#1| "failed") |t#1|))
                                   T)
                                  ((|sinhIfCan|
                                    ((|Union| |t#1| "failed") |t#1|))
                                   T)
                                  ((|coshIfCan|
                                    ((|Union| |t#1| "failed") |t#1|))
                                   T)
                                  ((|tanhIfCan|
                                    ((|Union| |t#1| "failed") |t#1|))
                                   T)
                                  ((|cothIfCan|
                                    ((|Union| |t#1| "failed") |t#1|))
                                   T)
                                  ((|sechIfCan|
                                    ((|Union| |t#1| "failed") |t#1|))
                                   T)
                                  ((|cschIfCan|
                                    ((|Union| |t#1| "failed") |t#1|))
                                   T)
                                  ((|asinhIfCan|
                                    ((|Union| |t#1| "failed") |t#1|))
                                   T)
                                  ((|acoshIfCan|
                                    ((|Union| |t#1| "failed") |t#1|))
                                   T)
                                  ((|atanhIfCan|
                                    ((|Union| |t#1| "failed") |t#1|))
                                   T)
                                  ((|acothIfCan|
                                    ((|Union| |t#1| "failed") |t#1|))
                                   T)
                                  ((|asechIfCan|
                                    ((|Union| |t#1| "failed") |t#1|))
                                   T)
                                  ((|acschIfCan|
                                    ((|Union| |t#1| "failed") |t#1|))
                                   T))
                                NIL '((|NonNegativeInteger|)) NIL)))
                   |PartialTranscendentalFunctions|)
           (SETELT #1# 0
                   (LIST '|PartialTranscendentalFunctions|
                         (|devaluate| |t#1|)))))) 
