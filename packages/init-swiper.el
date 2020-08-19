(ivy-mode t)
(setq ivy-use-virtual-buffers t
      ;; Display index and count both.
      ivy-count-format "(%d/%d) ")

(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-x B") 'ivy-switch-buffer-other-window)

(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "H-s") 'isearch-forward-regexp)

(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-'") 'counsel-imenu)
(global-set-key (kbd "C-c s") 'counsel-rg)
(global-set-key (kbd "C-x l") 'counsel-locate)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)


(provide 'init-swiper)
