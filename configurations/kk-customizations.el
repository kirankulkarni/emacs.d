;; My customizatoin file where I will load mode-specific customizations

;; Don't clutter up directories with files~
;; copied from Vedang
(setq backup-directory-alist `(("." . ,(expand-file-name
                                        (concat session-files-dir "backups"))))

      save-place-file (concat session-files-dir "places")
      bookmark-default-file (concat session-files-dir "bookmarks.bmk")
      auto-save-list-file-prefix
      (concat session-files-dir "auto-save-list/.auto-saves-")
      auto-save-file-name-transforms
      `((".*" ,(concat session-files-dir "auto-save-list/") t)))


;;; Move this hook to ibuffer-vc el-get config
(add-hook 'ibuffer-hook
    (lambda ()
      (ibuffer-vc-set-filter-groups-by-vc-root)
      (ibuffer-do-sort-by-alphabetic)))

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)


;; ido mode configuration
(require 'ido-mode-config)

;; util functions
(require 'util-functions)

;; lisp-mode configuration
(require 'lisp-mode-config)


;; org mode configuration
(require 'org-mode-config)



;; end of my customizations
(provide 'kk-customizations)
