

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete/ac-dict")
(ac-config-default)

;; From Vedang's configuration
;; start completion only after typing at least 4 characters
(setq ac-auto-start 4)
;; Show auto-complete menu 0.8 second later
(setq ac-auto-show-menu 0.8)
;; select candidates with C-n C-p
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
(setq ac-comphist-file (concat session-files-dir "ac-comphist.dat"))
;; End of configuration
(provide 'auto-complete-mode-config)
