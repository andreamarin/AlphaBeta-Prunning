;; Los estados son de la forma ((0 . x) (1 . x) (2 . x) ... (31 . x))
;; Los nodos son de la forma (ID IDPAPA state move score depth). Score inicialmente es (-inf +inf). A mas baja profundidad se vuelve (H(state) H(state)).
;; Los nodos se cierran si hay ccontradicciones en score
;; 1 - Ficha Roja, 3 - Rey Rojo, 0 - Vacio, -1 - Ficha Negra, -3 - Rey Negro
;; Rojos primero
;; State inicial : 
;;(setq st '(( 0 .  1) ( 1 .  1) ( 2 .  1) ( 3 .  1) ( 4 .  1) ( 5 .  1) ( 6 .  1) ( 7 .  1) ( 8 .  1) ( 9 .  1) (10 .  1) (11 .  1) (12 .  0) (13 .  0) (14 .  0) (15 .  0) (16 .  0) (17 .  0) (18 .  0) (19 .  0) (20 . -1) (21 . -1) (22 . -1) (23 . -1) (24 . -1) (25 . -1) (26 . -1) (27 . -1) (28 . -1) (29 . -1) (30 . -1) (31 . -1) ))
;;                  ( 0 .  1) ( 1 .  1) ( 2 .  1) ( 3 .  1) 
;;                ( 4 .  1) ( 5 .  1) ( 6 .  1) ( 7 .  1)
;;                  ( 8 .  1) ( 9 .  1) (10 .  1) (11 .  1)
;;                (12 .  0) (13 .  0) (14 .  0) (15 .  0)
;;                  (16 .  0) (17 .  0) (18 .  0) (19 .  0)
;;                (20 . -1) (21 . -1) (22 . -1) (23 . -1)
;;                  (24 . -1) (25 . -1) (26 . -1) (27 . -1)
;;                (28 . -1) (29 . -1) (30 . -1) (31 . -1)

;;Diagonales: Primero crecientes, luego decrecientes
;;(setq diagonals '(((28) (20 24 29) (12 16 21 25 30) (4 8 13 17 2 26 31) (0 5 9 14 18 23 27) (1 6 10 15 19) (2 7 11) (3)) ((0 4) (1 5 8 12) (2 6 9 13 16 20) (3 7 10 14 17 21 24 28) (11 15 18 22 25 29) (19 23 26 30) (27 31)) ))

;;Trabaja con currentState como var global
(defun getRedMoves()
    
)

(defun findIn(n diags)
    (let ( (d (car diags)) (pos (position n (car diags))) )
        (cond
            ((Null pos)
                (findIn n (cdr diags))
            )
            (t
                (list (reverse (subseq d (max 0 (- pos 2)) pos)) (subseq d (incf pos) (min (length d) (+ pos 2))))
            )
        )
    )
)

(defun getAdj(n)
    (let ((d1 (findIn n (car diagonals))) (d2 (findIn n (cadr diagonals))))
        (list (car d1) (car d2) (cadr d1) (cadr d2))
    )
)

(defun checkSpace(n state)
    (cdr (nthcdr n state))
)


;; minimax con alpha-beta prunning, recibe la profundidad máxima como parámetro y crea el nodo inicial
;; Los valores de alpha y beta iniciales son -1000 y 1000 pues el score del tablero va de -? a ?
;; Cuando alpha es mayor que beta entonces se hace prunning, es decir, ya no se expande ese nodo.

;;variables globales para minimax-ab
(setq bestMove nil possibleMoves nil)

(defun minimax-ab (max-depth)
  (maxMove (list 0 -1 currentSate 0 '(-1000 1000) max-depth))
)

;; simula las decisiones del jugador (maximiza)
(defun maxMove (node)
 (cond 
   ((or (= (sixth node) 0) (win (third node))) (setf (car (fifth node)) (getScore (third node))))
   ((> (car (fifth node)) (second (fifth node))))
   (t (getMoves node)(loop for x in possibleMoves
			   do (setf (car (fifth x)) (car (fifth node)) (second (fifth x)) (second (fifth node))) (minMove x) (if (> (second (fifth x)) (car (fifth node))) (setf (car (fifth node)) (second (fifth x))))
		      )
    )
  )
)

;; simula decisiones del oponente (minimiza)
(defun minMove (node)
 (cond 
   ((or (= (sixth node) 0) (win (third node))) (setf (car (fifth node)) (getScore (third node))))
   ((> (car (fifth node)) (second (fifth node))))
   (t (getMoves node)(loop for x in possibleMoves
			   do (setf (car (fifth x)) (car (fifth node)) (second (fifth x)) (second (fifth node))) (maxMove x) (if (< (car (fifth x)) (second (fifth node))) (setf (second (fifth node)) (car (fifth x))))
			   )
    )
  )
)


;; crea una lista con todos los "hijos" del nodo dado
(defun getMoves(node)
  (setq possibleMoves nil i (car node) sates (getNextStates (third node)))
  (loop for x in states 
	do (push possibleMoves (list (incf i) (car node) (car x) (second x) '(0,0) (- (sixth node) 1)))
  )
)


