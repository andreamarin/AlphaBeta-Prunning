;; los nodos son de la forma (ID IDPAPA state move score depth).
(setq bestMove nil)

(defun minimax (node)
  (maxMove node)
)

(defun maxMove (node)
  (cond
    ((= (sixth node) 0) (setq (fifth node) (getScore (third node))))
    (t (getMoves node)(setf (fifth node) (apply #'max  (mapcar #'fifth (mapcar #'minMove possibleMoves))) bestMove (find-if #'(lambda (x) (= (fifth node) (fifth x))) possbileMoves)))
  )
)

(defun minMove (node)
  (cond
    ((= (sixth node) 0) (setq (fifth node) (getScore (third node))))
    (t (getMoves node)(setf (fifth node) (apply #'min  (mapcar #'fifth (mapcar #'maxMove possibleMoves))) bestMove (find-if #'(lambda (x) (= (fifth node) (fifth x))) possbileMoves)))
  )
)


(defun getMoves(node)
  (setq possibleMoves nil i (car node) sates (getStates (third node)))
  (loop for x in states 
	do (push possibleMoves (list (incf i) (car node) (car x) (second x) 0 (- (sixth node) 1)))
  )
)
    




