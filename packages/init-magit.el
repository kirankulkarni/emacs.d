(global-set-key (kbd "C-x g") 'magit-status)

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-added "green3")
     (set-face-foreground 'magit-diff-removed "red3")
     (when (not window-system)
       (set-face-background 'magit-item-highlight "black"))))

(provide 'init-magit)
