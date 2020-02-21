(eval-after-load 'go-mode
  '(progn (define-key go-mode-map (kbd "M-.") 'godef-jump)))


(provide 'init-go-mode)
