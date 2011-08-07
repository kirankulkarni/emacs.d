;;; HTML mode configuration

;;; paredit configuration
(defun turn-on-html-paredit ()
  "Turns Paredit on and sets html-mode map"
  (paredit-mode t)
  (define-key html-mode-map "<" 'paredit-open-angled)
  (define-key html-mode-map ">" 'paredit-close-angled-and-newline)
  (define-key html-mode-map "{" 'paredit-open-curly)
  (define-key html-mode-map "}" 'paredit-close-curly-and-newline))

(add-hook 'html-mode-hook 'turn-on-html-paredit)

;; (eval-after-load 'html-mode
;;   '(progn (define-key html-mode-map "<" 'paredit-open-angled)
;;           (define-key html-mode-map ">" 'paredit-close-angled-and-newline)
;;           (define-key html-mode-map "{" 'paredit-open-curly)
;;           (define-key html-mode-map "}" 'paredit-close-curly-and-newline)))
;; (eval-after-load 'html-mode
;;   '(define-key html-mode-map "<" 'paredit-open-angled))
(provide 'html-mode-config)

