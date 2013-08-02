(require 'auto-complete-config)

;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete/ac-dict")
(setq ac-comphist-file (concat session-files-dir "ac-comphist.dat"))
(ac-config-default)

;; From Vedang's configuration
;; start completion only after typing at least 4 characters
;; Show auto-complete menu 0.8 second later
(setq ac-auto-show-menu 0.8
      ac-use-menu-map t)

;;; If `complete', TAB first tries to indent the current line, and if the line
;;; was already indented, then try to complete the thing at point.
(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)


(dolist (mode '(magit-log-edit-mode
                org-mode
                text-mode
                objc-mode))
  (add-to-list 'ac-modes mode))


(ac-set-trigger-key "TAB")
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
(define-key ac-completing-map [tab] 'ac-complete)
;; End of configuration
(provide 'auto-complete-mode-config)
