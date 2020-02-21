(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0
      company-require-match nil)

(eval-after-load 'company
  '(progn (setq-default company-lighter " cmp")
          (define-key company-active-map [tab] 'company-complete)
          (define-key company-active-map (kbd "TAB") 'company-complete)))

(provide 'init-company-mode)
