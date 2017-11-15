
(DECLAIM (NOTINLINE |SpecialFunctionCategory;|)) 

(DEFPARAMETER |SpecialFunctionCategory;AL| 'NIL) 

(DEFUN |SpecialFunctionCategory| ()
  (LET (#:G692)
    (COND (|SpecialFunctionCategory;AL|)
          (T
           (SETQ |SpecialFunctionCategory;AL| (|SpecialFunctionCategory;|)))))) 

(DEFUN |SpecialFunctionCategory;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|Join|
                    (|mkCategory|
                     '(((|abs| ($ $)) T) ((|conjugate| ($ $)) T)
                       ((|Gamma| ($ $)) T) ((|Beta| ($ $ $)) T)
                       ((|digamma| ($ $)) T) ((|polygamma| ($ $ $)) T)
                       ((|Gamma| ($ $ $)) T) ((|besselJ| ($ $ $)) T)
                       ((|besselY| ($ $ $)) T) ((|besselI| ($ $ $)) T)
                       ((|besselK| ($ $ $)) T) ((|airyAi| ($ $)) T)
                       ((|airyAiPrime| ($ $)) T) ((|airyBi| ($ $)) T)
                       ((|airyBiPrime| ($ $)) T) ((|lambertW| ($ $)) T)
                       ((|polylog| ($ $ $)) T) ((|weierstrassP| ($ $ $ $)) T)
                       ((|weierstrassPPrime| ($ $ $ $)) T)
                       ((|weierstrassSigma| ($ $ $ $)) T)
                       ((|weierstrassZeta| ($ $ $ $)) T)
                       ((|weierstrassPInverse| ($ $ $ $)) T)
                       ((|whittakerM| ($ $ $ $)) T)
                       ((|whittakerW| ($ $ $ $)) T) ((|angerJ| ($ $ $)) T)
                       ((|weberE| ($ $ $)) T) ((|struveH| ($ $ $)) T)
                       ((|struveL| ($ $ $)) T) ((|hankelH1| ($ $ $)) T)
                       ((|hankelH2| ($ $ $)) T) ((|lommelS1| ($ $ $ $)) T)
                       ((|lommelS2| ($ $ $ $)) T) ((|kummerM| ($ $ $ $)) T)
                       ((|kummerU| ($ $ $ $)) T) ((|legendreP| ($ $ $ $)) T)
                       ((|legendreQ| ($ $ $ $)) T) ((|kelvinBei| ($ $ $)) T)
                       ((|kelvinBer| ($ $ $)) T) ((|kelvinKei| ($ $ $)) T)
                       ((|kelvinKer| ($ $ $)) T) ((|ellipticK| ($ $)) T)
                       ((|ellipticE| ($ $)) T) ((|ellipticE| ($ $ $)) T)
                       ((|ellipticF| ($ $ $)) T) ((|ellipticPi| ($ $ $ $)) T)
                       ((|jacobiSn| ($ $ $)) T) ((|jacobiCn| ($ $ $)) T)
                       ((|jacobiDn| ($ $ $)) T) ((|jacobiZeta| ($ $ $)) T)
                       ((|jacobiTheta| ($ $ $)) T) ((|lerchPhi| ($ $ $ $)) T)
                       ((|riemannZeta| ($ $)) T) ((|charlierC| ($ $ $ $)) T)
                       ((|hermiteH| ($ $ $)) T) ((|jacobiP| ($ $ $ $ $)) T)
                       ((|laguerreL| ($ $ $ $)) T) ((|meixnerM| ($ $ $ $ $)) T)
                       ((|hypergeometricF| ($ (|List| $) (|List| $) $))
                        (|has| $ (|RetractableTo| (|Integer|))))
                       ((|meijerG|
                         ($ (|List| $) (|List| $) (|List| $) (|List| $) $))
                        (|has| $ (|RetractableTo| (|Integer|)))))
                     NIL '((|List| $)) NIL))
                   |SpecialFunctionCategory|)
           (SETELT #1# 0 '(|SpecialFunctionCategory|))))) 

(MAKEPROP '|SpecialFunctionCategory| 'NILADIC T) 