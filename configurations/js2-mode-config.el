(require 'js2-mode)

(defun turn-on-paredit ()
  (paredit-mode t))

(add-hook 'js2-mode-hook 'turn-on-paredit)

(defun fix-tab-width-for-js2-mode ()
  (setq-default tab-width 2)
  (setq js2-basic-offset 2))

(add-hook 'js2-mode-hook 'fix-tab-width-for-js2-mode)

(eval-after-load 'js2-mode
  '(progn (define-key js2-mode-map "{" 'paredit-open-curly)
          (define-key js2-mode-map "}" 'paredit-close-curly-and-newline)
          ;; fixes problem with pretty function font-lock
          (define-key js2-mode-map (kbd ",") 'self-insert-command)
          (font-lock-add-keywords
           'js2-mode `(("\\(function *\\)("
                        (0 (progn (compose-region (match-beginning 1)
                                                  (match-end 1) "ƒ")
                                  nil)))))))

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(provide 'js2-mode-config)
