(defvar paredit-major-modes
  '(emacs-lisp-mode lisp-mode lisp-interaction-mode clojure-mode cider-repl-mode
                    cider-mode scheme-mode inferior-emacs-lisp-mode js2-mode)
  "List of lispy modes that I use")

(defun turn-on-paredit ()
  (enable-paredit-mode)
  (show-paren-mode))

(dolist (m paredit-major-modes)
  (add-hook `,(intern (concat (symbol-name m) "-hook")) 'turn-on-paredit))

(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "C-o") 'paredit-open-round)
     ;; Unbind `M-s' because it's bound to some handy occur related
     ;; functions by default
     (define-key paredit-mode-map (kbd "M-s") nil)
     (define-key paredit-mode-map (kbd "M-D") 'paredit-splice-sexp)))

(provide 'init-paredit)
