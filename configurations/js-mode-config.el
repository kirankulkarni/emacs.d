(defun js-mode-changes ()
  (paredit-mode t)
  (setq js-indent-level 2)
  (define-key js-mode-map "{" 'paredit-open-curly)
  (define-key js-mode-map "}" 'paredit-close-curly-and-newline)
  ;; fixes problem with pretty function font-lock
  (define-key js-mode-map (kbd ",") 'self-insert-command)
  (font-lock-add-keywords
   'js-mode `(("\\(function *\\)("
                (0 (progn (compose-region (match-beginning 1)
                                          (match-end 1) "ƒ")
                          nil))))))

(add-hook 'js-mode-hook 'js-mode-changes)

(provide 'js-mode-config)
